-- []
-- Snowflake SQL : CurvePropertyType 

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
	COALESCE(merged_segments.horizontalaccuracy || ' ' || merged_segments.horizontalaccuracy_uom, '(' || merged_segments.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM merged_segments;

CREATE INDEX ON geometry.curve_view (id);
-- []
create or replace view routes.directflight_view as
select
    routes.directflight_pt.id,
    routes.directflight_pt.nilreason AS directflight_annotation
from routes.directflight_pt 
inner join routes.directflight on routes.directflight_pt.directflight_id = routes.directflight.id
group by
    routes.directflight_pt.id,
    routes.directflight_pt.nilreason;
-- []
-- Snowflake SQL : ElevatedCurvePropertyType 

CREATE MATERIALIZED VIEW geometry.elevatedcurve_view AS
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
        ST_LineMerge(ST_Collect(segment_union.geom)) AS merged_geom,
		elevation,
		elevation_uom,
		elevation_nilreason,
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
	COALESCE(merged_segments.elevation || ' ' || merged_segments.elevation_uom, '(' || merged_segments.elevation_nilreason || ')') AS elevation,
	COALESCE(merged_segments.geoidundulation || ' ' || merged_segments.geoidundulation_uom, '(' || merged_segments.geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(merged_segments.verticaldatum || ' ' || merged_segments.geoidundulation_uom, '(' || merged_segments.geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(CAST(merged_segments.verticalaccuracy AS varchar), '(' || merged_segments.verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(merged_segments.horizontalaccuracy || ' ' || merged_segments.horizontalaccuracy_uom, '(' || merged_segments.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM merged_segments;

CREATE INDEX ON geometry.elevatedcurve_view (id);
-- []
-- Snowflake SQL : ElevatedPointPropertyType

CREATE MATERIALIZED VIEW geometry.elevatedpoint_view AS
SELECT 
    id, 
    point as geom,
	COALESCE(elevation || ' ' || elevation_uom, '(' || elevation_nilreason || ')') AS elevation,
	COALESCE(geoidundulation || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(verticaldatum || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(verticalaccuracy || ' ' || horizontalaccuracy_uom, '(' || verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM elevated_point_pt;

CREATE INDEX ON geometry.elevatedpoint_view (id);
-- []
-- Snowflake SQL : ElevatedSurfacePropertyType

CREATE MATERIALIZED VIEW partial_elevatedsurface_view AS
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		NULL AS elevation_nilreason,
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
		NULL AS elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		MAX(elevation_nilreason) AS elevation_nilreason,
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
		elevation_nilreason,
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
		pr.elevation_nilreason,
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
	output.elevation_nilreason,
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
CREATE MATERIALIZED VIEW geometry.elevatedsurface_view AS
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		partial_elevated_surface_view.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		geoborder.elevation_nilreason,
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
		partial_elevated_surface_view.elevation_nilreason,
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
		curr.elevation_nilreason,
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
		curr.elevation_nilreason,
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
		curr.elevation_nilreason,
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
		curr.elevation_nilreason,
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
		g2_segment.elevation_nilreason,
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
		partial_elevated_surface_view.elevation_nilreason,
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
		partial_elevated_surface_view.elevation_nilreason,
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
		ring.elevation_nilreason,
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
		ring.elevation_nilreason,
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
		MAX(g2_segment_filtered.elevation_nilreason) AS elevation_nilreason,
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
		MAX(g2_segment_filtered.elevation_nilreason) AS elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
		elevation_nilreason,
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
	COALESCE(outer_shells.elevation || ' ' || outer_shells.elevation_uom, '(' || outer_shells.elevation_nilreason || ')') AS elevation,
	COALESCE(outer_shells.geoidundulation || ' ' || outer_shells.geoidundulation_uom, '(' || outer_shells.geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(outer_shells.verticaldatum || ' ' || outer_shells.outer_shells.geoidundulation_uom, '(' || outer_shells.geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(CAST(outer_shells.verticalaccuracy AS varchar), '(' || outer_shells.verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(outer_shells.horizontalaccuracy || ' ' || outer_shells.horizontalaccuracy_uom, '(' || outer_shells.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM 
outer_shells;

CREATE INDEX ON geometry.elevatedsurface_view (id);
-- []
-- Snowflake SQL : LinguisticNotePropertyType 

CREATE INDEX ON notes.linguisticnote_pt (linguisticnote_id);
CREATE INDEX ON notes.linguisticnote (id);

CREATE MATERIALIZED VIEW notes.linguisticnote_view AS
SELECT 
    notes.linguisticnote_pt.id,
    notes.linguisticnote.note_lang AS lang,
    COALESCE(notes.linguisticnote.note_value, '('|| notes.linguisticnote.note_nilreason ||')') AS note
FROM notes.linguisticnote_pt
INNER JOIN notes.linguisticnote ON notes.linguisticnote_pt.linguisticnote_id = notes.linguisticnote.id;

CREATE INDEX ON notes.linguisticnote_view (id);
-- []
-- Snowflake SQL : PointPropertyType

CREATE MATERIALIZED VIEW geometry.point_view AS
SELECT
    id, 
	point as geom,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM point_pt;

CREATE INDEX ON geometry.point_view (id);
-- []
create or replace view shared.propertieswithschedule_view as
select
    shared.propertieswithschedule_pt.id,
    shared.propertieswithschedule_pt.nilreason AS propertieswithschedule_annotation
from shared.propertieswithschedule_pt 
inner join shared.propertieswithschedule on shared.propertieswithschedule_pt.propertieswithschedule_id = shared.propertieswithschedule.id
group by
    shared.propertieswithschedule_pt.id,
    shared.propertieswithschedule_pt.nilreason;
-- []
create or replace view navaids_points.segmentpoint_view as
select
    navaids_points.segmentpoint_pt.id,
    navaids_points.segmentpoint_pt.nilreason AS segmentpoint_annotation
from navaids_points.segmentpoint_pt 
inner join navaids_points.segmentpoint on navaids_points.segmentpoint_pt.segmentpoint_id = navaids_points.segmentpoint.id
group by
    navaids_points.segmentpoint_pt.id,
    navaids_points.segmentpoint_pt.nilreason;
-- []
create or replace view airport_heliport.surfacecontamination_view as
select
    airport_heliport.surfacecontamination_pt.id,
    airport_heliport.surfacecontamination_pt.nilreason AS surfacecontamination_annotation
from airport_heliport.surfacecontamination_pt 
inner join airport_heliport.surfacecontamination on airport_heliport.surfacecontamination_pt.surfacecontamination_id = airport_heliport.surfacecontamination.id
group by
    airport_heliport.surfacecontamination_pt.id,
    airport_heliport.surfacecontamination_pt.nilreason;
-- []
-- Snowflake SQL : SurfacePropertyType

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
	COALESCE(outer_shells.horizontalaccuracy || ' ' ||outer_shells. horizontalaccuracy_uom, '(' || outer_shells.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM 
outer_shells;

CREATE INDEX ON geometry.surface_view (id);
-- []
create or replace view airport_heliport.usagecondition_view as
select
    airport_heliport.usagecondition_pt.id,
    airport_heliport.usagecondition_pt.nilreason AS usagecondition_annotation
from airport_heliport.usagecondition_pt 
inner join airport_heliport.usagecondition on airport_heliport.usagecondition_pt.usagecondition_id = airport_heliport.usagecondition.id
group by
    airport_heliport.usagecondition_pt.id,
    airport_heliport.usagecondition_pt.nilreason;
-- ['notes.linguisticnote_view']
-- Snowflake SQL : NotePropertyType 

CREATE INDEX ON notes.note_pt (note_id);
CREATE INDEX ON notes.note (id);

CREATE MATERIALIZED VIEW notes.note_view AS
SELECT
    notes.note_pt.id,
    jsonb_build_object(
        'propertyName', COALESCE(notes.note.propertyname_value, '(' || notes.note.propertyname_nilreason || ')'),
        'purpose', COALESCE(notes.note.purpose_value, '(' || notes.note.purpose_nilreason || ')'),
        'notes', translated_notes.notes_array
    ) AS note
FROM notes.note_pt
INNER JOIN notes.note ON notes.note_pt.note_id = notes.note.id
LEFT JOIN LATERAL (
    SELECT jsonb_agg(
        jsonb_build_object(
            'id', notes.linguisticnote_view.id,
            'lang', notes.linguisticnote_view.lang,
            'note', notes.linguisticnote_view.note
        )
    ) AS notes_array
    FROM master_join
    JOIN notes.linguisticnote_view ON master_join.target_id = notes.linguisticnote_view.id
    WHERE master_join.source_id = notes.note.id
) AS translated_notes ON true;

CREATE INDEX ON notes.note_view (id);
-- ['notes.note_view']
create or replace view shared.aircraftcharacteristic_view as
select
    shared.aircraftcharacteristic_pt.id,
    shared.aircraftcharacteristic_pt.nilreason AS aircraftcharacteristic_annotation,
    coalesce(cast(shared.aircraftcharacteristic.type_value as varchar), '(' || shared.aircraftcharacteristic.type_nilreason || ')') as type,
    coalesce(cast(shared.aircraftcharacteristic.engine_value as varchar), '(' || shared.aircraftcharacteristic.engine_nilreason || ')') as engine,
    coalesce(cast(shared.aircraftcharacteristic.numberengine_value as varchar), '(' || shared.aircraftcharacteristic.numberengine_nilreason || ')') as numberengine,
    coalesce(cast(shared.aircraftcharacteristic.typeaircrafticao_value as varchar), '(' || shared.aircraftcharacteristic.typeaircrafticao_nilreason || ')') as typeaircrafticao,
    coalesce(cast(shared.aircraftcharacteristic.aircraftlandingcategory_value as varchar), '(' || shared.aircraftcharacteristic.aircraftlandingcategory_nilreason || ')') as aircraftlandingcategory,
    coalesce(cast(shared.aircraftcharacteristic.wingspaninterpretation_value as varchar), '(' || shared.aircraftcharacteristic.wingspaninterpretation_nilreason || ')') as wingspaninterpretation,
    coalesce(cast(shared.aircraftcharacteristic.classwingspan_value as varchar), '(' || shared.aircraftcharacteristic.classwingspan_nilreason || ')') as classwingspan,
    coalesce(cast(shared.aircraftcharacteristic.weightinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.weightinterpretation_nilreason || ')') as weightinterpretation,
    coalesce(cast(shared.aircraftcharacteristic.passengers_value as varchar), '(' || shared.aircraftcharacteristic.passengers_nilreason || ')') as passengers,
    coalesce(cast(shared.aircraftcharacteristic.passengersinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.passengersinterpretation_nilreason || ')') as passengersinterpretation,
    coalesce(cast(shared.aircraftcharacteristic.speedinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(shared.aircraftcharacteristic.waketurbulence_value as varchar), '(' || shared.aircraftcharacteristic.waketurbulence_nilreason || ')') as waketurbulence,
    coalesce(cast(shared.aircraftcharacteristic.navigationequipment_value as varchar), '(' || shared.aircraftcharacteristic.navigationequipment_nilreason || ')') as navigationequipment,
    coalesce(cast(shared.aircraftcharacteristic.navigationspecification_value as varchar), '(' || shared.aircraftcharacteristic.navigationspecification_nilreason || ')') as navigationspecification,
    coalesce(cast(shared.aircraftcharacteristic.verticalseparationcapability_value as varchar), '(' || shared.aircraftcharacteristic.verticalseparationcapability_nilreason || ')') as verticalseparationcapability,
    coalesce(cast(shared.aircraftcharacteristic.anticollisionandseparationequipment_value as varchar), '(' || shared.aircraftcharacteristic.anticollisionandseparationequipment_nilreason || ')') as anticollisionandseparationequipment,
    coalesce(cast(shared.aircraftcharacteristic.communicationequipment_value as varchar), '(' || shared.aircraftcharacteristic.communicationequipment_nilreason || ')') as communicationequipment,
    coalesce(cast(shared.aircraftcharacteristic.surveillanceequipment_value as varchar), '(' || shared.aircraftcharacteristic.surveillanceequipment_nilreason || ')') as surveillanceequipment,
    coalesce(cast(shared.aircraftcharacteristic.wingspan_value as varchar) || ' ' || shared.aircraftcharacteristic.wingspan_uom, '(' || shared.aircraftcharacteristic.wingspan_nilreason || ')') as wingspan,
    coalesce(cast(shared.aircraftcharacteristic.weight_value as varchar) || ' ' || shared.aircraftcharacteristic.weight_uom, '(' || shared.aircraftcharacteristic.weight_nilreason || ')') as weight,
    coalesce(cast(shared.aircraftcharacteristic.speed_value as varchar) || ' ' || shared.aircraftcharacteristic.speed_uom, '(' || shared.aircraftcharacteristic.speed_nilreason || ')') as speed,
    jsonb_agg(notes_note_view_njzibj.*) AS annotation
from shared.aircraftcharacteristic_pt 
inner join shared.aircraftcharacteristic on shared.aircraftcharacteristic_pt.aircraftcharacteristic_id = shared.aircraftcharacteristic.id
left join master_join master_join_jkvckn on shared.aircraftcharacteristic.id = master_join_jkvckn.source_id
left join notes.note_view notes_note_view_njzibj on master_join_jkvckn.target_id = notes_note_view_njzibj.id
group by
    shared.aircraftcharacteristic_pt.id,
    shared.aircraftcharacteristic_pt.nilreason,
    shared.aircraftcharacteristic.type_value,
    shared.aircraftcharacteristic.type_nilreason,
    shared.aircraftcharacteristic.engine_value,
    shared.aircraftcharacteristic.engine_nilreason,
    shared.aircraftcharacteristic.numberengine_value,
    shared.aircraftcharacteristic.numberengine_nilreason,
    shared.aircraftcharacteristic.typeaircrafticao_value,
    shared.aircraftcharacteristic.typeaircrafticao_nilreason,
    shared.aircraftcharacteristic.aircraftlandingcategory_value,
    shared.aircraftcharacteristic.aircraftlandingcategory_nilreason,
    shared.aircraftcharacteristic.wingspaninterpretation_value,
    shared.aircraftcharacteristic.wingspaninterpretation_nilreason,
    shared.aircraftcharacteristic.classwingspan_value,
    shared.aircraftcharacteristic.classwingspan_nilreason,
    shared.aircraftcharacteristic.weightinterpretation_value,
    shared.aircraftcharacteristic.weightinterpretation_nilreason,
    shared.aircraftcharacteristic.passengers_value,
    shared.aircraftcharacteristic.passengers_nilreason,
    shared.aircraftcharacteristic.passengersinterpretation_value,
    shared.aircraftcharacteristic.passengersinterpretation_nilreason,
    shared.aircraftcharacteristic.speedinterpretation_value,
    shared.aircraftcharacteristic.speedinterpretation_nilreason,
    shared.aircraftcharacteristic.waketurbulence_value,
    shared.aircraftcharacteristic.waketurbulence_nilreason,
    shared.aircraftcharacteristic.navigationequipment_value,
    shared.aircraftcharacteristic.navigationequipment_nilreason,
    shared.aircraftcharacteristic.navigationspecification_value,
    shared.aircraftcharacteristic.navigationspecification_nilreason,
    shared.aircraftcharacteristic.verticalseparationcapability_value,
    shared.aircraftcharacteristic.verticalseparationcapability_nilreason,
    shared.aircraftcharacteristic.anticollisionandseparationequipment_value,
    shared.aircraftcharacteristic.anticollisionandseparationequipment_nilreason,
    shared.aircraftcharacteristic.communicationequipment_value,
    shared.aircraftcharacteristic.communicationequipment_nilreason,
    shared.aircraftcharacteristic.surveillanceequipment_value,
    shared.aircraftcharacteristic.surveillanceequipment_nilreason,
    shared.aircraftcharacteristic.wingspan_value,
    shared.aircraftcharacteristic.wingspan_uom,
    shared.aircraftcharacteristic.wingspan_nilreason,
    shared.aircraftcharacteristic.weight_value,
    shared.aircraftcharacteristic.weight_uom,
    shared.aircraftcharacteristic.weight_nilreason,
    shared.aircraftcharacteristic.speed_value,
    shared.aircraftcharacteristic.speed_uom,
    shared.aircraftcharacteristic.speed_nilreason;
-- ['shared.standardlevelcolumn_view', 'notes.note_view']
create or replace view shared.airspacelayer_view as
select
    shared.airspacelayer_pt.id,
    shared.airspacelayer_pt.nilreason AS airspacelayer_annotation,
    coalesce(cast(shared.airspacelayer.upperlimitreference_value as varchar), '(' || shared.airspacelayer.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.airspacelayer.lowerlimitreference_value as varchar), '(' || shared.airspacelayer.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.airspacelayer.altitudeinterpretation_value as varchar), '(' || shared.airspacelayer.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(shared.airspacelayer.upperlimit_value as varchar) || ' ' || shared.airspacelayer.upperlimit_uom, '(' || shared.airspacelayer.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.airspacelayer.lowerlimit_value as varchar) || ' ' || shared.airspacelayer.lowerlimit_uom, '(' || shared.airspacelayer.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(shared_standardlevelcolumn_view_rrlote.title as varchar), '(' || shared_standardlevelcolumn_view_rrlote.nilreason[1] || ')') AS discretelevelseries,
    shared_standardlevelcolumn_view_rrlote.href AS discretelevelseries_href,
    jsonb_agg(notes_note_view_xhhyrn.*) AS annotation
from shared.airspacelayer_pt 
inner join shared.airspacelayer on shared.airspacelayer_pt.airspacelayer_id = shared.airspacelayer.id
left join shared.standardlevelcolumn_view shared_standardlevelcolumn_view_rrlote on shared.airspacelayer.discretelevelseries_id = shared_standardlevelcolumn_view_rrlote.id
left join master_join master_join_casfew on shared.airspacelayer.id = master_join_casfew.source_id
left join notes.note_view notes_note_view_xhhyrn on master_join_casfew.target_id = notes_note_view_xhhyrn.id
group by
    shared.airspacelayer_pt.id,
    shared.airspacelayer_pt.nilreason,
    shared.airspacelayer.upperlimitreference_value,
    shared.airspacelayer.upperlimitreference_nilreason,
    shared.airspacelayer.lowerlimitreference_value,
    shared.airspacelayer.lowerlimitreference_nilreason,
    shared.airspacelayer.altitudeinterpretation_value,
    shared.airspacelayer.altitudeinterpretation_nilreason,
    shared.airspacelayer.upperlimit_value,
    shared.airspacelayer.upperlimit_uom,
    shared.airspacelayer.upperlimit_nilreason,
    shared.airspacelayer.lowerlimit_value,
    shared.airspacelayer.lowerlimit_uom,
    shared.airspacelayer.lowerlimit_nilreason,
    shared_standardlevelcolumn_view_rrlote.title,
    shared_standardlevelcolumn_view_rrlote.nilreason[1],
    shared_standardlevelcolumn_view_rrlote.href;
-- ['notes.note_view', 'airspace.airspace_view']
create or replace view airspace.airspacevolumedependency_view as
select
    airspace.airspacevolumedependency_pt.id,
    airspace.airspacevolumedependency_pt.nilreason AS airspacevolumedependency_annotation,
    coalesce(cast(airspace.airspacevolumedependency.dependency_value as varchar), '(' || airspace.airspacevolumedependency.dependency_nilreason || ')') as dependency,
    coalesce(cast(airspace_airspace_view_jepbyh.title as varchar), '(' || airspace_airspace_view_jepbyh.nilreason[1] || ')') AS theairspace,
    airspace_airspace_view_jepbyh.href AS theairspace_href,
    jsonb_agg(notes_note_view_vfiqvr.*) AS annotation
from airspace.airspacevolumedependency_pt 
inner join airspace.airspacevolumedependency on airspace.airspacevolumedependency_pt.airspacevolumedependency_id = airspace.airspacevolumedependency.id
left join airspace.airspace_view airspace_airspace_view_jepbyh on airspace.airspacevolumedependency.theairspace_id = airspace_airspace_view_jepbyh.id
left join master_join master_join_jsvvey on airspace.airspacevolumedependency.id = master_join_jsvvey.source_id
left join notes.note_view notes_note_view_vfiqvr on master_join_jsvvey.target_id = notes_note_view_vfiqvr.id
group by
    airspace.airspacevolumedependency_pt.id,
    airspace.airspacevolumedependency_pt.nilreason,
    airspace.airspacevolumedependency.dependency_value,
    airspace.airspacevolumedependency.dependency_nilreason,
    airspace_airspace_view_jepbyh.title,
    airspace_airspace_view_jepbyh.nilreason[1],
    airspace_airspace_view_jepbyh.href;
-- ['notes.note_view']
create or replace view shared.altitudeadjustment_view as
select
    shared.altitudeadjustment_pt.id,
    shared.altitudeadjustment_pt.nilreason AS altitudeadjustment_annotation,
    coalesce(cast(shared.altitudeadjustment.altitudeadjustmenttype_value as varchar), '(' || shared.altitudeadjustment.altitudeadjustmenttype_nilreason || ')') as altitudeadjustmenttype,
    coalesce(cast(shared.altitudeadjustment.primaryalternateminimum_value as varchar), '(' || shared.altitudeadjustment.primaryalternateminimum_nilreason || ')') as primaryalternateminimum,
    coalesce(cast(shared.altitudeadjustment.localremotecode_value as varchar), '(' || shared.altitudeadjustment.localremotecode_nilreason || ')') as localremotecode,
    coalesce(cast(shared.altitudeadjustment.altitudeadjustment_value as varchar) || ' ' || shared.altitudeadjustment.altitudeadjustment_uom, '(' || shared.altitudeadjustment.altitudeadjustment_nilreason || ')') as altitudeadjustment,
    jsonb_agg(notes_note_view_leurlo.*) AS annotation
from shared.altitudeadjustment_pt 
inner join shared.altitudeadjustment on shared.altitudeadjustment_pt.altitudeadjustment_id = shared.altitudeadjustment.id
left join master_join master_join_rogoqy on shared.altitudeadjustment.id = master_join_rogoqy.source_id
left join notes.note_view notes_note_view_leurlo on master_join_rogoqy.target_id = notes_note_view_leurlo.id
group by
    shared.altitudeadjustment_pt.id,
    shared.altitudeadjustment_pt.nilreason,
    shared.altitudeadjustment.altitudeadjustmenttype_value,
    shared.altitudeadjustment.altitudeadjustmenttype_nilreason,
    shared.altitudeadjustment.primaryalternateminimum_value,
    shared.altitudeadjustment.primaryalternateminimum_nilreason,
    shared.altitudeadjustment.localremotecode_value,
    shared.altitudeadjustment.localremotecode_nilreason,
    shared.altitudeadjustment.altitudeadjustment_value,
    shared.altitudeadjustment.altitudeadjustment_uom,
    shared.altitudeadjustment.altitudeadjustment_nilreason;
-- ['notes.note_view', 'navaids_points.angleindication_view']
create or replace view navaids_points.angleuse_view as
select
    navaids_points.angleuse_pt.id,
    navaids_points.angleuse_pt.nilreason AS angleuse_annotation,
    coalesce(cast(navaids_points.angleuse.alongcourseguidance_value as varchar), '(' || navaids_points.angleuse.alongcourseguidance_nilreason || ')') as alongcourseguidance,
    coalesce(cast(navaids_points_angleindication_view_vphrsg.title as varchar), '(' || navaids_points_angleindication_view_vphrsg.nilreason[1] || ')') AS theangleindication,
    navaids_points_angleindication_view_vphrsg.href AS theangleindication_href,
    jsonb_agg(notes_note_view_awwdep.*) AS annotation
from navaids_points.angleuse_pt 
inner join navaids_points.angleuse on navaids_points.angleuse_pt.angleuse_id = navaids_points.angleuse.id
left join navaids_points.angleindication_view navaids_points_angleindication_view_vphrsg on navaids_points.angleuse.theangleindication_id = navaids_points_angleindication_view_vphrsg.id
left join master_join master_join_fandrl on navaids_points.angleuse.id = master_join_fandrl.source_id
left join notes.note_view notes_note_view_awwdep on master_join_fandrl.target_id = notes_note_view_awwdep.id
group by
    navaids_points.angleuse_pt.id,
    navaids_points.angleuse_pt.nilreason,
    navaids_points.angleuse.alongcourseguidance_value,
    navaids_points.angleuse.alongcourseguidance_nilreason,
    navaids_points_angleindication_view_vphrsg.title,
    navaids_points_angleindication_view_vphrsg.nilreason[1],
    navaids_points_angleindication_view_vphrsg.href;
-- ['notes.note_view']
create or replace view procedure.approachaltitudetable_view as
select
    procedure.approachaltitudetable_pt.id,
    procedure.approachaltitudetable_pt.nilreason AS approachaltitudetable_annotation,
    coalesce(cast(procedure.approachaltitudetable.measurementpoint_value as varchar), '(' || procedure.approachaltitudetable.measurementpoint_nilreason || ')') as measurementpoint,
    coalesce(cast(procedure.approachaltitudetable.altitudereference_value as varchar), '(' || procedure.approachaltitudetable.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(procedure.approachaltitudetable.altitude_value as varchar) || ' ' || procedure.approachaltitudetable.altitude_uom, '(' || procedure.approachaltitudetable.altitude_nilreason || ')') as altitude,
    jsonb_agg(notes_note_view_ivgjsi.*) AS annotation
from procedure.approachaltitudetable_pt 
inner join procedure.approachaltitudetable on procedure.approachaltitudetable_pt.approachaltitudetable_id = procedure.approachaltitudetable.id
left join master_join master_join_hjsumb on procedure.approachaltitudetable.id = master_join_hjsumb.source_id
left join notes.note_view notes_note_view_ivgjsi on master_join_hjsumb.target_id = notes_note_view_ivgjsi.id
group by
    procedure.approachaltitudetable_pt.id,
    procedure.approachaltitudetable_pt.nilreason,
    procedure.approachaltitudetable.measurementpoint_value,
    procedure.approachaltitudetable.measurementpoint_nilreason,
    procedure.approachaltitudetable.altitudereference_value,
    procedure.approachaltitudetable.altitudereference_nilreason,
    procedure.approachaltitudetable.altitude_value,
    procedure.approachaltitudetable.altitude_uom,
    procedure.approachaltitudetable.altitude_nilreason;
-- ['notes.note_view']
create or replace view procedure.approachdistancetable_view as
select
    procedure.approachdistancetable_pt.id,
    procedure.approachdistancetable_pt.nilreason AS approachdistancetable_annotation,
    coalesce(cast(procedure.approachdistancetable.startingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable.startingmeasurementpoint_nilreason || ')') as startingmeasurementpoint,
    coalesce(cast(procedure.approachdistancetable.endingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable.endingmeasurementpoint_nilreason || ')') as endingmeasurementpoint,
    coalesce(cast(procedure.approachdistancetable.valuehat_value as varchar) || ' ' || procedure.approachdistancetable.valuehat_uom, '(' || procedure.approachdistancetable.valuehat_nilreason || ')') as valuehat,
    coalesce(cast(procedure.approachdistancetable.distance_value as varchar) || ' ' || procedure.approachdistancetable.distance_uom, '(' || procedure.approachdistancetable.distance_nilreason || ')') as distance,
    jsonb_agg(notes_note_view_kohtfg.*) AS annotation
from procedure.approachdistancetable_pt 
inner join procedure.approachdistancetable on procedure.approachdistancetable_pt.approachdistancetable_id = procedure.approachdistancetable.id
left join master_join master_join_kzujjy on procedure.approachdistancetable.id = master_join_kzujjy.source_id
left join notes.note_view notes_note_view_kohtfg on master_join_kzujjy.target_id = notes_note_view_kohtfg.id
group by
    procedure.approachdistancetable_pt.id,
    procedure.approachdistancetable_pt.nilreason,
    procedure.approachdistancetable.startingmeasurementpoint_value,
    procedure.approachdistancetable.startingmeasurementpoint_nilreason,
    procedure.approachdistancetable.endingmeasurementpoint_value,
    procedure.approachdistancetable.endingmeasurementpoint_nilreason,
    procedure.approachdistancetable.valuehat_value,
    procedure.approachdistancetable.valuehat_uom,
    procedure.approachdistancetable.valuehat_nilreason,
    procedure.approachdistancetable.distance_value,
    procedure.approachdistancetable.distance_uom,
    procedure.approachdistancetable.distance_nilreason;
-- ['notes.note_view']
create or replace view procedure.approachtimingtable_view as
select
    procedure.approachtimingtable_pt.id,
    procedure.approachtimingtable_pt.nilreason AS approachtimingtable_annotation,
    coalesce(cast(procedure.approachtimingtable.startingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable.startingmeasurementpoint_nilreason || ')') as startingmeasurementpoint,
    coalesce(cast(procedure.approachtimingtable.endingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable.endingmeasurementpoint_nilreason || ')') as endingmeasurementpoint,
    coalesce(cast(procedure.approachtimingtable.time_value as varchar) || ' ' || procedure.approachtimingtable.time_uom, '(' || procedure.approachtimingtable.time_nilreason || ')') as time,
    coalesce(cast(procedure.approachtimingtable.speed_value as varchar) || ' ' || procedure.approachtimingtable.speed_uom, '(' || procedure.approachtimingtable.speed_nilreason || ')') as speed,
    jsonb_agg(notes_note_view_skmrcj.*) AS annotation
from procedure.approachtimingtable_pt 
inner join procedure.approachtimingtable on procedure.approachtimingtable_pt.approachtimingtable_id = procedure.approachtimingtable.id
left join master_join master_join_ouzrjb on procedure.approachtimingtable.id = master_join_ouzrjb.source_id
left join notes.note_view notes_note_view_skmrcj on master_join_ouzrjb.target_id = notes_note_view_skmrcj.id
group by
    procedure.approachtimingtable_pt.id,
    procedure.approachtimingtable_pt.nilreason,
    procedure.approachtimingtable.startingmeasurementpoint_value,
    procedure.approachtimingtable.startingmeasurementpoint_nilreason,
    procedure.approachtimingtable.endingmeasurementpoint_value,
    procedure.approachtimingtable.endingmeasurementpoint_nilreason,
    procedure.approachtimingtable.time_value,
    procedure.approachtimingtable.time_uom,
    procedure.approachtimingtable.time_nilreason,
    procedure.approachtimingtable.speed_value,
    procedure.approachtimingtable.speed_uom,
    procedure.approachtimingtable.speed_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view']
create or replace view aerial_refuelling.authorityforaerialrefuelling_view as
select
    aerial_refuelling.authorityforaerialrefuelling_pt.id,
    aerial_refuelling.authorityforaerialrefuelling_pt.nilreason AS authorityforaerialrefuelling_annotation,
    coalesce(cast(aerial_refuelling.authorityforaerialrefuelling.type_value as varchar), '(' || aerial_refuelling.authorityforaerialrefuelling.type_nilreason || ')') as type,
    jsonb_agg(notes_note_view_oixjfv.*) AS annotation
from aerial_refuelling.authorityforaerialrefuelling_pt 
inner join aerial_refuelling.authorityforaerialrefuelling on aerial_refuelling.authorityforaerialrefuelling_pt.authorityforaerialrefuelling_id = aerial_refuelling.authorityforaerialrefuelling.id
left join organisation.organisationauthority_view organisation_organisationauthority_view_etmovu on aerial_refuelling.authorityforaerialrefuelling.theorganisationauthority_id = organisation_organisationauthority_view_etmovu.id
left join master_join master_join_vkhsib on aerial_refuelling.authorityforaerialrefuelling.id = master_join_vkhsib.source_id
left join notes.note_view notes_note_view_oixjfv on master_join_vkhsib.target_id = notes_note_view_oixjfv.id
group by
    aerial_refuelling.authorityforaerialrefuelling_pt.id,
    aerial_refuelling.authorityforaerialrefuelling_pt.nilreason,
    aerial_refuelling.authorityforaerialrefuelling.type_value,
    aerial_refuelling.authorityforaerialrefuelling.type_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view']
create or replace view navaids_points.authorityfornavaidequipment_view as
select
    navaids_points.authorityfornavaidequipment_pt.id,
    navaids_points.authorityfornavaidequipment_pt.nilreason AS authorityfornavaidequipment_annotation,
    coalesce(cast(navaids_points.authorityfornavaidequipment.type_value as varchar), '(' || navaids_points.authorityfornavaidequipment.type_nilreason || ')') as type,
    jsonb_agg(notes_note_view_wyqmpi.*) AS annotation
from navaids_points.authorityfornavaidequipment_pt 
inner join navaids_points.authorityfornavaidequipment on navaids_points.authorityfornavaidequipment_pt.authorityfornavaidequipment_id = navaids_points.authorityfornavaidequipment.id
left join organisation.organisationauthority_view organisation_organisationauthority_view_wqbgsn on navaids_points.authorityfornavaidequipment.theorganisationauthority_id = organisation_organisationauthority_view_wqbgsn.id
left join master_join master_join_konllq on navaids_points.authorityfornavaidequipment.id = master_join_konllq.source_id
left join notes.note_view notes_note_view_wyqmpi on master_join_konllq.target_id = notes_note_view_wyqmpi.id
group by
    navaids_points.authorityfornavaidequipment_pt.id,
    navaids_points.authorityfornavaidequipment_pt.nilreason,
    navaids_points.authorityfornavaidequipment.type_value,
    navaids_points.authorityfornavaidequipment.type_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view']
create or replace view navaids_points.authorityforspecialnavigationstation_view as
select
    navaids_points.authorityforspecialnavigationstation_pt.id,
    navaids_points.authorityforspecialnavigationstation_pt.nilreason AS authorityforspecialnavigationstation_annotation,
    coalesce(cast(navaids_points.authorityforspecialnavigationstation.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationstation.type_nilreason || ')') as type,
    jsonb_agg(notes_note_view_joibux.*) AS annotation
from navaids_points.authorityforspecialnavigationstation_pt 
inner join navaids_points.authorityforspecialnavigationstation on navaids_points.authorityforspecialnavigationstation_pt.authorityforspecialnavigationstation_id = navaids_points.authorityforspecialnavigationstation.id
left join organisation.organisationauthority_view organisation_organisationauthority_view_pxdofy on navaids_points.authorityforspecialnavigationstation.theorganisationauthority_id = organisation_organisationauthority_view_pxdofy.id
left join master_join master_join_zbzslb on navaids_points.authorityforspecialnavigationstation.id = master_join_zbzslb.source_id
left join notes.note_view notes_note_view_joibux on master_join_zbzslb.target_id = notes_note_view_joibux.id
group by
    navaids_points.authorityforspecialnavigationstation_pt.id,
    navaids_points.authorityforspecialnavigationstation_pt.nilreason,
    navaids_points.authorityforspecialnavigationstation.type_value,
    navaids_points.authorityforspecialnavigationstation.type_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view']
create or replace view navaids_points.authorityforspecialnavigationsystem_view as
select
    navaids_points.authorityforspecialnavigationsystem_pt.id,
    navaids_points.authorityforspecialnavigationsystem_pt.nilreason AS authorityforspecialnavigationsystem_annotation,
    coalesce(cast(navaids_points.authorityforspecialnavigationsystem.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationsystem.type_nilreason || ')') as type,
    jsonb_agg(notes_note_view_siggyx.*) AS annotation
from navaids_points.authorityforspecialnavigationsystem_pt 
inner join navaids_points.authorityforspecialnavigationsystem on navaids_points.authorityforspecialnavigationsystem_pt.authorityforspecialnavigationsystem_id = navaids_points.authorityforspecialnavigationsystem.id
left join organisation.organisationauthority_view organisation_organisationauthority_view_hwhtfg on navaids_points.authorityforspecialnavigationsystem.theorganisationauthority_id = organisation_organisationauthority_view_hwhtfg.id
left join master_join master_join_hjjguf on navaids_points.authorityforspecialnavigationsystem.id = master_join_hjjguf.source_id
left join notes.note_view notes_note_view_siggyx on master_join_hjjguf.target_id = notes_note_view_siggyx.id
group by
    navaids_points.authorityforspecialnavigationsystem_pt.id,
    navaids_points.authorityforspecialnavigationsystem_pt.nilreason,
    navaids_points.authorityforspecialnavigationsystem.type_value,
    navaids_points.authorityforspecialnavigationsystem.type_nilreason;
-- ['notes.note_view']
create or replace view service.callsigndetail_view as
select
    service.callsigndetail_pt.id,
    service.callsigndetail_pt.nilreason AS callsigndetail_annotation,
    coalesce(cast(service.callsigndetail.callsign_value as varchar), '(' || service.callsigndetail.callsign_nilreason || ')') as callsign,
    coalesce(cast(service.callsigndetail.language_value as varchar), '(' || service.callsigndetail.language_nilreason || ')') as language,
    jsonb_agg(notes_note_view_hbouva.*) AS annotation
from service.callsigndetail_pt 
inner join service.callsigndetail on service.callsigndetail_pt.callsigndetail_id = service.callsigndetail.id
left join master_join master_join_puonih on service.callsigndetail.id = master_join_puonih.source_id
left join notes.note_view notes_note_view_hbouva on master_join_puonih.target_id = notes_note_view_hbouva.id
group by
    service.callsigndetail_pt.id,
    service.callsigndetail_pt.nilreason,
    service.callsigndetail.callsign_value,
    service.callsigndetail.callsign_nilreason,
    service.callsigndetail.language_value,
    service.callsigndetail.language_nilreason;
-- ['notes.note_view']
create or replace view shared.circlesector_view as
select
    shared.circlesector_pt.id,
    shared.circlesector_pt.nilreason AS circlesector_annotation,
    coalesce(cast(shared.circlesector.arcdirection_value as varchar), '(' || shared.circlesector.arcdirection_nilreason || ')') as arcdirection,
    coalesce(cast(shared.circlesector.fromangle_value as varchar), '(' || shared.circlesector.fromangle_nilreason || ')') as fromangle,
    coalesce(cast(shared.circlesector.toangle_value as varchar), '(' || shared.circlesector.toangle_nilreason || ')') as toangle,
    coalesce(cast(shared.circlesector.angletype_value as varchar), '(' || shared.circlesector.angletype_nilreason || ')') as angletype,
    coalesce(cast(shared.circlesector.angledirectionreference_value as varchar), '(' || shared.circlesector.angledirectionreference_nilreason || ')') as angledirectionreference,
    coalesce(cast(shared.circlesector.upperlimitreference_value as varchar), '(' || shared.circlesector.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.circlesector.lowerlimitreference_value as varchar), '(' || shared.circlesector.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.circlesector.innerdistance_value as varchar) || ' ' || shared.circlesector.innerdistance_uom, '(' || shared.circlesector.innerdistance_nilreason || ')') as innerdistance,
    coalesce(cast(shared.circlesector.outerdistance_value as varchar) || ' ' || shared.circlesector.outerdistance_uom, '(' || shared.circlesector.outerdistance_nilreason || ')') as outerdistance,
    coalesce(cast(shared.circlesector.upperlimit_value as varchar) || ' ' || shared.circlesector.upperlimit_uom, '(' || shared.circlesector.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.circlesector.lowerlimit_value as varchar) || ' ' || shared.circlesector.lowerlimit_uom, '(' || shared.circlesector.lowerlimit_nilreason || ')') as lowerlimit,
    jsonb_agg(notes_note_view_ekwdkk.*) AS annotation
from shared.circlesector_pt 
inner join shared.circlesector on shared.circlesector_pt.circlesector_id = shared.circlesector.id
left join master_join master_join_wahydw on shared.circlesector.id = master_join_wahydw.source_id
left join notes.note_view notes_note_view_ekwdkk on master_join_wahydw.target_id = notes_note_view_ekwdkk.id
group by
    shared.circlesector_pt.id,
    shared.circlesector_pt.nilreason,
    shared.circlesector.arcdirection_value,
    shared.circlesector.arcdirection_nilreason,
    shared.circlesector.fromangle_value,
    shared.circlesector.fromangle_nilreason,
    shared.circlesector.toangle_value,
    shared.circlesector.toangle_nilreason,
    shared.circlesector.angletype_value,
    shared.circlesector.angletype_nilreason,
    shared.circlesector.angledirectionreference_value,
    shared.circlesector.angledirectionreference_nilreason,
    shared.circlesector.upperlimitreference_value,
    shared.circlesector.upperlimitreference_nilreason,
    shared.circlesector.lowerlimitreference_value,
    shared.circlesector.lowerlimitreference_nilreason,
    shared.circlesector.innerdistance_value,
    shared.circlesector.innerdistance_uom,
    shared.circlesector.innerdistance_nilreason,
    shared.circlesector.outerdistance_value,
    shared.circlesector.outerdistance_uom,
    shared.circlesector.outerdistance_nilreason,
    shared.circlesector.upperlimit_value,
    shared.circlesector.upperlimit_uom,
    shared.circlesector.upperlimit_nilreason,
    shared.circlesector.lowerlimit_value,
    shared.circlesector.lowerlimit_uom,
    shared.circlesector.lowerlimit_nilreason;
-- ['notes.note_view']
create or replace view airport_heliport.city_view as
select
    airport_heliport.city_pt.id,
    airport_heliport.city_pt.nilreason AS city_annotation,
    coalesce(cast(airport_heliport.city.name_value as varchar), '(' || airport_heliport.city.name_nilreason || ')') as name,
    jsonb_agg(notes_note_view_ubmcpw.*) AS annotation
from airport_heliport.city_pt 
inner join airport_heliport.city on airport_heliport.city_pt.city_id = airport_heliport.city.id
left join master_join master_join_gzijbm on airport_heliport.city.id = master_join_gzijbm.source_id
left join notes.note_view notes_note_view_ubmcpw on master_join_gzijbm.target_id = notes_note_view_ubmcpw.id
group by
    airport_heliport.city_pt.id,
    airport_heliport.city_pt.nilreason,
    airport_heliport.city.name_value,
    airport_heliport.city.name_nilreason;
-- ['notes.note_view']
create or replace view routes.directflightclass_view as
select
    routes.directflightclass_pt.id,
    routes.directflightclass_pt.nilreason AS directflightclass_annotation,
    coalesce(cast(routes.directflightclass.exceedlength_value as varchar) || ' ' || routes.directflightclass.exceedlength_uom, '(' || routes.directflightclass.exceedlength_nilreason || ')') as exceedlength,
    jsonb_agg(notes_note_view_mxoduq.*) AS annotation
from routes.directflightclass_pt 
inner join routes.directflightclass on routes.directflightclass_pt.directflightclass_id = routes.directflightclass.id
left join master_join master_join_uiylzw on routes.directflightclass.id = master_join_uiylzw.source_id
left join notes.note_view notes_note_view_mxoduq on master_join_uiylzw.target_id = notes_note_view_mxoduq.id
group by
    routes.directflightclass_pt.id,
    routes.directflightclass_pt.nilreason,
    routes.directflightclass.exceedlength_value,
    routes.directflightclass.exceedlength_uom,
    routes.directflightclass.exceedlength_nilreason;
-- ['geometry.point_view', 'airport_heliport.runwaycentrelinepoint_view', 'airport_heliport.airportheliport_view', 'airport_heliport.touchdownliftoff_view', 'navaids_points.navaid_view', 'notes.note_view', 'navaids_points.designatedpoint_view']
create or replace view routes.directflightsegment_view as
select
    routes.directflightsegment_pt.id,
    routes.directflightsegment_pt.nilreason AS directflightsegment_annotation,
    coalesce(cast(navaids_points_designatedpoint_view_zsyldg.title as varchar), '(' || navaids_points_designatedpoint_view_zsyldg.nilreason[1] || ')') AS endfixdesignatedpoint,
    navaids_points_designatedpoint_view_zsyldg.href AS endfixdesignatedpoint_href,
    coalesce(cast(navaids_points_designatedpoint_view_vbubup.title as varchar), '(' || navaids_points_designatedpoint_view_vbubup.nilreason[1] || ')') AS startfixdesignatedpoint,
    navaids_points_designatedpoint_view_vbubup.href AS startfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_view_suxbtl.title as varchar), '(' || navaids_points_navaid_view_suxbtl.nilreason[1] || ')') AS endnavaidsystem,
    navaids_points_navaid_view_suxbtl.href AS endnavaidsystem_href,
    coalesce(cast(navaids_points_navaid_view_mhbdfv.title as varchar), '(' || navaids_points_navaid_view_mhbdfv.nilreason[1] || ')') AS startnavaidsystem,
    navaids_points_navaid_view_mhbdfv.href AS startnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_jlvonj.title as varchar), '(' || airport_heliport_touchdownliftoff_view_jlvonj.nilreason[1] || ')') AS endaimingpoint,
    airport_heliport_touchdownliftoff_view_jlvonj.href AS endaimingpoint_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_cmxtoa.title as varchar), '(' || airport_heliport_touchdownliftoff_view_cmxtoa.nilreason[1] || ')') AS startaimingpoint,
    airport_heliport_touchdownliftoff_view_cmxtoa.href AS startaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_xwspkg.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_xwspkg.nilreason[1] || ')') AS endrunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_xwspkg.href AS endrunwaypoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_houykm.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_houykm.nilreason[1] || ')') AS startrunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_houykm.href AS startrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_hhblzf.title as varchar), '(' || airport_heliport_airportheliport_view_hhblzf.nilreason[1] || ')') AS endairportreferencepoint,
    airport_heliport_airportheliport_view_hhblzf.href AS endairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_bwsnga.title as varchar), '(' || airport_heliport_airportheliport_view_bwsnga.nilreason[1] || ')') AS startairportreferencepoint,
    airport_heliport_airportheliport_view_bwsnga.href AS startairportreferencepoint_href,
    geometry_point_view_rhpjch.geom AS geom,
    ST_X(geometry_point_view_rhpjch.geom) AS longitude,
    ST_Y(geometry_point_view_rhpjch.geom) AS latitude,
    geometry_point_view_rhpjch.horizontalAccuracy,
    geometry_point_view_njajqq.geom AS geom,
    ST_X(geometry_point_view_njajqq.geom) AS longitude,
    ST_Y(geometry_point_view_njajqq.geom) AS latitude,
    geometry_point_view_njajqq.horizontalAccuracy,
    jsonb_agg(notes_note_view_zzvdzz.*) AS annotation
from routes.directflightsegment_pt 
inner join routes.directflightsegment on routes.directflightsegment_pt.directflightsegment_id = routes.directflightsegment.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_zsyldg on routes.directflightsegment.end_fixdesignatedpoint_id = navaids_points_designatedpoint_view_zsyldg.id
left join navaids_points.navaid_view navaids_points_navaid_view_suxbtl on routes.directflightsegment.end_navaidsystem_id = navaids_points_navaid_view_suxbtl.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_jlvonj on routes.directflightsegment.end_aimingpoint_id = airport_heliport_touchdownliftoff_view_jlvonj.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_xwspkg on routes.directflightsegment.end_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_xwspkg.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_hhblzf on routes.directflightsegment.end_airportreferencepoint_id = airport_heliport_airportheliport_view_hhblzf.id
left join geometry.point_view geometry_point_view_rhpjch on routes.directflightsegment.end_position_id = geometry_point_view_rhpjch.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_vbubup on routes.directflightsegment.start_fixdesignatedpoint_id = navaids_points_designatedpoint_view_vbubup.id
left join navaids_points.navaid_view navaids_points_navaid_view_mhbdfv on routes.directflightsegment.start_navaidsystem_id = navaids_points_navaid_view_mhbdfv.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_cmxtoa on routes.directflightsegment.start_aimingpoint_id = airport_heliport_touchdownliftoff_view_cmxtoa.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_houykm on routes.directflightsegment.start_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_houykm.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_bwsnga on routes.directflightsegment.start_airportreferencepoint_id = airport_heliport_airportheliport_view_bwsnga.id
left join geometry.point_view geometry_point_view_njajqq on routes.directflightsegment.start_position_id = geometry_point_view_njajqq.id
left join master_join master_join_bdgndv on routes.directflightsegment.id = master_join_bdgndv.source_id
left join notes.note_view notes_note_view_zzvdzz on master_join_bdgndv.target_id = notes_note_view_zzvdzz.id
group by
    routes.directflightsegment_pt.id,
    routes.directflightsegment_pt.nilreason,
    navaids_points_designatedpoint_view_zsyldg.title,
    navaids_points_designatedpoint_view_zsyldg.nilreason[1],
    navaids_points_designatedpoint_view_zsyldg.href,
    navaids_points_navaid_view_suxbtl.title,
    navaids_points_navaid_view_suxbtl.nilreason[1],
    navaids_points_navaid_view_suxbtl.href,
    airport_heliport_touchdownliftoff_view_jlvonj.title,
    airport_heliport_touchdownliftoff_view_jlvonj.nilreason[1],
    airport_heliport_touchdownliftoff_view_jlvonj.href,
    airport_heliport_runwaycentrelinepoint_view_xwspkg.title,
    airport_heliport_runwaycentrelinepoint_view_xwspkg.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_xwspkg.href,
    airport_heliport_airportheliport_view_hhblzf.title,
    airport_heliport_airportheliport_view_hhblzf.nilreason[1],
    airport_heliport_airportheliport_view_hhblzf.href,
    geometry_point_view_rhpjch.geom,
    geometry_point_view_rhpjch.horizontalAccuracy,
    navaids_points_designatedpoint_view_vbubup.title,
    navaids_points_designatedpoint_view_vbubup.nilreason[1],
    navaids_points_designatedpoint_view_vbubup.href,
    navaids_points_navaid_view_mhbdfv.title,
    navaids_points_navaid_view_mhbdfv.nilreason[1],
    navaids_points_navaid_view_mhbdfv.href,
    airport_heliport_touchdownliftoff_view_cmxtoa.title,
    airport_heliport_touchdownliftoff_view_cmxtoa.nilreason[1],
    airport_heliport_touchdownliftoff_view_cmxtoa.href,
    airport_heliport_runwaycentrelinepoint_view_houykm.title,
    airport_heliport_runwaycentrelinepoint_view_houykm.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_houykm.href,
    airport_heliport_airportheliport_view_bwsnga.title,
    airport_heliport_airportheliport_view_bwsnga.nilreason[1],
    airport_heliport_airportheliport_view_bwsnga.href,
    geometry_point_view_njajqq.geom,
    geometry_point_view_njajqq.horizontalAccuracy;
-- ['notes.note_view']
create or replace view procedure.equipmentunavailableadjustmentcolumn_view as
select
    procedure.equipmentunavailableadjustmentcolumn_pt.id,
    procedure.equipmentunavailableadjustmentcolumn_pt.nilreason AS equipmentunavailableadjustmentcolumn_annotation,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_nilreason || ')') as guidanceequipment,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_nilreason || ')') as landingsystemlights,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_nilreason || ')') as equipmentrvr,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_nilreason || ')') as approachlightinginoperative,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_value as varchar) || ' ' || procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_uom, '(' || procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_nilreason || ')') as visibilityadjustment,
    jsonb_agg(notes_note_view_jazxdh.*) AS annotation
