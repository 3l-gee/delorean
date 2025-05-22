CREATE OR REPLACE VIEW navaids_points.designatedpoint_publisher_view AS
SELECT DISTINCT ON (sequence_number)
(row_number() OVER ())::integer AS row,
navaids_points.designatedpoint.identifier,
navaids_points.designatedpoint_ts.sequence_number,
navaids_points.designatedpoint_ts.correction_number,
navaids_points.designatedpoint_ts.valid_time_begin,
navaids_points.designatedpoint_ts.valid_time_end,
navaids_points.designatedpoint_ts.feature_lifetime_begin,
navaids_points.designatedpoint_ts.feature_lifetime_end,
COALESCE(navaids_points.designatedpoint_ts.designator_value, '(' || navaids_points.designatedpoint_ts.designator_nilreason || ')') AS designator,
COALESCE(navaids_points.designatedpoint_ts.type_value, '(' || navaids_points.designatedpoint_ts.type_nilreason || ')') AS type,
COALESCE(navaids_points.designatedpoint_ts.name_value, '(' || navaids_points.designatedpoint_ts.name_nilreason || ')') AS name,
geometry.point_view.geom AS geom, 
ST_X(geometry.point_view.geom) AS longitude,
ST_Y(geometry.point_view.geom) AS latitude,
geometry.point_view.horizontalAccuracy,
notes.note_view.propertyName AS propertyName,
notes.note_view.purpose AS purpose,
notes.note_view.note AS note
FROM navaids_points.designatedpoint
INNER JOIN designatedpoint_timeslice
	ON navaids_points.designatedpoint.id = designatedpoint_timeslice.designatedpoint_id
INNER JOIN navaids_points.designatedpoint_tsp
	ON designatedpoint_timeslice.designatedpoint_tsp_id = navaids_points.designatedpoint_tsp.id
INNER JOIN navaids_points.designatedpoint_ts
	ON navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = navaids_points.designatedpoint_ts.id
LEFT JOIN geometry.point_view
    ON navaids_points.designatedpoint_ts.location_id = geometry.point_view.id
LEFT JOIN designatedpoint_ts_annotation
    ON navaids_points.designatedpoint_ts.id = designatedpoint_ts_annotation.designatedpoint_ts_id
LEFT JOIN notes.note_view
    ON designatedpoint_ts_annotation.note_pt_id = notes.note_view.id
WHERE
	navaids_points.designatedpoint.feature_status = 'APPROVED'
	AND 
	navaids_points.designatedpoint_ts.feature_status = 'APPROVED'
ORDER BY sequence_number, correction_number DESC;

CREATE OR REPLACE VIEW navaids_points.designatedpoint_editor_view AS
SELECT DISTINCT ON (sequence_number)
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
geometry.point_view.geom AS geom, 
ST_X(geometry.point_view.geom) AS longitude,
ST_Y(geometry.point_view.geom) AS latitude,
geometry.point_view.horizontalAccuracy,
notes.note_view.propertyName AS propertyName,
notes.note_view.purpose AS purpose,
notes.note_view.note AS note,
NULL AS action
FROM navaids_points.designatedpoint
INNER JOIN designatedpoint_timeslice
	ON navaids_points.designatedpoint.id = designatedpoint_timeslice.designatedpoint_id
INNER JOIN navaids_points.designatedpoint_tsp
	ON designatedpoint_timeslice.designatedpoint_tsp_id = navaids_points.designatedpoint_tsp.id
INNER JOIN navaids_points.designatedpoint_ts
	ON navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = navaids_points.designatedpoint_ts.id
LEFT JOIN geometry.point_view
    ON navaids_points.designatedpoint_ts.location_id = geometry.point_view.id
LEFT JOIN designatedpoint_ts_annotation
    ON navaids_points.designatedpoint_ts.id = designatedpoint_ts_annotation.designatedpoint_ts_id
LEFT JOIN notes.note_view
    ON designatedpoint_ts_annotation.note_pt_id = notes.note_view.id
ORDER BY sequence_number, correction_number DESC;

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