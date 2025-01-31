SELECT 
	airport_heliport.runway.id,
	airport_heliport.runway.identifier,
	airport_heliport.runway_ts.valid_time_begin,
	airport_heliport.runway_ts.valid_time_end,
	airport_heliport.runway_ts.feature_lifetime_begin,
	airport_heliport.runway_ts.feature_lifetime_end,
	airport_heliport.runway_ts.designator_value,
	airport_heliport.runway_ts.designator_nilreason,
	airport_heliport.runway_ts.type_value,
	airport_heliport.runway_ts.type_nilreason,
	airport_heliport.runway_ts.nominallength_value,
	airport_heliport.runway_ts.nominallength_uom,
	airport_heliport.runway_ts.nominallength_nilreason,
	airport_heliport.runway_ts.lengthaccuracy_value,
	airport_heliport.runway_ts.lengthaccuracy_uom,
	airport_heliport.runway_ts.lengthaccuracy_nilreason,
	airport_heliport.runway_ts.nominalwidth_value,
	airport_heliport.runway_ts.nominalwidth_uom,
	airport_heliport.runway_ts.nominalwidth_nilreason,
	airport_heliport.runway_ts.widthaccuracy_value,
	airport_heliport.runway_ts.widthaccuracy_uom,
	airport_heliport.runway_ts.widthaccuracy_nilreason,
	airport_heliport.runway_ts.widthshoulder_value,
	airport_heliport.runway_ts.widthshoulder_uom,
	airport_heliport.runway_ts.widthshoulder_nilreason,
	airport_heliport.runway_ts.lengthstrip_value,
	airport_heliport.runway_ts.lengthstrip_uom,
	airport_heliport.runway_ts.lengthstrip_nilreason,
	airport_heliport.runway_ts.widthstrip_value,
	airport_heliport.runway_ts.widthstrip_uom,
	airport_heliport.runway_ts.widthstrip_nilreason,
	airport_heliport.runway_ts.lengthoffset_value,
	airport_heliport.runway_ts.lengthoffset_uom,
	airport_heliport.runway_ts.lengthoffset_nilreason,
	airport_heliport.runway_ts.widthoffset_value,
	airport_heliport.runway_ts.widthoffset_uom,
	airport_heliport.runway_ts.widthoffset_nilreason,
	airport_heliport.runway_ts.abandoned_value,
	airport_heliport.runway_ts.abandoned_nilreason,
	airport_heliport.airportheliport_pt.href,
	json_agg(airport_heliport.surfacecharacteristics_view.*) AS surface_properties,
	json_agg(airport_heliport.airportheliport_view.*) AS associated_airportHeliport,
	json_agg(notes.note_view.note_value) AS notes
	
FROM airport_heliport.runway
INNER JOIN public.runway_timeslice
	ON airport_heliport.runway.id = public.runway_timeslice.runway_id
INNER JOIN airport_heliport.runway_tsp
	ON public.runway_timeslice.runway_tsp_id = airport_heliport.runway_tsp.id
INNER JOIN airport_heliport.runway_ts
	ON airport_heliport.runway_tsp.runwaytimeslice_id = airport_heliport.runway_ts.id
LEFT JOIN airport_heliport.surfacecharacteristics_view
	ON airport_heliport.runway_ts.surfaceproperties_id = airport_heliport.surfacecharacteristics_view.id
LEFT JOIN airport_heliport.airportheliport_pt
	ON airport_heliport.runway_ts.associatedairportheliport_id = airport_heliport.airportheliport_pt.id
LEFT JOIN airport_heliport.airportheliport_view
	ON SUBSTRING(airport_heliport.airportheliport_pt.href FROM'([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$') = airport_heliport.airportheliport_view.identifier 
LEFT JOIN public.runway_ts_annotation
	ON airport_heliport.runway_ts.id = public.runway_ts_annotation.runway_ts_id
LEFT JOIN notes.note_view
	ON  public.runway_ts_annotation.note_pt_id = notes.note_view.id
GROUP BY 
	airport_heliport.runway.id,
	airport_heliport.runway.identifier,
	airport_heliport.runway_ts.valid_time_begin,
	airport_heliport.runway_ts.valid_time_end,
	airport_heliport.runway_ts.feature_lifetime_begin,
	airport_heliport.runway_ts.feature_lifetime_end,
	airport_heliport.runway_ts.designator_value,
	airport_heliport.runway_ts.designator_nilreason,
	airport_heliport.runway_ts.type_value,
	airport_heliport.runway_ts.type_nilreason,
	airport_heliport.runway_ts.nominallength_value,
	airport_heliport.runway_ts.nominallength_uom,
	airport_heliport.runway_ts.nominallength_nilreason,
	airport_heliport.runway_ts.lengthaccuracy_value,
	airport_heliport.runway_ts.lengthaccuracy_uom,
	airport_heliport.runway_ts.lengthaccuracy_nilreason,
	airport_heliport.runway_ts.nominalwidth_value,
	airport_heliport.runway_ts.nominalwidth_uom,
	airport_heliport.runway_ts.nominalwidth_nilreason,
	airport_heliport.runway_ts.widthaccuracy_value,
	airport_heliport.runway_ts.widthaccuracy_uom,
	airport_heliport.runway_ts.widthaccuracy_nilreason,
	airport_heliport.runway_ts.widthshoulder_value,
	airport_heliport.runway_ts.widthshoulder_uom,
	airport_heliport.runway_ts.widthshoulder_nilreason,
	airport_heliport.runway_ts.lengthstrip_value,
	airport_heliport.runway_ts.lengthstrip_uom,
	airport_heliport.runway_ts.lengthstrip_nilreason,
	airport_heliport.runway_ts.widthstrip_value,
	airport_heliport.runway_ts.widthstrip_uom,
	airport_heliport.runway_ts.widthstrip_nilreason,
	airport_heliport.runway_ts.lengthoffset_value,
	airport_heliport.runway_ts.lengthoffset_uom,
	airport_heliport.runway_ts.lengthoffset_nilreason,
	airport_heliport.runway_ts.widthoffset_value,
	airport_heliport.runway_ts.widthoffset_uom,
	airport_heliport.runway_ts.widthoffset_nilreason,
	airport_heliport.runway_ts.abandoned_value,
	airport_heliport.runway_ts.abandoned_nilreason,
	airport_heliport.runway_ts.surfaceproperties_id,
	airport_heliport.airportheliport_pt.href