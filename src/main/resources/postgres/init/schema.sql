CREATE OR REPLACE VIEW point_view AS
SELECT
    id, 
	xml_id,
    point as geom,
	horizontalaccuracy,
	horizontalaccuracy_uom,
	horizontalaccuracy_nilreason,
	nilreason
FROM point_pt;

CREATE OR REPLACE VIEW elevated_point_view AS
SELECT 
    id, 
	xml_id,
    point as geom,
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
FROM elevated_point_pt;

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
	(row_number() OVER ())::integer AS row,
    merged_segments.id, 
	merged_segments.xml_id,
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
	(row_number() OVER ())::integer AS row,
    merged_segments.id, 
	merged_segments.xml_id,
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


CREATE OR REPLACE VIEW 	 AS
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
	INNER JOIN public.curve_pt
		ON airspace.geoborder_ts.border_id = public.curve_pt.id
	INNER JOIN public.curve_view
		ON public.curve_pt.id = public.curve_view.id
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
linked_segments AS (
    SELECT 
        id,
		xml_id,
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
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence,
		curr.interpretation,
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
        curr.part,
		curr.member + 0. AS member,
        curr.sequence,
		curr.interpretation,
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
        part,
        member,
        geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
        nilreason,
        ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part)  AS cluster_id
    FROM 
        linked_segments
    WHERE 
        interpretation != 4
	UNION ALL
    SELECT 
        id, 
        xml_id,
        part,
        member,
        geom,
        horizontalaccuracy,
        horizontalaccuracy_uom,
        horizontalaccuracy_nilreason,
        nilreason,
        ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part) + 5000 + 1 AS cluster_id
    FROM 
        linked_segments
    WHERE 
        interpretation = 4
),
partial_ring AS (
    SELECT 
        id, 
        xml_id,
        part,
        MIN(member) AS member,
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
    GROUP BY 
		id,
        xml_id, 
        part, 
        cluster_id,
        horizontalaccuracy, 
        horizontalaccuracy_uom, 
        horizontalaccuracy_nilreason,	
        nilreason
	ORDER BY 
        xml_id, 
		part, 
		member
)


CREATE OR REPLACE VIEW partial_elevated_surface_view AS
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
	INNER JOIN public.curve_pt
		ON airspace.geoborder_ts.border_id = public.curve_pt.id
	INNER JOIN public.curve_view
		ON public.curve_pt.id = public.curve_view.id
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
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point, 
        last_point,
		ST_IsClosed(segement_ownership.geom) AS closed,
		segement_ownership.elevation,
		segement_ownership.elevation_uom,
		segement_ownership.eleveation_nilreason,
		segement_ownership.geoidundulation,
		segement_ownership.geoidundulation_uom,
		segement_ownership.geoidundulation_nilreason,
		segement_ownership.horizontalaccuracy,
		segement_ownership.horizontalaccuracy_uom,
		segement_ownership.horizontalaccuracy_nilreason,
		segement_ownership.verticalaccuracy,
		segement_ownership.verticalaccuracy_uom,
		segement_ownership.verticalaccuracy_nilreason,
		segement_ownership.verticaldatum,
		segement_ownership.verticaldatum_nilreason,
		segement_ownership.nilreason
    FROM 
        segement_ownership
    ORDER BY 
        id, xml_id, part, member, sequence
),
linked_segments AS (
    SELECT 
        id,
		xml_id,
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
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence, -- Adjust sequence for link
		curr.interpretation,
        ST_MakeLine(curr.last_point, next.first_point) AS geom, -- Linking segment
        curr.last_point AS first_point,
        next.first_point AS last_point,
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
		curr.xml_id,
        curr.part,
		curr.member + 0.5 AS member, -- Adjust sequence for link
        curr.sequence,
		curr.interpretation,
        ST_MakeLine(curr.last_point, next.first_point) AS geom, -- Linking segment
        curr.last_point AS first_point,
        next.first_point AS last_point,
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
        id, xml_id, part, member, sequence
	
),
clustered_segments AS (
    SELECT 
        id, 
        xml_id,
        part,
        member,
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
        nilreason,
        ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part)  AS cluster_id
    FROM 
        linked_segments
    WHERE 
        interpretation != 4
	UNION ALL
    SELECT 
        id, 
        xml_id,
        part,
        member,
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
        nilreason,
        ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part) + 5000 + 1 AS cluster_id
    FROM 
        linked_segments
    WHERE 
        interpretation = 4
),
partial_ring AS (
    SELECT 
        id, 
        xml_id,
        part,
        MIN(member) AS member,
        ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
        ST_GeometryType(ST_LineMerge(ST_Collect(geom))) AS type, 
        ST_LineMerge(ST_Collect(geom)) AS geom,
        NULL::geometry AS points,
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
    GROUP BY 
		id,
        xml_id, 
        part, 
        cluster_id,
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
	ORDER BY 
        xml_id, 
		part, 
		member
)