from procedure.equipmentunavailableadjustmentcolumn_pt 
inner join procedure.equipmentunavailableadjustmentcolumn on procedure.equipmentunavailableadjustmentcolumn_pt.equipmentunavailableadjustmentcolumn_id = procedure.equipmentunavailableadjustmentcolumn.id
left join master_join master_join_xemxgf on procedure.equipmentunavailableadjustmentcolumn.id = master_join_xemxgf.source_id
left join notes.note_view notes_note_view_jazxdh on master_join_xemxgf.target_id = notes_note_view_jazxdh.id
group by
    procedure.equipmentunavailableadjustmentcolumn_pt.id,
    procedure.equipmentunavailableadjustmentcolumn_pt.nilreason,
    procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_value,
    procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_value,
    procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_value,
    procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_value,
    procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_value,
    procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_uom,
    procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_nilreason;
-- ['notes.note_view']
create or replace view public.fasdatablock_view as
select
    public.fasdatablock_pt.id,
    public.fasdatablock_pt.nilreason AS fasdatablock_annotation,
    coalesce(cast(public.fasdatablock.horizontalalarmlimit_value as varchar), '(' || public.fasdatablock.horizontalalarmlimit_nilreason || ')') as horizontalalarmlimit,
    coalesce(cast(public.fasdatablock.verticalalarmlimit_value as varchar), '(' || public.fasdatablock.verticalalarmlimit_nilreason || ')') as verticalalarmlimit,
    coalesce(cast(public.fasdatablock.crcremainder_value as varchar), '(' || public.fasdatablock.crcremainder_nilreason || ')') as crcremainder,
    coalesce(cast(public.fasdatablock.operationtype_value as varchar), '(' || public.fasdatablock.operationtype_nilreason || ')') as operationtype,
    coalesce(cast(public.fasdatablock.serviceprovidersbas_value as varchar), '(' || public.fasdatablock.serviceprovidersbas_nilreason || ')') as serviceprovidersbas,
    coalesce(cast(public.fasdatablock.approachperformancedesignator_value as varchar), '(' || public.fasdatablock.approachperformancedesignator_nilreason || ')') as approachperformancedesignator,
    coalesce(cast(public.fasdatablock.referencepathdataselector_value as varchar), '(' || public.fasdatablock.referencepathdataselector_nilreason || ')') as referencepathdataselector,
    coalesce(cast(public.fasdatablock.thresholdcoursewidth_value as varchar) || ' ' || public.fasdatablock.thresholdcoursewidth_uom, '(' || public.fasdatablock.thresholdcoursewidth_nilreason || ')') as thresholdcoursewidth,
    coalesce(cast(public.fasdatablock.lengthoffset_value as varchar) || ' ' || public.fasdatablock.lengthoffset_uom, '(' || public.fasdatablock.lengthoffset_nilreason || ')') as lengthoffset,
    jsonb_agg(notes_note_view_bykkxj.*) AS annotation
from public.fasdatablock_pt 
inner join public.fasdatablock on public.fasdatablock_pt.fasdatablock_id = public.fasdatablock.id
left join master_join master_join_kajtum on public.fasdatablock.id = master_join_kajtum.source_id
left join notes.note_view notes_note_view_bykkxj on master_join_kajtum.target_id = notes_note_view_bykkxj.id
group by
    public.fasdatablock_pt.id,
    public.fasdatablock_pt.nilreason,
    public.fasdatablock.horizontalalarmlimit_value,
    public.fasdatablock.horizontalalarmlimit_nilreason,
    public.fasdatablock.verticalalarmlimit_value,
    public.fasdatablock.verticalalarmlimit_nilreason,
    public.fasdatablock.crcremainder_value,
    public.fasdatablock.crcremainder_nilreason,
    public.fasdatablock.operationtype_value,
    public.fasdatablock.operationtype_nilreason,
    public.fasdatablock.serviceprovidersbas_value,
    public.fasdatablock.serviceprovidersbas_nilreason,
    public.fasdatablock.approachperformancedesignator_value,
    public.fasdatablock.approachperformancedesignator_nilreason,
    public.fasdatablock.referencepathdataselector_value,
    public.fasdatablock.referencepathdataselector_nilreason,
    public.fasdatablock.thresholdcoursewidth_value,
    public.fasdatablock.thresholdcoursewidth_uom,
    public.fasdatablock.thresholdcoursewidth_nilreason,
    public.fasdatablock.lengthoffset_value,
    public.fasdatablock.lengthoffset_uom,
    public.fasdatablock.lengthoffset_nilreason;
-- ['notes.note_view']
create or replace view shared.flightcharacteristic_view as
select
    shared.flightcharacteristic_pt.id,
    shared.flightcharacteristic_pt.nilreason AS flightcharacteristic_annotation,
    coalesce(cast(shared.flightcharacteristic.type_value as varchar), '(' || shared.flightcharacteristic.type_nilreason || ')') as type,
    coalesce(cast(shared.flightcharacteristic.rule_value as varchar), '(' || shared.flightcharacteristic.rule_nilreason || ')') as rule,
    coalesce(cast(shared.flightcharacteristic.status_value as varchar), '(' || shared.flightcharacteristic.status_nilreason || ')') as status,
    coalesce(cast(shared.flightcharacteristic.military_value as varchar), '(' || shared.flightcharacteristic.military_nilreason || ')') as military,
    coalesce(cast(shared.flightcharacteristic.origin_value as varchar), '(' || shared.flightcharacteristic.origin_nilreason || ')') as origin,
    coalesce(cast(shared.flightcharacteristic.purpose_value as varchar), '(' || shared.flightcharacteristic.purpose_nilreason || ')') as purpose,
    jsonb_agg(notes_note_view_sebgrl.*) AS annotation
from shared.flightcharacteristic_pt 
inner join shared.flightcharacteristic on shared.flightcharacteristic_pt.flightcharacteristic_id = shared.flightcharacteristic.id
left join master_join master_join_nwkvee on shared.flightcharacteristic.id = master_join_nwkvee.source_id
left join notes.note_view notes_note_view_sebgrl on master_join_nwkvee.target_id = notes_note_view_sebgrl.id
group by
    shared.flightcharacteristic_pt.id,
    shared.flightcharacteristic_pt.nilreason,
    shared.flightcharacteristic.type_value,
    shared.flightcharacteristic.type_nilreason,
    shared.flightcharacteristic.rule_value,
    shared.flightcharacteristic.rule_nilreason,
    shared.flightcharacteristic.status_value,
    shared.flightcharacteristic.status_nilreason,
    shared.flightcharacteristic.military_value,
    shared.flightcharacteristic.military_nilreason,
    shared.flightcharacteristic.origin_value,
    shared.flightcharacteristic.origin_nilreason,
    shared.flightcharacteristic.purpose_value,
    shared.flightcharacteristic.purpose_nilreason;
-- ['notes.note_view']
create or replace view routes.flightconditioncircumstance_view as
select
    routes.flightconditioncircumstance_pt.id,
    routes.flightconditioncircumstance_pt.nilreason AS flightconditioncircumstance_annotation,
    coalesce(cast(routes.flightconditioncircumstance.referencelocation_value as varchar), '(' || routes.flightconditioncircumstance.referencelocation_nilreason || ')') as referencelocation,
    coalesce(cast(routes.flightconditioncircumstance.relationwithlocation_value as varchar), '(' || routes.flightconditioncircumstance.relationwithlocation_nilreason || ')') as relationwithlocation,
    jsonb_agg(notes_note_view_nnvjjf.*) AS annotation
from routes.flightconditioncircumstance_pt 
inner join routes.flightconditioncircumstance on routes.flightconditioncircumstance_pt.flightconditioncircumstance_id = routes.flightconditioncircumstance.id
left join master_join master_join_cvpwer on routes.flightconditioncircumstance.id = master_join_cvpwer.source_id
left join notes.note_view notes_note_view_nnvjjf on master_join_cvpwer.target_id = notes_note_view_nnvjjf.id
group by
    routes.flightconditioncircumstance_pt.id,
    routes.flightconditioncircumstance_pt.nilreason,
    routes.flightconditioncircumstance.referencelocation_value,
    routes.flightconditioncircumstance.referencelocation_nilreason,
    routes.flightconditioncircumstance.relationwithlocation_value,
    routes.flightconditioncircumstance.relationwithlocation_nilreason;
-- ['notes.note_view']
create or replace view routes.flightrestrictionlevel_view as
select
    routes.flightrestrictionlevel_pt.id,
    routes.flightrestrictionlevel_pt.nilreason AS flightrestrictionlevel_annotation,
    coalesce(cast(routes.flightrestrictionlevel.upperlevelreference_value as varchar), '(' || routes.flightrestrictionlevel.upperlevelreference_nilreason || ')') as upperlevelreference,
    coalesce(cast(routes.flightrestrictionlevel.lowerlevelreference_value as varchar), '(' || routes.flightrestrictionlevel.lowerlevelreference_nilreason || ')') as lowerlevelreference,
    coalesce(cast(routes.flightrestrictionlevel.upperlevel_value as varchar) || ' ' || routes.flightrestrictionlevel.upperlevel_uom, '(' || routes.flightrestrictionlevel.upperlevel_nilreason || ')') as upperlevel,
    coalesce(cast(routes.flightrestrictionlevel.lowerlevel_value as varchar) || ' ' || routes.flightrestrictionlevel.lowerlevel_uom, '(' || routes.flightrestrictionlevel.lowerlevel_nilreason || ')') as lowerlevel,
    jsonb_agg(notes_note_view_tynexn.*) AS annotation
from routes.flightrestrictionlevel_pt 
inner join routes.flightrestrictionlevel on routes.flightrestrictionlevel_pt.flightrestrictionlevel_id = routes.flightrestrictionlevel.id
left join master_join master_join_zruobt on routes.flightrestrictionlevel.id = master_join_zruobt.source_id
left join notes.note_view notes_note_view_tynexn on master_join_zruobt.target_id = notes_note_view_tynexn.id
group by
    routes.flightrestrictionlevel_pt.id,
    routes.flightrestrictionlevel_pt.nilreason,
    routes.flightrestrictionlevel.upperlevelreference_value,
    routes.flightrestrictionlevel.upperlevelreference_nilreason,
    routes.flightrestrictionlevel.lowerlevelreference_value,
    routes.flightrestrictionlevel.lowerlevelreference_nilreason,
    routes.flightrestrictionlevel.upperlevel_value,
    routes.flightrestrictionlevel.upperlevel_uom,
    routes.flightrestrictionlevel.upperlevel_nilreason,
    routes.flightrestrictionlevel.lowerlevel_value,
    routes.flightrestrictionlevel.lowerlevel_uom,
    routes.flightrestrictionlevel.lowerlevel_nilreason;
-- ['notes.note_view']
create or replace view service.fuel_view as
select
    service.fuel_pt.id,
    service.fuel_pt.nilreason AS fuel_annotation,
    coalesce(cast(service.fuel.category_value as varchar), '(' || service.fuel.category_nilreason || ')') as category,
    jsonb_agg(notes_note_view_mfynnc.*) AS annotation
from service.fuel_pt 
inner join service.fuel on service.fuel_pt.fuel_id = service.fuel.id
left join master_join master_join_gfgvze on service.fuel.id = master_join_gfgvze.source_id
left join notes.note_view notes_note_view_mfynnc on master_join_gfgvze.target_id = notes_note_view_mfynnc.id
group by
    service.fuel_pt.id,
    service.fuel_pt.nilreason,
    service.fuel.category_value,
    service.fuel.category_nilreason;
-- ['notes.note_view']
create or replace view holding.holdingpatterndistance_view as
select
    holding.holdingpatterndistance_pt.id,
    holding.holdingpatterndistance_pt.nilreason AS holdingpatterndistance_annotation,
    coalesce(cast(holding.holdingpatterndistance.length_value as varchar) || ' ' || holding.holdingpatterndistance.length_uom, '(' || holding.holdingpatterndistance.length_nilreason || ')') as length,
    jsonb_agg(notes_note_view_jhzbod.*) AS annotation
from holding.holdingpatterndistance_pt 
inner join holding.holdingpatterndistance on holding.holdingpatterndistance_pt.holdingpatterndistance_id = holding.holdingpatterndistance.id
left join master_join master_join_rrutwa on holding.holdingpatterndistance.id = master_join_rrutwa.source_id
left join notes.note_view notes_note_view_jhzbod on master_join_rrutwa.target_id = notes_note_view_jhzbod.id
group by
    holding.holdingpatterndistance_pt.id,
    holding.holdingpatterndistance_pt.nilreason,
    holding.holdingpatterndistance.length_value,
    holding.holdingpatterndistance.length_uom,
    holding.holdingpatterndistance.length_nilreason;
-- ['notes.note_view']
create or replace view holding.holdingpatternduration_view as
select
    holding.holdingpatternduration_pt.id,
    holding.holdingpatternduration_pt.nilreason AS holdingpatternduration_annotation,
    coalesce(cast(holding.holdingpatternduration.duration_value as varchar) || ' ' || holding.holdingpatternduration.duration_uom, '(' || holding.holdingpatternduration.duration_nilreason || ')') as duration,
    jsonb_agg(notes_note_view_uzofre.*) AS annotation
from holding.holdingpatternduration_pt 
inner join holding.holdingpatternduration on holding.holdingpatternduration_pt.holdingpatternduration_id = holding.holdingpatternduration.id
left join master_join master_join_drvxcm on holding.holdingpatternduration.id = master_join_drvxcm.source_id
left join notes.note_view notes_note_view_uzofre on master_join_drvxcm.target_id = notes_note_view_uzofre.id
group by
    holding.holdingpatternduration_pt.id,
    holding.holdingpatternduration_pt.nilreason,
    holding.holdingpatternduration.duration_value,
    holding.holdingpatternduration.duration_uom,
    holding.holdingpatternduration.duration_nilreason;
-- ['holding.holdingpattern_view', 'notes.note_view']
create or replace view procedure.holdinguse_view as
select
    procedure.holdinguse_pt.id,
    procedure.holdinguse_pt.nilreason AS holdinguse_annotation,
    coalesce(cast(procedure.holdinguse.holdinguse_value as varchar), '(' || procedure.holdinguse.holdinguse_nilreason || ')') as holdinguse,
    coalesce(cast(procedure.holdinguse.instruction_value as varchar), '(' || procedure.holdinguse.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.holdinguse.instructionaltitudereference_value as varchar), '(' || procedure.holdinguse.instructionaltitudereference_nilreason || ')') as instructionaltitudereference,
    coalesce(cast(procedure.holdinguse.instructedaltitude_value as varchar) || ' ' || procedure.holdinguse.instructedaltitude_uom, '(' || procedure.holdinguse.instructedaltitude_nilreason || ')') as instructedaltitude,
    coalesce(cast(holding_holdingpattern_view_jdpvwn.title as varchar), '(' || holding_holdingpattern_view_jdpvwn.nilreason[1] || ')') AS theholdingpattern,
    holding_holdingpattern_view_jdpvwn.href AS theholdingpattern_href,
    jsonb_agg(notes_note_view_apwywe.*) AS annotation
from procedure.holdinguse_pt 
inner join procedure.holdinguse on procedure.holdinguse_pt.holdinguse_id = procedure.holdinguse.id
left join holding.holdingpattern_view holding_holdingpattern_view_jdpvwn on procedure.holdinguse.theholdingpattern_id = holding_holdingpattern_view_jdpvwn.id
left join master_join master_join_ubemyp on procedure.holdinguse.id = master_join_ubemyp.source_id
left join notes.note_view notes_note_view_apwywe on master_join_ubemyp.target_id = notes_note_view_apwywe.id
group by
    procedure.holdinguse_pt.id,
    procedure.holdinguse_pt.nilreason,
    procedure.holdinguse.holdinguse_value,
    procedure.holdinguse.holdinguse_nilreason,
    procedure.holdinguse.instruction_value,
    procedure.holdinguse.instruction_nilreason,
    procedure.holdinguse.instructionaltitudereference_value,
    procedure.holdinguse.instructionaltitudereference_nilreason,
    procedure.holdinguse.instructedaltitude_value,
    procedure.holdinguse.instructedaltitude_uom,
    procedure.holdinguse.instructedaltitude_nilreason,
    holding_holdingpattern_view_jdpvwn.title,
    holding_holdingpattern_view_jdpvwn.nilreason[1],
    holding_holdingpattern_view_jdpvwn.href;
-- ['airport_heliport.runwaydirection_view', 'notes.note_view', 'airport_heliport.touchdownliftoff_view']
create or replace view procedure.landingtakeoffareacollection_view as
select
    procedure.landingtakeoffareacollection_pt.id,
    procedure.landingtakeoffareacollection_pt.nilreason AS landingtakeoffareacollection_annotation,
    jsonb_agg(airport_heliport_runwaydirection_view_gybsev.id) AS runway,
    jsonb_agg(airport_heliport_touchdownliftoff_view_xoqmpj.id) AS tlof,
    jsonb_agg(notes_note_view_ljaayx.*) AS annotation
from procedure.landingtakeoffareacollection_pt 
inner join procedure.landingtakeoffareacollection on procedure.landingtakeoffareacollection_pt.landingtakeoffareacollection_id = procedure.landingtakeoffareacollection.id
left join master_join master_join_qdwaux on procedure.landingtakeoffareacollection.id = master_join_qdwaux.source_id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_view_gybsev on master_join_qdwaux.target_id = airport_heliport_runwaydirection_view_gybsev.id
left join master_join master_join_oeqspr on procedure.landingtakeoffareacollection.id = master_join_oeqspr.source_id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_view_xoqmpj on master_join_oeqspr.target_id = airport_heliport_touchdownliftoff_view_xoqmpj.id
left join master_join master_join_yimdie on procedure.landingtakeoffareacollection.id = master_join_yimdie.source_id
left join notes.note_view notes_note_view_ljaayx on master_join_yimdie.target_id = notes_note_view_ljaayx.id
group by
    procedure.landingtakeoffareacollection_pt.id,
    procedure.landingtakeoffareacollection_pt.nilreason;
-- ['notes.note_view']
create or replace view airport_heliport.lightactivation_view as
select
    airport_heliport.lightactivation_pt.id,
    airport_heliport.lightactivation_pt.nilreason AS lightactivation_annotation,
    coalesce(cast(airport_heliport.lightactivation.clicks_value as varchar), '(' || airport_heliport.lightactivation.clicks_nilreason || ')') as clicks,
    coalesce(cast(airport_heliport.lightactivation.intensitylevel_value as varchar), '(' || airport_heliport.lightactivation.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.lightactivation.activation_value as varchar), '(' || airport_heliport.lightactivation.activation_nilreason || ')') as activation,
    jsonb_agg(notes_note_view_qnfzdo.*) AS annotation
from airport_heliport.lightactivation_pt 
inner join airport_heliport.lightactivation on airport_heliport.lightactivation_pt.lightactivation_id = airport_heliport.lightactivation.id
left join master_join master_join_mrarab on airport_heliport.lightactivation.id = master_join_mrarab.source_id
left join notes.note_view notes_note_view_qnfzdo on master_join_mrarab.target_id = notes_note_view_qnfzdo.id
group by
    airport_heliport.lightactivation_pt.id,
    airport_heliport.lightactivation_pt.nilreason,
    airport_heliport.lightactivation.clicks_value,
    airport_heliport.lightactivation.clicks_nilreason,
    airport_heliport.lightactivation.intensitylevel_value,
    airport_heliport.lightactivation.intensitylevel_nilreason,
    airport_heliport.lightactivation.activation_value,
    airport_heliport.lightactivation.activation_nilreason;
-- ['notes.note_view', 'geometry.elevatedpoint_view', 'geometry.elevatedcurve_view', 'geometry.elevatedsurface_view']
create or replace view airport_heliport.markingelement_view as
select
    airport_heliport.markingelement_pt.id,
    airport_heliport.markingelement_pt.nilreason AS markingelement_annotation,
    coalesce(cast(airport_heliport.markingelement.colour_value as varchar), '(' || airport_heliport.markingelement.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.markingelement.style_value as varchar), '(' || airport_heliport.markingelement.style_nilreason || ')') as style,
    geometry_elevatedsurface_view_aomnkk.geom AS geom,
    geometry_elevatedsurface_view_aomnkk.elevation,
    geometry_elevatedsurface_view_aomnkk.geoidUndulation,
    geometry_elevatedsurface_view_aomnkk.verticalDatum,
    geometry_elevatedsurface_view_aomnkk.verticalAccuracy,
    geometry_elevatedsurface_view_aomnkk.horizontalAccuracy,
    geometry_elevatedcurve_view_jpymzr.geom AS geom,
    geometry_elevatedcurve_view_jpymzr.elevation,
    geometry_elevatedcurve_view_jpymzr.geoidUndulation,
    geometry_elevatedcurve_view_jpymzr.verticalDatum,
    geometry_elevatedcurve_view_jpymzr.verticalAccuracy,
    geometry_elevatedcurve_view_jpymzr.horizontalAccuracy,
    geometry_elevatedpoint_view_ecgfzr.geom AS geom,
    ST_X(geometry_elevatedpoint_view_ecgfzr.geom) AS longitude,
    ST_Y(geometry_elevatedpoint_view_ecgfzr.geom) AS latitude,
    geometry_elevatedpoint_view_ecgfzr.elevation,
    geometry_elevatedpoint_view_ecgfzr.geoidUndulation,
    geometry_elevatedpoint_view_ecgfzr.verticalDatum,
    geometry_elevatedpoint_view_ecgfzr.verticalAccuracy,
    geometry_elevatedpoint_view_ecgfzr.horizontalAccuracy,
    jsonb_agg(notes_note_view_thidat.*) AS annotation
