CREATE MATERIALIZED VIEW geometry.point_view AS
SELECT
    id, 
	point as geom,
	jsonb_build_object(
		'xml_id', xml_id,
		'horizontalaccuracy', horizontalaccuracy,
		'horizontalaccuracy_uom', horizontalaccuracy_uom,
		'horizontalaccuracy_nilreason', horizontalaccuracy_nilreason,
		'nilreason', nilreason
	) AS point
FROM point_pt;

CREATE MATERIALIZED VIEW geometry.elevated_point_view AS
SELECT 
    id, 
    point as geom,
	jsonb_build_object(
		'xml_id', xml_id,
		'elevation', elevation,
		'elevation_uom', elevation_uom,
		'eleveation_nilreason', eleveation_nilreason,
		'geoidundulation', geoidundulation,
		'geoidundulation_uom', geoidundulation_uom,
		'geoidundulation_nilreason', geoidundulation_nilreason,
		'horizontalaccuracy', horizontalaccuracy,
		'horizontalaccuracy_uom', horizontalaccuracy_uom,
		'horizontalaccuracy_nilreason', horizontalaccuracy_nilreason,
		'verticalaccuracy', verticalaccuracy,
		'verticalaccuracy_uom', verticalaccuracy_uom,
		'verticalaccuracy_nilreason', verticalaccuracy_nilreason,
		'verticaldatum', verticaldatum,
		'verticaldatum_nilreason', verticaldatum_nilreason,
		'nilreason', nilreason
	) AS point
FROM elevated_point_pt;


CREATE MATERIALIZED VIEW geometry.curve_view AS
WITH 
center AS (
    SELECT 
		id, 
		point,
		radius,
		start_angle,
		end_angle,
		(end_angle - start_angle) / 100 AS step_size
    FROM public.linestring_segment 
	WHERE public.linestring_segment.interpretation = 2
	UNION ALL 
	SELECT 
		id, 
		point,
		radius,
		0 as start_angle,
		2*PI() as end_angle,
		(0 - 2*PI()) / 100 AS step_size
    FROM public.linestring_segment 
	WHERE public.linestring_segment.interpretation = 3
),
interpolated_points AS (
    SELECT 
        center.id,
		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
    FROM 
        generate_series(0, 100) AS n, 	
        center
),
arc_line AS (
    SELECT 
        interpolated_points.id,
        ST_MakeLine(point_geom) AS arc_geom
    FROM interpolated_points
    GROUP BY id
),
segment_union AS (
    SELECT 
		id, 
		ST_ReducePrecision(linestring,0.000000000000001) AS geom
    FROM
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 0
    UNION ALL 
    SELECT 
		id, 
		ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 1000)::geometry AS geom
    FROM 
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 1
    UNION ALL 
    SELECT 
		id, 
		ST_ReducePrecision(arc_geom, 0.000000000000001) AS geom
    FROM 
		arc_line
),
merged_segments AS (
    SELECT 
        public.curve_pt.id,
		 public.curve_pt.xml_id,
        ST_LineMerge(ST_Collect(segment_union.geom)) AS merged_geom,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        public.curve_pt
    INNER JOIN 
        public.curve_pt_linestring_segment ON public.curve_pt.id = public.curve_pt_linestring_segment.curvepropertytype_id
    INNER JOIN 
        segment_union ON public.curve_pt_linestring_segment.segments_id = segment_union.id
    GROUP BY public.curve_pt.id
)
SELECT 
    merged_segments.id, 
	merged_geom as geom,
	jsonb_build_object(
		'xml_id', merged_segments.xml_id,
		'horizontalaccuracy', merged_segments.horizontalaccuracy,
		'horizontalaccuracy_uom', merged_segments.horizontalaccuracy_uom,
		'horizontalaccuracy_nilreason', merged_segments.horizontalaccuracy_nilreason,
		'nilreason', merged_segments.nilreason
	) AS curve
FROM merged_segments;


CREATE MATERIALIZED VIEW geometry.elevated_curve_view AS
WITH 
center AS (
    SELECT 
		id, 
		point,
		radius,
		start_angle,
		end_angle,
		(end_angle - start_angle) / 100 AS step_size
    FROM public.linestring_segment 
	WHERE public.linestring_segment.interpretation = 2
	UNION ALL 
	SELECT 
		id, 
		point,
		radius,
		0 as start_angle,
		2*PI() as end_angle,
		(0 - 2*PI()) / 100 AS step_size
    FROM public.linestring_segment 
	WHERE public.linestring_segment.interpretation = 3
),
interpolated_points AS (
    SELECT 
        center.id,
		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
    FROM 
        generate_series(0, 100) AS n, 	
        center
),
arc_line AS (
    SELECT 
        id,
        ST_MakeLine(point_geom) AS arc_geom
    FROM interpolated_points
    GROUP BY id
),
segment_union AS (
    SELECT 
		id, 
		ST_ReducePrecision(linestring,0.000000000000001) AS geom
    FROM
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 0
    UNION ALL 
    SELECT 
		id, 
		ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 1000)::geometry AS geom
    FROM 
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 1
    UNION ALL 
    SELECT 
		id, 
		ST_ReducePrecision(arc_geom, 0.000000000000001) AS geom
    FROM 
		arc_line
),
merged_segments AS (
    SELECT 
        public.elevated_curve_pt.id,
		public.elevated_curve_pt.xml_id,
        ST_LineMerge(ST_Collect(segment_union.geom)) AS merged_geom,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        public.elevated_curve_pt
    INNER JOIN 
        public.elevated_curve_pt_linestring_segment ON public.elevated_curve_pt.id = public.elevated_curve_pt_linestring_segment.elevatedcurvepropertytype_id
    INNER JOIN 
        segment_union ON public.elevated_curve_pt_linestring_segment.segments_id = segment_union.id
    GROUP BY public.elevated_curve_pt.id
)
SELECT 
    merged_segments.id,
	merged_geom as geom,
	jsonb_build_object(
		'xml_id', merged_segments.xml_id,
		'elevation', merged_segments.elevation,
		'elevation_uom', merged_segments.elevation_uom,
		'eleveation_nilreason', merged_segments.eleveation_nilreason,
		'geoidundulation', merged_segments.geoidundulation,
		'geoidundulation_uom', merged_segments.geoidundulation_uom,
		'geoidundulation_nilreason', merged_segments.geoidundulation_nilreason,
		'horizontalaccuracy', merged_segments.horizontalaccuracy,
		'horizontalaccuracy_uom', merged_segments.horizontalaccuracy_uom,
		'horizontalaccuracy_nilreason', merged_segments.horizontalaccuracy_nilreason,
		'verticalaccuracy', merged_segments.verticalaccuracy,
		'verticalaccuracy_uom', merged_segments.verticalaccuracy_uom,
		'verticalaccuracy_nilreason', merged_segments.verticalaccuracy_nilreason,
		'verticaldatum', merged_segments.verticaldatum,
		'verticaldatum_nilreason', merged_segments.verticaldatum_nilreason,
		'nilreason', merged_segments.nilreason
	) AS curve
FROM merged_segments;

