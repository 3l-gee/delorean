CREATE OR REPLACE VIEW airport_heliport.city_view AS
SELECT 
airport_heliport.city_pt.id,
	jsonb_build_object(
		'xml_id', airport_heliport.city.xml_id,
		'name_value', airport_heliport.city.name_value,
		'name_nilreason', airport_heliport.city.name_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
	) AS city
FROM airport_heliport.city_pt
INNER JOIN airport_heliport.city
ON airport_heliport.city_pt.city_id = airport_heliport.city.id
LEFT JOIN city_annotation
ON airport_heliport.city.id = city_annotation.city_id
LEFT JOIN notes.note_view
ON city_annotation.note_pt_id = notes.note_view.id
GROUP BY
    airport_heliport.city_pt.id,
    airport_heliport.city.xml_id,
    airport_heliport.city.name_value,
    airport_heliport.city.name_nilreason;

CREATE OR REPLACE VIEW airport_heliport.surfacecharacteristics_view AS
SELECT 
airport_heliport.surfacecharacteristics_pt.id,
	jsonb_build_object(
	'xml_id',  airport_heliport.surfacecharacteristics.xml_id,
	'composition_value', airport_heliport.surfacecharacteristics.composition_value,
	'composition_nilreason', airport_heliport.surfacecharacteristics.composition_nilreason,
	'preparation_value', airport_heliport.surfacecharacteristics.preparation_value,
	'preparation_nilreason', airport_heliport.surfacecharacteristics.preparation_nilreason,
	'surfacecondition_value', airport_heliport.surfacecharacteristics.surfacecondition_value,
	'surfacecondition_nilreason', airport_heliport.surfacecharacteristics.surfacecondition_nilreason,
	'classpcn_value', airport_heliport.surfacecharacteristics.classpcn_value,
	'classpcn_nilreason', airport_heliport.surfacecharacteristics.classpcn_nilreason,
	'pavementtypepcn_value', airport_heliport.surfacecharacteristics.pavementtypepcn_value,
	'pavementtypepcn_nilreason', airport_heliport.surfacecharacteristics.pavementtypepcn_nilreason,
	'pavementsubgradepcn_value', airport_heliport.surfacecharacteristics.pavementsubgradepcn_value,
	'pavementsubgradepcn_nilreason', airport_heliport.surfacecharacteristics.pavementsubgradepcn_nilreason,
	'maxtyrepressurepcn_value', airport_heliport.surfacecharacteristics.maxtyrepressurepcn_value,
	'maxtyrepressurepcn_nilreason', airport_heliport.surfacecharacteristics.maxtyrepressurepcn_nilreason,
	'evaluationmethodpcn_value', airport_heliport.surfacecharacteristics.evaluationmethodpcn_value,
	'evaluationmethodpcn_nilreason', airport_heliport.surfacecharacteristics.evaluationmethodpcn_nilreason,
	'classlcn_value', airport_heliport.surfacecharacteristics.classlcn_value,
	'classlcn_nilreason', airport_heliport.surfacecharacteristics.classlcn_nilreason,
	'weightsiwl_value', airport_heliport.surfacecharacteristics.weightsiwl_value,
	'weightsiwl_uom', airport_heliport.surfacecharacteristics.weightsiwl_uom,
	'weightsiwl_nilreason', airport_heliport.surfacecharacteristics.weightsiwl_nilreason,
	'tyrepressuresiwl_value', airport_heliport.surfacecharacteristics.tyrepressuresiwl_value,
	'tyrepressuresiwl_uom', airport_heliport.surfacecharacteristics.tyrepressuresiwl_uom,
	'tyrepressuresiwl_nilreason',  airport_heliport.surfacecharacteristics.tyrepressuresiwl_nilreason,
	'weightauw_value',  airport_heliport.surfacecharacteristics.weightauw_value,
	'weightauw_uom',  airport_heliport.surfacecharacteristics.weightauw_uom,
	'weightauw_nilreason',  airport_heliport.surfacecharacteristics.weightauw_nilreason,
    'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
	) AS surfacecharacteristics
