CREATE OR REPLACE VIEW navaids_points.designatedpoint_publisher_view AS
SELECT DISTINCT ON (identifier, sequence_number)
-- Generic
(row_number() OVER ())::integer AS row,
navaids_points.designatedpoint.identifier,
navaids_points.designatedpoint_ts.sequence_number,
navaids_points.designatedpoint_ts.correction_number,
navaids_points.designatedpoint_ts.valid_time_begin,
navaids_points.designatedpoint_ts.valid_time_end,
navaids_points.designatedpoint_ts.feature_lifetime_begin,
navaids_points.designatedpoint_ts.feature_lifetime_end,
-- Attributes
COALESCE(navaids_points.designatedpoint_ts.designator_value, '(' || navaids_points.designatedpoint_ts.designator_nilreason || ')') AS designator,
COALESCE(navaids_points.designatedpoint_ts.type_value, '(' || navaids_points.designatedpoint_ts.type_nilreason || ')') AS type,
COALESCE(navaids_points.designatedpoint_ts.name_value, '(' || navaids_points.designatedpoint_ts.name_nilreason || ')') AS name,
-- Association airportHeliport
COALESCE(airport_heliport.airportheliport_pt.title, '(' || airport_heliport.airportheliport_pt.nilreason[1] || ')') AS airportHeliport,
airport_heliport.airportheliport_pt.href AS airportheliport_href,
-- Association aimingPoint
COALESCE(airport_heliport.touchdownliftoff_pt.title, '(' || airport_heliport.touchdownliftoff_pt.nilreason[1] || ')') AS aimingPoint,
airport_heliport.touchdownliftoff_pt.href AS touchdownliftoff_href,
-- Association runwayPoint
COALESCE(airport_heliport.runwaycentrelinepoint_pt.title, '(' || airport_heliport.runwaycentrelinepoint_pt.nilreason[1] || ')') AS runwayPoint,
airport_heliport.runwaycentrelinepoint_pt.href AS runwaycentrelinepoint_href,
-- Association location
geometry.point_view.geom AS geom, 
ST_X(geometry.point_view.geom) AS longitude,
ST_Y(geometry.point_view.geom) AS latitude,
geometry.point_view.horizontalAccuracy,
-- Association annotation
jsonb_agg(notes.note_view.note) AS note
FROM navaids_points.designatedpoint
INNER JOIN master_join mj1 ON navaids_points.designatedpoint.id = mj1.source_id
INNER JOIN navaids_points.designatedpoint_tsp ON mj1.target_id = navaids_points.designatedpoint_tsp.id
INNER JOIN navaids_points.designatedpoint_ts ON navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = navaids_points.designatedpoint_ts.id
LEFT JOIN geometry.point_view ON navaids_points.designatedpoint_ts.location_id = geometry.point_view.id
LEFT JOIN airport_heliport.touchdownliftoff_pt ON navaids_points.designatedpoint_ts.aimingpoint_id = airport_heliport.touchdownliftoff_pt.id
LEFT JOIN airport_heliport.airportheliport_pt ON navaids_points.designatedpoint_ts.airportheliport_id = airport_heliport.airportheliport_pt.id
LEFT JOIN airport_heliport.runwaycentrelinepoint_pt ON navaids_points.designatedpoint_ts.runwaypoint_id = airport_heliport.runwaycentrelinepoint_pt.id
LEFT JOIN master_join mj2 ON navaids_points.designatedpoint_ts.id = mj2.source_id
LEFT JOIN notes.note_view ON mj2.target_id = notes.note_view.id
WHERE
	navaids_points.designatedpoint.feature_status = 'APPROVED'
	AND 
	navaids_points.designatedpoint_ts.feature_status = 'APPROVED'
