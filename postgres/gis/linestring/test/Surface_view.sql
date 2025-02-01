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
		partial_surface_view.id, 
		partial_surface_view.xml_id,
		partial_surface_view.curve_xml_id,
		partial_surface_view.part,
		partial_surface_view.increment,
		partial_surface_view.interpretation,
		partial_surface_view.geom,
		Null::geometry AS start_segment,
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
		MAX(elevation) AS elevation,
		MAX(elevation_uom) AS elevation_uom,
		MAX(eleveation_nilreason) AS eleveation_nilreason,
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