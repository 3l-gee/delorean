CREATE OR REPLACE VIEW navaids_points.authorityfornavaidequipment_view AS
SELECT
navaids_points.authorityfornavaidequipment_pt.id,
COALESCE(navaids_points.authorityfornavaidequipment.type_value, '(' || navaids_points.authorityfornavaidequipment.type_nilreason || ')') AS type,
organisation.organisationauthority_pt.title AS title,
organisation.organisationauthority_pt.href AS uuid,
COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS annotation
FROM navaids_points.authorityfornavaidequipment_pt
INNER JOIN navaids_points.authorityfornavaidequipment
    ON navaids_points.authorityfornavaidequipment_pt.authorityfornavaidequipment_id = navaids_points.authorityfornavaidequipment.id
LEFT JOIN authorityforauthorityfornavaidequipment_annotation
    ON navaids_points.authorityfornavaidequipment.id = authorityforauthorityfornavaidequipment_annotation.authorityforauthorityfornavaidequipment_id
LEFT JOIN notes.note_view
    ON authorityforauthorityfornavaidequipment_annotation.note_pt_id = notes.note_view.id
LEFT JOIN organisation.organisationauthority_pt
    ON navaids_points.authorityfornavaidequipment.theorganisationauthority_id = organisation.organisationauthority_pt.id
