-- Snowflake SQL : PointPropertyType

CREATE MATERIALIZED VIEW geometry.point_view AS
SELECT
    id, 
	point as geom,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM geometry.point_pt;

CREATE INDEX ON geometry.point_view (id);