GROUP BY
	navaids_points.designatedpoint.identifier,
	navaids_points.designatedpoint_ts.sequence_number,
	navaids_points.designatedpoint_ts.correction_number,
	navaids_points.designatedpoint_ts.valid_time_begin,
	navaids_points.designatedpoint_ts.valid_time_end,
	navaids_points.designatedpoint_ts.feature_lifetime_begin,
	navaids_points.designatedpoint_ts.feature_lifetime_end,
	navaids_points.designatedpoint_ts.designator_value,
	navaids_points.designatedpoint_ts.designator_nilreason,
	navaids_points.designatedpoint_ts.type_value,
	navaids_points.designatedpoint_ts.type_nilreason,
	navaids_points.designatedpoint_ts.name_value,
	navaids_points.designatedpoint_ts.name_nilreason,
	airport_heliport.airportheliport_pt.title,
	airport_heliport.airportheliport_pt.nilreason[1],
	airport_heliport.airportheliport_pt.href,
	airport_heliport.touchdownliftoff_pt.title,
	airport_heliport.touchdownliftoff_pt.nilreason[1],
	airport_heliport.touchdownliftoff_pt.href,
	airport_heliport.runwaycentrelinepoint_pt.title,
	airport_heliport.runwaycentrelinepoint_pt.nilreason[1],
	airport_heliport.runwaycentrelinepoint_pt.href,
	geometry.point_view.geom, 
	geometry.point_view.horizontalAccuracy

ORDER BY identifier, sequence_number, correction_number DESC;


CREATE OR REPLACE VIEW navaids_points.designatedpoint_editor_view AS
SELECT DISTINCT ON (identifier, sequence_number)
(row_number() OVER ())::integer AS row,
navaids_points.designatedpoint.id,
navaids_points.designatedpoint.identifier,
navaids_points.designatedpoint_ts.sequence_number,
navaids_points.designatedpoint_ts.correction_number,
navaids_points.designatedpoint_ts.valid_time_begin,
navaids_points.designatedpoint_ts.valid_time_end,
navaids_points.designatedpoint_ts.feature_lifetime_begin,
navaids_points.designatedpoint_ts.feature_lifetime_end,
navaids_points.designatedpoint_ts.designator_value,
navaids_points.designatedpoint_ts.designator_nilreason,
navaids_points.designatedpoint_ts.type_value,
navaids_points.designatedpoint_ts.type_nilreason,
navaids_points.designatedpoint_ts.name_value,
navaids_points.designatedpoint_ts.name_nilreason,

-- Location
point_pt.id as location_id,
point_pt.point AS geom, 
ST_X(point_pt.point) AS longitude,
ST_Y(point_pt.point) AS latitude,
point_pt.horizontalAccuracy,
point_pt.horizontalaccuracy_uom,
point_pt.horizontalaccuracy_nilreason,
point_pt.nilreason,

-- Notes
translated_notes.notes_array AS note_json

-- Touchedownliftoff
airport_heliport.touchdownliftoff_pt.title,
airport_heliport.touchdownliftoff_pt.href,
airport_heliport.touchdownliftoff_pt.nilreason,

-- AirportHeliport
airport_heliport.airportheliport_pt.title,
airport_heliport.airportheliport_pt.href,
airport_heliport.airportheliport_pt.nilreason,

-- RunwayCenterline
airport_heliport.runwaycentrelinepoint_pt.title,
airport_heliport.runwaycentrelinepoint_pt.href,
airport_heliport.runwaycentrelinepoint_pt.nilreason,

NULL AS action
	
FROM navaids_points.designatedpoint
INNER JOIN master_join mj1 ON navaids_points.designatedpoint.id = mj1.source_id
INNER JOIN navaids_points.designatedpoint_tsp ON mj1.target_id = navaids_points.designatedpoint_tsp.id
INNER JOIN navaids_points.designatedpoint_ts ON navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = navaids_points.designatedpoint_ts.id
LEFT JOIN point_pt ON navaids_points.designatedpoint_ts.location_id = point_pt.id
LEFT JOIN airport_heliport.touchdownliftoff_pt ON navaids_points.designatedpoint_ts.aimingpoint_id = airport_heliport.touchdownliftoff_pt.id
LEFT JOIN airport_heliport.airportheliport_pt ON navaids_points.designatedpoint_ts.airportheliport_id = airport_heliport.airportheliport_pt.id
LEFT JOIN airport_heliport.runwaycentrelinepoint_pt ON navaids_points.designatedpoint_ts.runwaypoint_id = airport_heliport.runwaycentrelinepoint_pt.id


