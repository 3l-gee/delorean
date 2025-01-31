CREATE OR REPLACE VIEW notes.linguisticnote_view AS
SELECT 
notes.linguisticnote_pt.id,
notes.linguisticnote.note_lang,
notes.linguisticnote.note_value
FROM notes.linguisticnote_pt
INNER JOIN notes.linguisticnote
ON notes.linguisticnote_pt.linguisticnote_id = notes.linguisticnote.id;

CREATE OR REPLACE VIEW notes.note_view AS
SELECT 
notes.note_pt.id, 
notes.note.propertyname_value,
notes.note.purpose_value,
notes.linguisticnote_view.note_lang,
notes.linguisticnote_view.note_value
FROM notes.note_pt
INNER JOIN notes.note
ON notes.note_pt.note_id = notes.note.id
INNER JOIN public.note_translatednote
ON notes.note.id = public.note_translatednote.note_id
INNER JOIN notes.linguisticnote_view
ON public.note_translatednote.linguisticnote_pt_id = notes.linguisticnote_view.id;