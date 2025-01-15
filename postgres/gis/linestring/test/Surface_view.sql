CREATE OR REPLACE VIEW surface_view AS
WITH
segment_ref AS(
	SELECT 
		id, 
		part,
		member,
		sequence,
		interpretation,
		SUBSTRING(curve_ref::text FROM POSITION('.' IN curve_ref::text) + 1) AS uuid
    FROM public.polygon_segment 
	WHERE public.polygon_segment.interpretation = 4
),
segment_value AS(
	SELECT 
		SUBSTRING(airspace.geoborder.xml_id::text FROM POSITION('.' IN airspace.geoborder.xml_id::text) + 1) AS uuid,
		geom
	FROM airspace.geoborder
	INNER JOIN public.geoborder_timeslice
		ON airspace.geoborder.id = public.geoborder_timeslice.geoborder_id
	INNER JOIN airspace.geoborder_tsp
		ON public.geoborder_timeslice.geoborder_tsp_id = airspace.geoborder_tsp.id
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
		member,
		sequence,
		interpretation,
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
		member,
		sequence,
		interpretation,
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
		member,
		sequence,
		interpretation,
		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
    FROM 
        generate_series(0, 256) AS n, 	
        center
),
arc_line AS (
    SELECT 
        id,
		part,
		member,
		sequence,
		interpretation,
        ST_MakeLine(point_geom) AS geom
    FROM interpolated_points
    GROUP BY id, part, member, sequence, interpretation
),
segment_union AS (
    SELECT 
        id, 
		part,
		member,
		sequence,
		interpretation,
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
		member,
		sequence,
		interpretation,
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
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(geom, 0.00001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.00001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.00001)) as last_point
	FROM
		arc_line
	UNION ALL
	SELECT
		id,
		part,
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(geom, 0.00001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.00001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.00001)) as last_point
	FROM segment_ref
	INNER JOIN segment_value
	ON segment_ref.uuid = segment_value.uuid		
),
segement_ownership AS (
	SELECT 
        public.surface.xml_id,
		segment_union.part AS part,
		segment_union.member AS member,
		segment_union.sequence AS sequence,
		segment_union.interpretation AS interpretation,
		segment_union.geom AS geom,
		segment_union.first_point as first_point,
		segment_union.last_point as last_point
    FROM 
        public.surface
    INNER JOIN 
        public.surface_exterior 
        ON public.surface.id = public.surface_exterior.surfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.surface_exterior.exteriorlinestring_id = segment_union.id
	UNION ALL
	SELECT 
        public.surface.xml_id,
		segment_union.part AS part,
		segment_union.member AS member,
		segment_union.sequence AS sequence,
		segment_union.interpretation AS interpretation,
		segment_union.geom AS geom,
		segment_union.first_point AS first_point,
		segment_union.last_point AS last_point
    FROM 
        public.surface
    INNER JOIN 
        public.surface_interior 
        ON public.surface.id = public.surface_interior.surfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.surface_interior.interiorlinestring_id = segment_union.id
),
ordered_segments AS (
    SELECT 
        xml_id AS id, 
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point, 
        last_point,
		ST_IsClosed(segement_ownership.geom) AS closed
    FROM 
        segement_ownership
-- 	WHERE
-- 		xml_id = 'Ase_Proj_1560989'
    ORDER BY 
        xml_id, part, member, sequence
	
),
linked_segments AS (
    SELECT 
        id,
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point,
        last_point
    FROM 
        ordered_segments
    UNION ALL
    SELECT 
        curr.id,
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence, -- Adjust sequence for link
		curr.interpretation,
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
		AND
		curr.interpretation != 4
		AND
		next.interpretation != 4
    UNION ALL
    SELECT 
        curr.id,
        curr.part,
		curr.member + 0.5 AS member, -- Adjust sequence for link
        curr.sequence,
		curr.interpretation,
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
        AND curr.member + 1 = next.member
	WHERE 
		ST_IsClosed(curr.geom) = false
		AND
		curr.interpretation != 4
		AND
		next.interpretation != 4
    ORDER BY 
        id, part, member, sequence
	
),
partial_ring AS (
    SELECT 
        id, 
		part,
		ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
		ST_LineMerge(ST_Collect(geom)) AS geom
    FROM 
        linked_segments
    WHERE
		interpretation != 4
    GROUP BY 
        id, part
),
raw_geoborder AS (
    SELECT 
        id, 
		part,
		member,
		ST_LineMerge(ST_Collect(geom)) AS geom,
		(ST_DumpPoints(ST_LineMerge(ST_Collect(geom)))).geom AS points
    FROM 
        linked_segments
    WHERE 
		interpretation = 4
    GROUP BY 
        id, part, member
),
split_geoborder AS (
	SELECT
		raw_geoborder.id, 
		(ST_Dump(
		  ST_Split(
			raw_geoborder.geom,
			ST_Union(
				ST_ClosestPoint(ST_Collect(raw_geoborder.points), ST_StartPoint(partial_ring.geom)),
				ST_ClosestPoint(ST_Collect(raw_geoborder.points), ST_EndPoint(partial_ring.geom))
			)
		  )
		)).geom AS geom,
		ST_ShortestLine(ST_Collect(raw_geoborder.points), ST_StartPoint(partial_ring.geom)) AS  start_segment,
		ST_ShortestLine(ST_Collect(raw_geoborder.points), ST_EndPoint(partial_ring.geom)) AS end_segment
	FROM 
		raw_geoborder
	INNER JOIN
		partial_ring
	ON 
		raw_geoborder.id = partial_ring.id
	WHERE 
		raw_geoborder.part = partial_ring.part
	GROUP BY
		raw_geoborder.id, 
		raw_geoborder.geom,
		partial_ring.geom
),
exterior_ring AS (
	SELECT
		partial_ring.id,
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, split_geoborder.geom, end_segment, start_segment])) AS geom
	FROM
		split_geoborder
	INNER JOIN
		partial_ring	
	ON 
		split_geoborder.id = partial_ring.id
	WHERE
		ST_Touches(split_geoborder.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(split_geoborder.geom, split_geoborder.end_segment)
		AND 
		NOT ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	UNION ALL
		SELECT
		partial_ring.id,
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, end_segment, start_segment])) AS geom
	FROM
		split_geoborder
	INNER JOIN
		partial_ring	
	ON 
		split_geoborder.id = partial_ring.id
	WHERE
		ST_Touches(split_geoborder.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(split_geoborder.geom, split_geoborder.end_segment)
		AND 
		ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	GROUP BY 
		partial_ring.id, ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, end_segment, start_segment]))
	UNION ALL
	SELECT
		partial_ring.id,
		partial_ring.geom
	FROM
		partial_ring
	WHERE
		partial_ring.closed = true
	
)
SELECT 
    exterior_ring.id,
    ST_MakePolygon(
		exterior_ring.geom
-- 		COALESCE(interior_rings.geoms, ARRAY[]::geometry[])
	) AS geom
FROM 
    exterior_ring