-- CREATE OR REPLACE VIEW surface_view AS
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
	INNER JOIN public.curve_pt
		ON airspace.geoborder_ts.border_id = public.curve_pt.id
	INNER JOIN public.curve_view
		ON public.curve_pt.id = public.curve_view.id
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
linked_segments AS (
    SELECT 
        id,
		xml_id,
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
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence,
		curr.interpretation,
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
		OR
		next.interpretation != 4
    UNION ALL
    SELECT 
        curr.id,
		curr.xml_id,
        curr.part,
		curr.member + 0.5 AS member,
        curr.sequence,
		curr.interpretation,
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
		OR
		next.interpretation != 4
    ORDER BY 
        xml_id, 
		part, 
		member,
		sequence
),
partial_ring AS (
    SELECT 
        id, 
		xml_id,
		part,
		ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
		ST_LineMerge(ST_Collect(geom)) AS geom,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        linked_segments
    WHERE
		interpretation != 4
    GROUP BY 
        id,
		xml_id, 
		part, 
		horizontalaccuracy, 
		horizontalaccuracy_uom, 
		horizontalaccuracy_nilreason,	
		nilreason
),
raw_geoborder AS (
    SELECT 
        id,
		xml_id,
		part,
		member,
		ST_LineMerge(ST_Collect(geom)) AS geom,
		ST_Points(ST_LineMerge(ST_Collect(geom))) AS points,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        linked_segments
    WHERE 
		interpretation = 4
    GROUP BY 
        id,
		xml_id, 
		part, 
		member, 
		horizontalaccuracy, 
		horizontalaccuracy_uom, 
		horizontalaccuracy_nilreason,	
		nilreason
),
split_geoborder AS (
	SELECT
		raw_geoborder.id, 
		raw_geoborder.xml_id,
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
		ST_ShortestLine(ST_Collect(raw_geoborder.points), ST_EndPoint(partial_ring.geom)) AS end_segment,
		raw_geoborder.horizontalaccuracy, 
		raw_geoborder.horizontalaccuracy_uom, 
		raw_geoborder.horizontalaccuracy_nilreason, 
		raw_geoborder.nilreason
	FROM 
		raw_geoborder
	INNER JOIN
		partial_ring
	ON 
		raw_geoborder.xml_id = partial_ring.xml_id
	WHERE 
		raw_geoborder.part = partial_ring.part
	GROUP BY
		raw_geoborder.id, 
		raw_geoborder.xml_id, 
		raw_geoborder.geom, 
		partial_ring.geom, 
		raw_geoborder.horizontalaccuracy, 
		raw_geoborder.horizontalaccuracy_uom, 
		raw_geoborder.horizontalaccuracy_nilreason, 
		raw_geoborder.nilreason
),
ring AS (
	SELECT
		partial_ring.id,
		partial_ring.xml_id,
		partial_ring.part,
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, split_geoborder.geom, end_segment, start_segment])) AS geom,
		split_geoborder.horizontalaccuracy,
		split_geoborder.horizontalaccuracy_uom,
		split_geoborder.horizontalaccuracy_nilreason,
		split_geoborder.nilreason
	FROM
		split_geoborder
	INNER JOIN
		partial_ring	
	ON 
		split_geoborder.xml_id = partial_ring.xml_id
	WHERE
		ST_Touches(split_geoborder.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(split_geoborder.geom, split_geoborder.end_segment)
		AND 
		NOT ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	UNION ALL
		SELECT
		partial_ring.id,
		partial_ring.xml_id,
		partial_ring.part,
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, end_segment, start_segment])) AS geom,
		split_geoborder.horizontalaccuracy,
		split_geoborder.horizontalaccuracy_uom,
		split_geoborder.horizontalaccuracy_nilreason,
		split_geoborder.nilreason
	FROM
		split_geoborder
	INNER JOIN
		partial_ring	
	ON 
		split_geoborder.xml_id = partial_ring.xml_id
	WHERE
		ST_Touches(split_geoborder.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(split_geoborder.geom, split_geoborder.end_segment)
		AND 
		ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	GROUP BY 
		partial_ring.id, 
		partial_ring.xml_id, 
		partial_ring.part,
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, end_segment, start_segment])), 
		split_geoborder.horizontalaccuracy, 
		split_geoborder.horizontalaccuracy_uom, 
		split_geoborder.horizontalaccuracy_nilreason, 
		split_geoborder.nilreason
	UNION ALL
	SELECT
		partial_ring.id,
		partial_ring.xml_id,
		partial_ring.part,
		partial_ring.geom,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.nilreason
	FROM
		partial_ring
	WHERE
		partial_ring.closed = true
		UNION ALL
	SELECT
		partial_ring.id,
		partial_ring.xml_id,
		partial_ring.part,
		ST_AddPoint(partial_ring.geom, ST_StartPoint(partial_ring.geom)) AS geom,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.nilreason
	FROM
		partial_ring
	WHERE
		partial_ring.closed = false
)
SELECT 
ST_IsClosed(geom),
ST_GeometryType(geom),
-- ST_AsText(geom),
*
FROM ring

