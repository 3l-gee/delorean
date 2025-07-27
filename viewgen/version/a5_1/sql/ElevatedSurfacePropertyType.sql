-- -- Snowflake SQL : ElevatedSurfacePropertyType

DROP MATERIALIZED VIEW IF EXISTS partial_elevatedsurface_view CASCADE;
CREATE MATERIALIZED VIEW partial_elevatedsurface_view AS
WITH  
segment_ref AS(
	SELECT 
		id, 
		part,
		member,
		sequence,
		interpretation,
		SUBSTRING(
	        curve_ref 
	        FROM '([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$'
	    ) AS uuid
    FROM geometry.polygon_segment 
	WHERE geometry.polygon_segment.interpretation = 4
),
segment_value AS(
	SELECT 
		airspace.geoborder.identifier AS uuid,
		geom
	FROM airspace.geoborder
	INNER JOIN master_join mj1 ON airspace.geoborder.id = mj1.source_id
	INNER JOIN airspace.geoborder_tsp ON mj1.target_id = airspace.geoborder_tsp.id
	INNER JOIN airspace.geoborder_ts ON airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
	INNER JOIN geometry.curve_pt ON airspace.geoborder_ts.border_id = geometry.curve_pt.id
	INNER JOIN geometry.curve_view ON geometry.curve_pt.id = geometry.curve_view.id
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
    FROM geometry.polygon_segment 
	WHERE geometry.polygon_segment.interpretation = 2
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
    FROM geometry.polygon_segment 
	WHERE geometry.polygon_segment.interpretation = 3
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
    GROUP BY 
		id, 
		part, 
		member, 
		sequence, 
		interpretation
),
segment_union AS (
    SELECT 
        id, 
		part,
		member,
		sequence,
		interpretation,
		linestring AS geom,
		ST_StartPoint(linestring) as first_point,
		ST_EndPoint(linestring) as last_point
    FROM 
        geometry.polygon_segment 
    WHERE 
        geometry.polygon_segment.interpretation = 0
    UNION ALL 
    SELECT 
        id, 
		part,
		member,
		sequence,
		interpretation,
        ST_Segmentize(linestring::geography, 10000)::geometry as geom,
		ST_StartPoint(linestring) as first_point,
		ST_EndPoint(linestring) as last_point
    FROM 
        geometry.polygon_segment 
    WHERE 
        geometry.polygon_segment.interpretation = 1
	UNION ALL
	SELECT
		id, 
		part,
		member,
		sequence,
		interpretation,
		geom AS geom,
		ST_StartPoint(geom) as first_point,
		ST_EndPoint(geom) as last_point
	FROM
		arc_line
	UNION ALL
	SELECT
		id,
		part,
		member,
		sequence,
		interpretation,
		geom AS geom,
		ST_StartPoint(geom) as first_point,
		ST_EndPoint(geom) as last_point
	FROM segment_ref
	INNER JOIN segment_value ON segment_ref.uuid = segment_value.uuid
),
segement_ownership AS (
	SELECT 
		geometry.elevated_surface_pt.id AS surf_id,
        segment_union.id AS seg_id,
		segment_union.part AS part,
		segment_union.member AS member,
		segment_union.sequence AS sequence,
		segment_union.interpretation AS interpretation,
		segment_union.geom AS geom,
		segment_union.first_point as first_point,
		segment_union.last_point as last_point
    FROM 
        geometry.elevated_surface_pt
    INNER JOIN master_join_geometry mjg1 ON geometry.elevated_surface_pt.id = mjg1.source_id
    INNER JOIN segment_union ON mjg1.target_id = segment_union.id
),
ordered_segments AS (
    SELECT 
		surf_id,
        seg_id,
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
    ORDER BY 
        seg_id,
		part, 
		member, 
		sequence
),
connecting_segments AS (
    SELECT 
		surf_id,
        seg_id,
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
		curr.surf_id,
		Null AS seg_id,
        curr.part,
		curr.member,
        curr.sequence + 0.5 AS sequence,
		1,
        ST_MakeLine(curr.last_point, next.first_point) AS geom,
        curr.last_point AS first_point,
        next.first_point AS last_point
    FROM 
        ordered_segments curr
    JOIN 
        ordered_segments next
    ON 
        curr.surf_id = next.surf_id
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
		curr.surf_id,
		Null AS seg_id,
        curr.part,
		curr.member + 0.5 AS member,
        curr.sequence,
		1,
        ST_MakeLine(curr.last_point, next.first_point) AS geom,
        curr.last_point AS first_point,
        next.first_point AS last_point
    FROM 
        ordered_segments curr
    JOIN 
        ordered_segments next
    ON 
        curr.seg_id = next.seg_id
        AND curr.part = next.part
        AND curr.member + 1 = next.member
	WHERE 
		ST_IsClosed(curr.geom) = false
		AND
		curr.interpretation != 4
		AND
		next.interpretation != 4
    ORDER BY 
        seg_id, 
        part, 
        member,
        sequence
),
clustered_segments AS (
    SELECT 
        surf_id,
		seg_id,
        part,
        member,
        geom,
		interpretation,
        ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY surf_id, part)  AS cluster_id
    FROM 
        connecting_segments
    WHERE 
        interpretation != 4
	UNION ALL
    SELECT 
        surf_id,
		seg_id,
        part,
        member,
        geom,
        interpretation,
        Null AS cluster_id
    FROM 
        connecting_segments
    WHERE 
        interpretation = 4
	ORDER BY
		seg_id,
		part, 
		member
),
partial_ring AS (
    SELECT 
        surf_id,
		ARRAY_AGG(seg_id) as seg_id,
        part,
        MIN(member) AS member,
		MIN(interpretation) AS interpretation,
        ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
        ST_GeometryType(ST_LineMerge(ST_Collect(geom))) AS type, 
        ST_LineMerge(ST_Collect(geom)) AS geom,
        NULL::geometry AS points
    FROM 
        clustered_segments
	WHERE 
		interpretation != 4
    GROUP BY 
		surf_id,
        part, 
        cluster_id
	UNION ALL
    SELECT 
        surf_id, 
		ARRAY[seg_id] AS seg_id,
        part,
        member,
		interpretation,
        ST_IsClosed(geom) AS closed,
        ST_GeometryType(geom) AS type, 
		geom AS geom,
		ST_Points(geom) AS points
    FROM 
        clustered_segments
	WHERE 
		interpretation = 4
	ORDER BY 
        surf_id, 
		part, 
		member
),
output AS (
    SELECT 
        pr.surf_id,
		pr.seg_id,
        pr.part,
		ROW_NUMBER() OVER (PARTITION BY surf_id, part ORDER BY surf_id) - 1 AS increment,
		COUNT(*) OVER (PARTITION BY surf_id, part ) AS total_count,
		pr.interpretation,
		pr.points,
        COALESCE(dumped.geom, pr.geom) AS geom
    FROM 
        partial_ring pr
    LEFT JOIN LATERAL (
        SELECT (ST_Dump(pr.geom)).geom
        WHERE ST_GeometryType(pr.geom) = 'ST_MultiLineString'
    ) dumped ON true
	ORDER BY
		surf_id, 
		part, 
		member
)
SELECT 
    (row_number() OVER ())::integer AS row,
	ST_GeometryType(geom),
	output.surf_id, 
	to_jsonb(output.seg_id) AS seg_id,
	output.part,
	output.increment,
	output.total_count,
	output.interpretation,
	output.geom,
	output.points
