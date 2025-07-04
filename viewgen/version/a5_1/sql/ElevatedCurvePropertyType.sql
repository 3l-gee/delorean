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