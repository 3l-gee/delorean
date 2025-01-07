CREATE VIEW surface_test AS
WITH
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
            ST_Segmentize((linestring::geography), 1000000)::geometry, 
            ST_PointN(linestring, -1)
        ]) AS geom
    FROM 
        public.polygon_segment 
    WHERE 
        public.polygon_segment.interpretation = 1
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
),
ordered_segments AS (
    SELECT 
		xml_id
        id, 
		part,
		sequence,
        geom
    FROM 
        segement_ownership
    ORDER BY 
        xml_id, part, sequence
)
-- merged_segments AS (
--     SELECT 
--         public.elevated_surface.xml_id,
-- 		ordered_segments.geom AS geom
--     FROM 
--         public.elevated_surface
--     INNER JOIN 
--         public.elevatedsurface_exterior 
--         ON public.elevated_surface.id = public.elevatedsurface_exterior.elevatedsurfacepropertytype_id
--     INNER JOIN 
--         ordered_segments 
--         ON public.elevatedsurface_exterior.exteriorlinestring_id = ordered_segments.id
--     -- GROUP BY 
--     --     public.elevated_surface.xml_id
-- )
SELECT 
	id, 
	-- ST_AsText(ST_LineMerge(ST_Union(geom))) as geom
	(ST_LineMerge(ST_Union(geom))) as geom
FROM 
	ordered_segments
GROUP BY
	id;
