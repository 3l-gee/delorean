CREATE OR REPLACE VIEW elevated_surface_view AS
WITH
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
        linestring AS geom
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 0
    UNION ALL 
    SELECT 
        id, 
		part,
		sequence,
		ST_MakeLine(ARRAY[
            ST_PointN(linestring, 1), 
            ST_Segmentize((linestring::geography), 10000)::geometry, 
            ST_PointN(linestring, -1)
        ]) AS geom
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 1
	UNION ALL
	SELECT
		id, 
		part,
		sequence,
		geom
	FROM
		arc_line
),
segement_ownership AS (
	SELECT 
        public.elevated_surface.xml_id,
		segment_union.part as part,
		segment_union.sequence as sequence,
		segment_union.geom AS geom
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
		segment_union.geom AS geom
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
        ST_ReducePrecision(geom,0.000000001) AS geom
    FROM 
        segement_ownership
    ORDER BY 
        xml_id, part, sequence
),
exterior_ring AS (
    SELECT 
        id, 
        ST_LineMerge(ST_Union(geom)) AS geom
    FROM 
        ordered_segments
    WHERE 
        part = 0
    GROUP BY 
        id
),
unioned_interior_rings AS (
    SELECT 
        id, 
        ST_Union(geom) AS geom
    FROM 
        ordered_segments
    WHERE 
        part != 0
    GROUP BY 
        id
),
interior_rings AS (
    SELECT 
        id,
        ARRAY_AGG(ST_LineMerge(geom)) AS geoms
    FROM 
        unioned_interior_rings
    GROUP BY 
        id
)
SELECT 
    exterior_ring.id,
    ST_MakePolygon(
		exterior_ring.geom, 
		COALESCE(interior_rings.geoms, ARRAY[]::geometry[])
	) AS geom
FROM 
    exterior_ring
LEFT JOIN 
    interior_rings
ON 
    exterior_ring.id = interior_rings.id;