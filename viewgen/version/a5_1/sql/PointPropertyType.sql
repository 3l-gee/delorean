-- Snowflake SQL : PointPropertyType

DROP MATERIALIZED VIEW IF EXISTS geometry.point_view CASCADE;

CREATE MATERIALIZED VIEW geometry.point_view AS
SELECT
    id, 
	point as geom,
	ST_X(point) AS longitude,
	ST_Y(point) AS latitude,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM geometry.point_pt;

CREATE INDEX ON geometry.point_view (id);
CREATE INDEX ON geometry.point_view USING GIST (geom);