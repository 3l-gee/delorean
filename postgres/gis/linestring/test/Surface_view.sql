CREATE VIEW surface_view AS
WITH
segment_union AS (
    SELECT 
        id, 
        linestring AS geom,
        sequence
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 0
    UNION ALL 
    SELECT 
        id, 
        ST_Segmentize((linestring::geography), 100000)::geometry AS geom,
        sequence
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 1
),
ordered_segments AS (
    SELECT 
        id, 
        geom
    FROM 
        segment_union
    ORDER BY 
        sequence		
),
merged_segments AS (
    SELECT 
        public.elevated_surface.xml_id,
		ST_MakePolygon(ST_AddPoint(ordered_segments.geom, ST_StartPoint(ordered_segments.geom))) AS merged_geom
    FROM 
        public.elevated_surface
    INNER JOIN 
        public.elevatedsurface_exterior 
        ON public.elevated_surface.id = public.elevatedsurface_exterior.elevatedsurfacepropertytype_id
    INNER JOIN 
        ordered_segments 
        ON public.elevatedsurface_exterior.exteriorlinestring_id = ordered_segments.id
--     GROUP BY 
--         public.elevated_surface.xml_id
)
SELECT * FROM merged_segments;