-- LEFT JOIN organisation.organisation_view
    -- ON SUBSTRING(organisation.organisationauthority_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = organisation.organisation_view.identifier 
GROUP BY
    navaids_points.authorityfornavaidequipment_pt.id,
    navaids_points.authorityfornavaidequipment.xml_id,
    navaids_points.authorityfornavaidequipment.type_value,
    navaids_points.authorityfornavaidequipment.type_nilreason,
    organisation.organisationauthority_pt.title,
    organisation.organisationauthority_pt.href;

CREATE MATERIALIZED VIEW navaids_points.sdf_view AS
SELECT 
    navaids_points.sdf.id,
    navaids_points.sdf.identifier,
    navaids_points.sdf_ts.designator_value,
    navaids_points.sdf_ts.designator_nilreason,
    navaids_points.sdf_ts.name_value,
    navaids_points.sdf_ts.name_nilreason,
    navaids_points.sdf_ts.emissionclass_value,
    navaids_points.sdf_ts.emissionclass_nilreason,
    navaids_points.sdf_ts.mobile_value,
    navaids_points.sdf_ts.mobile_nilreason,
    navaids_points.sdf_ts.magneticvariation_value,
    navaids_points.sdf_ts.magneticvariation_nilreason,
    navaids_points.sdf_ts.magneticvariationaccuracy_value,
    navaids_points.sdf_ts.magneticvariationaccuracy_nilreason,
    navaids_points.sdf_ts.datemagneticvariation_value,
    navaids_points.sdf_ts.datemagneticvariation_nilreason,
    navaids_points.sdf_ts.flightchecked_value,
    navaids_points.sdf_ts.flightchecked_nilreason,
    navaids_points.sdf_ts.magneticbearing_value,
    navaids_points.sdf_ts.magneticbearing_nilreason,
    navaids_points.sdf_ts.truebearing_value,
    navaids_points.sdf_ts.truebearing_nilreason,
    navaids_points.sdf_ts.frequency_value,
    navaids_points.sdf_ts.frequency_uom,
    navaids_points.sdf_ts.frequency_nilreason,
    navaids_points.sdf_ts.interpretation,
    navaids_points.sdf_ts.sequence_number,
    navaids_points.sdf_ts.correction_number,
    navaids_points.sdf_ts.valid_time_begin,
    navaids_points.sdf_ts.valid_time_end,
    navaids_points.sdf_ts.feature_lifetime_begin,
    navaids_points.sdf_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.sdf
INNER JOIN sdf_timeslice
    ON navaids_points.sdf.id = sdf_timeslice.sdf_id
INNER JOIN navaids_points.sdf_tsp
    ON sdf_timeslice.sdf_tsp_id = sdf_tsp.id
INNER JOIN navaids_points.sdf_ts
    ON navaids_points.sdf_tsp.sdftimeslice_id = navaids_points.sdf_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.sdf_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN sdf_ts_authority
    ON navaids_points.sdf_ts.id = sdf_ts_authority.sdf_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON sdf_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN sdf_ts_annotation
    ON navaids_points.sdf_ts.id = sdf_ts_annotation.sdf_ts_id
LEFT JOIN notes.note_view
    ON sdf_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.sdf_ts.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY 
    navaids_points.sdf.id,
    navaids_points.sdf.identifier,
    navaids_points.sdf_ts.designator_value,
    navaids_points.sdf_ts.designator_nilreason,
    navaids_points.sdf_ts.name_value,
    navaids_points.sdf_ts.name_nilreason,
    navaids_points.sdf_ts.emissionclass_value,
    navaids_points.sdf_ts.emissionclass_nilreason,
    navaids_points.sdf_ts.mobile_value,
    navaids_points.sdf_ts.mobile_nilreason,
    navaids_points.sdf_ts.magneticvariation_value,
    navaids_points.sdf_ts.magneticvariation_nilreason,
    navaids_points.sdf_ts.magneticvariationaccuracy_value,
    navaids_points.sdf_ts.magneticvariationaccuracy_nilreason,
    navaids_points.sdf_ts.datemagneticvariation_value,
    navaids_points.sdf_ts.datemagneticvariation_nilreason,
    navaids_points.sdf_ts.flightchecked_value,
    navaids_points.sdf_ts.flightchecked_nilreason,
    navaids_points.sdf_ts.magneticbearing_value,
    navaids_points.sdf_ts.magneticbearing_nilreason,
    navaids_points.sdf_ts.truebearing_value,
    navaids_points.sdf_ts.truebearing_nilreason,
    navaids_points.sdf_ts.frequency_value,
    navaids_points.sdf_ts.frequency_uom,
    navaids_points.sdf_ts.frequency_nilreason,
    navaids_points.sdf_ts.interpretation,
    navaids_points.sdf_ts.sequence_number,
    navaids_points.sdf_ts.correction_number,
    navaids_points.sdf_ts.valid_time_begin,
    navaids_points.sdf_ts.valid_time_end,
    navaids_points.sdf_ts.feature_lifetime_begin,
    navaids_points.sdf_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;


CREATE MATERIALIZED VIEW navaids_points.markerbeacon_view AS
SELECT 
    (row_number() OVER ())::integer AS row,
    navaids_points.markerbeacon.id,
    navaids_points.markerbeacon.identifier,
    navaids_points.markerbeacon_ts.designator_value,
    navaids_points.markerbeacon_ts.designator_nilreason,
    navaids_points.markerbeacon_ts.name_value,
    navaids_points.markerbeacon_ts.name_nilreason,
    navaids_points.markerbeacon_ts.emissionclass_value,
    navaids_points.markerbeacon_ts.emissionclass_nilreason,
    navaids_points.markerbeacon_ts.mobile_value,
    navaids_points.markerbeacon_ts.mobile_nilreason,
    navaids_points.markerbeacon_ts.magneticvariation_value,
    navaids_points.markerbeacon_ts.magneticvariation_nilreason,
    navaids_points.markerbeacon_ts.magneticvariationaccuracy_value,
    navaids_points.markerbeacon_ts.magneticvariationaccuracy_nilreason,
    navaids_points.markerbeacon_ts.datemagneticvariation_value,
    navaids_points.markerbeacon_ts.datemagneticvariation_nilreason,
    navaids_points.markerbeacon_ts.flightchecked_value,
    navaids_points.markerbeacon_ts.flightchecked_nilreason,
    navaids_points.markerbeacon_ts.class_value,
    navaids_points.markerbeacon_ts.class_nilreason,
    navaids_points.markerbeacon_ts.axisbearing_value,
    navaids_points.markerbeacon_ts.axisbearing_nilreason,
    navaids_points.markerbeacon_ts.auralmorsecode_value,
    navaids_points.markerbeacon_ts.auralmorsecode_nilreason,
    navaids_points.markerbeacon_ts.frequency_value,
    navaids_points.markerbeacon_ts.frequency_uom,
    navaids_points.markerbeacon_ts.frequency_nilreason,
    navaids_points.markerbeacon_ts.interpretation,
    navaids_points.markerbeacon_ts.sequence_number,
    navaids_points.markerbeacon_ts.correction_number,
    navaids_points.markerbeacon_ts.valid_time_begin,
    navaids_points.markerbeacon_ts.valid_time_end,
    navaids_points.markerbeacon_ts.feature_lifetime_begin,
    navaids_points.markerbeacon_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.markerbeacon
INNER JOIN markerbeacon_timeslice
    ON navaids_points.markerbeacon.id = markerbeacon_timeslice.markerbeacon_id
INNER JOIN navaids_points.markerbeacon_tsp
    ON markerbeacon_timeslice.markerbeacon_tsp_id = navaids_points.markerbeacon_tsp.id
INNER JOIN navaids_points.markerbeacon_ts
    ON navaids_points.markerbeacon_tsp.markerbeacontimeslice_id = navaids_points.markerbeacon_ts.id 
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.markerbeacon_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN markerbeacon_ts_authority
    ON navaids_points.markerbeacon_ts.location_id = markerbeacon_ts_authority.markerbeacon_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON markerbeacon_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN markerbeacon_ts_annotation
    ON navaids_points.markerbeacon_ts.location_id = markerbeacon_ts_annotation.markerbeacon_ts_id
LEFT JOIN notes.note_view
    ON markerbeacon_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.markerbeacon.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.markerbeacon.id,
    navaids_points.markerbeacon.identifier,
    navaids_points.markerbeacon_ts.designator_value,
    navaids_points.markerbeacon_ts.designator_nilreason,
    navaids_points.markerbeacon_ts.name_value,
    navaids_points.markerbeacon_ts.name_nilreason,
    navaids_points.markerbeacon_ts.emissionclass_value,
    navaids_points.markerbeacon_ts.emissionclass_nilreason,
    navaids_points.markerbeacon_ts.mobile_value,
    navaids_points.markerbeacon_ts.mobile_nilreason,
    navaids_points.markerbeacon_ts.magneticvariation_value,
    navaids_points.markerbeacon_ts.magneticvariation_nilreason,
    navaids_points.markerbeacon_ts.magneticvariationaccuracy_value,
    navaids_points.markerbeacon_ts.magneticvariationaccuracy_nilreason,
    navaids_points.markerbeacon_ts.datemagneticvariation_value,
    navaids_points.markerbeacon_ts.datemagneticvariation_nilreason,
    navaids_points.markerbeacon_ts.flightchecked_value,
    navaids_points.markerbeacon_ts.flightchecked_nilreason,
    navaids_points.markerbeacon_ts.class_value,
    navaids_points.markerbeacon_ts.class_nilreason,
    navaids_points.markerbeacon_ts.axisbearing_value,
    navaids_points.markerbeacon_ts.axisbearing_nilreason,
    navaids_points.markerbeacon_ts.auralmorsecode_value,
    navaids_points.markerbeacon_ts.auralmorsecode_nilreason,
    navaids_points.markerbeacon_ts.frequency_value,
    navaids_points.markerbeacon_ts.frequency_uom,
    navaids_points.markerbeacon_ts.frequency_nilreason,
    navaids_points.markerbeacon_ts.interpretation,
    navaids_points.markerbeacon_ts.sequence_number,
    navaids_points.markerbeacon_ts.correction_number,
    navaids_points.markerbeacon_ts.valid_time_begin,
    navaids_points.markerbeacon_ts.valid_time_end,
    navaids_points.markerbeacon_ts.feature_lifetime_begin,
    navaids_points.markerbeacon_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;

CREATE MATERIALIZED VIEW navaids_points.elevation_view AS
SELECT
    (row_number() OVER ())::integer AS row,
    navaids_points.elevation.id,
    navaids_points.elevation.identifier,
    navaids_points.elevation_ts.designator_value,
    navaids_points.elevation_ts.designator_nilreason,
    navaids_points.elevation_ts.name_value,
    navaids_points.elevation_ts.name_nilreason,
    navaids_points.elevation_ts.emissionclass_value,
    navaids_points.elevation_ts.emissionclass_nilreason,
    navaids_points.elevation_ts.mobile_value,
    navaids_points.elevation_ts.mobile_nilreason,
    navaids_points.elevation_ts.magneticvariation_value,
    navaids_points.elevation_ts.magneticvariation_nilreason,
    navaids_points.elevation_ts.magneticvariationaccuracy_value,
    navaids_points.elevation_ts.magneticvariationaccuracy_nilreason,
    navaids_points.elevation_ts.datemagneticvariation_value,
    navaids_points.elevation_ts.datemagneticvariation_nilreason,
    navaids_points.elevation_ts.flightchecked_value,
    navaids_points.elevation_ts.flightchecked_nilreason,
    navaids_points.elevation_ts.anglenominal_value,
    navaids_points.elevation_ts.anglenominal_nilreason,
    navaids_points.elevation_ts.angleminimum_value,
    navaids_points.elevation_ts.angleminimum_nilreason,
    navaids_points.elevation_ts.anglespan_value,
    navaids_points.elevation_ts.anglespan_nilreason,
    navaids_points.elevation_ts.angleaccuracy_value,
    navaids_points.elevation_ts.angleaccuracy_nilreason,
    navaids_points.elevation_ts.interpretation,
    navaids_points.elevation_ts.sequence_number,
    navaids_points.elevation_ts.correction_number,
    navaids_points.elevation_ts.valid_time_begin,
    navaids_points.elevation_ts.valid_time_end,
    navaids_points.elevation_ts.feature_lifetime_begin,
    navaids_points.elevation_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.elevation
INNER JOIN elevation_timeslice
    ON navaids_points.elevation.id = elevation_timeslice.elevation_id
INNER JOIN navaids_points.elevation_tsp
    ON elevation_timeslice.elevation_tsp_id = navaids_points.elevation_tsp.id
INNER JOIN navaids_points.elevation_ts 
    ON navaids_points.elevation_tsp.elevationtimeslice_id = navaids_points.elevation_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.elevation_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN elevation_ts_authority
    ON navaids_points.elevation_ts.id = elevation_ts_authority.elevation_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON elevation_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN elevation_ts_annotation
    ON navaids_points.elevation_ts.id = elevation_ts_annotation.elevation_ts_id
LEFT JOIN notes.note_view
    ON elevation_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.elevation.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.elevation.id,
    navaids_points.elevation.identifier,
    navaids_points.elevation_ts.designator_value,
    navaids_points.elevation_ts.designator_nilreason,
    navaids_points.elevation_ts.name_value,
    navaids_points.elevation_ts.name_nilreason,
    navaids_points.elevation_ts.emissionclass_value,
    navaids_points.elevation_ts.emissionclass_nilreason,
    navaids_points.elevation_ts.mobile_value,
    navaids_points.elevation_ts.mobile_nilreason,
    navaids_points.elevation_ts.magneticvariation_value,
    navaids_points.elevation_ts.magneticvariation_nilreason,
    navaids_points.elevation_ts.magneticvariationaccuracy_value,
    navaids_points.elevation_ts.magneticvariationaccuracy_nilreason,
    navaids_points.elevation_ts.datemagneticvariation_value,
    navaids_points.elevation_ts.datemagneticvariation_nilreason,
    navaids_points.elevation_ts.flightchecked_value,
    navaids_points.elevation_ts.flightchecked_nilreason,
    navaids_points.elevation_ts.anglenominal_value,
    navaids_points.elevation_ts.anglenominal_nilreason,
    navaids_points.elevation_ts.angleminimum_value,
    navaids_points.elevation_ts.angleminimum_nilreason,
    navaids_points.elevation_ts.anglespan_value,
    navaids_points.elevation_ts.anglespan_nilreason,
    navaids_points.elevation_ts.angleaccuracy_value,
    navaids_points.elevation_ts.angleaccuracy_nilreason,
    navaids_points.elevation_ts.interpretation,
    navaids_points.elevation_ts.sequence_number,
    navaids_points.elevation_ts.correction_number,
    navaids_points.elevation_ts.valid_time_begin,
    navaids_points.elevation_ts.valid_time_end,
    navaids_points.elevation_ts.feature_lifetime_begin,
    navaids_points.elevation_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;



CREATE MATERIALIZED VIEW navaids_points.directionfinder_view AS
SELECT
    (row_number() OVER ())::integer AS row,
    navaids_points.directionfinder.id,
    navaids_points.directionfinder.identifier,
    navaids_points.directionfinder_ts.designator_value,
    navaids_points.directionfinder_ts.designator_nilreason,
    navaids_points.directionfinder_ts.name_value,
    navaids_points.directionfinder_ts.name_nilreason,
    navaids_points.directionfinder_ts.emissionclass_value,
    navaids_points.directionfinder_ts.emissionclass_nilreason,
    navaids_points.directionfinder_ts.mobile_value,
    navaids_points.directionfinder_ts.mobile_nilreason,
    navaids_points.directionfinder_ts.magneticvariation_value,
    navaids_points.directionfinder_ts.magneticvariation_nilreason,
    navaids_points.directionfinder_ts.magneticvariationaccuracy_value,
    navaids_points.directionfinder_ts.magneticvariationaccuracy_nilreason,
    navaids_points.directionfinder_ts.datemagneticvariation_value,
    navaids_points.directionfinder_ts.datemagneticvariation_nilreason,
    navaids_points.directionfinder_ts.flightchecked_value,
    navaids_points.directionfinder_ts.flightchecked_nilreason,
    navaids_points.directionfinder_ts.doppler_value,
    navaids_points.directionfinder_ts.doppler_nilreason,
    navaids_points.directionfinder_ts.interpretation,
    navaids_points.directionfinder_ts.sequence_number,
    navaids_points.directionfinder_ts.correction_number,
    navaids_points.directionfinder_ts.valid_time_begin,
    navaids_points.directionfinder_ts.valid_time_end,
    navaids_points.directionfinder_ts.feature_lifetime_begin,
    navaids_points.directionfinder_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.directionfinder
INNER JOIN directionfinder_timeslice
    ON navaids_points.directionfinder.id = directionfinder_timeslice.directionfinder_id
INNER JOIN navaids_points.directionfinder_tsp
    ON directionfinder_timeslice.directionfinder_tsp_id = navaids_points.directionfinder_tsp.id
INNER JOIN navaids_points.directionfinder_ts
    ON navaids_points.directionfinder_tsp.directionfindertimeslice_id = navaids_points.directionfinder_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.directionfinder_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN directionfinder_ts_annotation
    ON navaids_points.directionfinder_ts.id = directionfinder_ts_annotation.directionfinder_ts_id
LEFT JOIN notes.note_view
    ON directionfinder_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN directionfinder_ts_authority
    ON navaids_points.directionfinder_ts.id = directionfinder_ts_authority.directionfinder_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON directionfinder_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.directionfinder.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.directionfinder.id,
    navaids_points.directionfinder.identifier,
    navaids_points.directionfinder_ts.designator_value,
    navaids_points.directionfinder_ts.designator_nilreason,
    navaids_points.directionfinder_ts.name_value,
    navaids_points.directionfinder_ts.name_nilreason,
    navaids_points.directionfinder_ts.emissionclass_value,
    navaids_points.directionfinder_ts.emissionclass_nilreason,
    navaids_points.directionfinder_ts.mobile_value,
    navaids_points.directionfinder_ts.mobile_nilreason,
    navaids_points.directionfinder_ts.magneticvariation_value,
    navaids_points.directionfinder_ts.magneticvariation_nilreason,
    navaids_points.directionfinder_ts.magneticvariationaccuracy_value,
    navaids_points.directionfinder_ts.magneticvariationaccuracy_nilreason,
    navaids_points.directionfinder_ts.datemagneticvariation_value,
    navaids_points.directionfinder_ts.datemagneticvariation_nilreason,
    navaids_points.directionfinder_ts.flightchecked_value,
    navaids_points.directionfinder_ts.flightchecked_nilreason,
    navaids_points.directionfinder_ts.doppler_value,
    navaids_points.directionfinder_ts.doppler_nilreason,
    navaids_points.directionfinder_ts.interpretation,
    navaids_points.directionfinder_ts.sequence_number,
    navaids_points.directionfinder_ts.correction_number,
    navaids_points.directionfinder_ts.valid_time_begin,
    navaids_points.directionfinder_ts.valid_time_end,
    navaids_points.directionfinder_ts.feature_lifetime_begin,
    navaids_points.directionfinder_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;

CREATE MATERIALIZED VIEW navaids_points.azimuth_view AS
SELECT
    (row_number() OVER ())::integer AS row,
    navaids_points.azimuth.id,
    navaids_points.azimuth.identifier,
    navaids_points.azimuth_ts.designator_value,
    navaids_points.azimuth_ts.designator_nilreason,
    navaids_points.azimuth_ts.name_value,
    navaids_points.azimuth_ts.name_nilreason,
    navaids_points.azimuth_ts.emissionclass_value,
    navaids_points.azimuth_ts.emissionclass_nilreason,
    navaids_points.azimuth_ts.mobile_value,
    navaids_points.azimuth_ts.mobile_nilreason,
    navaids_points.azimuth_ts.magneticvariation_value,
    navaids_points.azimuth_ts.magneticvariation_nilreason,
    navaids_points.azimuth_ts.magneticvariationaccuracy_value,
    navaids_points.azimuth_ts.magneticvariationaccuracy_nilreason,
    navaids_points.azimuth_ts.datemagneticvariation_value,
    navaids_points.azimuth_ts.datemagneticvariation_nilreason,
    navaids_points.azimuth_ts.flightchecked_value,
    navaids_points.azimuth_ts.flightchecked_nilreason,
    navaids_points.azimuth_ts.type_value,
    navaids_points.azimuth_ts.type_nilreason,
    navaids_points.azimuth_ts.truebearing_value,
    navaids_points.azimuth_ts.truebearing_nilreason,
    navaids_points.azimuth_ts.truebearingaccuracy_value,
    navaids_points.azimuth_ts.truebearingaccuracy_nilreason,
    navaids_points.azimuth_ts.magneticbearing_value,
    navaids_points.azimuth_ts.magneticbearing_nilreason,
    navaids_points.azimuth_ts.angleproportionalleft_value,
    navaids_points.azimuth_ts.angleproportionalleft_nilreason,
    navaids_points.azimuth_ts.angleproportionalright_value,
    navaids_points.azimuth_ts.angleproportionalright_nilreason,
    navaids_points.azimuth_ts.anglecoverleft_value,
    navaids_points.azimuth_ts.anglecoverleft_nilreason,
    navaids_points.azimuth_ts.anglecoverright_value,
    navaids_points.azimuth_ts.anglecoverright_nilreason,
    navaids_points.azimuth_ts.channel_value,
    navaids_points.azimuth_ts.channel_nilreason,
    navaids_points.azimuth_ts.interpretation,
    navaids_points.azimuth_ts.sequence_number,
    navaids_points.azimuth_ts.correction_number,
    navaids_points.azimuth_ts.valid_time_begin,
    navaids_points.azimuth_ts.valid_time_end,
    navaids_points.azimuth_ts.feature_lifetime_begin,
    navaids_points.azimuth_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.azimuth
INNER JOIN azimuth_timeslice
    ON navaids_points.azimuth.id = azimuth_timeslice.azimuth_id
INNER JOIN navaids_points.azimuth_tsp
    ON azimuth_timeslice.azimuth_tsp_id = navaids_points.azimuth_tsp.id
INNER JOIN navaids_points.azimuth_ts
    ON  navaids_points.azimuth_tsp.azimuthtimeslice_id = navaids_points.azimuth_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.azimuth_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN azimuth_ts_annotation
    ON navaids_points.azimuth_ts.id = azimuth_ts_annotation.azimuth_ts_id
LEFT JOIN notes.note_view
    ON azimuth_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN azimuth_ts_authority
    ON navaids_points.azimuth_ts.id = azimuth_ts_authority.azimuth_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON azimuth_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.azimuth.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.azimuth.id,
    navaids_points.azimuth.identifier,
    navaids_points.azimuth_ts.designator_value,
    navaids_points.azimuth_ts.designator_nilreason,
    navaids_points.azimuth_ts.name_value,
    navaids_points.azimuth_ts.name_nilreason,
    navaids_points.azimuth_ts.emissionclass_value,
    navaids_points.azimuth_ts.emissionclass_nilreason,
    navaids_points.azimuth_ts.mobile_value,
    navaids_points.azimuth_ts.mobile_nilreason,
    navaids_points.azimuth_ts.magneticvariation_value,
    navaids_points.azimuth_ts.magneticvariation_nilreason,
    navaids_points.azimuth_ts.magneticvariationaccuracy_value,
    navaids_points.azimuth_ts.magneticvariationaccuracy_nilreason,
    navaids_points.azimuth_ts.datemagneticvariation_value,
    navaids_points.azimuth_ts.datemagneticvariation_nilreason,
    navaids_points.azimuth_ts.flightchecked_value,
    navaids_points.azimuth_ts.flightchecked_nilreason,
    navaids_points.azimuth_ts.type_value,
    navaids_points.azimuth_ts.type_nilreason,
    navaids_points.azimuth_ts.truebearing_value,
    navaids_points.azimuth_ts.truebearing_nilreason,
    navaids_points.azimuth_ts.truebearingaccuracy_value,
    navaids_points.azimuth_ts.truebearingaccuracy_nilreason,
    navaids_points.azimuth_ts.magneticbearing_value,
    navaids_points.azimuth_ts.magneticbearing_nilreason,
    navaids_points.azimuth_ts.angleproportionalleft_value,
    navaids_points.azimuth_ts.angleproportionalleft_nilreason,
    navaids_points.azimuth_ts.angleproportionalright_value,
    navaids_points.azimuth_ts.angleproportionalright_nilreason,
    navaids_points.azimuth_ts.anglecoverleft_value,
    navaids_points.azimuth_ts.anglecoverleft_nilreason,
    navaids_points.azimuth_ts.anglecoverright_value,
    navaids_points.azimuth_ts.anglecoverright_nilreason,
    navaids_points.azimuth_ts.channel_value,
    navaids_points.azimuth_ts.channel_nilreason,
    navaids_points.azimuth_ts.interpretation,
    navaids_points.azimuth_ts.sequence_number,
    navaids_points.azimuth_ts.correction_number,
    navaids_points.azimuth_ts.valid_time_begin,
    navaids_points.azimuth_ts.valid_time_end,
    navaids_points.azimuth_ts.feature_lifetime_begin,
    navaids_points.azimuth_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;

CREATE MATERIALIZED VIEW navaids_points.glidepath_view AS
SELECT 
    (row_number() OVER ())::integer AS row,
    navaids_points.glidepath.id,
    navaids_points.glidepath.identifier,
    navaids_points.glidepath_ts.designator_value,
    navaids_points.glidepath_ts.designator_nilreason,
    navaids_points.glidepath_ts.name_value,
    navaids_points.glidepath_ts.name_nilreason,
    navaids_points.glidepath_ts.emissionclass_value,
    navaids_points.glidepath_ts.emissionclass_nilreason,
    navaids_points.glidepath_ts.mobile_value,
    navaids_points.glidepath_ts.mobile_nilreason,
    navaids_points.glidepath_ts.magneticvariation_value,
    navaids_points.glidepath_ts.magneticvariation_nilreason,
    navaids_points.glidepath_ts.magneticvariationaccuracy_value,
    navaids_points.glidepath_ts.magneticvariationaccuracy_nilreason,
    navaids_points.glidepath_ts.datemagneticvariation_value,
    navaids_points.glidepath_ts.datemagneticvariation_nilreason,
    navaids_points.glidepath_ts.flightchecked_value,
    navaids_points.glidepath_ts.flightchecked_nilreason,
    navaids_points.glidepath_ts.slope_value,
    navaids_points.glidepath_ts.slope_nilreason,
    navaids_points.glidepath_ts.angleaccuracy_value,
    navaids_points.glidepath_ts.angleaccuracy_nilreason,
    navaids_points.glidepath_ts.frequency_value,
    navaids_points.glidepath_ts.frequency_uom,
    navaids_points.glidepath_ts.frequency_nilreason,
    navaids_points.glidepath_ts.rdh_value,
    navaids_points.glidepath_ts.rdh_uom,
    navaids_points.glidepath_ts.rdh_nilreason,
    navaids_points.glidepath_ts.rdhaccuracy_value,
    navaids_points.glidepath_ts.rdhaccuracy_uom,
    navaids_points.glidepath_ts.rdhaccuracy_nilreason,
    navaids_points.glidepath_ts.interpretation,
    navaids_points.glidepath_ts.sequence_number,
    navaids_points.glidepath_ts.correction_number,
    navaids_points.glidepath_ts.valid_time_begin,
    navaids_points.glidepath_ts.valid_time_end,
    navaids_points.glidepath_ts.feature_lifetime_begin,
    navaids_points.glidepath_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.glidepath
INNER JOIN glidepath_timeslice 
    ON navaids_points.glidepath.id = glidepath_timeslice.glidepath_id
INNER JOIN navaids_points.glidepath_tsp
    ON glidepath_timeslice.glidepath_tsp_id = navaids_points.glidepath_tsp.id
INNER JOIN navaids_points.glidepath_ts
    ON navaids_points.glidepath_tsp.glidepathtimeslice_id = navaids_points.glidepath_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.glidepath_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN glidepath_ts_annotation
    ON navaids_points.glidepath_ts.id = glidepath_ts_annotation.glidepath_ts_id
LEFT JOIN notes.note_view
    ON glidepath_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN glidepath_ts_authority
    ON navaids_points.glidepath_ts.id = glidepath_ts_authority.glidepath_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON glidepath_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.glidepath.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.glidepath.id,
    navaids_points.glidepath.identifier,
    navaids_points.glidepath_ts.designator_value,
    navaids_points.glidepath_ts.designator_nilreason,
    navaids_points.glidepath_ts.name_value,
    navaids_points.glidepath_ts.name_nilreason,
    navaids_points.glidepath_ts.emissionclass_value,
    navaids_points.glidepath_ts.emissionclass_nilreason,
    navaids_points.glidepath_ts.mobile_value,
    navaids_points.glidepath_ts.mobile_nilreason,
    navaids_points.glidepath_ts.magneticvariation_value,
    navaids_points.glidepath_ts.magneticvariation_nilreason,
    navaids_points.glidepath_ts.magneticvariationaccuracy_value,
    navaids_points.glidepath_ts.magneticvariationaccuracy_nilreason,
    navaids_points.glidepath_ts.datemagneticvariation_value,
    navaids_points.glidepath_ts.datemagneticvariation_nilreason,
    navaids_points.glidepath_ts.flightchecked_value,
    navaids_points.glidepath_ts.flightchecked_nilreason,
    navaids_points.glidepath_ts.slope_value,
    navaids_points.glidepath_ts.slope_nilreason,
    navaids_points.glidepath_ts.angleaccuracy_value,
    navaids_points.glidepath_ts.angleaccuracy_nilreason,
    navaids_points.glidepath_ts.frequency_value,
    navaids_points.glidepath_ts.frequency_uom,
    navaids_points.glidepath_ts.frequency_nilreason,
    navaids_points.glidepath_ts.rdh_value,
    navaids_points.glidepath_ts.rdh_uom,
    navaids_points.glidepath_ts.rdh_nilreason,
    navaids_points.glidepath_ts.rdhaccuracy_value,
    navaids_points.glidepath_ts.rdhaccuracy_uom,
    navaids_points.glidepath_ts.rdhaccuracy_nilreason,
    navaids_points.glidepath_ts.interpretation,
    navaids_points.glidepath_ts.sequence_number,
    navaids_points.glidepath_ts.correction_number,
    navaids_points.glidepath_ts.valid_time_begin,
    navaids_points.glidepath_ts.valid_time_end,
    navaids_points.glidepath_ts.feature_lifetime_begin,
    navaids_points.glidepath_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;

CREATE MATERIALIZED VIEW navaids_points.localizer_view AS
SELECT       
    (row_number() OVER ())::integer AS row, 
    navaids_points.localizer.id,
    navaids_points.localizer.identifier,
    navaids_points.localizer_ts.designator_value,
    navaids_points.localizer_ts.designator_nilreason,
    navaids_points.localizer_ts.name_value,
    navaids_points.localizer_ts.name_nilreason,
    navaids_points.localizer_ts.emissionclass_value,
    navaids_points.localizer_ts.emissionclass_nilreason,
    navaids_points.localizer_ts.mobile_value,
    navaids_points.localizer_ts.mobile_nilreason,
    navaids_points.localizer_ts.magneticvariation_value,
    navaids_points.localizer_ts.magneticvariation_nilreason,
    navaids_points.localizer_ts.magneticvariationaccuracy_value,
    navaids_points.localizer_ts.magneticvariationaccuracy_nilreason,
    navaids_points.localizer_ts.datemagneticvariation_value,
    navaids_points.localizer_ts.datemagneticvariation_nilreason,
    navaids_points.localizer_ts.flightchecked_value,
    navaids_points.localizer_ts.flightchecked_nilreason,
    navaids_points.localizer_ts.magneticbearing_value,
    navaids_points.localizer_ts.magneticbearing_nilreason,
    navaids_points.localizer_ts.magneticbearingaccuracy_value,
    navaids_points.localizer_ts.magneticbearingaccuracy_nilreason,
    navaids_points.localizer_ts.truebearing_value,
    navaids_points.localizer_ts.truebearing_nilreason,
    navaids_points.localizer_ts.truebearingaccuracy_value,
    navaids_points.localizer_ts.truebearingaccuracy_nilreason,
    navaids_points.localizer_ts.declination_value,
    navaids_points.localizer_ts.declination_nilreason,
    navaids_points.localizer_ts.widthcourse_value,
    navaids_points.localizer_ts.widthcourse_nilreason,
    navaids_points.localizer_ts.widthcourseaccuracy_value,
    navaids_points.localizer_ts.widthcourseaccuracy_nilreason,
    navaids_points.localizer_ts.backcourseusable_value,
    navaids_points.localizer_ts.backcourseusable_nilreason,
    navaids_points.localizer_ts.frequency_value,
    navaids_points.localizer_ts.frequency_uom,
    navaids_points.localizer_ts.frequency_nilreason,
    navaids_points.localizer_ts.interpretation,
    navaids_points.localizer_ts.sequence_number,
    navaids_points.localizer_ts.correction_number,
    navaids_points.localizer_ts.valid_time_begin,
    navaids_points.localizer_ts.valid_time_end,
    navaids_points.localizer_ts.feature_lifetime_begin,
    navaids_points.localizer_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.localizer
INNER JOIN localizer_timeslice
    ON navaids_points.localizer.id = localizer_timeslice.localizer_id
INNER JOIN navaids_points.localizer_tsp
    ON localizer_timeslice.localizer_tsp_id = navaids_points.localizer_tsp.id
INNER JOIN navaids_points.localizer_ts
    ON navaids_points.localizer_tsp.localizertimeslice_id = navaids_points.localizer_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.localizer_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN localizer_ts_annotation
    ON navaids_points.localizer_ts.id = localizer_ts_annotation.localizer_ts_id
LEFT JOIN notes.note_view
    ON localizer_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN localizer_ts_authority
    ON navaids_points.localizer_ts.id = localizer_ts_authority.localizer_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON localizer_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.localizer.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.localizer.id,
    navaids_points.localizer.identifier,
    navaids_points.localizer_ts.designator_value,
    navaids_points.localizer_ts.designator_nilreason,
    navaids_points.localizer_ts.name_value,
    navaids_points.localizer_ts.name_nilreason,
    navaids_points.localizer_ts.emissionclass_value,
    navaids_points.localizer_ts.emissionclass_nilreason,
    navaids_points.localizer_ts.mobile_value,
    navaids_points.localizer_ts.mobile_nilreason,
    navaids_points.localizer_ts.magneticvariation_value,
    navaids_points.localizer_ts.magneticvariation_nilreason,
    navaids_points.localizer_ts.magneticvariationaccuracy_value,
    navaids_points.localizer_ts.magneticvariationaccuracy_nilreason,
    navaids_points.localizer_ts.datemagneticvariation_value,
    navaids_points.localizer_ts.datemagneticvariation_nilreason,
    navaids_points.localizer_ts.flightchecked_value,
    navaids_points.localizer_ts.flightchecked_nilreason,
    navaids_points.localizer_ts.magneticbearing_value,
    navaids_points.localizer_ts.magneticbearing_nilreason,
    navaids_points.localizer_ts.magneticbearingaccuracy_value,
    navaids_points.localizer_ts.magneticbearingaccuracy_nilreason,
    navaids_points.localizer_ts.truebearing_value,
    navaids_points.localizer_ts.truebearing_nilreason,
    navaids_points.localizer_ts.truebearingaccuracy_value,
    navaids_points.localizer_ts.truebearingaccuracy_nilreason,
    navaids_points.localizer_ts.declination_value,
    navaids_points.localizer_ts.declination_nilreason,
    navaids_points.localizer_ts.widthcourse_value,
    navaids_points.localizer_ts.widthcourse_nilreason,
    navaids_points.localizer_ts.widthcourseaccuracy_value,
    navaids_points.localizer_ts.widthcourseaccuracy_nilreason,
    navaids_points.localizer_ts.backcourseusable_value,
    navaids_points.localizer_ts.backcourseusable_nilreason,
    navaids_points.localizer_ts.frequency_value,
    navaids_points.localizer_ts.frequency_uom,
    navaids_points.localizer_ts.frequency_nilreason,
    navaids_points.localizer_ts.interpretation,
    navaids_points.localizer_ts.sequence_number,
    navaids_points.localizer_ts.correction_number,
    navaids_points.localizer_ts.valid_time_begin,
    navaids_points.localizer_ts.valid_time_end,
    navaids_points.localizer_ts.feature_lifetime_begin,
    navaids_points.localizer_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;


CREATE MATERIALIZED VIEW navaids_points.tacan_view AS
SELECT
    (row_number() OVER ())::integer AS row,
    navaids_points.tacan.id,
    navaids_points.tacan.identifier,
    navaids_points.tacan_ts.designator_value,
    navaids_points.tacan_ts.designator_nilreason,
    navaids_points.tacan_ts.name_value,
    navaids_points.tacan_ts.name_nilreason,
    navaids_points.tacan_ts.emissionclass_value,
    navaids_points.tacan_ts.emissionclass_nilreason,
    navaids_points.tacan_ts.mobile_value,
    navaids_points.tacan_ts.mobile_nilreason,
    navaids_points.tacan_ts.magneticvariation_value,
    navaids_points.tacan_ts.magneticvariation_nilreason,
    navaids_points.tacan_ts.magneticvariationaccuracy_value,
    navaids_points.tacan_ts.magneticvariationaccuracy_nilreason,
    navaids_points.tacan_ts.datemagneticvariation_value,
    navaids_points.tacan_ts.datemagneticvariation_nilreason,
    navaids_points.tacan_ts.flightchecked_value,
    navaids_points.tacan_ts.flightchecked_nilreason,
    navaids_points.tacan_ts.channel_value,
    navaids_points.tacan_ts.channel_nilreason,
    navaids_points.tacan_ts.declination_value,
    navaids_points.tacan_ts.declination_nilreason,
    navaids_points.tacan_ts.interpretation,
    navaids_points.tacan_ts.sequence_number,
    navaids_points.tacan_ts.correction_number,
    navaids_points.tacan_ts.valid_time_begin,
    navaids_points.tacan_ts.valid_time_end,
    navaids_points.tacan_ts.feature_lifetime_begin,
    navaids_points.tacan_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.tacan
INNER JOIN tacan_timeslice
    ON navaids_points.tacan.id = tacan_timeslice.tacan_id
INNER JOIN navaids_points.tacan_tsp
    ON tacan_timeslice.tacan_tsp_id = navaids_points.tacan_tsp.id 
INNER JOIN navaids_points.tacan_ts
    ON navaids_points.tacan_tsp.tacantimeslice_id = navaids_points.tacan_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.tacan_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN tacan_ts_annotation
    ON navaids_points.tacan_ts.id = tacan_ts_annotation.tacan_ts_id
LEFT JOIN notes.note_view
    ON tacan_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN tacan_ts_authority
    ON navaids_points.tacan_ts.id = tacan_ts_authority.tacan_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON tacan_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.tacan.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.tacan.id,
    navaids_points.tacan.identifier,
    navaids_points.tacan_ts.designator_value,
    navaids_points.tacan_ts.designator_nilreason,
    navaids_points.tacan_ts.name_value,
    navaids_points.tacan_ts.name_nilreason,
    navaids_points.tacan_ts.emissionclass_value,
    navaids_points.tacan_ts.emissionclass_nilreason,
    navaids_points.tacan_ts.mobile_value,
    navaids_points.tacan_ts.mobile_nilreason,
    navaids_points.tacan_ts.magneticvariation_value,
    navaids_points.tacan_ts.magneticvariation_nilreason,
    navaids_points.tacan_ts.magneticvariationaccuracy_value,
    navaids_points.tacan_ts.magneticvariationaccuracy_nilreason,
    navaids_points.tacan_ts.datemagneticvariation_value,
    navaids_points.tacan_ts.datemagneticvariation_nilreason,
    navaids_points.tacan_ts.flightchecked_value,
    navaids_points.tacan_ts.flightchecked_nilreason,
    navaids_points.tacan_ts.channel_value,
    navaids_points.tacan_ts.channel_nilreason,
    navaids_points.tacan_ts.declination_value,
    navaids_points.tacan_ts.declination_nilreason,
    navaids_points.tacan_ts.interpretation,
    navaids_points.tacan_ts.sequence_number,
    navaids_points.tacan_ts.correction_number,
    navaids_points.tacan_ts.valid_time_begin,
    navaids_points.tacan_ts.valid_time_end,
    navaids_points.tacan_ts.feature_lifetime_begin,
    navaids_points.tacan_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;


CREATE MATERIALIZED VIEW navaids_points.ndb_view AS
SELECT 
    (row_number() OVER ())::integer AS row,
    navaids_points.ndb.id,
    navaids_points.ndb.identifier,
    navaids_points.ndb_ts.designator_value,
    navaids_points.ndb_ts.designator_nilreason,
    navaids_points.ndb_ts.name_value,
    navaids_points.ndb_ts.name_nilreason,
    navaids_points.ndb_ts.emissionclass_value,
    navaids_points.ndb_ts.emissionclass_nilreason,
    navaids_points.ndb_ts.mobile_value,
    navaids_points.ndb_ts.mobile_nilreason,
    navaids_points.ndb_ts.magneticvariation_value,
    navaids_points.ndb_ts.magneticvariation_nilreason,
    navaids_points.ndb_ts.magneticvariationaccuracy_value,
    navaids_points.ndb_ts.magneticvariationaccuracy_nilreason,
    navaids_points.ndb_ts.datemagneticvariation_value,
    navaids_points.ndb_ts.datemagneticvariation_nilreason,
    navaids_points.ndb_ts.flightchecked_value,
    navaids_points.ndb_ts.flightchecked_nilreason,
    navaids_points.ndb_ts.class_value,
    navaids_points.ndb_ts.class_nilreason,
    navaids_points.ndb_ts.emissionband_value,
    navaids_points.ndb_ts.emissionband_nilreason,
    navaids_points.ndb_ts.frequency_value,
    navaids_points.ndb_ts.frequency_uom,
    navaids_points.ndb_ts.frequency_nilreason,
    navaids_points.ndb_ts.interpretation,
    navaids_points.ndb_ts.sequence_number,
    navaids_points.ndb_ts.correction_number,
    navaids_points.ndb_ts.valid_time_begin,
    navaids_points.ndb_ts.valid_time_end,
    navaids_points.ndb_ts.feature_lifetime_begin,
    navaids_points.ndb_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.ndb
INNER JOIN ndb_timeslice
    ON navaids_points.ndb.id = ndb_timeslice.ndb_id
INNER JOIN navaids_points.ndb_tsp
    ON ndb_timeslice.ndb_tsp_id = navaids_points.ndb_tsp.id
INNER JOIN navaids_points.ndb_ts
    ON navaids_points.ndb_tsp.ndbtimeslice_id = navaids_points.ndb_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.ndb_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN ndb_ts_annotation
    ON navaids_points.ndb_ts.id = ndb_ts_annotation.ndb_ts_id
LEFT JOIN notes.note_view
    ON ndb_ts_annotation.note_pt_id  = notes.note_view.id
LEFT JOIN ndb_ts_authority
    ON navaids_points.ndb_ts.id = ndb_ts_authority.ndb_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON ndb_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.ndb.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.ndb.id,
    navaids_points.ndb.identifier,
    navaids_points.ndb_ts.designator_value,
    navaids_points.ndb_ts.designator_nilreason,
    navaids_points.ndb_ts.name_value,
    navaids_points.ndb_ts.name_nilreason,
    navaids_points.ndb_ts.emissionclass_value,
    navaids_points.ndb_ts.emissionclass_nilreason,
    navaids_points.ndb_ts.mobile_value,
    navaids_points.ndb_ts.mobile_nilreason,
    navaids_points.ndb_ts.magneticvariation_value,
    navaids_points.ndb_ts.magneticvariation_nilreason,
    navaids_points.ndb_ts.magneticvariationaccuracy_value,
    navaids_points.ndb_ts.magneticvariationaccuracy_nilreason,
    navaids_points.ndb_ts.datemagneticvariation_value,
    navaids_points.ndb_ts.datemagneticvariation_nilreason,
    navaids_points.ndb_ts.flightchecked_value,
    navaids_points.ndb_ts.flightchecked_nilreason,
    navaids_points.ndb_ts.class_value,
    navaids_points.ndb_ts.class_nilreason,
    navaids_points.ndb_ts.emissionband_value,
    navaids_points.ndb_ts.emissionband_nilreason,
    navaids_points.ndb_ts.frequency_value,
    navaids_points.ndb_ts.frequency_uom,
    navaids_points.ndb_ts.frequency_nilreason,
    navaids_points.ndb_ts.interpretation,
    navaids_points.ndb_ts.sequence_number,
    navaids_points.ndb_ts.correction_number,
    navaids_points.ndb_ts.valid_time_begin,
    navaids_points.ndb_ts.valid_time_end,
    navaids_points.ndb_ts.feature_lifetime_begin,
	navaids_points.ndb_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;


CREATE MATERIALIZED VIEW navaids_points.vor_view AS
SELECT
    (row_number() OVER ())::integer AS row,
    navaids_points.vor.id,
    navaids_points.vor.identifier,
    navaids_points.vor_ts.designator_value,
    navaids_points.vor_ts.designator_nilreason,
    navaids_points.vor_ts.name_value,
    navaids_points.vor_ts.name_nilreason,
    navaids_points.vor_ts.emissionclass_value,
    navaids_points.vor_ts.emissionclass_nilreason,
    navaids_points.vor_ts.mobile_value,
    navaids_points.vor_ts.mobile_nilreason,
    navaids_points.vor_ts.magneticvariation_value,
    navaids_points.vor_ts.magneticvariation_nilreason,
    navaids_points.vor_ts.magneticvariationaccuracy_value,
    navaids_points.vor_ts.magneticvariationaccuracy_nilreason,
    navaids_points.vor_ts.datemagneticvariation_value,
    navaids_points.vor_ts.datemagneticvariation_nilreason,
    navaids_points.vor_ts.flightchecked_value,
    navaids_points.vor_ts.flightchecked_nilreason,
    navaids_points.vor_ts.type_value,
    navaids_points.vor_ts.type_nilreason,
    navaids_points.vor_ts.zerobearingdirection_value,
    navaids_points.vor_ts.zerobearingdirection_nilreason,
    navaids_points.vor_ts.declination_value,
    navaids_points.vor_ts.declination_nilreason,
    navaids_points.vor_ts.frequency_value,
    navaids_points.vor_ts.frequency_uom,
    navaids_points.vor_ts.frequency_nilreason,
    navaids_points.vor_ts.interpretation,
    navaids_points.vor_ts.sequence_number,
    navaids_points.vor_ts.correction_number,
    navaids_points.vor_ts.valid_time_begin,
    navaids_points.vor_ts.valid_time_end,
    navaids_points.vor_ts.feature_lifetime_begin,
    navaids_points.vor_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.vor
INNER JOIN vor_timeslice
    ON navaids_points.vor.id = vor_timeslice.vor_id
INNER JOIN navaids_points.vor_tsp
    ON vor_timeslice.vor_tsp_id = navaids_points.vor_tsp.id
INNER JOIN navaids_points.vor_ts
    ON navaids_points.vor_tsp.vortimeslice_id = navaids_points.vor_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.vor_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN vor_ts_authority
    ON navaids_points.vor_ts.id = vor_ts_authority.vor_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON vor_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN vor_ts_annotation
    ON navaids_points.vor_ts.id = vor_ts_annotation.vor_ts_id 
LEFT JOIN notes.note_view
    ON vor_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.vor.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
GROUP BY
    navaids_points.vor.id,
    navaids_points.vor.identifier,
    navaids_points.vor_ts.designator_value,
    navaids_points.vor_ts.designator_nilreason,
    navaids_points.vor_ts.name_value,
    navaids_points.vor_ts.name_nilreason,
    navaids_points.vor_ts.emissionclass_value,
    navaids_points.vor_ts.emissionclass_nilreason,
    navaids_points.vor_ts.mobile_value,
    navaids_points.vor_ts.mobile_nilreason,
    navaids_points.vor_ts.magneticvariation_value,
    navaids_points.vor_ts.magneticvariation_nilreason,
    navaids_points.vor_ts.magneticvariationaccuracy_value,
    navaids_points.vor_ts.magneticvariationaccuracy_nilreason,
    navaids_points.vor_ts.datemagneticvariation_value,
    navaids_points.vor_ts.datemagneticvariation_nilreason,
    navaids_points.vor_ts.flightchecked_value,
    navaids_points.vor_ts.flightchecked_nilreason,
    navaids_points.vor_ts.type_value,
    navaids_points.vor_ts.type_nilreason,
    navaids_points.vor_ts.zerobearingdirection_value,
    navaids_points.vor_ts.zerobearingdirection_nilreason,
    navaids_points.vor_ts.declination_value,
    navaids_points.vor_ts.declination_nilreason,
    navaids_points.vor_ts.frequency_value,
    navaids_points.vor_ts.frequency_uom,
    navaids_points.vor_ts.frequency_nilreason,
    navaids_points.vor_ts.interpretation,
    navaids_points.vor_ts.sequence_number,
    navaids_points.vor_ts.correction_number,
    navaids_points.vor_ts.valid_time_begin,
    navaids_points.vor_ts.valid_time_end,
    navaids_points.vor_ts.feature_lifetime_begin,
    navaids_points.vor_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;


CREATE MATERIALIZED VIEW navaids_points.dme_view AS
SELECT
    (row_number() OVER ())::integer AS row,
    navaids_points.dme.id,
    navaids_points.dme.identifier,
    COALESCE(navaids_points.dme_ts.type_value, '(' || navaids_points.dme_ts.type_nilreason || ')') AS type,
    -- navaids_points.dme_ts.type_value,
    -- navaids_points.dme_ts.type_nilreason,
    COALESCE(navaids_points.dme_ts.channel_value, '(' || navaids_points.dme_ts.channel_nilreason || ')') AS channel,
    -- navaids_points.dme_ts.channel_value,
    -- navaids_points.dme_ts.channel_nilreason,
    COALESCE(navaids_points.dme_ts.ghostfrequency_value || ' ' || navaids_points.dme_ts.ghostfrequency_uom, '(' || navaids_points.dme_ts.ghostfrequency_nilreason || ')') AS ghostfrequency,
    -- navaids_points.dme_ts.ghostfrequency_value,
    -- navaids_points.dme_ts.ghostfrequency_uom,
    -- navaids_points.dme_ts.ghostfrequency_nilreason,
    COALESCE(navaids_points.dme_ts.displace_value || ' ' || navaids_points.dme_ts.displace_uom, '(' || navaids_points.dme_ts.displace_nilreason || ')') AS displace,
    -- navaids_points.dme_ts.displace_value,
    -- navaids_points.dme_ts.displace_uom,
    -- navaids_points.dme_ts.displace_nilreason,
    COALESCE(navaids_points.dme_ts.designator_value, '(' || navaids_points.dme_ts.designator_nilreason || ')') AS designator,
    -- navaids_points.dme_ts.designator_value,
    -- navaids_points.dme_ts.designator_nilreason,
    COALESCE(navaids_points.dme_ts.name_value, '(' || navaids_points.dme_ts.name_nilreason || ')') AS name,
    -- navaids_points.dme_ts.name_value,
    -- navaids_points.dme_ts.name_nilreason,
    COALESCE(navaids_points.dme_ts.emissionclass_value, '(' || navaids_points.dme_ts.emissionclass_nilreason || ')') AS emissionclass,
    -- navaids_points.dme_ts.emissionclass_value,
    -- navaids_points.dme_ts.emissionclass_nilreason,
    COALESCE(navaids_points.dme_ts.mobile_value, '(' || navaids_points.dme_ts.mobile_nilreason || ')') AS mobile,
    -- navaids_points.dme_ts.mobile_value,
    -- navaids_points.dme_ts.mobile_nilreason,
    COALESCE(navaids_points.dme_ts.magneticvariation_value, '(' || navaids_points.dme_ts.magneticvariation_nilreason || ')') AS magneticvariation,
    -- navaids_points.dme_ts.magneticvariation_value,
    -- navaids_points.dme_ts.magneticvariation_nilreason,
    COALESCE(navaids_points.dme_ts.magneticvariationaccuracy_value, '(' || navaids_points.dme_ts.magneticvariationaccuracy_nilreason || ')') AS magneticvariationaccuracy,
    -- navaids_points.dme_ts.magneticvariationaccuracy_value,
    -- navaids_points.dme_ts.magneticvariationaccuracy_nilreason,
    COALESCE(navaids_points.dme_ts.datemagneticvariation_value, '(' || navaids_points.dme_ts.datemagneticvariation_nilreason || ')') AS datemagneticvariation,
    -- navaids_points.dme_ts.datemagneticvariation_value,
    -- navaids_points.dme_ts.datemagneticvariation_nilreason,
    COALESCE(navaids_points.dme_ts.flightchecked_value, '(' || navaids_points.dme_ts.flightchecked_nilreason || ')') AS flightchecked,
    -- navaids_points.dme_ts.flightchecked_value,
    -- navaids_points.dme_ts.flightchecked_nilreason,
    navaids_points.dme_ts.interpretation,
    navaids_points.dme_ts.sequence_number,
    navaids_points.dme_ts.correction_number,
    navaids_points.dme_ts.valid_time_begin,
    navaids_points.dme_ts.valid_time_end,
    navaids_points.dme_ts.feature_lifetime_begin,
    navaids_points.dme_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom AS location,
    '[]'::jsonb AS monitoring,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS annotation,
    COALESCE(jsonb_agg(navaids_points.authorityfornavaidequipment_view.authorityfornavaidequipment), '[]'::jsonb) AS authority,
    '[]'::jsonb AS availability,
    -- COALESCE(jsonb_agg(shared.radiofrequencyarea_view.*), '[]'::jsonb) AS radiofrequencyarea
FROM navaids_points.dme
INNER JOIN dme_timeslice
    ON dme.id = dme_timeslice.dme_id
INNER JOIN navaids_points.dme_tsp
    ON dme_timeslice.dme_tsp_id = navaids_points.dme_tsp.id
INNER JOIN navaids_points.dme_ts
    ON dme_tsp.dmetimeslice_id = navaids_points.dme_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.dme_ts.location_id = geometry.elevated_point_view.id
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
LEFT JOIN dme_ts_annotation
    ON navaids_points.dme_ts.id = dme_ts_annotation.dme_ts_id
LEFT JOIN notes.note_view
    ON dme_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN dme_ts_authority
    ON navaids_points.dme_ts.id = dme_ts_authority.dme_ts_id
LEFT JOIN navaids_points.authorityfornavaidequipment_view
    ON dme_ts_authority.authorityfornavaidequipment_pt_id = navaids_points.authorityfornavaidequipment_view.id
LEFT JOIN shared.radiofrequencyarea_view
    ON navaids_points.dme.identifier = shared.radiofrequencyarea_view.equipmentNavaidEquipment
GROUP BY
    navaids_points.dme.id,
    navaids_points.dme.identifier,
    navaids_points.dme_tsp.id,
    navaids_points.dme_ts.designator_value,
    navaids_points.dme_ts.designator_nilreason,
    navaids_points.dme_ts.name_value,
    navaids_points.dme_ts.name_nilreason,
    navaids_points.dme_ts.emissionclass_value,
    navaids_points.dme_ts.emissionclass_nilreason,
    navaids_points.dme_ts.mobile_value,
    navaids_points.dme_ts.mobile_nilreason,
    navaids_points.dme_ts.magneticvariation_value,
    navaids_points.dme_ts.magneticvariation_nilreason,
    navaids_points.dme_ts.magneticvariationaccuracy_value,
    navaids_points.dme_ts.magneticvariationaccuracy_nilreason,
    navaids_points.dme_ts.datemagneticvariation_value,
    navaids_points.dme_ts.datemagneticvariation_nilreason,
    navaids_points.dme_ts.flightchecked_value,
    navaids_points.dme_ts.flightchecked_nilreason,
    navaids_points.dme_ts.type_value,
    navaids_points.dme_ts.type_nilreason,
    navaids_points.dme_ts.channel_value,
    navaids_points.dme_ts.channel_nilreason,
    navaids_points.dme_ts.ghostfrequency_value,
    navaids_points.dme_ts.ghostfrequency_uom,
    navaids_points.dme_ts.ghostfrequency_nilreason,
    navaids_points.dme_ts.displace_value,
    navaids_points.dme_ts.displace_uom,
    navaids_points.dme_ts.displace_nilreason,
    navaids_points.dme_ts.xml_id,
    navaids_points.dme_ts.interpretation,
    navaids_points.dme_ts.sequence_number,
    navaids_points.dme_ts.correction_number,
    navaids_points.dme_ts.valid_time_begin,
    navaids_points.dme_ts.valid_time_end,
    navaids_points.dme_ts.feature_lifetime_begin,
    navaids_points.dme_ts.feature_lifetime_end,
    geometry.elevated_point_view.geom;


CREATE OR REPLACE VIEW navaids_points.navaidcomponent_view AS
SELECT 
navaids_points.navaidcomponent_pt.id,
	ST_UNION(
	    COALESCE(navaids_points.dme_view.geom, 
	             navaids_points.vor_view.geom, 
	             navaids_points.ndb_view.geom, 
	             navaids_points.tacan_view.geom,  
	             navaids_points.localizer_view.geom, 
	             navaids_points.glidepath_view.geom, 
	             navaids_points.azimuth_view.geom,
	             navaids_points.directionfinder_view.geom,
	             navaids_points.elevation_view.geom,
	             navaids_points.markerbeacon_view.geom)
	) AS geom,
	jsonb_build_object(
	   'xml_id', navaids_points.navaidcomponent.xml_id,
       'collocationgroup_value', navaids_points.navaidcomponent.collocationgroup_value,
       'collocationgroup_nilreason', navaids_points.navaidcomponent.collocationgroup_nilreason,
       'markerposition_value', navaids_points.navaidcomponent.markerposition_value,
       'markerposition_nilreason', navaids_points.navaidcomponent.markerposition_nilreason,
       'providesnavigablelocation_value', navaids_points.navaidcomponent.providesnavigablelocation_value,
       'providesnavigablelocation_nilreason', navaids_points.navaidcomponent.providesnavigablelocation_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb),
       'theNavaidEquipment', jsonb_strip_nulls(jsonb_build_object(
            'dme', navaids_points.dme_view.*,
            'vor', navaids_points.vor_view.*,
            'ndb', navaids_points.ndb_view.*,
            'tacan', navaids_points.tacan_view.*,
            'localizer', navaids_points.localizer_view.*,
            'glidepath', navaids_points.glidepath_view.*,
            'azimuth', navaids_points.azimuth_view.*,
            'directionfinder', navaids_points.directionfinder_view.*,
            'elevation', navaids_points.elevation_view.*,
            'markerbeacon', navaids_points.markerbeacon_view.*
        ))
    ) AS navaidcomponent