CREATE MATERIALIZED VIEW partial_surface_view AS
WITH  
segment_ref AS(
	SELECT 
		id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		SUBSTRING(
	        curve_ref 
	        FROM '([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$'
	    ) AS uuid
    FROM public.polygon_segment 
	WHERE public.polygon_segment.interpretation = 4
),
segment_value AS(
	SELECT 
		airspace.geoborder.identifier AS uuid,
		geom
	FROM airspace.geoborder
	INNER JOIN public.geoborder_timeslice
		ON airspace.geoborder.id = public.geoborder_timeslice.geoborder_id
	INNER JOIN airspace.geoborder_tsp
		ON public.geoborder_timeslice.geoborder_tsp_id = airspace.geoborder_tsp.id
	INNER JOIN airspace.geoborder_ts
		ON airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
	INNER JOIN public.curve_pt
		ON airspace.geoborder_ts.border_id = public.curve_pt.id
	INNER JOIN geometry.curve_view
		ON public.curve_pt.id = geometry.curve_view.id
),
center AS (
    SELECT 
		id, 
		curve_xml_id,
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
		curve_xml_id,
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
		curve_xml_id,
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
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
        ST_MakeLine(point_geom) AS geom
    FROM interpolated_points
    GROUP BY 
		id, 
		curve_xml_id,
		part, 
		member, 
		sequence, 
		interpretation
),
segment_union AS (
    SELECT 
        id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(linestring, 0.000000000000001) AS geom,
		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 0
    UNION ALL 
    SELECT 
        id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
        ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 10000)::geometry as geom,
		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 1
	UNION ALL
	SELECT
		id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
	FROM
		arc_line
	UNION ALL
	SELECT
		id,
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
	FROM segment_ref
	INNER JOIN segment_value
	ON segment_ref.uuid = segment_value.uuid		
),
segement_ownership AS (
	SELECT 
		public.surface_pt.id,
        public.surface_pt.xml_id,
		segment_union.curve_xml_id,
		segment_union.part AS part,
		segment_union.member AS member,
		segment_union.sequence AS sequence,
		segment_union.interpretation AS interpretation,
		segment_union.geom AS geom,
		segment_union.first_point as first_point,
		segment_union.last_point as last_point,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        public.surface_pt
    INNER JOIN 
        public.surface_exterior 
        ON public.surface_pt.id = public.surface_exterior.surfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.surface_exterior.exteriorlinestring_id = segment_union.id
	UNION ALL
	SELECT 
		public.surface_pt.id,
        public.surface_pt.xml_id,
		segment_union.curve_xml_id,
		segment_union.part AS part,
		segment_union.member AS member,
		segment_union.sequence AS sequence,
		segment_union.interpretation AS interpretation,
		segment_union.geom AS geom,
		segment_union.first_point AS first_point,
		segment_union.last_point AS last_point,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        public.surface_pt
    INNER JOIN 
        public.surface_interior 
        ON public.surface_pt.id = public.surface_interior.surfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.surface_interior.interiorlinestring_id = segment_union.id
),
ordered_segments AS (
    SELECT 
		id,
        xml_id, 
		curve_xml_id,
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point, 
        last_point,
		ST_IsClosed(segement_ownership.geom) AS closed,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        segement_ownership
    ORDER BY 
        xml_id, 
		part, 
		member, 
		sequence
),
connecting_segments AS (
    SELECT 
        id,
		xml_id,
		curve_xml_id,
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point,
        last_point,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        ordered_segments
    UNION ALL
    SELECT 
        curr.id,
		curr.xml_id,
		Null AS curve_xml_id,
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence,
		1,
        ST_MakeLine(curr.last_point, next.first_point) AS geom,
        curr.last_point AS first_point,
        next.first_point AS last_point,
		curr.horizontalaccuracy,
		curr.horizontalaccuracy_uom,
		curr.horizontalaccuracy_nilreason,
		curr.nilreason
    FROM 
        ordered_segments curr
    JOIN 
        ordered_segments next
    ON 
        curr.xml_id = next.xml_id
        AND curr.part = next.part
        AND curr.sequence + 1 = next.sequence
		AND curr.member = next.member
	WHERE 
		ST_IsClosed(curr.geom) = false
		AND
		curr.interpretation != 4
		AND
		next.interpretation != 4
    UNION ALL
    SELECT 
        curr.id,
		curr.xml_id,
		Null AS curve_xml_id,
        curr.part,
		curr.member + 0.5 AS member,
        curr.sequence,
		1,
        ST_MakeLine(curr.last_point, next.first_point) AS geom,
        curr.last_point AS first_point,
        next.first_point AS last_point,
		curr.horizontalaccuracy,
		curr.horizontalaccuracy_uom,
		curr.horizontalaccuracy_nilreason,
		curr.nilreason
    FROM 
        ordered_segments curr
    JOIN 
        ordered_segments next
    ON 
        curr.xml_id = next.xml_id
        AND curr.part = next.part
        AND curr.member + 1 = next.member
	WHERE 
		ST_IsClosed(curr.geom) = false
		AND
		curr.interpretation != 4
		AND
		next.interpretation != 4
    ORDER BY 
        xml_id, 
        part, 
        member,
        sequence
),
clustered_segments AS (
    SELECT 
        id, 
        xml_id,
		curve_xml_id,
        part,
        member,
        geom,
		interpretation,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
        nilreason,
        ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part)  AS cluster_id
    FROM 
        connecting_segments
    WHERE 
        interpretation != 4
	UNION ALL
    SELECT 
        id, 
		xml_id,
		curve_xml_id,
        part,
        member,
        geom,
		interpretation,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
        nilreason,
        Null AS cluster_id
    FROM 
        connecting_segments
    WHERE 
        interpretation = 4
	ORDER BY
		xml_id,
		part, 
		member
),
partial_ring AS (
    SELECT 
        id, 
        xml_id,
		ARRAY_AGG(curve_xml_id) as curve_xml_id,
        part,
        MIN(member) AS member,
		MIN(interpretation) AS interpretation,
        ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
        ST_GeometryType(ST_LineMerge(ST_Collect(geom))) AS type, 
        ST_LineMerge(ST_Collect(geom)) AS geom,
        NULL::geometry AS points,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
        nilreason
    FROM 
        clustered_segments
	WHERE 
		interpretation != 4
    GROUP BY 
		id,
        xml_id, 
        part, 
        cluster_id,
        horizontalaccuracy, 
        horizontalaccuracy_uom, 
        horizontalaccuracy_nilreason,	
        nilreason
	UNION ALL
    SELECT 
        id, 
        xml_id,
		ARRAY[curve_xml_id] AS curve_xml_id,
        part,
        member,
		interpretation,
        ST_IsClosed(geom) AS closed,
        ST_GeometryType(geom) AS type, 
		geom AS geom,
		ST_Points(geom) AS points,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
        nilreason
    FROM 
        clustered_segments
	WHERE 
		interpretation = 4
	ORDER BY 
        xml_id, 
		part, 
		member
),
output AS (
    SELECT 
        pr.id, 
        pr.xml_id,
		pr.curve_xml_id,
        pr.part,
		ROW_NUMBER() OVER (PARTITION BY xml_id, part ORDER BY id) - 1 AS increment,
		COUNT(*) OVER (PARTITION BY xml_id, part ) AS total_count,
		pr.interpretation,
		pr.points,
        COALESCE(dumped.geom, pr.geom) AS geom,
        pr.horizontalaccuracy,
        pr.horizontalaccuracy_uom,
        pr.horizontalaccuracy_nilreason,
        pr.nilreason
    FROM 
        partial_ring pr
    LEFT JOIN LATERAL (
        SELECT (ST_Dump(pr.geom)).geom
        WHERE ST_GeometryType(pr.geom) = 'ST_MultiLineString'
    ) dumped ON true
	ORDER BY
		xml_id, 
		part, 
		member
)
SELECT 
	ST_GeometryType(geom),
	output.id, 
	to_jsonb(output.xml_id) AS xml_id,
	to_jsonb(output.curve_xml_id) AS curve_xml_id,
	output.part,
	output.increment,
	output.total_count,
	output.interpretation,
	output.geom,
	output.points,
	output.horizontalaccuracy,
	output.horizontalaccuracy_uom,
	output.horizontalaccuracy_nilreason,
	output.nilreason