FROM airport_heliport.surfacecharacteristics_pt
INNER JOIN airport_heliport.surfacecharacteristics
ON airport_heliport.surfacecharacteristics_pt.surfacecharacteristics_id = airport_heliport.surfacecharacteristics.id
LEFT JOIN public.surfacecharacteristics_annotation
ON airport_heliport.surfacecharacteristics.id = public.surfacecharacteristics_annotation.surfacecharacteristics_id
LEFT JOIN notes.note_view
ON public.surfacecharacteristics_annotation.note_pt_id = notes.note_view.id
GROUP BY
    airport_heliport.surfacecharacteristics_pt.id,
    airport_heliport.surfacecharacteristics.xml_id,
    airport_heliport.surfacecharacteristics.composition_value,
    airport_heliport.surfacecharacteristics.composition_nilreason,
    airport_heliport.surfacecharacteristics.preparation_value,
    airport_heliport.surfacecharacteristics.preparation_nilreason,
    airport_heliport.surfacecharacteristics.surfacecondition_value,
    airport_heliport.surfacecharacteristics.surfacecondition_nilreason,
    airport_heliport.surfacecharacteristics.classpcn_value,
    airport_heliport.surfacecharacteristics.classpcn_nilreason,
    airport_heliport.surfacecharacteristics.pavementtypepcn_value,
    airport_heliport.surfacecharacteristics.pavementtypepcn_nilreason,
    airport_heliport.surfacecharacteristics.pavementsubgradepcn_value,
    airport_heliport.surfacecharacteristics.pavementsubgradepcn_nilreason,
    airport_heliport.surfacecharacteristics.maxtyrepressurepcn_value,
    airport_heliport.surfacecharacteristics.maxtyrepressurepcn_nilreason,
    airport_heliport.surfacecharacteristics.evaluationmethodpcn_value,
    airport_heliport.surfacecharacteristics.evaluationmethodpcn_nilreason,
    airport_heliport.surfacecharacteristics.classlcn_value,
    airport_heliport.surfacecharacteristics.classlcn_nilreason,
    airport_heliport.surfacecharacteristics.weightsiwl_value,
    airport_heliport.surfacecharacteristics.weightsiwl_uom,
    airport_heliport.surfacecharacteristics.weightsiwl_nilreason,
    airport_heliport.surfacecharacteristics.tyrepressuresiwl_value,
    airport_heliport.surfacecharacteristics.tyrepressuresiwl_uom,
    airport_heliport.surfacecharacteristics.tyrepressuresiwl_nilreason,
    airport_heliport.surfacecharacteristics.weightauw_value,
    airport_heliport.surfacecharacteristics.weightauw_uom,
    airport_heliport.surfacecharacteristics.weightauw_nilreason;

CREATE OR REPLACE VIEW airport_heliport.ridge_view AS
SELECT 
	airport_heliport.ridge_pt.id, 
	jsonb_build_object(
		'xml_id',  airport_heliport.ridge.xml_id,
		'side_value',  airport_heliport.ridge.side_value,
		'side_nilreason',  airport_heliport.ridge.side_nilreason,
		'distance_value',  airport_heliport.ridge.distance_value,
		'distance_uom',  airport_heliport.ridge.distance_uom,
		'distance_nilreason',  airport_heliport.ridge.distance_nilreason,
		'depth_value',  airport_heliport.ridge.depth_value,
		'depth_uom',  airport_heliport.ridge.depth_uom,
		'depth_nilreason',  airport_heliport.ridge.depth_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
	) AS ridge
FROM airport_heliport.ridge_pt
INNER JOIN airport_heliport.ridge
ON airport_heliport.ridge_pt.ridge_id = airport_heliport.ridge.id
LEFT JOIN ridge_annotation
ON airport_heliport.ridge.id = ridge_annotation.ridge_id
LEFT JOIN notes.note_view
ON ridge_annotation.note_pt_id = notes.note_view.id
GROUP BY
    airport_heliport.ridge_pt.id,
    airport_heliport.ridge.xml_id,
    airport_heliport.ridge.side_value,
    airport_heliport.ridge.side_nilreason,
    airport_heliport.ridge.distance_value,
    airport_heliport.ridge.distance_uom,
    airport_heliport.ridge.distance_nilreason,
    airport_heliport.ridge.depth_value,
    airport_heliport.ridge.depth_uom,
    airport_heliport.ridge.depth_nilreason;

