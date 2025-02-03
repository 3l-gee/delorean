CREATE OR REPLACE VIEW obstacles.verticalstructurepart_view AS
SELECT 
obstacles.verticalstructurepart_pt.id,
obstacles.verticalstructurepart.xml_id,
ST_Collect(
    COALESCE(geometry.elevated_point_view.geom, 
             geometry.elevated_curve_view.geom,  
             geometry.elevated_surface_view.geom)
) AS geom,
json_build_object(
	'xml_id', obstacles.verticalstructurepart.xml_id,
	'verticalextent_value', obstacles.verticalstructurepart.verticalextent_value,
	'verticalextent_uom', obstacles.verticalstructurepart.verticalextent_uom,
	'verticalextentaccuracy_value', obstacles.verticalstructurepart.verticalextentaccuracy_value,
	'verticalextentaccuracy_uom', obstacles.verticalstructurepart.verticalextentaccuracy_uom,
	'type_value', obstacles.verticalstructurepart.type_value,
	'constructionstatus_value', obstacles.verticalstructurepart.constructionstatus_value,
	'markingpattern_value', obstacles.verticalstructurepart.markingpattern_value,
	'markingfirstcolour_value', obstacles.verticalstructurepart.markingfirstcolour_value,
	'markingsecondcolour_value', obstacles.verticalstructurepart.markingsecondcolour_value,
	'mobile_value', obstacles.verticalstructurepart.mobile_value,
	'frangible_value', obstacles.verticalstructurepart.frangible_value,
	'visiblematerial_value', obstacles.verticalstructurepart.visiblematerial_value,
	'designator_value', obstacles.verticalstructurepart.designator_value,
	'point_attribute', json_agg(geometry.elevated_point_view.*),
	'curve_attribute', json_agg(geometry.elevated_curve_view.*),
	'surface_attribute', json_agg(geometry.elevated_surface_view.*)
) AS part
FROM obstacles.verticalstructurepart_pt
INNER JOIN obstacles.verticalstructurepart
	ON obstacles.verticalstructurepart_pt.verticalstructurepart_id = obstacles.verticalstructurepart.id
LEFT JOIN geometry.elevated_point_view
	ON obstacles.verticalstructurepart.horizontalprojection_location_id = geometry.elevated_point_view.id
LEFT JOIN geometry.elevated_curve_view
	ON obstacles.verticalstructurepart.horizontalprojection_linearextent_id = geometry.elevated_curve_view.id
LEFT JOIN geometry.elevated_surface_view
	ON obstacles.verticalstructurepart.horizontalprojection_surfaceextent_id = geometry.elevated_surface_view.id
GROUP BY
	obstacles.verticalstructurepart_pt.id,
	obstacles.verticalstructurepart.id,
	obstacles.verticalstructurepart.xml_id,
	obstacles.verticalstructurepart.verticalextent_value,
	obstacles.verticalstructurepart.verticalextent_uom,
	obstacles.verticalstructurepart.verticalextentaccuracy_value,
	obstacles.verticalstructurepart.verticalextentaccuracy_uom,
	obstacles.verticalstructurepart.type_value,
	obstacles.verticalstructurepart.constructionstatus_value,
	obstacles.verticalstructurepart.markingpattern_value,
	obstacles.verticalstructurepart.markingfirstcolour_value,
	obstacles.verticalstructurepart.markingsecondcolour_value,
	obstacles.verticalstructurepart.mobile_value,
	obstacles.verticalstructurepart.frangible_value,
	obstacles.verticalstructurepart.visiblematerial_value,
	obstacles.verticalstructurepart.designator_value;

CREATE MATERIALIZED VIEW obstacles.verticalstructure_view AS
SELECT 
	(row_number() OVER ())::integer AS row,
	obstacles.verticalstructure.id,
	obstacles.verticalstructure.identifier,
	obstacles.verticalstructure_ts.valid_time_begin,
	obstacles.verticalstructure_ts.valid_time_end,
	obstacles.verticalstructure_ts.feature_lifetime_begin,
	obstacles.verticalstructure_ts.feature_lifetime_end,
	obstacles.verticalstructure_ts.name_value, 
	obstacles.verticalstructure_ts.type_value,
	obstacles.verticalstructure_ts.lighted_value,
	obstacles.verticalstructure_ts.markingicaostandard_value,
	obstacles.verticalstructure_ts.group_value,
	obstacles.verticalstructure_ts.length_value,
	obstacles.verticalstructure_ts.length_uom,
	obstacles.verticalstructure_ts.width_value,
	obstacles.verticalstructure_ts.width_uom,
	obstacles.verticalstructure_ts.radius_value,
	obstacles.verticalstructure_ts.radius_uom,
	obstacles.verticalstructure_ts.lightingicaostandard_value,
	obstacles.verticalstructure_ts.synchronisedlighting_value,
	ST_Collect(verticalstructurepart_view.geom) AS geom,
	json_agg(verticalstructurepart_view.part) AS part,
	json_agg(notes.note_view.note_value) AS notes
FROM obstacles.verticalstructure
INNER JOIN public.verticalstructure_timeslice
ON obstacles.verticalstructure.id = verticalstructure_timeslice.verticalstructure_id
INNER JOIN obstacles.verticalstructure_tsp
ON verticalstructure_timeslice.verticalstructure_tsp_id = obstacles.verticalstructure_tsp.id
INNER JOIN obstacles.verticalstructure_ts
ON obstacles.verticalstructure_tsp.verticalstructuretimeslice_id = obstacles.verticalstructure_ts.id
INNER JOIN public.verticalstructure_ts_part
	ON obstacles.verticalstructure_ts.id = public.verticalstructure_ts_part.verticalstructure_ts_id
INNER JOIN obstacles.verticalstructurepart_view
	ON public.verticalstructure_ts_part.verticalstructurepart_pt_id = obstacles.verticalstructurepart_view.id
LEFT JOIN public.runway_ts_annotation
    ON obstacles.verticalstructure_ts.id = public.runway_ts_annotation.runway_ts_id
LEFT JOIN notes.note_view
    ON public.runway_ts_annotation.note_pt_id = notes.note_view.id
GROUP BY
	obstacles.verticalstructure.id,
	obstacles.verticalstructure.identifier,
	obstacles.verticalstructure_ts.valid_time_begin,
	obstacles.verticalstructure_ts.valid_time_end,
	obstacles.verticalstructure_ts.feature_lifetime_begin,
	obstacles.verticalstructure_ts.feature_lifetime_end,
	obstacles.verticalstructure_ts.name_value, 
	obstacles.verticalstructure_ts.type_value,
	obstacles.verticalstructure_ts.lighted_value,
	obstacles.verticalstructure_ts.markingicaostandard_value,
	obstacles.verticalstructure_ts.group_value,
	obstacles.verticalstructure_ts.length_value,
	obstacles.verticalstructure_ts.length_uom,
	obstacles.verticalstructure_ts.width_value,
	obstacles.verticalstructure_ts.width_uom,
	obstacles.verticalstructure_ts.radius_value,
	obstacles.verticalstructure_ts.radius_uom,
	obstacles.verticalstructure_ts.lightingicaostandard_value,
	obstacles.verticalstructure_ts.synchronisedlighting_value;