-- ordered_segments
-- linked_segments
-- partial_ring

-- SELECT 
--     (row_number() OVER ())::integer AS row,
--     ring.id,
--     ring.xml_id,
--     ST_MakePolygon(
--         MAX(CASE WHEN ring.part = 0 THEN ring.geom END),
--         COALESCE(ARRAY_AGG(CASE WHEN ring.part != 0 THEN ring.geom END) 
--                  FILTER (WHERE ring.part != 0), ARRAY[]::geometry[])
--     ) AS geom,
--     MAX(horizontalaccuracy) AS horizontalaccuracy,
--     MAX(horizontalaccuracy_uom) AS horizontalaccuracy_uom,
--     MAX(horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
--     MAX(nilreason) AS nilreason
-- FROM 
--     ring
-- GROUP BY 
--     ring.id, 
-- 	ring.xml_id;


CREATE OR REPLACE VIEW elevated_surface_view AS
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
	INNER JOIN public.curve_pt
		ON airspace.geoborder_ts.border_id = public.curve_pt.id
	INNER JOIN public.curve_view
		ON public.curve_pt.id = public.curve_view.id
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
        part,
		member,
        sequence,
		interpretation,
        geom,
        first_point, 
        last_point,
		ST_IsClosed(segement_ownership.geom) AS closed,
		segement_ownership.elevation,
		segement_ownership.elevation_uom,
		segement_ownership.eleveation_nilreason,
		segement_ownership.geoidundulation,
		segement_ownership.geoidundulation_uom,
		segement_ownership.geoidundulation_nilreason,
		segement_ownership.horizontalaccuracy,
		segement_ownership.horizontalaccuracy_uom,
		segement_ownership.horizontalaccuracy_nilreason,
		segement_ownership.verticalaccuracy,
		segement_ownership.verticalaccuracy_uom,
		segement_ownership.verticalaccuracy_nilreason,
		segement_ownership.verticaldatum,
		segement_ownership.verticaldatum_nilreason,
		segement_ownership.nilreason
    FROM 
        segement_ownership
    ORDER BY 
        id, xml_id, part, member, sequence
),
linked_segments AS (
    SELECT 
        id,
		xml_id,
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
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence, -- Adjust sequence for link
		curr.interpretation,
        ST_MakeLine(curr.last_point, next.first_point) AS geom, -- Linking segment
        curr.last_point AS first_point,
        next.first_point AS last_point,
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
		curr.xml_id,
        curr.part,
		curr.member + 0.5 AS member, -- Adjust sequence for link
        curr.sequence,
		curr.interpretation,
        ST_MakeLine(curr.last_point, next.first_point) AS geom, -- Linking segment
        curr.last_point AS first_point,
        next.first_point AS last_point,
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
        id, xml_id, part, member, sequence
	
),
partial_ring AS (
    SELECT 
        id, 
		xml_id,
		part,
		ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
		ST_LineMerge(ST_Collect(geom)) AS geom,
		linked_segments.elevation,
		linked_segments.elevation_uom,
		linked_segments.eleveation_nilreason,
		linked_segments.geoidundulation,
		linked_segments.geoidundulation_uom,
		linked_segments.geoidundulation_nilreason,
		linked_segments.horizontalaccuracy,
		linked_segments.horizontalaccuracy_uom,
		linked_segments.horizontalaccuracy_nilreason,
		linked_segments.verticalaccuracy,
		linked_segments.verticalaccuracy_uom,
		linked_segments.verticalaccuracy_nilreason,
		linked_segments.verticaldatum,
		linked_segments.verticaldatum_nilreason,
		linked_segments.nilreason
    FROM 
        linked_segments
    WHERE
		interpretation != 4
    GROUP BY 
        id, xml_id, part,	
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
),
raw_geoborder AS (
    SELECT 
        id, 
		xml_id,
		part,
		member,
		ST_LineMerge(ST_Collect(geom)) AS geom,
		ST_Points(ST_LineMerge(ST_Collect(geom))) AS points
    FROM 
        linked_segments
    WHERE 
		interpretation = 4
    GROUP BY 
        id, xml_id, part, member, sequence
),
split_geoborder AS (
	SELECT
		raw_geoborder.id, 
		raw_geoborder.xml_id,
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
		ST_ShortestLine(ST_Collect(raw_geoborder.points), ST_EndPoint(partial_ring.geom)) AS end_segment,
		partial_ring.elevation,
		partial_ring.elevation_uom,
		partial_ring.eleveation_nilreason,
		partial_ring.geoidundulation,
		partial_ring.geoidundulation_uom,
		partial_ring.geoidundulation_nilreason,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.verticalaccuracy,
		partial_ring.verticalaccuracy_uom,
		partial_ring.verticalaccuracy_nilreason,
		partial_ring.verticaldatum,
		partial_ring.verticaldatum_nilreason,
		partial_ring.nilreason
	FROM 
		raw_geoborder
	INNER JOIN
		partial_ring
	ON 
		raw_geoborder.xml_id = partial_ring.xml_id
	WHERE 
		raw_geoborder.part = partial_ring.part
	GROUP BY
		raw_geoborder.id, 
		raw_geoborder.xml_id,
		raw_geoborder.geom,
		partial_ring.geom,
		partial_ring.elevation,
		partial_ring.elevation_uom,
		partial_ring.eleveation_nilreason,
		partial_ring.geoidundulation,
		partial_ring.geoidundulation_uom,
		partial_ring.geoidundulation_nilreason,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.verticalaccuracy,
		partial_ring.verticalaccuracy_uom,
		partial_ring.verticalaccuracy_nilreason,
		partial_ring.verticaldatum,
		partial_ring.verticaldatum_nilreason,
		partial_ring.nilreason
),
exterior_ring AS (
	SELECT
		partial_ring.id,
		partial_ring.xml_id,
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, split_geoborder.geom, end_segment, start_segment])) AS geom,
		partial_ring.elevation,
		partial_ring.elevation_uom,
		partial_ring.eleveation_nilreason,
		partial_ring.geoidundulation,
		partial_ring.geoidundulation_uom,
		partial_ring.geoidundulation_nilreason,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.verticalaccuracy,
		partial_ring.verticalaccuracy_uom,
		partial_ring.verticalaccuracy_nilreason,
		partial_ring.verticaldatum,
		partial_ring.verticaldatum_nilreason,
		partial_ring.nilreason
	FROM
		split_geoborder
	INNER JOIN
		partial_ring	
	ON 
		split_geoborder.xml_id = partial_ring.xml_id
	WHERE
		ST_Touches(split_geoborder.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(split_geoborder.geom, split_geoborder.end_segment)
		AND 
		NOT ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	UNION ALL
		SELECT
		partial_ring.id,
		partial_ring.xml_id,
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, end_segment, start_segment])) AS geom,
		partial_ring.elevation,
		partial_ring.elevation_uom,
		partial_ring.eleveation_nilreason,
		partial_ring.geoidundulation,
		partial_ring.geoidundulation_uom,
		partial_ring.geoidundulation_nilreason,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.verticalaccuracy,
		partial_ring.verticalaccuracy_uom,
		partial_ring.verticalaccuracy_nilreason,
		partial_ring.verticaldatum,
		partial_ring.verticaldatum_nilreason,
		partial_ring.nilreason
	FROM
		split_geoborder
	INNER JOIN
		partial_ring	
	ON 
		split_geoborder.xml_id = partial_ring.xml_id
	WHERE
		ST_Touches(split_geoborder.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(split_geoborder.geom, split_geoborder.end_segment)
		AND 
		ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	GROUP BY 
		partial_ring.id, 
		partial_ring.xml_id, 
		ST_LineMerge(ST_Collect(ARRAY[partial_ring.geom, end_segment, start_segment])),
		partial_ring.elevation,
		partial_ring.elevation_uom,
		partial_ring.eleveation_nilreason,
		partial_ring.geoidundulation,
		partial_ring.geoidundulation_uom,
		partial_ring.geoidundulation_nilreason,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.verticalaccuracy,
		partial_ring.verticalaccuracy_uom,
		partial_ring.verticalaccuracy_nilreason,
		partial_ring.verticaldatum,
		partial_ring.verticaldatum_nilreason,
		partial_ring.nilreason
	UNION ALL
	SELECT
		partial_ring.id,
		partial_ring.xml_id,
		partial_ring.geom,
		partial_ring.elevation,
		partial_ring.elevation_uom,
		partial_ring.eleveation_nilreason,
		partial_ring.geoidundulation,
		partial_ring.geoidundulation_uom,
		partial_ring.geoidundulation_nilreason,
		partial_ring.horizontalaccuracy,
		partial_ring.horizontalaccuracy_uom,
		partial_ring.horizontalaccuracy_nilreason,
		partial_ring.verticalaccuracy,
		partial_ring.verticalaccuracy_uom,
		partial_ring.verticalaccuracy_nilreason,
		partial_ring.verticaldatum,
		partial_ring.verticaldatum_nilreason,
		partial_ring.nilreason
	FROM
		partial_ring
	WHERE
		partial_ring.closed = true	
)
SELECT 
    exterior_ring.id,
	exterior_ring.xml_id,
    ST_MakePolygon(
		exterior_ring.geom
-- 		COALESCE(interior_rings.geoms, ARRAY[]::geometry[])
	) AS geom,
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
    exterior_ring;