CREATE VIEW curve_view AS
WITH 
line (id, geom) AS (
    SELECT id, linestring 
    FROM public.segment 
	WHERE public.segment.interpretation = 2
),
radius AS (
    SELECT 
        line.id,
        (ST_Distance(
            ST_PointN(line.geom, 1)::geography, 
            ST_PointN(line.geom, 2)::geography
        ) 
        +
        ST_Distance(
            ST_PointN(line.geom, 2)::geography, 
            ST_PointN(line.geom, 3)::geography
        )) / 2 AS dist
    FROM line   
),
angles (id, start_angle, end_angle, step_size) AS (
    SELECT 
        line.id,
        ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 1)) AS start_angle,
        ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 3)) AS end_angle,
        mod(
            CAST(ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 3)) 
            - ST_Azimuth(ST_PointN(line.geom, 2), ST_PointN(line.geom, 1)) + 2 * PI() AS numeric),
            CAST(2 * PI() AS numeric)
        ) / 100 AS step_size
    FROM line
),
interpolated_points AS (
    SELECT 
        line.id,
		ST_Project(ST_PointN(line.geom, 2)::geography, radius.dist, start_angle + step_size * n)::geometry AS point_geom
    FROM 
        generate_series(0, 100) AS n, 	
        line
    JOIN radius ON line.id = radius.id
    JOIN angles ON line.id = angles.id
),
arc_line AS (
    SELECT 
        id,
        ST_MakeLine(point_geom) AS arc_geom
    FROM interpolated_points
    GROUP BY id
),
segment_union AS (
    SELECT id, linestring AS geom
    FROM public.segment 
    WHERE public.segment.interpretation = 0
    UNION ALL 
    SELECT id, ST_Segmentize((linestring::geography), 1000)::geometry AS geom
    FROM public.segment 
    WHERE public.segment.interpretation = 1
    UNION ALL 
    SELECT id, arc_geom AS geom
    FROM arc_line
),
merged_segments AS (
    SELECT 
        public.curve.xml_id,
        ST_Union(segment_union.geom) AS merged_geom
    FROM 
        public.curve
    INNER JOIN 
        public.curve_segment ON public.curve.id = public.curve_segment.curvepropertytype_id
    INNER JOIN 
        segment_union ON public.curve_segment.segments_id = segment_union.id
    GROUP BY public.curve.xml_id
)
SELECT 
	(row_number() OVER ())::integer AS id,
    xml_id, 
    merged_geom as geom 
FROM merged_segments;