from airport_heliport.markingelement_pt 
inner join airport_heliport.markingelement on airport_heliport.markingelement_pt.markingelement_id = airport_heliport.markingelement.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_aomnkk on airport_heliport.markingelement.extent_surfaceextent_id = geometry_elevatedsurface_view_aomnkk.id
left join geometry.elevatedcurve_view geometry_elevatedcurve_view_jpymzr on airport_heliport.markingelement.extent_curveextent_id = geometry_elevatedcurve_view_jpymzr.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_ecgfzr on airport_heliport.markingelement.extent_location_id = geometry_elevatedpoint_view_ecgfzr.id
left join master_join master_join_yavvap on airport_heliport.markingelement.id = master_join_yavvap.source_id
left join notes.note_view notes_note_view_thidat on master_join_yavvap.target_id = notes_note_view_thidat.id
group by
    airport_heliport.markingelement_pt.id,
    airport_heliport.markingelement_pt.nilreason,
    airport_heliport.markingelement.colour_value,
    airport_heliport.markingelement.colour_nilreason,
    airport_heliport.markingelement.style_value,
    airport_heliport.markingelement.style_nilreason,
    geometry_elevatedsurface_view_aomnkk.geom,
    geometry_elevatedsurface_view_aomnkk.elevation,
    geometry_elevatedsurface_view_aomnkk.geoidUndulation,
    geometry_elevatedsurface_view_aomnkk.verticalDatum,
    geometry_elevatedsurface_view_aomnkk.verticalAccuracy,
    geometry_elevatedsurface_view_aomnkk.horizontalAccuracy,
    geometry_elevatedcurve_view_jpymzr.geom,
    geometry_elevatedcurve_view_jpymzr.elevation,
    geometry_elevatedcurve_view_jpymzr.geoidUndulation,
    geometry_elevatedcurve_view_jpymzr.verticalDatum,
    geometry_elevatedcurve_view_jpymzr.verticalAccuracy,
    geometry_elevatedcurve_view_jpymzr.horizontalAccuracy,
    geometry_elevatedpoint_view_ecgfzr.geom,
    geometry_elevatedpoint_view_ecgfzr.elevation,
    geometry_elevatedpoint_view_ecgfzr.geoidUndulation,
    geometry_elevatedpoint_view_ecgfzr.verticalDatum,
    geometry_elevatedpoint_view_ecgfzr.verticalAccuracy,
    geometry_elevatedpoint_view_ecgfzr.horizontalAccuracy;
-- ['notes.note_view']
create or replace view shared.meteorology_view as
select
    shared.meteorology_pt.id,
    shared.meteorology_pt.nilreason AS meteorology_annotation,
    coalesce(cast(shared.meteorology.flightconditions_value as varchar), '(' || shared.meteorology.flightconditions_nilreason || ')') as flightconditions,
    coalesce(cast(shared.meteorology.visibilityinterpretation_value as varchar), '(' || shared.meteorology.visibilityinterpretation_nilreason || ')') as visibilityinterpretation,
    coalesce(cast(shared.meteorology.runwayvisualrangeinterpretation_value as varchar), '(' || shared.meteorology.runwayvisualrangeinterpretation_nilreason || ')') as runwayvisualrangeinterpretation,
    coalesce(cast(shared.meteorology.visibility_value as varchar) || ' ' || shared.meteorology.visibility_uom, '(' || shared.meteorology.visibility_nilreason || ')') as visibility,
    coalesce(cast(shared.meteorology.runwayvisualrange_value as varchar) || ' ' || shared.meteorology.runwayvisualrange_uom, '(' || shared.meteorology.runwayvisualrange_nilreason || ')') as runwayvisualrange,
    jsonb_agg(notes_note_view_sdopol.*) AS annotation
from shared.meteorology_pt 
inner join shared.meteorology on shared.meteorology_pt.meteorology_id = shared.meteorology.id
left join master_join master_join_pahwka on shared.meteorology.id = master_join_pahwka.source_id
left join notes.note_view notes_note_view_sdopol on master_join_pahwka.target_id = notes_note_view_sdopol.id
group by
    shared.meteorology_pt.id,
    shared.meteorology_pt.nilreason,
    shared.meteorology.flightconditions_value,
    shared.meteorology.flightconditions_nilreason,
    shared.meteorology.visibilityinterpretation_value,
    shared.meteorology.visibilityinterpretation_nilreason,
    shared.meteorology.runwayvisualrangeinterpretation_value,
    shared.meteorology.runwayvisualrangeinterpretation_nilreason,
    shared.meteorology.visibility_value,
    shared.meteorology.visibility_uom,
    shared.meteorology.visibility_nilreason,
    shared.meteorology.runwayvisualrange_value,
    shared.meteorology.runwayvisualrange_uom,
    shared.meteorology.runwayvisualrange_nilreason;
-- ['notes.note_view', 'airport_heliport.altimetersource_view']
create or replace view procedure.missedapproachgroup_view as
select
    procedure.missedapproachgroup_pt.id,
    procedure.missedapproachgroup_pt.nilreason AS missedapproachgroup_annotation,
    coalesce(cast(procedure.missedapproachgroup.instruction_value as varchar), '(' || procedure.missedapproachgroup.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.missedapproachgroup.alternateclimbinstruction_value as varchar), '(' || procedure.missedapproachgroup.alternateclimbinstruction_nilreason || ')') as alternateclimbinstruction,
    coalesce(cast(procedure.missedapproachgroup.alternateclimbaltitude_value as varchar) || ' ' || procedure.missedapproachgroup.alternateclimbaltitude_uom, '(' || procedure.missedapproachgroup.alternateclimbaltitude_nilreason || ')') as alternateclimbaltitude,
    jsonb_agg(airport_heliport_altimetersource_view_kpdttq.id) AS altimeter,
    jsonb_agg(notes_note_view_trohfm.*) AS annotation
from procedure.missedapproachgroup_pt 
inner join procedure.missedapproachgroup on procedure.missedapproachgroup_pt.missedapproachgroup_id = procedure.missedapproachgroup.id
left join master_join master_join_ruupkd on procedure.missedapproachgroup.id = master_join_ruupkd.source_id
left join airport_heliport.altimetersource_pt airport_heliport_altimetersource_view_kpdttq on master_join_ruupkd.target_id = airport_heliport_altimetersource_view_kpdttq.id
left join master_join master_join_shwjpu on procedure.missedapproachgroup.id = master_join_shwjpu.source_id
left join notes.note_view notes_note_view_trohfm on master_join_shwjpu.target_id = notes_note_view_trohfm.id
group by
    procedure.missedapproachgroup_pt.id,
    procedure.missedapproachgroup_pt.nilreason,
    procedure.missedapproachgroup.instruction_value,
    procedure.missedapproachgroup.instruction_nilreason,
    procedure.missedapproachgroup.alternateclimbinstruction_value,
    procedure.missedapproachgroup.alternateclimbinstruction_nilreason,
    procedure.missedapproachgroup.alternateclimbaltitude_value,
    procedure.missedapproachgroup.alternateclimbaltitude_uom,
    procedure.missedapproachgroup.alternateclimbaltitude_nilreason;
-- ['notes.note_view']
create or replace view navaids_points.navaidcomponent_view as
select
    navaids_points.navaidcomponent_pt.id,
    navaids_points.navaidcomponent_pt.nilreason AS navaidcomponent_annotation,
    coalesce(cast(navaids_points.navaidcomponent.collocationgroup_value as varchar), '(' || navaids_points.navaidcomponent.collocationgroup_nilreason || ')') as collocationgroup,
    coalesce(cast(navaids_points.navaidcomponent.markerposition_value as varchar), '(' || navaids_points.navaidcomponent.markerposition_nilreason || ')') as markerposition,
    coalesce(cast(navaids_points.navaidcomponent.providesnavigablelocation_value as varchar), '(' || navaids_points.navaidcomponent.providesnavigablelocation_nilreason || ')') as providesnavigablelocation,
    jsonb_agg(notes_note_view_xerqnu.*) AS annotation
from navaids_points.navaidcomponent_pt 
inner join navaids_points.navaidcomponent on navaids_points.navaidcomponent_pt.navaidcomponent_id = navaids_points.navaidcomponent.id
left join master_join master_join_zxetpi on navaids_points.navaidcomponent.id = master_join_zxetpi.source_id
left join notes.note_view notes_note_view_xerqnu on master_join_zxetpi.target_id = notes_note_view_xerqnu.id
group by
    navaids_points.navaidcomponent_pt.id,
    navaids_points.navaidcomponent_pt.nilreason,
    navaids_points.navaidcomponent.collocationgroup_value,
    navaids_points.navaidcomponent.collocationgroup_nilreason,
    navaids_points.navaidcomponent.markerposition_value,
    navaids_points.navaidcomponent.markerposition_nilreason,
    navaids_points.navaidcomponent.providesnavigablelocation_value,
    navaids_points.navaidcomponent.providesnavigablelocation_nilreason;
-- ['notes.note_view']
create or replace view airport_heliport.navaidequipmentdistance_view as
select
    airport_heliport.navaidequipmentdistance_pt.id,
    airport_heliport.navaidequipmentdistance_pt.nilreason AS navaidequipmentdistance_annotation,
    coalesce(cast(airport_heliport.navaidequipmentdistance.distance_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance.distance_uom, '(' || airport_heliport.navaidequipmentdistance.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.navaidequipmentdistance.distanceaccuracy_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance.distanceaccuracy_uom, '(' || airport_heliport.navaidequipmentdistance.distanceaccuracy_nilreason || ')') as distanceaccuracy,
    jsonb_agg(notes_note_view_yivfxr.*) AS annotation
from airport_heliport.navaidequipmentdistance_pt 
inner join airport_heliport.navaidequipmentdistance on airport_heliport.navaidequipmentdistance_pt.navaidequipmentdistance_id = airport_heliport.navaidequipmentdistance.id
left join master_join master_join_enjzop on airport_heliport.navaidequipmentdistance.id = master_join_enjzop.source_id
left join notes.note_view notes_note_view_yivfxr on master_join_enjzop.target_id = notes_note_view_yivfxr.id
group by
    airport_heliport.navaidequipmentdistance_pt.id,
    airport_heliport.navaidequipmentdistance_pt.nilreason,
    airport_heliport.navaidequipmentdistance.distance_value,
    airport_heliport.navaidequipmentdistance.distance_uom,
    airport_heliport.navaidequipmentdistance.distance_nilreason,
    airport_heliport.navaidequipmentdistance.distanceaccuracy_value,
    airport_heliport.navaidequipmentdistance.distanceaccuracy_uom,
    airport_heliport.navaidequipmentdistance.distanceaccuracy_nilreason;
-- ['notes.note_view']
create or replace view service.nitrogen_view as
select
    service.nitrogen_pt.id,
    service.nitrogen_pt.nilreason AS nitrogen_annotation,
    coalesce(cast(service.nitrogen.type_value as varchar), '(' || service.nitrogen.type_nilreason || ')') as type,
    jsonb_agg(notes_note_view_oaldan.*) AS annotation
from service.nitrogen_pt 
inner join service.nitrogen on service.nitrogen_pt.nitrogen_id = service.nitrogen.id
left join master_join master_join_xgzeok on service.nitrogen.id = master_join_xgzeok.source_id
left join notes.note_view notes_note_view_oaldan on master_join_xgzeok.target_id = notes_note_view_oaldan.id
group by
    service.nitrogen_pt.id,
    service.nitrogen_pt.nilreason,
    service.nitrogen.type_value,
    service.nitrogen.type_nilreason;
-- ['notes.note_view']
create or replace view shared.obstacleplacement_view as
select
    shared.obstacleplacement_pt.id,
    shared.obstacleplacement_pt.nilreason AS obstacleplacement_annotation,
    coalesce(cast(shared.obstacleplacement.obstaclebearing_value as varchar), '(' || shared.obstacleplacement.obstaclebearing_nilreason || ')') as obstaclebearing,
    coalesce(cast(shared.obstacleplacement.pointtype_value as varchar), '(' || shared.obstacleplacement.pointtype_nilreason || ')') as pointtype,
    coalesce(cast(shared.obstacleplacement.obstacleplacement_value as varchar), '(' || shared.obstacleplacement.obstacleplacement_nilreason || ')') as obstacleplacement,
    coalesce(cast(shared.obstacleplacement.obstacledistance_value as varchar) || ' ' || shared.obstacleplacement.obstacledistance_uom, '(' || shared.obstacleplacement.obstacledistance_nilreason || ')') as obstacledistance,
    jsonb_agg(notes_note_view_jewpcr.*) AS annotation
from shared.obstacleplacement_pt 
inner join shared.obstacleplacement on shared.obstacleplacement_pt.obstacleplacement_id = shared.obstacleplacement.id
left join master_join master_join_mvmmpr on shared.obstacleplacement.id = master_join_mvmmpr.source_id
left join notes.note_view notes_note_view_jewpcr on master_join_mvmmpr.target_id = notes_note_view_jewpcr.id
group by
    shared.obstacleplacement_pt.id,
    shared.obstacleplacement_pt.nilreason,
    shared.obstacleplacement.obstaclebearing_value,
    shared.obstacleplacement.obstaclebearing_nilreason,
    shared.obstacleplacement.pointtype_value,
    shared.obstacleplacement.pointtype_nilreason,
    shared.obstacleplacement.obstacleplacement_value,
    shared.obstacleplacement.obstacleplacement_nilreason,
    shared.obstacleplacement.obstacledistance_value,
    shared.obstacleplacement.obstacledistance_uom,
    shared.obstacleplacement.obstacledistance_nilreason;
-- ['notes.note_view']
create or replace view service.oil_view as
select
    service.oil_pt.id,
    service.oil_pt.nilreason AS oil_annotation,
    coalesce(cast(service.oil.category_value as varchar), '(' || service.oil.category_nilreason || ')') as category,
    jsonb_agg(notes_note_view_fbcgdu.*) AS annotation
from service.oil_pt 
inner join service.oil on service.oil_pt.oil_id = service.oil.id
left join master_join master_join_aiayfz on service.oil.id = master_join_aiayfz.source_id
left join notes.note_view notes_note_view_fbcgdu on master_join_aiayfz.target_id = notes_note_view_fbcgdu.id
group by
    service.oil_pt.id,
    service.oil_pt.nilreason,
    service.oil.category_value,
    service.oil.category_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view']
create or replace view organisation.organisationauthorityassociation_view as
select
    organisation.organisationauthorityassociation_pt.id,
    organisation.organisationauthorityassociation_pt.nilreason AS organisationauthorityassociation_annotation,
    coalesce(cast(organisation.organisationauthorityassociation.type_value as varchar), '(' || organisation.organisationauthorityassociation.type_nilreason || ')') as type,
    jsonb_agg(notes_note_view_pphujx.*) AS annotation
from organisation.organisationauthorityassociation_pt 
inner join organisation.organisationauthorityassociation on organisation.organisationauthorityassociation_pt.organisationauthorityassociation_id = organisation.organisationauthorityassociation.id
left join organisation.organisationauthority_view organisation_organisationauthority_view_nqysyp on organisation.organisationauthorityassociation.theorganisationauthority_id = organisation_organisationauthority_view_nqysyp.id
left join master_join master_join_iqmdzp on organisation.organisationauthorityassociation.id = master_join_iqmdzp.source_id
left join notes.note_view notes_note_view_pphujx on master_join_iqmdzp.target_id = notes_note_view_pphujx.id
group by
    organisation.organisationauthorityassociation_pt.id,
    organisation.organisationauthorityassociation_pt.nilreason,
    organisation.organisationauthorityassociation.type_value,
    organisation.organisationauthorityassociation.type_nilreason;
-- ['notes.note_view']
create or replace view service.oxygen_view as
select
    service.oxygen_pt.id,
    service.oxygen_pt.nilreason AS oxygen_annotation,
    coalesce(cast(service.oxygen.type_value as varchar), '(' || service.oxygen.type_nilreason || ')') as type,
    jsonb_agg(notes_note_view_ioxqlk.*) AS annotation
from service.oxygen_pt 
inner join service.oxygen on service.oxygen_pt.oxygen_id = service.oxygen.id
left join master_join master_join_cvgasr on service.oxygen.id = master_join_cvgasr.source_id
left join notes.note_view notes_note_view_ioxqlk on master_join_cvgasr.target_id = notes_note_view_ioxqlk.id
group by
    service.oxygen_pt.id,
    service.oxygen_pt.nilreason,
    service.oxygen.type_value,
    service.oxygen.type_nilreason;
-- ['notes.note_view']
create or replace view procedure.proceduretransitionleg_view as
select
    procedure.proceduretransitionleg_pt.id,
    procedure.proceduretransitionleg_pt.nilreason AS proceduretransitionleg_annotation,
    coalesce(cast(procedure.proceduretransitionleg.seqnumberarinc_value as varchar), '(' || procedure.proceduretransitionleg.seqnumberarinc_nilreason || ')') as seqnumberarinc,
    jsonb_agg(notes_note_view_uufsub.*) AS annotation
from procedure.proceduretransitionleg_pt 
inner join procedure.proceduretransitionleg on procedure.proceduretransitionleg_pt.proceduretransitionleg_id = procedure.proceduretransitionleg.id
left join master_join master_join_gwibas on procedure.proceduretransitionleg.id = master_join_gwibas.source_id
left join notes.note_view notes_note_view_uufsub on master_join_gwibas.target_id = notes_note_view_uufsub.id
group by
    procedure.proceduretransitionleg_pt.id,
    procedure.proceduretransitionleg_pt.nilreason,
    procedure.proceduretransitionleg.seqnumberarinc_value,
    procedure.proceduretransitionleg.seqnumberarinc_nilreason;
-- ['notes.note_view']
create or replace view surveillance.radarcomponent_view as
select
    surveillance.radarcomponent_pt.id,
    surveillance.radarcomponent_pt.nilreason AS radarcomponent_annotation,
    coalesce(cast(surveillance.radarcomponent.collocationgroup_value as varchar), '(' || surveillance.radarcomponent.collocationgroup_nilreason || ')') as collocationgroup,
    jsonb_agg(notes_note_view_puzaag.*) AS annotation
from surveillance.radarcomponent_pt 
inner join surveillance.radarcomponent on surveillance.radarcomponent_pt.radarcomponent_id = surveillance.radarcomponent.id
left join master_join master_join_dkkxax on surveillance.radarcomponent.id = master_join_dkkxax.source_id
left join notes.note_view notes_note_view_puzaag on master_join_dkkxax.target_id = notes_note_view_puzaag.id
group by
    surveillance.radarcomponent_pt.id,
    surveillance.radarcomponent_pt.nilreason,
    surveillance.radarcomponent.collocationgroup_value,
    surveillance.radarcomponent.collocationgroup_nilreason;
-- ['notes.note_view', 'geometry.elevatedpoint_view']
create or replace view surveillance.reflector_view as
select
    surveillance.reflector_pt.id,
    surveillance.reflector_pt.nilreason AS reflector_annotation,
    coalesce(cast(surveillance.reflector.type_value as varchar), '(' || surveillance.reflector.type_nilreason || ')') as type,
    geometry_elevatedpoint_view_lgrumc.geom AS geom,
    ST_X(geometry_elevatedpoint_view_lgrumc.geom) AS longitude,
    ST_Y(geometry_elevatedpoint_view_lgrumc.geom) AS latitude,
    geometry_elevatedpoint_view_lgrumc.elevation,
    geometry_elevatedpoint_view_lgrumc.geoidUndulation,
    geometry_elevatedpoint_view_lgrumc.verticalDatum,
    geometry_elevatedpoint_view_lgrumc.verticalAccuracy,
    geometry_elevatedpoint_view_lgrumc.horizontalAccuracy,
    jsonb_agg(notes_note_view_homwov.*) AS annotation
from surveillance.reflector_pt 
inner join surveillance.reflector on surveillance.reflector_pt.reflector_id = surveillance.reflector.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_lgrumc on surveillance.reflector.touchdownreflector_id = geometry_elevatedpoint_view_lgrumc.id
left join master_join master_join_mldscd on surveillance.reflector.id = master_join_mldscd.source_id
left join notes.note_view notes_note_view_homwov on master_join_mldscd.target_id = notes_note_view_homwov.id
group by
    surveillance.reflector_pt.id,
    surveillance.reflector_pt.nilreason,
    surveillance.reflector.type_value,
    surveillance.reflector.type_nilreason,
    geometry_elevatedpoint_view_lgrumc.geom,
    geometry_elevatedpoint_view_lgrumc.elevation,
    geometry_elevatedpoint_view_lgrumc.geoidUndulation,
    geometry_elevatedpoint_view_lgrumc.verticalDatum,
    geometry_elevatedpoint_view_lgrumc.verticalAccuracy,
    geometry_elevatedpoint_view_lgrumc.horizontalAccuracy;
-- ['notes.note_view']
create or replace view airport_heliport.ridge_view as
select
    airport_heliport.ridge_pt.id,
    airport_heliport.ridge_pt.nilreason AS ridge_annotation,
    coalesce(cast(airport_heliport.ridge.side_value as varchar), '(' || airport_heliport.ridge.side_nilreason || ')') as side,
    coalesce(cast(airport_heliport.ridge.distance_value as varchar) || ' ' || airport_heliport.ridge.distance_uom, '(' || airport_heliport.ridge.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.ridge.depth_value as varchar) || ' ' || airport_heliport.ridge.depth_uom, '(' || airport_heliport.ridge.depth_nilreason || ')') as depth,
    jsonb_agg(notes_note_view_hgvirh.*) AS annotation
from airport_heliport.ridge_pt 
inner join airport_heliport.ridge on airport_heliport.ridge_pt.ridge_id = airport_heliport.ridge.id
left join master_join master_join_yojotf on airport_heliport.ridge.id = master_join_yojotf.source_id
left join notes.note_view notes_note_view_hgvirh on master_join_yojotf.target_id = notes_note_view_hgvirh.id
group by
    airport_heliport.ridge_pt.id,
    airport_heliport.ridge_pt.nilreason,
    airport_heliport.ridge.side_value,
    airport_heliport.ridge.side_nilreason,
    airport_heliport.ridge.distance_value,
    airport_heliport.ridge.distance_uom,
    airport_heliport.ridge.distance_nilreason,
    airport_heliport.ridge.depth_value,
    airport_heliport.ridge.depth_uom,
    airport_heliport.ridge.depth_nilreason;
-- ['geometry.point_view', 'airport_heliport.runwaycentrelinepoint_view', 'airport_heliport.airportheliport_view', 'airport_heliport.touchdownliftoff_view', 'navaids_points.navaid_view', 'notes.note_view', 'routes.route_view', 'navaids_points.designatedpoint_view']
create or replace view routes.routeportion_view as
select
    routes.routeportion_pt.id,
    routes.routeportion_pt.nilreason AS routeportion_annotation,
    coalesce(cast(navaids_points_designatedpoint_view_rfakam.title as varchar), '(' || navaids_points_designatedpoint_view_rfakam.nilreason[1] || ')') AS startfixdesignatedpoint,
    navaids_points_designatedpoint_view_rfakam.href AS startfixdesignatedpoint_href,
    coalesce(cast(navaids_points_designatedpoint_view_ousnfl.title as varchar), '(' || navaids_points_designatedpoint_view_ousnfl.nilreason[1] || ')') AS intermediatepointfixdesignatedpoint,
    navaids_points_designatedpoint_view_ousnfl.href AS intermediatepointfixdesignatedpoint_href,
    coalesce(cast(navaids_points_designatedpoint_view_owtxzw.title as varchar), '(' || navaids_points_designatedpoint_view_owtxzw.nilreason[1] || ')') AS endfixdesignatedpoint,
    navaids_points_designatedpoint_view_owtxzw.href AS endfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_view_ygpwrq.title as varchar), '(' || navaids_points_navaid_view_ygpwrq.nilreason[1] || ')') AS startnavaidsystem,
    navaids_points_navaid_view_ygpwrq.href AS startnavaidsystem_href,
    coalesce(cast(navaids_points_navaid_view_cxtbct.title as varchar), '(' || navaids_points_navaid_view_cxtbct.nilreason[1] || ')') AS intermediatepointnavaidsystem,
    navaids_points_navaid_view_cxtbct.href AS intermediatepointnavaidsystem_href,
    coalesce(cast(navaids_points_navaid_view_glvezg.title as varchar), '(' || navaids_points_navaid_view_glvezg.nilreason[1] || ')') AS endnavaidsystem,
    navaids_points_navaid_view_glvezg.href AS endnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_bxdstm.title as varchar), '(' || airport_heliport_touchdownliftoff_view_bxdstm.nilreason[1] || ')') AS startaimingpoint,
    airport_heliport_touchdownliftoff_view_bxdstm.href AS startaimingpoint_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_mvjqjq.title as varchar), '(' || airport_heliport_touchdownliftoff_view_mvjqjq.nilreason[1] || ')') AS intermediatepointaimingpoint,
    airport_heliport_touchdownliftoff_view_mvjqjq.href AS intermediatepointaimingpoint_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_mpwwpl.title as varchar), '(' || airport_heliport_touchdownliftoff_view_mpwwpl.nilreason[1] || ')') AS endaimingpoint,
    airport_heliport_touchdownliftoff_view_mpwwpl.href AS endaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_txihau.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_txihau.nilreason[1] || ')') AS startrunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_txihau.href AS startrunwaypoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_naqtdy.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_naqtdy.nilreason[1] || ')') AS intermediatepointrunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_naqtdy.href AS intermediatepointrunwaypoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_gmlfck.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_gmlfck.nilreason[1] || ')') AS endrunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_gmlfck.href AS endrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_ffszwy.title as varchar), '(' || airport_heliport_airportheliport_view_ffszwy.nilreason[1] || ')') AS startairportreferencepoint,
    airport_heliport_airportheliport_view_ffszwy.href AS startairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_aolive.title as varchar), '(' || airport_heliport_airportheliport_view_aolive.nilreason[1] || ')') AS intermediatepointairportreferencepoint,
    airport_heliport_airportheliport_view_aolive.href AS intermediatepointairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_fovtyu.title as varchar), '(' || airport_heliport_airportheliport_view_fovtyu.nilreason[1] || ')') AS endairportreferencepoint,
    airport_heliport_airportheliport_view_fovtyu.href AS endairportreferencepoint_href,
    geometry_point_view_werdbn.geom AS geom,
    ST_X(geometry_point_view_werdbn.geom) AS longitude,
    ST_Y(geometry_point_view_werdbn.geom) AS latitude,
    geometry_point_view_werdbn.horizontalAccuracy,
    geometry_point_view_pzvvvc.geom AS geom,
    ST_X(geometry_point_view_pzvvvc.geom) AS longitude,
    ST_Y(geometry_point_view_pzvvvc.geom) AS latitude,
    geometry_point_view_pzvvvc.horizontalAccuracy,
    geometry_point_view_kuuvbj.geom AS geom,
    ST_X(geometry_point_view_kuuvbj.geom) AS longitude,
    ST_Y(geometry_point_view_kuuvbj.geom) AS latitude,
    geometry_point_view_kuuvbj.horizontalAccuracy,
    coalesce(cast(routes_route_view_cinjsn.title as varchar), '(' || routes_route_view_cinjsn.nilreason[1] || ')') AS referencedroute,
    routes_route_view_cinjsn.href AS referencedroute_href,
    jsonb_agg(notes_note_view_uwouay.*) AS annotation
from routes.routeportion_pt 
inner join routes.routeportion on routes.routeportion_pt.routeportion_id = routes.routeportion.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_rfakam on routes.routeportion.start_fixdesignatedpoint_id = navaids_points_designatedpoint_view_rfakam.id
left join navaids_points.navaid_view navaids_points_navaid_view_ygpwrq on routes.routeportion.start_navaidsystem_id = navaids_points_navaid_view_ygpwrq.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_bxdstm on routes.routeportion.start_aimingpoint_id = airport_heliport_touchdownliftoff_view_bxdstm.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_txihau on routes.routeportion.start_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_txihau.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_ffszwy on routes.routeportion.start_airportreferencepoint_id = airport_heliport_airportheliport_view_ffszwy.id
left join geometry.point_view geometry_point_view_werdbn on routes.routeportion.start_position_id = geometry_point_view_werdbn.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_ousnfl on routes.routeportion.intermediatepoint_fixdesignatedpoint_id = navaids_points_designatedpoint_view_ousnfl.id
left join navaids_points.navaid_view navaids_points_navaid_view_cxtbct on routes.routeportion.intermediatepoint_navaidsystem_id = navaids_points_navaid_view_cxtbct.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_mvjqjq on routes.routeportion.intermediatepoint_aimingpoint_id = airport_heliport_touchdownliftoff_view_mvjqjq.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_naqtdy on routes.routeportion.intermediatepoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_naqtdy.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_aolive on routes.routeportion.intermediatepoint_airportreferencepoint_id = airport_heliport_airportheliport_view_aolive.id
left join geometry.point_view geometry_point_view_pzvvvc on routes.routeportion.intermediatepoint_position_id = geometry_point_view_pzvvvc.id
left join routes.route_view routes_route_view_cinjsn on routes.routeportion.referencedroute_id = routes_route_view_cinjsn.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_owtxzw on routes.routeportion.end_fixdesignatedpoint_id = navaids_points_designatedpoint_view_owtxzw.id
left join navaids_points.navaid_view navaids_points_navaid_view_glvezg on routes.routeportion.end_navaidsystem_id = navaids_points_navaid_view_glvezg.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_mpwwpl on routes.routeportion.end_aimingpoint_id = airport_heliport_touchdownliftoff_view_mpwwpl.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_gmlfck on routes.routeportion.end_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_gmlfck.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_fovtyu on routes.routeportion.end_airportreferencepoint_id = airport_heliport_airportheliport_view_fovtyu.id
left join geometry.point_view geometry_point_view_kuuvbj on routes.routeportion.end_position_id = geometry_point_view_kuuvbj.id
left join master_join master_join_qpikgd on routes.routeportion.id = master_join_qpikgd.source_id
left join notes.note_view notes_note_view_uwouay on master_join_qpikgd.target_id = notes_note_view_uwouay.id
group by
    routes.routeportion_pt.id,
    routes.routeportion_pt.nilreason,
    navaids_points_designatedpoint_view_rfakam.title,
    navaids_points_designatedpoint_view_rfakam.nilreason[1],
    navaids_points_designatedpoint_view_rfakam.href,
    navaids_points_navaid_view_ygpwrq.title,
    navaids_points_navaid_view_ygpwrq.nilreason[1],
    navaids_points_navaid_view_ygpwrq.href,
    airport_heliport_touchdownliftoff_view_bxdstm.title,
    airport_heliport_touchdownliftoff_view_bxdstm.nilreason[1],
    airport_heliport_touchdownliftoff_view_bxdstm.href,
    airport_heliport_runwaycentrelinepoint_view_txihau.title,
    airport_heliport_runwaycentrelinepoint_view_txihau.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_txihau.href,
    airport_heliport_airportheliport_view_ffszwy.title,
    airport_heliport_airportheliport_view_ffszwy.nilreason[1],
    airport_heliport_airportheliport_view_ffszwy.href,
    geometry_point_view_werdbn.geom,
    geometry_point_view_werdbn.horizontalAccuracy,
    navaids_points_designatedpoint_view_ousnfl.title,
    navaids_points_designatedpoint_view_ousnfl.nilreason[1],
    navaids_points_designatedpoint_view_ousnfl.href,
    navaids_points_navaid_view_cxtbct.title,
    navaids_points_navaid_view_cxtbct.nilreason[1],
    navaids_points_navaid_view_cxtbct.href,
    airport_heliport_touchdownliftoff_view_mvjqjq.title,
    airport_heliport_touchdownliftoff_view_mvjqjq.nilreason[1],
    airport_heliport_touchdownliftoff_view_mvjqjq.href,
    airport_heliport_runwaycentrelinepoint_view_naqtdy.title,
    airport_heliport_runwaycentrelinepoint_view_naqtdy.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_naqtdy.href,
    airport_heliport_airportheliport_view_aolive.title,
    airport_heliport_airportheliport_view_aolive.nilreason[1],
    airport_heliport_airportheliport_view_aolive.href,
    geometry_point_view_pzvvvc.geom,
    geometry_point_view_pzvvvc.horizontalAccuracy,
    routes_route_view_cinjsn.title,
    routes_route_view_cinjsn.nilreason[1],
    routes_route_view_cinjsn.href,
    navaids_points_designatedpoint_view_owtxzw.title,
    navaids_points_designatedpoint_view_owtxzw.nilreason[1],
    navaids_points_designatedpoint_view_owtxzw.href,
    navaids_points_navaid_view_glvezg.title,
    navaids_points_navaid_view_glvezg.nilreason[1],
    navaids_points_navaid_view_glvezg.href,
    airport_heliport_touchdownliftoff_view_mpwwpl.title,
    airport_heliport_touchdownliftoff_view_mpwwpl.nilreason[1],
    airport_heliport_touchdownliftoff_view_mpwwpl.href,
    airport_heliport_runwaycentrelinepoint_view_gmlfck.title,
    airport_heliport_runwaycentrelinepoint_view_gmlfck.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_gmlfck.href,
    airport_heliport_airportheliport_view_fovtyu.title,
    airport_heliport_airportheliport_view_fovtyu.nilreason[1],
    airport_heliport_airportheliport_view_fovtyu.href,
    geometry_point_view_kuuvbj.geom,
    geometry_point_view_kuuvbj.horizontalAccuracy;
-- ['notes.note_view']
create or replace view procedure.sectordesign_view as
select
    procedure.sectordesign_pt.id,
    procedure.sectordesign_pt.nilreason AS sectordesign_annotation,
    coalesce(cast(procedure.sectordesign.turndirection_value as varchar), '(' || procedure.sectordesign.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.sectordesign.designgradient_value as varchar), '(' || procedure.sectordesign.designgradient_nilreason || ')') as designgradient,
    coalesce(cast(procedure.sectordesign.turnpermitted_value as varchar), '(' || procedure.sectordesign.turnpermitted_nilreason || ')') as turnpermitted,
    coalesce(cast(procedure.sectordesign.terminationaltitude_value as varchar) || ' ' || procedure.sectordesign.terminationaltitude_uom, '(' || procedure.sectordesign.terminationaltitude_nilreason || ')') as terminationaltitude,
    jsonb_agg(notes_note_view_qmrrqk.*) AS annotation
from procedure.sectordesign_pt 
inner join procedure.sectordesign on procedure.sectordesign_pt.sectordesign_id = procedure.sectordesign.id
left join master_join master_join_aogqme on procedure.sectordesign.id = master_join_aogqme.source_id
left join notes.note_view notes_note_view_qmrrqk on master_join_aogqme.target_id = notes_note_view_qmrrqk.id
group by
    procedure.sectordesign_pt.id,
    procedure.sectordesign_pt.nilreason,
    procedure.sectordesign.turndirection_value,
    procedure.sectordesign.turndirection_nilreason,
    procedure.sectordesign.designgradient_value,
    procedure.sectordesign.designgradient_nilreason,
    procedure.sectordesign.turnpermitted_value,
    procedure.sectordesign.turnpermitted_nilreason,
    procedure.sectordesign.terminationaltitude_value,
    procedure.sectordesign.terminationaltitude_uom,
    procedure.sectordesign.terminationaltitude_nilreason;
-- ['notes.note_view']
create or replace view shared.standardlevel_view as
select
    shared.standardlevel_pt.id,
    shared.standardlevel_pt.nilreason AS standardlevel_annotation,
    coalesce(cast(shared.standardlevel.verticaldistance_value as varchar) || ' ' || shared.standardlevel.verticaldistance_uom, '(' || shared.standardlevel.verticaldistance_nilreason || ')') as verticaldistance,
    jsonb_agg(notes_note_view_zlvdbq.*) AS annotation
from shared.standardlevel_pt 
inner join shared.standardlevel on shared.standardlevel_pt.standardlevel_id = shared.standardlevel.id
left join master_join master_join_iaitjr on shared.standardlevel.id = master_join_iaitjr.source_id
left join notes.note_view notes_note_view_zlvdbq on master_join_iaitjr.target_id = notes_note_view_zlvdbq.id
group by
    shared.standardlevel_pt.id,
    shared.standardlevel_pt.nilreason,
    shared.standardlevel.verticaldistance_value,
    shared.standardlevel.verticaldistance_uom,
    shared.standardlevel.verticaldistance_nilreason;
