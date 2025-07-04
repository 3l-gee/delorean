-- Snowflake SQL : NotePropertyType 

CREATE INDEX ON notes.note_pt (note_id);
CREATE INDEX ON notes.note (id);

CREATE MATERIALIZED VIEW notes.note_view AS
SELECT
    notes.note_pt.id,
    jsonb_build_object(
        'propertyName', COALESCE(notes.note.propertyname_value, '(' || notes.note.propertyname_nilreason || ')'),
        'purpose', COALESCE(notes.note.purpose_value, '(' || notes.note.purpose_nilreason || ')'),
        'notes', translated_notes.notes_array
    ) AS note
FROM notes.note_pt
INNER JOIN notes.note ON notes.note_pt.note_id = notes.note.id
LEFT JOIN LATERAL (
    SELECT jsonb_agg(
        jsonb_build_object(
            'id', notes.linguisticnote_view.id,
            'lang', notes.linguisticnote_view.lang,
            'note', notes.linguisticnote_view.note
        )
    ) AS notes_array
    FROM master_join
    JOIN notes.linguisticnote_view ON master_join.target_id = notes.linguisticnote_view.id
    WHERE master_join.source_id = notes.note.id
) AS translated_notes ON true;

CREATE INDEX ON notes.note_view (id);