CREATE OR REPLACE VIEW airport_heliport.surfacecontaminationlayer_view AS
SELECT
airport_heliport.surfacecontaminationlayer_pt.id,
    jsonb_build_object(
        'xml_id', airport_heliport.surfacecontaminationlayer.xml_id,
       'layerorder_value', airport_heliport.surfacecontaminationlayer.layerorder_value,
       'layerorder_nilreason', airport_heliport.surfacecontaminationlayer.layerorder_nilreason,
       'type_value', airport_heliport.surfacecontaminationlayer.type_value,
       'type_nilreason', airport_heliport.surfacecontaminationlayer.type_nilreason,
       'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
    ) AS surfacecontaminationlayer
FROM airport_heliport.surfacecontaminationlayer_pt
INNER JOIN airport_heliport.surfacecontaminationlayer
ON airport_heliport.surfacecontaminationlayer_pt.surfacecontaminationlayer_id = airport_heliport.surfacecontaminationlayer.id
LEFT JOIN surfacecontaminationlayer_annotation
ON airport_heliport.surfacecontaminationlayer.id = surfacecontaminationlayer_annotation.surfacecontaminationlayer_id
LEFT JOIN notes.note_view
ON surfacecontaminationlayer_annotation.note_pt_id = notes.note_view.id
-- LEFT JOIN airport_heliport.surfacecontaminationlayer_extent
-- ON airport_heliport.surfacecontaminationlayer.id = surfacecontaminationlayer_extent.surfacecontaminationlayer_id
-- LEFT JOIN airport_heliport.surfacecontaminationlayer
-- ON surfacecontaminationlayer_extent.elevatedsurface_pt_id = ElevatedSurfacePropertyType.id
GROUP BY 
    airport_heliport.surfacecontaminationlayer_pt.id,
    airport_heliport.surfacecontaminationlayer.xml_id,
    airport_heliport.surfacecontaminationlayer.layerorder_value,
    airport_heliport.surfacecontaminationlayer.layerorder_nilreason,
    airport_heliport.surfacecontaminationlayer.type_value,
    airport_heliport.surfacecontaminationlayer.type_nilreason;


CREATE OR REPLACE VIEW airport_heliport.airportheliportcontamination_view AS
SELECT
	airport_heliport.airportheliportcontamination_pt.id, 
	jsonb_build_object(
		'xml_id', airport_heliport.airportheliportcontamination.xml_id,
		-- 'observationtime_value', airport_heliport.airportheliportcontamination.observationtime_value,
		'observationtime_nilreason',  airport_heliport.airportheliportcontamination.observationtime_nilreason,
		'depth_value', airport_heliport.airportheliportcontamination.depth_value,
		'depth_uom', airport_heliport.airportheliportcontamination.depth_uom,
		'depth_nilreason', airport_heliport.airportheliportcontamination.depth_nilreason,
		'frictioncoefficient_value', airport_heliport.airportheliportcontamination.frictioncoefficient_value,
		'frictioncoefficient_nilreason', airport_heliport.airportheliportcontamination.frictioncoefficient_nilreason,
		'frictionestimation_value', airport_heliport.airportheliportcontamination.frictionestimation_value,
		'frictionestimation_nilreason', airport_heliport.airportheliportcontamination.frictionestimation_nilreason,
		'frictiondevice_value', airport_heliport.airportheliportcontamination.frictiondevice_value,
		'frictiondevice_nilreason', airport_heliport.airportheliportcontamination.frictiondevice_nilreason,
		'obscuredlights_value', airport_heliport.airportheliportcontamination.obscuredlights_value,
		'obscuredlights_nilreason', airport_heliport.airportheliportcontamination.obscuredlights_nilreason,
		'furtherclearancetime_value', airport_heliport.airportheliportcontamination.furtherclearancetime_value,
		'furtherclearancetime_nilreason', airport_heliport.airportheliportcontamination.furtherclearancetime_nilreason,
		'furthertotalclearance_value', airport_heliport.airportheliportcontamination.furthertotalclearance_value,
		'furthertotalclearance_nilreason', airport_heliport.airportheliportcontamination.furthertotalclearance_nilreason,
		-- 'nextobservationtime_value', airport_heliport.airportheliportcontamination.nextobservationtime_value,
		'nextobservationtime_nilreason', airport_heliport.airportheliportcontamination.nextobservationtime_nilreason,
		'proportion_value', airport_heliport.airportheliportcontamination.proportion_value,
		'proportion_nilreason', airport_heliport.airportheliportcontamination.proportion_nilreason,
		'ridge', COALESCE(jsonb_agg(airport_heliport.ridge_view.ridge), '[]'::jsonb),
        'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb),
		'surfacecontaminationlayer',  COALESCE(jsonb_agg(airport_heliport.surfacecontaminationlayer_view.surfacecontaminationlayer), '[]'::jsonb)
	) AS airportheliportcontamination