-- ['notes.note_view']
create or replace view airport_heliport.surfacecharacteristics_view as
select
    airport_heliport.surfacecharacteristics_pt.id,
    airport_heliport.surfacecharacteristics_pt.nilreason AS surfacecharacteristics_annotation,
    coalesce(cast(airport_heliport.surfacecharacteristics.composition_value as varchar), '(' || airport_heliport.surfacecharacteristics.composition_nilreason || ')') as composition,
    coalesce(cast(airport_heliport.surfacecharacteristics.preparation_value as varchar), '(' || airport_heliport.surfacecharacteristics.preparation_nilreason || ')') as preparation,
    coalesce(cast(airport_heliport.surfacecharacteristics.surfacecondition_value as varchar), '(' || airport_heliport.surfacecharacteristics.surfacecondition_nilreason || ')') as surfacecondition,
    coalesce(cast(airport_heliport.surfacecharacteristics.classpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.classpcn_nilreason || ')') as classpcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.pavementtypepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.pavementtypepcn_nilreason || ')') as pavementtypepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.pavementsubgradepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.pavementsubgradepcn_nilreason || ')') as pavementsubgradepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.maxtyrepressurepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.maxtyrepressurepcn_nilreason || ')') as maxtyrepressurepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.evaluationmethodpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.evaluationmethodpcn_nilreason || ')') as evaluationmethodpcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.classlcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.classlcn_nilreason || ')') as classlcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.weightsiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.weightsiwl_uom, '(' || airport_heliport.surfacecharacteristics.weightsiwl_nilreason || ')') as weightsiwl,
    coalesce(cast(airport_heliport.surfacecharacteristics.tyrepressuresiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.tyrepressuresiwl_uom, '(' || airport_heliport.surfacecharacteristics.tyrepressuresiwl_nilreason || ')') as tyrepressuresiwl,
    coalesce(cast(airport_heliport.surfacecharacteristics.weightauw_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.weightauw_uom, '(' || airport_heliport.surfacecharacteristics.weightauw_nilreason || ')') as weightauw,
    jsonb_agg(notes_note_view_itdfuu.*) AS annotation
from airport_heliport.surfacecharacteristics_pt 
inner join airport_heliport.surfacecharacteristics on airport_heliport.surfacecharacteristics_pt.surfacecharacteristics_id = airport_heliport.surfacecharacteristics.id
left join master_join master_join_nepmwe on airport_heliport.surfacecharacteristics.id = master_join_nepmwe.source_id
left join notes.note_view notes_note_view_itdfuu on master_join_nepmwe.target_id = notes_note_view_itdfuu.id
group by
    airport_heliport.surfacecharacteristics_pt.id,
    airport_heliport.surfacecharacteristics_pt.nilreason,
    airport_heliport.surfacecharacteristics.composition_value,
    airport_heliport.surfacecharacteristics.composition_nilreason,
    airport_heliport.surfacecharacteristics.preparation_value,
    airport_heliport.surfacecharacteristics.preparation_nilreason,
    airport_heliport.surfacecharacteristics.surfacecondition_value,
    airport_heliport.surfacecharacteristics.surfacecondition_nilreason,
    airport_heliport.surfacecharacteristics.classpcn_value,
    airport_heliport.surfacecharacteristics.classpcn_nilreason,
    airport_heliport.surfacecharacteristics.pavementtypepcn_value,
    airport_heliport.surfacecharacteristics.pavementtypepcn_nilreason,
    airport_heliport.surfacecharacteristics.pavementsubgradepcn_value,
    airport_heliport.surfacecharacteristics.pavementsubgradepcn_nilreason,
    airport_heliport.surfacecharacteristics.maxtyrepressurepcn_value,
    airport_heliport.surfacecharacteristics.maxtyrepressurepcn_nilreason,
    airport_heliport.surfacecharacteristics.evaluationmethodpcn_value,
    airport_heliport.surfacecharacteristics.evaluationmethodpcn_nilreason,
    airport_heliport.surfacecharacteristics.classlcn_value,
    airport_heliport.surfacecharacteristics.classlcn_nilreason,
    airport_heliport.surfacecharacteristics.weightsiwl_value,
    airport_heliport.surfacecharacteristics.weightsiwl_uom,
    airport_heliport.surfacecharacteristics.weightsiwl_nilreason,
    airport_heliport.surfacecharacteristics.tyrepressuresiwl_value,
    airport_heliport.surfacecharacteristics.tyrepressuresiwl_uom,
    airport_heliport.surfacecharacteristics.tyrepressuresiwl_nilreason,
    airport_heliport.surfacecharacteristics.weightauw_value,
    airport_heliport.surfacecharacteristics.weightauw_uom,
    airport_heliport.surfacecharacteristics.weightauw_nilreason;
-- ['notes.note_view', 'geometry.elevatedsurface_view']
create or replace view airport_heliport.surfacecontaminationlayer_view as
select
    airport_heliport.surfacecontaminationlayer_pt.id,
    airport_heliport.surfacecontaminationlayer_pt.nilreason AS surfacecontaminationlayer_annotation,
    coalesce(cast(airport_heliport.surfacecontaminationlayer.layerorder_value as varchar), '(' || airport_heliport.surfacecontaminationlayer.layerorder_nilreason || ')') as layerorder,
    coalesce(cast(airport_heliport.surfacecontaminationlayer.type_value as varchar), '(' || airport_heliport.surfacecontaminationlayer.type_nilreason || ')') as type,
    geometry_elevatedsurface_view_fmsugj.geom AS geom,
    jsonb_agg(notes_note_view_sowbhq.*) AS annotation
from airport_heliport.surfacecontaminationlayer_pt 
inner join airport_heliport.surfacecontaminationlayer on airport_heliport.surfacecontaminationlayer_pt.surfacecontaminationlayer_id = airport_heliport.surfacecontaminationlayer.id
left join master_join master_join_xcdiqq on airport_heliport.surfacecontaminationlayer.id = master_join_xcdiqq.source_id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_fmsugj on master_join_xcdiqq.target_id = geometry_elevatedsurface_view_fmsugj.id
left join master_join master_join_gdeigt on airport_heliport.surfacecontaminationlayer.id = master_join_gdeigt.source_id
left join notes.note_view notes_note_view_sowbhq on master_join_gdeigt.target_id = notes_note_view_sowbhq.id
group by
    airport_heliport.surfacecontaminationlayer_pt.id,
    airport_heliport.surfacecontaminationlayer_pt.nilreason,
    airport_heliport.surfacecontaminationlayer.layerorder_value,
    airport_heliport.surfacecontaminationlayer.layerorder_nilreason,
    airport_heliport.surfacecontaminationlayer.type_value,
    airport_heliport.surfacecontaminationlayer.type_nilreason;
-- ['notes.note_view', 'organisation.unit_view']
create or replace view surveillance.surveillancegroundstation_view as
select
    surveillance.surveillancegroundstation_pt.id,
    surveillance.surveillancegroundstation_pt.nilreason AS surveillancegroundstation_annotation,
    coalesce(cast(surveillance.surveillancegroundstation.videomap_value as varchar), '(' || surveillance.surveillancegroundstation.videomap_nilreason || ')') as videomap,
    coalesce(cast(organisation_unit_view_stepla.title as varchar), '(' || organisation_unit_view_stepla.nilreason[1] || ')') AS theunit,
    organisation_unit_view_stepla.href AS theunit_href,
    jsonb_agg(notes_note_view_ltgyqs.*) AS annotation
from surveillance.surveillancegroundstation_pt 
inner join surveillance.surveillancegroundstation on surveillance.surveillancegroundstation_pt.surveillancegroundstation_id = surveillance.surveillancegroundstation.id
left join organisation.unit_view organisation_unit_view_stepla on surveillance.surveillancegroundstation.theunit_id = organisation_unit_view_stepla.id
left join master_join master_join_jouzri on surveillance.surveillancegroundstation.id = master_join_jouzri.source_id
left join notes.note_view notes_note_view_ltgyqs on master_join_jouzri.target_id = notes_note_view_ltgyqs.id
group by
    surveillance.surveillancegroundstation_pt.id,
    surveillance.surveillancegroundstation_pt.nilreason,
    surveillance.surveillancegroundstation.videomap_value,
    surveillance.surveillancegroundstation.videomap_nilreason,
    organisation_unit_view_stepla.title,
    organisation_unit_view_stepla.nilreason[1],
    organisation_unit_view_stepla.href;
-- ['notes.note_view']
create or replace view shared.timesheet_view as
select
    shared.timesheet_pt.id,
    shared.timesheet_pt.nilreason AS timesheet_annotation,
    coalesce(cast(shared.timesheet.timereference_value as varchar), '(' || shared.timesheet.timereference_nilreason || ')') as timereference,
    coalesce(cast(shared.timesheet.startdate_value as varchar), '(' || shared.timesheet.startdate_nilreason || ')') as startdate,
    coalesce(cast(shared.timesheet.enddate_value as varchar), '(' || shared.timesheet.enddate_nilreason || ')') as enddate,
    coalesce(cast(shared.timesheet.day_value as varchar), '(' || shared.timesheet.day_nilreason || ')') as day,
    coalesce(cast(shared.timesheet.daytil_value as varchar), '(' || shared.timesheet.daytil_nilreason || ')') as daytil,
    coalesce(cast(shared.timesheet.starttime_value as varchar), '(' || shared.timesheet.starttime_nilreason || ')') as starttime,
    coalesce(cast(shared.timesheet.startevent_value as varchar), '(' || shared.timesheet.startevent_nilreason || ')') as startevent,
    coalesce(cast(shared.timesheet.starteventinterpretation_value as varchar), '(' || shared.timesheet.starteventinterpretation_nilreason || ')') as starteventinterpretation,
    coalesce(cast(shared.timesheet.endtime_value as varchar), '(' || shared.timesheet.endtime_nilreason || ')') as endtime,
    coalesce(cast(shared.timesheet.endevent_value as varchar), '(' || shared.timesheet.endevent_nilreason || ')') as endevent,
    coalesce(cast(shared.timesheet.endeventinterpretation_value as varchar), '(' || shared.timesheet.endeventinterpretation_nilreason || ')') as endeventinterpretation,
    coalesce(cast(shared.timesheet.daylightsavingadjust_value as varchar), '(' || shared.timesheet.daylightsavingadjust_nilreason || ')') as daylightsavingadjust,
    coalesce(cast(shared.timesheet.excluded_value as varchar), '(' || shared.timesheet.excluded_nilreason || ')') as excluded,
    coalesce(cast(shared.timesheet.starttimerelativeevent_value as varchar) || ' ' || shared.timesheet.starttimerelativeevent_uom, '(' || shared.timesheet.starttimerelativeevent_nilreason || ')') as starttimerelativeevent,
    coalesce(cast(shared.timesheet.endtimerelativeevent_value as varchar) || ' ' || shared.timesheet.endtimerelativeevent_uom, '(' || shared.timesheet.endtimerelativeevent_nilreason || ')') as endtimerelativeevent,
    jsonb_agg(notes_note_view_nzlbkf.*) AS annotation
from shared.timesheet_pt 
inner join shared.timesheet on shared.timesheet_pt.timesheet_id = shared.timesheet.id
left join master_join master_join_jsyaco on shared.timesheet.id = master_join_jsyaco.source_id
left join notes.note_view notes_note_view_nzlbkf on master_join_jsyaco.target_id = notes_note_view_nzlbkf.id
group by
    shared.timesheet_pt.id,
    shared.timesheet_pt.nilreason,
    shared.timesheet.timereference_value,
    shared.timesheet.timereference_nilreason,
    shared.timesheet.startdate_value,
    shared.timesheet.startdate_nilreason,
    shared.timesheet.enddate_value,
    shared.timesheet.enddate_nilreason,
    shared.timesheet.day_value,
    shared.timesheet.day_nilreason,
    shared.timesheet.daytil_value,
    shared.timesheet.daytil_nilreason,
    shared.timesheet.starttime_value,
    shared.timesheet.starttime_nilreason,
    shared.timesheet.startevent_value,
    shared.timesheet.startevent_nilreason,
    shared.timesheet.starteventinterpretation_value,
    shared.timesheet.starteventinterpretation_nilreason,
    shared.timesheet.endtime_value,
    shared.timesheet.endtime_nilreason,
    shared.timesheet.endevent_value,
    shared.timesheet.endevent_nilreason,
    shared.timesheet.endeventinterpretation_value,
    shared.timesheet.endeventinterpretation_nilreason,
    shared.timesheet.daylightsavingadjust_value,
    shared.timesheet.daylightsavingadjust_nilreason,
    shared.timesheet.excluded_value,
    shared.timesheet.excluded_nilreason,
    shared.timesheet.starttimerelativeevent_value,
    shared.timesheet.starttimerelativeevent_uom,
    shared.timesheet.starttimerelativeevent_nilreason,
    shared.timesheet.endtimerelativeevent_value,
    shared.timesheet.endtimerelativeevent_uom,
    shared.timesheet.endtimerelativeevent_nilreason;
-- ['notes.note_view', 'organisation.unit_view']
create or replace view organisation.unitdependency_view as
select
    organisation.unitdependency_pt.id,
    organisation.unitdependency_pt.nilreason AS unitdependency_annotation,
    coalesce(cast(organisation.unitdependency.type_value as varchar), '(' || organisation.unitdependency.type_nilreason || ')') as type,
    coalesce(cast(organisation_unit_view_nbzmxc.title as varchar), '(' || organisation_unit_view_nbzmxc.nilreason[1] || ')') AS theunit,
    organisation_unit_view_nbzmxc.href AS theunit_href,
    jsonb_agg(notes_note_view_yqyfjg.*) AS annotation
from organisation.unitdependency_pt 
inner join organisation.unitdependency on organisation.unitdependency_pt.unitdependency_id = organisation.unitdependency.id
left join organisation.unit_view organisation_unit_view_nbzmxc on organisation.unitdependency.theunit_id = organisation_unit_view_nbzmxc.id
left join master_join master_join_ihopij on organisation.unitdependency.id = master_join_ihopij.source_id
left join notes.note_view notes_note_view_yqyfjg on master_join_ihopij.target_id = notes_note_view_yqyfjg.id
group by
    organisation.unitdependency_pt.id,
    organisation.unitdependency_pt.nilreason,
    organisation.unitdependency.type_value,
    organisation.unitdependency.type_nilreason,
    organisation_unit_view_nbzmxc.title,
    organisation_unit_view_nbzmxc.nilreason[1],
    organisation_unit_view_nbzmxc.href;
-- ['notes.note_view', 'shared.aircraftcharacteristic_view']
create or replace view procedure.departurearrivalcondition_view as
select
    procedure.departurearrivalcondition_pt.id,
    procedure.departurearrivalcondition_pt.nilreason AS departurearrivalcondition_annotation,
    coalesce(cast(procedure.departurearrivalcondition.minimumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition.minimumcrossingatendreference_nilreason || ')') as minimumcrossingatendreference,
    coalesce(cast(procedure.departurearrivalcondition.maximumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition.maximumcrossingatendreference_nilreason || ')') as maximumcrossingatendreference,
    coalesce(cast(procedure.departurearrivalcondition.minimumenroutealtitude_value as varchar) || ' ' || procedure.departurearrivalcondition.minimumenroutealtitude_uom, '(' || procedure.departurearrivalcondition.minimumenroutealtitude_nilreason || ')') as minimumenroutealtitude,
    coalesce(cast(procedure.departurearrivalcondition.minimumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition.minimumcrossingatend_uom, '(' || procedure.departurearrivalcondition.minimumcrossingatend_nilreason || ')') as minimumcrossingatend,
    coalesce(cast(procedure.departurearrivalcondition.maximumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition.maximumcrossingatend_uom, '(' || procedure.departurearrivalcondition.maximumcrossingatend_nilreason || ')') as maximumcrossingatend,
    shared_aircraftcharacteristic_view_gveewo.id AS enginetype,
    jsonb_agg(notes_note_view_cwfuhh.*) AS annotation
from procedure.departurearrivalcondition_pt 
inner join procedure.departurearrivalcondition on procedure.departurearrivalcondition_pt.departurearrivalcondition_id = procedure.departurearrivalcondition.id
left join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_gveewo on procedure.departurearrivalcondition.engine_id = shared_aircraftcharacteristic_view_gveewo.id
left join master_join master_join_wpgfpp on procedure.departurearrivalcondition.id = master_join_wpgfpp.source_id
left join notes.note_view notes_note_view_cwfuhh on master_join_wpgfpp.target_id = notes_note_view_cwfuhh.id
group by
    procedure.departurearrivalcondition_pt.id,
    procedure.departurearrivalcondition_pt.nilreason,
    procedure.departurearrivalcondition.minimumcrossingatendreference_value,
    procedure.departurearrivalcondition.minimumcrossingatendreference_nilreason,
    procedure.departurearrivalcondition.maximumcrossingatendreference_value,
    procedure.departurearrivalcondition.maximumcrossingatendreference_nilreason,
    procedure.departurearrivalcondition.minimumenroutealtitude_value,
    procedure.departurearrivalcondition.minimumenroutealtitude_uom,
    procedure.departurearrivalcondition.minimumenroutealtitude_nilreason,
    procedure.departurearrivalcondition.minimumcrossingatend_value,
    procedure.departurearrivalcondition.minimumcrossingatend_uom,
    procedure.departurearrivalcondition.minimumcrossingatend_nilreason,
    procedure.departurearrivalcondition.maximumcrossingatend_value,
    procedure.departurearrivalcondition.maximumcrossingatend_uom,
    procedure.departurearrivalcondition.maximumcrossingatend_nilreason,
    shared_aircraftcharacteristic_view_gveewo.id;
-- ['notes.note_view', 'geometry.surface_view', 'airspace.airspacevolumedependency_view', 'geometry.curve_view']
create or replace view airspace.airspacevolume_view as
select
    airspace.airspacevolume_pt.id,
    airspace.airspacevolume_pt.nilreason AS airspacevolume_annotation,
    coalesce(cast(airspace.airspacevolume.upperlimitreference_value as varchar), '(' || airspace.airspacevolume.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(airspace.airspacevolume.maximumlimitreference_value as varchar), '(' || airspace.airspacevolume.maximumlimitreference_nilreason || ')') as maximumlimitreference,
    coalesce(cast(airspace.airspacevolume.lowerlimitreference_value as varchar), '(' || airspace.airspacevolume.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(airspace.airspacevolume.minimumlimitreference_value as varchar), '(' || airspace.airspacevolume.minimumlimitreference_nilreason || ')') as minimumlimitreference,
    coalesce(cast(airspace.airspacevolume.upperlimit_value as varchar) || ' ' || airspace.airspacevolume.upperlimit_uom, '(' || airspace.airspacevolume.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(airspace.airspacevolume.maximumlimit_value as varchar) || ' ' || airspace.airspacevolume.maximumlimit_uom, '(' || airspace.airspacevolume.maximumlimit_nilreason || ')') as maximumlimit,
    coalesce(cast(airspace.airspacevolume.lowerlimit_value as varchar) || ' ' || airspace.airspacevolume.lowerlimit_uom, '(' || airspace.airspacevolume.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(airspace.airspacevolume.minimumlimit_value as varchar) || ' ' || airspace.airspacevolume.minimumlimit_uom, '(' || airspace.airspacevolume.minimumlimit_nilreason || ')') as minimumlimit,
    coalesce(cast(airspace.airspacevolume.width_value as varchar) || ' ' || airspace.airspacevolume.width_uom, '(' || airspace.airspacevolume.width_nilreason || ')') as width,
    geometry_surface_view_niajfp.geom AS geom,
    geometry_curve_view_fbmbaj.geom AS geom,
    airspace_airspacevolumedependency_view_pslttf.id AS contributorairspace,
    jsonb_agg(notes_note_view_qcgebz.*) AS annotation
from airspace.airspacevolume_pt 
inner join airspace.airspacevolume on airspace.airspacevolume_pt.airspacevolume_id = airspace.airspacevolume.id
left join geometry.surface_view geometry_surface_view_niajfp on airspace.airspacevolume.horizontalprojection_id = geometry_surface_view_niajfp.id
left join geometry.curve_view geometry_curve_view_fbmbaj on airspace.airspacevolume.centreline_id = geometry_curve_view_fbmbaj.id
left join airspace.airspacevolumedependency_view airspace_airspacevolumedependency_view_pslttf on airspace.airspacevolume.contributorairspace_id = airspace_airspacevolumedependency_view_pslttf.id
left join master_join master_join_iezdiw on airspace.airspacevolume.id = master_join_iezdiw.source_id
left join notes.note_view notes_note_view_qcgebz on master_join_iezdiw.target_id = notes_note_view_qcgebz.id
group by
    airspace.airspacevolume_pt.id,
    airspace.airspacevolume_pt.nilreason,
    airspace.airspacevolume.upperlimitreference_value,
    airspace.airspacevolume.upperlimitreference_nilreason,
    airspace.airspacevolume.maximumlimitreference_value,
    airspace.airspacevolume.maximumlimitreference_nilreason,
    airspace.airspacevolume.lowerlimitreference_value,
    airspace.airspacevolume.lowerlimitreference_nilreason,
    airspace.airspacevolume.minimumlimitreference_value,
    airspace.airspacevolume.minimumlimitreference_nilreason,
    airspace.airspacevolume.upperlimit_value,
    airspace.airspacevolume.upperlimit_uom,
    airspace.airspacevolume.upperlimit_nilreason,
    airspace.airspacevolume.maximumlimit_value,
    airspace.airspacevolume.maximumlimit_uom,
    airspace.airspacevolume.maximumlimit_nilreason,
    airspace.airspacevolume.lowerlimit_value,
    airspace.airspacevolume.lowerlimit_uom,
    airspace.airspacevolume.lowerlimit_nilreason,
    airspace.airspacevolume.minimumlimit_value,
    airspace.airspacevolume.minimumlimit_uom,
    airspace.airspacevolume.minimumlimit_nilreason,
    airspace.airspacevolume.width_value,
    airspace.airspacevolume.width_uom,
    airspace.airspacevolume.width_nilreason,
    geometry_surface_view_niajfp.geom,
    geometry_curve_view_fbmbaj.geom,
    airspace_airspacevolumedependency_view_pslttf.id;
-- ['geometry.surface_view', 'navaids_points.distanceindication_view', 'notes.note_view', 'navaids_points.angleuse_view', 'navaids_points.designatedpoint_view']
create or replace view navaids_points.pointreference_view as
select
    navaids_points.pointreference_pt.id,
    navaids_points.pointreference_pt.nilreason AS pointreference_annotation,
    coalesce(cast(navaids_points.pointreference.role_value as varchar), '(' || navaids_points.pointreference.role_nilreason || ')') as role,
    coalesce(cast(navaids_points.pointreference.priorfixtolerance_value as varchar) || ' ' || navaids_points.pointreference.priorfixtolerance_uom, '(' || navaids_points.pointreference.priorfixtolerance_nilreason || ')') as priorfixtolerance,
    coalesce(cast(navaids_points.pointreference.postfixtolerance_value as varchar) || ' ' || navaids_points.pointreference.postfixtolerance_uom, '(' || navaids_points.pointreference.postfixtolerance_nilreason || ')') as postfixtolerance,
    coalesce(cast(navaids_points_designatedpoint_view_gupgnb.title as varchar), '(' || navaids_points_designatedpoint_view_gupgnb.nilreason[1] || ')') AS point,
    navaids_points_designatedpoint_view_gupgnb.href AS point_href,
    geometry_surface_view_cwpuhi.geom AS geom,
    jsonb_agg(navaids_points_angleuse_view_cbqxcw.id) AS facilityangle,
    jsonb_agg(navaids_points_distanceindication_view_korjnz.id) AS facilitydistance,
    jsonb_agg(notes_note_view_zpcjgm.*) AS annotation
from navaids_points.pointreference_pt 
inner join navaids_points.pointreference on navaids_points.pointreference_pt.pointreference_id = navaids_points.pointreference.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_gupgnb on navaids_points.pointreference.point_id = navaids_points_designatedpoint_view_gupgnb.id
left join geometry.surface_view geometry_surface_view_cwpuhi on navaids_points.pointreference.fixtolerancearea_id = geometry_surface_view_cwpuhi.id
left join master_join master_join_yilxzm on navaids_points.pointreference.id = master_join_yilxzm.source_id
left join navaids_points.angleuse_view navaids_points_angleuse_view_cbqxcw on master_join_yilxzm.target_id = navaids_points_angleuse_view_cbqxcw.id
left join master_join master_join_akmwsw on navaids_points.pointreference.id = master_join_akmwsw.source_id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_view_korjnz on master_join_akmwsw.target_id = navaids_points_distanceindication_view_korjnz.id
left join master_join master_join_jcmjvi on navaids_points.pointreference.id = master_join_jcmjvi.source_id
left join notes.note_view notes_note_view_zpcjgm on master_join_jcmjvi.target_id = notes_note_view_zpcjgm.id
group by
    navaids_points.pointreference_pt.id,
    navaids_points.pointreference_pt.nilreason,
    navaids_points.pointreference.role_value,
    navaids_points.pointreference.role_nilreason,
    navaids_points.pointreference.priorfixtolerance_value,
    navaids_points.pointreference.priorfixtolerance_uom,
    navaids_points.pointreference.priorfixtolerance_nilreason,
    navaids_points.pointreference.postfixtolerance_value,
    navaids_points.pointreference.postfixtolerance_uom,
    navaids_points.pointreference.postfixtolerance_nilreason,
    navaids_points_designatedpoint_view_gupgnb.title,
    navaids_points_designatedpoint_view_gupgnb.nilreason[1],
    navaids_points_designatedpoint_view_gupgnb.href,
    geometry_surface_view_cwpuhi.geom;
-- ['procedure.approachaltitudetable_view', 'notes.note_view', 'procedure.approachtimingtable_view', 'procedure.approachdistancetable_view']
create or replace view procedure.finalprofile_view as
select
    procedure.finalprofile_pt.id,
    procedure.finalprofile_pt.nilreason AS finalprofile_annotation,
    jsonb_agg(procedure_approachaltitudetable_view_joxpue.id) AS altitude,
    jsonb_agg(procedure_approachdistancetable_view_cisxnn.id) AS distance,
    jsonb_agg(procedure_approachtimingtable_view_efhafv.id) AS timing,
    jsonb_agg(notes_note_view_uaqula.*) AS annotation
from procedure.finalprofile_pt 
inner join procedure.finalprofile on procedure.finalprofile_pt.finalprofile_id = procedure.finalprofile.id
left join master_join master_join_fhxjhn on procedure.finalprofile.id = master_join_fhxjhn.source_id
left join procedure.approachaltitudetable_view procedure_approachaltitudetable_view_joxpue on master_join_fhxjhn.target_id = procedure_approachaltitudetable_view_joxpue.id
left join master_join master_join_xtdeeo on procedure.finalprofile.id = master_join_xtdeeo.source_id
left join procedure.approachdistancetable_view procedure_approachdistancetable_view_cisxnn on master_join_xtdeeo.target_id = procedure_approachdistancetable_view_cisxnn.id
left join master_join master_join_hvdkap on procedure.finalprofile.id = master_join_hvdkap.source_id
left join procedure.approachtimingtable_view procedure_approachtimingtable_view_efhafv on master_join_hvdkap.target_id = procedure_approachtimingtable_view_efhafv.id
left join master_join master_join_qvlyqe on procedure.finalprofile.id = master_join_qvlyqe.source_id
left join notes.note_view notes_note_view_uaqula on master_join_qvlyqe.target_id = notes_note_view_uaqula.id
group by
    procedure.finalprofile_pt.id,
    procedure.finalprofile_pt.nilreason;
-- ['notes.note_view', 'procedure.equipmentunavailableadjustmentcolumn_view']
create or replace view procedure.equipmentunavailableadjustment_view as
select
    procedure.equipmentunavailableadjustment_pt.id,
    procedure.equipmentunavailableadjustment_pt.nilreason AS equipmentunavailableadjustment_annotation,
    coalesce(cast(procedure.equipmentunavailableadjustment.type_value as varchar), '(' || procedure.equipmentunavailableadjustment.type_nilreason || ')') as type,
    coalesce(cast(procedure.equipmentunavailableadjustment.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustment.approachlightinginoperative_nilreason || ')') as approachlightinginoperative,
    jsonb_agg(procedure_equipmentunavailableadjustmentcolumn_view_bjojtp.id) AS adjustmentinopcol,
    jsonb_agg(notes_note_view_mumrdm.*) AS annotation
from procedure.equipmentunavailableadjustment_pt 
inner join procedure.equipmentunavailableadjustment on procedure.equipmentunavailableadjustment_pt.equipmentunavailableadjustment_id = procedure.equipmentunavailableadjustment.id
left join master_join master_join_fxfilf on procedure.equipmentunavailableadjustment.id = master_join_fxfilf.source_id
left join procedure.equipmentunavailableadjustmentcolumn_view procedure_equipmentunavailableadjustmentcolumn_view_bjojtp on master_join_fxfilf.target_id = procedure_equipmentunavailableadjustmentcolumn_view_bjojtp.id
left join master_join master_join_jkxyqv on procedure.equipmentunavailableadjustment.id = master_join_jkxyqv.source_id
left join notes.note_view notes_note_view_mumrdm on master_join_jkxyqv.target_id = notes_note_view_mumrdm.id
group by
    procedure.equipmentunavailableadjustment_pt.id,
    procedure.equipmentunavailableadjustment_pt.nilreason,
    procedure.equipmentunavailableadjustment.type_value,
    procedure.equipmentunavailableadjustment.type_nilreason,
    procedure.equipmentunavailableadjustment.approachlightinginoperative_value,
    procedure.equipmentunavailableadjustment.approachlightinginoperative_nilreason;
-- ['notes.note_view', 'shared.obstacleplacement_view', 'obstacles.verticalstructure_view', 'shared.altitudeadjustment_view']
create or replace view shared.obstruction_view as
select
    shared.obstruction_pt.id,
    shared.obstruction_pt.nilreason AS obstruction_annotation,
    coalesce(cast(shared.obstruction.surfacepenetration_value as varchar), '(' || shared.obstruction.surfacepenetration_nilreason || ')') as surfacepenetration,
    coalesce(cast(shared.obstruction.slopepenetration_value as varchar), '(' || shared.obstruction.slopepenetration_nilreason || ')') as slopepenetration,
    coalesce(cast(shared.obstruction.controlling_value as varchar), '(' || shared.obstruction.controlling_nilreason || ')') as controlling,
    coalesce(cast(shared.obstruction.closein_value as varchar), '(' || shared.obstruction.closein_nilreason || ')') as closein,
    coalesce(cast(shared.obstruction.requiredclearance_value as varchar) || ' ' || shared.obstruction.requiredclearance_uom, '(' || shared.obstruction.requiredclearance_nilreason || ')') as requiredclearance,
    coalesce(cast(shared.obstruction.minimumaltitude_value as varchar) || ' ' || shared.obstruction.minimumaltitude_uom, '(' || shared.obstruction.minimumaltitude_nilreason || ')') as minimumaltitude,
    coalesce(cast(obstacles_verticalstructure_view_ikspjd.title as varchar), '(' || obstacles_verticalstructure_view_ikspjd.nilreason[1] || ')') AS theverticalstructure,
    obstacles_verticalstructure_view_ikspjd.href AS theverticalstructure_href,
    jsonb_agg(shared_altitudeadjustment_view_qjgsdv.id) AS adjustment,
    jsonb_agg(shared_obstacleplacement_view_bppdrb.id) AS obstacleplacement,
    jsonb_agg(notes_note_view_kkgyvr.*) AS annotation
from shared.obstruction_pt 
inner join shared.obstruction on shared.obstruction_pt.obstruction_id = shared.obstruction.id
left join obstacles.verticalstructure_view obstacles_verticalstructure_view_ikspjd on shared.obstruction.theverticalstructure_id = obstacles_verticalstructure_view_ikspjd.id
left join master_join master_join_xxixqm on shared.obstruction.id = master_join_xxixqm.source_id
left join shared.altitudeadjustment_view shared_altitudeadjustment_view_qjgsdv on master_join_xxixqm.target_id = shared_altitudeadjustment_view_qjgsdv.id
left join master_join master_join_dfrvjg on shared.obstruction.id = master_join_dfrvjg.source_id
left join shared.obstacleplacement_view shared_obstacleplacement_view_bppdrb on master_join_dfrvjg.target_id = shared_obstacleplacement_view_bppdrb.id
left join master_join master_join_txzcrv on shared.obstruction.id = master_join_txzcrv.source_id
left join notes.note_view notes_note_view_kkgyvr on master_join_txzcrv.target_id = notes_note_view_kkgyvr.id
group by
    shared.obstruction_pt.id,
    shared.obstruction_pt.nilreason,
    shared.obstruction.surfacepenetration_value,
    shared.obstruction.surfacepenetration_nilreason,
    shared.obstruction.slopepenetration_value,
    shared.obstruction.slopepenetration_nilreason,
    shared.obstruction.controlling_value,
    shared.obstruction.controlling_nilreason,
    shared.obstruction.closein_value,
    shared.obstruction.closein_nilreason,
    shared.obstruction.requiredclearance_value,
    shared.obstruction.requiredclearance_uom,
    shared.obstruction.requiredclearance_nilreason,
    shared.obstruction.minimumaltitude_value,
    shared.obstruction.minimumaltitude_uom,
    shared.obstruction.minimumaltitude_nilreason,
    obstacles_verticalstructure_view_ikspjd.title,
    obstacles_verticalstructure_view_ikspjd.nilreason[1],
    obstacles_verticalstructure_view_ikspjd.href;
-- ['notes.note_view', 'procedure.landingtakeoffareacollection_view', 'procedure.proceduretransitionleg_view', 'geometry.curve_view']
create or replace view procedure.proceduretransition_view as
select
    procedure.proceduretransition_pt.id,
    procedure.proceduretransition_pt.nilreason AS proceduretransition_annotation,
    coalesce(cast(procedure.proceduretransition.transitionid_value as varchar), '(' || procedure.proceduretransition.transitionid_nilreason || ')') as transitionid,
    coalesce(cast(procedure.proceduretransition.type_value as varchar), '(' || procedure.proceduretransition.type_nilreason || ')') as type,
    coalesce(cast(procedure.proceduretransition.instruction_value as varchar), '(' || procedure.proceduretransition.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.proceduretransition.vectorheading_value as varchar), '(' || procedure.proceduretransition.vectorheading_nilreason || ')') as vectorheading,
    procedure_landingtakeoffareacollection_view_uashgh.id AS departurerunwaytransition,
    geometry_curve_view_njlytf.geom AS geom,
    jsonb_agg(procedure_proceduretransitionleg_view_fmtmpj.id) AS transitionleg,
    jsonb_agg(notes_note_view_ugyxbc.*) AS annotation
from procedure.proceduretransition_pt 
inner join procedure.proceduretransition on procedure.proceduretransition_pt.proceduretransition_id = procedure.proceduretransition.id
left join procedure.landingtakeoffareacollection_view procedure_landingtakeoffareacollection_view_uashgh on procedure.proceduretransition.departurerunwaytransition_id = procedure_landingtakeoffareacollection_view_uashgh.id
left join geometry.curve_view geometry_curve_view_njlytf on procedure.proceduretransition.trajectory_id = geometry_curve_view_njlytf.id
left join master_join master_join_suscur on procedure.proceduretransition.id = master_join_suscur.source_id
left join procedure.proceduretransitionleg_view procedure_proceduretransitionleg_view_fmtmpj on master_join_suscur.target_id = procedure_proceduretransitionleg_view_fmtmpj.id
left join master_join master_join_sprqex on procedure.proceduretransition.id = master_join_sprqex.source_id
left join notes.note_view notes_note_view_ugyxbc on master_join_sprqex.target_id = notes_note_view_ugyxbc.id
group by
    procedure.proceduretransition_pt.id,
    procedure.proceduretransition_pt.nilreason,
    procedure.proceduretransition.transitionid_value,
    procedure.proceduretransition.transitionid_nilreason,
    procedure.proceduretransition.type_value,
    procedure.proceduretransition.type_nilreason,
    procedure.proceduretransition.instruction_value,
    procedure.proceduretransition.instruction_nilreason,
    procedure.proceduretransition.vectorheading_value,
    procedure.proceduretransition.vectorheading_nilreason,
    procedure_landingtakeoffareacollection_view_uashgh.id,
    geometry_curve_view_njlytf.geom;
-- ['geometry.point_view', 'airspace.airspace_view', 'procedure.standardinstrumentarrival_view', 'routes.directflightsegment_view', 'airport_heliport.runwaycentrelinepoint_view', 'airport_heliport.airportheliport_view', 'routes.flightrestrictionlevel_view', 'routes.routeportion_view', 'procedure.standardinstrumentdeparture_view', 'airport_heliport.touchdownliftoff_view', 'navaids_points.navaid_view', 'notes.note_view', 'aerial_refuelling.aerialrefuelling_view', 'navaids_points.designatedpoint_view']
create or replace view routes.flightroutingelement_view as
select
    routes.flightroutingelement_pt.id,
    routes.flightroutingelement_pt.nilreason AS flightroutingelement_annotation,
    coalesce(cast(routes.flightroutingelement.ordernumber_value as varchar), '(' || routes.flightroutingelement.ordernumber_nilreason || ')') as ordernumber,
    coalesce(cast(routes.flightroutingelement.speedreference_value as varchar), '(' || routes.flightroutingelement.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(routes.flightroutingelement.speedcriteria_value as varchar), '(' || routes.flightroutingelement.speedcriteria_nilreason || ')') as speedcriteria,
    coalesce(cast(routes.flightroutingelement.speed_value as varchar) || ' ' || routes.flightroutingelement.speed_uom, '(' || routes.flightroutingelement.speed_nilreason || ')') as speed,
    coalesce(cast(procedure_standardinstrumentarrival_view_vtfpai.title as varchar), '(' || procedure_standardinstrumentarrival_view_vtfpai.nilreason[1] || ')') AS elementstandardinstrumentarrivalelement,
    procedure_standardinstrumentarrival_view_vtfpai.href AS elementstandardinstrumentarrivalelement_href,
    coalesce(cast(airspace_airspace_view_lxgoca.title as varchar), '(' || airspace_airspace_view_lxgoca.nilreason[1] || ')') AS elementairspaceelement,
    airspace_airspace_view_lxgoca.href AS elementairspaceelement_href,
    coalesce(cast(navaids_points_designatedpoint_view_lhpshe.title as varchar), '(' || navaids_points_designatedpoint_view_lhpshe.nilreason[1] || ')') AS pointelementfixdesignatedpoint,
    navaids_points_designatedpoint_view_lhpshe.href AS pointelementfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_view_tsfoii.title as varchar), '(' || navaids_points_navaid_view_tsfoii.nilreason[1] || ')') AS pointelementnavaidsystem,
    navaids_points_navaid_view_tsfoii.href AS pointelementnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_vsaiwy.title as varchar), '(' || airport_heliport_touchdownliftoff_view_vsaiwy.nilreason[1] || ')') AS pointelementaimingpoint,
    airport_heliport_touchdownliftoff_view_vsaiwy.href AS pointelementaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_rwyftb.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_rwyftb.nilreason[1] || ')') AS pointelementrunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_rwyftb.href AS pointelementrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_mpirzw.title as varchar), '(' || airport_heliport_airportheliport_view_mpirzw.nilreason[1] || ')') AS pointelementairportreferencepoint,
    airport_heliport_airportheliport_view_mpirzw.href AS pointelementairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_prqavf.title as varchar), '(' || airport_heliport_airportheliport_view_prqavf.nilreason[1] || ')') AS elementairportheliportelement,
    airport_heliport_airportheliport_view_prqavf.href AS elementairportheliportelement_href,
    geometry_point_view_ekxply.geom AS geom,
    ST_X(geometry_point_view_ekxply.geom) AS longitude,
    ST_Y(geometry_point_view_ekxply.geom) AS latitude,
    geometry_point_view_ekxply.horizontalAccuracy,
    routes_directflightsegment_view_oyklhk.id AS elementdirectflightelement,
    coalesce(cast(procedure_standardinstrumentdeparture_view_sjmtlj.title as varchar), '(' || procedure_standardinstrumentdeparture_view_sjmtlj.nilreason[1] || ')') AS elementstandardinstrumentdepartureelement,
    procedure_standardinstrumentdeparture_view_sjmtlj.href AS elementstandardinstrumentdepartureelement_href,
    routes_routeportion_view_kqwgsq.id AS elementrouteportionelement,
    coalesce(cast(aerial_refuelling_aerialrefuelling_view_nxdaur.title as varchar), '(' || aerial_refuelling_aerialrefuelling_view_nxdaur.nilreason[1] || ')') AS elementaerialrefuellingelement,
    aerial_refuelling_aerialrefuelling_view_nxdaur.href AS elementaerialrefuellingelement_href,
    jsonb_agg(routes_flightrestrictionlevel_view_bfemyv.id) AS flightlevel,
    jsonb_agg(notes_note_view_ykxjpq.*) AS annotation