-- LATERAL join for all notes and their translations per timeslice
LEFT JOIN LATERAL (
    SELECT jsonb_agg(
        jsonb_build_object(
            'note_id', n.id,
            'propertyname_value', n.propertyname_value,
            'propertyname_nilreason', n.propertyname_nilreason,
            'purpose_value', n.purpose_value,
            'purpose_nilreason', n.purpose_nilreason,
            'isWrittenAs', (
                SELECT jsonb_agg(
                    jsonb_build_object(
                        'id', lpt.id,
                        'lang', ln.note_lang,
                        'value', COALESCE(ln.note_value, '(' || ln.note_nilreason || ')')
                    )
                )
                FROM master_join mj3
                JOIN notes.linguisticnote_pt lpt ON mj3.target_id = lpt.id
                JOIN notes.linguisticnote ln ON lpt.linguisticnote_id = ln.id
                WHERE mj3.source_id = n.id
            )
        )
    ) AS notes_array
    FROM master_join mj2
    JOIN notes.note_pt npt ON mj2.target_id = npt.id
    JOIN notes.note n ON npt.note_id = n.id
    WHERE mj2.source_id = navaids_points.designatedpoint_ts.id
) AS translated_notes ON true

ORDER BY identifier, sequence_number, correction_number DESC

CREATE OR REPLACE FUNCTION navaids_points.fct_designatedpoint_update()
RETURNS trigger AS $$
DECLARE
    new_designatedpoint_id INTEGER := nextval('public.delorean_seq_gen');
    new_ts_id INTEGER := nextval('public.delorean_seq_gen');
    new_tsp_id INTEGER := nextval('public.delorean_seq_gen');
    new_timeslice_id INTEGER := nextval('public.delorean_seq_gen');
    new_location_id INTEGER;
    new_note_id INTEGER;
BEGIN

    INSERT INTO navaids_points.designatedpoint_ts (
        id, 
        sequence_number, 
        correction_number,
        valid_time_begin, 
        valid_time_end,
        feature_lifetime_begin, 
        feature_lifetime_end,
		interpretation,
        designator_value, 
        designator_nilreason,
        type_value, 
        type_nilreason,
        name_value,
        name_nilreason,
        location_id, 
        aimingpoint_id,
        airportheliport_id,
        runwaypoint_id,
        feature_status
    ) VALUES (
        new_ts_id, 
        NEW.sequence_number + 1,
        NEW.correction_number,
        NEW.valid_time_begin, 
        NEW.valid_time_end,
        NEW.feature_lifetime_begin, 
        NEW.feature_lifetime_end,
		'BASELINE',
        NEW.designator_value, 
        NEW.designator_nilreason, 
        NEW.type_value, 
        NEW.type_nilreason,
        NEW.name_value,
        NEW.name_nilreason,
        NULL, 
        NULL, 
        NULL, 
        NULL, 
        'PENDING'
    );
	
	INSERT INTO navaids_points.designatedpoint_tsp (
        id,
        designatedpointtimeslice_id
    ) VALUES (
        new_tsp_id,
        new_ts_id
    );

    INSERT INTO designatedpoint_timeslice (
        designatedpoint_id,
        designatedpoint_tsp_id
    ) VALUES (
		NEW.id,
        new_tsp_id
    );
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_designatedpoint_update ON navaids_points.designatedpoint_editor_view;

CREATE TRIGGER trg_designatedpoint_update
INSTEAD OF UPDATE ON navaids_points.designatedpoint_editor_view
FOR EACH ROW
EXECUTE FUNCTION navaids_points.fct_designatedpoint_update();