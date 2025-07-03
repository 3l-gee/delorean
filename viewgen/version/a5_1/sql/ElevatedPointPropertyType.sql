-- Snowflake SQL : ElevatedPointPropertyType

CREATE MATERIALIZED VIEW geometry.elevated_point_view AS
SELECT 
    id, 
    point as geom,
	COALESCE(elevation || ' ' || elevation_uom, '(' || elevation_nilreason || ')') AS elevation,
	COALESCE(geoidundulation || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(verticaldatum || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(verticalaccuracy || ' ' || horizontalaccuracy_uom, '(' || verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM elevated_point_pt;