from routes.flightroutingelement_pt 
inner join routes.flightroutingelement on routes.flightroutingelement_pt.flightroutingelement_id = routes.flightroutingelement.id
left join procedure.standardinstrumentarrival_view procedure_standardinstrumentarrival_view_vtfpai on routes.flightroutingelement.element_standardinstrumentarrivalelement_id = procedure_standardinstrumentarrival_view_vtfpai.id
left join airspace.airspace_view airspace_airspace_view_lxgoca on routes.flightroutingelement.element_airspaceelement_id = airspace_airspace_view_lxgoca.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_lhpshe on routes.flightroutingelement.pointelement_fixdesignatedpoint_id = navaids_points_designatedpoint_view_lhpshe.id
left join navaids_points.navaid_view navaids_points_navaid_view_tsfoii on routes.flightroutingelement.pointelement_navaidsystem_id = navaids_points_navaid_view_tsfoii.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_vsaiwy on routes.flightroutingelement.pointelement_aimingpoint_id = airport_heliport_touchdownliftoff_view_vsaiwy.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_rwyftb on routes.flightroutingelement.pointelement_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_rwyftb.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_mpirzw on routes.flightroutingelement.pointelement_airportreferencepoint_id = airport_heliport_airportheliport_view_mpirzw.id
left join geometry.point_view geometry_point_view_ekxply on routes.flightroutingelement.pointelement_position_id = geometry_point_view_ekxply.id
left join routes.directflightsegment_view routes_directflightsegment_view_oyklhk on routes.flightroutingelement.element_directflightelement_id = routes_directflightsegment_view_oyklhk.id
left join procedure.standardinstrumentdeparture_view procedure_standardinstrumentdeparture_view_sjmtlj on routes.flightroutingelement.element_standardinstrumentdepartureelement_id = procedure_standardinstrumentdeparture_view_sjmtlj.id
left join routes.routeportion_view routes_routeportion_view_kqwgsq on routes.flightroutingelement.element_routeportionelement_id = routes_routeportion_view_kqwgsq.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_prqavf on routes.flightroutingelement.element_airportheliportelement_id = airport_heliport_airportheliport_view_prqavf.id
left join aerial_refuelling.aerialrefuelling_view aerial_refuelling_aerialrefuelling_view_nxdaur on routes.flightroutingelement.element_aerialrefuellingelement_id = aerial_refuelling_aerialrefuelling_view_nxdaur.id
left join master_join master_join_ehkqpq on routes.flightroutingelement.id = master_join_ehkqpq.source_id
left join routes.flightrestrictionlevel_view routes_flightrestrictionlevel_view_bfemyv on master_join_ehkqpq.target_id = routes_flightrestrictionlevel_view_bfemyv.id
left join master_join master_join_yfcqtc on routes.flightroutingelement.id = master_join_yfcqtc.source_id
left join notes.note_view notes_note_view_ykxjpq on master_join_yfcqtc.target_id = notes_note_view_ykxjpq.id
group by
    routes.flightroutingelement_pt.id,
    routes.flightroutingelement_pt.nilreason,
    routes.flightroutingelement.ordernumber_value,
    routes.flightroutingelement.ordernumber_nilreason,
    routes.flightroutingelement.speedreference_value,
    routes.flightroutingelement.speedreference_nilreason,
    routes.flightroutingelement.speedcriteria_value,
    routes.flightroutingelement.speedcriteria_nilreason,
    routes.flightroutingelement.speed_value,
    routes.flightroutingelement.speed_uom,
    routes.flightroutingelement.speed_nilreason,
    procedure_standardinstrumentarrival_view_vtfpai.title,
    procedure_standardinstrumentarrival_view_vtfpai.nilreason[1],
    procedure_standardinstrumentarrival_view_vtfpai.href,
    airspace_airspace_view_lxgoca.title,
    airspace_airspace_view_lxgoca.nilreason[1],
    airspace_airspace_view_lxgoca.href,
    navaids_points_designatedpoint_view_lhpshe.title,
    navaids_points_designatedpoint_view_lhpshe.nilreason[1],
    navaids_points_designatedpoint_view_lhpshe.href,
    navaids_points_navaid_view_tsfoii.title,
    navaids_points_navaid_view_tsfoii.nilreason[1],
    navaids_points_navaid_view_tsfoii.href,
    airport_heliport_touchdownliftoff_view_vsaiwy.title,
    airport_heliport_touchdownliftoff_view_vsaiwy.nilreason[1],
    airport_heliport_touchdownliftoff_view_vsaiwy.href,
    airport_heliport_runwaycentrelinepoint_view_rwyftb.title,
    airport_heliport_runwaycentrelinepoint_view_rwyftb.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_rwyftb.href,
    airport_heliport_airportheliport_view_mpirzw.title,
    airport_heliport_airportheliport_view_mpirzw.nilreason[1],
    airport_heliport_airportheliport_view_mpirzw.href,
    geometry_point_view_ekxply.geom,
    geometry_point_view_ekxply.horizontalAccuracy,
    routes_directflightsegment_view_oyklhk.id,
    procedure_standardinstrumentdeparture_view_sjmtlj.title,
    procedure_standardinstrumentdeparture_view_sjmtlj.nilreason[1],
    procedure_standardinstrumentdeparture_view_sjmtlj.href,
    routes_routeportion_view_kqwgsq.id,
    airport_heliport_airportheliport_view_prqavf.title,
    airport_heliport_airportheliport_view_prqavf.nilreason[1],
    airport_heliport_airportheliport_view_prqavf.href,
    aerial_refuelling_aerialrefuelling_view_nxdaur.title,
    aerial_refuelling_aerialrefuelling_view_nxdaur.nilreason[1],
    aerial_refuelling_aerialrefuelling_view_nxdaur.href;
-- ['notes.note_view', 'airport_heliport.ridge_view', 'airport_heliport.surfacecontaminationlayer_view']
create or replace view airport_heliport.aircraftstandcontamination_view as
select
    airport_heliport.aircraftstandcontamination_pt.id,
    airport_heliport.aircraftstandcontamination_pt.nilreason AS aircraftstandcontamination_annotation,
    coalesce(cast(airport_heliport.aircraftstandcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.aircraftstandcontamination.frictionestimation_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.aircraftstandcontamination.frictiondevice_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.aircraftstandcontamination.obscuredlights_value as varchar), '(' || airport_heliport.aircraftstandcontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.aircraftstandcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.aircraftstandcontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.aircraftstandcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.aircraftstandcontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.aircraftstandcontamination.proportion_value as varchar), '(' || airport_heliport.aircraftstandcontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.aircraftstandcontamination.depth_value as varchar) || ' ' || airport_heliport.aircraftstandcontamination.depth_uom, '(' || airport_heliport.aircraftstandcontamination.depth_nilreason || ')') as depth,
    jsonb_agg(airport_heliport_ridge_view_tevrqg.id) AS criticalridge,
    jsonb_agg(airport_heliport_surfacecontaminationlayer_view_libaai.id) AS layer,
    jsonb_agg(notes_note_view_phwoor.*) AS annotation
from airport_heliport.aircraftstandcontamination_pt 
inner join airport_heliport.aircraftstandcontamination on airport_heliport.aircraftstandcontamination_pt.aircraftstandcontamination_id = airport_heliport.aircraftstandcontamination.id
left join master_join master_join_nlxctv on airport_heliport.aircraftstandcontamination.id = master_join_nlxctv.source_id
left join airport_heliport.ridge_view airport_heliport_ridge_view_tevrqg on master_join_nlxctv.target_id = airport_heliport_ridge_view_tevrqg.id
left join master_join master_join_svxkhg on airport_heliport.aircraftstandcontamination.id = master_join_svxkhg.source_id
left join airport_heliport.surfacecontaminationlayer_view airport_heliport_surfacecontaminationlayer_view_libaai on master_join_svxkhg.target_id = airport_heliport_surfacecontaminationlayer_view_libaai.id
left join master_join master_join_kdmuyh on airport_heliport.aircraftstandcontamination.id = master_join_kdmuyh.source_id
left join notes.note_view notes_note_view_phwoor on master_join_kdmuyh.target_id = notes_note_view_phwoor.id
group by
    airport_heliport.aircraftstandcontamination_pt.id,
    airport_heliport.aircraftstandcontamination_pt.nilreason,
    airport_heliport.aircraftstandcontamination.frictioncoefficient_value,
    airport_heliport.aircraftstandcontamination.frictioncoefficient_nilreason,
    airport_heliport.aircraftstandcontamination.frictionestimation_value,
    airport_heliport.aircraftstandcontamination.frictionestimation_nilreason,
    airport_heliport.aircraftstandcontamination.frictiondevice_value,
    airport_heliport.aircraftstandcontamination.frictiondevice_nilreason,
    airport_heliport.aircraftstandcontamination.obscuredlights_value,
    airport_heliport.aircraftstandcontamination.obscuredlights_nilreason,
    airport_heliport.aircraftstandcontamination.furtherclearancetime_value,
    airport_heliport.aircraftstandcontamination.furtherclearancetime_nilreason,
    airport_heliport.aircraftstandcontamination.furthertotalclearance_value,
    airport_heliport.aircraftstandcontamination.furthertotalclearance_nilreason,
    airport_heliport.aircraftstandcontamination.proportion_value,
    airport_heliport.aircraftstandcontamination.proportion_nilreason,
    airport_heliport.aircraftstandcontamination.depth_value,
    airport_heliport.aircraftstandcontamination.depth_uom,
    airport_heliport.aircraftstandcontamination.depth_nilreason;
-- ['notes.note_view', 'airport_heliport.ridge_view', 'airport_heliport.surfacecontaminationlayer_view']
create or replace view airport_heliport.airportheliportcontamination_view as
select
    airport_heliport.airportheliportcontamination_pt.id,
    airport_heliport.airportheliportcontamination_pt.nilreason AS airportheliportcontamination_annotation,
    coalesce(cast(airport_heliport.airportheliportcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.airportheliportcontamination.frictionestimation_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.airportheliportcontamination.frictiondevice_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.airportheliportcontamination.obscuredlights_value as varchar), '(' || airport_heliport.airportheliportcontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.airportheliportcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.airportheliportcontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.airportheliportcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.airportheliportcontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.airportheliportcontamination.proportion_value as varchar), '(' || airport_heliport.airportheliportcontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.airportheliportcontamination.depth_value as varchar) || ' ' || airport_heliport.airportheliportcontamination.depth_uom, '(' || airport_heliport.airportheliportcontamination.depth_nilreason || ')') as depth,
    jsonb_agg(airport_heliport_ridge_view_ohjyks.id) AS criticalridge,
    jsonb_agg(airport_heliport_surfacecontaminationlayer_view_jqiizq.id) AS layer,
    jsonb_agg(notes_note_view_acgopg.*) AS annotation
from airport_heliport.airportheliportcontamination_pt 
inner join airport_heliport.airportheliportcontamination on airport_heliport.airportheliportcontamination_pt.airportheliportcontamination_id = airport_heliport.airportheliportcontamination.id
left join master_join master_join_xhsova on airport_heliport.airportheliportcontamination.id = master_join_xhsova.source_id
left join airport_heliport.ridge_view airport_heliport_ridge_view_ohjyks on master_join_xhsova.target_id = airport_heliport_ridge_view_ohjyks.id
left join master_join master_join_nyckad on airport_heliport.airportheliportcontamination.id = master_join_nyckad.source_id
left join airport_heliport.surfacecontaminationlayer_view airport_heliport_surfacecontaminationlayer_view_jqiizq on master_join_nyckad.target_id = airport_heliport_surfacecontaminationlayer_view_jqiizq.id
left join master_join master_join_izgbun on airport_heliport.airportheliportcontamination.id = master_join_izgbun.source_id
left join notes.note_view notes_note_view_acgopg on master_join_izgbun.target_id = notes_note_view_acgopg.id
group by
    airport_heliport.airportheliportcontamination_pt.id,
    airport_heliport.airportheliportcontamination_pt.nilreason,
    airport_heliport.airportheliportcontamination.frictioncoefficient_value,
    airport_heliport.airportheliportcontamination.frictioncoefficient_nilreason,
    airport_heliport.airportheliportcontamination.frictionestimation_value,
    airport_heliport.airportheliportcontamination.frictionestimation_nilreason,
    airport_heliport.airportheliportcontamination.frictiondevice_value,
    airport_heliport.airportheliportcontamination.frictiondevice_nilreason,
    airport_heliport.airportheliportcontamination.obscuredlights_value,
    airport_heliport.airportheliportcontamination.obscuredlights_nilreason,
    airport_heliport.airportheliportcontamination.furtherclearancetime_value,
    airport_heliport.airportheliportcontamination.furtherclearancetime_nilreason,
    airport_heliport.airportheliportcontamination.furthertotalclearance_value,
    airport_heliport.airportheliportcontamination.furthertotalclearance_nilreason,
    airport_heliport.airportheliportcontamination.proportion_value,
    airport_heliport.airportheliportcontamination.proportion_nilreason,
    airport_heliport.airportheliportcontamination.depth_value,
    airport_heliport.airportheliportcontamination.depth_uom,
    airport_heliport.airportheliportcontamination.depth_nilreason;
-- ['notes.note_view', 'airport_heliport.ridge_view', 'airport_heliport.surfacecontaminationlayer_view']
create or replace view airport_heliport.aproncontamination_view as
select
    airport_heliport.aproncontamination_pt.id,
    airport_heliport.aproncontamination_pt.nilreason AS aproncontamination_annotation,
    coalesce(cast(airport_heliport.aproncontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.aproncontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.aproncontamination.frictionestimation_value as varchar), '(' || airport_heliport.aproncontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.aproncontamination.frictiondevice_value as varchar), '(' || airport_heliport.aproncontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.aproncontamination.obscuredlights_value as varchar), '(' || airport_heliport.aproncontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.aproncontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.aproncontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.aproncontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.aproncontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.aproncontamination.proportion_value as varchar), '(' || airport_heliport.aproncontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.aproncontamination.depth_value as varchar) || ' ' || airport_heliport.aproncontamination.depth_uom, '(' || airport_heliport.aproncontamination.depth_nilreason || ')') as depth,
    jsonb_agg(airport_heliport_ridge_view_mywuce.id) AS criticalridge,
    jsonb_agg(airport_heliport_surfacecontaminationlayer_view_dcwhvv.id) AS layer,
    jsonb_agg(notes_note_view_xhbkeb.*) AS annotation
from airport_heliport.aproncontamination_pt 
inner join airport_heliport.aproncontamination on airport_heliport.aproncontamination_pt.aproncontamination_id = airport_heliport.aproncontamination.id
left join master_join master_join_bmhzef on airport_heliport.aproncontamination.id = master_join_bmhzef.source_id
left join airport_heliport.ridge_view airport_heliport_ridge_view_mywuce on master_join_bmhzef.target_id = airport_heliport_ridge_view_mywuce.id
left join master_join master_join_tgncma on airport_heliport.aproncontamination.id = master_join_tgncma.source_id
left join airport_heliport.surfacecontaminationlayer_view airport_heliport_surfacecontaminationlayer_view_dcwhvv on master_join_tgncma.target_id = airport_heliport_surfacecontaminationlayer_view_dcwhvv.id
left join master_join master_join_wvjiwp on airport_heliport.aproncontamination.id = master_join_wvjiwp.source_id
left join notes.note_view notes_note_view_xhbkeb on master_join_wvjiwp.target_id = notes_note_view_xhbkeb.id
group by
    airport_heliport.aproncontamination_pt.id,
    airport_heliport.aproncontamination_pt.nilreason,
    airport_heliport.aproncontamination.frictioncoefficient_value,
    airport_heliport.aproncontamination.frictioncoefficient_nilreason,
    airport_heliport.aproncontamination.frictionestimation_value,
    airport_heliport.aproncontamination.frictionestimation_nilreason,
    airport_heliport.aproncontamination.frictiondevice_value,
    airport_heliport.aproncontamination.frictiondevice_nilreason,
    airport_heliport.aproncontamination.obscuredlights_value,
    airport_heliport.aproncontamination.obscuredlights_nilreason,
    airport_heliport.aproncontamination.furtherclearancetime_value,
    airport_heliport.aproncontamination.furtherclearancetime_nilreason,
    airport_heliport.aproncontamination.furthertotalclearance_value,
    airport_heliport.aproncontamination.furthertotalclearance_nilreason,
    airport_heliport.aproncontamination.proportion_value,
    airport_heliport.aproncontamination.proportion_nilreason,
    airport_heliport.aproncontamination.depth_value,
    airport_heliport.aproncontamination.depth_uom,
    airport_heliport.aproncontamination.depth_nilreason;
-- ['notes.note_view', 'airport_heliport.ridge_view', 'airport_heliport.surfacecontaminationlayer_view']
create or replace view airport_heliport.runwaycontamination_view as
select
    airport_heliport.runwaycontamination_pt.id,
    airport_heliport.runwaycontamination_pt.nilreason AS runwaycontamination_annotation,
    coalesce(cast(airport_heliport.runwaycontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaycontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.runwaycontamination.frictionestimation_value as varchar), '(' || airport_heliport.runwaycontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.runwaycontamination.frictiondevice_value as varchar), '(' || airport_heliport.runwaycontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.runwaycontamination.obscuredlights_value as varchar), '(' || airport_heliport.runwaycontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.runwaycontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaycontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.runwaycontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaycontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.runwaycontamination.proportion_value as varchar), '(' || airport_heliport.runwaycontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.runwaycontamination.clearedside_value as varchar), '(' || airport_heliport.runwaycontamination.clearedside_nilreason || ')') as clearedside,
    coalesce(cast(airport_heliport.runwaycontamination.obscuredlightsside_value as varchar), '(' || airport_heliport.runwaycontamination.obscuredlightsside_nilreason || ')') as obscuredlightsside,
    coalesce(cast(airport_heliport.runwaycontamination.taxiwayavailable_value as varchar), '(' || airport_heliport.runwaycontamination.taxiwayavailable_nilreason || ')') as taxiwayavailable,
    coalesce(cast(airport_heliport.runwaycontamination.apronavailable_value as varchar), '(' || airport_heliport.runwaycontamination.apronavailable_nilreason || ')') as apronavailable,
    coalesce(cast(airport_heliport.runwaycontamination.depth_value as varchar) || ' ' || airport_heliport.runwaycontamination.depth_uom, '(' || airport_heliport.runwaycontamination.depth_nilreason || ')') as depth,
    coalesce(cast(airport_heliport.runwaycontamination.clearedlength_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedlength_uom, '(' || airport_heliport.runwaycontamination.clearedlength_nilreason || ')') as clearedlength,
    coalesce(cast(airport_heliport.runwaycontamination.clearedwidth_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedwidth_uom, '(' || airport_heliport.runwaycontamination.clearedwidth_nilreason || ')') as clearedwidth,
    coalesce(cast(airport_heliport.runwaycontamination.furtherclearancelength_value as varchar) || ' ' || airport_heliport.runwaycontamination.furtherclearancelength_uom, '(' || airport_heliport.runwaycontamination.furtherclearancelength_nilreason || ')') as furtherclearancelength,
    coalesce(cast(airport_heliport.runwaycontamination.furtherclearancewidth_value as varchar) || ' ' || airport_heliport.runwaycontamination.furtherclearancewidth_uom, '(' || airport_heliport.runwaycontamination.furtherclearancewidth_nilreason || ')') as furtherclearancewidth,
    coalesce(cast(airport_heliport.runwaycontamination.clearedlengthbegin_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedlengthbegin_uom, '(' || airport_heliport.runwaycontamination.clearedlengthbegin_nilreason || ')') as clearedlengthbegin,
    jsonb_agg(airport_heliport_ridge_view_dxtvfw.id) AS criticalridge,
    jsonb_agg(airport_heliport_surfacecontaminationlayer_view_voyriu.id) AS layer,
    jsonb_agg(notes_note_view_hqlplc.*) AS annotation
from airport_heliport.runwaycontamination_pt 
inner join airport_heliport.runwaycontamination on airport_heliport.runwaycontamination_pt.runwaycontamination_id = airport_heliport.runwaycontamination.id
left join master_join master_join_naeweo on airport_heliport.runwaycontamination.id = master_join_naeweo.source_id
left join airport_heliport.ridge_view airport_heliport_ridge_view_dxtvfw on master_join_naeweo.target_id = airport_heliport_ridge_view_dxtvfw.id
left join master_join master_join_ewhfmi on airport_heliport.runwaycontamination.id = master_join_ewhfmi.source_id
left join airport_heliport.surfacecontaminationlayer_view airport_heliport_surfacecontaminationlayer_view_voyriu on master_join_ewhfmi.target_id = airport_heliport_surfacecontaminationlayer_view_voyriu.id
left join master_join master_join_mspomm on airport_heliport.runwaycontamination.id = master_join_mspomm.source_id
left join notes.note_view notes_note_view_hqlplc on master_join_mspomm.target_id = notes_note_view_hqlplc.id
group by
    airport_heliport.runwaycontamination_pt.id,
    airport_heliport.runwaycontamination_pt.nilreason,
    airport_heliport.runwaycontamination.frictioncoefficient_value,
    airport_heliport.runwaycontamination.frictioncoefficient_nilreason,
    airport_heliport.runwaycontamination.frictionestimation_value,
    airport_heliport.runwaycontamination.frictionestimation_nilreason,
    airport_heliport.runwaycontamination.frictiondevice_value,
    airport_heliport.runwaycontamination.frictiondevice_nilreason,
    airport_heliport.runwaycontamination.obscuredlights_value,
    airport_heliport.runwaycontamination.obscuredlights_nilreason,
    airport_heliport.runwaycontamination.furtherclearancetime_value,
    airport_heliport.runwaycontamination.furtherclearancetime_nilreason,
    airport_heliport.runwaycontamination.furthertotalclearance_value,
    airport_heliport.runwaycontamination.furthertotalclearance_nilreason,
    airport_heliport.runwaycontamination.proportion_value,
    airport_heliport.runwaycontamination.proportion_nilreason,
    airport_heliport.runwaycontamination.clearedside_value,
    airport_heliport.runwaycontamination.clearedside_nilreason,
    airport_heliport.runwaycontamination.obscuredlightsside_value,
    airport_heliport.runwaycontamination.obscuredlightsside_nilreason,
    airport_heliport.runwaycontamination.taxiwayavailable_value,
    airport_heliport.runwaycontamination.taxiwayavailable_nilreason,
    airport_heliport.runwaycontamination.apronavailable_value,
    airport_heliport.runwaycontamination.apronavailable_nilreason,
    airport_heliport.runwaycontamination.depth_value,
    airport_heliport.runwaycontamination.depth_uom,
    airport_heliport.runwaycontamination.depth_nilreason,
    airport_heliport.runwaycontamination.clearedlength_value,
    airport_heliport.runwaycontamination.clearedlength_uom,
    airport_heliport.runwaycontamination.clearedlength_nilreason,
    airport_heliport.runwaycontamination.clearedwidth_value,
    airport_heliport.runwaycontamination.clearedwidth_uom,
    airport_heliport.runwaycontamination.clearedwidth_nilreason,
    airport_heliport.runwaycontamination.furtherclearancelength_value,
    airport_heliport.runwaycontamination.furtherclearancelength_uom,
    airport_heliport.runwaycontamination.furtherclearancelength_nilreason,
    airport_heliport.runwaycontamination.furtherclearancewidth_value,
    airport_heliport.runwaycontamination.furtherclearancewidth_uom,
    airport_heliport.runwaycontamination.furtherclearancewidth_nilreason,
    airport_heliport.runwaycontamination.clearedlengthbegin_value,
    airport_heliport.runwaycontamination.clearedlengthbegin_uom,
    airport_heliport.runwaycontamination.clearedlengthbegin_nilreason;
-- ['notes.note_view', 'airport_heliport.ridge_view', 'airport_heliport.surfacecontaminationlayer_view']
create or replace view airport_heliport.runwaysectioncontamination_view as
select
    airport_heliport.runwaysectioncontamination_pt.id,
    airport_heliport.runwaysectioncontamination_pt.nilreason AS runwaysectioncontamination_annotation,
    coalesce(cast(airport_heliport.runwaysectioncontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.runwaysectioncontamination.frictionestimation_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.runwaysectioncontamination.frictiondevice_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.runwaysectioncontamination.obscuredlights_value as varchar), '(' || airport_heliport.runwaysectioncontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.runwaysectioncontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaysectioncontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.runwaysectioncontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaysectioncontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.runwaysectioncontamination.proportion_value as varchar), '(' || airport_heliport.runwaysectioncontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.runwaysectioncontamination.section_value as varchar), '(' || airport_heliport.runwaysectioncontamination.section_nilreason || ')') as section,
    coalesce(cast(airport_heliport.runwaysectioncontamination.depth_value as varchar) || ' ' || airport_heliport.runwaysectioncontamination.depth_uom, '(' || airport_heliport.runwaysectioncontamination.depth_nilreason || ')') as depth,
    jsonb_agg(airport_heliport_ridge_view_cltknn.id) AS criticalridge,
    jsonb_agg(airport_heliport_surfacecontaminationlayer_view_iggfmy.id) AS layer,
    jsonb_agg(notes_note_view_jsfvwj.*) AS annotation
from airport_heliport.runwaysectioncontamination_pt 
inner join airport_heliport.runwaysectioncontamination on airport_heliport.runwaysectioncontamination_pt.runwaysectioncontamination_id = airport_heliport.runwaysectioncontamination.id
left join master_join master_join_nommzj on airport_heliport.runwaysectioncontamination.id = master_join_nommzj.source_id
left join airport_heliport.ridge_view airport_heliport_ridge_view_cltknn on master_join_nommzj.target_id = airport_heliport_ridge_view_cltknn.id
left join master_join master_join_cbxhmv on airport_heliport.runwaysectioncontamination.id = master_join_cbxhmv.source_id
left join airport_heliport.surfacecontaminationlayer_view airport_heliport_surfacecontaminationlayer_view_iggfmy on master_join_cbxhmv.target_id = airport_heliport_surfacecontaminationlayer_view_iggfmy.id
left join master_join master_join_ytunok on airport_heliport.runwaysectioncontamination.id = master_join_ytunok.source_id
left join notes.note_view notes_note_view_jsfvwj on master_join_ytunok.target_id = notes_note_view_jsfvwj.id
group by
    airport_heliport.runwaysectioncontamination_pt.id,
    airport_heliport.runwaysectioncontamination_pt.nilreason,
    airport_heliport.runwaysectioncontamination.frictioncoefficient_value,
    airport_heliport.runwaysectioncontamination.frictioncoefficient_nilreason,
    airport_heliport.runwaysectioncontamination.frictionestimation_value,
    airport_heliport.runwaysectioncontamination.frictionestimation_nilreason,
    airport_heliport.runwaysectioncontamination.frictiondevice_value,
    airport_heliport.runwaysectioncontamination.frictiondevice_nilreason,
    airport_heliport.runwaysectioncontamination.obscuredlights_value,
    airport_heliport.runwaysectioncontamination.obscuredlights_nilreason,
    airport_heliport.runwaysectioncontamination.furtherclearancetime_value,
    airport_heliport.runwaysectioncontamination.furtherclearancetime_nilreason,
    airport_heliport.runwaysectioncontamination.furthertotalclearance_value,
    airport_heliport.runwaysectioncontamination.furthertotalclearance_nilreason,
    airport_heliport.runwaysectioncontamination.proportion_value,
    airport_heliport.runwaysectioncontamination.proportion_nilreason,
    airport_heliport.runwaysectioncontamination.section_value,
    airport_heliport.runwaysectioncontamination.section_nilreason,
    airport_heliport.runwaysectioncontamination.depth_value,
    airport_heliport.runwaysectioncontamination.depth_uom,
    airport_heliport.runwaysectioncontamination.depth_nilreason;
-- ['notes.note_view', 'airport_heliport.ridge_view', 'airport_heliport.surfacecontaminationlayer_view']
create or replace view airport_heliport.taxiwaycontamination_view as
select
    airport_heliport.taxiwaycontamination_pt.id,
    airport_heliport.taxiwaycontamination_pt.nilreason AS taxiwaycontamination_annotation,
    coalesce(cast(airport_heliport.taxiwaycontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.taxiwaycontamination.frictionestimation_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.taxiwaycontamination.frictiondevice_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.taxiwaycontamination.obscuredlights_value as varchar), '(' || airport_heliport.taxiwaycontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.taxiwaycontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.taxiwaycontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.taxiwaycontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.taxiwaycontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.taxiwaycontamination.proportion_value as varchar), '(' || airport_heliport.taxiwaycontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.taxiwaycontamination.depth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination.depth_uom, '(' || airport_heliport.taxiwaycontamination.depth_nilreason || ')') as depth,
    coalesce(cast(airport_heliport.taxiwaycontamination.clearedwidth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination.clearedwidth_uom, '(' || airport_heliport.taxiwaycontamination.clearedwidth_nilreason || ')') as clearedwidth,
    jsonb_agg(airport_heliport_ridge_view_amddge.id) AS criticalridge,
    jsonb_agg(airport_heliport_surfacecontaminationlayer_view_rhckpx.id) AS layer,
    jsonb_agg(notes_note_view_wbkgvx.*) AS annotation
from airport_heliport.taxiwaycontamination_pt 
inner join airport_heliport.taxiwaycontamination on airport_heliport.taxiwaycontamination_pt.taxiwaycontamination_id = airport_heliport.taxiwaycontamination.id
left join master_join master_join_niwnjo on airport_heliport.taxiwaycontamination.id = master_join_niwnjo.source_id
left join airport_heliport.ridge_view airport_heliport_ridge_view_amddge on master_join_niwnjo.target_id = airport_heliport_ridge_view_amddge.id
left join master_join master_join_mwlidq on airport_heliport.taxiwaycontamination.id = master_join_mwlidq.source_id
left join airport_heliport.surfacecontaminationlayer_view airport_heliport_surfacecontaminationlayer_view_rhckpx on master_join_mwlidq.target_id = airport_heliport_surfacecontaminationlayer_view_rhckpx.id
left join master_join master_join_tcknth on airport_heliport.taxiwaycontamination.id = master_join_tcknth.source_id
left join notes.note_view notes_note_view_wbkgvx on master_join_tcknth.target_id = notes_note_view_wbkgvx.id
group by
    airport_heliport.taxiwaycontamination_pt.id,
    airport_heliport.taxiwaycontamination_pt.nilreason,
    airport_heliport.taxiwaycontamination.frictioncoefficient_value,
    airport_heliport.taxiwaycontamination.frictioncoefficient_nilreason,
    airport_heliport.taxiwaycontamination.frictionestimation_value,
    airport_heliport.taxiwaycontamination.frictionestimation_nilreason,
    airport_heliport.taxiwaycontamination.frictiondevice_value,
    airport_heliport.taxiwaycontamination.frictiondevice_nilreason,
    airport_heliport.taxiwaycontamination.obscuredlights_value,
    airport_heliport.taxiwaycontamination.obscuredlights_nilreason,
    airport_heliport.taxiwaycontamination.furtherclearancetime_value,
    airport_heliport.taxiwaycontamination.furtherclearancetime_nilreason,
    airport_heliport.taxiwaycontamination.furthertotalclearance_value,
    airport_heliport.taxiwaycontamination.furthertotalclearance_nilreason,
    airport_heliport.taxiwaycontamination.proportion_value,
    airport_heliport.taxiwaycontamination.proportion_nilreason,
    airport_heliport.taxiwaycontamination.depth_value,
    airport_heliport.taxiwaycontamination.depth_uom,
    airport_heliport.taxiwaycontamination.depth_nilreason,
    airport_heliport.taxiwaycontamination.clearedwidth_value,
    airport_heliport.taxiwaycontamination.clearedwidth_uom,
    airport_heliport.taxiwaycontamination.clearedwidth_nilreason;
-- ['notes.note_view', 'airport_heliport.ridge_view', 'airport_heliport.surfacecontaminationlayer_view']
create or replace view airport_heliport.touchdownliftoffcontamination_view as
select
    airport_heliport.touchdownliftoffcontamination_pt.id,
    airport_heliport.touchdownliftoffcontamination_pt.nilreason AS touchdownliftoffcontamination_annotation,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictionestimation_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictiondevice_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.obscuredlights_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.proportion_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.depth_value as varchar) || ' ' || airport_heliport.touchdownliftoffcontamination.depth_uom, '(' || airport_heliport.touchdownliftoffcontamination.depth_nilreason || ')') as depth,
    jsonb_agg(airport_heliport_ridge_view_jyusll.id) AS criticalridge,
    jsonb_agg(airport_heliport_surfacecontaminationlayer_view_bghvuq.id) AS layer,
    jsonb_agg(notes_note_view_mzbfhs.*) AS annotation
