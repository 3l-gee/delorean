CREATE OR REPLACE VIEW notes.linguisticnote_view AS
SELECT 
    notes.linguisticnote_pt.id,
    jsonb_build_object(
        'xml_id', notes.linguisticnote.xml_id,
        'note_lang', notes.linguisticnote.note_lang,
        'note_value', notes.linguisticnote.note_value,
        'note_nilreason',  notes.linguisticnote.note_nilreason
    ) AS linguisticnote
FROM notes.linguisticnote_pt
INNER JOIN notes.linguisticnote
ON notes.linguisticnote_pt.linguisticnote_id = notes.linguisticnote.id;

CREATE OR REPLACE VIEW notes.note_view AS
SELECT
	notes.note_pt.id,
    jsonb_build_object(
        'xml_id', notes.note.xml_id,
        'propertyname_value', notes.note.propertyname_value,
        'propertyname_nilreason', notes.note.propertyname_nilreason,
        'purpose_value', notes.note.purpose_value,
        'purpose_nilreason', notes.note.purpose_nilreason,
		'linguisticnote', COALESCE(jsonb_agg(notes.linguisticnote_view.linguisticnote), '[]'::jsonb)
    ) AS note
FROM notes.note_pt
INNER JOIN notes.note
ON notes.note_pt.note_id = notes.note.id
LEFT JOIN note_translatednote
ON notes.note.id = note_translatednote.note_id
LEFT JOIN notes.linguisticnote_view
ON note_translatednote.linguisticnote_pt_id = notes.linguisticnote_view.id
GROUP BY
    notes.note_pt.id,
    notes.note.xml_id,
    notes.note.propertyname_value,
    notes.note.propertyname_nilreason,
    notes.note.purpose_value,
    notes.note.purpose_nilreason;