CREATE OR REPLACE VIEW elevated_surface_view AS
WITH
segment_ref AS(
	SELECT 
		id, 
		part,
		sequence,
		SUBSTRING(curve_ref::text FROM POSITION('.' IN curve_ref::text) + 1) AS uuid
    FROM public.polygon_segment 
	WHERE curve_ref IS NOT NULL
),
segment_value AS(
	SELECT 
		SUBSTRING(airspace.geoborder_t.xml_id::text FROM POSITION('.' IN airspace.geoborder_t.xml_id::text) + 1) AS uuid,
		geom
	FROM airspace.geoborder_t
	INNER JOIN public.geoborder_t_timeslice
		ON airspace.geoborder_t.id = public.geoborder_t_timeslice.geoborder_t_id
	INNER JOIN airspace.geoborder_tsp
		ON public.geoborder_t_timeslice.geoborder_tsp_id = airspace.geoborder_tsp.id
	INNER JOIN airspace.geoborder_ts
		ON airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
	INNER JOIN public.curve
		ON airspace.geoborder_ts.border_id = public.curve.id
	INNER JOIN public.curve_view
		ON public.curve.id = public.curve_view.id
),
center AS (
    SELECT 
		id, 
		part,
		sequence,
		point,
		radius,
		start_angle,
		end_angle,
		(end_angle - start_angle) / 256 AS step_size
    FROM public.polygon_segment 
	WHERE public.polygon_segment.interpretation = 2
	UNION ALL 
	SELECT 
		id, 
		part,
		sequence,
		point,
		radius,
		0 as start_angle,
		2*PI() as end_angle,
		(0 - 2*PI()) / 256 AS step_size
    FROM public.polygon_segment 
	WHERE public.polygon_segment.interpretation = 3
),
interpolated_points AS (
    SELECT 
        center.id,
		part,
		sequence,
		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
    FROM 
        generate_series(0, 256) AS n, 	
        center
),
arc_line AS (
    SELECT 
        id,
		part,
		sequence,
        ST_MakeLine(point_geom) AS geom
    FROM interpolated_points
    GROUP BY id, part, sequence
),
segment_union AS (
    SELECT 
        id, 
		part,
		sequence,
		ST_ReducePrecision(linestring, 0.00001) AS geom,
		ST_StartPoint(ST_ReducePrecision(linestring, 0.00001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(linestring, 0.00001)) as last_point
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 0
    UNION ALL 
    SELECT 
        id, 
		part,
		sequence,
        ST_Segmentize((ST_ReducePrecision(linestring, 0.00001)::geography), 10000)::geometry as geom,
		ST_StartPoint(ST_ReducePrecision(linestring, 0.00001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(linestring, 0.00001)) as last_point
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 1
	UNION ALL
	SELECT
		id, 
		part,
		sequence,
		ST_ReducePrecision(geom, 0.00001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.00001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.00001)) as last_point
	FROM
		arc_line
	UNION ALL
	SELECT
		id,
		part,
		sequence,
		ST_ReducePrecision(geom, 0.00001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.00001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.00001)) as last_point
	FROM segment_ref
	INNER JOIN segment_value
	ON segment_ref.uuid = segment_value.uuid		
),
segement_ownership AS (
	SELECT 
        public.elevated_surface.xml_id,
		segment_union.part as part,
		segment_union.sequence as sequence,
		segment_union.geom AS geom,
		segment_union.first_point as first_point,
		segment_union.last_point as last_point
    FROM 
        public.elevated_surface
    INNER JOIN 
        public.elevatedsurface_exterior 
        ON public.elevated_surface.id = public.elevatedsurface_exterior.elevatedsurfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.elevatedsurface_exterior.exteriorlinestring_id = segment_union.id
	UNION ALL
	SELECT 
        public.elevated_surface.xml_id,
		segment_union.part as part,
		segment_union.sequence as sequence,
		segment_union.geom AS geom,
		segment_union.first_point as first_point,
		segment_union.last_point as last_point
    FROM 
        public.elevated_surface
    INNER JOIN 
        public.elevatedsurface_interior 
        ON public.elevated_surface.id = public.elevatedsurface_interior.elevatedsurfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.elevatedsurface_interior.interiorlinestring_id = segment_union.id
	
),
ordered_segments AS (
    SELECT 
        xml_id AS id, 
        part,
        sequence,
        geom AS geom,
        first_point, 
        last_point,
		ST_IsClosed(segement_ownership.geom) AS closed
    FROM 
        segement_ownership
    ORDER BY 
        xml_id, part, sequence
),
linked_segments AS (
    SELECT 
        id,
        part,
        sequence,
        geom,
        first_point,
        last_point
    FROM 
        ordered_segments
    UNION ALL
    SELECT 
        curr.id,
        curr.part,
        curr.sequence + 0.5 AS sequence, -- Adjust sequence for link
        ST_MakeLine(curr.last_point, next.first_point) AS geom, -- Linking segment
        curr.last_point AS first_point,
        next.first_point AS last_point
    FROM 
        ordered_segments curr
    JOIN 
        ordered_segments next
    ON 
        curr.id = next.id
        AND curr.part = next.part
        AND curr.sequence + 1 = next.sequence
	WHERE 
		ST_IsClosed(curr.geom) = false
	
),
exterior_ring AS (
    SELECT 
        id, 
		ST_LineMerge(ST_Collect(geom)) AS geom
    FROM 
        linked_segments
    WHERE 
        part = 0
    GROUP BY 
        id
),
interior_rings AS (
    SELECT 
        id, 
        ST_LineMerge(ST_Collect(geom)) AS geom
    FROM 
        ordered_segments
    WHERE 
        part != 0
    GROUP BY 
        id
)
-- interior_rings AS (
--     SELECT 
--         id,
--         ARRAY_AGG(geom) AS geoms
--     FROM 
--         unioned_interior_rings
--     GROUP BY 
--         id
-- )
SELECT 
    exterior_ring.id,
	exterior_ring.geom as geom
--     ST_MakePolygon(
-- 		exterior_ring.geom,
-- 		COALESCE(interior_rings.geoms, ARRAY[]::geometry[])
-- 	) AS geom
FROM 
    exterior_ring
LEFT JOIN 
    interior_rings
ON 
    exterior_ring.id = interior_rings.id
WHERE 
    ST_IsClosed(exterior_ring.geom) = false 
    AND ST_GeometryType(exterior_ring.geom) != 'ST_LineString';