FROM
airport_heliport.airportheliportcontamination_pt
INNER JOIN airport_heliport.airportheliportcontamination
ON airport_heliport.airportheliportcontamination_pt.airportheliportcontamination_id = airport_heliport.airportheliportcontamination.id
LEFT JOIN airportheliportcontamination_criticalridge
ON airport_heliport.airportheliportcontamination.id = airportheliportcontamination_criticalridge.airportheliportcontamination_id
LEFT JOIN airport_heliport.ridge_view
ON airportheliportcontamination_criticalridge.ridge_pt_id = airport_heliport.ridge_view.id
LEFT JOIN airportheliportcontamination_annotation
ON airport_heliport.airportheliportcontamination.id = airportheliportcontamination_annotation.airportheliportcontamination_id
LEFT JOIN notes.note_view
ON airportheliportcontamination_annotation.note_pt_id = notes.note_view.id
LEFT JOIN airportheliportcontamination_layer
ON airport_heliport.airportheliportcontamination.id = airportheliportcontamination_layer.airportheliportcontamination_id
LEFT JOIN airport_heliport.surfacecontaminationlayer_view
ON airportheliportcontamination_layer.surfacecontaminationlayer_pt_id = airport_heliport.surfacecontaminationlayer_view.id
GROUP BY
    airport_heliport.airportheliportcontamination_pt.id,
    airport_heliport.airportheliportcontamination.xml_id,
    -- airport_heliport.airportheliportcontamination.observationtime_value,
    airport_heliport.airportheliportcontamination.observationtime_nilreason,
    airport_heliport.airportheliportcontamination.depth_value,
    airport_heliport.airportheliportcontamination.depth_uom,
    airport_heliport.airportheliportcontamination.depth_nilreason,
    airport_heliport.airportheliportcontamination.frictioncoefficient_value,
    airport_heliport.airportheliportcontamination.frictioncoefficient_nilreason,
    airport_heliport.airportheliportcontamination.frictionestimation_value,
    airport_heliport.airportheliportcontamination.frictionestimation_nilreason,
    airport_heliport.airportheliportcontamination.frictiondevice_value,
    airport_heliport.airportheliportcontamination.frictiondevice_nilreason,
    airport_heliport.airportheliportcontamination.obscuredlights_value,
    airport_heliport.airportheliportcontamination.obscuredlights_nilreason,
    airport_heliport.airportheliportcontamination.furtherclearancetime_value,
    airport_heliport.airportheliportcontamination.furtherclearancetime_nilreason,
    airport_heliport.airportheliportcontamination.furthertotalclearance_value,
    airport_heliport.airportheliportcontamination.furthertotalclearance_nilreason,
    -- airport_heliport.airportheliportcontamination.nextobservationtime_value,
    airport_heliport.airportheliportcontamination.nextobservationtime_nilreason,
    airport_heliport.airportheliportcontamination.proportion_value,
    airport_heliport.airportheliportcontamination.proportion_nilreason;




