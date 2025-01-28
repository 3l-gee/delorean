-- R1 : Simple feature, closed
-- R2 : Simple feature, unclosed
-- G1 : Complex feature wiht a single geoborder, 
-- G2 : Complex feature with multiple geoborder,

WITH 
g1_segment AS (
	SELECT
		geoborder.id, 
		geoborder.xml_id,
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
		ST_Touches(curr.geom, before.geom) 
		AND 
		ST_Touches(curr.geom, after.geom)
		AND 
		before.interpretation = 4
		AND 
		after.interpretation = 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
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
		ST_Touches(curr.geom, curr.start_segment)  
		AND 
		ST_Touches(curr.geom, after.geom)
		AND 
		before.interpretation != 4
		AND 
		after.interpretation = 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
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
		ST_Touches(curr.geom, before.geom) 
		AND 
		ST_Touches(curr.geom, curr.end_segment)
		AND 
		before.interpretation = 4
		AND 
		after.interpretation != 4
	UNION ALL
	SELECT 
		curr.id, 
		curr.xml_id,
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
		ST_Touches(curr.geom, curr.start_segment) 
		AND 
		ST_Touches(curr.geom, curr.end_segment)
		AND 
		before.interpretation != 4
		AND 
		after.interpretation != 4
	UNION ALL
	SELECT
		g2_segment.id, 
		g2_segment.xml_id,
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
),
r2 AS (
	SELECT
		partial_surface_view.id,
		partial_surface_view.xml_id,
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
),
g1 AS (
	SELECT 
		ring.id,
		ring.xml_id,
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
		ST_Touches(geoborder.geom, geoborder.start_segment) 
		AND 
		ST_Touches(geoborder.geom, geoborder.end_segment)
		AND 
		NOT ST_Touches(geoborder.start_segment, geoborder.end_segment)
	UNION ALL
	SELECT DISTINCT 
		ring.id,
		ring.xml_id,
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
		ST_Touches(geoborder.geom, geoborder.start_segment) 
		AND 
		ST_Touches(geoborder.geom, geoborder.end_segment)
		AND 
		ST_Touches(geoborder.start_segment, geoborder.end_segment)
),
g2 AS (	
	SELECT 
		MIN(g2_segment_filtered.id) AS id,
		MIN(g2_segment_filtered.xml_id) AS xml_id,
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
)

SELECT
*
FROM
g2