FROM 
navaids_points.navaidcomponent_pt
INNER JOIN navaids_points.navaidcomponent
	ON navaids_points.navaidcomponent_pt.navaidcomponent_id = navaids_points.navaidcomponent.id
LEFT JOIN navaidcomponent_annotation
	ON navaids_points.navaidcomponent.id = navaidcomponent_annotation.navaidcomponent_id
LEFT JOIN notes.note_view
	ON navaidcomponent_annotation.note_pt_id = notes.note_view.id
LEFT JOIN navaids_points.navaidequipment_pt
	ON navaids_points.navaidcomponent.thenavaidequipment_id = navaids_points.navaidequipment_pt.id 
LEFT JOIN navaids_points.dme_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.dme_view.identifier
LEFT JOIN navaids_points.vor_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.vor_view.identifier
LEFT JOIN navaids_points.ndb_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.ndb_view.identifier
LEFT JOIN navaids_points.tacan_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.tacan_view.identifier
LEFT JOIN navaids_points.localizer_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.localizer_view.identifier
LEFT JOIN navaids_points.glidepath_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.glidepath_view.identifier
LEFT JOIN navaids_points.azimuth_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.azimuth_view.identifier
LEFT JOIN navaids_points.directionfinder_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.directionfinder_view.identifier
LEFT JOIN navaids_points.elevation_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.elevation_view.identifier
LEFT JOIN navaids_points.markerbeacon_view
    ON SUBSTRING(navaids_points.navaidequipment_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = navaids_points.markerbeacon_view.identifier
GROUP BY 
navaids_points.navaidcomponent_pt.id,
navaids_points.navaidcomponent.xml_id,
navaids_points.navaidcomponent.collocationgroup_value,
navaids_points.navaidcomponent.collocationgroup_nilreason,
navaids_points.navaidcomponent.markerposition_value,
navaids_points.navaidcomponent.markerposition_nilreason,
navaids_points.navaidcomponent.providesnavigablelocation_value,
navaids_points.navaidcomponent.providesnavigablelocation_nilreason,
navaids_points.dme_view.*,
navaids_points.vor_view.*,
navaids_points.ndb_view.*,
navaids_points.tacan_view.*,
navaids_points.localizer_view.*,
navaids_points.glidepath_view.*,
navaids_points.azimuth_view.*,
navaids_points.directionfinder_view.*,
navaids_points.elevation_view.*,
navaids_points.markerbeacon_view.*;


CREATE MATERIALIZED VIEW navaids_points.navaid_view AS
SELECT
    (row_number() OVER ())::integer AS row,
    navaids_points.navaid.id, 
    navaids_points.navaid.identifier,
    navaids_points.navaid_ts.type_value,
    navaids_points.navaid_ts.type_nilreason,
    navaids_points.navaid_ts.designator_value,
    navaids_points.navaid_ts.designator_nilreason,
    navaids_points.navaid_ts.name_value,
    navaids_points.navaid_ts.name_nilreason,
    navaids_points.navaid_ts.flightchecked_value,
    navaids_points.navaid_ts.flightchecked_nilreason,
    navaids_points.navaid_ts.purpose_value,
    navaids_points.navaid_ts.purpose_nilreason,
    navaids_points.navaid_ts.signalperformance_value,
    navaids_points.navaid_ts.signalperformance_nilreason,
    navaids_points.navaid_ts.coursequality_value,
    navaids_points.navaid_ts.coursequality_nilreason,
    navaids_points.navaid_ts.integritylevel_value,
    navaids_points.navaid_ts.integritylevel_nilreason,
    navaids_points.navaid_ts.interpretation,
    navaids_points.navaid_ts.sequence_number,
    navaids_points.navaid_ts.correction_number,
    navaids_points.navaid_ts.valid_time_begin,
    navaids_points.navaid_ts.valid_time_end,
    navaids_points.navaid_ts.feature_lifetime_begin,
    navaids_points.navaid_ts.feature_lifetime_end,
    ST_UNION(
        ST_UNION(navaids_points.navaidcomponent_view.geom),
        geometry.elevated_point_view.geom
        ) AS geom,
    COALESCE(jsonb_agg(navaids_points.navaidcomponent_view.navaidcomponent), '[]'::jsonb) AS navaidcomponent,
    COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note
FROM navaids_points.navaid
INNER JOIN navaid_timeslice
    ON navaids_points.navaid.id = navaid_timeslice.navaid_id
INNER JOIN navaids_points.navaid_tsp
    ON navaid_timeslice.navaid_tsp_id = navaids_points.navaid_tsp.id
INNER JOIN navaids_points.navaid_ts
    ON navaid_tsp.navaidtimeslice_id = navaids_points.navaid_ts.id
-- LEFT JOIN navaid_ts_touchdownliftoff
LEFT JOIN navaid_ts_navaidequipment
    ON navaids_points.navaid_ts.id = navaid_ts_navaidequipment.navaid_ts_id
LEFT JOIN navaids_points.navaidcomponent_view
    ON navaid_ts_navaidequipment.navaidcomponent_pt_id = navaids_points.navaidcomponent_view.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.navaid_ts.location_id = geometry.elevated_point_view.id
LEFT JOIN navaid_ts_annotation
    ON navaids_points.navaid_ts.id = navaid_ts_annotation.navaid_ts_id
LEFT JOIN notes.note_view
    ON navaid_ts_annotation.note_pt_id = notes.note_view.id
GROUP BY 
	navaids_points.navaid.id, 
	navaids_points.navaid.identifier,
	navaids_points.navaid_ts.type_value,
	navaids_points.navaid_ts.type_nilreason,
	navaids_points.navaid_ts.designator_value,
	navaids_points.navaid_ts.designator_nilreason,
	navaids_points.navaid_ts.name_value,
	navaids_points.navaid_ts.name_nilreason,
	navaids_points.navaid_ts.flightchecked_value,
	navaids_points.navaid_ts.flightchecked_nilreason,
	navaids_points.navaid_ts.purpose_value,
	navaids_points.navaid_ts.purpose_nilreason,
	navaids_points.navaid_ts.signalperformance_value,
	navaids_points.navaid_ts.signalperformance_nilreason,
	navaids_points.navaid_ts.coursequality_value,
	navaids_points.navaid_ts.coursequality_nilreason,
	navaids_points.navaid_ts.integritylevel_value,
	navaids_points.navaid_ts.integritylevel_nilreason,
	navaids_points.navaid_ts.interpretation,
	navaids_points.navaid_ts.sequence_number,
	navaids_points.navaid_ts.correction_number,
	navaids_points.navaid_ts.valid_time_begin,
	navaids_points.navaid_ts.valid_time_end,
	navaids_points.navaid_ts.feature_lifetime_begin,
	navaids_points.navaid_ts.feature_lifetime_end,
	geometry.elevated_point_view.geom