CREATE OR REPLACE VIEW airport_heliport.airportheliport_view AS
SELECT 
(row_number() OVER ())::integer AS row,
airport_heliport.airportheliport.id,
airport_heliport.airportheliport.identifier,
airport_heliport.airportheliport_ts.xml_id,
airport_heliport.airportheliport_ts.interpretation,
airport_heliport.airportheliport_ts.sequence_number,
airport_heliport.airportheliport_ts.correction_number,
airport_heliport.airportheliport_ts.valid_time_begin,
airport_heliport.airportheliport_ts.valid_time_end,
airport_heliport.airportheliport_ts.feature_lifetime_begin,
airport_heliport.airportheliport_ts.feature_lifetime_end,
airport_heliport.airportheliport_ts.designator_value,
airport_heliport.airportheliport_ts.designator_nilreason,
airport_heliport.airportheliport_ts.name_value,
airport_heliport.airportheliport_ts.name_nilreason,
airport_heliport.airportheliport_ts.locationindicatoricao_value,
airport_heliport.airportheliport_ts.locationindicatoricao_nilreason,
airport_heliport.airportheliport_ts.designatoriata_value,
airport_heliport.airportheliport_ts.designatoriata_nilreason,
airport_heliport.airportheliport_ts.type_value,
airport_heliport.airportheliport_ts.type_nilreason,
airport_heliport.airportheliport_ts.certifiedicao_value,
airport_heliport.airportheliport_ts.certifiedicao_nilreason,
airport_heliport.airportheliport_ts.privateuse_value,
airport_heliport.airportheliport_ts.privateuse_nilreason,
airport_heliport.airportheliport_ts.controltype_value,
airport_heliport.airportheliport_ts.controltype_nilreason,
airport_heliport.airportheliport_ts.verticaldatum_value,
airport_heliport.airportheliport_ts.verticaldatum_nilreason,
airport_heliport.airportheliport_ts.magneticvariation_value,
airport_heliport.airportheliport_ts.magneticvariation_nilreason,
airport_heliport.airportheliport_ts.magneticvariationaccuracy_value,
airport_heliport.airportheliport_ts.magneticvariationaccuracy_nilreason,
airport_heliport.airportheliport_ts.datemagneticvariation_value,
airport_heliport.airportheliport_ts.datemagneticvariation_nilreason,
airport_heliport.airportheliport_ts.magneticvariationchange_value,
airport_heliport.airportheliport_ts.magneticvariationchange_nilreason,
airport_heliport.airportheliport_ts.altimeterchecklocation_value,
airport_heliport.airportheliport_ts.altimeterchecklocation_nilreason,
airport_heliport.airportheliport_ts.secondarypowersupply_value,
airport_heliport.airportheliport_ts.secondarypowersupply_nilreason,
airport_heliport.airportheliport_ts.winddirectionindicator_value,
airport_heliport.airportheliport_ts.winddirectionindicator_nilreason,
airport_heliport.airportheliport_ts.landingdirectionindicator_value,
airport_heliport.airportheliport_ts.landingdirectionindicator_nilreason,
airport_heliport.airportheliport_ts.abandoned_value,
airport_heliport.airportheliport_ts.abandoned_nilreason,
airport_heliport.airportheliport_ts.certificationdate_value,
airport_heliport.airportheliport_ts.certificationdate_nilreason,
airport_heliport.airportheliport_ts.certificationexpirationdate_value,
airport_heliport.airportheliport_ts.certificationexpirationdate_nilreason,
airport_heliport.airportheliport_ts.fieldelevation_value,
airport_heliport.airportheliport_ts.fieldelevation_uom,
airport_heliport.airportheliport_ts.fieldelevation_nilreason,
airport_heliport.airportheliport_ts.fieldelevationaccuracy_value,
airport_heliport.airportheliport_ts.fieldelevationaccuracy_uom,
airport_heliport.airportheliport_ts.fieldelevationaccuracy_nilreason,
airport_heliport.airportheliport_ts.referencetemperature_value,
airport_heliport.airportheliport_ts.referencetemperature_uom,
airport_heliport.airportheliport_ts.referencetemperature_nilreason,
airport_heliport.airportheliport_ts.transitionaltitude_value,
airport_heliport.airportheliport_ts.transitionaltitude_uom,
airport_heliport.airportheliport_ts.transitionaltitude_nilreason,
airport_heliport.airportheliport_ts.transitionlevel_value,
airport_heliport.airportheliport_ts.transitionlevel_uom,
airport_heliport.airportheliport_ts.transitionlevel_nilreason,
airport_heliport.airportheliport_ts.lowesttemperature_value,
airport_heliport.airportheliport_ts.lowesttemperature_uom,
airport_heliport.airportheliport_ts.lowesttemperature_nilreason,
COALESCE(jsonb_agg(airport_heliport.city_view.city), '[]'::jsonb) AS city,
COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb) AS note,
COALESCE(jsonb_agg(shared.contactinformation_view.contactinformation), '[]'::jsonb) AS contactinformation,
geometry.elevated_point_view.geom AS arp,
geometry.elevated_surface_view.geom AS boundary
FROM airport_heliport.airportheliport
INNER JOIN public.airportheliport_timeslice
    ON airport_heliport.airportheliport.id = public.airportheliport_timeslice.airportheliport_id