from airport_heliport.touchdownliftoffcontamination_pt 
inner join airport_heliport.touchdownliftoffcontamination on airport_heliport.touchdownliftoffcontamination_pt.touchdownliftoffcontamination_id = airport_heliport.touchdownliftoffcontamination.id
left join master_join master_join_qeprzb on airport_heliport.touchdownliftoffcontamination.id = master_join_qeprzb.source_id
left join airport_heliport.ridge_view airport_heliport_ridge_view_jyusll on master_join_qeprzb.target_id = airport_heliport_ridge_view_jyusll.id
left join master_join master_join_dkqxcc on airport_heliport.touchdownliftoffcontamination.id = master_join_dkqxcc.source_id
left join airport_heliport.surfacecontaminationlayer_view airport_heliport_surfacecontaminationlayer_view_bghvuq on master_join_dkqxcc.target_id = airport_heliport_surfacecontaminationlayer_view_bghvuq.id
left join master_join master_join_gkgbiw on airport_heliport.touchdownliftoffcontamination.id = master_join_gkgbiw.source_id
left join notes.note_view notes_note_view_mzbfhs on master_join_gkgbiw.target_id = notes_note_view_mzbfhs.id
group by
    airport_heliport.touchdownliftoffcontamination_pt.id,
    airport_heliport.touchdownliftoffcontamination_pt.nilreason,
    airport_heliport.touchdownliftoffcontamination.frictioncoefficient_value,
    airport_heliport.touchdownliftoffcontamination.frictioncoefficient_nilreason,
    airport_heliport.touchdownliftoffcontamination.frictionestimation_value,
    airport_heliport.touchdownliftoffcontamination.frictionestimation_nilreason,
    airport_heliport.touchdownliftoffcontamination.frictiondevice_value,
    airport_heliport.touchdownliftoffcontamination.frictiondevice_nilreason,
    airport_heliport.touchdownliftoffcontamination.obscuredlights_value,
    airport_heliport.touchdownliftoffcontamination.obscuredlights_nilreason,
    airport_heliport.touchdownliftoffcontamination.furtherclearancetime_value,
    airport_heliport.touchdownliftoffcontamination.furtherclearancetime_nilreason,
    airport_heliport.touchdownliftoffcontamination.furthertotalclearance_value,
    airport_heliport.touchdownliftoffcontamination.furthertotalclearance_nilreason,
    airport_heliport.touchdownliftoffcontamination.proportion_value,
    airport_heliport.touchdownliftoffcontamination.proportion_nilreason,
    airport_heliport.touchdownliftoffcontamination.depth_value,
    airport_heliport.touchdownliftoffcontamination.depth_uom,
    airport_heliport.touchdownliftoffcontamination.depth_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view airport_heliport.airportheliportresponsibilityorganisation_view as
select
    airport_heliport.airportheliportresponsibilityorganisation_pt.id,
    airport_heliport.airportheliportresponsibilityorganisation_pt.nilreason AS airportheliportresponsibilityorganisation_annotation,
    coalesce(cast(airport_heliport.airportheliportresponsibilityorganisation.role_value as varchar), '(' || airport_heliport.airportheliportresponsibilityorganisation.role_nilreason || ')') as role,
    jsonb_agg(shared_timesheet_view_dodhnb.id) AS timeinterval,
    jsonb_agg(notes_note_view_bmueww.*) AS annotation
from airport_heliport.airportheliportresponsibilityorganisation_pt 
inner join airport_heliport.airportheliportresponsibilityorganisation on airport_heliport.airportheliportresponsibilityorganisation_pt.airportheliportresponsibilityorganisation_id = airport_heliport.airportheliportresponsibilityorganisation.id
left join organisation.organisationauthority_view organisation_organisationauthority_view_edkjko on airport_heliport.airportheliportresponsibilityorganisation.theorganisationauthority_id = organisation_organisationauthority_view_edkjko.id
left join master_join master_join_fpbkgb on airport_heliport.airportheliportresponsibilityorganisation.id = master_join_fpbkgb.source_id
left join shared.timesheet_view shared_timesheet_view_dodhnb on master_join_fpbkgb.target_id = shared_timesheet_view_dodhnb.id
left join master_join master_join_jsprpa on airport_heliport.airportheliportresponsibilityorganisation.id = master_join_jsprpa.source_id
left join notes.note_view notes_note_view_bmueww on master_join_jsprpa.target_id = notes_note_view_bmueww.id
left join master_join master_join_fyybfv on airport_heliport.airportheliportresponsibilityorganisation.id = master_join_fyybfv.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_nexpff on master_join_fyybfv.target_id = organisation_organisationauthority_view_nexpff.id
group by
    airport_heliport.airportheliportresponsibilityorganisation_pt.id,
    airport_heliport.airportheliportresponsibilityorganisation_pt.nilreason,
    airport_heliport.airportheliportresponsibilityorganisation.role_value,
    airport_heliport.airportheliportresponsibilityorganisation.role_nilreason;
-- ['shared.aircraftcharacteristic_view', 'shared.airspacelayer_view', 'shared.timesheet_view', 'notes.note_view', 'organisation.organisationauthority_view']
create or replace view airspace.airspaceactivation_view as
select
    airspace.airspaceactivation_pt.id,
    airspace.airspaceactivation_pt.nilreason AS airspaceactivation_annotation,
    coalesce(cast(airspace.airspaceactivation.activity_value as varchar), '(' || airspace.airspaceactivation.activity_nilreason || ')') as activity,
    coalesce(cast(airspace.airspaceactivation.status_value as varchar), '(' || airspace.airspaceactivation.status_nilreason || ')') as status,
    jsonb_agg(shared_timesheet_view_ajkihg.id) AS timeinterval,
    jsonb_agg(notes_note_view_gqpzkj.*) AS annotation,
    jsonb_agg(shared_airspacelayer_view_quejts.id) AS levels,
    jsonb_agg(shared_aircraftcharacteristic_view_miibui.id) AS aircraft
from airspace.airspaceactivation_pt 
inner join airspace.airspaceactivation on airspace.airspaceactivation_pt.airspaceactivation_id = airspace.airspaceactivation.id
left join master_join master_join_rahfat on airspace.airspaceactivation.id = master_join_rahfat.source_id
left join shared.timesheet_view shared_timesheet_view_ajkihg on master_join_rahfat.target_id = shared_timesheet_view_ajkihg.id
left join master_join master_join_quxkxo on airspace.airspaceactivation.id = master_join_quxkxo.source_id
left join notes.note_view notes_note_view_gqpzkj on master_join_quxkxo.target_id = notes_note_view_gqpzkj.id
left join master_join master_join_tyfodd on airspace.airspaceactivation.id = master_join_tyfodd.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_xsypme on master_join_tyfodd.target_id = organisation_organisationauthority_view_xsypme.id
left join master_join master_join_ipstuj on airspace.airspaceactivation.id = master_join_ipstuj.source_id
left join shared.airspacelayer_view shared_airspacelayer_view_quejts on master_join_ipstuj.target_id = shared_airspacelayer_view_quejts.id
left join master_join master_join_qyfqyn on airspace.airspaceactivation.id = master_join_qyfqyn.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_tlxefx on master_join_qyfqyn.target_id = organisation_organisationauthority_view_tlxefx.id
left join master_join master_join_kxwgfo on airspace.airspaceactivation.id = master_join_kxwgfo.source_id
left join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_miibui on master_join_kxwgfo.target_id = shared_aircraftcharacteristic_view_miibui.id
group by
    airspace.airspaceactivation_pt.id,
    airspace.airspaceactivation_pt.nilreason,
    airspace.airspaceactivation.activity_value,
    airspace.airspaceactivation.activity_nilreason,
    airspace.airspaceactivation.status_value,
    airspace.airspaceactivation.status_nilreason;
-- ['notes.note_view', 'shared.airspacelayer_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view airspace.airspacelayerclass_view as
select
    airspace.airspacelayerclass_pt.id,
    airspace.airspacelayerclass_pt.nilreason AS airspacelayerclass_annotation,
    coalesce(cast(airspace.airspacelayerclass.classification_value as varchar), '(' || airspace.airspacelayerclass.classification_nilreason || ')') as classification,
    jsonb_agg(shared_timesheet_view_shkyvm.id) AS timeinterval,
    jsonb_agg(notes_note_view_tsrvsw.*) AS annotation,
    jsonb_agg(shared_airspacelayer_view_gwvjmf.id) AS associatedlevels
from airspace.airspacelayerclass_pt 
inner join airspace.airspacelayerclass on airspace.airspacelayerclass_pt.airspacelayerclass_id = airspace.airspacelayerclass.id
left join master_join master_join_ozpqcf on airspace.airspacelayerclass.id = master_join_ozpqcf.source_id
left join shared.timesheet_view shared_timesheet_view_shkyvm on master_join_ozpqcf.target_id = shared_timesheet_view_shkyvm.id
left join master_join master_join_qpvepp on airspace.airspacelayerclass.id = master_join_qpvepp.source_id
left join notes.note_view notes_note_view_tsrvsw on master_join_qpvepp.target_id = notes_note_view_tsrvsw.id
left join master_join master_join_dezkxs on airspace.airspacelayerclass.id = master_join_dezkxs.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_axlvjv on master_join_dezkxs.target_id = organisation_organisationauthority_view_axlvjv.id
left join master_join master_join_omujat on airspace.airspacelayerclass.id = master_join_omujat.source_id
left join shared.airspacelayer_view shared_airspacelayer_view_gwvjmf on master_join_omujat.target_id = shared_airspacelayer_view_gwvjmf.id
group by
    airspace.airspacelayerclass_pt.id,
    airspace.airspacelayerclass_pt.nilreason,
    airspace.airspacelayerclass.classification_value,
    airspace.airspacelayerclass.classification_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view airport_heliport.altimetersourcestatus_view as
select
    airport_heliport.altimetersourcestatus_pt.id,
    airport_heliport.altimetersourcestatus_pt.nilreason AS altimetersourcestatus_annotation,
    coalesce(cast(airport_heliport.altimetersourcestatus.operationalstatus_value as varchar), '(' || airport_heliport.altimetersourcestatus.operationalstatus_nilreason || ')') as operationalstatus,
    jsonb_agg(shared_timesheet_view_wvbbzd.id) AS timeinterval,
    jsonb_agg(notes_note_view_ruvrzr.*) AS annotation
from airport_heliport.altimetersourcestatus_pt 
inner join airport_heliport.altimetersourcestatus on airport_heliport.altimetersourcestatus_pt.altimetersourcestatus_id = airport_heliport.altimetersourcestatus.id
left join master_join master_join_rpitus on airport_heliport.altimetersourcestatus.id = master_join_rpitus.source_id
left join shared.timesheet_view shared_timesheet_view_wvbbzd on master_join_rpitus.target_id = shared_timesheet_view_wvbbzd.id
left join master_join master_join_hrvalc on airport_heliport.altimetersourcestatus.id = master_join_hrvalc.source_id
left join notes.note_view notes_note_view_ruvrzr on master_join_hrvalc.target_id = notes_note_view_ruvrzr.id
left join master_join master_join_sourtl on airport_heliport.altimetersourcestatus.id = master_join_sourtl.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_zkipqo on master_join_sourtl.target_id = organisation_organisationauthority_view_zkipqo.id
group by
    airport_heliport.altimetersourcestatus_pt.id,
    airport_heliport.altimetersourcestatus_pt.nilreason,
    airport_heliport.altimetersourcestatus.operationalstatus_value,
    airport_heliport.altimetersourcestatus.operationalstatus_nilreason;
-- ['shared.circlesector_view', 'geometry.surface_view', 'shared.timesheet_view', 'notes.note_view', 'organisation.organisationauthority_view']
create or replace view procedure.circlingrestriction_view as
select
    procedure.circlingrestriction_pt.id,
    procedure.circlingrestriction_pt.nilreason AS circlingrestriction_annotation,
    shared_circlesector_view_twemxb.id AS sectordescription,
    geometry_surface_view_xuezgj.geom AS geom,
    jsonb_agg(shared_timesheet_view_usrpso.id) AS timeinterval,
    jsonb_agg(notes_note_view_vtpwqn.*) AS annotation
from procedure.circlingrestriction_pt 
inner join procedure.circlingrestriction on procedure.circlingrestriction_pt.circlingrestriction_id = procedure.circlingrestriction.id
left join shared.circlesector_view shared_circlesector_view_twemxb on procedure.circlingrestriction.sectordescription_id = shared_circlesector_view_twemxb.id
left join geometry.surface_view geometry_surface_view_xuezgj on procedure.circlingrestriction.restrictionarea_id = geometry_surface_view_xuezgj.id
left join master_join master_join_uxdnwe on procedure.circlingrestriction.id = master_join_uxdnwe.source_id
left join shared.timesheet_view shared_timesheet_view_usrpso on master_join_uxdnwe.target_id = shared_timesheet_view_usrpso.id
left join master_join master_join_ovuvtd on procedure.circlingrestriction.id = master_join_ovuvtd.source_id
left join notes.note_view notes_note_view_vtpwqn on master_join_ovuvtd.target_id = notes_note_view_vtpwqn.id
left join master_join master_join_pxoyvi on procedure.circlingrestriction.id = master_join_pxoyvi.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_adlijb on master_join_pxoyvi.target_id = organisation_organisationauthority_view_adlijb.id
group by
    procedure.circlingrestriction_pt.id,
    procedure.circlingrestriction_pt.nilreason,
    shared_circlesector_view_twemxb.id,
    geometry_surface_view_xuezgj.geom;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view airport_heliport.groundlightingavailability_view as
select
    airport_heliport.groundlightingavailability_pt.id,
    airport_heliport.groundlightingavailability_pt.nilreason AS groundlightingavailability_annotation,
    coalesce(cast(airport_heliport.groundlightingavailability.operationalstatus_value as varchar), '(' || airport_heliport.groundlightingavailability.operationalstatus_nilreason || ')') as operationalstatus,
    jsonb_agg(shared_timesheet_view_zhuebk.id) AS timeinterval,
    jsonb_agg(notes_note_view_milsxu.*) AS annotation
from airport_heliport.groundlightingavailability_pt 
inner join airport_heliport.groundlightingavailability on airport_heliport.groundlightingavailability_pt.groundlightingavailability_id = airport_heliport.groundlightingavailability.id
left join master_join master_join_osxldm on airport_heliport.groundlightingavailability.id = master_join_osxldm.source_id
left join shared.timesheet_view shared_timesheet_view_zhuebk on master_join_osxldm.target_id = shared_timesheet_view_zhuebk.id
left join master_join master_join_qcffvt on airport_heliport.groundlightingavailability.id = master_join_qcffvt.source_id
left join notes.note_view notes_note_view_milsxu on master_join_qcffvt.target_id = notes_note_view_milsxu.id
left join master_join master_join_cmmfyu on airport_heliport.groundlightingavailability.id = master_join_cmmfyu.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_oydwxi on master_join_cmmfyu.target_id = organisation_organisationauthority_view_oydwxi.id
group by
    airport_heliport.groundlightingavailability_pt.id,
    airport_heliport.groundlightingavailability_pt.nilreason,
    airport_heliport.groundlightingavailability.operationalstatus_value,
    airport_heliport.groundlightingavailability.operationalstatus_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view shared.lightelementstatus_view as
select
    shared.lightelementstatus_pt.id,
    shared.lightelementstatus_pt.nilreason AS lightelementstatus_annotation,
    coalesce(cast(shared.lightelementstatus.status_value as varchar), '(' || shared.lightelementstatus.status_nilreason || ')') as status,
    jsonb_agg(shared_timesheet_view_bhrajb.id) AS timeinterval,
    jsonb_agg(notes_note_view_xutdfk.*) AS annotation
from shared.lightelementstatus_pt 
inner join shared.lightelementstatus on shared.lightelementstatus_pt.lightelementstatus_id = shared.lightelementstatus.id
left join master_join master_join_pcqqrs on shared.lightelementstatus.id = master_join_pcqqrs.source_id
left join shared.timesheet_view shared_timesheet_view_bhrajb on master_join_pcqqrs.target_id = shared_timesheet_view_bhrajb.id
left join master_join master_join_dknguj on shared.lightelementstatus.id = master_join_dknguj.source_id
left join notes.note_view notes_note_view_xutdfk on master_join_dknguj.target_id = notes_note_view_xutdfk.id
left join master_join master_join_jlahrr on shared.lightelementstatus.id = master_join_jlahrr.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_jlqthk on master_join_jlahrr.target_id = organisation_organisationauthority_view_jlqthk.id
group by
    shared.lightelementstatus_pt.id,
    shared.lightelementstatus_pt.nilreason,
    shared.lightelementstatus.status_value,
    shared.lightelementstatus.status_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view navaids_points.navaidequipmentmonitoring_view as
select
    navaids_points.navaidequipmentmonitoring_pt.id,
    navaids_points.navaidequipmentmonitoring_pt.nilreason AS navaidequipmentmonitoring_annotation,
    coalesce(cast(navaids_points.navaidequipmentmonitoring.monitored_value as varchar), '(' || navaids_points.navaidequipmentmonitoring.monitored_nilreason || ')') as monitored,
    jsonb_agg(shared_timesheet_view_xmuxye.id) AS timeinterval,
    jsonb_agg(notes_note_view_nghrtk.*) AS annotation
from navaids_points.navaidequipmentmonitoring_pt 
inner join navaids_points.navaidequipmentmonitoring on navaids_points.navaidequipmentmonitoring_pt.navaidequipmentmonitoring_id = navaids_points.navaidequipmentmonitoring.id
left join master_join master_join_jghdsc on navaids_points.navaidequipmentmonitoring.id = master_join_jghdsc.source_id
left join shared.timesheet_view shared_timesheet_view_xmuxye on master_join_jghdsc.target_id = shared_timesheet_view_xmuxye.id
left join master_join master_join_oakkln on navaids_points.navaidequipmentmonitoring.id = master_join_oakkln.source_id
left join notes.note_view notes_note_view_nghrtk on master_join_oakkln.target_id = notes_note_view_nghrtk.id
left join master_join master_join_zcfupv on navaids_points.navaidequipmentmonitoring.id = master_join_zcfupv.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_aadimc on master_join_zcfupv.target_id = organisation_organisationauthority_view_aadimc.id
group by
    navaids_points.navaidequipmentmonitoring_pt.id,
    navaids_points.navaidequipmentmonitoring_pt.nilreason,
    navaids_points.navaidequipmentmonitoring.monitored_value,
    navaids_points.navaidequipmentmonitoring.monitored_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view navaids_points.navaidoperationalstatus_view as
select
    navaids_points.navaidoperationalstatus_pt.id,
    navaids_points.navaidoperationalstatus_pt.nilreason AS navaidoperationalstatus_annotation,
    coalesce(cast(navaids_points.navaidoperationalstatus.operationalstatus_value as varchar), '(' || navaids_points.navaidoperationalstatus.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(navaids_points.navaidoperationalstatus.signaltype_value as varchar), '(' || navaids_points.navaidoperationalstatus.signaltype_nilreason || ')') as signaltype,
    jsonb_agg(shared_timesheet_view_ogztlf.id) AS timeinterval,
    jsonb_agg(notes_note_view_piyfiv.*) AS annotation
from navaids_points.navaidoperationalstatus_pt 
inner join navaids_points.navaidoperationalstatus on navaids_points.navaidoperationalstatus_pt.navaidoperationalstatus_id = navaids_points.navaidoperationalstatus.id
left join master_join master_join_drcjdj on navaids_points.navaidoperationalstatus.id = master_join_drcjdj.source_id
left join shared.timesheet_view shared_timesheet_view_ogztlf on master_join_drcjdj.target_id = shared_timesheet_view_ogztlf.id
left join master_join master_join_sgahej on navaids_points.navaidoperationalstatus.id = master_join_sgahej.source_id
left join notes.note_view notes_note_view_piyfiv on master_join_sgahej.target_id = notes_note_view_piyfiv.id
left join master_join master_join_cvdmcm on navaids_points.navaidoperationalstatus.id = master_join_cvdmcm.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_ligdoq on master_join_cvdmcm.target_id = organisation_organisationauthority_view_ligdoq.id
group by
    navaids_points.navaidoperationalstatus_pt.id,
    navaids_points.navaidoperationalstatus_pt.nilreason,
    navaids_points.navaidoperationalstatus.operationalstatus_value,
    navaids_points.navaidoperationalstatus.operationalstatus_nilreason,
    navaids_points.navaidoperationalstatus.signaltype_value,
    navaids_points.navaidoperationalstatus.signaltype_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view shared.onlinecontact_view as
select
    shared.onlinecontact_pt.id,
    shared.onlinecontact_pt.nilreason AS onlinecontact_annotation,
    coalesce(cast(shared.onlinecontact.network_value as varchar), '(' || shared.onlinecontact.network_nilreason || ')') as network,
    coalesce(cast(shared.onlinecontact.linkage_value as varchar), '(' || shared.onlinecontact.linkage_nilreason || ')') as linkage,
    coalesce(cast(shared.onlinecontact.protocol_value as varchar), '(' || shared.onlinecontact.protocol_nilreason || ')') as protocol,
    coalesce(cast(shared.onlinecontact.email_value as varchar), '(' || shared.onlinecontact.email_nilreason || ')') as email,
    jsonb_agg(shared_timesheet_view_vmbvcd.id) AS timeinterval,
    jsonb_agg(notes_note_view_svobkh.*) AS annotation
from shared.onlinecontact_pt 
inner join shared.onlinecontact on shared.onlinecontact_pt.onlinecontact_id = shared.onlinecontact.id
left join master_join master_join_pmzgug on shared.onlinecontact.id = master_join_pmzgug.source_id
left join shared.timesheet_view shared_timesheet_view_vmbvcd on master_join_pmzgug.target_id = shared_timesheet_view_vmbvcd.id
left join master_join master_join_icuqck on shared.onlinecontact.id = master_join_icuqck.source_id
left join notes.note_view notes_note_view_svobkh on master_join_icuqck.target_id = notes_note_view_svobkh.id
left join master_join master_join_mwtpha on shared.onlinecontact.id = master_join_mwtpha.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_vfqduc on master_join_mwtpha.target_id = organisation_organisationauthority_view_vfqduc.id
group by
    shared.onlinecontact_pt.id,
    shared.onlinecontact_pt.nilreason,
    shared.onlinecontact.network_value,
    shared.onlinecontact.network_nilreason,
    shared.onlinecontact.linkage_value,
    shared.onlinecontact.linkage_nilreason,
    shared.onlinecontact.protocol_value,
    shared.onlinecontact.protocol_nilreason,
    shared.onlinecontact.email_value,
    shared.onlinecontact.email_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view shared.postaladdress_view as
select
    shared.postaladdress_pt.id,
    shared.postaladdress_pt.nilreason AS postaladdress_annotation,
    coalesce(cast(shared.postaladdress.deliverypoint_value as varchar), '(' || shared.postaladdress.deliverypoint_nilreason || ')') as deliverypoint,
    coalesce(cast(shared.postaladdress.city_value as varchar), '(' || shared.postaladdress.city_nilreason || ')') as city,
    coalesce(cast(shared.postaladdress.administrativearea_value as varchar), '(' || shared.postaladdress.administrativearea_nilreason || ')') as administrativearea,
    coalesce(cast(shared.postaladdress.postalcode_value as varchar), '(' || shared.postaladdress.postalcode_nilreason || ')') as postalcode,
    coalesce(cast(shared.postaladdress.country_value as varchar), '(' || shared.postaladdress.country_nilreason || ')') as country,
    jsonb_agg(shared_timesheet_view_olfcky.id) AS timeinterval,
    jsonb_agg(notes_note_view_bjacpk.*) AS annotation
from shared.postaladdress_pt 
inner join shared.postaladdress on shared.postaladdress_pt.postaladdress_id = shared.postaladdress.id
left join master_join master_join_aqwsao on shared.postaladdress.id = master_join_aqwsao.source_id
left join shared.timesheet_view shared_timesheet_view_olfcky on master_join_aqwsao.target_id = shared_timesheet_view_olfcky.id
left join master_join master_join_oodkde on shared.postaladdress.id = master_join_oodkde.source_id
left join notes.note_view notes_note_view_bjacpk on master_join_oodkde.target_id = notes_note_view_bjacpk.id
left join master_join master_join_ijdyci on shared.postaladdress.id = master_join_ijdyci.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_bzwwng on master_join_ijdyci.target_id = organisation_organisationauthority_view_bzwwng.id
group by
    shared.postaladdress_pt.id,
    shared.postaladdress_pt.nilreason,
    shared.postaladdress.deliverypoint_value,
    shared.postaladdress.deliverypoint_nilreason,
    shared.postaladdress.city_value,
    shared.postaladdress.city_nilreason,
    shared.postaladdress.administrativearea_value,
    shared.postaladdress.administrativearea_nilreason,
    shared.postaladdress.postalcode_value,
    shared.postaladdress.postalcode_nilreason,
    shared.postaladdress.country_value,
    shared.postaladdress.country_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view procedure.procedureavailability_view as
select
    procedure.procedureavailability_pt.id,
    procedure.procedureavailability_pt.nilreason AS procedureavailability_annotation,
    coalesce(cast(procedure.procedureavailability.status_value as varchar), '(' || procedure.procedureavailability.status_nilreason || ')') as status,
    jsonb_agg(shared_timesheet_view_gvqvoh.id) AS timeinterval,
    jsonb_agg(notes_note_view_szippy.*) AS annotation
from procedure.procedureavailability_pt 
inner join procedure.procedureavailability on procedure.procedureavailability_pt.procedureavailability_id = procedure.procedureavailability.id
left join master_join master_join_gejcop on procedure.procedureavailability.id = master_join_gejcop.source_id
left join shared.timesheet_view shared_timesheet_view_gvqvoh on master_join_gejcop.target_id = shared_timesheet_view_gvqvoh.id
left join master_join master_join_qsvzbc on procedure.procedureavailability.id = master_join_qsvzbc.source_id
left join notes.note_view notes_note_view_szippy on master_join_qsvzbc.target_id = notes_note_view_szippy.id
left join master_join master_join_bnngqg on procedure.procedureavailability.id = master_join_bnngqg.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_naqseb on master_join_bnngqg.target_id = organisation_organisationauthority_view_naqseb.id
group by
    procedure.procedureavailability_pt.id,
    procedure.procedureavailability_pt.nilreason,
    procedure.procedureavailability.status_value,
    procedure.procedureavailability.status_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view service.radiocommunicationoperationalstatus_view as
select
    service.radiocommunicationoperationalstatus_pt.id,
    service.radiocommunicationoperationalstatus_pt.nilreason AS radiocommunicationoperationalstatus_annotation,
    coalesce(cast(service.radiocommunicationoperationalstatus.operationalstatus_value as varchar), '(' || service.radiocommunicationoperationalstatus.operationalstatus_nilreason || ')') as operationalstatus,
    jsonb_agg(shared_timesheet_view_ceecbi.id) AS timeinterval,
    jsonb_agg(notes_note_view_bhawkx.*) AS annotation
from service.radiocommunicationoperationalstatus_pt 
inner join service.radiocommunicationoperationalstatus on service.radiocommunicationoperationalstatus_pt.radiocommunicationoperationalstatus_id = service.radiocommunicationoperationalstatus.id
left join master_join master_join_epbjgb on service.radiocommunicationoperationalstatus.id = master_join_epbjgb.source_id
left join shared.timesheet_view shared_timesheet_view_ceecbi on master_join_epbjgb.target_id = shared_timesheet_view_ceecbi.id
left join master_join master_join_lypfpo on service.radiocommunicationoperationalstatus.id = master_join_lypfpo.source_id
left join notes.note_view notes_note_view_bhawkx on master_join_lypfpo.target_id = notes_note_view_bhawkx.id
left join master_join master_join_ukmprm on service.radiocommunicationoperationalstatus.id = master_join_ukmprm.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_ethncw on master_join_ukmprm.target_id = organisation_organisationauthority_view_ethncw.id
group by
    service.radiocommunicationoperationalstatus_pt.id,
    service.radiocommunicationoperationalstatus_pt.nilreason,
    service.radiocommunicationoperationalstatus.operationalstatus_value,
    service.radiocommunicationoperationalstatus.operationalstatus_nilreason;
-- ['notes.note_view', 'shared.airspacelayer_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view routes.routeavailability_view as
select
    routes.routeavailability_pt.id,
    routes.routeavailability_pt.nilreason AS routeavailability_annotation,
    coalesce(cast(routes.routeavailability.direction_value as varchar), '(' || routes.routeavailability.direction_nilreason || ')') as direction,
    coalesce(cast(routes.routeavailability.cardinaldirection_value as varchar), '(' || routes.routeavailability.cardinaldirection_nilreason || ')') as cardinaldirection,
    coalesce(cast(routes.routeavailability.status_value as varchar), '(' || routes.routeavailability.status_nilreason || ')') as status,
    jsonb_agg(shared_timesheet_view_xeueca.id) AS timeinterval,
    jsonb_agg(notes_note_view_xvoubw.*) AS annotation,
    jsonb_agg(shared_airspacelayer_view_jmyvxt.id) AS levels
from routes.routeavailability_pt 
inner join routes.routeavailability on routes.routeavailability_pt.routeavailability_id = routes.routeavailability.id
left join master_join master_join_aeldsv on routes.routeavailability.id = master_join_aeldsv.source_id
left join shared.timesheet_view shared_timesheet_view_xeueca on master_join_aeldsv.target_id = shared_timesheet_view_xeueca.id
left join master_join master_join_cjefkj on routes.routeavailability.id = master_join_cjefkj.source_id
left join notes.note_view notes_note_view_xvoubw on master_join_cjefkj.target_id = notes_note_view_xvoubw.id
left join master_join master_join_wdgege on routes.routeavailability.id = master_join_wdgege.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_zlqfli on master_join_wdgege.target_id = organisation_organisationauthority_view_zlqfli.id
left join master_join master_join_zrzplu on routes.routeavailability.id = master_join_zrzplu.source_id
left join shared.airspacelayer_view shared_airspacelayer_view_jmyvxt on master_join_zrzplu.target_id = shared_airspacelayer_view_jmyvxt.id
group by
    routes.routeavailability_pt.id,
    routes.routeavailability_pt.nilreason,
    routes.routeavailability.direction_value,
    routes.routeavailability.direction_nilreason,
    routes.routeavailability.cardinaldirection_value,
    routes.routeavailability.cardinaldirection_nilreason,
    routes.routeavailability.status_value,
    routes.routeavailability.status_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view airport_heliport.runwaydeclareddistancevalue_view as
select
    airport_heliport.runwaydeclareddistancevalue_pt.id,
    airport_heliport.runwaydeclareddistancevalue_pt.nilreason AS runwaydeclareddistancevalue_annotation,
    coalesce(cast(airport_heliport.runwaydeclareddistancevalue.distance_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue.distance_uom, '(' || airport_heliport.runwaydeclareddistancevalue.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_uom, '(' || airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_nilreason || ')') as distanceaccuracy,
    jsonb_agg(shared_timesheet_view_gzcvqj.id) AS timeinterval,
    jsonb_agg(notes_note_view_cgeleh.*) AS annotation
from airport_heliport.runwaydeclareddistancevalue_pt 
inner join airport_heliport.runwaydeclareddistancevalue on airport_heliport.runwaydeclareddistancevalue_pt.runwaydeclareddistancevalue_id = airport_heliport.runwaydeclareddistancevalue.id
left join master_join master_join_jvqciq on airport_heliport.runwaydeclareddistancevalue.id = master_join_jvqciq.source_id
left join shared.timesheet_view shared_timesheet_view_gzcvqj on master_join_jvqciq.target_id = shared_timesheet_view_gzcvqj.id
left join master_join master_join_mfngyj on airport_heliport.runwaydeclareddistancevalue.id = master_join_mfngyj.source_id
left join notes.note_view notes_note_view_cgeleh on master_join_mfngyj.target_id = notes_note_view_cgeleh.id
left join master_join master_join_xgizyi on airport_heliport.runwaydeclareddistancevalue.id = master_join_xgizyi.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_jijkxy on master_join_xgizyi.target_id = organisation_organisationauthority_view_jijkxy.id
group by
    airport_heliport.runwaydeclareddistancevalue_pt.id,
    airport_heliport.runwaydeclareddistancevalue_pt.nilreason,
    airport_heliport.runwaydeclareddistancevalue.distance_value,
    airport_heliport.runwaydeclareddistancevalue.distance_uom,
    airport_heliport.runwaydeclareddistancevalue.distance_nilreason,
    airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_value,
    airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_uom,
    airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view service.serviceoperationalstatus_view as
select
    service.serviceoperationalstatus_pt.id,
    service.serviceoperationalstatus_pt.nilreason AS serviceoperationalstatus_annotation,
    coalesce(cast(service.serviceoperationalstatus.operationalstatus_value as varchar), '(' || service.serviceoperationalstatus.operationalstatus_nilreason || ')') as operationalstatus,
    jsonb_agg(shared_timesheet_view_vkhpgj.id) AS timeinterval,
    jsonb_agg(notes_note_view_dlwdxz.*) AS annotation
from service.serviceoperationalstatus_pt 
inner join service.serviceoperationalstatus on service.serviceoperationalstatus_pt.serviceoperationalstatus_id = service.serviceoperationalstatus.id
left join master_join master_join_ehalif on service.serviceoperationalstatus.id = master_join_ehalif.source_id
left join shared.timesheet_view shared_timesheet_view_vkhpgj on master_join_ehalif.target_id = shared_timesheet_view_vkhpgj.id
left join master_join master_join_pmoirj on service.serviceoperationalstatus.id = master_join_pmoirj.source_id
left join notes.note_view notes_note_view_dlwdxz on master_join_pmoirj.target_id = notes_note_view_dlwdxz.id
left join master_join master_join_pyyuhv on service.serviceoperationalstatus.id = master_join_pyyuhv.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_jugkyi on master_join_pyyuhv.target_id = organisation_organisationauthority_view_jugkyi.id
group by
    service.serviceoperationalstatus_pt.id,
    service.serviceoperationalstatus_pt.nilreason,
    service.serviceoperationalstatus.operationalstatus_value,
    service.serviceoperationalstatus.operationalstatus_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view navaids_points.specialnavigationstationstatus_view as
select
    navaids_points.specialnavigationstationstatus_pt.id,
    navaids_points.specialnavigationstationstatus_pt.nilreason AS specialnavigationstationstatus_annotation,
    coalesce(cast(navaids_points.specialnavigationstationstatus.operationalstatus_value as varchar), '(' || navaids_points.specialnavigationstationstatus.operationalstatus_nilreason || ')') as operationalstatus,
    jsonb_agg(shared_timesheet_view_nqfxds.id) AS timeinterval,
    jsonb_agg(notes_note_view_xobsra.*) AS annotation
from navaids_points.specialnavigationstationstatus_pt 
inner join navaids_points.specialnavigationstationstatus on navaids_points.specialnavigationstationstatus_pt.specialnavigationstationstatus_id = navaids_points.specialnavigationstationstatus.id
left join master_join master_join_qdzoup on navaids_points.specialnavigationstationstatus.id = master_join_qdzoup.source_id
left join shared.timesheet_view shared_timesheet_view_nqfxds on master_join_qdzoup.target_id = shared_timesheet_view_nqfxds.id
left join master_join master_join_wznxcx on navaids_points.specialnavigationstationstatus.id = master_join_wznxcx.source_id
left join notes.note_view notes_note_view_xobsra on master_join_wznxcx.target_id = notes_note_view_xobsra.id
left join master_join master_join_mgbiah on navaids_points.specialnavigationstationstatus.id = master_join_mgbiah.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_awrjuh on master_join_mgbiah.target_id = organisation_organisationauthority_view_awrjuh.id
group by
    navaids_points.specialnavigationstationstatus_pt.id,
    navaids_points.specialnavigationstationstatus_pt.nilreason,
    navaids_points.specialnavigationstationstatus.operationalstatus_value,
    navaids_points.specialnavigationstationstatus.operationalstatus_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view shared.telephonecontact_view as
select
    shared.telephonecontact_pt.id,
    shared.telephonecontact_pt.nilreason AS telephonecontact_annotation,
    coalesce(cast(shared.telephonecontact.voice_value as varchar), '(' || shared.telephonecontact.voice_nilreason || ')') as voice,
    coalesce(cast(shared.telephonecontact.facsimile_value as varchar), '(' || shared.telephonecontact.facsimile_nilreason || ')') as facsimile,
    jsonb_agg(shared_timesheet_view_jwyqxq.id) AS timeinterval,
    jsonb_agg(notes_note_view_tvizuk.*) AS annotation
from shared.telephonecontact_pt 
inner join shared.telephonecontact on shared.telephonecontact_pt.telephonecontact_id = shared.telephonecontact.id
left join master_join master_join_dvzzbv on shared.telephonecontact.id = master_join_dvzzbv.source_id
left join shared.timesheet_view shared_timesheet_view_jwyqxq on master_join_dvzzbv.target_id = shared_timesheet_view_jwyqxq.id
left join master_join master_join_atiqyw on shared.telephonecontact.id = master_join_atiqyw.source_id
left join notes.note_view notes_note_view_tvizuk on master_join_atiqyw.target_id = notes_note_view_tvizuk.id
left join master_join master_join_hloduo on shared.telephonecontact.id = master_join_hloduo.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_pltbni on master_join_hloduo.target_id = organisation_organisationauthority_view_pltbni.id
group by
    shared.telephonecontact_pt.id,
    shared.telephonecontact_pt.nilreason,
    shared.telephonecontact.voice_value,
    shared.telephonecontact.voice_nilreason,
    shared.telephonecontact.facsimile_value,
    shared.telephonecontact.facsimile_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view organisation.unitavailability_view as
select
    organisation.unitavailability_pt.id,
    organisation.unitavailability_pt.nilreason AS unitavailability_annotation,
    coalesce(cast(organisation.unitavailability.operationalstatus_value as varchar), '(' || organisation.unitavailability.operationalstatus_nilreason || ')') as operationalstatus,
    jsonb_agg(shared_timesheet_view_hvjdec.id) AS timeinterval,
    jsonb_agg(notes_note_view_eclcxn.*) AS annotation
from organisation.unitavailability_pt 
inner join organisation.unitavailability on organisation.unitavailability_pt.unitavailability_id = organisation.unitavailability.id
left join master_join master_join_vibaoe on organisation.unitavailability.id = master_join_vibaoe.source_id
left join shared.timesheet_view shared_timesheet_view_hvjdec on master_join_vibaoe.target_id = shared_timesheet_view_hvjdec.id
left join master_join master_join_afvegh on organisation.unitavailability.id = master_join_afvegh.source_id
left join notes.note_view notes_note_view_eclcxn on master_join_afvegh.target_id = notes_note_view_eclcxn.id
left join master_join master_join_eaclbb on organisation.unitavailability.id = master_join_eaclbb.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_eaykyy on master_join_eaclbb.target_id = organisation_organisationauthority_view_eaykyy.id
group by
    organisation.unitavailability_pt.id,
    organisation.unitavailability_pt.nilreason,
    organisation.unitavailability.operationalstatus_value,
    organisation.unitavailability.operationalstatus_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view obstacles.verticalstructurelightingstatus_view as
select
    obstacles.verticalstructurelightingstatus_pt.id,
    obstacles.verticalstructurelightingstatus_pt.nilreason AS verticalstructurelightingstatus_annotation,
    coalesce(cast(obstacles.verticalstructurelightingstatus.status_value as varchar), '(' || obstacles.verticalstructurelightingstatus.status_nilreason || ')') as status,
    jsonb_agg(shared_timesheet_view_bcixos.id) AS timeinterval,
    jsonb_agg(notes_note_view_euppjk.*) AS annotation
from obstacles.verticalstructurelightingstatus_pt 
inner join obstacles.verticalstructurelightingstatus on obstacles.verticalstructurelightingstatus_pt.verticalstructurelightingstatus_id = obstacles.verticalstructurelightingstatus.id
left join master_join master_join_czidee on obstacles.verticalstructurelightingstatus.id = master_join_czidee.source_id
left join shared.timesheet_view shared_timesheet_view_bcixos on master_join_czidee.target_id = shared_timesheet_view_bcixos.id
left join master_join master_join_lowwbc on obstacles.verticalstructurelightingstatus.id = master_join_lowwbc.source_id
left join notes.note_view notes_note_view_euppjk on master_join_lowwbc.target_id = notes_note_view_euppjk.id
left join master_join master_join_uozdhp on obstacles.verticalstructurelightingstatus.id = master_join_uozdhp.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_lvenfa on master_join_uozdhp.target_id = organisation_organisationauthority_view_lvenfa.id
group by
    obstacles.verticalstructurelightingstatus_pt.id,
    obstacles.verticalstructurelightingstatus_pt.nilreason,
    obstacles.verticalstructurelightingstatus.status_value,
    obstacles.verticalstructurelightingstatus.status_nilreason;
-- ['notes.note_view', 'organisation.organisationauthority_view', 'shared.timesheet_view']
create or replace view airport_heliport.workareaactivity_view as
select
    airport_heliport.workareaactivity_pt.id,
    airport_heliport.workareaactivity_pt.nilreason AS workareaactivity_annotation,
    coalesce(cast(airport_heliport.workareaactivity.isactive_value as varchar), '(' || airport_heliport.workareaactivity.isactive_nilreason || ')') as isactive,
    jsonb_agg(shared_timesheet_view_ulzpda.id) AS timeinterval,
    jsonb_agg(notes_note_view_dstjwp.*) AS annotation
from airport_heliport.workareaactivity_pt 
inner join airport_heliport.workareaactivity on airport_heliport.workareaactivity_pt.workareaactivity_id = airport_heliport.workareaactivity.id
left join master_join master_join_sqxhlh on airport_heliport.workareaactivity.id = master_join_sqxhlh.source_id
left join shared.timesheet_view shared_timesheet_view_ulzpda on master_join_sqxhlh.target_id = shared_timesheet_view_ulzpda.id
left join master_join master_join_rgpctm on airport_heliport.workareaactivity.id = master_join_rgpctm.source_id
left join notes.note_view notes_note_view_dstjwp on master_join_rgpctm.target_id = notes_note_view_dstjwp.id
left join master_join master_join_adwufg on airport_heliport.workareaactivity.id = master_join_adwufg.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_hkuxbo on master_join_adwufg.target_id = organisation_organisationauthority_view_hkuxbo.id
group by
    airport_heliport.workareaactivity_pt.id,
    airport_heliport.workareaactivity_pt.nilreason,
    airport_heliport.workareaactivity.isactive_value,
    airport_heliport.workareaactivity.isactive_nilreason;
-- ['notes.note_view', 'airspace.airspacevolume_view']
create or replace view airspace.airspacegeometrycomponent_view as
select
    airspace.airspacegeometrycomponent_pt.id,
    airspace.airspacegeometrycomponent_pt.nilreason AS airspacegeometrycomponent_annotation,
    coalesce(cast(airspace.airspacegeometrycomponent.operation_value as varchar), '(' || airspace.airspacegeometrycomponent.operation_nilreason || ')') as operation,
    coalesce(cast(airspace.airspacegeometrycomponent.operationsequence_value as varchar), '(' || airspace.airspacegeometrycomponent.operationsequence_nilreason || ')') as operationsequence,
    airspace_airspacevolume_view_oenzfd.id AS theairspacevolume,
    jsonb_agg(notes_note_view_rwgybs.*) AS annotation
from airspace.airspacegeometrycomponent_pt 
inner join airspace.airspacegeometrycomponent on airspace.airspacegeometrycomponent_pt.airspacegeometrycomponent_id = airspace.airspacegeometrycomponent.id
left join airspace.airspacevolume_view airspace_airspacevolume_view_oenzfd on airspace.airspacegeometrycomponent.theairspacevolume_id = airspace_airspacevolume_view_oenzfd.id
left join master_join master_join_brbyzx on airspace.airspacegeometrycomponent.id = master_join_brbyzx.source_id
left join notes.note_view notes_note_view_rwgybs on master_join_brbyzx.target_id = notes_note_view_rwgybs.id
group by
    airspace.airspacegeometrycomponent_pt.id,
    airspace.airspacegeometrycomponent_pt.nilreason,
    airspace.airspacegeometrycomponent.operation_value,
    airspace.airspacegeometrycomponent.operation_nilreason,
    airspace.airspacegeometrycomponent.operationsequence_value,
    airspace.airspacegeometrycomponent.operationsequence_nilreason,
    airspace_airspacevolume_view_oenzfd.id;
-- ['geometry.point_view', 'navaids_points.pointreference_view', 'airport_heliport.runwaycentrelinepoint_view', 'airport_heliport.airportheliport_view', 'airport_heliport.touchdownliftoff_view', 'navaids_points.navaid_view', 'notes.note_view', 'shared.radiofrequencyarea_view', 'navaids_points.designatedpoint_view']
create or replace view aerial_refuelling.aerialrefuellingpoint_view as
select
    aerial_refuelling.aerialrefuellingpoint_pt.id,
    aerial_refuelling.aerialrefuellingpoint_pt.nilreason AS aerialrefuellingpoint_annotation,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.reportingatc_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.flyover_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.flyover_nilreason || ')') as flyover,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.waypoint_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.radarguidance_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.sequence_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.sequence_nilreason || ')') as sequence,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.usagetype_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.usagetype_nilreason || ')') as usagetype,
    coalesce(cast(navaids_points_designatedpoint_view_ashvac.title as varchar), '(' || navaids_points_designatedpoint_view_ashvac.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_view_ashvac.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_view_zjcvnm.title as varchar), '(' || navaids_points_navaid_view_zjcvnm.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_view_zjcvnm.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_ynafwc.title as varchar), '(' || airport_heliport_touchdownliftoff_view_ynafwc.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_view_ynafwc.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_eytioj.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_eytioj.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_eytioj.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_obhlrv.title as varchar), '(' || airport_heliport_airportheliport_view_obhlrv.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_view_obhlrv.href AS pointchoiceairportreferencepoint_href,
    geometry_point_view_jluvwb.geom AS geom,
    ST_X(geometry_point_view_jluvwb.geom) AS longitude,
    ST_Y(geometry_point_view_jluvwb.geom) AS latitude,
    geometry_point_view_jluvwb.horizontalAccuracy,
    coalesce(cast(shared_radiofrequencyarea_view_csimjp.title as varchar), '(' || shared_radiofrequencyarea_view_csimjp.nilreason[1] || ')') AS extendedservicevolume,
    shared_radiofrequencyarea_view_csimjp.href AS extendedservicevolume_href,
    jsonb_agg(navaids_points_pointreference_view_anqjap.id) AS facilitymakeup,
    jsonb_agg(notes_note_view_vkirav.*) AS annotation
