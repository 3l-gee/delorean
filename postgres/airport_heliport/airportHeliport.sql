CREATE OR REPLACE VIEW airport_heliport.city_view AS
SELECT 
airport_heliport.city_pt.id,
airport_heliport.city.name_value
FROM airport_heliport.city_pt
INNER JOIN airport_heliport.city
ON airport_heliport.city_pt.city_id = airport_heliport.city.id;

CREATE OR REPLACE VIEW airport_heliport.surfacecharacteristics_view AS
SELECT 
airport_heliport.surfacecharacteristics_pt.id,
airport_heliport.surfacecharacteristics.composition_value,
airport_heliport.surfacecharacteristics.preparation_value,
airport_heliport.surfacecharacteristics.surfacecondition_value,
airport_heliport.surfacecharacteristics.classpcn_value,
airport_heliport.surfacecharacteristics.pavementtypepcn_value,
airport_heliport.surfacecharacteristics.pavementsubgradepcn_value,
airport_heliport.surfacecharacteristics.maxtyrepressurepcn_value,
airport_heliport.surfacecharacteristics.evaluationmethodpcn_value,
airport_heliport.surfacecharacteristics.classlcn_value,
airport_heliport.surfacecharacteristics.weightsiwl_value,
airport_heliport.surfacecharacteristics.weightsiwl_uom,
airport_heliport.surfacecharacteristics.tyrepressuresiwl_value,
airport_heliport.surfacecharacteristics.tyrepressuresiwl_uom,
airport_heliport.surfacecharacteristics.weightauw_value,
airport_heliport.surfacecharacteristics.weightauw_uom

FROM airport_heliport.surfacecharacteristics_pt
INNER JOIN airport_heliport.surfacecharacteristics
ON airport_heliport.surfacecharacteristics_pt.surfacecharacteristics_id = airport_heliport.surfacecharacteristics.id
LEFT JOIN public.surfacecharacteristics_annotation
ON airport_heliport.surfacecharacteristics.id = public.surfacecharacteristics_annotation.surfacecharacteristics_id
LEFT JOIN notes.note_view
ON public.surfacecharacteristics_annotation.note_pt_id = notes.note_view.id;