FROM
	output;

-- R1 : Simple feature, closed
-- R2 : Simple feature, unclosed
-- G1 : Complex feature wiht a single geoborder, 
-- G2 : Complex feature with multiple geoborder,
CREATE MATERIALIZED VIEW geometry.surface_view AS
WITH 
g1_segment AS (
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		(ST_Dump(
		  ST_Split(
			geoborder.geom,
			ST_Union(
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)),
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(ring.geom))
			)
		  )
		)).geom AS geom,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)) AS  start_segment,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(ring.geom)) AS end_segment,
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	FROM 
		partial_surface_view geoborder
	JOIN
		partial_surface_view ring
	ON 
        ring.xml_id = geoborder.xml_id
		AND
		ring.part = geoborder.part
		AND 
		ring.increment <> geoborder.increment
	WHERE 
		geoborder.total_count = 2
		AND
		geoborder.interpretation = 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.geom, 
		geoborder.increment,
		geoborder.interpretation,
		geoborder.geom, 
		ring.geom,
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	UNION ALL
	SELECT
		partial_surface_view.id, 
		partial_surface_view.xml_id,
		partial_surface_view.curve_xml_id,
		partial_surface_view.part,
		partial_surface_view.increment,
		partial_surface_view.interpretation,
		partial_surface_view.geom,
		Null::geometry AS start_segment,
		Null::geometry AS end_segment,
		partial_surface_view.horizontalaccuracy, 
		partial_surface_view.horizontalaccuracy_uom, 
		partial_surface_view.horizontalaccuracy_nilreason, 
		partial_surface_view.nilreason
	FROM 
		partial_surface_view
	WHERE 
		partial_surface_view.total_count = 2 
		AND
		partial_surface_view.interpretation != 4
	ORDER BY
		id, 
		xml_id, 
		part,
		increment
),
g2_segment AS (
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		geoborder.geom AS geom,
		Null::geometry AS  start_segment,
		Null::geometry AS end_segment,
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	FROM 
		partial_surface_view geoborder
	JOIN
		partial_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation = 4
		AND 
		after.interpretation = 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	UNION ALL
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		(ST_Dump(
		  ST_Split(
			geoborder.geom,
			ST_Union(
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom)),
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
			)
		  )
		)).geom AS geom,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	FROM 
		partial_surface_view geoborder
	JOIN
		partial_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation != 4
		AND 
		after.interpretation != 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	UNION ALL
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		(ST_Dump(
		  ST_Split(
			geoborder.geom, ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom))
			)
		  )
		).geom AS geom,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
		Null::geometry AS end_segment,
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	FROM 
		partial_surface_view geoborder
	JOIN
		partial_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation != 4
		AND 
		after.interpretation = 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	UNION ALL
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		(ST_Dump(
		  ST_Split(
			geoborder.geom,	ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
			)
		  )
		).geom AS geom,
		Null::geometry AS  start_segment,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	FROM 
		partial_surface_view geoborder
	JOIN
		partial_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation = 4
		AND 
		after.interpretation != 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.horizontalaccuracy, 
		geoborder.horizontalaccuracy_uom, 
		geoborder.horizontalaccuracy_nilreason, 
		geoborder.nilreason
	UNION ALL
	SELECT
		partial_surface_view.id, 
		partial_surface_view.xml_id,
		partial_surface_view.curve_xml_id,
		partial_surface_view.part,
		partial_surface_view.increment,
		partial_surface_view.interpretation,
		partial_surface_view.total_count,
		partial_surface_view.geom,
		Null::geometry AS start_segment,
		Null::geometry AS end_segment,
		partial_surface_view.horizontalaccuracy, 
		partial_surface_view.horizontalaccuracy_uom, 
		partial_surface_view.horizontalaccuracy_nilreason, 
		partial_surface_view.nilreason
	FROM 
		partial_surface_view
	WHERE 
		partial_surface_view.total_count > 2 
		AND
		partial_surface_view.interpretation != 4
	ORDER BY
		id, 
		xml_id, 
		part,
		increment
),
g2_segment_filtered AS (
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		curr.geom AS geom,
		curr.horizontalaccuracy, 
		curr.horizontalaccuracy_uom, 
		curr.horizontalaccuracy_nilreason, 
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, before.geom) 
		AND 
		ST_Intersects(curr.geom, after.geom)
		AND 
		before.interpretation = 4
		AND 
		after.interpretation = 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.start_segment])) AS geom,
		curr.horizontalaccuracy, 
		curr.horizontalaccuracy_uom, 
		curr.horizontalaccuracy_nilreason, 
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, curr.start_segment)  
		AND 
		ST_Intersects(curr.geom, after.geom)
		AND 
		before.interpretation != 4
		AND 
		after.interpretation = 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment])) AS geom,
		curr.horizontalaccuracy, 
		curr.horizontalaccuracy_uom, 
		curr.horizontalaccuracy_nilreason, 
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, before.geom) 
		AND 
		ST_Intersects(curr.geom, curr.end_segment)
		AND 
		before.interpretation = 4
		AND 
		after.interpretation != 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment, curr.start_segment])) AS geom,
		curr.horizontalaccuracy, 
		curr.horizontalaccuracy_uom, 
		curr.horizontalaccuracy_nilreason, 
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
	g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, curr.start_segment) 
		AND 
		ST_Intersects(curr.geom, curr.end_segment)
		AND 
		before.interpretation != 4
		AND 
		after.interpretation != 4
	UNION ALL
	SELECT
		g2_segment.id, 
		g2_segment.xml_id,
		g2_segment.curve_xml_id,
		g2_segment.part,
		g2_segment.increment,
		g2_segment.geom,
		g2_segment.horizontalaccuracy, 
		g2_segment.horizontalaccuracy_uom, 
		g2_segment.horizontalaccuracy_nilreason, 
		g2_segment.nilreason
	FROM 
		g2_segment
	WHERE 
		g2_segment.interpretation != 4
	ORDER BY
		id, 
		xml_id, 
		part,
		increment
),
r1 AS (
	SELECT
		partial_surface_view.id,
		partial_surface_view.xml_id,
		partial_surface_view.curve_xml_id,
		partial_surface_view.part,
		partial_surface_view.geom,
		partial_surface_view.horizontalaccuracy,
		partial_surface_view.horizontalaccuracy_uom,
		partial_surface_view.horizontalaccuracy_nilreason,
		partial_surface_view.nilreason
	FROM
		partial_surface_view
	WHERE
		ST_IsClosed(partial_surface_view.geom) = true
		AND 
		partial_surface_view.total_count = 1
		AND 
		ST_NPoints(geom) >= 4
),
r2 AS (
	SELECT
		partial_surface_view.id,
		partial_surface_view.xml_id,
		partial_surface_view.curve_xml_id,
		partial_surface_view.part,
		ST_AddPoint(partial_surface_view.geom, ST_StartPoint(partial_surface_view.geom)) AS geom,
		partial_surface_view.horizontalaccuracy,
		partial_surface_view.horizontalaccuracy_uom,
		partial_surface_view.horizontalaccuracy_nilreason,
		partial_surface_view.nilreason
	FROM
		partial_surface_view
	WHERE
		ST_IsClosed(partial_surface_view.geom) = false
		AND 
		partial_surface_view.total_count = 1
		AND 
		ST_NPoints(ST_AddPoint(partial_surface_view.geom, ST_StartPoint(partial_surface_view.geom))) >= 4		
),
g1 AS (
	SELECT 
		ring.id,
		ring.xml_id || geoborder.xml_id AS xml_id,
		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
		ring.part,
		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
		ring.horizontalaccuracy,
		ring.horizontalaccuracy_uom,
		ring.horizontalaccuracy_nilreason,
		ring.nilreason
	FROM
	g1_segment ring
	JOIN
	g1_segment geoborder
	ON 
		ring.xml_id = geoborder.xml_id
		AND
		geoborder.part = geoborder.part
		AND 
		ring.increment <> geoborder.increment
	WHERE
		ST_Intersects(geoborder.geom, geoborder.start_segment) 
		AND 
		ST_Intersects(geoborder.geom, geoborder.end_segment)
		AND 
		NOT ST_Intersects(geoborder.start_segment, geoborder.end_segment)
		AND
		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
	UNION ALL
	SELECT DISTINCT 
		ring.id,
		ring.xml_id || geoborder.xml_id AS xml_id,
		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
		ring.part,
		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
		ring.horizontalaccuracy,
		ring.horizontalaccuracy_uom,
		ring.horizontalaccuracy_nilreason,
		ring.nilreason
	FROM
	g1_segment ring
	JOIN
	g1_segment geoborder
	ON 
		ring.xml_id = geoborder.xml_id
		AND
		geoborder.part = geoborder.part
		AND 
		ring.increment <> geoborder.increment
	WHERE
		ST_Intersects(geoborder.geom, geoborder.start_segment) 
		AND 
		ST_Intersects(geoborder.geom, geoborder.end_segment)
		AND 
		ST_Intersects(geoborder.start_segment, geoborder.end_segment)
		AND
		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
),
g2 AS (	
	SELECT 
		MIN(g2_segment_filtered.id) AS id,
		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
		MIN(g2_segment_filtered.part) AS part,
		ST_LineMerge(ST_Collect(g2_segment_filtered.geom)) AS geom,
		MIN(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
		MIN(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
		MIN(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
		MIN(g2_segment_filtered.nilreason) AS nilreason
	FROM
		g2_segment_filtered
	GROUP BY
		g2_segment_filtered.id,
		g2_segment_filtered.xml_id,
		g2_segment_filtered.part
	HAVING
		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = true
		AND
		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
		AND 
		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
	UNION ALL
	SELECT 
		MIN(g2_segment_filtered.id) AS id,
		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
		MIN(g2_segment_filtered.part) AS part,
		ST_AddPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)), ST_StartPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)))) AS geom,
		MIN(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
		MIN(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
		MIN(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
		MIN(g2_segment_filtered.nilreason) AS nilreason
	FROM
		g2_segment_filtered
	GROUP BY
		g2_segment_filtered.id,
		g2_segment_filtered.xml_id,
		g2_segment_filtered.part
	HAVING
		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = false
		AND
		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
		AND 
		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
),
combined_data AS (
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
		geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
		nilreason,
        part
    FROM 
        r1
    UNION ALL
    SELECT 
        id, 
        xml_id,
		curve_xml_id,
        geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
		nilreason,
        part
    FROM 
        r2
    UNION ALL
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
		nilreason,
        part
    FROM 
        g1
    UNION ALL
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
		nilreason,
        part
    FROM 
        g2
),
outer_shells AS (
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        ST_MakePolygon(geom) AS geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
		nilreason
    FROM 
        combined_data
    WHERE 
        part = 0
),
inner_shells AS (
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
		nilreason
    FROM 
        combined_data
    WHERE 
        part <> 0
)
SELECT 
    outer_shells.id,
    ST_MakePolygon(
        ST_ExteriorRing(outer_shells.geom),
        ARRAY(
            SELECT ST_ExteriorRing(inner_shells.geom)
            FROM inner_shells 
            WHERE inner_shells.id = outer_shells.id
        )
    ) AS geom,
	jsonb_build_object(
		'xml_id', outer_shells.xml_id,
		'curve_xml_id', outer_shells.curve_xml_id,
		'horizontalaccuracy', outer_shells.horizontalaccuracy,
		'horizontalaccuracy_uom', outer_shells.horizontalaccuracy_uom,
		'horizontalaccuracy_nilreason', outer_shells.horizontalaccuracy_nilreason,
		'nilreason', outer_shells.nilreason
	) AS surface
FROM 
outer_shells;

CREATE MATERIALIZED VIEW partial_elevated_surface_view AS
WITH  
segment_ref AS(
	SELECT 
		id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		SUBSTRING(
	        curve_ref 
	        FROM '([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$'
	    ) AS uuid
    FROM public.polygon_segment 
	WHERE public.polygon_segment.interpretation = 4
),
segment_value AS(
	SELECT 
		airspace.geoborder.identifier AS uuid,
		geom
	FROM airspace.geoborder
	INNER JOIN public.geoborder_timeslice
		ON airspace.geoborder.id = public.geoborder_timeslice.geoborder_id
	INNER JOIN airspace.geoborder_tsp
		ON public.geoborder_timeslice.geoborder_tsp_id = airspace.geoborder_tsp.id
	INNER JOIN airspace.geoborder_ts
		ON airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
	INNER JOIN public.curve_pt
		ON airspace.geoborder_ts.border_id = public.curve_pt.id
	INNER JOIN geometry.curve_view
		ON public.curve_pt.id = geometry.curve_view.id
),
center AS (
    SELECT 
		id, 
		curve_xml_id,
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
		curve_xml_id,
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
		curve_xml_id,
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
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
        ST_MakeLine(point_geom) AS geom
    FROM interpolated_points
    GROUP BY 
		id, 
		curve_xml_id,
		part, 
		member, 
		sequence, 
		interpretation
),
segment_union AS (
    SELECT 
        id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(linestring, 0.000000000000001) AS geom,
		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 0
    UNION ALL 
    SELECT 
        id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
        ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 10000)::geometry as geom,
		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 1
	UNION ALL
	SELECT
		id, 
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
	FROM
		arc_line
	UNION ALL
	SELECT
		id,
		curve_xml_id,
		part,
		member,
		sequence,
		interpretation,
		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
	FROM segment_ref
	INNER JOIN segment_value
	ON segment_ref.uuid = segment_value.uuid		
),
segement_ownership AS (
	SELECT 
		public.elevated_surface_pt.id,
        public.elevated_surface_pt.xml_id,
		segment_union.curve_xml_id,
		segment_union.part AS part,
		segment_union.member AS member,
		segment_union.sequence AS sequence,
		segment_union.interpretation AS interpretation,
		segment_union.geom AS geom,
		segment_union.first_point as first_point,
		segment_union.last_point as last_point,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        public.elevated_surface_pt
    INNER JOIN 
        public.elevatedsurface_exterior 
        ON public.elevated_surface_pt.id = public.elevatedsurface_exterior.elevatedsurfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.elevatedsurface_exterior.exteriorlinestring_id = segment_union.id
	UNION ALL
	SELECT 
		public.elevated_surface_pt.id,
        public.elevated_surface_pt.xml_id,
		segment_union.curve_xml_id,
		segment_union.part AS part,
		segment_union.member AS member,
		segment_union.sequence AS sequence,
		segment_union.interpretation AS interpretation,
		segment_union.geom AS geom,
		segment_union.first_point AS first_point,
		segment_union.last_point AS last_point,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        public.elevated_surface_pt
    INNER JOIN 
        public.elevatedsurface_interior 
        ON public.elevated_surface_pt.id = public.elevatedsurface_interior.elevatedsurfacepropertytype_id
    INNER JOIN 
        segment_union 
        ON public.elevatedsurface_interior.interiorlinestring_id = segment_union.id
),
ordered_segments AS (
    SELECT 
		id,
        xml_id, 
		curve_xml_id,
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point, 
        last_point,
		ST_IsClosed(segement_ownership.geom) AS closed,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        segement_ownership
    ORDER BY 
        xml_id, 
		part, 
		member, 
		sequence
),
connecting_segments AS (
    SELECT 
        id,
		xml_id,
		curve_xml_id,
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point,
        last_point,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        ordered_segments
    UNION ALL
    SELECT 
        curr.id,
		curr.xml_id,
		Null AS curve_xml_id,
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence,
		1,
        ST_MakeLine(curr.last_point, next.first_point) AS geom,
        curr.last_point AS first_point,
        next.first_point AS last_point,
		NULL AS elevation,
		NULL AS elevation_uom,
		NULL AS eleveation_nilreason,
		NULL AS geoidundulation,
		NULL AS geoidundulation_uom,
		NULL AS geoidundulation_nilreason,
		NULL AS horizontalaccuracy,
		NULL AS horizontalaccuracy_uom,
		NULL AS horizontalaccuracy_nilreason,
		NULL AS verticalaccuracy,
		NULL AS verticalaccuracy_uom,
		NULL AS verticalaccuracy_nilreason,
		NULL AS verticaldatum,
		NULL AS verticaldatum_nilreason,
		NULL AS nilreason
    FROM 
        ordered_segments curr
    JOIN 
        ordered_segments next
    ON 
        curr.xml_id = next.xml_id
        AND curr.part = next.part
        AND curr.sequence + 1 = next.sequence
		AND curr.member = next.member
	WHERE 
		ST_IsClosed(curr.geom) = false
		AND
		curr.interpretation != 4
		AND
		next.interpretation != 4
    UNION ALL
    SELECT 
        curr.id,
		curr.xml_id,
		Null AS curve_xml_id,
        curr.part,
		curr.member + 0.5 AS member,
        curr.sequence,
		1,
        ST_MakeLine(curr.last_point, next.first_point) AS geom,
        curr.last_point AS first_point,
        next.first_point AS last_point,
		NULL AS elevation,
		NULL AS elevation_uom,
		NULL AS eleveation_nilreason,
		NULL AS geoidundulation,
		NULL AS geoidundulation_uom,
		NULL AS geoidundulation_nilreason,
		NULL AS horizontalaccuracy,
		NULL AS horizontalaccuracy_uom,
		NULL AS horizontalaccuracy_nilreason,
		NULL AS verticalaccuracy,
		NULL AS verticalaccuracy_uom,
		NULL AS verticalaccuracy_nilreason,
		NULL AS verticaldatum,
		NULL AS verticaldatum_nilreason,
		NULL AS nilreason
    FROM 
        ordered_segments curr
    JOIN 
        ordered_segments next
    ON 
        curr.xml_id = next.xml_id
        AND curr.part = next.part
        AND curr.member + 1 = next.member
	WHERE 
		ST_IsClosed(curr.geom) = false
		AND
		curr.interpretation != 4
		AND
		next.interpretation != 4
    ORDER BY 
        xml_id, 
        part, 
        member,
        sequence
),
clustered_segments AS (
    SELECT 
        id, 
        xml_id,
		curve_xml_id,
        part,
        member,
		interpretation,
        geom,
		ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part)  AS cluster_id,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        connecting_segments
    WHERE 
        interpretation != 4
	UNION ALL
    SELECT 
        id, 
		xml_id,
		curve_xml_id,
        part,
        member,
		interpretation,
        geom,
		Null AS cluster_id,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        connecting_segments
    WHERE 
        interpretation = 4
	ORDER BY
		xml_id,
		part, 
		member
),
partial_ring AS (
    SELECT 
        id, 
        xml_id,
		ARRAY_AGG(curve_xml_id) as curve_xml_id,
        part,
        MIN(member) AS member,
		MIN(interpretation) AS interpretation,
        ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
        ST_GeometryType(ST_LineMerge(ST_Collect(geom))) AS type, 
        ST_LineMerge(ST_Collect(geom)) AS geom,
        NULL::geometry AS points,
		MAX(elevation) AS elevation,
		MAX(elevation_uom) AS elevation_uom,
		MAX(eleveation_nilreason) AS eleveation_nilreason,
		MAX(geoidundulation) AS geoidundulation,
		MAX(geoidundulation_uom) AS geoidundulation_uom,
		MAX(geoidundulation_nilreason) AS geoidundulation_nilreason,
		MAX(horizontalaccuracy) AS horizontalaccuracy,
		MAX(horizontalaccuracy_uom) AS horizontalaccuracy_uom,
		MAX(horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
		MAX(verticalaccuracy) AS verticalaccuracy,
		MAX(verticalaccuracy_uom) AS verticalaccuracy_uom,
		MAX(verticalaccuracy_nilreason) AS verticalaccuracy_nilreason,
		MAX(verticaldatum) AS verticaldatum,
		MAX(verticaldatum_nilreason) AS verticaldatum_nilreason,
		MAX(nilreason) AS nilreason
    FROM 
        clustered_segments
	WHERE 
		interpretation != 4
    GROUP BY 
		id,
        xml_id, 
        part, 
        cluster_id,
        horizontalaccuracy, 
        horizontalaccuracy_uom, 
        horizontalaccuracy_nilreason,	
        nilreason
	UNION ALL
    SELECT 
        id, 
        xml_id,
		ARRAY[curve_xml_id] AS curve_xml_id,
        part,
        member,
		interpretation,
        ST_IsClosed(geom) AS closed,
        ST_GeometryType(geom) AS type, 
		geom AS geom,
		ST_Points(geom) AS points,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        clustered_segments
	WHERE 
		interpretation = 4
	ORDER BY 
        xml_id, 
		part, 
		member
),
output AS (
    SELECT 
        pr.id, 
        pr.xml_id,
		pr.curve_xml_id,
        pr.part,
		ROW_NUMBER() OVER (PARTITION BY xml_id, part ORDER BY id) - 1 AS increment,
		COUNT(*) OVER (PARTITION BY xml_id, part ) AS total_count,
		pr.interpretation,
		pr.points,
        COALESCE(dumped.geom, pr.geom) AS geom,
		pr.elevation,
		pr.elevation_uom,
		pr.eleveation_nilreason,
		pr.geoidundulation,
		pr.geoidundulation_uom,
		pr.geoidundulation_nilreason,
		pr.horizontalaccuracy,
		pr.horizontalaccuracy_uom,
		pr.horizontalaccuracy_nilreason,
		pr.verticalaccuracy,
		pr.verticalaccuracy_uom,
		pr.verticalaccuracy_nilreason,
		pr.verticaldatum,
		pr.verticaldatum_nilreason,
		pr.nilreason
    FROM 
        partial_ring pr
    LEFT JOIN LATERAL (
        SELECT (ST_Dump(pr.geom)).geom
        WHERE ST_GeometryType(pr.geom) = 'ST_MultiLineString'
    ) dumped ON true
	ORDER BY
		xml_id, 
		part, 
		member
)
SELECT 
	ST_GeometryType(geom),
	output.id, 
	to_jsonb(output.xml_id) AS xml_id,
	to_jsonb(output.curve_xml_id) AS curve_xml_id,
	output.part,
	output.increment,
	output.total_count,
	output.interpretation,
	output.geom,
	output.points,
	output.elevation,
	output.elevation_uom,
	output.eleveation_nilreason,
	output.geoidundulation,
	output.geoidundulation_uom,
	output.geoidundulation_nilreason,
	output.horizontalaccuracy,
	output.horizontalaccuracy_uom,
	output.horizontalaccuracy_nilreason,
	output.verticalaccuracy,
	output.verticalaccuracy_uom,
	output.verticalaccuracy_nilreason,
	output.verticaldatum,
	output.verticaldatum_nilreason,
	output.nilreason
FROM
output;

-- R1 : Simple feature, closed
-- R2 : Simple feature, unclosed
-- G1 : Complex feature wiht a single geoborder, 
-- G2 : Complex feature with multiple geoborder,
CREATE MATERIALIZED VIEW geometry.elevated_surface_view AS
WITH 
g1_segment AS (
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		(ST_Dump(
		  ST_Split(
			geoborder.geom,
			ST_Union(
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)),
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(ring.geom))
			)
		  )
		)).geom AS geom,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)) AS  start_segment,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(ring.geom)) AS end_segment,
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	FROM 
		partial_elevated_surface_view geoborder
	JOIN
		partial_elevated_surface_view ring
	ON 
        ring.xml_id = geoborder.xml_id
		AND
		ring.part = geoborder.part
		AND 
		ring.increment <> geoborder.increment
	WHERE 
		geoborder.total_count = 2
		AND
		geoborder.interpretation = 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.geom, 
		geoborder.increment,
		geoborder.interpretation,
		geoborder.geom, 
		ring.geom,
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	UNION ALL
	SELECT
		partial_elevated_surface_view.id, 
		partial_elevated_surface_view.xml_id,
		partial_elevated_surface_view.curve_xml_id,
		partial_elevated_surface_view.part,
		partial_elevated_surface_view.increment,
		partial_elevated_surface_view.interpretation,
		partial_elevated_surface_view.geom,
		Null::geometry AS start_segment,
		Null::geometry AS end_segment,
		partial_elevated_surface_view.elevation,
		partial_elevated_surface_view.elevation_uom,
		partial_elevated_surface_view.eleveation_nilreason,
		partial_elevated_surface_view.geoidundulation,
		partial_elevated_surface_view.geoidundulation_uom,
		partial_elevated_surface_view.geoidundulation_nilreason,
		partial_elevated_surface_view.horizontalaccuracy,
		partial_elevated_surface_view.horizontalaccuracy_uom,
		partial_elevated_surface_view.horizontalaccuracy_nilreason,
		partial_elevated_surface_view.verticalaccuracy,
		partial_elevated_surface_view.verticalaccuracy_uom,
		partial_elevated_surface_view.verticalaccuracy_nilreason,
		partial_elevated_surface_view.verticaldatum,
		partial_elevated_surface_view.verticaldatum_nilreason,
		partial_elevated_surface_view.nilreason
	FROM 
		partial_elevated_surface_view
	WHERE 
		partial_elevated_surface_view.total_count = 2 
		AND
		partial_elevated_surface_view.interpretation != 4
	ORDER BY
		id, 
		xml_id, 
		part,
		increment
),
g2_segment AS (
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		geoborder.geom AS geom,
		Null::geometry AS  start_segment,
		Null::geometry AS end_segment,
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	FROM 
		partial_elevated_surface_view geoborder
	JOIN
		partial_elevated_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevated_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation = 4
		AND 
		after.interpretation = 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	UNION ALL
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		(ST_Dump(
		  ST_Split(
			geoborder.geom,
			ST_Union(
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom)),
				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
			)
		  )
		)).geom AS geom,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	FROM 
		partial_elevated_surface_view geoborder
	JOIN
		partial_elevated_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevated_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation != 4
		AND 
		after.interpretation != 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	UNION ALL
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		(ST_Dump(
		  ST_Split(
			geoborder.geom, ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom))
			)
		  )
		).geom AS geom,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
		Null::geometry AS end_segment,
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	FROM 
		partial_elevated_surface_view geoborder
	JOIN
		partial_elevated_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevated_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation != 4
		AND 
		after.interpretation = 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id, 
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	UNION ALL
	SELECT
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		(ST_Dump(
		  ST_Split(
			geoborder.geom,	ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
			)
		  )
		).geom AS geom,
		Null::geometry AS  start_segment,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	FROM 
		partial_elevated_surface_view geoborder
	JOIN
		partial_elevated_surface_view before
	ON 
        before.xml_id = geoborder.xml_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevated_surface_view after
	ON 
        after.xml_id = geoborder.xml_id
		AND
		after.part = geoborder.part
	    AND (
	        after.increment = geoborder.increment + 1
	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
	    )
	WHERE 
		geoborder.total_count > 2 
		AND
		geoborder.interpretation = 4
		AND 
		before.interpretation = 4
		AND 
		after.interpretation != 4
	GROUP BY
		geoborder.id, 
		geoborder.xml_id,
		geoborder.curve_xml_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom, 
		geoborder.elevation,
		geoborder.elevation_uom,
		geoborder.eleveation_nilreason,
		geoborder.geoidundulation,
		geoborder.geoidundulation_uom,
		geoborder.geoidundulation_nilreason,
		geoborder.horizontalaccuracy,
		geoborder.horizontalaccuracy_uom,
		geoborder.horizontalaccuracy_nilreason,
		geoborder.verticalaccuracy,
		geoborder.verticalaccuracy_uom,
		geoborder.verticalaccuracy_nilreason,
		geoborder.verticaldatum,
		geoborder.verticaldatum_nilreason,
		geoborder.nilreason
	UNION ALL
	SELECT
		partial_elevated_surface_view.id, 
		partial_elevated_surface_view.xml_id,
		partial_elevated_surface_view.curve_xml_id,
		partial_elevated_surface_view.part,
		partial_elevated_surface_view.increment,
		partial_elevated_surface_view.interpretation,
		partial_elevated_surface_view.total_count,
		partial_elevated_surface_view.geom,
		Null::geometry AS start_segment,
		Null::geometry AS end_segment,
		partial_elevated_surface_view.elevation,
		partial_elevated_surface_view.elevation_uom,
		partial_elevated_surface_view.eleveation_nilreason,
		partial_elevated_surface_view.geoidundulation,
		partial_elevated_surface_view.geoidundulation_uom,
		partial_elevated_surface_view.geoidundulation_nilreason,
		partial_elevated_surface_view.horizontalaccuracy,
		partial_elevated_surface_view.horizontalaccuracy_uom,
		partial_elevated_surface_view.horizontalaccuracy_nilreason,
		partial_elevated_surface_view.verticalaccuracy,
		partial_elevated_surface_view.verticalaccuracy_uom,
		partial_elevated_surface_view.verticalaccuracy_nilreason,
		partial_elevated_surface_view.verticaldatum,
		partial_elevated_surface_view.verticaldatum_nilreason,
		partial_elevated_surface_view.nilreason
	FROM 
		partial_elevated_surface_view
	WHERE 
		partial_elevated_surface_view.total_count > 2 
		AND
		partial_elevated_surface_view.interpretation != 4
	ORDER BY
		id, 
		xml_id, 
		part,
		increment
),
g2_segment_filtered AS (
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		curr.geom AS geom,
		curr.elevation,
		curr.elevation_uom,
		curr.eleveation_nilreason,
		curr.geoidundulation,
		curr.geoidundulation_uom,
		curr.geoidundulation_nilreason,
		curr.horizontalaccuracy,
		curr.horizontalaccuracy_uom,
		curr.horizontalaccuracy_nilreason,
		curr.verticalaccuracy,
		curr.verticalaccuracy_uom,
		curr.verticalaccuracy_nilreason,
		curr.verticaldatum,
		curr.verticaldatum_nilreason,
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, before.geom) 
		AND 
		ST_Intersects(curr.geom, after.geom)
		AND 
		before.interpretation = 4
		AND 
		after.interpretation = 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.start_segment])) AS geom,
		curr.elevation,
		curr.elevation_uom,
		curr.eleveation_nilreason,
		curr.geoidundulation,
		curr.geoidundulation_uom,
		curr.geoidundulation_nilreason,
		curr.horizontalaccuracy,
		curr.horizontalaccuracy_uom,
		curr.horizontalaccuracy_nilreason,
		curr.verticalaccuracy,
		curr.verticalaccuracy_uom,
		curr.verticalaccuracy_nilreason,
		curr.verticaldatum,
		curr.verticaldatum_nilreason,
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, curr.start_segment)  
		AND 
		ST_Intersects(curr.geom, after.geom)
		AND 
		before.interpretation != 4
		AND 
		after.interpretation = 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment])) AS geom,
		curr.elevation,
		curr.elevation_uom,
		curr.eleveation_nilreason,
		curr.geoidundulation,
		curr.geoidundulation_uom,
		curr.geoidundulation_nilreason,
		curr.horizontalaccuracy,
		curr.horizontalaccuracy_uom,
		curr.horizontalaccuracy_nilreason,
		curr.verticalaccuracy,
		curr.verticalaccuracy_uom,
		curr.verticalaccuracy_nilreason,
		curr.verticaldatum,
		curr.verticaldatum_nilreason,
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, before.geom) 
		AND 
		ST_Intersects(curr.geom, curr.end_segment)
		AND 
		before.interpretation = 4
		AND 
		after.interpretation != 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
		curr.curve_xml_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment, curr.start_segment])) AS geom,
		curr.elevation,
		curr.elevation_uom,
		curr.eleveation_nilreason,
		curr.geoidundulation,
		curr.geoidundulation_uom,
		curr.geoidundulation_nilreason,
		curr.horizontalaccuracy,
		curr.horizontalaccuracy_uom,
		curr.horizontalaccuracy_nilreason,
		curr.verticalaccuracy,
		curr.verticalaccuracy_uom,
		curr.verticalaccuracy_nilreason,
		curr.verticaldatum,
		curr.verticaldatum_nilreason,
		curr.nilreason
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.xml_id = curr.xml_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
	g2_segment after
	ON 
        after.xml_id = curr.xml_id
		AND
		after.part = curr.part
	    AND (
	        after.increment = curr.increment + 1
	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
	    )
	WHERE 
		curr.interpretation = 4
		AND
		ST_Intersects(curr.geom, curr.start_segment) 
		AND 
		ST_Intersects(curr.geom, curr.end_segment)
		AND 
		before.interpretation != 4
		AND 
		after.interpretation != 4
	UNION ALL
	SELECT
		g2_segment.id, 
		g2_segment.xml_id,
		g2_segment.curve_xml_id,
		g2_segment.part,
		g2_segment.increment,
		g2_segment.geom,
		g2_segment.elevation,
		g2_segment.elevation_uom,
		g2_segment.eleveation_nilreason,
		g2_segment.geoidundulation,
		g2_segment.geoidundulation_uom,
		g2_segment.geoidundulation_nilreason,
		g2_segment.horizontalaccuracy,
		g2_segment.horizontalaccuracy_uom,
		g2_segment.horizontalaccuracy_nilreason,
		g2_segment.verticalaccuracy,
		g2_segment.verticalaccuracy_uom,
		g2_segment.verticalaccuracy_nilreason,
		g2_segment.verticaldatum,
		g2_segment.verticaldatum_nilreason,
		g2_segment.nilreason
	FROM 
		g2_segment
	WHERE 
		g2_segment.interpretation != 4
	ORDER BY
		id, 
		xml_id, 
		part,
		increment
),
r1 AS (
	SELECT
		partial_elevated_surface_view.id,
		partial_elevated_surface_view.xml_id,
		partial_elevated_surface_view.curve_xml_id,
		partial_elevated_surface_view.part,
		partial_elevated_surface_view.geom,
		partial_elevated_surface_view.elevation,
		partial_elevated_surface_view.elevation_uom,
		partial_elevated_surface_view.eleveation_nilreason,
		partial_elevated_surface_view.geoidundulation,
		partial_elevated_surface_view.geoidundulation_uom,
		partial_elevated_surface_view.geoidundulation_nilreason,
		partial_elevated_surface_view.horizontalaccuracy,
		partial_elevated_surface_view.horizontalaccuracy_uom,
		partial_elevated_surface_view.horizontalaccuracy_nilreason,
		partial_elevated_surface_view.verticalaccuracy,
		partial_elevated_surface_view.verticalaccuracy_uom,
		partial_elevated_surface_view.verticalaccuracy_nilreason,
		partial_elevated_surface_view.verticaldatum,
		partial_elevated_surface_view.verticaldatum_nilreason,
		partial_elevated_surface_view.nilreason
	FROM
		partial_elevated_surface_view
	WHERE
		ST_IsClosed(partial_elevated_surface_view.geom) = true
		AND 
		partial_elevated_surface_view.total_count = 1
		AND 
		ST_NPoints(geom) >= 4
),
r2 AS (
	SELECT
		partial_elevated_surface_view.id,
		partial_elevated_surface_view.xml_id,
		partial_elevated_surface_view.curve_xml_id,
		partial_elevated_surface_view.part,
		ST_AddPoint(partial_elevated_surface_view.geom, ST_StartPoint(partial_elevated_surface_view.geom)) AS geom,
		partial_elevated_surface_view.elevation,
		partial_elevated_surface_view.elevation_uom,
		partial_elevated_surface_view.eleveation_nilreason,
		partial_elevated_surface_view.geoidundulation,
		partial_elevated_surface_view.geoidundulation_uom,
		partial_elevated_surface_view.geoidundulation_nilreason,
		partial_elevated_surface_view.horizontalaccuracy,
		partial_elevated_surface_view.horizontalaccuracy_uom,
		partial_elevated_surface_view.horizontalaccuracy_nilreason,
		partial_elevated_surface_view.verticalaccuracy,
		partial_elevated_surface_view.verticalaccuracy_uom,
		partial_elevated_surface_view.verticalaccuracy_nilreason,
		partial_elevated_surface_view.verticaldatum,
		partial_elevated_surface_view.verticaldatum_nilreason,
		partial_elevated_surface_view.nilreason
	FROM
		partial_elevated_surface_view
	WHERE
		ST_IsClosed(partial_elevated_surface_view.geom) = false
		AND 
		partial_elevated_surface_view.total_count = 1
		AND 
		ST_NPoints(ST_AddPoint(partial_elevated_surface_view.geom, ST_StartPoint(partial_elevated_surface_view.geom))) >= 4		
),
g1 AS (
	SELECT 
		ring.id,
		ring.xml_id || geoborder.xml_id AS xml_id,
		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
		ring.part,
		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
		ring.elevation,
		ring.elevation_uom,
		ring.eleveation_nilreason,
		ring.geoidundulation,
		ring.geoidundulation_uom,
		ring.geoidundulation_nilreason,
		ring.horizontalaccuracy,
		ring.horizontalaccuracy_uom,
		ring.horizontalaccuracy_nilreason,
		ring.verticalaccuracy,
		ring.verticalaccuracy_uom,
		ring.verticalaccuracy_nilreason,
		ring.verticaldatum,
		ring.verticaldatum_nilreason,
		ring.nilreason
	FROM
	g1_segment ring
	JOIN
	g1_segment geoborder
	ON 
		ring.xml_id = geoborder.xml_id
		AND
		geoborder.part = geoborder.part
		AND 
		ring.increment <> geoborder.increment
	WHERE
		ST_Intersects(geoborder.geom, geoborder.start_segment) 
		AND 
		ST_Intersects(geoborder.geom, geoborder.end_segment)
		AND 
		NOT ST_Intersects(geoborder.start_segment, geoborder.end_segment)
		AND
		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
	UNION ALL
	SELECT DISTINCT 
		ring.id,
		ring.xml_id || geoborder.xml_id AS xml_id,
		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
		ring.part,
		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
		ring.elevation,
		ring.elevation_uom,
		ring.eleveation_nilreason,
		ring.geoidundulation,
		ring.geoidundulation_uom,
		ring.geoidundulation_nilreason,
		ring.horizontalaccuracy,
		ring.horizontalaccuracy_uom,
		ring.horizontalaccuracy_nilreason,
		ring.verticalaccuracy,
		ring.verticalaccuracy_uom,
		ring.verticalaccuracy_nilreason,
		ring.verticaldatum,
		ring.verticaldatum_nilreason,
		ring.nilreason
	FROM
	g1_segment ring
	JOIN
	g1_segment geoborder
	ON 
		ring.xml_id = geoborder.xml_id
		AND
		geoborder.part = geoborder.part
		AND 
		ring.increment <> geoborder.increment
	WHERE
		ST_Intersects(geoborder.geom, geoborder.start_segment) 
		AND 
		ST_Intersects(geoborder.geom, geoborder.end_segment)
		AND 
		ST_Intersects(geoborder.start_segment, geoborder.end_segment)
		AND
		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
),
g2 AS (	
	SELECT 
		MIN(g2_segment_filtered.id) AS id,
		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
		MIN(g2_segment_filtered.part) AS part,
		ST_LineMerge(ST_Collect(g2_segment_filtered.geom)) AS geom,
		MAX(g2_segment_filtered.elevation) AS elevation,
		MAX(g2_segment_filtered.elevation_uom) AS elevation_uom,
		MAX(g2_segment_filtered.eleveation_nilreason) AS eleveation_nilreason,
		MAX(g2_segment_filtered.geoidundulation) AS geoidundulation,
		MAX(g2_segment_filtered.geoidundulation_uom) AS geoidundulation_uom,
		MAX(g2_segment_filtered.geoidundulation_nilreason) AS geoidundulation_nilreason,
		MAX(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
		MAX(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
		MAX(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
		MAX(g2_segment_filtered.verticalaccuracy) AS verticalaccuracy,
		MAX(g2_segment_filtered.verticalaccuracy_uom) AS verticalaccuracy_uom,
		MAX(g2_segment_filtered.verticalaccuracy_nilreason) AS verticalaccuracy_nilreason,
		MAX(g2_segment_filtered.verticaldatum) AS verticaldatum,
		MAX(g2_segment_filtered.verticaldatum_nilreason) AS verticaldatum_nilreason,
		MAX(g2_segment_filtered.nilreason) AS nilreason
	FROM
		g2_segment_filtered
	GROUP BY
		g2_segment_filtered.id,
		g2_segment_filtered.xml_id,
		g2_segment_filtered.part
	HAVING
		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = true
		AND
		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
		AND 
		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
	UNION ALL
	SELECT 
		MIN(g2_segment_filtered.id) AS id,
		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
		MIN(g2_segment_filtered.part) AS part,
		ST_AddPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)), ST_StartPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)))) AS geom,
		MAX(g2_segment_filtered.elevation) AS elevation,
		MAX(g2_segment_filtered.elevation_uom) AS elevation_uom,
		MAX(g2_segment_filtered.eleveation_nilreason) AS eleveation_nilreason,
		MAX(g2_segment_filtered.geoidundulation) AS geoidundulation,
		MAX(g2_segment_filtered.geoidundulation_uom) AS geoidundulation_uom,
		MAX(g2_segment_filtered.geoidundulation_nilreason) AS geoidundulation_nilreason,
		MAX(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
		MAX(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
		MAX(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
		MAX(g2_segment_filtered.verticalaccuracy) AS verticalaccuracy,
		MAX(g2_segment_filtered.verticalaccuracy_uom) AS verticalaccuracy_uom,
		MAX(g2_segment_filtered.verticalaccuracy_nilreason) AS verticalaccuracy_nilreason,
		MAX(g2_segment_filtered.verticaldatum) AS verticaldatum,
		MAX(g2_segment_filtered.verticaldatum_nilreason) AS verticaldatum_nilreason,
		MAX(g2_segment_filtered.nilreason) AS nilreason
	FROM
		g2_segment_filtered
	GROUP BY
		g2_segment_filtered.id,
		g2_segment_filtered.xml_id,
		g2_segment_filtered.part
	HAVING
		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = false
		AND
		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
		AND 
		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
),
combined_data AS (
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
		geom,
		part,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        r1
    UNION ALL
    SELECT 
        id, 
        xml_id,
		curve_xml_id,
        geom,
        part,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        r2
    UNION ALL
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        geom,
        part,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        g1
    UNION ALL
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        geom,
        part,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        g2
),
outer_shells AS (
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        ST_MakePolygon(geom) AS geom,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        combined_data
    WHERE 
        part = 0
),
inner_shells AS (
    SELECT 
        id, 
        xml_id, 
		curve_xml_id,
        geom,
		elevation,
		elevation_uom,
		eleveation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        combined_data
    WHERE 
        part <> 0
)
SELECT 
    outer_shells.id, 
    ST_MakePolygon(
        ST_ExteriorRing(outer_shells.geom),
        ARRAY(
            SELECT ST_ExteriorRing(inner_shells.geom)
            FROM inner_shells 
            WHERE inner_shells.id = outer_shells.id
        )
    ) AS geom,
	jsonb_build_object(
		'xml_id', outer_shells.xml_id,
		'curve_xml_id', outer_shells.curve_xml_id,
		'elevation', outer_shells.elevation,
		'elevation_uom', outer_shells.elevation_uom,
		'eleveation_nilreason', outer_shells.eleveation_nilreason,
		'geoidundulation', outer_shells.geoidundulation,
		'geoidundulation_uom', outer_shells.geoidundulation_uom,
		'geoidundulation_nilreason', outer_shells.geoidundulation_nilreason,
		'horizontalaccuracy', outer_shells.horizontalaccuracy,
		'horizontalaccuracy_uom', outer_shells.horizontalaccuracy_uom,
		'horizontalaccuracy_nilreason', outer_shells.horizontalaccuracy_nilreason,
		'verticalaccuracy', outer_shells.verticalaccuracy,
		'verticalaccuracy_uom', outer_shells.verticalaccuracy_uom,
		'verticalaccuracy_nilreason', outer_shells.verticalaccuracy_nilreason,
		'verticaldatum', outer_shells.verticaldatum,
		'verticaldatum_nilreason', outer_shells.verticaldatum_nilreason,
		'nilreason', outer_shells.nilreason
	) AS surface
FROM 
outer_shells;