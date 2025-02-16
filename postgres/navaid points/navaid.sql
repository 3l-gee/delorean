CREAT OR REPLACE VIEW navaids_points.dme_view AS
SELECT
navaids_points.dme.id,
navaids_points.dme.identifier,
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
navaids_points.dme_ts.interpretation,
navaids_points.dme_ts.sequence_number,
navaids_points.dme_ts.correction_number,
navaids_points.dme_ts.valid_time_begin,
navaids_points.dme_ts.valid_time_end,
navaids_points.dme_ts.feature_lifetime_begin,
navaids_points.dme_ts.feature_lifetime_end,
geometry.elevated_point_view.geom,
COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note
FROM navaids_points.dme
INNER JOIN dme_timeslice
    ON dme.id = dme_timeslice.dme_id
INNER JOIN navaids_points.dme_tsp
    ON dme_timeslice.dme_tsp_id = navaids_points.dme_tsp.id
INNER JOIN navaids_points.dme_ts
    ON dme_tsp.dmetimeslice_id = navaids_points.dme_ts.id
LEFT JOIN geometry.elevated_point_view
    ON navaids_points.dme_ts.location_id = geometry.elevated_point_view.id
-- LEFT JOIN dme_ts_authority
-- LEFT JOIN dme_ts_monitoring
-- LEFT JOIN dme_ts_availability
LEFT JOIN dme_ts_annotation
    ON navaids_points.dme_ts.id = dme_ts_annotation.dme_ts_id
LEFT JOIN notes.note_view
    ON dme_ts_annotation.note_pt_id = notes.note_view.id
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
geometry.elevated_point_view.geom


SELECT 
navaids_points.navaidcomponent_pt.id,
	jsonb_build_object(
	   'xml_id', navaids_points.navaidcomponent.xml_id,
       'collocationgroup_value', navaids_points.navaidcomponent.collocationgroup_value,
       'collocationgroup_nilreason', navaids_points.navaidcomponent.collocationgroup_nilreason,
       'markerposition_value', navaids_points.navaidcomponent.markerposition_value,
       'markerposition_nilreason', navaids_points.navaidcomponent.markerposition_nilreason,
       'providesnavigablelocation_value', navaids_points.navaidcomponent.providesnavigablelocation_value,
       'providesnavigablelocation_nilreason', navaids_points.navaidcomponent.providesnavigablelocation_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb),
        'href', navaids_points.navaidequipment_pt.href
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
-- ON SUBSTRING(airport_heliport.airportheliport_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = airport_heliport.airportheliport_view.identifier
GROUP BY 
navaids_points.navaidcomponent_pt.id,
navaids_points.navaidcomponent.xml_id,
navaids_points.navaidcomponent.collocationgroup_value,
navaids_points.navaidcomponent.collocationgroup_nilreason,
navaids_points.navaidcomponent.markerposition_value,
navaids_points.navaidcomponent.markerposition_nilreason,
navaids_points.navaidcomponent.providesnavigablelocation_value,
navaids_points.navaidcomponent.providesnavigablelocation_nilreason,
navaids_points.navaidequipment_pt.href




SELECT
navaids_points.navaid.id, 
navaids_points.navaid.identifier,
navaids_points.navaid_pt.nilReason,
navaids_points.navaid_pt.href,
navaids_points.navaid_tsp.id,
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
navaids_points.navaid_ts.xml_id,
navaids_points.navaid_ts.interpretation,
navaids_points.navaid_ts.sequence_number,
navaids_points.navaid_ts.correction_number,
navaids_points.navaid_ts.valid_time_begin,
navaids_points.navaid_ts.valid_time_end,
navaids_points.navaid_ts.feature_lifetime_begin,
navaids_points.navaid_ts.feature_lifetime_end,
navaids_points.navaid.id,
navaids_points.navaid.identifier,
navaids_points.navaid.identifier_code_space,
navaids_points.navaid.xml_id
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

