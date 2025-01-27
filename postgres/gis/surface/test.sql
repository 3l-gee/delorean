WITH 
split_geoborder AS (
	SELECT
		ring.id, 
		ring.xml_id,
		ring.part,
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
		ring.horizontalaccuracy, 
		ring.horizontalaccuracy_uom, 
		ring.horizontalaccuracy_nilreason, 
		ring.nilreason
	FROM 
		partial_surface_view ring
	INNER JOIN 
		partial_surface_view geoborder
	ON 
        ring.xml_id = geoborder.xml_id
	GROUP BY
		ring.id, 
		ring.xml_id, 
		ring.part,
		ring.geom, 
		geoborder.geom, 
		ring.horizontalaccuracy, 
		ring.horizontalaccuracy_uom, 
		ring.horizontalaccuracy_nilreason, 
		ring.nilreason
),
ring AS (
	SELECT
		partial_surface_view.id,
		partial_surface_view.xml_id,
		partial_surface_view.part,
		ST_LineMerge(ST_Collect(ARRAY[partial_surface_view.geom, split_geoborder.geom, end_segment, start_segment])) AS geom,
		split_geoborder.horizontalaccuracy,
		split_geoborder.horizontalaccuracy_uom,
		split_geoborder.horizontalaccuracy_nilreason,
		split_geoborder.nilreason
	FROM
		split_geoborder
	INNER JOIN
		partial_surface_view	
	ON 
		split_geoborder.xml_id = partial_surface_view.xml_id
	WHERE
		ST_Touches(split_geoborder.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(split_geoborder.geom, split_geoborder.end_segment)
		AND 
		NOT ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	UNION ALL
	SELECT
		partial_surface_view.id,
		partial_surface_view.xml_id,
		partial_surface_view.part,
		ST_LineMerge(ST_Collect(ARRAY[partial_surface_view.geom, end_segment, start_segment])) AS geom,
		split_geoborder.horizontalaccuracy,
		split_geoborder.horizontalaccuracy_uom,
		split_geoborder.horizontalaccuracy_nilreason,
		split_geoborder.nilreason
	FROM
		split_geoborder
	INNER JOIN
		partial_surface_view	
	ON 
		split_geoborder.xml_id = partial_surface_view.xml_id
	WHERE
		ST_Touches(partial_surface_view.geom, split_geoborder.start_segment) 
		AND 
		ST_Touches(partial_surface_view.geom, split_geoborder.end_segment)
		AND 
		ST_Touches(split_geoborder.start_segment, split_geoborder.end_segment)
	GROUP BY 
		partial_surface_view.id, 
		partial_surface_view.xml_id, 
		partial_surface_view.part,
		ST_LineMerge(ST_Collect(ARRAY[partial_surface_view.geom, end_segment, start_segment])), 
		split_geoborder.horizontalaccuracy, 
		split_geoborder.horizontalaccuracy_uom, 
		split_geoborder.horizontalaccuracy_nilreason, 
		split_geoborder.nilreason
	UNION ALL
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
	UNION ALL
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
		ST_IsClosed(partial_surface_view.geom) = true
		AND 
		partial_surface_view.increment = 0
)
SELECT
ST_GeometryType(geom),
ST_IsClosed(geom),
part, 
increment,
geom
FROM
partial_surface_view
WHERE
xml_id = 'gmlID1011042'