INNER JOIN airport_heliport.airportheliport_tsp
    ON public.airportheliport_timeslice.airportheliport_tsp_id = airport_heliport.airportheliport_tsp.id
INNER JOIN airport_heliport.airportheliport_ts
    ON airport_heliport.airportheliport_tsp.airportheliporttimeslice_id = airport_heliport.airportheliport_ts.id
LEFT JOIN geometry.elevated_point_view
    ON airport_heliport.airportheliport_ts.arp_id = geometry.elevated_point_view.id
LEFT JOIN geometry.elevated_surface_view
    ON airport_heliport.airportheliport_ts.aviationboundary_id = geometry.elevated_surface_view.id
LEFT JOIN public.airportheliport_ts_servedcity
    ON airport_heliport.airportheliport_ts.id = public.airportheliport_ts_servedcity.airportheliport_ts_id
LEFT JOIN airport_heliport.city_view
    ON public.airportheliport_ts_servedcity.city_pt_id = airport_heliport.city_view.id
LEFT JOIN public.airportheliport_ts_annotation
    ON airport_heliport.airportheliport_ts.id = public.airportheliport_ts_annotation.airportheliport_ts_id
LEFT JOIN notes.note_view
    ON public.airportheliport_ts_annotation.note_pt_id = notes.note_view.id
LEFT JOIN airportheliport_ts_contaminant
    ON airport_heliport.airportheliport_ts.id = airportheliport_ts_contaminant.airportheliport_ts_id
LEFT JOIN airport_heliport.airportheliportcontamination_view
    ON airportheliport_ts_contaminant.airportheliportcontamination_pt_id = airport_heliport.airportheliportcontamination_view.id
LEFT JOIN airportheliport_ts_contact
	ON airport_heliport.airportheliport_ts.id = airportheliport_ts_contact.airportheliport_ts_id
LEFT JOIN shared.contactinformation_view
	ON airportheliport_ts_contact.contactinformation_pt_id = shared.contactinformation_view.id
