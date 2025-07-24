-- Snowflake SQL : NotePropertyType 

CREATE INDEX ON notes.note_pt (note_id);
CREATE INDEX ON notes.note (id);

DROP MATERIALIZED VIEW IF EXISTS notes.note_view CASCADE;

CREATE MATERIALIZED VIEW notes.note_view AS
WITH pre_aggregated_notes AS (
    SELECT
        master_join.source_id AS note_id,
        jsonb_agg(
            jsonb_build_object(
                'id', linguisticnote_view.id,
                'lang', linguisticnote_view.lang,
                'note', linguisticnote_view.note
            )
        ) AS notes_array
    FROM master_join
    JOIN notes.linguisticnote_view ON master_join.target_id = linguisticnote_view.id
    GROUP BY master_join.source_id
)
SELECT
    note_pt.id,
    jsonb_build_object(
        'propertyName', COALESCE(note.propertyname_value, '(' || note.propertyname_nilreason || ')'),
        'purpose', COALESCE(note.purpose_value, '(' || note.purpose_nilreason || ')'),
        'notes', pre_aggregated_notes.notes_array
    ) AS note
FROM notes.note_pt
JOIN notes.note ON note_pt.note_id = note.id
LEFT JOIN pre_aggregated_notes ON pre_aggregated_notes.note_id = note.id;

CREATE INDEX ON notes.note_view (id);