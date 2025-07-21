-- Snwoflake SQL : NavaidComponentType

DROP MATERIALIZED VIEW IF EXISTS CASCADE;
CREATE MATERIALIZED VIEW navaids_points.navaidequipment_view AS
SELECT
    navaids_points.navaidequipment_pt.id AS id,
    coalesce(cast(navaids_points.navaidequipment_pt.title AS varchar), '(' || navaids_points.navaidequipment_pt.nilreason[1] || ')') AS title,
    navaids_points.navaidequipment_pt.href AS href
FROM navaids_points.navaidequipment_pt

CREATE INDEX ON navaids_points.navaidequipment_view (id);