CREATE OR REPLACE VIEW airport_heliport.airportheliport_view AS
SELECT 
    (row_number() OVER ())::integer AS row,
    airport_heliport.airportheliport.id,
    airport_heliport.airportheliport.identifier,
    airport_heliport.airportheliport_ts.valid_time_begin,
    airport_heliport.airportheliport_ts.valid_time_end,
    airport_heliport.airportheliport_ts.feature_lifetime_begin,
    airport_heliport.airportheliport_ts.feature_lifetime_end,
    COALESCE(geometry.elevated_point_view.geom, geometry.elevated_surface_view.geom) AS geom,
    airport_heliport.airportheliport_ts.designator_value,
    airport_heliport.airportheliport_ts.name_value,
    airport_heliport.airportheliport_ts.locationindicatoricao_value,
    airport_heliport.airportheliport_ts.designatoriata_value,
    airport_heliport.airportheliport_ts.type_value,
    airport_heliport.airportheliport_ts.certifiedicao_value,
    airport_heliport.airportheliport_ts.privateuse_value,
    airport_heliport.airportheliport_ts.controltype_value,
    airport_heliport.airportheliport_ts.fieldelevation_value,
    airport_heliport.airportheliport_ts.fieldelevation_uom,
    airport_heliport.airportheliport_ts.fieldelevationaccuracy_value,
    airport_heliport.airportheliport_ts.fieldelevationaccuracy_uom,
    airport_heliport.airportheliport_ts.verticaldatum_value,
    airport_heliport.airportheliport_ts.magneticvariation_value,
    airport_heliport.airportheliport_ts.magneticvariationaccuracy_value,
    airport_heliport.airportheliport_ts.datemagneticvariation_value,
    airport_heliport.airportheliport_ts.magneticvariationchange_value,
    airport_heliport.airportheliport_ts.referencetemperature_value,
    airport_heliport.airportheliport_ts.referencetemperature_uom,
    airport_heliport.airportheliport_ts.altimeterchecklocation_value,
    airport_heliport.airportheliport_ts.secondarypowersupply_value,
    airport_heliport.airportheliport_ts.winddirectionindicator_value,
    airport_heliport.airportheliport_ts.landingdirectionindicator_value,
    airport_heliport.airportheliport_ts.transitionaltitude_value,
    airport_heliport.airportheliport_ts.transitionaltitude_uom,
    airport_heliport.airportheliport_ts.transitionlevel_value,
    airport_heliport.airportheliport_ts.transitionlevel_uom,
    airport_heliport.airportheliport_ts.lowesttemperature_value,
    airport_heliport.airportheliport_ts.lowesttemperature_uom,
    airport_heliport.airportheliport_ts.abandoned_value,
    airport_heliport.airportheliport_ts.certificationdate_value,
    airport_heliport.airportheliport_ts.certificationexpirationdate_value,
    json_agg(airport_heliport.city_view.name_value) AS city,
    json_agg(notes.note_view.note_value) AS notes
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
GROUP BY 
    airport_heliport.airportheliport.id,
    airport_heliport.airportheliport_ts.valid_time_begin,
    airport_heliport.airportheliport_ts.valid_time_end,
    airport_heliport.airportheliport_ts.feature_lifetime_begin,
    airport_heliport.airportheliport_ts.feature_lifetime_end,
    COALESCE(geometry.elevated_point_view.geom, geometry.elevated_surface_view.geom),
    airport_heliport.airportheliport_ts.designator_value,
    airport_heliport.airportheliport_ts.name_value,
    airport_heliport.airportheliport_ts.locationindicatoricao_value,
    airport_heliport.airportheliport_ts.designatoriata_value,
    airport_heliport.airportheliport_ts.type_value,
    airport_heliport.airportheliport_ts.certifiedicao_value,
    airport_heliport.airportheliport_ts.privateuse_value,
    airport_heliport.airportheliport_ts.controltype_value,
    airport_heliport.airportheliport_ts.fieldelevation_value,
    airport_heliport.airportheliport_ts.fieldelevation_uom,
    airport_heliport.airportheliport_ts.fieldelevationaccuracy_value,
    airport_heliport.airportheliport_ts.fieldelevationaccuracy_uom,
    airport_heliport.airportheliport_ts.verticaldatum_value,
    airport_heliport.airportheliport_ts.magneticvariation_value,
    airport_heliport.airportheliport_ts.magneticvariationaccuracy_value,
    airport_heliport.airportheliport_ts.datemagneticvariation_value,
    airport_heliport.airportheliport_ts.magneticvariationchange_value,
    airport_heliport.airportheliport_ts.referencetemperature_value,
    airport_heliport.airportheliport_ts.referencetemperature_uom,
    airport_heliport.airportheliport_ts.altimeterchecklocation_value,
    airport_heliport.airportheliport_ts.secondarypowersupply_value,
    airport_heliport.airportheliport_ts.winddirectionindicator_value,
    airport_heliport.airportheliport_ts.landingdirectionindicator_value,
    airport_heliport.airportheliport_ts.transitionaltitude_value,
    airport_heliport.airportheliport_ts.transitionaltitude_uom,
    airport_heliport.airportheliport_ts.transitionlevel_value,
    airport_heliport.airportheliport_ts.transitionlevel_uom,
    airport_heliport.airportheliport_ts.lowesttemperature_value,
    airport_heliport.airportheliport_ts.lowesttemperature_uom,
    airport_heliport.airportheliport_ts.abandoned_value,
    airport_heliport.airportheliport_ts.certificationdate_value,
    airport_heliport.airportheliport_ts.certificationexpirationdate_value;


