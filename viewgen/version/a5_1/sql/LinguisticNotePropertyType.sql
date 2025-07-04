-- Snowflake SQL : LinguisticNotePropertyType 

CREATE INDEX ON notes.linguisticnote_pt (linguisticnote_id);
CREATE INDEX ON notes.linguisticnote (id);

CREATE MATERIALIZED VIEW notes.linguisticnote_view AS
SELECT 
    notes.linguisticnote_pt.id,
    notes.linguisticnote.note_lang AS lang,
    COALESCE(notes.linguisticnote.note_value, '('|| notes.linguisticnote.note_nilreason ||')') AS note
FROM notes.linguisticnote_pt
INNER JOIN notes.linguisticnote ON notes.linguisticnote_pt.linguisticnote_id = notes.linguisticnote.id;

CREATE INDEX ON notes.linguisticnote_view (id);