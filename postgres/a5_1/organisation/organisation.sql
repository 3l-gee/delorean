
CREATE OR REPLACE VIEW organisation.organisation_view AS
SELECT
organisation.organisationauthority.id,
organisation.organisationauthority.identifier,
organisation.organisationauthority_ts.name_value,
organisation.organisationauthority_ts.name_nilreason,
organisation.organisationauthority_ts.designator_value,
organisation.organisationauthority_ts.designator_nilreason,
organisation.organisationauthority_ts.type_value,
organisation.organisationauthority_ts.type_nilreason,
organisation.organisationauthority_ts.military_value,
organisation.organisationauthority_ts.military_nilreason,
organisation.organisationauthority_ts.interpretation,
organisation.organisationauthority_ts.sequence_number,
organisation.organisationauthority_ts.correction_number,
organisation.organisationauthority_ts.valid_time_begin,
organisation.organisationauthority_ts.valid_time_end,
organisation.organisationauthority_ts.feature_lifetime_begin,
organisation.organisationauthority_ts.feature_lifetime_end,
COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
COALESCE(jsonb_agg(shared.contactinformation_view.contactinformation), '[]'::jsonb) AS contactinformation
FROM organisation.organisationauthority
INNER JOIN organisationauthority_timeslice
    ON organisation.organisationauthority.id = organisationauthority_timeslice.organisationauthority_id
INNER JOIN organisation.organisationauthority_tsp
    ON organisationauthority_timeslice.organisationauthority_tsp_id = organisation.organisationauthority_tsp.id
INNER JOIN organisation.organisationauthority_ts
    ON organisation.organisationauthority_tsp.organisationauthoritytimeslice_id = organisation.organisationauthority_ts.id
LEFT JOIN organisationauthority_ts_annotation
    ON organisation.organisationauthority_ts.id = organisationauthority_ts_annotation.organisationauthority_ts_id
LEFT JOIN notes.note_view
    ON organisationauthority_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN organisationauthority_ts_contact
    ON organisation.organisationauthority_ts.id = organisationauthority_ts_contact.organisationauthority_ts_id
LEFT JOIN shared.contactinformation_view
    ON organisationauthority_ts_contact.contactinformation_pt_id = shared.contactinformation_view.id
-- LEFT JOIN organisationauthority_ts_relatedorganisationauthority
GROUP BY
organisation.organisationauthority.id,
organisation.organisationauthority.identifier,
organisation.organisationauthority_ts.name_value,
organisation.organisationauthority_ts.name_nilreason,
organisation.organisationauthority_ts.designator_value,
organisation.organisationauthority_ts.designator_nilreason,
organisation.organisationauthority_ts.type_value,
organisation.organisationauthority_ts.type_nilreason,
organisation.organisationauthority_ts.military_value,
organisation.organisationauthority_ts.military_nilreason,
organisation.organisationauthority_ts.interpretation,
organisation.organisationauthority_ts.sequence_number,
organisation.organisationauthority_ts.correction_number,
organisation.organisationauthority_ts.valid_time_begin,
organisation.organisationauthority_ts.valid_time_end,
organisation.organisationauthority_ts.feature_lifetime_begin,
organisation.organisationauthority_ts.feature_lifetime_end
