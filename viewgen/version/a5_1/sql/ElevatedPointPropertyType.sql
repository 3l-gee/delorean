-- Snowflake SQL : ElevatedPointPropertyType

DROP MATERIALIZED VIEW IF EXISTS geometry.elevatedpoint_view CASCADE;

CREATE MATERIALIZED VIEW geometry.elevatedpoint_view AS
SELECT 
    id, 
    point as geom,
	ST_X(point) AS longitude,
	ST_Y(point) AS latitude,
	COALESCE(elevation || ' ' || elevation_uom, '(' || elevation_nilreason || ')') AS elevation,
	COALESCE(geoidundulation || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(verticaldatum || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(verticalaccuracy || ' ' || horizontalaccuracy_uom, '(' || verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM geometry.elevated_point_pt;

CREATE INDEX ON geometry.elevatedpoint_view (id);