from aerial_refuelling.aerialrefuellingpoint_pt 
inner join aerial_refuelling.aerialrefuellingpoint on aerial_refuelling.aerialrefuellingpoint_pt.aerialrefuellingpoint_id = aerial_refuelling.aerialrefuellingpoint.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_ashvac on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_fixdesignatedpoint_id = navaids_points_designatedpoint_view_ashvac.id
left join navaids_points.navaid_view navaids_points_navaid_view_zjcvnm on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_navaidsystem_id = navaids_points_navaid_view_zjcvnm.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_ynafwc on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_aimingpoint_id = airport_heliport_touchdownliftoff_view_ynafwc.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_eytioj on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_eytioj.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_obhlrv on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_airportreferencepoint_id = airport_heliport_airportheliport_view_obhlrv.id
left join geometry.point_view geometry_point_view_jluvwb on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_position_id = geometry_point_view_jluvwb.id
left join shared.radiofrequencyarea_view shared_radiofrequencyarea_view_csimjp on aerial_refuelling.aerialrefuellingpoint.extendedservicevolume_id = shared_radiofrequencyarea_view_csimjp.id
left join master_join master_join_idcwhf on aerial_refuelling.aerialrefuellingpoint.id = master_join_idcwhf.source_id
left join navaids_points.pointreference_view navaids_points_pointreference_view_anqjap on master_join_idcwhf.target_id = navaids_points_pointreference_view_anqjap.id
left join master_join master_join_kzwxdf on aerial_refuelling.aerialrefuellingpoint.id = master_join_kzwxdf.source_id
left join notes.note_view notes_note_view_vkirav on master_join_kzwxdf.target_id = notes_note_view_vkirav.id
group by
    aerial_refuelling.aerialrefuellingpoint_pt.id,
    aerial_refuelling.aerialrefuellingpoint_pt.nilreason,
    aerial_refuelling.aerialrefuellingpoint.reportingatc_value,
    aerial_refuelling.aerialrefuellingpoint.reportingatc_nilreason,
    aerial_refuelling.aerialrefuellingpoint.flyover_value,
    aerial_refuelling.aerialrefuellingpoint.flyover_nilreason,
    aerial_refuelling.aerialrefuellingpoint.waypoint_value,
    aerial_refuelling.aerialrefuellingpoint.waypoint_nilreason,
    aerial_refuelling.aerialrefuellingpoint.radarguidance_value,
    aerial_refuelling.aerialrefuellingpoint.radarguidance_nilreason,
    aerial_refuelling.aerialrefuellingpoint.sequence_value,
    aerial_refuelling.aerialrefuellingpoint.sequence_nilreason,
    aerial_refuelling.aerialrefuellingpoint.usagetype_value,
    aerial_refuelling.aerialrefuellingpoint.usagetype_nilreason,
    navaids_points_designatedpoint_view_ashvac.title,
    navaids_points_designatedpoint_view_ashvac.nilreason[1],
    navaids_points_designatedpoint_view_ashvac.href,
    navaids_points_navaid_view_zjcvnm.title,
    navaids_points_navaid_view_zjcvnm.nilreason[1],
    navaids_points_navaid_view_zjcvnm.href,
    airport_heliport_touchdownliftoff_view_ynafwc.title,
    airport_heliport_touchdownliftoff_view_ynafwc.nilreason[1],
    airport_heliport_touchdownliftoff_view_ynafwc.href,
    airport_heliport_runwaycentrelinepoint_view_eytioj.title,
    airport_heliport_runwaycentrelinepoint_view_eytioj.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_eytioj.href,
    airport_heliport_airportheliport_view_obhlrv.title,
    airport_heliport_airportheliport_view_obhlrv.nilreason[1],
    airport_heliport_airportheliport_view_obhlrv.href,
    geometry_point_view_jluvwb.geom,
    geometry_point_view_jluvwb.horizontalAccuracy,
    shared_radiofrequencyarea_view_csimjp.title,
    shared_radiofrequencyarea_view_csimjp.nilreason[1],
    shared_radiofrequencyarea_view_csimjp.href;
-- ['geometry.point_view', 'navaids_points.pointreference_view', 'airport_heliport.runwaycentrelinepoint_view', 'airport_heliport.airportheliport_view', 'airport_heliport.touchdownliftoff_view', 'navaids_points.navaid_view', 'notes.note_view', 'shared.radiofrequencyarea_view', 'navaids_points.designatedpoint_view']
create or replace view navaids_points.enroutesegmentpoint_view as
select
    navaids_points.enroutesegmentpoint_pt.id,
    navaids_points.enroutesegmentpoint_pt.nilreason AS enroutesegmentpoint_annotation,
    coalesce(cast(navaids_points.enroutesegmentpoint.reportingatc_value as varchar), '(' || navaids_points.enroutesegmentpoint.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(navaids_points.enroutesegmentpoint.flyover_value as varchar), '(' || navaids_points.enroutesegmentpoint.flyover_nilreason || ')') as flyover,
    coalesce(cast(navaids_points.enroutesegmentpoint.waypoint_value as varchar), '(' || navaids_points.enroutesegmentpoint.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(navaids_points.enroutesegmentpoint.radarguidance_value as varchar), '(' || navaids_points.enroutesegmentpoint.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(navaids_points.enroutesegmentpoint.rolefreeflight_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolefreeflight_nilreason || ')') as rolefreeflight,
    coalesce(cast(navaids_points.enroutesegmentpoint.rolervsm_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolervsm_nilreason || ')') as rolervsm,
    coalesce(cast(navaids_points.enroutesegmentpoint.rolemilitarytraining_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolemilitarytraining_nilreason || ')') as rolemilitarytraining,
    coalesce(cast(navaids_points.enroutesegmentpoint.turnradius_value as varchar) || ' ' || navaids_points.enroutesegmentpoint.turnradius_uom, '(' || navaids_points.enroutesegmentpoint.turnradius_nilreason || ')') as turnradius,
    coalesce(cast(navaids_points_designatedpoint_view_pmcdre.title as varchar), '(' || navaids_points_designatedpoint_view_pmcdre.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_view_pmcdre.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_view_qbtjgi.title as varchar), '(' || navaids_points_navaid_view_qbtjgi.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_view_qbtjgi.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_xyctzx.title as varchar), '(' || airport_heliport_touchdownliftoff_view_xyctzx.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_view_xyctzx.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_kmzyie.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_kmzyie.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_kmzyie.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_dpluxf.title as varchar), '(' || airport_heliport_airportheliport_view_dpluxf.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_view_dpluxf.href AS pointchoiceairportreferencepoint_href,
    geometry_point_view_mglfur.geom AS geom,
    ST_X(geometry_point_view_mglfur.geom) AS longitude,
    ST_Y(geometry_point_view_mglfur.geom) AS latitude,
    geometry_point_view_mglfur.horizontalAccuracy,
    coalesce(cast(shared_radiofrequencyarea_view_ilnqqz.title as varchar), '(' || shared_radiofrequencyarea_view_ilnqqz.nilreason[1] || ')') AS extendedservicevolume,
    shared_radiofrequencyarea_view_ilnqqz.href AS extendedservicevolume_href,
    jsonb_agg(navaids_points_pointreference_view_cmjhad.id) AS facilitymakeup,
    jsonb_agg(notes_note_view_txxtsw.*) AS annotation
from navaids_points.enroutesegmentpoint_pt 
inner join navaids_points.enroutesegmentpoint on navaids_points.enroutesegmentpoint_pt.enroutesegmentpoint_id = navaids_points.enroutesegmentpoint.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_pmcdre on navaids_points.enroutesegmentpoint.enroutesegmentpoint_fixdesignatedpoint_id = navaids_points_designatedpoint_view_pmcdre.id
left join navaids_points.navaid_view navaids_points_navaid_view_qbtjgi on navaids_points.enroutesegmentpoint.enroutesegmentpoint_navaidsystem_id = navaids_points_navaid_view_qbtjgi.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_xyctzx on navaids_points.enroutesegmentpoint.enroutesegmentpoint_aimingpoint_id = airport_heliport_touchdownliftoff_view_xyctzx.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_kmzyie on navaids_points.enroutesegmentpoint.enroutesegmentpoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_kmzyie.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_dpluxf on navaids_points.enroutesegmentpoint.enroutesegmentpoint_airportreferencepoint_id = airport_heliport_airportheliport_view_dpluxf.id
left join geometry.point_view geometry_point_view_mglfur on navaids_points.enroutesegmentpoint.enroutesegmentpoint_position_id = geometry_point_view_mglfur.id
left join shared.radiofrequencyarea_view shared_radiofrequencyarea_view_ilnqqz on navaids_points.enroutesegmentpoint.extendedservicevolume_id = shared_radiofrequencyarea_view_ilnqqz.id
left join master_join master_join_qrytiz on navaids_points.enroutesegmentpoint.id = master_join_qrytiz.source_id
left join navaids_points.pointreference_view navaids_points_pointreference_view_cmjhad on master_join_qrytiz.target_id = navaids_points_pointreference_view_cmjhad.id
left join master_join master_join_jrpcfs on navaids_points.enroutesegmentpoint.id = master_join_jrpcfs.source_id
left join notes.note_view notes_note_view_txxtsw on master_join_jrpcfs.target_id = notes_note_view_txxtsw.id
group by
    navaids_points.enroutesegmentpoint_pt.id,
    navaids_points.enroutesegmentpoint_pt.nilreason,
    navaids_points.enroutesegmentpoint.reportingatc_value,
    navaids_points.enroutesegmentpoint.reportingatc_nilreason,
    navaids_points.enroutesegmentpoint.flyover_value,
    navaids_points.enroutesegmentpoint.flyover_nilreason,
    navaids_points.enroutesegmentpoint.waypoint_value,
    navaids_points.enroutesegmentpoint.waypoint_nilreason,
    navaids_points.enroutesegmentpoint.radarguidance_value,
    navaids_points.enroutesegmentpoint.radarguidance_nilreason,
    navaids_points.enroutesegmentpoint.rolefreeflight_value,
    navaids_points.enroutesegmentpoint.rolefreeflight_nilreason,
    navaids_points.enroutesegmentpoint.rolervsm_value,
    navaids_points.enroutesegmentpoint.rolervsm_nilreason,
    navaids_points.enroutesegmentpoint.rolemilitarytraining_value,
    navaids_points.enroutesegmentpoint.rolemilitarytraining_nilreason,
    navaids_points.enroutesegmentpoint.turnradius_value,
    navaids_points.enroutesegmentpoint.turnradius_uom,
    navaids_points.enroutesegmentpoint.turnradius_nilreason,
    navaids_points_designatedpoint_view_pmcdre.title,
    navaids_points_designatedpoint_view_pmcdre.nilreason[1],
    navaids_points_designatedpoint_view_pmcdre.href,
    navaids_points_navaid_view_qbtjgi.title,
    navaids_points_navaid_view_qbtjgi.nilreason[1],
    navaids_points_navaid_view_qbtjgi.href,
    airport_heliport_touchdownliftoff_view_xyctzx.title,
    airport_heliport_touchdownliftoff_view_xyctzx.nilreason[1],
    airport_heliport_touchdownliftoff_view_xyctzx.href,
    airport_heliport_runwaycentrelinepoint_view_kmzyie.title,
    airport_heliport_runwaycentrelinepoint_view_kmzyie.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_kmzyie.href,
    airport_heliport_airportheliport_view_dpluxf.title,
    airport_heliport_airportheliport_view_dpluxf.nilreason[1],
    airport_heliport_airportheliport_view_dpluxf.href,
    geometry_point_view_mglfur.geom,
    geometry_point_view_mglfur.horizontalAccuracy,
    shared_radiofrequencyarea_view_ilnqqz.title,
    shared_radiofrequencyarea_view_ilnqqz.nilreason[1],
    shared_radiofrequencyarea_view_ilnqqz.href;
-- ['geometry.point_view', 'navaids_points.pointreference_view', 'airport_heliport.runwaycentrelinepoint_view', 'airport_heliport.airportheliport_view', 'airport_heliport.touchdownliftoff_view', 'navaids_points.navaid_view', 'notes.note_view', 'shared.radiofrequencyarea_view', 'navaids_points.designatedpoint_view']
create or replace view navaids_points.terminalsegmentpoint_view as
select
    navaids_points.terminalsegmentpoint_pt.id,
    navaids_points.terminalsegmentpoint_pt.nilreason AS terminalsegmentpoint_annotation,
    coalesce(cast(navaids_points.terminalsegmentpoint.reportingatc_value as varchar), '(' || navaids_points.terminalsegmentpoint.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(navaids_points.terminalsegmentpoint.flyover_value as varchar), '(' || navaids_points.terminalsegmentpoint.flyover_nilreason || ')') as flyover,
    coalesce(cast(navaids_points.terminalsegmentpoint.waypoint_value as varchar), '(' || navaids_points.terminalsegmentpoint.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(navaids_points.terminalsegmentpoint.radarguidance_value as varchar), '(' || navaids_points.terminalsegmentpoint.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(navaids_points.terminalsegmentpoint.role_value as varchar), '(' || navaids_points.terminalsegmentpoint.role_nilreason || ')') as role,
    coalesce(cast(navaids_points.terminalsegmentpoint.leadradial_value as varchar), '(' || navaids_points.terminalsegmentpoint.leadradial_nilreason || ')') as leadradial,
    coalesce(cast(navaids_points.terminalsegmentpoint.indicatorfacf_value as varchar), '(' || navaids_points.terminalsegmentpoint.indicatorfacf_nilreason || ')') as indicatorfacf,
    coalesce(cast(navaids_points.terminalsegmentpoint.leaddme_value as varchar) || ' ' || navaids_points.terminalsegmentpoint.leaddme_uom, '(' || navaids_points.terminalsegmentpoint.leaddme_nilreason || ')') as leaddme,
    coalesce(cast(navaids_points_designatedpoint_view_qoendn.title as varchar), '(' || navaids_points_designatedpoint_view_qoendn.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_view_qoendn.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_view_npxydw.title as varchar), '(' || navaids_points_navaid_view_npxydw.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_view_npxydw.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_view_igpqtc.title as varchar), '(' || airport_heliport_touchdownliftoff_view_igpqtc.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_view_igpqtc.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_view_bbrkbk.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_view_bbrkbk.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_view_bbrkbk.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_view_xvpjap.title as varchar), '(' || airport_heliport_airportheliport_view_xvpjap.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_view_xvpjap.href AS pointchoiceairportreferencepoint_href,
    geometry_point_view_rfrfio.geom AS geom,
    ST_X(geometry_point_view_rfrfio.geom) AS longitude,
    ST_Y(geometry_point_view_rfrfio.geom) AS latitude,
    geometry_point_view_rfrfio.horizontalAccuracy,
    coalesce(cast(shared_radiofrequencyarea_view_fkoppw.title as varchar), '(' || shared_radiofrequencyarea_view_fkoppw.nilreason[1] || ')') AS extendedservicevolume,
    shared_radiofrequencyarea_view_fkoppw.href AS extendedservicevolume_href,
    jsonb_agg(navaids_points_pointreference_view_inchbj.id) AS facilitymakeup,
    jsonb_agg(notes_note_view_tuanbw.*) AS annotation
from navaids_points.terminalsegmentpoint_pt 
inner join navaids_points.terminalsegmentpoint on navaids_points.terminalsegmentpoint_pt.terminalsegmentpoint_id = navaids_points.terminalsegmentpoint.id
left join navaids_points.designatedpoint_view navaids_points_designatedpoint_view_qoendn on navaids_points.terminalsegmentpoint.terminalsegmentpoint_fixdesignatedpoint_id = navaids_points_designatedpoint_view_qoendn.id
left join navaids_points.navaid_view navaids_points_navaid_view_npxydw on navaids_points.terminalsegmentpoint.terminalsegmentpoint_navaidsystem_id = navaids_points_navaid_view_npxydw.id
left join airport_heliport.touchdownliftoff_view airport_heliport_touchdownliftoff_view_igpqtc on navaids_points.terminalsegmentpoint.terminalsegmentpoint_aimingpoint_id = airport_heliport_touchdownliftoff_view_igpqtc.id
left join airport_heliport.runwaycentrelinepoint_view airport_heliport_runwaycentrelinepoint_view_bbrkbk on navaids_points.terminalsegmentpoint.terminalsegmentpoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_view_bbrkbk.id
left join airport_heliport.airportheliport_view airport_heliport_airportheliport_view_xvpjap on navaids_points.terminalsegmentpoint.terminalsegmentpoint_airportreferencepoint_id = airport_heliport_airportheliport_view_xvpjap.id
left join geometry.point_view geometry_point_view_rfrfio on navaids_points.terminalsegmentpoint.terminalsegmentpoint_position_id = geometry_point_view_rfrfio.id
left join shared.radiofrequencyarea_view shared_radiofrequencyarea_view_fkoppw on navaids_points.terminalsegmentpoint.extendedservicevolume_id = shared_radiofrequencyarea_view_fkoppw.id
left join master_join master_join_dnggkd on navaids_points.terminalsegmentpoint.id = master_join_dnggkd.source_id
left join navaids_points.pointreference_view navaids_points_pointreference_view_inchbj on master_join_dnggkd.target_id = navaids_points_pointreference_view_inchbj.id
left join master_join master_join_dqqnsf on navaids_points.terminalsegmentpoint.id = master_join_dqqnsf.source_id
left join notes.note_view notes_note_view_tuanbw on master_join_dqqnsf.target_id = notes_note_view_tuanbw.id
group by
    navaids_points.terminalsegmentpoint_pt.id,
    navaids_points.terminalsegmentpoint_pt.nilreason,
    navaids_points.terminalsegmentpoint.reportingatc_value,
    navaids_points.terminalsegmentpoint.reportingatc_nilreason,
    navaids_points.terminalsegmentpoint.flyover_value,
    navaids_points.terminalsegmentpoint.flyover_nilreason,
    navaids_points.terminalsegmentpoint.waypoint_value,
    navaids_points.terminalsegmentpoint.waypoint_nilreason,
    navaids_points.terminalsegmentpoint.radarguidance_value,
    navaids_points.terminalsegmentpoint.radarguidance_nilreason,
    navaids_points.terminalsegmentpoint.role_value,
    navaids_points.terminalsegmentpoint.role_nilreason,
    navaids_points.terminalsegmentpoint.leadradial_value,
    navaids_points.terminalsegmentpoint.leadradial_nilreason,
    navaids_points.terminalsegmentpoint.indicatorfacf_value,
    navaids_points.terminalsegmentpoint.indicatorfacf_nilreason,
    navaids_points.terminalsegmentpoint.leaddme_value,
    navaids_points.terminalsegmentpoint.leaddme_uom,
    navaids_points.terminalsegmentpoint.leaddme_nilreason,
    navaids_points_designatedpoint_view_qoendn.title,
    navaids_points_designatedpoint_view_qoendn.nilreason[1],
    navaids_points_designatedpoint_view_qoendn.href,
    navaids_points_navaid_view_npxydw.title,
    navaids_points_navaid_view_npxydw.nilreason[1],
    navaids_points_navaid_view_npxydw.href,
    airport_heliport_touchdownliftoff_view_igpqtc.title,
    airport_heliport_touchdownliftoff_view_igpqtc.nilreason[1],
    airport_heliport_touchdownliftoff_view_igpqtc.href,
    airport_heliport_runwaycentrelinepoint_view_bbrkbk.title,
    airport_heliport_runwaycentrelinepoint_view_bbrkbk.nilreason[1],
    airport_heliport_runwaycentrelinepoint_view_bbrkbk.href,
    airport_heliport_airportheliport_view_xvpjap.title,
    airport_heliport_airportheliport_view_xvpjap.nilreason[1],
    airport_heliport_airportheliport_view_xvpjap.href,
    geometry_point_view_rfrfio.geom,
    geometry_point_view_rfrfio.horizontalAccuracy,
    shared_radiofrequencyarea_view_fkoppw.title,
    shared_radiofrequencyarea_view_fkoppw.nilreason[1],
    shared_radiofrequencyarea_view_fkoppw.href;
-- ['procedure.equipmentunavailableadjustment_view', 'notes.note_view']
create or replace view procedure.minima_view as
select
    procedure.minima_pt.id,
    procedure.minima_pt.nilreason AS minima_annotation,
    coalesce(cast(procedure.minima.altitudecode_value as varchar), '(' || procedure.minima.altitudecode_nilreason || ')') as altitudecode,
    coalesce(cast(procedure.minima.altitudereference_value as varchar), '(' || procedure.minima.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(procedure.minima.heightcode_value as varchar), '(' || procedure.minima.heightcode_nilreason || ')') as heightcode,
    coalesce(cast(procedure.minima.heightreference_value as varchar), '(' || procedure.minima.heightreference_nilreason || ')') as heightreference,
    coalesce(cast(procedure.minima.mandatoryrvr_value as varchar), '(' || procedure.minima.mandatoryrvr_nilreason || ')') as mandatoryrvr,
    coalesce(cast(procedure.minima.remotealtimeterminima_value as varchar), '(' || procedure.minima.remotealtimeterminima_nilreason || ')') as remotealtimeterminima,
    coalesce(cast(procedure.minima.altitude_value as varchar) || ' ' || procedure.minima.altitude_uom, '(' || procedure.minima.altitude_nilreason || ')') as altitude,
    coalesce(cast(procedure.minima.height_value as varchar) || ' ' || procedure.minima.height_uom, '(' || procedure.minima.height_nilreason || ')') as height,
    coalesce(cast(procedure.minima.militaryheight_value as varchar) || ' ' || procedure.minima.militaryheight_uom, '(' || procedure.minima.militaryheight_nilreason || ')') as militaryheight,
    coalesce(cast(procedure.minima.radioheight_value as varchar) || ' ' || procedure.minima.radioheight_uom, '(' || procedure.minima.radioheight_nilreason || ')') as radioheight,
    coalesce(cast(procedure.minima.visibility_value as varchar) || ' ' || procedure.minima.visibility_uom, '(' || procedure.minima.visibility_nilreason || ')') as visibility,
    coalesce(cast(procedure.minima.militaryvisibility_value as varchar) || ' ' || procedure.minima.militaryvisibility_uom, '(' || procedure.minima.militaryvisibility_nilreason || ')') as militaryvisibility,
    jsonb_agg(procedure_equipmentunavailableadjustment_view_iyiuxf.id) AS adjustmentinop,
    jsonb_agg(notes_note_view_urbnvl.*) AS annotation
from procedure.minima_pt 
inner join procedure.minima on procedure.minima_pt.minima_id = procedure.minima.id
left join master_join master_join_xzahul on procedure.minima.id = master_join_xzahul.source_id
left join procedure.equipmentunavailableadjustment_view procedure_equipmentunavailableadjustment_view_iyiuxf on master_join_xzahul.target_id = procedure_equipmentunavailableadjustment_view_iyiuxf.id
left join master_join master_join_smckmp on procedure.minima.id = master_join_smckmp.source_id
left join notes.note_view notes_note_view_urbnvl on master_join_smckmp.target_id = notes_note_view_urbnvl.id
group by
    procedure.minima_pt.id,
    procedure.minima_pt.nilreason,
    procedure.minima.altitudecode_value,
    procedure.minima.altitudecode_nilreason,
    procedure.minima.altitudereference_value,
    procedure.minima.altitudereference_nilreason,
    procedure.minima.heightcode_value,
    procedure.minima.heightcode_nilreason,
    procedure.minima.heightreference_value,
    procedure.minima.heightreference_nilreason,
    procedure.minima.mandatoryrvr_value,
    procedure.minima.mandatoryrvr_nilreason,
    procedure.minima.remotealtimeterminima_value,
    procedure.minima.remotealtimeterminima_nilreason,
    procedure.minima.altitude_value,
    procedure.minima.altitude_uom,
    procedure.minima.altitude_nilreason,
    procedure.minima.height_value,
    procedure.minima.height_uom,
    procedure.minima.height_nilreason,
    procedure.minima.militaryheight_value,
    procedure.minima.militaryheight_uom,
    procedure.minima.militaryheight_nilreason,
    procedure.minima.radioheight_value,
    procedure.minima.radioheight_uom,
    procedure.minima.radioheight_nilreason,
    procedure.minima.visibility_value,
    procedure.minima.visibility_uom,
    procedure.minima.visibility_nilreason,
    procedure.minima.militaryvisibility_value,
    procedure.minima.militaryvisibility_uom,
    procedure.minima.militaryvisibility_nilreason;
-- ['shared.obstruction_view', 'shared.circlesector_view', 'geometry.surface_view', 'notes.note_view', 'procedure.sectordesign_view']
create or replace view procedure.navigationareasector_view as
select
    procedure.navigationareasector_pt.id,
    procedure.navigationareasector_pt.nilreason AS navigationareasector_annotation,
    shared_circlesector_view_jiazoa.id AS sectordefinition,
    geometry_surface_view_jpckmf.geom AS geom,
    jsonb_agg(shared_obstruction_view_dtccpb.id) AS significantobstacle,
    jsonb_agg(procedure_sectordesign_view_yqztds.id) AS sectorcriteria,
    jsonb_agg(notes_note_view_zvhoza.*) AS annotation
from procedure.navigationareasector_pt 
inner join procedure.navigationareasector on procedure.navigationareasector_pt.navigationareasector_id = procedure.navigationareasector.id
left join shared.circlesector_view shared_circlesector_view_jiazoa on procedure.navigationareasector.sectordefinition_id = shared_circlesector_view_jiazoa.id
left join geometry.surface_view geometry_surface_view_jpckmf on procedure.navigationareasector.extent_id = geometry_surface_view_jpckmf.id
left join master_join master_join_wgdero on procedure.navigationareasector.id = master_join_wgdero.source_id
left join shared.obstruction_view shared_obstruction_view_dtccpb on master_join_wgdero.target_id = shared_obstruction_view_dtccpb.id
left join master_join master_join_jxynai on procedure.navigationareasector.id = master_join_jxynai.source_id
left join procedure.sectordesign_view procedure_sectordesign_view_yqztds on master_join_jxynai.target_id = procedure_sectordesign_view_yqztds.id
left join master_join master_join_xpggxu on procedure.navigationareasector.id = master_join_xpggxu.source_id
left join notes.note_view notes_note_view_zvhoza on master_join_xpggxu.target_id = notes_note_view_zvhoza.id
group by
    procedure.navigationareasector_pt.id,
    procedure.navigationareasector_pt.nilreason,
    shared_circlesector_view_jiazoa.id,
    geometry_surface_view_jpckmf.geom;