FROM
	output;

CREATE INDEX ON partial_elevatedsurface_view (surf_id);
CREATE INDEX ON partial_elevatedsurface_view USING GIST (geom);
CREATE INDEX ON partial_elevatedsurface_view USING GIST (points);

DROP MATERIALIZED VIEW IF EXISTS geometry.elevatedsurface_view CASCADE;
-- -- R1 : Simple feature, closed
-- -- R2 : Simple feature, unclosed
-- -- G1 : Complex feature wiht a single geoborder, 
-- -- G2 : Complex feature with multiple geoborder,
CREATE MATERIALIZED VIEW geometry.elevatedsurface_view AS
WITH 
g1_segment AS (
	SELECT
		geoborder.surf_id,
		geoborder.seg_id,
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
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)) AS start_segment,
		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(ring.geom)) AS end_segment
	FROM 
		partial_elevatedsurface_view geoborder
	JOIN
		partial_elevatedsurface_view ring
	ON 
        ring.surf_id = geoborder.surf_id
		AND
		ring.part = geoborder.part
		AND 
		ring.increment <> geoborder.increment
	WHERE 
		geoborder.total_count = 2
		AND
		geoborder.interpretation = 4
	GROUP BY
		geoborder.surf_id, 
		geoborder.seg_id,
		geoborder.part,
		geoborder.geom, 
		geoborder.increment,
		geoborder.interpretation,
		geoborder.geom, 
		ring.geom
	UNION ALL
	SELECT
		partial_elevatedsurface_view.surf_id, 
		partial_elevatedsurface_view.seg_id,
		partial_elevatedsurface_view.part,
		partial_elevatedsurface_view.increment,
		partial_elevatedsurface_view.interpretation,
		partial_elevatedsurface_view.geom,
		Null::geometry AS start_segment,
		Null::geometry AS end_segment
	FROM 
		partial_elevatedsurface_view
	WHERE 
		partial_elevatedsurface_view.total_count = 2 
		AND
		partial_elevatedsurface_view.interpretation != 4
	ORDER BY
		surf_id, 
		seg_id, 
		part,
		increment
),
g2_segment AS (
	SELECT
		geoborder.surf_id, 
		geoborder.seg_id,
		geoborder.part,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		geoborder.geom AS geom,
		Null::geometry AS  start_segment,
		Null::geometry AS end_segment
	FROM 
		partial_elevatedsurface_view geoborder
	JOIN
		partial_elevatedsurface_view before
	ON 
        before.surf_id = geoborder.surf_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevatedsurface_view after
	ON 
        after.surf_id = geoborder.surf_id
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
		geoborder.surf_id, 
		geoborder.seg_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom
	UNION ALL
	SELECT
		geoborder.surf_id,
		geoborder.seg_id,
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
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment
	FROM 
		partial_elevatedsurface_view geoborder
	JOIN
		partial_elevatedsurface_view before
	ON 
        before.surf_id = geoborder.surf_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevatedsurface_view after
	ON 
        after.surf_id = geoborder.surf_id
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
		geoborder.surf_id, 
		geoborder.seg_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom
	UNION ALL
	SELECT
		geoborder.surf_id,
		geoborder.seg_id,
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
		Null::geometry AS end_segment
	FROM 
		partial_elevatedsurface_view geoborder
	JOIN
		partial_elevatedsurface_view before
	ON 
        before.surf_id = geoborder.surf_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevatedsurface_view after
	ON 
        after.surf_id = geoborder.surf_id
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
		geoborder.surf_id, 
		geoborder.seg_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom
	UNION ALL
	SELECT
		geoborder.surf_id,
		geoborder.seg_id,
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
		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment
	FROM 
		partial_elevatedsurface_view geoborder
	JOIN
		partial_elevatedsurface_view before
	ON 
        before.surf_id = geoborder.surf_id
		AND
		before.part = geoborder.part
	    AND (
	        before.increment = geoborder.increment - 1
	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
	    )
	JOIN
		partial_elevatedsurface_view after
	ON 
        after.surf_id = geoborder.surf_id
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
		geoborder.surf_id,
		geoborder.seg_id,
		geoborder.part,
		before.geom, 
		after.geom,
		geoborder.increment,
		geoborder.interpretation,
		geoborder.total_count,
		before.increment,
		after.increment,
		geoborder.geom
	UNION ALL
	SELECT
		partial_elevatedsurface_view.surf_id, 
		partial_elevatedsurface_view.seg_id,
		partial_elevatedsurface_view.part,
		partial_elevatedsurface_view.increment,
		partial_elevatedsurface_view.interpretation,
		partial_elevatedsurface_view.total_count,
		partial_elevatedsurface_view.geom,
		Null::geometry AS start_segment,
		Null::geometry AS end_segment
	FROM 
		partial_elevatedsurface_view
	WHERE 
		partial_elevatedsurface_view.total_count > 2 
		AND
		partial_elevatedsurface_view.interpretation != 4
	ORDER BY
		surf_id, 
		seg_id, 
		part,
		increment
),
g2_segment_filtered AS (
	SELECT 
		curr.surf_id,
		curr.seg_id,
		curr.part,
		curr.increment,
		curr.geom AS geom
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.surf_id = curr.surf_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.surf_id = curr.surf_id
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
		curr.surf_id,
		curr.seg_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.start_segment])) AS geom
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.surf_id = curr.surf_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.surf_id = curr.surf_id
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
		curr.surf_id,
		curr.seg_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment])) AS geom
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.surf_id = curr.surf_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
		g2_segment after
	ON 
        after.surf_id = curr.surf_id
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
		curr.surf_id,
		curr.seg_id,
		curr.part,
		curr.increment,
		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment, curr.start_segment])) AS geom
	FROM
		g2_segment curr
	JOIN
		g2_segment before
	ON 
        before.surf_id = curr.surf_id
		AND
		before.part = curr.part
	    AND (
	        before.increment = curr.increment - 1
	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
	    )
	JOIN	
	g2_segment after
	ON 
        after.surf_id = curr.surf_id
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
		g2_segment.surf_id,
		g2_segment.seg_id,
		g2_segment.part,
		g2_segment.increment,
		g2_segment.geom
	FROM 
		g2_segment
	WHERE 
		g2_segment.interpretation != 4
	ORDER BY
		surf_id, 
		part,
		increment
),
r1 AS (
	SELECT
		partial_elevatedsurface_view.surf_id,
		partial_elevatedsurface_view.seg_id,
		partial_elevatedsurface_view.part,
		partial_elevatedsurface_view.geom
	FROM
		partial_elevatedsurface_view
	WHERE
		ST_IsClosed(partial_elevatedsurface_view.geom) = true
		AND 
		partial_elevatedsurface_view.total_count = 1
		AND 
		ST_NPoints(geom) >= 4
),
r2 AS (
	SELECT
		partial_elevatedsurface_view.surf_id,
		partial_elevatedsurface_view.seg_id,
		partial_elevatedsurface_view.part,
		ST_AddPoint(partial_elevatedsurface_view.geom, ST_StartPoint(partial_elevatedsurface_view.geom)) AS geom
	FROM
		partial_elevatedsurface_view
	WHERE
		ST_IsClosed(partial_elevatedsurface_view.geom) = false
		AND 
		partial_elevatedsurface_view.total_count = 1
		AND 
		ST_NPoints(ST_AddPoint(partial_elevatedsurface_view.geom, ST_StartPoint(partial_elevatedsurface_view.geom))) >= 4		
),
g1 AS (
	SELECT 
		ring.surf_id,
		ring.part,
		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment])) AS geom
	FROM
	g1_segment ring
	JOIN
	g1_segment geoborder
	ON 
		ring.surf_id = geoborder.surf_id
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
		ring.surf_id,
		ring.part,
		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.end_segment, geoborder.start_segment])) AS geom
	FROM
	g1_segment ring
	JOIN
	g1_segment geoborder
	ON 
		ring.surf_id = geoborder.surf_id
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
		g2_segment_filtered.surf_id,
		MIN(g2_segment_filtered.part) AS part,
		ST_LineMerge(ST_Collect(g2_segment_filtered.geom)) AS geom
	FROM
		g2_segment_filtered
	GROUP BY
		g2_segment_filtered.surf_id,
		g2_segment_filtered.part
	HAVING
		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = true
		AND
		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
		AND 
		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
	UNION ALL
	SELECT 
		g2_segment_filtered.surf_id,
		MIN(g2_segment_filtered.part) AS part,
		ST_AddPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)), ST_StartPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)))) AS geom
	FROM
		g2_segment_filtered
	GROUP BY
		g2_segment_filtered.surf_id,
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
        surf_id, 
		geom,
        part
    FROM 
        r1
    UNION ALL
    SELECT 
        surf_id,
        geom,
        part
    FROM 
        r2
    UNION ALL
    SELECT 
        surf_id, 
        geom,
        part
    FROM 
        g1
    UNION ALL
    SELECT 
        surf_id, 
        geom,
        part
    FROM 
        g2
),
outer_shells AS (
    SELECT 
        surf_id, 
        ST_MakePolygon(geom) AS geom
    FROM 
        combined_data
    WHERE 
        part = 0    
),
inner_shells AS (
    SELECT 
        surf_id, 
        geom
    FROM 
        combined_data
    WHERE 
        part <> 0
)
SELECT 
    outer_shells.surf_id AS id,
    ST_MakePolygon(
        ST_ExteriorRing(outer_shells.geom),
        ARRAY(
            SELECT ST_ExteriorRing(inner_shells.geom)
            FROM inner_shells 
            WHERE inner_shells.surf_id = outer_shells.surf_id
        )
    ) AS geom,
	COALESCE(geometry.elevated_surface_pt.elevation || ' ' || geometry.elevated_surface_pt.elevation_uom, '(' || geometry.elevated_surface_pt.elevation_nilreason || ')') AS elevation,
	COALESCE(geometry.elevated_surface_pt.geoidundulation || ' ' || geometry.elevated_surface_pt.geoidundulation_uom, '(' || geometry.elevated_surface_pt.geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(geometry.elevated_surface_pt.verticaldatum || ' ' || geometry.elevated_surface_pt.geoidundulation_uom, '(' || geometry.elevated_surface_pt.geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(geometry.elevated_surface_pt.verticalaccuracy || ' ' || geometry.elevated_surface_pt.horizontalaccuracy_uom, '(' || geometry.elevated_surface_pt.verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(geometry.elevated_surface_pt.horizontalaccuracy || ' ' || geometry.elevated_surface_pt.horizontalaccuracy_uom, '(' || geometry.elevated_surface_pt.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM 
outer_shells
INNER JOIN geometry.elevated_surface_pt ON outer_shells.surf_id = geometry.elevated_surface_pt.id;

CREATE INDEX ON geometry.elevatedsurface_view (id);
CREATE INDEX ON geometry.elevatedsurface_view USING GIST (geom);
