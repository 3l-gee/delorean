

CREATE OR REPLACE VIEW point_view AS
SELECT * FROM point_pt;

CREATE OR REPLACE VIEW elevated_point_view AS
SELECT * FROM elevated_point_pt;

CREATE OR REPLACE VIEW curve_view AS
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
		ST_ReducePrecision(linestring,0.00001) AS geom
    FROM
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 0
    UNION ALL 
    SELECT 
		id, 
		ST_Segmentize((ST_ReducePrecision(linestring, 0.00001)::geography), 1000)::geometry AS geom
    FROM 
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 1
    UNION ALL 
    SELECT 
		id, 
		ST_ReducePrecision(arc_geom, 0.00001) AS geom
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
	(row_number() OVER ())::integer AS row,
    merged_segments.id, 
    merged_geom as geom,
	horizontalaccuracy,
	horizontalaccuracy_uom,
	horizontalaccuracy_nilreason,
	nilreason
FROM merged_segments;


CREATE OR REPLACE VIEW elevated_curve_view AS
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
		ST_ReducePrecision(linestring,0.00001) AS geom
    FROM
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 0
    UNION ALL 
    SELECT 
		id, 
		ST_Segmentize((ST_ReducePrecision(linestring, 0.00001)::geography), 1000)::geometry AS geom
    FROM 
		public.linestring_segment 
    WHERE 
		public.linestring_segment.interpretation = 1
    UNION ALL 
    SELECT 
		id, 
		ST_ReducePrecision(arc_geom, 0.00001) AS geom
    FROM 
		arc_line
),
merged_segments AS (
    SELECT 
        public.elevated_curve_pt.id,
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
	(row_number() OVER ())::integer AS row,
    merged_segments.id, 
    merged_geom as geom,
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
FROM merged_segments;