-- ['shared.obstruction_view', 'geometry.surface_view', 'shared.aircraftcharacteristic_view', 'geometry.curve_view', 'notes.note_view']
create or replace view shared.obstacleassessmentarea_view as
select
    shared.obstacleassessmentarea_pt.id,
    shared.obstacleassessmentarea_pt.nilreason AS obstacleassessmentarea_annotation,
    coalesce(cast(shared.obstacleassessmentarea.type_value as varchar), '(' || shared.obstacleassessmentarea.type_nilreason || ')') as type,
    coalesce(cast(shared.obstacleassessmentarea.sectionnumber_value as varchar), '(' || shared.obstacleassessmentarea.sectionnumber_nilreason || ')') as sectionnumber,
    coalesce(cast(shared.obstacleassessmentarea.slope_value as varchar), '(' || shared.obstacleassessmentarea.slope_nilreason || ')') as slope,
    coalesce(cast(shared.obstacleassessmentarea.gradientlowhigh_value as varchar), '(' || shared.obstacleassessmentarea.gradientlowhigh_nilreason || ')') as gradientlowhigh,
    coalesce(cast(shared.obstacleassessmentarea.surfacezone_value as varchar), '(' || shared.obstacleassessmentarea.surfacezone_nilreason || ')') as surfacezone,
    coalesce(cast(shared.obstacleassessmentarea.safetyregulation_value as varchar), '(' || shared.obstacleassessmentarea.safetyregulation_nilreason || ')') as safetyregulation,
    coalesce(cast(shared.obstacleassessmentarea.assessedaltitude_value as varchar) || ' ' || shared.obstacleassessmentarea.assessedaltitude_uom, '(' || shared.obstacleassessmentarea.assessedaltitude_nilreason || ')') as assessedaltitude,
    coalesce(cast(shared.obstacleassessmentarea.slopeloweraltitude_value as varchar) || ' ' || shared.obstacleassessmentarea.slopeloweraltitude_uom, '(' || shared.obstacleassessmentarea.slopeloweraltitude_nilreason || ')') as slopeloweraltitude,
    geometry_surface_view_telsqa.geom AS geom,
    geometry_curve_view_yuazkw.geom AS geom,
    jsonb_agg(shared_aircraftcharacteristic_view_gwipob.id) AS aircraftcategory,
    jsonb_agg(shared_obstruction_view_cqqexo.id) AS significantobstacle,
    jsonb_agg(notes_note_view_wudrym.*) AS annotation
from shared.obstacleassessmentarea_pt 
inner join shared.obstacleassessmentarea on shared.obstacleassessmentarea_pt.obstacleassessmentarea_id = shared.obstacleassessmentarea.id
left join geometry.surface_view geometry_surface_view_telsqa on shared.obstacleassessmentarea.surface_id = geometry_surface_view_telsqa.id
left join geometry.curve_view geometry_curve_view_yuazkw on shared.obstacleassessmentarea.startingcurve_id = geometry_curve_view_yuazkw.id
left join master_join master_join_uhokva on shared.obstacleassessmentarea.id = master_join_uhokva.source_id
left join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_gwipob on master_join_uhokva.target_id = shared_aircraftcharacteristic_view_gwipob.id
left join master_join master_join_rixfsm on shared.obstacleassessmentarea.id = master_join_rixfsm.source_id
left join shared.obstruction_view shared_obstruction_view_cqqexo on master_join_rixfsm.target_id = shared_obstruction_view_cqqexo.id
left join master_join master_join_yziefc on shared.obstacleassessmentarea.id = master_join_yziefc.source_id
left join notes.note_view notes_note_view_wudrym on master_join_yziefc.target_id = notes_note_view_wudrym.id
group by
    shared.obstacleassessmentarea_pt.id,
    shared.obstacleassessmentarea_pt.nilreason,
    shared.obstacleassessmentarea.type_value,
    shared.obstacleassessmentarea.type_nilreason,
    shared.obstacleassessmentarea.sectionnumber_value,
    shared.obstacleassessmentarea.sectionnumber_nilreason,
    shared.obstacleassessmentarea.slope_value,
    shared.obstacleassessmentarea.slope_nilreason,
    shared.obstacleassessmentarea.gradientlowhigh_value,
    shared.obstacleassessmentarea.gradientlowhigh_nilreason,
    shared.obstacleassessmentarea.surfacezone_value,
    shared.obstacleassessmentarea.surfacezone_nilreason,
    shared.obstacleassessmentarea.safetyregulation_value,
    shared.obstacleassessmentarea.safetyregulation_nilreason,
    shared.obstacleassessmentarea.assessedaltitude_value,
    shared.obstacleassessmentarea.assessedaltitude_uom,
    shared.obstacleassessmentarea.assessedaltitude_nilreason,
    shared.obstacleassessmentarea.slopeloweraltitude_value,
    shared.obstacleassessmentarea.slopeloweraltitude_uom,
    shared.obstacleassessmentarea.slopeloweraltitude_nilreason,
    geometry_surface_view_telsqa.geom,
    geometry_curve_view_yuazkw.geom;
-- ['shared.obstruction_view', 'geometry.surface_view', 'shared.circlesector_view', 'notes.note_view']
create or replace view procedure.safealtitudeareasector_view as
select
    procedure.safealtitudeareasector_pt.id,
    procedure.safealtitudeareasector_pt.nilreason AS safealtitudeareasector_annotation,
    coalesce(cast(procedure.safealtitudeareasector.bufferwidth_value as varchar) || ' ' || procedure.safealtitudeareasector.bufferwidth_uom, '(' || procedure.safealtitudeareasector.bufferwidth_nilreason || ')') as bufferwidth,
    geometry_surface_view_uifmcc.geom AS geom,
    shared_circlesector_view_vriksy.id AS sectordefinition,
    jsonb_agg(shared_obstruction_view_kqijel.id) AS significantobstacle,
    jsonb_agg(notes_note_view_lapwdg.*) AS annotation
from procedure.safealtitudeareasector_pt 
inner join procedure.safealtitudeareasector on procedure.safealtitudeareasector_pt.safealtitudeareasector_id = procedure.safealtitudeareasector.id
left join geometry.surface_view geometry_surface_view_uifmcc on procedure.safealtitudeareasector.extent_id = geometry_surface_view_uifmcc.id
left join shared.circlesector_view shared_circlesector_view_vriksy on procedure.safealtitudeareasector.sectordefinition_id = shared_circlesector_view_vriksy.id
left join master_join master_join_vidkpw on procedure.safealtitudeareasector.id = master_join_vidkpw.source_id
left join shared.obstruction_view shared_obstruction_view_kqijel on master_join_vidkpw.target_id = shared_obstruction_view_kqijel.id
left join master_join master_join_qzxffm on procedure.safealtitudeareasector.id = master_join_qzxffm.source_id
left join notes.note_view notes_note_view_lapwdg on master_join_qzxffm.target_id = notes_note_view_lapwdg.id
group by
    procedure.safealtitudeareasector_pt.id,
    procedure.safealtitudeareasector_pt.nilreason,
    procedure.safealtitudeareasector.bufferwidth_value,
    procedure.safealtitudeareasector.bufferwidth_uom,
    procedure.safealtitudeareasector.bufferwidth_nilreason,
    geometry_surface_view_uifmcc.geom,
    shared_circlesector_view_vriksy.id;
-- ['shared.obstruction_view', 'shared.circlesector_view', 'geometry.surface_view', 'notes.note_view']
create or replace view procedure.terminalarrivalareasector_view as
select
    procedure.terminalarrivalareasector_pt.id,
    procedure.terminalarrivalareasector_pt.nilreason AS terminalarrivalareasector_annotation,
    coalesce(cast(procedure.terminalarrivalareasector.flybycode_value as varchar), '(' || procedure.terminalarrivalareasector.flybycode_nilreason || ')') as flybycode,
    coalesce(cast(procedure.terminalarrivalareasector.procedureturnrequired_value as varchar), '(' || procedure.terminalarrivalareasector.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.terminalarrivalareasector.altitudedescription_value as varchar), '(' || procedure.terminalarrivalareasector.altitudedescription_nilreason || ')') as altitudedescription,
    shared_circlesector_view_lyquao.id AS sectordefinition,
    geometry_surface_view_duwrgf.geom AS geom,
    jsonb_agg(shared_obstruction_view_eviexy.id) AS significantobstacle,
    jsonb_agg(notes_note_view_dkrqsu.*) AS annotation
from procedure.terminalarrivalareasector_pt 
inner join procedure.terminalarrivalareasector on procedure.terminalarrivalareasector_pt.terminalarrivalareasector_id = procedure.terminalarrivalareasector.id
left join shared.circlesector_view shared_circlesector_view_lyquao on procedure.terminalarrivalareasector.sectordefinition_id = shared_circlesector_view_lyquao.id
left join geometry.surface_view geometry_surface_view_duwrgf on procedure.terminalarrivalareasector.extent_id = geometry_surface_view_duwrgf.id
left join master_join master_join_cdzuzg on procedure.terminalarrivalareasector.id = master_join_cdzuzg.source_id
left join shared.obstruction_view shared_obstruction_view_eviexy on master_join_cdzuzg.target_id = shared_obstruction_view_eviexy.id
left join master_join master_join_pirnmi on procedure.terminalarrivalareasector.id = master_join_pirnmi.source_id
left join notes.note_view notes_note_view_dkrqsu on master_join_pirnmi.target_id = notes_note_view_dkrqsu.id
group by
    procedure.terminalarrivalareasector_pt.id,
    procedure.terminalarrivalareasector_pt.nilreason,
    procedure.terminalarrivalareasector.flybycode_value,
    procedure.terminalarrivalareasector.flybycode_nilreason,
    procedure.terminalarrivalareasector.procedureturnrequired_value,
    procedure.terminalarrivalareasector.procedureturnrequired_nilreason,
    procedure.terminalarrivalareasector.altitudedescription_value,
    procedure.terminalarrivalareasector.altitudedescription_nilreason,
    shared_circlesector_view_lyquao.id,
    geometry_surface_view_duwrgf.geom;
-- ['notes.note_view', 'shared.lightelementstatus_view', 'geometry.elevatedpoint_view']
create or replace view shared.lightelement_view as
select
    shared.lightelement_pt.id,
    shared.lightelement_pt.nilreason AS lightelement_annotation,
    coalesce(cast(shared.lightelement.colour_value as varchar), '(' || shared.lightelement.colour_nilreason || ')') as colour,
    coalesce(cast(shared.lightelement.intensitylevel_value as varchar), '(' || shared.lightelement.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(shared.lightelement.type_value as varchar), '(' || shared.lightelement.type_nilreason || ')') as type,
    coalesce(cast(shared.lightelement.intensity_value as varchar) || ' ' || shared.lightelement.intensity_uom, '(' || shared.lightelement.intensity_nilreason || ')') as intensity,
    geometry_elevatedpoint_view_bbouze.geom AS geom,
    ST_X(geometry_elevatedpoint_view_bbouze.geom) AS longitude,
    ST_Y(geometry_elevatedpoint_view_bbouze.geom) AS latitude,
    geometry_elevatedpoint_view_bbouze.elevation,
    geometry_elevatedpoint_view_bbouze.geoidUndulation,
    geometry_elevatedpoint_view_bbouze.verticalDatum,
    geometry_elevatedpoint_view_bbouze.verticalAccuracy,
    geometry_elevatedpoint_view_bbouze.horizontalAccuracy,
    jsonb_agg(notes_note_view_bojhos.*) AS annotation,
    jsonb_agg(shared_lightelementstatus_view_nyjnwt.id) AS availability
from shared.lightelement_pt 
inner join shared.lightelement on shared.lightelement_pt.lightelement_id = shared.lightelement.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_bbouze on shared.lightelement.location_id = geometry_elevatedpoint_view_bbouze.id
left join master_join master_join_vjvvqv on shared.lightelement.id = master_join_vjvvqv.source_id
left join notes.note_view notes_note_view_bojhos on master_join_vjvvqv.target_id = notes_note_view_bojhos.id
left join master_join master_join_xnuiku on shared.lightelement.id = master_join_xnuiku.source_id
left join shared.lightelementstatus_view shared_lightelementstatus_view_nyjnwt on master_join_xnuiku.target_id = shared_lightelementstatus_view_nyjnwt.id
group by
    shared.lightelement_pt.id,
    shared.lightelement_pt.nilreason,
    shared.lightelement.colour_value,
    shared.lightelement.colour_nilreason,
    shared.lightelement.intensitylevel_value,
    shared.lightelement.intensitylevel_nilreason,
    shared.lightelement.type_value,
    shared.lightelement.type_nilreason,
    shared.lightelement.intensity_value,
    shared.lightelement.intensity_uom,
    shared.lightelement.intensity_nilreason,
    geometry_elevatedpoint_view_bbouze.geom,
    geometry_elevatedpoint_view_bbouze.elevation,
    geometry_elevatedpoint_view_bbouze.geoidUndulation,
    geometry_elevatedpoint_view_bbouze.verticalDatum,
    geometry_elevatedpoint_view_bbouze.verticalAccuracy,
    geometry_elevatedpoint_view_bbouze.horizontalAccuracy;
-- ['notes.note_view', 'airport_heliport.runwaydeclareddistancevalue_view']
create or replace view airport_heliport.runwaydeclareddistance_view as
select
    airport_heliport.runwaydeclareddistance_pt.id,
    airport_heliport.runwaydeclareddistance_pt.nilreason AS runwaydeclareddistance_annotation,
    coalesce(cast(airport_heliport.runwaydeclareddistance.type_value as varchar), '(' || airport_heliport.runwaydeclareddistance.type_nilreason || ')') as type,
    jsonb_agg(airport_heliport_runwaydeclareddistancevalue_view_twhpbs.id) AS declaredvalue,
    jsonb_agg(notes_note_view_ohwnag.*) AS annotation
from airport_heliport.runwaydeclareddistance_pt 
inner join airport_heliport.runwaydeclareddistance on airport_heliport.runwaydeclareddistance_pt.runwaydeclareddistance_id = airport_heliport.runwaydeclareddistance.id
left join master_join master_join_fqtoah on airport_heliport.runwaydeclareddistance.id = master_join_fqtoah.source_id
left join airport_heliport.runwaydeclareddistancevalue_view airport_heliport_runwaydeclareddistancevalue_view_twhpbs on master_join_fqtoah.target_id = airport_heliport_runwaydeclareddistancevalue_view_twhpbs.id
left join master_join master_join_dcjmlu on airport_heliport.runwaydeclareddistance.id = master_join_dcjmlu.source_id
left join notes.note_view notes_note_view_ohwnag on master_join_dcjmlu.target_id = notes_note_view_ohwnag.id
group by
    airport_heliport.runwaydeclareddistance_pt.id,
    airport_heliport.runwaydeclareddistance_pt.nilreason,
    airport_heliport.runwaydeclareddistance.type_value,
    airport_heliport.runwaydeclareddistance.type_nilreason;
-- ['notes.note_view', 'shared.onlinecontact_view', 'shared.telephonecontact_view', 'shared.postaladdress_view']

-- ['aerial_refuelling.aerialrefuellingpoint_view', 'shared.airspacelayer_view', 'geometry.surface_view', 'notes.note_view']
create or replace view aerial_refuelling.aerialrefuellinganchor_view as
select
    aerial_refuelling.aerialrefuellinganchor_pt.id,
    aerial_refuelling.aerialrefuellinganchor_pt.nilreason AS aerialrefuellinganchor_annotation,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.outboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.outboundcourse_nilreason || ')') as outboundcourse,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_nilreason || ')') as outboundcoursetype,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.inboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.inboundcourse_nilreason || ')') as inboundcourse,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.turndirection_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_nilreason || ')') as refuellingbaselevelreference,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.speedlimit_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.speedlimit_uom, '(' || aerial_refuelling.aerialrefuellinganchor.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.legseparation_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.legseparation_uom, '(' || aerial_refuelling.aerialrefuellinganchor.legseparation_nilreason || ')') as legseparation,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.leglength_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.leglength_uom, '(' || aerial_refuelling.aerialrefuellinganchor.leglength_nilreason || ')') as leglength,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_uom, '(' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_nilreason || ')') as refuellingbaselevel,
    geometry_surface_view_kqthef.geom AS geom,
    jsonb_agg(shared_airspacelayer_view_rnhujw.id) AS verticalextent,
    jsonb_agg(aerial_refuelling_aerialrefuellingpoint_view_hfzfko.id) AS point,
    jsonb_agg(notes_note_view_jqlkar.*) AS annotation
from aerial_refuelling.aerialrefuellinganchor_pt 
inner join aerial_refuelling.aerialrefuellinganchor on aerial_refuelling.aerialrefuellinganchor_pt.aerialrefuellinganchor_id = aerial_refuelling.aerialrefuellinganchor.id
left join geometry.surface_view geometry_surface_view_kqthef on aerial_refuelling.aerialrefuellinganchor.extent_id = geometry_surface_view_kqthef.id
left join master_join master_join_wzshnx on aerial_refuelling.aerialrefuellinganchor.id = master_join_wzshnx.source_id
left join shared.airspacelayer_view shared_airspacelayer_view_rnhujw on master_join_wzshnx.target_id = shared_airspacelayer_view_rnhujw.id
left join master_join master_join_tbglpp on aerial_refuelling.aerialrefuellinganchor.id = master_join_tbglpp.source_id
left join aerial_refuelling.aerialrefuellingpoint_view aerial_refuelling_aerialrefuellingpoint_view_hfzfko on master_join_tbglpp.target_id = aerial_refuelling_aerialrefuellingpoint_view_hfzfko.id
left join master_join master_join_rfxtkd on aerial_refuelling.aerialrefuellinganchor.id = master_join_rfxtkd.source_id
left join notes.note_view notes_note_view_jqlkar on master_join_rfxtkd.target_id = notes_note_view_jqlkar.id
group by
    aerial_refuelling.aerialrefuellinganchor_pt.id,
    aerial_refuelling.aerialrefuellinganchor_pt.nilreason,
    aerial_refuelling.aerialrefuellinganchor.outboundcourse_value,
    aerial_refuelling.aerialrefuellinganchor.outboundcourse_nilreason,
    aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_value,
    aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_nilreason,
    aerial_refuelling.aerialrefuellinganchor.inboundcourse_value,
    aerial_refuelling.aerialrefuellinganchor.inboundcourse_nilreason,
    aerial_refuelling.aerialrefuellinganchor.turndirection_value,
    aerial_refuelling.aerialrefuellinganchor.turndirection_nilreason,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_value,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_nilreason,
    aerial_refuelling.aerialrefuellinganchor.speedlimit_value,
    aerial_refuelling.aerialrefuellinganchor.speedlimit_uom,
    aerial_refuelling.aerialrefuellinganchor.speedlimit_nilreason,
    aerial_refuelling.aerialrefuellinganchor.legseparation_value,
    aerial_refuelling.aerialrefuellinganchor.legseparation_uom,
    aerial_refuelling.aerialrefuellinganchor.legseparation_nilreason,
    aerial_refuelling.aerialrefuellinganchor.leglength_value,
    aerial_refuelling.aerialrefuellinganchor.leglength_uom,
    aerial_refuelling.aerialrefuellinganchor.leglength_nilreason,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_value,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_uom,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_nilreason,
    geometry_surface_view_kqthef.geom;
-- ['aerial_refuelling.aerialrefuellingpoint_view', 'shared.airspacelayer_view', 'notes.note_view', 'geometry.curve_view']
create or replace view aerial_refuelling.aerialrefuellingtrack_view as
select
    aerial_refuelling.aerialrefuellingtrack_pt.id,
    aerial_refuelling.aerialrefuellingtrack_pt.nilreason AS aerialrefuellingtrack_annotation,
    geometry_curve_view_pjpyxk.geom AS geom,
    jsonb_agg(aerial_refuelling_aerialrefuellingpoint_view_rqylzt.id) AS point,
    jsonb_agg(shared_airspacelayer_view_nkqvqa.id) AS verticalextent,
    jsonb_agg(notes_note_view_yfeacz.*) AS annotation
from aerial_refuelling.aerialrefuellingtrack_pt 
inner join aerial_refuelling.aerialrefuellingtrack on aerial_refuelling.aerialrefuellingtrack_pt.aerialrefuellingtrack_id = aerial_refuelling.aerialrefuellingtrack.id
left join geometry.curve_view geometry_curve_view_pjpyxk on aerial_refuelling.aerialrefuellingtrack.extent_id = geometry_curve_view_pjpyxk.id
left join master_join master_join_maacff on aerial_refuelling.aerialrefuellingtrack.id = master_join_maacff.source_id
left join aerial_refuelling.aerialrefuellingpoint_view aerial_refuelling_aerialrefuellingpoint_view_rqylzt on master_join_maacff.target_id = aerial_refuelling_aerialrefuellingpoint_view_rqylzt.id
left join master_join master_join_cvlgse on aerial_refuelling.aerialrefuellingtrack.id = master_join_cvlgse.source_id
left join shared.airspacelayer_view shared_airspacelayer_view_nkqvqa on master_join_cvlgse.target_id = shared_airspacelayer_view_nkqvqa.id
left join master_join master_join_fjbeqd on aerial_refuelling.aerialrefuellingtrack.id = master_join_fjbeqd.source_id
left join notes.note_view notes_note_view_yfeacz on master_join_fjbeqd.target_id = notes_note_view_yfeacz.id
group by
    aerial_refuelling.aerialrefuellingtrack_pt.id,
    aerial_refuelling.aerialrefuellingtrack_pt.nilreason,
    geometry_curve_view_pjpyxk.geom;
-- ['procedure.minima_view', 'shared.aircraftcharacteristic_view', 'procedure.circlingrestriction_view', 'procedure.landingtakeoffareacollection_view', 'notes.note_view', 'airport_heliport.altimetersource_view', 'shared.obstacleassessmentarea_view']
create or replace view procedure.approachcondition_view as
select
    procedure.approachcondition_pt.id,
    procedure.approachcondition_pt.nilreason AS approachcondition_annotation,
    coalesce(cast(procedure.approachcondition.finalapproachpath_value as varchar), '(' || procedure.approachcondition.finalapproachpath_nilreason || ')') as finalapproachpath,
    coalesce(cast(procedure.approachcondition.requirednavigationperformance_value as varchar), '(' || procedure.approachcondition.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.approachcondition.climbgradient_value as varchar), '(' || procedure.approachcondition.climbgradient_nilreason || ')') as climbgradient,
    procedure_minima_view_mcntfb.id AS minimumset,
    coalesce(cast(airport_heliport_altimetersource_view_ivoggm.title as varchar), '(' || airport_heliport_altimetersource_view_ivoggm.nilreason[1] || ')') AS altimeter,
    airport_heliport_altimetersource_view_ivoggm.href AS altimeter_href,
    jsonb_agg(procedure_circlingrestriction_view_qloaqu.id) AS circlingrestriction,
    jsonb_agg(shared_aircraftcharacteristic_view_rgucfm.id) AS aircraftcategory,
    jsonb_agg(procedure_landingtakeoffareacollection_view_hqezsc.id) AS landingarea,
    jsonb_agg(shared_obstacleassessmentarea_view_fxpgoo.id) AS designsurface,
    jsonb_agg(notes_note_view_fpeyfi.*) AS annotation
from procedure.approachcondition_pt 
inner join procedure.approachcondition on procedure.approachcondition_pt.approachcondition_id = procedure.approachcondition.id
left join procedure.minima_view procedure_minima_view_mcntfb on procedure.approachcondition.minimumset_id = procedure_minima_view_mcntfb.id
left join airport_heliport.altimetersource_view airport_heliport_altimetersource_view_ivoggm on procedure.approachcondition.altimeter_id = airport_heliport_altimetersource_view_ivoggm.id
left join master_join master_join_hxefbu on procedure.approachcondition.id = master_join_hxefbu.source_id
left join procedure.circlingrestriction_view procedure_circlingrestriction_view_qloaqu on master_join_hxefbu.target_id = procedure_circlingrestriction_view_qloaqu.id
left join master_join master_join_hlqgpk on procedure.approachcondition.id = master_join_hlqgpk.source_id
left join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_rgucfm on master_join_hlqgpk.target_id = shared_aircraftcharacteristic_view_rgucfm.id
left join master_join master_join_ceubao on procedure.approachcondition.id = master_join_ceubao.source_id
left join procedure.landingtakeoffareacollection_view procedure_landingtakeoffareacollection_view_hqezsc on master_join_ceubao.target_id = procedure_landingtakeoffareacollection_view_hqezsc.id
left join master_join master_join_cvseys on procedure.approachcondition.id = master_join_cvseys.source_id
left join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_fxpgoo on master_join_cvseys.target_id = shared_obstacleassessmentarea_view_fxpgoo.id
left join master_join master_join_tdcipg on procedure.approachcondition.id = master_join_tdcipg.source_id
left join notes.note_view notes_note_view_fpeyfi on master_join_tdcipg.target_id = notes_note_view_fpeyfi.id
group by
    procedure.approachcondition_pt.id,
    procedure.approachcondition_pt.nilreason,
    procedure.approachcondition.finalapproachpath_value,
    procedure.approachcondition.finalapproachpath_nilreason,
    procedure.approachcondition.requirednavigationperformance_value,
    procedure.approachcondition.requirednavigationperformance_nilreason,
    procedure.approachcondition.climbgradient_value,
    procedure.approachcondition.climbgradient_nilreason,
    procedure_minima_view_mcntfb.id,
    airport_heliport_altimetersource_view_ivoggm.title,
    airport_heliport_altimetersource_view_ivoggm.nilreason[1],
    airport_heliport_altimetersource_view_ivoggm.href;
-- ['geometry.elevatedsurface_view', 'geometry.elevatedpoint_view', 'shared.timesheet_view', 'notes.note_view', 'organisation.organisationauthority_view', 'geometry.elevatedcurve_view', 'shared.lightelement_view']
create or replace view obstacles.verticalstructurepart_view as
select
    obstacles.verticalstructurepart_pt.id,
    obstacles.verticalstructurepart_pt.nilreason AS verticalstructurepart_annotation,
    coalesce(cast(obstacles.verticalstructurepart.type_value as varchar), '(' || obstacles.verticalstructurepart.type_nilreason || ')') as type,
    coalesce(cast(obstacles.verticalstructurepart.constructionstatus_value as varchar), '(' || obstacles.verticalstructurepart.constructionstatus_nilreason || ')') as constructionstatus,
    coalesce(cast(obstacles.verticalstructurepart.markingpattern_value as varchar), '(' || obstacles.verticalstructurepart.markingpattern_nilreason || ')') as markingpattern,
    coalesce(cast(obstacles.verticalstructurepart.markingfirstcolour_value as varchar), '(' || obstacles.verticalstructurepart.markingfirstcolour_nilreason || ')') as markingfirstcolour,
    coalesce(cast(obstacles.verticalstructurepart.markingsecondcolour_value as varchar), '(' || obstacles.verticalstructurepart.markingsecondcolour_nilreason || ')') as markingsecondcolour,
    coalesce(cast(obstacles.verticalstructurepart.mobile_value as varchar), '(' || obstacles.verticalstructurepart.mobile_nilreason || ')') as mobile,
    coalesce(cast(obstacles.verticalstructurepart.frangible_value as varchar), '(' || obstacles.verticalstructurepart.frangible_nilreason || ')') as frangible,
    coalesce(cast(obstacles.verticalstructurepart.visiblematerial_value as varchar), '(' || obstacles.verticalstructurepart.visiblematerial_nilreason || ')') as visiblematerial,
    coalesce(cast(obstacles.verticalstructurepart.designator_value as varchar), '(' || obstacles.verticalstructurepart.designator_nilreason || ')') as designator,
    coalesce(cast(obstacles.verticalstructurepart.verticalextent_value as varchar) || ' ' || obstacles.verticalstructurepart.verticalextent_uom, '(' || obstacles.verticalstructurepart.verticalextent_nilreason || ')') as verticalextent,
    coalesce(cast(obstacles.verticalstructurepart.verticalextentaccuracy_value as varchar) || ' ' || obstacles.verticalstructurepart.verticalextentaccuracy_uom, '(' || obstacles.verticalstructurepart.verticalextentaccuracy_nilreason || ')') as verticalextentaccuracy,
    geometry_elevatedpoint_view_pxkjtv.geom AS geom,
    ST_X(geometry_elevatedpoint_view_pxkjtv.geom) AS longitude,
    ST_Y(geometry_elevatedpoint_view_pxkjtv.geom) AS latitude,
    geometry_elevatedpoint_view_pxkjtv.elevation,
    geometry_elevatedpoint_view_pxkjtv.geoidUndulation,
    geometry_elevatedpoint_view_pxkjtv.verticalDatum,
    geometry_elevatedpoint_view_pxkjtv.verticalAccuracy,
    geometry_elevatedpoint_view_pxkjtv.horizontalAccuracy,
    geometry_elevatedcurve_view_fotati.geom AS geom,
    geometry_elevatedcurve_view_fotati.elevation,
    geometry_elevatedcurve_view_fotati.geoidUndulation,
    geometry_elevatedcurve_view_fotati.verticalDatum,
    geometry_elevatedcurve_view_fotati.verticalAccuracy,
    geometry_elevatedcurve_view_fotati.horizontalAccuracy,
    geometry_elevatedsurface_view_azwyen.geom AS geom,
    geometry_elevatedsurface_view_azwyen.elevation,
    geometry_elevatedsurface_view_azwyen.geoidUndulation,
    geometry_elevatedsurface_view_azwyen.verticalDatum,
    geometry_elevatedsurface_view_azwyen.verticalAccuracy,
    geometry_elevatedsurface_view_azwyen.horizontalAccuracy,
    jsonb_agg(shared_timesheet_view_cgeuoy.id) AS timeinterval,
    jsonb_agg(notes_note_view_mmapms.*) AS annotation,
    jsonb_agg(shared_lightelement_view_roeqbq.id) AS lighting
from obstacles.verticalstructurepart_pt 
inner join obstacles.verticalstructurepart on obstacles.verticalstructurepart_pt.verticalstructurepart_id = obstacles.verticalstructurepart.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_pxkjtv on obstacles.verticalstructurepart.horizontalprojection_location_id = geometry_elevatedpoint_view_pxkjtv.id
left join geometry.elevatedcurve_view geometry_elevatedcurve_view_fotati on obstacles.verticalstructurepart.horizontalprojection_linearextent_id = geometry_elevatedcurve_view_fotati.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_azwyen on obstacles.verticalstructurepart.horizontalprojection_surfaceextent_id = geometry_elevatedsurface_view_azwyen.id
left join master_join master_join_hopehg on obstacles.verticalstructurepart.id = master_join_hopehg.source_id
left join shared.timesheet_view shared_timesheet_view_cgeuoy on master_join_hopehg.target_id = shared_timesheet_view_cgeuoy.id
left join master_join master_join_ptpyjv on obstacles.verticalstructurepart.id = master_join_ptpyjv.source_id
left join notes.note_view notes_note_view_mmapms on master_join_ptpyjv.target_id = notes_note_view_mmapms.id
left join master_join master_join_gzsdob on obstacles.verticalstructurepart.id = master_join_gzsdob.source_id
left join organisation.organisationauthority_view organisation_organisationauthority_view_udzpng on master_join_gzsdob.target_id = organisation_organisationauthority_view_udzpng.id
left join master_join master_join_ishkdl on obstacles.verticalstructurepart.id = master_join_ishkdl.source_id
left join shared.lightelement_view shared_lightelement_view_roeqbq on master_join_ishkdl.target_id = shared_lightelement_view_roeqbq.id
group by
    obstacles.verticalstructurepart_pt.id,
    obstacles.verticalstructurepart_pt.nilreason,
    obstacles.verticalstructurepart.type_value,
    obstacles.verticalstructurepart.type_nilreason,
    obstacles.verticalstructurepart.constructionstatus_value,
    obstacles.verticalstructurepart.constructionstatus_nilreason,
    obstacles.verticalstructurepart.markingpattern_value,
    obstacles.verticalstructurepart.markingpattern_nilreason,
    obstacles.verticalstructurepart.markingfirstcolour_value,
    obstacles.verticalstructurepart.markingfirstcolour_nilreason,
    obstacles.verticalstructurepart.markingsecondcolour_value,
    obstacles.verticalstructurepart.markingsecondcolour_nilreason,
    obstacles.verticalstructurepart.mobile_value,
    obstacles.verticalstructurepart.mobile_nilreason,
    obstacles.verticalstructurepart.frangible_value,
    obstacles.verticalstructurepart.frangible_nilreason,
    obstacles.verticalstructurepart.visiblematerial_value,
    obstacles.verticalstructurepart.visiblematerial_nilreason,
    obstacles.verticalstructurepart.designator_value,
    obstacles.verticalstructurepart.designator_nilreason,
    obstacles.verticalstructurepart.verticalextent_value,
    obstacles.verticalstructurepart.verticalextent_uom,
    obstacles.verticalstructurepart.verticalextent_nilreason,
    obstacles.verticalstructurepart.verticalextentaccuracy_value,
    obstacles.verticalstructurepart.verticalextentaccuracy_uom,
    obstacles.verticalstructurepart.verticalextentaccuracy_nilreason,
    geometry_elevatedpoint_view_pxkjtv.geom,
    geometry_elevatedpoint_view_pxkjtv.elevation,
    geometry_elevatedpoint_view_pxkjtv.geoidUndulation,
    geometry_elevatedpoint_view_pxkjtv.verticalDatum,
    geometry_elevatedpoint_view_pxkjtv.verticalAccuracy,
    geometry_elevatedpoint_view_pxkjtv.horizontalAccuracy,
    geometry_elevatedcurve_view_fotati.geom,
    geometry_elevatedcurve_view_fotati.elevation,
    geometry_elevatedcurve_view_fotati.geoidUndulation,
    geometry_elevatedcurve_view_fotati.verticalDatum,
    geometry_elevatedcurve_view_fotati.verticalAccuracy,
    geometry_elevatedcurve_view_fotati.horizontalAccuracy,
    geometry_elevatedsurface_view_azwyen.geom,
    geometry_elevatedsurface_view_azwyen.elevation,
    geometry_elevatedsurface_view_azwyen.geoidUndulation,
    geometry_elevatedsurface_view_azwyen.verticalDatum,
    geometry_elevatedsurface_view_azwyen.verticalAccuracy,
    geometry_elevatedsurface_view_azwyen.horizontalAccuracy;
-- ['notes.note_view', 'routes.flightroutingelement_view', 'shared.contactinformation_view']
create or replace view routes.flightrestrictionroute_view as
select
    routes.flightrestrictionroute_pt.id,
    routes.flightrestrictionroute_pt.nilreason AS flightrestrictionroute_annotation,
    coalesce(cast(routes.flightrestrictionroute.priorpermission_value as varchar), '(' || routes.flightrestrictionroute.priorpermission_nilreason || ')') as priorpermission,
    jsonb_agg(routes_flightroutingelement_view_xwgztm.id) AS routeelement,
    jsonb_agg(notes_note_view_kakiej.*) AS annotation
from routes.flightrestrictionroute_pt 
inner join routes.flightrestrictionroute on routes.flightrestrictionroute_pt.flightrestrictionroute_id = routes.flightrestrictionroute.id
left join master_join master_join_pphwce on routes.flightrestrictionroute.id = master_join_pphwce.source_id
left join routes.flightroutingelement_view routes_flightroutingelement_view_xwgztm on master_join_pphwce.target_id = routes_flightroutingelement_view_xwgztm.id
left join master_join master_join_goumli on routes.flightrestrictionroute.id = master_join_goumli.source_id
left join shared.contactinformation_view shared_contactinformation_view_yigusp on master_join_goumli.target_id = shared_contactinformation_view_yigusp.id
left join master_join master_join_czdgqr on routes.flightrestrictionroute.id = master_join_czdgqr.source_id
left join notes.note_view notes_note_view_kakiej on master_join_czdgqr.target_id = notes_note_view_kakiej.id
group by
    routes.flightrestrictionroute_pt.id,
    routes.flightrestrictionroute_pt.nilreason,
    routes.flightrestrictionroute.priorpermission_value,
    routes.flightrestrictionroute.priorpermission_nilreason;