-- LEFT JOIN airportheliport_ts_availability
-- LEFT JOIN airportheliport_ts_altimetersource
GROUP BY 
    airport_heliport.airportheliport.id,
	airport_heliport.airportheliport.identifier,
	airport_heliport.airportheliport_ts.xml_id,
	airport_heliport.airportheliport_ts.interpretation,
	airport_heliport.airportheliport_ts.sequence_number,
	airport_heliport.airportheliport_ts.correction_number,
	airport_heliport.airportheliport_ts.valid_time_begin,
	airport_heliport.airportheliport_ts.valid_time_end,
	airport_heliport.airportheliport_ts.feature_lifetime_begin,
	airport_heliport.airportheliport_ts.feature_lifetime_end,
	airport_heliport.airportheliport_ts.designator_value,
	airport_heliport.airportheliport_ts.designator_nilreason,
	airport_heliport.airportheliport_ts.name_value,
	airport_heliport.airportheliport_ts.name_nilreason,
	airport_heliport.airportheliport_ts.locationindicatoricao_value,
	airport_heliport.airportheliport_ts.locationindicatoricao_nilreason,
	airport_heliport.airportheliport_ts.designatoriata_value,
	airport_heliport.airportheliport_ts.designatoriata_nilreason,
	airport_heliport.airportheliport_ts.type_value,
	airport_heliport.airportheliport_ts.type_nilreason,
	airport_heliport.airportheliport_ts.certifiedicao_value,
	airport_heliport.airportheliport_ts.certifiedicao_nilreason,
	airport_heliport.airportheliport_ts.privateuse_value,
	airport_heliport.airportheliport_ts.privateuse_nilreason,
	airport_heliport.airportheliport_ts.controltype_value,
	airport_heliport.airportheliport_ts.controltype_nilreason,
	airport_heliport.airportheliport_ts.verticaldatum_value,
	airport_heliport.airportheliport_ts.verticaldatum_nilreason,
	airport_heliport.airportheliport_ts.magneticvariation_value,
	airport_heliport.airportheliport_ts.magneticvariation_nilreason,
	airport_heliport.airportheliport_ts.magneticvariationaccuracy_value,
	airport_heliport.airportheliport_ts.magneticvariationaccuracy_nilreason,
	airport_heliport.airportheliport_ts.datemagneticvariation_value,
	airport_heliport.airportheliport_ts.datemagneticvariation_nilreason,
	airport_heliport.airportheliport_ts.magneticvariationchange_value,
	airport_heliport.airportheliport_ts.magneticvariationchange_nilreason,
	airport_heliport.airportheliport_ts.altimeterchecklocation_value,
	airport_heliport.airportheliport_ts.altimeterchecklocation_nilreason,
	airport_heliport.airportheliport_ts.secondarypowersupply_value,
	airport_heliport.airportheliport_ts.secondarypowersupply_nilreason,
	airport_heliport.airportheliport_ts.winddirectionindicator_value,
	airport_heliport.airportheliport_ts.winddirectionindicator_nilreason,
	airport_heliport.airportheliport_ts.landingdirectionindicator_value,
	airport_heliport.airportheliport_ts.landingdirectionindicator_nilreason,
	airport_heliport.airportheliport_ts.abandoned_value,
	airport_heliport.airportheliport_ts.abandoned_nilreason,
	airport_heliport.airportheliport_ts.certificationdate_value,
	airport_heliport.airportheliport_ts.certificationdate_nilreason,
	airport_heliport.airportheliport_ts.certificationexpirationdate_value,
	airport_heliport.airportheliport_ts.certificationexpirationdate_nilreason,
	airport_heliport.airportheliport_ts.fieldelevation_value,
	airport_heliport.airportheliport_ts.fieldelevation_uom,
	airport_heliport.airportheliport_ts.fieldelevation_nilreason,
	airport_heliport.airportheliport_ts.fieldelevationaccuracy_value,
	airport_heliport.airportheliport_ts.fieldelevationaccuracy_uom,
	airport_heliport.airportheliport_ts.fieldelevationaccuracy_nilreason,
	airport_heliport.airportheliport_ts.referencetemperature_value,
	airport_heliport.airportheliport_ts.referencetemperature_uom,
	airport_heliport.airportheliport_ts.referencetemperature_nilreason,
	airport_heliport.airportheliport_ts.transitionaltitude_value,
	airport_heliport.airportheliport_ts.transitionaltitude_uom,
	airport_heliport.airportheliport_ts.transitionaltitude_nilreason,
	airport_heliport.airportheliport_ts.transitionlevel_value,
	airport_heliport.airportheliport_ts.transitionlevel_uom,
	airport_heliport.airportheliport_ts.transitionlevel_nilreason,
	airport_heliport.airportheliport_ts.lowesttemperature_value,
	airport_heliport.airportheliport_ts.lowesttemperature_uom,
	airport_heliport.airportheliport_ts.lowesttemperature_nilreason,
	geometry.elevated_point_view.geom,
	geometry.elevated_surface_view.geom;


