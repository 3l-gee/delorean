
create or replace view aerial_refuelling.aerialrefuellinganchor_view as
select
    aerial_refuelling.aerialrefuellinganchor_pt.id,
    jsonb_agg(notes.note_view.note) AS aerialrefuellinganchor_annotation,
    jsonb_build_object('nilreason', aerial_refuelling.aerialrefuellinganchor_pt.nilreason,
    'outboundcourse', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.outboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.outboundcourse_nilreason || ')'),
    'outboundcoursetype', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_nilreason || ')'),
    'inboundcourse', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.inboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.inboundcourse_nilreason || ')'),
    'turndirection', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.turndirection_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.turndirection_nilreason || ')'),
    'refuellingbaselevelreference', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_nilreason || ')'),
    'speedlimit', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.speedlimit_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.speedlimit_uom, '(' || aerial_refuelling.aerialrefuellinganchor.speedlimit_nilreason || ')'),
    'legseparation', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.legseparation_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.legseparation_uom, '(' || aerial_refuelling.aerialrefuellinganchor.legseparation_nilreason || ')'),
    'leglength', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.leglength_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.leglength_uom, '(' || aerial_refuelling.aerialrefuellinganchor.leglength_nilreason || ')'),
    'refuellingbaselevel', coalesce(cast(aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_uom, '(' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_nilreason || ')')  ) AS json_data
from aerial_refuelling.aerialrefuellinganchor_pt 
inner join aerial_refuelling.aerialrefuellinganchor on aerial_refuelling.aerialrefuellinganchor_pt.aerialrefuellinganchor_id = aerial_refuelling.aerialrefuellinganchor.id
left join master_join mj1 on aerial_refuelling.aerialrefuellinganchor.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.airspacelayer.verticalextent
--object aerial_refuelling.aerialrefuellingpoint.point
--object notes.note.annotation
group by
    aerial_refuelling.aerialrefuellinganchor_pt.id,
    aerial_refuelling.aerialrefuellinganchor_pt.nilreason,
    aerial_refuelling.aerialrefuellinganchor.outboundcourse_value,
    aerial_refuelling.aerialrefuellinganchor.outboundcourse_nilreason,
    aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_value,
    aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_nilreason,
    aerial_refuelling.aerialrefuellinganchor.inboundcourse_value,
    aerial_refuelling.aerialrefuellinganchor.inboundcourse_nilreason,
    aerial_refuelling.aerialrefuellinganchor.turndirection_value,
    aerial_refuelling.aerialrefuellinganchor.turndirection_nilreason,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_value,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_nilreason,
    aerial_refuelling.aerialrefuellinganchor.speedlimit_value,
    aerial_refuelling.aerialrefuellinganchor.speedlimit_uom,
    aerial_refuelling.aerialrefuellinganchor.speedlimit_nilreason,
    aerial_refuelling.aerialrefuellinganchor.legseparation_value,
    aerial_refuelling.aerialrefuellinganchor.legseparation_uom,
    aerial_refuelling.aerialrefuellinganchor.legseparation_nilreason,
    aerial_refuelling.aerialrefuellinganchor.leglength_value,
    aerial_refuelling.aerialrefuellinganchor.leglength_uom,
    aerial_refuelling.aerialrefuellinganchor.leglength_nilreason,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_value,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_uom,
    aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_nilreason;
create or replace view aerial_refuelling.aerialrefuellingpoint_view as
select
    aerial_refuelling.aerialrefuellingpoint_pt.id,
    jsonb_agg(notes.note_view.note) AS aerialrefuellingpoint_annotation,
    jsonb_build_object('nilreason', aerial_refuelling.aerialrefuellingpoint_pt.nilreason,
    'reportingatc', coalesce(cast(aerial_refuelling.aerialrefuellingpoint.reportingatc_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.reportingatc_nilreason || ')'),
    'flyover', coalesce(cast(aerial_refuelling.aerialrefuellingpoint.flyover_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.flyover_nilreason || ')'),
    'waypoint', coalesce(cast(aerial_refuelling.aerialrefuellingpoint.waypoint_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.waypoint_nilreason || ')'),
    'radarguidance', coalesce(cast(aerial_refuelling.aerialrefuellingpoint.radarguidance_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.radarguidance_nilreason || ')'),
    'sequence', coalesce(cast(aerial_refuelling.aerialrefuellingpoint.sequence_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.sequence_nilreason || ')'),
    'usagetype', coalesce(cast(aerial_refuelling.aerialrefuellingpoint.usagetype_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.usagetype_nilreason || ')')  ) AS json_data
from aerial_refuelling.aerialrefuellingpoint_pt 
inner join aerial_refuelling.aerialrefuellingpoint on aerial_refuelling.aerialrefuellingpoint_pt.aerialrefuellingpoint_id = aerial_refuelling.aerialrefuellingpoint.id
left join master_join mj1 on aerial_refuelling.aerialrefuellingpoint.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object navaids_points.pointreference.facilitymakeup
--object notes.note.annotation
group by
    aerial_refuelling.aerialrefuellingpoint_pt.id,
    aerial_refuelling.aerialrefuellingpoint_pt.nilreason,
    aerial_refuelling.aerialrefuellingpoint.reportingatc_value,
    aerial_refuelling.aerialrefuellingpoint.reportingatc_nilreason,
    aerial_refuelling.aerialrefuellingpoint.flyover_value,
    aerial_refuelling.aerialrefuellingpoint.flyover_nilreason,
    aerial_refuelling.aerialrefuellingpoint.waypoint_value,
    aerial_refuelling.aerialrefuellingpoint.waypoint_nilreason,
    aerial_refuelling.aerialrefuellingpoint.radarguidance_value,
    aerial_refuelling.aerialrefuellingpoint.radarguidance_nilreason,
    aerial_refuelling.aerialrefuellingpoint.sequence_value,
    aerial_refuelling.aerialrefuellingpoint.sequence_nilreason,
    aerial_refuelling.aerialrefuellingpoint.usagetype_value,
    aerial_refuelling.aerialrefuellingpoint.usagetype_nilreason;
create or replace view aerial_refuelling.aerialrefuellingtrack_view as
select
    aerial_refuelling.aerialrefuellingtrack_pt.id,
    jsonb_agg(notes.note_view.note) AS aerialrefuellingtrack_annotation,
    jsonb_build_object('nilreason', aerial_refuelling.aerialrefuellingtrack_pt.nilreason  ) AS json_data
from aerial_refuelling.aerialrefuellingtrack_pt 
inner join aerial_refuelling.aerialrefuellingtrack on aerial_refuelling.aerialrefuellingtrack_pt.aerialrefuellingtrack_id = aerial_refuelling.aerialrefuellingtrack.id
left join master_join mj1 on aerial_refuelling.aerialrefuellingtrack.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object aerial_refuelling.aerialrefuellingpoint.point
--object shared.airspacelayer.verticalextent
--object notes.note.annotation
group by
    aerial_refuelling.aerialrefuellingtrack_pt.id,
    aerial_refuelling.aerialrefuellingtrack_pt.nilreason;
create or replace view shared.aircraftcharacteristic_view as
select
    shared.aircraftcharacteristic_pt.id,
    jsonb_agg(notes.note_view.note) AS aircraftcharacteristic_annotation,
    jsonb_build_object('nilreason', shared.aircraftcharacteristic_pt.nilreason,
    'type', coalesce(cast(shared.aircraftcharacteristic.type_value as varchar), '(' || shared.aircraftcharacteristic.type_nilreason || ')'),
    'engine', coalesce(cast(shared.aircraftcharacteristic.engine_value as varchar), '(' || shared.aircraftcharacteristic.engine_nilreason || ')'),
    'numberengine', coalesce(cast(shared.aircraftcharacteristic.numberengine_value as varchar), '(' || shared.aircraftcharacteristic.numberengine_nilreason || ')'),
    'typeaircrafticao', coalesce(cast(shared.aircraftcharacteristic.typeaircrafticao_value as varchar), '(' || shared.aircraftcharacteristic.typeaircrafticao_nilreason || ')'),
    'aircraftlandingcategory', coalesce(cast(shared.aircraftcharacteristic.aircraftlandingcategory_value as varchar), '(' || shared.aircraftcharacteristic.aircraftlandingcategory_nilreason || ')'),
    'wingspaninterpretation', coalesce(cast(shared.aircraftcharacteristic.wingspaninterpretation_value as varchar), '(' || shared.aircraftcharacteristic.wingspaninterpretation_nilreason || ')'),
    'classwingspan', coalesce(cast(shared.aircraftcharacteristic.classwingspan_value as varchar), '(' || shared.aircraftcharacteristic.classwingspan_nilreason || ')'),
    'weightinterpretation', coalesce(cast(shared.aircraftcharacteristic.weightinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.weightinterpretation_nilreason || ')'),
    'passengers', coalesce(cast(shared.aircraftcharacteristic.passengers_value as varchar), '(' || shared.aircraftcharacteristic.passengers_nilreason || ')'),
    'passengersinterpretation', coalesce(cast(shared.aircraftcharacteristic.passengersinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.passengersinterpretation_nilreason || ')'),
    'speedinterpretation', coalesce(cast(shared.aircraftcharacteristic.speedinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.speedinterpretation_nilreason || ')'),
    'waketurbulence', coalesce(cast(shared.aircraftcharacteristic.waketurbulence_value as varchar), '(' || shared.aircraftcharacteristic.waketurbulence_nilreason || ')'),
    'navigationequipment', coalesce(cast(shared.aircraftcharacteristic.navigationequipment_value as varchar), '(' || shared.aircraftcharacteristic.navigationequipment_nilreason || ')'),
    'navigationspecification', coalesce(cast(shared.aircraftcharacteristic.navigationspecification_value as varchar), '(' || shared.aircraftcharacteristic.navigationspecification_nilreason || ')'),
    'verticalseparationcapability', coalesce(cast(shared.aircraftcharacteristic.verticalseparationcapability_value as varchar), '(' || shared.aircraftcharacteristic.verticalseparationcapability_nilreason || ')'),
    'anticollisionandseparationequipment', coalesce(cast(shared.aircraftcharacteristic.anticollisionandseparationequipment_value as varchar), '(' || shared.aircraftcharacteristic.anticollisionandseparationequipment_nilreason || ')'),
    'communicationequipment', coalesce(cast(shared.aircraftcharacteristic.communicationequipment_value as varchar), '(' || shared.aircraftcharacteristic.communicationequipment_nilreason || ')'),
    'surveillanceequipment', coalesce(cast(shared.aircraftcharacteristic.surveillanceequipment_value as varchar), '(' || shared.aircraftcharacteristic.surveillanceequipment_nilreason || ')'),
    'wingspan', coalesce(cast(shared.aircraftcharacteristic.wingspan_value as varchar) || ' ' || shared.aircraftcharacteristic.wingspan_uom, '(' || shared.aircraftcharacteristic.wingspan_nilreason || ')'),
    'weight', coalesce(cast(shared.aircraftcharacteristic.weight_value as varchar) || ' ' || shared.aircraftcharacteristic.weight_uom, '(' || shared.aircraftcharacteristic.weight_nilreason || ')'),
    'speed', coalesce(cast(shared.aircraftcharacteristic.speed_value as varchar) || ' ' || shared.aircraftcharacteristic.speed_uom, '(' || shared.aircraftcharacteristic.speed_nilreason || ')')  ) AS json_data
from shared.aircraftcharacteristic_pt 
inner join shared.aircraftcharacteristic on shared.aircraftcharacteristic_pt.aircraftcharacteristic_id = shared.aircraftcharacteristic.id
left join master_join mj1 on shared.aircraftcharacteristic.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.aircraftcharacteristic_pt.id,
    shared.aircraftcharacteristic_pt.nilreason,
    shared.aircraftcharacteristic.type_value,
    shared.aircraftcharacteristic.type_nilreason,
    shared.aircraftcharacteristic.engine_value,
    shared.aircraftcharacteristic.engine_nilreason,
    shared.aircraftcharacteristic.numberengine_value,
    shared.aircraftcharacteristic.numberengine_nilreason,
    shared.aircraftcharacteristic.typeaircrafticao_value,
    shared.aircraftcharacteristic.typeaircrafticao_nilreason,
    shared.aircraftcharacteristic.aircraftlandingcategory_value,
    shared.aircraftcharacteristic.aircraftlandingcategory_nilreason,
    shared.aircraftcharacteristic.wingspaninterpretation_value,
    shared.aircraftcharacteristic.wingspaninterpretation_nilreason,
    shared.aircraftcharacteristic.classwingspan_value,
    shared.aircraftcharacteristic.classwingspan_nilreason,
    shared.aircraftcharacteristic.weightinterpretation_value,
    shared.aircraftcharacteristic.weightinterpretation_nilreason,
    shared.aircraftcharacteristic.passengers_value,
    shared.aircraftcharacteristic.passengers_nilreason,
    shared.aircraftcharacteristic.passengersinterpretation_value,
    shared.aircraftcharacteristic.passengersinterpretation_nilreason,
    shared.aircraftcharacteristic.speedinterpretation_value,
    shared.aircraftcharacteristic.speedinterpretation_nilreason,
    shared.aircraftcharacteristic.waketurbulence_value,
    shared.aircraftcharacteristic.waketurbulence_nilreason,
    shared.aircraftcharacteristic.navigationequipment_value,
    shared.aircraftcharacteristic.navigationequipment_nilreason,
    shared.aircraftcharacteristic.navigationspecification_value,
    shared.aircraftcharacteristic.navigationspecification_nilreason,
    shared.aircraftcharacteristic.verticalseparationcapability_value,
    shared.aircraftcharacteristic.verticalseparationcapability_nilreason,
    shared.aircraftcharacteristic.anticollisionandseparationequipment_value,
    shared.aircraftcharacteristic.anticollisionandseparationequipment_nilreason,
    shared.aircraftcharacteristic.communicationequipment_value,
    shared.aircraftcharacteristic.communicationequipment_nilreason,
    shared.aircraftcharacteristic.surveillanceequipment_value,
    shared.aircraftcharacteristic.surveillanceequipment_nilreason,
    shared.aircraftcharacteristic.wingspan_value,
    shared.aircraftcharacteristic.wingspan_uom,
    shared.aircraftcharacteristic.wingspan_nilreason,
    shared.aircraftcharacteristic.weight_value,
    shared.aircraftcharacteristic.weight_uom,
    shared.aircraftcharacteristic.weight_nilreason,
    shared.aircraftcharacteristic.speed_value,
    shared.aircraftcharacteristic.speed_uom,
    shared.aircraftcharacteristic.speed_nilreason;
create or replace view airport_heliport.aircraftstandcontamination_view as
select
    airport_heliport.aircraftstandcontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS aircraftstandcontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.aircraftstandcontamination_pt.nilreason,
    'frictioncoefficient', coalesce(cast(airport_heliport.aircraftstandcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictioncoefficient_nilreason || ')'),
    'frictionestimation', coalesce(cast(airport_heliport.aircraftstandcontamination.frictionestimation_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictionestimation_nilreason || ')'),
    'frictiondevice', coalesce(cast(airport_heliport.aircraftstandcontamination.frictiondevice_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictiondevice_nilreason || ')'),
    'obscuredlights', coalesce(cast(airport_heliport.aircraftstandcontamination.obscuredlights_value as varchar), '(' || airport_heliport.aircraftstandcontamination.obscuredlights_nilreason || ')'),
    'furtherclearancetime', coalesce(cast(airport_heliport.aircraftstandcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.aircraftstandcontamination.furtherclearancetime_nilreason || ')'),
    'furthertotalclearance', coalesce(cast(airport_heliport.aircraftstandcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.aircraftstandcontamination.furthertotalclearance_nilreason || ')'),
    'proportion', coalesce(cast(airport_heliport.aircraftstandcontamination.proportion_value as varchar), '(' || airport_heliport.aircraftstandcontamination.proportion_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.aircraftstandcontamination.depth_value as varchar) || ' ' || airport_heliport.aircraftstandcontamination.depth_uom, '(' || airport_heliport.aircraftstandcontamination.depth_nilreason || ')')  ) AS json_data
from airport_heliport.aircraftstandcontamination_pt 
inner join airport_heliport.aircraftstandcontamination on airport_heliport.aircraftstandcontamination_pt.aircraftstandcontamination_id = airport_heliport.aircraftstandcontamination.id
left join master_join mj1 on airport_heliport.aircraftstandcontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.ridge.criticalridge
--object airport_heliport.surfacecontaminationlayer.layer
--object notes.note.annotation
group by
    airport_heliport.aircraftstandcontamination_pt.id,
    airport_heliport.aircraftstandcontamination_pt.nilreason,
    airport_heliport.aircraftstandcontamination.frictioncoefficient_value,
    airport_heliport.aircraftstandcontamination.frictioncoefficient_nilreason,
    airport_heliport.aircraftstandcontamination.frictionestimation_value,
    airport_heliport.aircraftstandcontamination.frictionestimation_nilreason,
    airport_heliport.aircraftstandcontamination.frictiondevice_value,
    airport_heliport.aircraftstandcontamination.frictiondevice_nilreason,
    airport_heliport.aircraftstandcontamination.obscuredlights_value,
    airport_heliport.aircraftstandcontamination.obscuredlights_nilreason,
    airport_heliport.aircraftstandcontamination.furtherclearancetime_value,
    airport_heliport.aircraftstandcontamination.furtherclearancetime_nilreason,
    airport_heliport.aircraftstandcontamination.furthertotalclearance_value,
    airport_heliport.aircraftstandcontamination.furthertotalclearance_nilreason,
    airport_heliport.aircraftstandcontamination.proportion_value,
    airport_heliport.aircraftstandcontamination.proportion_nilreason,
    airport_heliport.aircraftstandcontamination.depth_value,
    airport_heliport.aircraftstandcontamination.depth_uom,
    airport_heliport.aircraftstandcontamination.depth_nilreason;
create or replace view airport_heliport.airportheliportavailability_view as
select
    airport_heliport.airportheliportavailability_pt.id,
    jsonb_agg(notes.note_view.note) AS airportheliportavailability_annotation,
    jsonb_build_object('nilreason', airport_heliport.airportheliportavailability_pt.nilreason,
    'operationalstatus', coalesce(cast(airport_heliport.airportheliportavailability.operationalstatus_value as varchar), '(' || airport_heliport.airportheliportavailability.operationalstatus_nilreason || ')'),
    'warning', coalesce(cast(airport_heliport.airportheliportavailability.warning_value as varchar), '(' || airport_heliport.airportheliportavailability.warning_nilreason || ')')  ) AS json_data
from airport_heliport.airportheliportavailability_pt 
inner join airport_heliport.airportheliportavailability on airport_heliport.airportheliportavailability_pt.airportheliportavailability_id = airport_heliport.airportheliportavailability.id
left join master_join mj1 on airport_heliport.airportheliportavailability.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object airport_heliport.airportheliportusage.usage
group by
    airport_heliport.airportheliportavailability_pt.id,
    airport_heliport.airportheliportavailability_pt.nilreason,
    airport_heliport.airportheliportavailability.operationalstatus_value,
    airport_heliport.airportheliportavailability.operationalstatus_nilreason,
    airport_heliport.airportheliportavailability.warning_value,
    airport_heliport.airportheliportavailability.warning_nilreason;
create or replace view airport_heliport.airportheliportcontamination_view as
select
    airport_heliport.airportheliportcontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS airportheliportcontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.airportheliportcontamination_pt.nilreason,
    'frictioncoefficient', coalesce(cast(airport_heliport.airportheliportcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictioncoefficient_nilreason || ')'),
    'frictionestimation', coalesce(cast(airport_heliport.airportheliportcontamination.frictionestimation_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictionestimation_nilreason || ')'),
    'frictiondevice', coalesce(cast(airport_heliport.airportheliportcontamination.frictiondevice_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictiondevice_nilreason || ')'),
    'obscuredlights', coalesce(cast(airport_heliport.airportheliportcontamination.obscuredlights_value as varchar), '(' || airport_heliport.airportheliportcontamination.obscuredlights_nilreason || ')'),
    'furtherclearancetime', coalesce(cast(airport_heliport.airportheliportcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.airportheliportcontamination.furtherclearancetime_nilreason || ')'),
    'furthertotalclearance', coalesce(cast(airport_heliport.airportheliportcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.airportheliportcontamination.furthertotalclearance_nilreason || ')'),
    'proportion', coalesce(cast(airport_heliport.airportheliportcontamination.proportion_value as varchar), '(' || airport_heliport.airportheliportcontamination.proportion_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.airportheliportcontamination.depth_value as varchar) || ' ' || airport_heliport.airportheliportcontamination.depth_uom, '(' || airport_heliport.airportheliportcontamination.depth_nilreason || ')')  ) AS json_data
from airport_heliport.airportheliportcontamination_pt 
inner join airport_heliport.airportheliportcontamination on airport_heliport.airportheliportcontamination_pt.airportheliportcontamination_id = airport_heliport.airportheliportcontamination.id
left join master_join mj1 on airport_heliport.airportheliportcontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.ridge.criticalridge
--object airport_heliport.surfacecontaminationlayer.layer
--object notes.note.annotation
group by
    airport_heliport.airportheliportcontamination_pt.id,
    airport_heliport.airportheliportcontamination_pt.nilreason,
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
    airport_heliport.airportheliportcontamination.proportion_value,
    airport_heliport.airportheliportcontamination.proportion_nilreason,
    airport_heliport.airportheliportcontamination.depth_value,
    airport_heliport.airportheliportcontamination.depth_uom,
    airport_heliport.airportheliportcontamination.depth_nilreason;
create or replace view airport_heliport.airportheliportresponsibilityorganisation_view as
select
    airport_heliport.airportheliportresponsibilityorganisation_pt.id,
    jsonb_agg(notes.note_view.note) AS airportheliportresponsibilityorganisation_annotation,
    jsonb_build_object('nilreason', airport_heliport.airportheliportresponsibilityorganisation_pt.nilreason,
    'role', coalesce(cast(airport_heliport.airportheliportresponsibilityorganisation.role_value as varchar), '(' || airport_heliport.airportheliportresponsibilityorganisation.role_nilreason || ')')  ) AS json_data
from airport_heliport.airportheliportresponsibilityorganisation_pt 
inner join airport_heliport.airportheliportresponsibilityorganisation on airport_heliport.airportheliportresponsibilityorganisation_pt.airportheliportresponsibilityorganisation_id = airport_heliport.airportheliportresponsibilityorganisation.id
left join master_join mj1 on airport_heliport.airportheliportresponsibilityorganisation.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    airport_heliport.airportheliportresponsibilityorganisation_pt.id,
    airport_heliport.airportheliportresponsibilityorganisation_pt.nilreason,
    airport_heliport.airportheliportresponsibilityorganisation.role_value,
    airport_heliport.airportheliportresponsibilityorganisation.role_nilreason;
create or replace view airport_heliport.airportheliportusage_view as
select
    airport_heliport.airportheliportusage_pt.id,
    jsonb_agg(notes.note_view.note) AS airportheliportusage_annotation,
    jsonb_build_object('nilreason', airport_heliport.airportheliportusage_pt.nilreason,
    'type', coalesce(cast(airport_heliport.airportheliportusage.type_value as varchar), '(' || airport_heliport.airportheliportusage.type_nilreason || ')'),
    'operation', coalesce(cast(airport_heliport.airportheliportusage.operation_value as varchar), '(' || airport_heliport.airportheliportusage.operation_nilreason || ')'),
    'priorpermission', coalesce(cast(airport_heliport.airportheliportusage.priorpermission_value as varchar) || ' ' || airport_heliport.airportheliportusage.priorpermission_uom, '(' || airport_heliport.airportheliportusage.priorpermission_nilreason || ')'),
    'selection', airport_heliport.conditioncombination_view  ) AS json_data
from airport_heliport.airportheliportusage_pt 
inner join airport_heliport.airportheliportusage on airport_heliport.airportheliportusage_pt.airportheliportusage_id = airport_heliport.airportheliportusage.id
left join master_join mj1 on airport_heliport.airportheliportusage.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_yfuoqf on airport_heliport.airportheliportusage.selection_id = airport_heliport_conditioncombination_pt_yfuoqf.id
--object shared.contactinformation.contact
--object notes.note.annotation
group by
    airport_heliport.airportheliportusage_pt.id,
    airport_heliport.airportheliportusage_pt.nilreason,
    airport_heliport.airportheliportusage.type_value,
    airport_heliport.airportheliportusage.type_nilreason,
    airport_heliport.airportheliportusage.operation_value,
    airport_heliport.airportheliportusage.operation_nilreason,
    airport_heliport.airportheliportusage.priorpermission_value,
    airport_heliport.airportheliportusage.priorpermission_uom,
    airport_heliport.airportheliportusage.priorpermission_nilreason;
create or replace view airspace.airspaceactivation_view as
select
    airspace.airspaceactivation_pt.id,
    jsonb_agg(notes.note_view.note) AS airspaceactivation_annotation,
    jsonb_build_object('nilreason', airspace.airspaceactivation_pt.nilreason,
    'activity', coalesce(cast(airspace.airspaceactivation.activity_value as varchar), '(' || airspace.airspaceactivation.activity_nilreason || ')'),
    'status', coalesce(cast(airspace.airspaceactivation.status_value as varchar), '(' || airspace.airspaceactivation.status_nilreason || ')')  ) AS json_data
from airspace.airspaceactivation_pt 
inner join airspace.airspaceactivation on airspace.airspaceactivation_pt.airspaceactivation_id = airspace.airspaceactivation.id
left join master_join mj1 on airspace.airspaceactivation.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object shared.airspacelayer.levels
--object shared.aircraftcharacteristic.aircraft
group by
    airspace.airspaceactivation_pt.id,
    airspace.airspaceactivation_pt.nilreason,
    airspace.airspaceactivation.activity_value,
    airspace.airspaceactivation.activity_nilreason,
    airspace.airspaceactivation.status_value,
    airspace.airspaceactivation.status_nilreason;
create or replace view airspace.airspacegeometrycomponent_view as
select
    airspace.airspacegeometrycomponent_pt.id,
    jsonb_agg(notes.note_view.note) AS airspacegeometrycomponent_annotation,
    jsonb_build_object('nilreason', airspace.airspacegeometrycomponent_pt.nilreason,
    'operation', coalesce(cast(airspace.airspacegeometrycomponent.operation_value as varchar), '(' || airspace.airspacegeometrycomponent.operation_nilreason || ')'),
    'operationsequence', coalesce(cast(airspace.airspacegeometrycomponent.operationsequence_value as varchar), '(' || airspace.airspacegeometrycomponent.operationsequence_nilreason || ')'),
    'theairspacevolume', airspace.airspacevolume_view  ) AS json_data
from airspace.airspacegeometrycomponent_pt 
inner join airspace.airspacegeometrycomponent on airspace.airspacegeometrycomponent_pt.airspacegeometrycomponent_id = airspace.airspacegeometrycomponent.id
left join master_join mj1 on airspace.airspacegeometrycomponent.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join airspace.airspacevolume_pt airspace_airspacevolume_pt_yrbnac on airspace.airspacegeometrycomponent.theairspacevolume_id = airspace_airspacevolume_pt_yrbnac.id
--object notes.note.annotation
group by
    airspace.airspacegeometrycomponent_pt.id,
    airspace.airspacegeometrycomponent_pt.nilreason,
    airspace.airspacegeometrycomponent.operation_value,
    airspace.airspacegeometrycomponent.operation_nilreason,
    airspace.airspacegeometrycomponent.operationsequence_value,
    airspace.airspacegeometrycomponent.operationsequence_nilreason;
create or replace view airspace.airspacelayerclass_view as
select
    airspace.airspacelayerclass_pt.id,
    jsonb_agg(notes.note_view.note) AS airspacelayerclass_annotation,
    jsonb_build_object('nilreason', airspace.airspacelayerclass_pt.nilreason,
    'classification', coalesce(cast(airspace.airspacelayerclass.classification_value as varchar), '(' || airspace.airspacelayerclass.classification_nilreason || ')')  ) AS json_data
from airspace.airspacelayerclass_pt 
inner join airspace.airspacelayerclass on airspace.airspacelayerclass_pt.airspacelayerclass_id = airspace.airspacelayerclass.id
left join master_join mj1 on airspace.airspacelayerclass.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object shared.airspacelayer.associatedlevels
group by
    airspace.airspacelayerclass_pt.id,
    airspace.airspacelayerclass_pt.nilreason,
    airspace.airspacelayerclass.classification_value,
    airspace.airspacelayerclass.classification_nilreason;
create or replace view shared.airspacelayer_view as
select
    shared.airspacelayer_pt.id,
    jsonb_agg(notes.note_view.note) AS airspacelayer_annotation,
    jsonb_build_object('nilreason', shared.airspacelayer_pt.nilreason,
    'upperlimitreference', coalesce(cast(shared.airspacelayer.upperlimitreference_value as varchar), '(' || shared.airspacelayer.upperlimitreference_nilreason || ')'),
    'lowerlimitreference', coalesce(cast(shared.airspacelayer.lowerlimitreference_value as varchar), '(' || shared.airspacelayer.lowerlimitreference_nilreason || ')'),
    'altitudeinterpretation', coalesce(cast(shared.airspacelayer.altitudeinterpretation_value as varchar), '(' || shared.airspacelayer.altitudeinterpretation_nilreason || ')'),
    'upperlimit', coalesce(cast(shared.airspacelayer.upperlimit_value as varchar) || ' ' || shared.airspacelayer.upperlimit_uom, '(' || shared.airspacelayer.upperlimit_nilreason || ')'),
    'lowerlimit', coalesce(cast(shared.airspacelayer.lowerlimit_value as varchar) || ' ' || shared.airspacelayer.lowerlimit_uom, '(' || shared.airspacelayer.lowerlimit_nilreason || ')')  ) AS json_data
from shared.airspacelayer_pt 
inner join shared.airspacelayer on shared.airspacelayer_pt.airspacelayer_id = shared.airspacelayer.id
left join master_join mj1 on shared.airspacelayer.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.airspacelayer_pt.id,
    shared.airspacelayer_pt.nilreason,
    shared.airspacelayer.upperlimitreference_value,
    shared.airspacelayer.upperlimitreference_nilreason,
    shared.airspacelayer.lowerlimitreference_value,
    shared.airspacelayer.lowerlimitreference_nilreason,
    shared.airspacelayer.altitudeinterpretation_value,
    shared.airspacelayer.altitudeinterpretation_nilreason,
    shared.airspacelayer.upperlimit_value,
    shared.airspacelayer.upperlimit_uom,
    shared.airspacelayer.upperlimit_nilreason,
    shared.airspacelayer.lowerlimit_value,
    shared.airspacelayer.lowerlimit_uom,
    shared.airspacelayer.lowerlimit_nilreason;
create or replace view airspace.airspacevolumedependency_view as
select
    airspace.airspacevolumedependency_pt.id,
    jsonb_agg(notes.note_view.note) AS airspacevolumedependency_annotation,
    jsonb_build_object('nilreason', airspace.airspacevolumedependency_pt.nilreason,
    'dependency', coalesce(cast(airspace.airspacevolumedependency.dependency_value as varchar), '(' || airspace.airspacevolumedependency.dependency_nilreason || ')')  ) AS json_data
from airspace.airspacevolumedependency_pt 
inner join airspace.airspacevolumedependency on airspace.airspacevolumedependency_pt.airspacevolumedependency_id = airspace.airspacevolumedependency.id
left join master_join mj1 on airspace.airspacevolumedependency.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airspace.airspacevolumedependency_pt.id,
    airspace.airspacevolumedependency_pt.nilreason,
    airspace.airspacevolumedependency.dependency_value,
    airspace.airspacevolumedependency.dependency_nilreason;
create or replace view airspace.airspacevolume_view as
select
    airspace.airspacevolume_pt.id,
    jsonb_agg(notes.note_view.note) AS airspacevolume_annotation,
    jsonb_build_object('nilreason', airspace.airspacevolume_pt.nilreason,
    'upperlimitreference', coalesce(cast(airspace.airspacevolume.upperlimitreference_value as varchar), '(' || airspace.airspacevolume.upperlimitreference_nilreason || ')'),
    'maximumlimitreference', coalesce(cast(airspace.airspacevolume.maximumlimitreference_value as varchar), '(' || airspace.airspacevolume.maximumlimitreference_nilreason || ')'),
    'lowerlimitreference', coalesce(cast(airspace.airspacevolume.lowerlimitreference_value as varchar), '(' || airspace.airspacevolume.lowerlimitreference_nilreason || ')'),
    'minimumlimitreference', coalesce(cast(airspace.airspacevolume.minimumlimitreference_value as varchar), '(' || airspace.airspacevolume.minimumlimitreference_nilreason || ')'),
    'upperlimit', coalesce(cast(airspace.airspacevolume.upperlimit_value as varchar) || ' ' || airspace.airspacevolume.upperlimit_uom, '(' || airspace.airspacevolume.upperlimit_nilreason || ')'),
    'maximumlimit', coalesce(cast(airspace.airspacevolume.maximumlimit_value as varchar) || ' ' || airspace.airspacevolume.maximumlimit_uom, '(' || airspace.airspacevolume.maximumlimit_nilreason || ')'),
    'lowerlimit', coalesce(cast(airspace.airspacevolume.lowerlimit_value as varchar) || ' ' || airspace.airspacevolume.lowerlimit_uom, '(' || airspace.airspacevolume.lowerlimit_nilreason || ')'),
    'minimumlimit', coalesce(cast(airspace.airspacevolume.minimumlimit_value as varchar) || ' ' || airspace.airspacevolume.minimumlimit_uom, '(' || airspace.airspacevolume.minimumlimit_nilreason || ')'),
    'width', coalesce(cast(airspace.airspacevolume.width_value as varchar) || ' ' || airspace.airspacevolume.width_uom, '(' || airspace.airspacevolume.width_nilreason || ')'),
    'contributorairspace', airspace.airspacevolumedependency_view  ) AS json_data
from airspace.airspacevolume_pt 
inner join airspace.airspacevolume on airspace.airspacevolume_pt.airspacevolume_id = airspace.airspacevolume.id
left join master_join mj1 on airspace.airspacevolume.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join airspace.airspacevolumedependency_pt airspace_airspacevolumedependency_pt_lqtinn on airspace.airspacevolume.contributorairspace_id = airspace_airspacevolumedependency_pt_lqtinn.id
--object notes.note.annotation
group by
    airspace.airspacevolume_pt.id,
    airspace.airspacevolume_pt.nilreason,
    airspace.airspacevolume.upperlimitreference_value,
    airspace.airspacevolume.upperlimitreference_nilreason,
    airspace.airspacevolume.maximumlimitreference_value,
    airspace.airspacevolume.maximumlimitreference_nilreason,
    airspace.airspacevolume.lowerlimitreference_value,
    airspace.airspacevolume.lowerlimitreference_nilreason,
    airspace.airspacevolume.minimumlimitreference_value,
    airspace.airspacevolume.minimumlimitreference_nilreason,
    airspace.airspacevolume.upperlimit_value,
    airspace.airspacevolume.upperlimit_uom,
    airspace.airspacevolume.upperlimit_nilreason,
    airspace.airspacevolume.maximumlimit_value,
    airspace.airspacevolume.maximumlimit_uom,
    airspace.airspacevolume.maximumlimit_nilreason,
    airspace.airspacevolume.lowerlimit_value,
    airspace.airspacevolume.lowerlimit_uom,
    airspace.airspacevolume.lowerlimit_nilreason,
    airspace.airspacevolume.minimumlimit_value,
    airspace.airspacevolume.minimumlimit_uom,
    airspace.airspacevolume.minimumlimit_nilreason,
    airspace.airspacevolume.width_value,
    airspace.airspacevolume.width_uom,
    airspace.airspacevolume.width_nilreason;
create or replace view airport_heliport.altimetersourcestatus_view as
select
    airport_heliport.altimetersourcestatus_pt.id,
    jsonb_agg(notes.note_view.note) AS altimetersourcestatus_annotation,
    jsonb_build_object('nilreason', airport_heliport.altimetersourcestatus_pt.nilreason,
    'operationalstatus', coalesce(cast(airport_heliport.altimetersourcestatus.operationalstatus_value as varchar), '(' || airport_heliport.altimetersourcestatus.operationalstatus_nilreason || ')')  ) AS json_data
from airport_heliport.altimetersourcestatus_pt 
inner join airport_heliport.altimetersourcestatus on airport_heliport.altimetersourcestatus_pt.altimetersourcestatus_id = airport_heliport.altimetersourcestatus.id
left join master_join mj1 on airport_heliport.altimetersourcestatus.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    airport_heliport.altimetersourcestatus_pt.id,
    airport_heliport.altimetersourcestatus_pt.nilreason,
    airport_heliport.altimetersourcestatus.operationalstatus_value,
    airport_heliport.altimetersourcestatus.operationalstatus_nilreason;
create or replace view shared.altitudeadjustment_view as
select
    shared.altitudeadjustment_pt.id,
    jsonb_agg(notes.note_view.note) AS altitudeadjustment_annotation,
    jsonb_build_object('nilreason', shared.altitudeadjustment_pt.nilreason,
    'altitudeadjustmenttype', coalesce(cast(shared.altitudeadjustment.altitudeadjustmenttype_value as varchar), '(' || shared.altitudeadjustment.altitudeadjustmenttype_nilreason || ')'),
    'primaryalternateminimum', coalesce(cast(shared.altitudeadjustment.primaryalternateminimum_value as varchar), '(' || shared.altitudeadjustment.primaryalternateminimum_nilreason || ')'),
    'localremotecode', coalesce(cast(shared.altitudeadjustment.localremotecode_value as varchar), '(' || shared.altitudeadjustment.localremotecode_nilreason || ')'),
    'altitudeadjustment', coalesce(cast(shared.altitudeadjustment.altitudeadjustment_value as varchar) || ' ' || shared.altitudeadjustment.altitudeadjustment_uom, '(' || shared.altitudeadjustment.altitudeadjustment_nilreason || ')')  ) AS json_data
from shared.altitudeadjustment_pt 
inner join shared.altitudeadjustment on shared.altitudeadjustment_pt.altitudeadjustment_id = shared.altitudeadjustment.id
left join master_join mj1 on shared.altitudeadjustment.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.altitudeadjustment_pt.id,
    shared.altitudeadjustment_pt.nilreason,
    shared.altitudeadjustment.altitudeadjustmenttype_value,
    shared.altitudeadjustment.altitudeadjustmenttype_nilreason,
    shared.altitudeadjustment.primaryalternateminimum_value,
    shared.altitudeadjustment.primaryalternateminimum_nilreason,
    shared.altitudeadjustment.localremotecode_value,
    shared.altitudeadjustment.localremotecode_nilreason,
    shared.altitudeadjustment.altitudeadjustment_value,
    shared.altitudeadjustment.altitudeadjustment_uom,
    shared.altitudeadjustment.altitudeadjustment_nilreason;
create or replace view navaids_points.angleuse_view as
select
    navaids_points.angleuse_pt.id,
    jsonb_agg(notes.note_view.note) AS angleuse_annotation,
    jsonb_build_object('nilreason', navaids_points.angleuse_pt.nilreason,
    'alongcourseguidance', coalesce(cast(navaids_points.angleuse.alongcourseguidance_value as varchar), '(' || navaids_points.angleuse.alongcourseguidance_nilreason || ')')  ) AS json_data
from navaids_points.angleuse_pt 
inner join navaids_points.angleuse on navaids_points.angleuse_pt.angleuse_id = navaids_points.angleuse.id
left join master_join mj1 on navaids_points.angleuse.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    navaids_points.angleuse_pt.id,
    navaids_points.angleuse_pt.nilreason,
    navaids_points.angleuse.alongcourseguidance_value,
    navaids_points.angleuse.alongcourseguidance_nilreason;
create or replace view procedure.approachaltitudetable_view as
select
    procedure.approachaltitudetable_pt.id,
    jsonb_agg(notes.note_view.note) AS approachaltitudetable_annotation,
    jsonb_build_object('nilreason', procedure.approachaltitudetable_pt.nilreason,
    'measurementpoint', coalesce(cast(procedure.approachaltitudetable.measurementpoint_value as varchar), '(' || procedure.approachaltitudetable.measurementpoint_nilreason || ')'),
    'altitudereference', coalesce(cast(procedure.approachaltitudetable.altitudereference_value as varchar), '(' || procedure.approachaltitudetable.altitudereference_nilreason || ')'),
    'altitude', coalesce(cast(procedure.approachaltitudetable.altitude_value as varchar) || ' ' || procedure.approachaltitudetable.altitude_uom, '(' || procedure.approachaltitudetable.altitude_nilreason || ')')  ) AS json_data
from procedure.approachaltitudetable_pt 
inner join procedure.approachaltitudetable on procedure.approachaltitudetable_pt.approachaltitudetable_id = procedure.approachaltitudetable.id
left join master_join mj1 on procedure.approachaltitudetable.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.approachaltitudetable_pt.id,
    procedure.approachaltitudetable_pt.nilreason,
    procedure.approachaltitudetable.measurementpoint_value,
    procedure.approachaltitudetable.measurementpoint_nilreason,
    procedure.approachaltitudetable.altitudereference_value,
    procedure.approachaltitudetable.altitudereference_nilreason,
    procedure.approachaltitudetable.altitude_value,
    procedure.approachaltitudetable.altitude_uom,
    procedure.approachaltitudetable.altitude_nilreason;
create or replace view procedure.approachcondition_view as
select
    procedure.approachcondition_pt.id,
    jsonb_agg(notes.note_view.note) AS approachcondition_annotation,
    jsonb_build_object('nilreason', procedure.approachcondition_pt.nilreason,
    'finalapproachpath', coalesce(cast(procedure.approachcondition.finalapproachpath_value as varchar), '(' || procedure.approachcondition.finalapproachpath_nilreason || ')'),
    'requirednavigationperformance', coalesce(cast(procedure.approachcondition.requirednavigationperformance_value as varchar), '(' || procedure.approachcondition.requirednavigationperformance_nilreason || ')'),
    'climbgradient', coalesce(cast(procedure.approachcondition.climbgradient_value as varchar), '(' || procedure.approachcondition.climbgradient_nilreason || ')'),
    'minimumset', procedure.minima_view  ) AS json_data
from procedure.approachcondition_pt 
inner join procedure.approachcondition on procedure.approachcondition_pt.approachcondition_id = procedure.approachcondition.id
left join master_join mj1 on procedure.approachcondition.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join procedure.minima_pt procedure_minima_pt_qxobtw on procedure.approachcondition.minimumset_id = procedure_minima_pt_qxobtw.id
--object procedure.circlingrestriction.circlingrestriction
--object shared.aircraftcharacteristic.aircraftcategory
--object procedure.landingtakeoffareacollection.landingarea
--object shared.obstacleassessmentarea.designsurface
--object notes.note.annotation
group by
    procedure.approachcondition_pt.id,
    procedure.approachcondition_pt.nilreason,
    procedure.approachcondition.finalapproachpath_value,
    procedure.approachcondition.finalapproachpath_nilreason,
    procedure.approachcondition.requirednavigationperformance_value,
    procedure.approachcondition.requirednavigationperformance_nilreason,
    procedure.approachcondition.climbgradient_value,
    procedure.approachcondition.climbgradient_nilreason;
create or replace view procedure.approachdistancetable_view as
select
    procedure.approachdistancetable_pt.id,
    jsonb_agg(notes.note_view.note) AS approachdistancetable_annotation,
    jsonb_build_object('nilreason', procedure.approachdistancetable_pt.nilreason,
    'startingmeasurementpoint', coalesce(cast(procedure.approachdistancetable.startingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable.startingmeasurementpoint_nilreason || ')'),
    'endingmeasurementpoint', coalesce(cast(procedure.approachdistancetable.endingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable.endingmeasurementpoint_nilreason || ')'),
    'valuehat', coalesce(cast(procedure.approachdistancetable.valuehat_value as varchar) || ' ' || procedure.approachdistancetable.valuehat_uom, '(' || procedure.approachdistancetable.valuehat_nilreason || ')'),
    'distance', coalesce(cast(procedure.approachdistancetable.distance_value as varchar) || ' ' || procedure.approachdistancetable.distance_uom, '(' || procedure.approachdistancetable.distance_nilreason || ')')  ) AS json_data
from procedure.approachdistancetable_pt 
inner join procedure.approachdistancetable on procedure.approachdistancetable_pt.approachdistancetable_id = procedure.approachdistancetable.id
left join master_join mj1 on procedure.approachdistancetable.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.approachdistancetable_pt.id,
    procedure.approachdistancetable_pt.nilreason,
    procedure.approachdistancetable.startingmeasurementpoint_value,
    procedure.approachdistancetable.startingmeasurementpoint_nilreason,
    procedure.approachdistancetable.endingmeasurementpoint_value,
    procedure.approachdistancetable.endingmeasurementpoint_nilreason,
    procedure.approachdistancetable.valuehat_value,
    procedure.approachdistancetable.valuehat_uom,
    procedure.approachdistancetable.valuehat_nilreason,
    procedure.approachdistancetable.distance_value,
    procedure.approachdistancetable.distance_uom,
    procedure.approachdistancetable.distance_nilreason;
create or replace view procedure.approachtimingtable_view as
select
    procedure.approachtimingtable_pt.id,
    jsonb_agg(notes.note_view.note) AS approachtimingtable_annotation,
    jsonb_build_object('nilreason', procedure.approachtimingtable_pt.nilreason,
    'startingmeasurementpoint', coalesce(cast(procedure.approachtimingtable.startingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable.startingmeasurementpoint_nilreason || ')'),
    'endingmeasurementpoint', coalesce(cast(procedure.approachtimingtable.endingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable.endingmeasurementpoint_nilreason || ')'),
    'time', coalesce(cast(procedure.approachtimingtable.time_value as varchar) || ' ' || procedure.approachtimingtable.time_uom, '(' || procedure.approachtimingtable.time_nilreason || ')'),
    'speed', coalesce(cast(procedure.approachtimingtable.speed_value as varchar) || ' ' || procedure.approachtimingtable.speed_uom, '(' || procedure.approachtimingtable.speed_nilreason || ')')  ) AS json_data
from procedure.approachtimingtable_pt 
inner join procedure.approachtimingtable on procedure.approachtimingtable_pt.approachtimingtable_id = procedure.approachtimingtable.id
left join master_join mj1 on procedure.approachtimingtable.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.approachtimingtable_pt.id,
    procedure.approachtimingtable_pt.nilreason,
    procedure.approachtimingtable.startingmeasurementpoint_value,
    procedure.approachtimingtable.startingmeasurementpoint_nilreason,
    procedure.approachtimingtable.endingmeasurementpoint_value,
    procedure.approachtimingtable.endingmeasurementpoint_nilreason,
    procedure.approachtimingtable.time_value,
    procedure.approachtimingtable.time_uom,
    procedure.approachtimingtable.time_nilreason,
    procedure.approachtimingtable.speed_value,
    procedure.approachtimingtable.speed_uom,
    procedure.approachtimingtable.speed_nilreason;
create or replace view airport_heliport.apronareaavailability_view as
select
    airport_heliport.apronareaavailability_pt.id,
    jsonb_agg(notes.note_view.note) AS apronareaavailability_annotation,
    jsonb_build_object('nilreason', airport_heliport.apronareaavailability_pt.nilreason,
    'operationalstatus', coalesce(cast(airport_heliport.apronareaavailability.operationalstatus_value as varchar), '(' || airport_heliport.apronareaavailability.operationalstatus_nilreason || ')'),
    'warning', coalesce(cast(airport_heliport.apronareaavailability.warning_value as varchar), '(' || airport_heliport.apronareaavailability.warning_nilreason || ')')  ) AS json_data
from airport_heliport.apronareaavailability_pt 
inner join airport_heliport.apronareaavailability on airport_heliport.apronareaavailability_pt.apronareaavailability_id = airport_heliport.apronareaavailability.id
left join master_join mj1 on airport_heliport.apronareaavailability.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object airport_heliport.apronareausage.usage
group by
    airport_heliport.apronareaavailability_pt.id,
    airport_heliport.apronareaavailability_pt.nilreason,
    airport_heliport.apronareaavailability.operationalstatus_value,
    airport_heliport.apronareaavailability.operationalstatus_nilreason,
    airport_heliport.apronareaavailability.warning_value,
    airport_heliport.apronareaavailability.warning_nilreason;
create or replace view airport_heliport.apronareausage_view as
select
    airport_heliport.apronareausage_pt.id,
    jsonb_agg(notes.note_view.note) AS apronareausage_annotation,
    jsonb_build_object('nilreason', airport_heliport.apronareausage_pt.nilreason,
    'type', coalesce(cast(airport_heliport.apronareausage.type_value as varchar), '(' || airport_heliport.apronareausage.type_nilreason || ')'),
    'priorpermission', coalesce(cast(airport_heliport.apronareausage.priorpermission_value as varchar) || ' ' || airport_heliport.apronareausage.priorpermission_uom, '(' || airport_heliport.apronareausage.priorpermission_nilreason || ')'),
    'selection', airport_heliport.conditioncombination_view  ) AS json_data
from airport_heliport.apronareausage_pt 
inner join airport_heliport.apronareausage on airport_heliport.apronareausage_pt.apronareausage_id = airport_heliport.apronareausage.id
left join master_join mj1 on airport_heliport.apronareausage.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_jdlqba on airport_heliport.apronareausage.selection_id = airport_heliport_conditioncombination_pt_jdlqba.id
--object shared.contactinformation.contact
--object notes.note.annotation
group by
    airport_heliport.apronareausage_pt.id,
    airport_heliport.apronareausage_pt.nilreason,
    airport_heliport.apronareausage.type_value,
    airport_heliport.apronareausage.type_nilreason,
    airport_heliport.apronareausage.priorpermission_value,
    airport_heliport.apronareausage.priorpermission_uom,
    airport_heliport.apronareausage.priorpermission_nilreason;
create or replace view airport_heliport.aproncontamination_view as
select
    airport_heliport.aproncontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS aproncontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.aproncontamination_pt.nilreason,
    'frictioncoefficient', coalesce(cast(airport_heliport.aproncontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.aproncontamination.frictioncoefficient_nilreason || ')'),
    'frictionestimation', coalesce(cast(airport_heliport.aproncontamination.frictionestimation_value as varchar), '(' || airport_heliport.aproncontamination.frictionestimation_nilreason || ')'),
    'frictiondevice', coalesce(cast(airport_heliport.aproncontamination.frictiondevice_value as varchar), '(' || airport_heliport.aproncontamination.frictiondevice_nilreason || ')'),
    'obscuredlights', coalesce(cast(airport_heliport.aproncontamination.obscuredlights_value as varchar), '(' || airport_heliport.aproncontamination.obscuredlights_nilreason || ')'),
    'furtherclearancetime', coalesce(cast(airport_heliport.aproncontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.aproncontamination.furtherclearancetime_nilreason || ')'),
    'furthertotalclearance', coalesce(cast(airport_heliport.aproncontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.aproncontamination.furthertotalclearance_nilreason || ')'),
    'proportion', coalesce(cast(airport_heliport.aproncontamination.proportion_value as varchar), '(' || airport_heliport.aproncontamination.proportion_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.aproncontamination.depth_value as varchar) || ' ' || airport_heliport.aproncontamination.depth_uom, '(' || airport_heliport.aproncontamination.depth_nilreason || ')')  ) AS json_data
from airport_heliport.aproncontamination_pt 
inner join airport_heliport.aproncontamination on airport_heliport.aproncontamination_pt.aproncontamination_id = airport_heliport.aproncontamination.id
left join master_join mj1 on airport_heliport.aproncontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.ridge.criticalridge
--object airport_heliport.surfacecontaminationlayer.layer
--object notes.note.annotation
group by
    airport_heliport.aproncontamination_pt.id,
    airport_heliport.aproncontamination_pt.nilreason,
    airport_heliport.aproncontamination.frictioncoefficient_value,
    airport_heliport.aproncontamination.frictioncoefficient_nilreason,
    airport_heliport.aproncontamination.frictionestimation_value,
    airport_heliport.aproncontamination.frictionestimation_nilreason,
    airport_heliport.aproncontamination.frictiondevice_value,
    airport_heliport.aproncontamination.frictiondevice_nilreason,
    airport_heliport.aproncontamination.obscuredlights_value,
    airport_heliport.aproncontamination.obscuredlights_nilreason,
    airport_heliport.aproncontamination.furtherclearancetime_value,
    airport_heliport.aproncontamination.furtherclearancetime_nilreason,
    airport_heliport.aproncontamination.furthertotalclearance_value,
    airport_heliport.aproncontamination.furthertotalclearance_nilreason,
    airport_heliport.aproncontamination.proportion_value,
    airport_heliport.aproncontamination.proportion_nilreason,
    airport_heliport.aproncontamination.depth_value,
    airport_heliport.aproncontamination.depth_uom,
    airport_heliport.aproncontamination.depth_nilreason;
create or replace view aerial_refuelling.authorityforaerialrefuelling_view as
select
    aerial_refuelling.authorityforaerialrefuelling_pt.id,
    jsonb_agg(notes.note_view.note) AS authorityforaerialrefuelling_annotation,
    jsonb_build_object('nilreason', aerial_refuelling.authorityforaerialrefuelling_pt.nilreason,
    'type', coalesce(cast(aerial_refuelling.authorityforaerialrefuelling.type_value as varchar), '(' || aerial_refuelling.authorityforaerialrefuelling.type_nilreason || ')')  ) AS json_data
from aerial_refuelling.authorityforaerialrefuelling_pt 
inner join aerial_refuelling.authorityforaerialrefuelling on aerial_refuelling.authorityforaerialrefuelling_pt.authorityforaerialrefuelling_id = aerial_refuelling.authorityforaerialrefuelling.id
left join master_join mj1 on aerial_refuelling.authorityforaerialrefuelling.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    aerial_refuelling.authorityforaerialrefuelling_pt.id,
    aerial_refuelling.authorityforaerialrefuelling_pt.nilreason,
    aerial_refuelling.authorityforaerialrefuelling.type_value,
    aerial_refuelling.authorityforaerialrefuelling.type_nilreason;
create or replace view navaids_points.authorityfornavaidequipment_view as
select
    navaids_points.authorityfornavaidequipment_pt.id,
    jsonb_agg(notes.note_view.note) AS authorityfornavaidequipment_annotation,
    jsonb_build_object('nilreason', navaids_points.authorityfornavaidequipment_pt.nilreason,
    'type', coalesce(cast(navaids_points.authorityfornavaidequipment.type_value as varchar), '(' || navaids_points.authorityfornavaidequipment.type_nilreason || ')')  ) AS json_data
from navaids_points.authorityfornavaidequipment_pt 
inner join navaids_points.authorityfornavaidequipment on navaids_points.authorityfornavaidequipment_pt.authorityfornavaidequipment_id = navaids_points.authorityfornavaidequipment.id
left join master_join mj1 on navaids_points.authorityfornavaidequipment.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    navaids_points.authorityfornavaidequipment_pt.id,
    navaids_points.authorityfornavaidequipment_pt.nilreason,
    navaids_points.authorityfornavaidequipment.type_value,
    navaids_points.authorityfornavaidequipment.type_nilreason;
create or replace view navaids_points.authorityforspecialnavigationstation_view as
select
    navaids_points.authorityforspecialnavigationstation_pt.id,
    jsonb_agg(notes.note_view.note) AS authorityforspecialnavigationstation_annotation,
    jsonb_build_object('nilreason', navaids_points.authorityforspecialnavigationstation_pt.nilreason,
    'type', coalesce(cast(navaids_points.authorityforspecialnavigationstation.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationstation.type_nilreason || ')')  ) AS json_data
from navaids_points.authorityforspecialnavigationstation_pt 
inner join navaids_points.authorityforspecialnavigationstation on navaids_points.authorityforspecialnavigationstation_pt.authorityforspecialnavigationstation_id = navaids_points.authorityforspecialnavigationstation.id
left join master_join mj1 on navaids_points.authorityforspecialnavigationstation.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    navaids_points.authorityforspecialnavigationstation_pt.id,
    navaids_points.authorityforspecialnavigationstation_pt.nilreason,
    navaids_points.authorityforspecialnavigationstation.type_value,
    navaids_points.authorityforspecialnavigationstation.type_nilreason;
create or replace view navaids_points.authorityforspecialnavigationsystem_view as
select
    navaids_points.authorityforspecialnavigationsystem_pt.id,
    jsonb_agg(notes.note_view.note) AS authorityforspecialnavigationsystem_annotation,
    jsonb_build_object('nilreason', navaids_points.authorityforspecialnavigationsystem_pt.nilreason,
    'type', coalesce(cast(navaids_points.authorityforspecialnavigationsystem.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationsystem.type_nilreason || ')')  ) AS json_data
from navaids_points.authorityforspecialnavigationsystem_pt 
inner join navaids_points.authorityforspecialnavigationsystem on navaids_points.authorityforspecialnavigationsystem_pt.authorityforspecialnavigationsystem_id = navaids_points.authorityforspecialnavigationsystem.id
left join master_join mj1 on navaids_points.authorityforspecialnavigationsystem.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    navaids_points.authorityforspecialnavigationsystem_pt.id,
    navaids_points.authorityforspecialnavigationsystem_pt.nilreason,
    navaids_points.authorityforspecialnavigationsystem.type_value,
    navaids_points.authorityforspecialnavigationsystem.type_nilreason;
create or replace view service.callsigndetail_view as
select
    service.callsigndetail_pt.id,
    jsonb_agg(notes.note_view.note) AS callsigndetail_annotation,
    jsonb_build_object('nilreason', service.callsigndetail_pt.nilreason,
    'callsign', coalesce(cast(service.callsigndetail.callsign_value as varchar), '(' || service.callsigndetail.callsign_nilreason || ')'),
    'language', coalesce(cast(service.callsigndetail.language_value as varchar), '(' || service.callsigndetail.language_nilreason || ')')  ) AS json_data
from service.callsigndetail_pt 
inner join service.callsigndetail on service.callsigndetail_pt.callsigndetail_id = service.callsigndetail.id
left join master_join mj1 on service.callsigndetail.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    service.callsigndetail_pt.id,
    service.callsigndetail_pt.nilreason,
    service.callsigndetail.callsign_value,
    service.callsigndetail.callsign_nilreason,
    service.callsigndetail.language_value,
    service.callsigndetail.language_nilreason;
create or replace view shared.circlesector_view as
select
    shared.circlesector_pt.id,
    jsonb_agg(notes.note_view.note) AS circlesector_annotation,
    jsonb_build_object('nilreason', shared.circlesector_pt.nilreason,
    'arcdirection', coalesce(cast(shared.circlesector.arcdirection_value as varchar), '(' || shared.circlesector.arcdirection_nilreason || ')'),
    'fromangle', coalesce(cast(shared.circlesector.fromangle_value as varchar), '(' || shared.circlesector.fromangle_nilreason || ')'),
    'toangle', coalesce(cast(shared.circlesector.toangle_value as varchar), '(' || shared.circlesector.toangle_nilreason || ')'),
    'angletype', coalesce(cast(shared.circlesector.angletype_value as varchar), '(' || shared.circlesector.angletype_nilreason || ')'),
    'angledirectionreference', coalesce(cast(shared.circlesector.angledirectionreference_value as varchar), '(' || shared.circlesector.angledirectionreference_nilreason || ')'),
    'upperlimitreference', coalesce(cast(shared.circlesector.upperlimitreference_value as varchar), '(' || shared.circlesector.upperlimitreference_nilreason || ')'),
    'lowerlimitreference', coalesce(cast(shared.circlesector.lowerlimitreference_value as varchar), '(' || shared.circlesector.lowerlimitreference_nilreason || ')'),
    'innerdistance', coalesce(cast(shared.circlesector.innerdistance_value as varchar) || ' ' || shared.circlesector.innerdistance_uom, '(' || shared.circlesector.innerdistance_nilreason || ')'),
    'outerdistance', coalesce(cast(shared.circlesector.outerdistance_value as varchar) || ' ' || shared.circlesector.outerdistance_uom, '(' || shared.circlesector.outerdistance_nilreason || ')'),
    'upperlimit', coalesce(cast(shared.circlesector.upperlimit_value as varchar) || ' ' || shared.circlesector.upperlimit_uom, '(' || shared.circlesector.upperlimit_nilreason || ')'),
    'lowerlimit', coalesce(cast(shared.circlesector.lowerlimit_value as varchar) || ' ' || shared.circlesector.lowerlimit_uom, '(' || shared.circlesector.lowerlimit_nilreason || ')')  ) AS json_data
from shared.circlesector_pt 
inner join shared.circlesector on shared.circlesector_pt.circlesector_id = shared.circlesector.id
left join master_join mj1 on shared.circlesector.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.circlesector_pt.id,
    shared.circlesector_pt.nilreason,
    shared.circlesector.arcdirection_value,
    shared.circlesector.arcdirection_nilreason,
    shared.circlesector.fromangle_value,
    shared.circlesector.fromangle_nilreason,
    shared.circlesector.toangle_value,
    shared.circlesector.toangle_nilreason,
    shared.circlesector.angletype_value,
    shared.circlesector.angletype_nilreason,
    shared.circlesector.angledirectionreference_value,
    shared.circlesector.angledirectionreference_nilreason,
    shared.circlesector.upperlimitreference_value,
    shared.circlesector.upperlimitreference_nilreason,
    shared.circlesector.lowerlimitreference_value,
    shared.circlesector.lowerlimitreference_nilreason,
    shared.circlesector.innerdistance_value,
    shared.circlesector.innerdistance_uom,
    shared.circlesector.innerdistance_nilreason,
    shared.circlesector.outerdistance_value,
    shared.circlesector.outerdistance_uom,
    shared.circlesector.outerdistance_nilreason,
    shared.circlesector.upperlimit_value,
    shared.circlesector.upperlimit_uom,
    shared.circlesector.upperlimit_nilreason,
    shared.circlesector.lowerlimit_value,
    shared.circlesector.lowerlimit_uom,
    shared.circlesector.lowerlimit_nilreason;
create or replace view procedure.circlingrestriction_view as
select
    procedure.circlingrestriction_pt.id,
    jsonb_agg(notes.note_view.note) AS circlingrestriction_annotation,
    jsonb_build_object('nilreason', procedure.circlingrestriction_pt.nilreason,
    'sectordescription', shared.circlesector_view  ) AS json_data
from procedure.circlingrestriction_pt 
inner join procedure.circlingrestriction on procedure.circlingrestriction_pt.circlingrestriction_id = procedure.circlingrestriction.id
left join master_join mj1 on procedure.circlingrestriction.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join shared.circlesector_pt shared_circlesector_pt_wrrxfe on procedure.circlingrestriction.sectordescription_id = shared_circlesector_pt_wrrxfe.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    procedure.circlingrestriction_pt.id,
    procedure.circlingrestriction_pt.nilreason;
create or replace view airport_heliport.city_view as
select
    airport_heliport.city_pt.id,
    jsonb_agg(notes.note_view.note) AS city_annotation,
    jsonb_build_object('nilreason', airport_heliport.city_pt.nilreason,
    'name', coalesce(cast(airport_heliport.city.name_value as varchar), '(' || airport_heliport.city.name_nilreason || ')')  ) AS json_data
from airport_heliport.city_pt 
inner join airport_heliport.city on airport_heliport.city_pt.city_id = airport_heliport.city.id
left join master_join mj1 on airport_heliport.city.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airport_heliport.city_pt.id,
    airport_heliport.city_pt.nilreason,
    airport_heliport.city.name_value,
    airport_heliport.city.name_nilreason;
create or replace view airport_heliport.conditioncombination_view as
select
    airport_heliport.conditioncombination_pt.id,
    jsonb_agg(notes.note_view.note) AS conditioncombination_annotation,
    jsonb_build_object('nilreason', airport_heliport.conditioncombination_pt.nilreason,
    'logicaloperator', coalesce(cast(airport_heliport.conditioncombination.logicaloperator_value as varchar), '(' || airport_heliport.conditioncombination.logicaloperator_nilreason || ')')  ) AS json_data
from airport_heliport.conditioncombination_pt 
inner join airport_heliport.conditioncombination on airport_heliport.conditioncombination_pt.conditioncombination_id = airport_heliport.conditioncombination.id
left join master_join mj1 on airport_heliport.conditioncombination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object shared.meteorology.weather
--object shared.aircraftcharacteristic.aircraft
--object shared.flightcharacteristic.flight
--object airport_heliport.conditioncombination.subcondition
group by
    airport_heliport.conditioncombination_pt.id,
    airport_heliport.conditioncombination_pt.nilreason,
    airport_heliport.conditioncombination.logicaloperator_value,
    airport_heliport.conditioncombination.logicaloperator_nilreason;
create or replace view shared.contactinformation_view as
select
    shared.contactinformation_pt.id,
    jsonb_agg(notes.note_view.note) AS contactinformation_annotation,
    jsonb_build_object('nilreason', shared.contactinformation_pt.nilreason,
    'name', coalesce(cast(shared.contactinformation.name_value as varchar), '(' || shared.contactinformation.name_nilreason || ')'),
    'title', coalesce(cast(shared.contactinformation.title_value as varchar), '(' || shared.contactinformation.title_nilreason || ')')  ) AS json_data
from shared.contactinformation_pt 
inner join shared.contactinformation on shared.contactinformation_pt.contactinformation_id = shared.contactinformation.id
left join master_join mj1 on shared.contactinformation.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.postaladdress.address
--object shared.onlinecontact.networknode
--object shared.telephonecontact.phonefax
--object notes.note.annotation
group by
    shared.contactinformation_pt.id,
    shared.contactinformation_pt.nilreason,
    shared.contactinformation.name_value,
    shared.contactinformation.name_nilreason,
    shared.contactinformation.title_value,
    shared.contactinformation.title_nilreason;
create or replace view procedure.departurearrivalcondition_view as
select
    procedure.departurearrivalcondition_pt.id,
    jsonb_agg(notes.note_view.note) AS departurearrivalcondition_annotation,
    jsonb_build_object('nilreason', procedure.departurearrivalcondition_pt.nilreason,
    'minimumcrossingatendreference', coalesce(cast(procedure.departurearrivalcondition.minimumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition.minimumcrossingatendreference_nilreason || ')'),
    'maximumcrossingatendreference', coalesce(cast(procedure.departurearrivalcondition.maximumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition.maximumcrossingatendreference_nilreason || ')'),
    'minimumenroutealtitude', coalesce(cast(procedure.departurearrivalcondition.minimumenroutealtitude_value as varchar) || ' ' || procedure.departurearrivalcondition.minimumenroutealtitude_uom, '(' || procedure.departurearrivalcondition.minimumenroutealtitude_nilreason || ')'),
    'minimumcrossingatend', coalesce(cast(procedure.departurearrivalcondition.minimumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition.minimumcrossingatend_uom, '(' || procedure.departurearrivalcondition.minimumcrossingatend_nilreason || ')'),
    'maximumcrossingatend', coalesce(cast(procedure.departurearrivalcondition.maximumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition.maximumcrossingatend_uom, '(' || procedure.departurearrivalcondition.maximumcrossingatend_nilreason || ')'),
    'enginetype', shared.aircraftcharacteristic_view  ) AS json_data
from procedure.departurearrivalcondition_pt 
inner join procedure.departurearrivalcondition on procedure.departurearrivalcondition_pt.departurearrivalcondition_id = procedure.departurearrivalcondition.id
left join master_join mj1 on procedure.departurearrivalcondition.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_pqdjau on procedure.departurearrivalcondition.engine_id = shared_aircraftcharacteristic_pt_pqdjau.id
--object notes.note.annotation
group by
    procedure.departurearrivalcondition_pt.id,
    procedure.departurearrivalcondition_pt.nilreason,
    procedure.departurearrivalcondition.minimumcrossingatendreference_value,
    procedure.departurearrivalcondition.minimumcrossingatendreference_nilreason,
    procedure.departurearrivalcondition.maximumcrossingatendreference_value,
    procedure.departurearrivalcondition.maximumcrossingatendreference_nilreason,
    procedure.departurearrivalcondition.minimumenroutealtitude_value,
    procedure.departurearrivalcondition.minimumenroutealtitude_uom,
    procedure.departurearrivalcondition.minimumenroutealtitude_nilreason,
    procedure.departurearrivalcondition.minimumcrossingatend_value,
    procedure.departurearrivalcondition.minimumcrossingatend_uom,
    procedure.departurearrivalcondition.minimumcrossingatend_nilreason,
    procedure.departurearrivalcondition.maximumcrossingatend_value,
    procedure.departurearrivalcondition.maximumcrossingatend_uom,
    procedure.departurearrivalcondition.maximumcrossingatend_nilreason;
create or replace view routes.directflightclass_view as
select
    routes.directflightclass_pt.id,
    jsonb_agg(notes.note_view.note) AS directflightclass_annotation,
    jsonb_build_object('nilreason', routes.directflightclass_pt.nilreason,
    'exceedlength', coalesce(cast(routes.directflightclass.exceedlength_value as varchar) || ' ' || routes.directflightclass.exceedlength_uom, '(' || routes.directflightclass.exceedlength_nilreason || ')')  ) AS json_data
from routes.directflightclass_pt 
inner join routes.directflightclass on routes.directflightclass_pt.directflightclass_id = routes.directflightclass.id
left join master_join mj1 on routes.directflightclass.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    routes.directflightclass_pt.id,
    routes.directflightclass_pt.nilreason,
    routes.directflightclass.exceedlength_value,
    routes.directflightclass.exceedlength_uom,
    routes.directflightclass.exceedlength_nilreason;
create or replace view routes.directflight_view as
select
    routes.directflight_pt.id,
    jsonb_agg(notes.note_view.note) AS directflight_annotation,
    jsonb_build_object('nilreason', routes.directflight_pt.nilreason  ) AS json_data
from routes.directflight_pt 
inner join routes.directflight on routes.directflight_pt.directflight_id = routes.directflight.id
left join master_join mj1 on routes.directflight.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
group by
    routes.directflight_pt.id,
    routes.directflight_pt.nilreason;
create or replace view routes.directflightsegment_view as
select
    routes.directflightsegment_pt.id,
    jsonb_agg(notes.note_view.note) AS directflightsegment_annotation,
    jsonb_build_object('nilreason', routes.directflightsegment_pt.nilreason  ) AS json_data
from routes.directflightsegment_pt 
inner join routes.directflightsegment on routes.directflightsegment_pt.directflightsegment_id = routes.directflightsegment.id
left join master_join mj1 on routes.directflightsegment.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    routes.directflightsegment_pt.id,
    routes.directflightsegment_pt.nilreason;
create or replace view navaids_points.enroutesegmentpoint_view as
select
    navaids_points.enroutesegmentpoint_pt.id,
    jsonb_agg(notes.note_view.note) AS enroutesegmentpoint_annotation,
    jsonb_build_object('nilreason', navaids_points.enroutesegmentpoint_pt.nilreason,
    'reportingatc', coalesce(cast(navaids_points.enroutesegmentpoint.reportingatc_value as varchar), '(' || navaids_points.enroutesegmentpoint.reportingatc_nilreason || ')'),
    'flyover', coalesce(cast(navaids_points.enroutesegmentpoint.flyover_value as varchar), '(' || navaids_points.enroutesegmentpoint.flyover_nilreason || ')'),
    'waypoint', coalesce(cast(navaids_points.enroutesegmentpoint.waypoint_value as varchar), '(' || navaids_points.enroutesegmentpoint.waypoint_nilreason || ')'),
    'radarguidance', coalesce(cast(navaids_points.enroutesegmentpoint.radarguidance_value as varchar), '(' || navaids_points.enroutesegmentpoint.radarguidance_nilreason || ')'),
    'rolefreeflight', coalesce(cast(navaids_points.enroutesegmentpoint.rolefreeflight_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolefreeflight_nilreason || ')'),
    'rolervsm', coalesce(cast(navaids_points.enroutesegmentpoint.rolervsm_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolervsm_nilreason || ')'),
    'rolemilitarytraining', coalesce(cast(navaids_points.enroutesegmentpoint.rolemilitarytraining_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolemilitarytraining_nilreason || ')'),
    'turnradius', coalesce(cast(navaids_points.enroutesegmentpoint.turnradius_value as varchar) || ' ' || navaids_points.enroutesegmentpoint.turnradius_uom, '(' || navaids_points.enroutesegmentpoint.turnradius_nilreason || ')')  ) AS json_data
from navaids_points.enroutesegmentpoint_pt 
inner join navaids_points.enroutesegmentpoint on navaids_points.enroutesegmentpoint_pt.enroutesegmentpoint_id = navaids_points.enroutesegmentpoint.id
left join master_join mj1 on navaids_points.enroutesegmentpoint.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object navaids_points.pointreference.facilitymakeup
--object notes.note.annotation
group by
    navaids_points.enroutesegmentpoint_pt.id,
    navaids_points.enroutesegmentpoint_pt.nilreason,
    navaids_points.enroutesegmentpoint.reportingatc_value,
    navaids_points.enroutesegmentpoint.reportingatc_nilreason,
    navaids_points.enroutesegmentpoint.flyover_value,
    navaids_points.enroutesegmentpoint.flyover_nilreason,
    navaids_points.enroutesegmentpoint.waypoint_value,
    navaids_points.enroutesegmentpoint.waypoint_nilreason,
    navaids_points.enroutesegmentpoint.radarguidance_value,
    navaids_points.enroutesegmentpoint.radarguidance_nilreason,
    navaids_points.enroutesegmentpoint.rolefreeflight_value,
    navaids_points.enroutesegmentpoint.rolefreeflight_nilreason,
    navaids_points.enroutesegmentpoint.rolervsm_value,
    navaids_points.enroutesegmentpoint.rolervsm_nilreason,
    navaids_points.enroutesegmentpoint.rolemilitarytraining_value,
    navaids_points.enroutesegmentpoint.rolemilitarytraining_nilreason,
    navaids_points.enroutesegmentpoint.turnradius_value,
    navaids_points.enroutesegmentpoint.turnradius_uom,
    navaids_points.enroutesegmentpoint.turnradius_nilreason;
create or replace view procedure.equipmentunavailableadjustmentcolumn_view as
select
    procedure.equipmentunavailableadjustmentcolumn_pt.id,
    jsonb_agg(notes.note_view.note) AS equipmentunavailableadjustmentcolumn_annotation,
    jsonb_build_object('nilreason', procedure.equipmentunavailableadjustmentcolumn_pt.nilreason,
    'guidanceequipment', coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_nilreason || ')'),
    'landingsystemlights', coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_nilreason || ')'),
    'equipmentrvr', coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_nilreason || ')'),
    'approachlightinginoperative', coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_nilreason || ')'),
    'visibilityadjustment', coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_value as varchar) || ' ' || procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_uom, '(' || procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_nilreason || ')')  ) AS json_data
from procedure.equipmentunavailableadjustmentcolumn_pt 
inner join procedure.equipmentunavailableadjustmentcolumn on procedure.equipmentunavailableadjustmentcolumn_pt.equipmentunavailableadjustmentcolumn_id = procedure.equipmentunavailableadjustmentcolumn.id
left join master_join mj1 on procedure.equipmentunavailableadjustmentcolumn.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.equipmentunavailableadjustmentcolumn_pt.id,
    procedure.equipmentunavailableadjustmentcolumn_pt.nilreason,
    procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_value,
    procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_value,
    procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_value,
    procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_value,
    procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_nilreason,
    procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_value,
    procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_uom,
    procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_nilreason;
create or replace view procedure.equipmentunavailableadjustment_view as
select
    procedure.equipmentunavailableadjustment_pt.id,
    jsonb_agg(notes.note_view.note) AS equipmentunavailableadjustment_annotation,
    jsonb_build_object('nilreason', procedure.equipmentunavailableadjustment_pt.nilreason,
    'type', coalesce(cast(procedure.equipmentunavailableadjustment.type_value as varchar), '(' || procedure.equipmentunavailableadjustment.type_nilreason || ')'),
    'approachlightinginoperative', coalesce(cast(procedure.equipmentunavailableadjustment.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustment.approachlightinginoperative_nilreason || ')')  ) AS json_data
from procedure.equipmentunavailableadjustment_pt 
inner join procedure.equipmentunavailableadjustment on procedure.equipmentunavailableadjustment_pt.equipmentunavailableadjustment_id = procedure.equipmentunavailableadjustment.id
left join master_join mj1 on procedure.equipmentunavailableadjustment.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object procedure.equipmentunavailableadjustmentcolumn.adjustmentinopcol
--object notes.note.annotation
group by
    procedure.equipmentunavailableadjustment_pt.id,
    procedure.equipmentunavailableadjustment_pt.nilreason,
    procedure.equipmentunavailableadjustment.type_value,
    procedure.equipmentunavailableadjustment.type_nilreason,
    procedure.equipmentunavailableadjustment.approachlightinginoperative_value,
    procedure.equipmentunavailableadjustment.approachlightinginoperative_nilreason;
create or replace view public.fasdatablock_view as
select
    public.fasdatablock_pt.id,
    jsonb_agg(notes.note_view.note) AS fasdatablock_annotation,
    jsonb_build_object('nilreason', public.fasdatablock_pt.nilreason,
    'horizontalalarmlimit', coalesce(cast(public.fasdatablock.horizontalalarmlimit_value as varchar), '(' || public.fasdatablock.horizontalalarmlimit_nilreason || ')'),
    'verticalalarmlimit', coalesce(cast(public.fasdatablock.verticalalarmlimit_value as varchar), '(' || public.fasdatablock.verticalalarmlimit_nilreason || ')'),
    'crcremainder', coalesce(cast(public.fasdatablock.crcremainder_value as varchar), '(' || public.fasdatablock.crcremainder_nilreason || ')'),
    'operationtype', coalesce(cast(public.fasdatablock.operationtype_value as varchar), '(' || public.fasdatablock.operationtype_nilreason || ')'),
    'serviceprovidersbas', coalesce(cast(public.fasdatablock.serviceprovidersbas_value as varchar), '(' || public.fasdatablock.serviceprovidersbas_nilreason || ')'),
    'approachperformancedesignator', coalesce(cast(public.fasdatablock.approachperformancedesignator_value as varchar), '(' || public.fasdatablock.approachperformancedesignator_nilreason || ')'),
    'referencepathdataselector', coalesce(cast(public.fasdatablock.referencepathdataselector_value as varchar), '(' || public.fasdatablock.referencepathdataselector_nilreason || ')'),
    'thresholdcoursewidth', coalesce(cast(public.fasdatablock.thresholdcoursewidth_value as varchar) || ' ' || public.fasdatablock.thresholdcoursewidth_uom, '(' || public.fasdatablock.thresholdcoursewidth_nilreason || ')'),
    'lengthoffset', coalesce(cast(public.fasdatablock.lengthoffset_value as varchar) || ' ' || public.fasdatablock.lengthoffset_uom, '(' || public.fasdatablock.lengthoffset_nilreason || ')')  ) AS json_data
from public.fasdatablock_pt 
inner join public.fasdatablock on public.fasdatablock_pt.fasdatablock_id = public.fasdatablock.id
left join master_join mj1 on public.fasdatablock.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    public.fasdatablock_pt.id,
    public.fasdatablock_pt.nilreason,
    public.fasdatablock.horizontalalarmlimit_value,
    public.fasdatablock.horizontalalarmlimit_nilreason,
    public.fasdatablock.verticalalarmlimit_value,
    public.fasdatablock.verticalalarmlimit_nilreason,
    public.fasdatablock.crcremainder_value,
    public.fasdatablock.crcremainder_nilreason,
    public.fasdatablock.operationtype_value,
    public.fasdatablock.operationtype_nilreason,
    public.fasdatablock.serviceprovidersbas_value,
    public.fasdatablock.serviceprovidersbas_nilreason,
    public.fasdatablock.approachperformancedesignator_value,
    public.fasdatablock.approachperformancedesignator_nilreason,
    public.fasdatablock.referencepathdataselector_value,
    public.fasdatablock.referencepathdataselector_nilreason,
    public.fasdatablock.thresholdcoursewidth_value,
    public.fasdatablock.thresholdcoursewidth_uom,
    public.fasdatablock.thresholdcoursewidth_nilreason,
    public.fasdatablock.lengthoffset_value,
    public.fasdatablock.lengthoffset_uom,
    public.fasdatablock.lengthoffset_nilreason;
create or replace view procedure.finalprofile_view as
select
    procedure.finalprofile_pt.id,
    jsonb_agg(notes.note_view.note) AS finalprofile_annotation,
    jsonb_build_object('nilreason', procedure.finalprofile_pt.nilreason  ) AS json_data
from procedure.finalprofile_pt 
inner join procedure.finalprofile on procedure.finalprofile_pt.finalprofile_id = procedure.finalprofile.id
left join master_join mj1 on procedure.finalprofile.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object procedure.approachaltitudetable.altitude
--object procedure.approachdistancetable.distance
--object procedure.approachtimingtable.timing
--object notes.note.annotation
group by
    procedure.finalprofile_pt.id,
    procedure.finalprofile_pt.nilreason;
create or replace view shared.flightcharacteristic_view as
select
    shared.flightcharacteristic_pt.id,
    jsonb_agg(notes.note_view.note) AS flightcharacteristic_annotation,
    jsonb_build_object('nilreason', shared.flightcharacteristic_pt.nilreason,
    'type', coalesce(cast(shared.flightcharacteristic.type_value as varchar), '(' || shared.flightcharacteristic.type_nilreason || ')'),
    'rule', coalesce(cast(shared.flightcharacteristic.rule_value as varchar), '(' || shared.flightcharacteristic.rule_nilreason || ')'),
    'status', coalesce(cast(shared.flightcharacteristic.status_value as varchar), '(' || shared.flightcharacteristic.status_nilreason || ')'),
    'military', coalesce(cast(shared.flightcharacteristic.military_value as varchar), '(' || shared.flightcharacteristic.military_nilreason || ')'),
    'origin', coalesce(cast(shared.flightcharacteristic.origin_value as varchar), '(' || shared.flightcharacteristic.origin_nilreason || ')'),
    'purpose', coalesce(cast(shared.flightcharacteristic.purpose_value as varchar), '(' || shared.flightcharacteristic.purpose_nilreason || ')')  ) AS json_data
from shared.flightcharacteristic_pt 
inner join shared.flightcharacteristic on shared.flightcharacteristic_pt.flightcharacteristic_id = shared.flightcharacteristic.id
left join master_join mj1 on shared.flightcharacteristic.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.flightcharacteristic_pt.id,
    shared.flightcharacteristic_pt.nilreason,
    shared.flightcharacteristic.type_value,
    shared.flightcharacteristic.type_nilreason,
    shared.flightcharacteristic.rule_value,
    shared.flightcharacteristic.rule_nilreason,
    shared.flightcharacteristic.status_value,
    shared.flightcharacteristic.status_nilreason,
    shared.flightcharacteristic.military_value,
    shared.flightcharacteristic.military_nilreason,
    shared.flightcharacteristic.origin_value,
    shared.flightcharacteristic.origin_nilreason,
    shared.flightcharacteristic.purpose_value,
    shared.flightcharacteristic.purpose_nilreason;
create or replace view routes.flightconditioncircumstance_view as
select
    routes.flightconditioncircumstance_pt.id,
    jsonb_agg(notes.note_view.note) AS flightconditioncircumstance_annotation,
    jsonb_build_object('nilreason', routes.flightconditioncircumstance_pt.nilreason,
    'referencelocation', coalesce(cast(routes.flightconditioncircumstance.referencelocation_value as varchar), '(' || routes.flightconditioncircumstance.referencelocation_nilreason || ')'),
    'relationwithlocation', coalesce(cast(routes.flightconditioncircumstance.relationwithlocation_value as varchar), '(' || routes.flightconditioncircumstance.relationwithlocation_nilreason || ')')  ) AS json_data
from routes.flightconditioncircumstance_pt 
inner join routes.flightconditioncircumstance on routes.flightconditioncircumstance_pt.flightconditioncircumstance_id = routes.flightconditioncircumstance.id
left join master_join mj1 on routes.flightconditioncircumstance.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    routes.flightconditioncircumstance_pt.id,
    routes.flightconditioncircumstance_pt.nilreason,
    routes.flightconditioncircumstance.referencelocation_value,
    routes.flightconditioncircumstance.referencelocation_nilreason,
    routes.flightconditioncircumstance.relationwithlocation_value,
    routes.flightconditioncircumstance.relationwithlocation_nilreason;
create or replace view routes.flightconditioncombination_view as
select
    routes.flightconditioncombination_pt.id,
    jsonb_agg(notes.note_view.note) AS flightconditioncombination_annotation,
    jsonb_build_object('nilreason', routes.flightconditioncombination_pt.nilreason,
    'logicaloperator', coalesce(cast(routes.flightconditioncombination.logicaloperator_value as varchar), '(' || routes.flightconditioncombination.logicaloperator_nilreason || ')')  ) AS json_data
from routes.flightconditioncombination_pt 
inner join routes.flightconditioncombination on routes.flightconditioncombination_pt.flightconditioncombination_id = routes.flightconditioncombination.id
left join master_join mj1 on routes.flightconditioncombination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object routes.flightconditionelement.element
group by
    routes.flightconditioncombination_pt.id,
    routes.flightconditioncombination_pt.nilreason,
    routes.flightconditioncombination.logicaloperator_value,
    routes.flightconditioncombination.logicaloperator_nilreason;
create or replace view routes.flightconditionelement_view as
select
    routes.flightconditionelement_pt.id,
    jsonb_agg(notes.note_view.note) AS flightconditionelement_annotation,
    jsonb_build_object('nilreason', routes.flightconditionelement_pt.nilreason,
    'index', coalesce(cast(routes.flightconditionelement.index_value as varchar), '(' || routes.flightconditionelement.index_nilreason || ')'),
    'flightconditionrouteportioncondition', routes.routeportion_view,
    'flightconditiondirectflightcondition', routes.directflight_view,
    'flightconditionaircraft', shared.aircraftcharacteristic_view,
    'flightconditionflight', shared.flightcharacteristic_view,
    'flightconditionoperand', routes.flightconditioncombination_view,
    'flightconditionweather', shared.meteorology_view,
    'operationalcondition', routes.flightconditioncircumstance_view  ) AS json_data
from routes.flightconditionelement_pt 
inner join routes.flightconditionelement on routes.flightconditionelement_pt.flightconditionelement_id = routes.flightconditionelement.id
left join master_join mj1 on routes.flightconditionelement.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join routes.routeportion_pt routes_routeportion_pt_oqiote on routes.flightconditionelement.flightcondition_routeportioncondition_id = routes_routeportion_pt_oqiote.id
left join routes.directflight_pt routes_directflight_pt_lhtkmn on routes.flightconditionelement.flightcondition_directflightcondition_id = routes_directflight_pt_lhtkmn.id
left join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_lepalb on routes.flightconditionelement.flightcondition_aircraft_id = shared_aircraftcharacteristic_pt_lepalb.id
left join shared.flightcharacteristic_pt shared_flightcharacteristic_pt_vjzbur on routes.flightconditionelement.flightcondition_flight_id = shared_flightcharacteristic_pt_vjzbur.id
left join routes.flightconditioncombination_pt routes_flightconditioncombination_pt_akrmgo on routes.flightconditionelement.flightcondition_operand_id = routes_flightconditioncombination_pt_akrmgo.id
left join shared.meteorology_pt shared_meteorology_pt_uzhvye on routes.flightconditionelement.flightcondition_weather_id = shared_meteorology_pt_uzhvye.id
left join routes.flightconditioncircumstance_pt routes_flightconditioncircumstance_pt_xvlacn on routes.flightconditionelement.operationalcondition_id = routes_flightconditioncircumstance_pt_xvlacn.id
--object routes.flightrestrictionlevel.flightlevel
--object notes.note.annotation
group by
    routes.flightconditionelement_pt.id,
    routes.flightconditionelement_pt.nilreason,
    routes.flightconditionelement.index_value,
    routes.flightconditionelement.index_nilreason;
create or replace view routes.flightrestrictionlevel_view as
select
    routes.flightrestrictionlevel_pt.id,
    jsonb_agg(notes.note_view.note) AS flightrestrictionlevel_annotation,
    jsonb_build_object('nilreason', routes.flightrestrictionlevel_pt.nilreason,
    'upperlevelreference', coalesce(cast(routes.flightrestrictionlevel.upperlevelreference_value as varchar), '(' || routes.flightrestrictionlevel.upperlevelreference_nilreason || ')'),
    'lowerlevelreference', coalesce(cast(routes.flightrestrictionlevel.lowerlevelreference_value as varchar), '(' || routes.flightrestrictionlevel.lowerlevelreference_nilreason || ')'),
    'upperlevel', coalesce(cast(routes.flightrestrictionlevel.upperlevel_value as varchar) || ' ' || routes.flightrestrictionlevel.upperlevel_uom, '(' || routes.flightrestrictionlevel.upperlevel_nilreason || ')'),
    'lowerlevel', coalesce(cast(routes.flightrestrictionlevel.lowerlevel_value as varchar) || ' ' || routes.flightrestrictionlevel.lowerlevel_uom, '(' || routes.flightrestrictionlevel.lowerlevel_nilreason || ')')  ) AS json_data
from routes.flightrestrictionlevel_pt 
inner join routes.flightrestrictionlevel on routes.flightrestrictionlevel_pt.flightrestrictionlevel_id = routes.flightrestrictionlevel.id
left join master_join mj1 on routes.flightrestrictionlevel.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    routes.flightrestrictionlevel_pt.id,
    routes.flightrestrictionlevel_pt.nilreason,
    routes.flightrestrictionlevel.upperlevelreference_value,
    routes.flightrestrictionlevel.upperlevelreference_nilreason,
    routes.flightrestrictionlevel.lowerlevelreference_value,
    routes.flightrestrictionlevel.lowerlevelreference_nilreason,
    routes.flightrestrictionlevel.upperlevel_value,
    routes.flightrestrictionlevel.upperlevel_uom,
    routes.flightrestrictionlevel.upperlevel_nilreason,
    routes.flightrestrictionlevel.lowerlevel_value,
    routes.flightrestrictionlevel.lowerlevel_uom,
    routes.flightrestrictionlevel.lowerlevel_nilreason;
create or replace view routes.flightrestrictionroute_view as
select
    routes.flightrestrictionroute_pt.id,
    jsonb_agg(notes.note_view.note) AS flightrestrictionroute_annotation,
    jsonb_build_object('nilreason', routes.flightrestrictionroute_pt.nilreason,
    'priorpermission', coalesce(cast(routes.flightrestrictionroute.priorpermission_value as varchar), '(' || routes.flightrestrictionroute.priorpermission_nilreason || ')')  ) AS json_data
from routes.flightrestrictionroute_pt 
inner join routes.flightrestrictionroute on routes.flightrestrictionroute_pt.flightrestrictionroute_id = routes.flightrestrictionroute.id
left join master_join mj1 on routes.flightrestrictionroute.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object routes.flightroutingelement.routeelement
--object shared.contactinformation.contact
--object notes.note.annotation
group by
    routes.flightrestrictionroute_pt.id,
    routes.flightrestrictionroute_pt.nilreason,
    routes.flightrestrictionroute.priorpermission_value,
    routes.flightrestrictionroute.priorpermission_nilreason;
create or replace view routes.flightroutingelement_view as
select
    routes.flightroutingelement_pt.id,
    jsonb_agg(notes.note_view.note) AS flightroutingelement_annotation,
    jsonb_build_object('nilreason', routes.flightroutingelement_pt.nilreason,
    'ordernumber', coalesce(cast(routes.flightroutingelement.ordernumber_value as varchar), '(' || routes.flightroutingelement.ordernumber_nilreason || ')'),
    'speedreference', coalesce(cast(routes.flightroutingelement.speedreference_value as varchar), '(' || routes.flightroutingelement.speedreference_nilreason || ')'),
    'speedcriteria', coalesce(cast(routes.flightroutingelement.speedcriteria_value as varchar), '(' || routes.flightroutingelement.speedcriteria_nilreason || ')'),
    'speed', coalesce(cast(routes.flightroutingelement.speed_value as varchar) || ' ' || routes.flightroutingelement.speed_uom, '(' || routes.flightroutingelement.speed_nilreason || ')'),
    'elementdirectflightelement', routes.directflightsegment_view,
    'elementrouteportionelement', routes.routeportion_view  ) AS json_data
from routes.flightroutingelement_pt 
inner join routes.flightroutingelement on routes.flightroutingelement_pt.flightroutingelement_id = routes.flightroutingelement.id
left join master_join mj1 on routes.flightroutingelement.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join routes.directflightsegment_pt routes_directflightsegment_pt_rckulo on routes.flightroutingelement.element_directflightelement_id = routes_directflightsegment_pt_rckulo.id
left join routes.routeportion_pt routes_routeportion_pt_cesptf on routes.flightroutingelement.element_routeportionelement_id = routes_routeportion_pt_cesptf.id
--object routes.flightrestrictionlevel.flightlevel
--object notes.note.annotation
group by
    routes.flightroutingelement_pt.id,
    routes.flightroutingelement_pt.nilreason,
    routes.flightroutingelement.ordernumber_value,
    routes.flightroutingelement.ordernumber_nilreason,
    routes.flightroutingelement.speedreference_value,
    routes.flightroutingelement.speedreference_nilreason,
    routes.flightroutingelement.speedcriteria_value,
    routes.flightroutingelement.speedcriteria_nilreason,
    routes.flightroutingelement.speed_value,
    routes.flightroutingelement.speed_uom,
    routes.flightroutingelement.speed_nilreason;
create or replace view service.fuel_view as
select
    service.fuel_pt.id,
    jsonb_agg(notes.note_view.note) AS fuel_annotation,
    jsonb_build_object('nilreason', service.fuel_pt.nilreason,
    'category', coalesce(cast(service.fuel.category_value as varchar), '(' || service.fuel.category_nilreason || ')')  ) AS json_data
from service.fuel_pt 
inner join service.fuel on service.fuel_pt.fuel_id = service.fuel.id
left join master_join mj1 on service.fuel.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    service.fuel_pt.id,
    service.fuel_pt.nilreason,
    service.fuel.category_value,
    service.fuel.category_nilreason;
create or replace view airport_heliport.groundlightingavailability_view as
select
    airport_heliport.groundlightingavailability_pt.id,
    jsonb_agg(notes.note_view.note) AS groundlightingavailability_annotation,
    jsonb_build_object('nilreason', airport_heliport.groundlightingavailability_pt.nilreason,
    'operationalstatus', coalesce(cast(airport_heliport.groundlightingavailability.operationalstatus_value as varchar), '(' || airport_heliport.groundlightingavailability.operationalstatus_nilreason || ')')  ) AS json_data
from airport_heliport.groundlightingavailability_pt 
inner join airport_heliport.groundlightingavailability on airport_heliport.groundlightingavailability_pt.groundlightingavailability_id = airport_heliport.groundlightingavailability.id
left join master_join mj1 on airport_heliport.groundlightingavailability.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    airport_heliport.groundlightingavailability_pt.id,
    airport_heliport.groundlightingavailability_pt.nilreason,
    airport_heliport.groundlightingavailability.operationalstatus_value,
    airport_heliport.groundlightingavailability.operationalstatus_nilreason;
create or replace view holding.holdingpatterndistance_view as
select
    holding.holdingpatterndistance_pt.id,
    jsonb_agg(notes.note_view.note) AS holdingpatterndistance_annotation,
    jsonb_build_object('nilreason', holding.holdingpatterndistance_pt.nilreason,
    'length', coalesce(cast(holding.holdingpatterndistance.length_value as varchar) || ' ' || holding.holdingpatterndistance.length_uom, '(' || holding.holdingpatterndistance.length_nilreason || ')')  ) AS json_data
from holding.holdingpatterndistance_pt 
inner join holding.holdingpatterndistance on holding.holdingpatterndistance_pt.holdingpatterndistance_id = holding.holdingpatterndistance.id
left join master_join mj1 on holding.holdingpatterndistance.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    holding.holdingpatterndistance_pt.id,
    holding.holdingpatterndistance_pt.nilreason,
    holding.holdingpatterndistance.length_value,
    holding.holdingpatterndistance.length_uom,
    holding.holdingpatterndistance.length_nilreason;
create or replace view holding.holdingpatternduration_view as
select
    holding.holdingpatternduration_pt.id,
    jsonb_agg(notes.note_view.note) AS holdingpatternduration_annotation,
    jsonb_build_object('nilreason', holding.holdingpatternduration_pt.nilreason,
    'duration', coalesce(cast(holding.holdingpatternduration.duration_value as varchar) || ' ' || holding.holdingpatternduration.duration_uom, '(' || holding.holdingpatternduration.duration_nilreason || ')')  ) AS json_data
from holding.holdingpatternduration_pt 
inner join holding.holdingpatternduration on holding.holdingpatternduration_pt.holdingpatternduration_id = holding.holdingpatternduration.id
left join master_join mj1 on holding.holdingpatternduration.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    holding.holdingpatternduration_pt.id,
    holding.holdingpatternduration_pt.nilreason,
    holding.holdingpatternduration.duration_value,
    holding.holdingpatternduration.duration_uom,
    holding.holdingpatternduration.duration_nilreason;
create or replace view procedure.holdinguse_view as
select
    procedure.holdinguse_pt.id,
    jsonb_agg(notes.note_view.note) AS holdinguse_annotation,
    jsonb_build_object('nilreason', procedure.holdinguse_pt.nilreason,
    'holdinguse', coalesce(cast(procedure.holdinguse.holdinguse_value as varchar), '(' || procedure.holdinguse.holdinguse_nilreason || ')'),
    'instruction', coalesce(cast(procedure.holdinguse.instruction_value as varchar), '(' || procedure.holdinguse.instruction_nilreason || ')'),
    'instructionaltitudereference', coalesce(cast(procedure.holdinguse.instructionaltitudereference_value as varchar), '(' || procedure.holdinguse.instructionaltitudereference_nilreason || ')'),
    'instructedaltitude', coalesce(cast(procedure.holdinguse.instructedaltitude_value as varchar) || ' ' || procedure.holdinguse.instructedaltitude_uom, '(' || procedure.holdinguse.instructedaltitude_nilreason || ')')  ) AS json_data
from procedure.holdinguse_pt 
inner join procedure.holdinguse on procedure.holdinguse_pt.holdinguse_id = procedure.holdinguse.id
left join master_join mj1 on procedure.holdinguse.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.holdinguse_pt.id,
    procedure.holdinguse_pt.nilreason,
    procedure.holdinguse.holdinguse_value,
    procedure.holdinguse.holdinguse_nilreason,
    procedure.holdinguse.instruction_value,
    procedure.holdinguse.instruction_nilreason,
    procedure.holdinguse.instructionaltitudereference_value,
    procedure.holdinguse.instructionaltitudereference_nilreason,
    procedure.holdinguse.instructedaltitude_value,
    procedure.holdinguse.instructedaltitude_uom,
    procedure.holdinguse.instructedaltitude_nilreason;
create or replace view procedure.landingtakeoffareacollection_view as
select
    procedure.landingtakeoffareacollection_pt.id,
    jsonb_agg(notes.note_view.note) AS landingtakeoffareacollection_annotation,
    jsonb_build_object('nilreason', procedure.landingtakeoffareacollection_pt.nilreason  ) AS json_data
from procedure.landingtakeoffareacollection_pt 
inner join procedure.landingtakeoffareacollection on procedure.landingtakeoffareacollection_pt.landingtakeoffareacollection_id = procedure.landingtakeoffareacollection.id
left join master_join mj1 on procedure.landingtakeoffareacollection.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.landingtakeoffareacollection_pt.id,
    procedure.landingtakeoffareacollection_pt.nilreason;
create or replace view airport_heliport.lightactivation_view as
select
    airport_heliport.lightactivation_pt.id,
    jsonb_agg(notes.note_view.note) AS lightactivation_annotation,
    jsonb_build_object('nilreason', airport_heliport.lightactivation_pt.nilreason,
    'clicks', coalesce(cast(airport_heliport.lightactivation.clicks_value as varchar), '(' || airport_heliport.lightactivation.clicks_nilreason || ')'),
    'intensitylevel', coalesce(cast(airport_heliport.lightactivation.intensitylevel_value as varchar), '(' || airport_heliport.lightactivation.intensitylevel_nilreason || ')'),
    'activation', coalesce(cast(airport_heliport.lightactivation.activation_value as varchar), '(' || airport_heliport.lightactivation.activation_nilreason || ')')  ) AS json_data
from airport_heliport.lightactivation_pt 
inner join airport_heliport.lightactivation on airport_heliport.lightactivation_pt.lightactivation_id = airport_heliport.lightactivation.id
left join master_join mj1 on airport_heliport.lightactivation.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airport_heliport.lightactivation_pt.id,
    airport_heliport.lightactivation_pt.nilreason,
    airport_heliport.lightactivation.clicks_value,
    airport_heliport.lightactivation.clicks_nilreason,
    airport_heliport.lightactivation.intensitylevel_value,
    airport_heliport.lightactivation.intensitylevel_nilreason,
    airport_heliport.lightactivation.activation_value,
    airport_heliport.lightactivation.activation_nilreason;
create or replace view shared.lightelement_view as
select
    shared.lightelement_pt.id,
    jsonb_agg(notes.note_view.note) AS lightelement_annotation,
    jsonb_build_object('nilreason', shared.lightelement_pt.nilreason,
    'colour', coalesce(cast(shared.lightelement.colour_value as varchar), '(' || shared.lightelement.colour_nilreason || ')'),
    'intensitylevel', coalesce(cast(shared.lightelement.intensitylevel_value as varchar), '(' || shared.lightelement.intensitylevel_nilreason || ')'),
    'type', coalesce(cast(shared.lightelement.type_value as varchar), '(' || shared.lightelement.type_nilreason || ')'),
    'intensity', coalesce(cast(shared.lightelement.intensity_value as varchar) || ' ' || shared.lightelement.intensity_uom, '(' || shared.lightelement.intensity_nilreason || ')')  ) AS json_data
from shared.lightelement_pt 
inner join shared.lightelement on shared.lightelement_pt.lightelement_id = shared.lightelement.id
left join master_join mj1 on shared.lightelement.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
--object shared.lightelementstatus.availability
group by
    shared.lightelement_pt.id,
    shared.lightelement_pt.nilreason,
    shared.lightelement.colour_value,
    shared.lightelement.colour_nilreason,
    shared.lightelement.intensitylevel_value,
    shared.lightelement.intensitylevel_nilreason,
    shared.lightelement.type_value,
    shared.lightelement.type_nilreason,
    shared.lightelement.intensity_value,
    shared.lightelement.intensity_uom,
    shared.lightelement.intensity_nilreason;
create or replace view shared.lightelementstatus_view as
select
    shared.lightelementstatus_pt.id,
    jsonb_agg(notes.note_view.note) AS lightelementstatus_annotation,
    jsonb_build_object('nilreason', shared.lightelementstatus_pt.nilreason,
    'status', coalesce(cast(shared.lightelementstatus.status_value as varchar), '(' || shared.lightelementstatus.status_nilreason || ')')  ) AS json_data
from shared.lightelementstatus_pt 
inner join shared.lightelementstatus on shared.lightelementstatus_pt.lightelementstatus_id = shared.lightelementstatus.id
left join master_join mj1 on shared.lightelementstatus.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    shared.lightelementstatus_pt.id,
    shared.lightelementstatus_pt.nilreason,
    shared.lightelementstatus.status_value,
    shared.lightelementstatus.status_nilreason;
create or replace view notes.linguisticnote_view as
select
    notes.linguisticnote_pt.id,
    jsonb_agg(notes.note_view.note) AS linguisticnote_annotation,
    jsonb_build_object('nilreason', notes.linguisticnote_pt.nilreason,
    'note', coalesce(cast(notes.linguisticnote.note_value as varchar) || ' ' || notes.linguisticnote.note_nilreason, '(' || notes.linguisticnote.note_lang || ')')  ) AS json_data
from notes.linguisticnote_pt 
inner join notes.linguisticnote on notes.linguisticnote_pt.linguisticnote_id = notes.linguisticnote.id
left join master_join mj1 on notes.linguisticnote.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
group by
    notes.linguisticnote_pt.id,
    notes.linguisticnote_pt.nilreason,
    notes.linguisticnote.note_value,
    notes.linguisticnote.note_nilreason,
    notes.linguisticnote.note_lang;
create or replace view airport_heliport.manoeuvringareaavailability_view as
select
    airport_heliport.manoeuvringareaavailability_pt.id,
    jsonb_agg(notes.note_view.note) AS manoeuvringareaavailability_annotation,
    jsonb_build_object('nilreason', airport_heliport.manoeuvringareaavailability_pt.nilreason,
    'operationalstatus', coalesce(cast(airport_heliport.manoeuvringareaavailability.operationalstatus_value as varchar), '(' || airport_heliport.manoeuvringareaavailability.operationalstatus_nilreason || ')'),
    'warning', coalesce(cast(airport_heliport.manoeuvringareaavailability.warning_value as varchar), '(' || airport_heliport.manoeuvringareaavailability.warning_nilreason || ')')  ) AS json_data
from airport_heliport.manoeuvringareaavailability_pt 
inner join airport_heliport.manoeuvringareaavailability on airport_heliport.manoeuvringareaavailability_pt.manoeuvringareaavailability_id = airport_heliport.manoeuvringareaavailability.id
left join master_join mj1 on airport_heliport.manoeuvringareaavailability.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object airport_heliport.manoeuvringareausage.usage
group by
    airport_heliport.manoeuvringareaavailability_pt.id,
    airport_heliport.manoeuvringareaavailability_pt.nilreason,
    airport_heliport.manoeuvringareaavailability.operationalstatus_value,
    airport_heliport.manoeuvringareaavailability.operationalstatus_nilreason,
    airport_heliport.manoeuvringareaavailability.warning_value,
    airport_heliport.manoeuvringareaavailability.warning_nilreason;
create or replace view airport_heliport.manoeuvringareausage_view as
select
    airport_heliport.manoeuvringareausage_pt.id,
    jsonb_agg(notes.note_view.note) AS manoeuvringareausage_annotation,
    jsonb_build_object('nilreason', airport_heliport.manoeuvringareausage_pt.nilreason,
    'type', coalesce(cast(airport_heliport.manoeuvringareausage.type_value as varchar), '(' || airport_heliport.manoeuvringareausage.type_nilreason || ')'),
    'operation', coalesce(cast(airport_heliport.manoeuvringareausage.operation_value as varchar), '(' || airport_heliport.manoeuvringareausage.operation_nilreason || ')'),
    'priorpermission', coalesce(cast(airport_heliport.manoeuvringareausage.priorpermission_value as varchar) || ' ' || airport_heliport.manoeuvringareausage.priorpermission_uom, '(' || airport_heliport.manoeuvringareausage.priorpermission_nilreason || ')'),
    'selection', airport_heliport.conditioncombination_view  ) AS json_data
from airport_heliport.manoeuvringareausage_pt 
inner join airport_heliport.manoeuvringareausage on airport_heliport.manoeuvringareausage_pt.manoeuvringareausage_id = airport_heliport.manoeuvringareausage.id
left join master_join mj1 on airport_heliport.manoeuvringareausage.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_xzewjb on airport_heliport.manoeuvringareausage.selection_id = airport_heliport_conditioncombination_pt_xzewjb.id
--object shared.contactinformation.contact
--object notes.note.annotation
group by
    airport_heliport.manoeuvringareausage_pt.id,
    airport_heliport.manoeuvringareausage_pt.nilreason,
    airport_heliport.manoeuvringareausage.type_value,
    airport_heliport.manoeuvringareausage.type_nilreason,
    airport_heliport.manoeuvringareausage.operation_value,
    airport_heliport.manoeuvringareausage.operation_nilreason,
    airport_heliport.manoeuvringareausage.priorpermission_value,
    airport_heliport.manoeuvringareausage.priorpermission_uom,
    airport_heliport.manoeuvringareausage.priorpermission_nilreason;
create or replace view airport_heliport.markingelement_view as
select
    airport_heliport.markingelement_pt.id,
    jsonb_agg(notes.note_view.note) AS markingelement_annotation,
    jsonb_build_object('nilreason', airport_heliport.markingelement_pt.nilreason,
    'colour', coalesce(cast(airport_heliport.markingelement.colour_value as varchar), '(' || airport_heliport.markingelement.colour_nilreason || ')'),
    'style', coalesce(cast(airport_heliport.markingelement.style_value as varchar), '(' || airport_heliport.markingelement.style_nilreason || ')')  ) AS json_data
from airport_heliport.markingelement_pt 
inner join airport_heliport.markingelement on airport_heliport.markingelement_pt.markingelement_id = airport_heliport.markingelement.id
left join master_join mj1 on airport_heliport.markingelement.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airport_heliport.markingelement_pt.id,
    airport_heliport.markingelement_pt.nilreason,
    airport_heliport.markingelement.colour_value,
    airport_heliport.markingelement.colour_nilreason,
    airport_heliport.markingelement.style_value,
    airport_heliport.markingelement.style_nilreason;
create or replace view shared.meteorology_view as
select
    shared.meteorology_pt.id,
    jsonb_agg(notes.note_view.note) AS meteorology_annotation,
    jsonb_build_object('nilreason', shared.meteorology_pt.nilreason,
    'flightconditions', coalesce(cast(shared.meteorology.flightconditions_value as varchar), '(' || shared.meteorology.flightconditions_nilreason || ')'),
    'visibilityinterpretation', coalesce(cast(shared.meteorology.visibilityinterpretation_value as varchar), '(' || shared.meteorology.visibilityinterpretation_nilreason || ')'),
    'runwayvisualrangeinterpretation', coalesce(cast(shared.meteorology.runwayvisualrangeinterpretation_value as varchar), '(' || shared.meteorology.runwayvisualrangeinterpretation_nilreason || ')'),
    'visibility', coalesce(cast(shared.meteorology.visibility_value as varchar) || ' ' || shared.meteorology.visibility_uom, '(' || shared.meteorology.visibility_nilreason || ')'),
    'runwayvisualrange', coalesce(cast(shared.meteorology.runwayvisualrange_value as varchar) || ' ' || shared.meteorology.runwayvisualrange_uom, '(' || shared.meteorology.runwayvisualrange_nilreason || ')')  ) AS json_data
from shared.meteorology_pt 
inner join shared.meteorology on shared.meteorology_pt.meteorology_id = shared.meteorology.id
left join master_join mj1 on shared.meteorology.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.meteorology_pt.id,
    shared.meteorology_pt.nilreason,
    shared.meteorology.flightconditions_value,
    shared.meteorology.flightconditions_nilreason,
    shared.meteorology.visibilityinterpretation_value,
    shared.meteorology.visibilityinterpretation_nilreason,
    shared.meteorology.runwayvisualrangeinterpretation_value,
    shared.meteorology.runwayvisualrangeinterpretation_nilreason,
    shared.meteorology.visibility_value,
    shared.meteorology.visibility_uom,
    shared.meteorology.visibility_nilreason,
    shared.meteorology.runwayvisualrange_value,
    shared.meteorology.runwayvisualrange_uom,
    shared.meteorology.runwayvisualrange_nilreason;
create or replace view procedure.minima_view as
select
    procedure.minima_pt.id,
    jsonb_agg(notes.note_view.note) AS minima_annotation,
    jsonb_build_object('nilreason', procedure.minima_pt.nilreason,
    'altitudecode', coalesce(cast(procedure.minima.altitudecode_value as varchar), '(' || procedure.minima.altitudecode_nilreason || ')'),
    'altitudereference', coalesce(cast(procedure.minima.altitudereference_value as varchar), '(' || procedure.minima.altitudereference_nilreason || ')'),
    'heightcode', coalesce(cast(procedure.minima.heightcode_value as varchar), '(' || procedure.minima.heightcode_nilreason || ')'),
    'heightreference', coalesce(cast(procedure.minima.heightreference_value as varchar), '(' || procedure.minima.heightreference_nilreason || ')'),
    'mandatoryrvr', coalesce(cast(procedure.minima.mandatoryrvr_value as varchar), '(' || procedure.minima.mandatoryrvr_nilreason || ')'),
    'remotealtimeterminima', coalesce(cast(procedure.minima.remotealtimeterminima_value as varchar), '(' || procedure.minima.remotealtimeterminima_nilreason || ')'),
    'altitude', coalesce(cast(procedure.minima.altitude_value as varchar) || ' ' || procedure.minima.altitude_uom, '(' || procedure.minima.altitude_nilreason || ')'),
    'height', coalesce(cast(procedure.minima.height_value as varchar) || ' ' || procedure.minima.height_uom, '(' || procedure.minima.height_nilreason || ')'),
    'militaryheight', coalesce(cast(procedure.minima.militaryheight_value as varchar) || ' ' || procedure.minima.militaryheight_uom, '(' || procedure.minima.militaryheight_nilreason || ')'),
    'radioheight', coalesce(cast(procedure.minima.radioheight_value as varchar) || ' ' || procedure.minima.radioheight_uom, '(' || procedure.minima.radioheight_nilreason || ')'),
    'visibility', coalesce(cast(procedure.minima.visibility_value as varchar) || ' ' || procedure.minima.visibility_uom, '(' || procedure.minima.visibility_nilreason || ')'),
    'militaryvisibility', coalesce(cast(procedure.minima.militaryvisibility_value as varchar) || ' ' || procedure.minima.militaryvisibility_uom, '(' || procedure.minima.militaryvisibility_nilreason || ')')  ) AS json_data
from procedure.minima_pt 
inner join procedure.minima on procedure.minima_pt.minima_id = procedure.minima.id
left join master_join mj1 on procedure.minima.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object procedure.equipmentunavailableadjustment.adjustmentinop
--object notes.note.annotation
group by
    procedure.minima_pt.id,
    procedure.minima_pt.nilreason,
    procedure.minima.altitudecode_value,
    procedure.minima.altitudecode_nilreason,
    procedure.minima.altitudereference_value,
    procedure.minima.altitudereference_nilreason,
    procedure.minima.heightcode_value,
    procedure.minima.heightcode_nilreason,
    procedure.minima.heightreference_value,
    procedure.minima.heightreference_nilreason,
    procedure.minima.mandatoryrvr_value,
    procedure.minima.mandatoryrvr_nilreason,
    procedure.minima.remotealtimeterminima_value,
    procedure.minima.remotealtimeterminima_nilreason,
    procedure.minima.altitude_value,
    procedure.minima.altitude_uom,
    procedure.minima.altitude_nilreason,
    procedure.minima.height_value,
    procedure.minima.height_uom,
    procedure.minima.height_nilreason,
    procedure.minima.militaryheight_value,
    procedure.minima.militaryheight_uom,
    procedure.minima.militaryheight_nilreason,
    procedure.minima.radioheight_value,
    procedure.minima.radioheight_uom,
    procedure.minima.radioheight_nilreason,
    procedure.minima.visibility_value,
    procedure.minima.visibility_uom,
    procedure.minima.visibility_nilreason,
    procedure.minima.militaryvisibility_value,
    procedure.minima.militaryvisibility_uom,
    procedure.minima.militaryvisibility_nilreason;
create or replace view procedure.missedapproachgroup_view as
select
    procedure.missedapproachgroup_pt.id,
    jsonb_agg(notes.note_view.note) AS missedapproachgroup_annotation,
    jsonb_build_object('nilreason', procedure.missedapproachgroup_pt.nilreason,
    'instruction', coalesce(cast(procedure.missedapproachgroup.instruction_value as varchar), '(' || procedure.missedapproachgroup.instruction_nilreason || ')'),
    'alternateclimbinstruction', coalesce(cast(procedure.missedapproachgroup.alternateclimbinstruction_value as varchar), '(' || procedure.missedapproachgroup.alternateclimbinstruction_nilreason || ')'),
    'alternateclimbaltitude', coalesce(cast(procedure.missedapproachgroup.alternateclimbaltitude_value as varchar) || ' ' || procedure.missedapproachgroup.alternateclimbaltitude_uom, '(' || procedure.missedapproachgroup.alternateclimbaltitude_nilreason || ')')  ) AS json_data
from procedure.missedapproachgroup_pt 
inner join procedure.missedapproachgroup on procedure.missedapproachgroup_pt.missedapproachgroup_id = procedure.missedapproachgroup.id
left join master_join mj1 on procedure.missedapproachgroup.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.missedapproachgroup_pt.id,
    procedure.missedapproachgroup_pt.nilreason,
    procedure.missedapproachgroup.instruction_value,
    procedure.missedapproachgroup.instruction_nilreason,
    procedure.missedapproachgroup.alternateclimbinstruction_value,
    procedure.missedapproachgroup.alternateclimbinstruction_nilreason,
    procedure.missedapproachgroup.alternateclimbaltitude_value,
    procedure.missedapproachgroup.alternateclimbaltitude_uom,
    procedure.missedapproachgroup.alternateclimbaltitude_nilreason;
create or replace view navaids_points.navaidcomponent_view as
select
    navaids_points.navaidcomponent_pt.id,
    jsonb_agg(notes.note_view.note) AS navaidcomponent_annotation,
    jsonb_build_object('nilreason', navaids_points.navaidcomponent_pt.nilreason,
    'collocationgroup', coalesce(cast(navaids_points.navaidcomponent.collocationgroup_value as varchar), '(' || navaids_points.navaidcomponent.collocationgroup_nilreason || ')'),
    'markerposition', coalesce(cast(navaids_points.navaidcomponent.markerposition_value as varchar), '(' || navaids_points.navaidcomponent.markerposition_nilreason || ')'),
    'providesnavigablelocation', coalesce(cast(navaids_points.navaidcomponent.providesnavigablelocation_value as varchar), '(' || navaids_points.navaidcomponent.providesnavigablelocation_nilreason || ')')  ) AS json_data
from navaids_points.navaidcomponent_pt 
inner join navaids_points.navaidcomponent on navaids_points.navaidcomponent_pt.navaidcomponent_id = navaids_points.navaidcomponent.id
left join master_join mj1 on navaids_points.navaidcomponent.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    navaids_points.navaidcomponent_pt.id,
    navaids_points.navaidcomponent_pt.nilreason,
    navaids_points.navaidcomponent.collocationgroup_value,
    navaids_points.navaidcomponent.collocationgroup_nilreason,
    navaids_points.navaidcomponent.markerposition_value,
    navaids_points.navaidcomponent.markerposition_nilreason,
    navaids_points.navaidcomponent.providesnavigablelocation_value,
    navaids_points.navaidcomponent.providesnavigablelocation_nilreason;
create or replace view airport_heliport.navaidequipmentdistance_view as
select
    airport_heliport.navaidequipmentdistance_pt.id,
    jsonb_agg(notes.note_view.note) AS navaidequipmentdistance_annotation,
    jsonb_build_object('nilreason', airport_heliport.navaidequipmentdistance_pt.nilreason,
    'distance', coalesce(cast(airport_heliport.navaidequipmentdistance.distance_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance.distance_uom, '(' || airport_heliport.navaidequipmentdistance.distance_nilreason || ')'),
    'distanceaccuracy', coalesce(cast(airport_heliport.navaidequipmentdistance.distanceaccuracy_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance.distanceaccuracy_uom, '(' || airport_heliport.navaidequipmentdistance.distanceaccuracy_nilreason || ')')  ) AS json_data
from airport_heliport.navaidequipmentdistance_pt 
inner join airport_heliport.navaidequipmentdistance on airport_heliport.navaidequipmentdistance_pt.navaidequipmentdistance_id = airport_heliport.navaidequipmentdistance.id
left join master_join mj1 on airport_heliport.navaidequipmentdistance.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airport_heliport.navaidequipmentdistance_pt.id,
    airport_heliport.navaidequipmentdistance_pt.nilreason,
    airport_heliport.navaidequipmentdistance.distance_value,
    airport_heliport.navaidequipmentdistance.distance_uom,
    airport_heliport.navaidequipmentdistance.distance_nilreason,
    airport_heliport.navaidequipmentdistance.distanceaccuracy_value,
    airport_heliport.navaidequipmentdistance.distanceaccuracy_uom,
    airport_heliport.navaidequipmentdistance.distanceaccuracy_nilreason;
create or replace view navaids_points.navaidequipmentmonitoring_view as
select
    navaids_points.navaidequipmentmonitoring_pt.id,
    jsonb_agg(notes.note_view.note) AS navaidequipmentmonitoring_annotation,
    jsonb_build_object('nilreason', navaids_points.navaidequipmentmonitoring_pt.nilreason,
    'monitored', coalesce(cast(navaids_points.navaidequipmentmonitoring.monitored_value as varchar), '(' || navaids_points.navaidequipmentmonitoring.monitored_nilreason || ')')  ) AS json_data
from navaids_points.navaidequipmentmonitoring_pt 
inner join navaids_points.navaidequipmentmonitoring on navaids_points.navaidequipmentmonitoring_pt.navaidequipmentmonitoring_id = navaids_points.navaidequipmentmonitoring.id
left join master_join mj1 on navaids_points.navaidequipmentmonitoring.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    navaids_points.navaidequipmentmonitoring_pt.id,
    navaids_points.navaidequipmentmonitoring_pt.nilreason,
    navaids_points.navaidequipmentmonitoring.monitored_value,
    navaids_points.navaidequipmentmonitoring.monitored_nilreason;
create or replace view navaids_points.navaidoperationalstatus_view as
select
    navaids_points.navaidoperationalstatus_pt.id,
    jsonb_agg(notes.note_view.note) AS navaidoperationalstatus_annotation,
    jsonb_build_object('nilreason', navaids_points.navaidoperationalstatus_pt.nilreason,
    'operationalstatus', coalesce(cast(navaids_points.navaidoperationalstatus.operationalstatus_value as varchar), '(' || navaids_points.navaidoperationalstatus.operationalstatus_nilreason || ')'),
    'signaltype', coalesce(cast(navaids_points.navaidoperationalstatus.signaltype_value as varchar), '(' || navaids_points.navaidoperationalstatus.signaltype_nilreason || ')')  ) AS json_data
from navaids_points.navaidoperationalstatus_pt 
inner join navaids_points.navaidoperationalstatus on navaids_points.navaidoperationalstatus_pt.navaidoperationalstatus_id = navaids_points.navaidoperationalstatus.id
left join master_join mj1 on navaids_points.navaidoperationalstatus.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    navaids_points.navaidoperationalstatus_pt.id,
    navaids_points.navaidoperationalstatus_pt.nilreason,
    navaids_points.navaidoperationalstatus.operationalstatus_value,
    navaids_points.navaidoperationalstatus.operationalstatus_nilreason,
    navaids_points.navaidoperationalstatus.signaltype_value,
    navaids_points.navaidoperationalstatus.signaltype_nilreason;
create or replace view procedure.navigationareasector_view as
select
    procedure.navigationareasector_pt.id,
    jsonb_agg(notes.note_view.note) AS navigationareasector_annotation,
    jsonb_build_object('nilreason', procedure.navigationareasector_pt.nilreason,
    'sectordefinition', shared.circlesector_view  ) AS json_data
from procedure.navigationareasector_pt 
inner join procedure.navigationareasector on procedure.navigationareasector_pt.navigationareasector_id = procedure.navigationareasector.id
left join master_join mj1 on procedure.navigationareasector.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join shared.circlesector_pt shared_circlesector_pt_qdzqiz on procedure.navigationareasector.sectordefinition_id = shared_circlesector_pt_qdzqiz.id
--object shared.obstruction.significantobstacle
--object procedure.sectordesign.sectorcriteria
--object notes.note.annotation
group by
    procedure.navigationareasector_pt.id,
    procedure.navigationareasector_pt.nilreason;
create or replace view service.nitrogen_view as
select
    service.nitrogen_pt.id,
    jsonb_agg(notes.note_view.note) AS nitrogen_annotation,
    jsonb_build_object('nilreason', service.nitrogen_pt.nilreason,
    'type', coalesce(cast(service.nitrogen.type_value as varchar), '(' || service.nitrogen.type_nilreason || ')')  ) AS json_data
from service.nitrogen_pt 
inner join service.nitrogen on service.nitrogen_pt.nitrogen_id = service.nitrogen.id
left join master_join mj1 on service.nitrogen.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    service.nitrogen_pt.id,
    service.nitrogen_pt.nilreason,
    service.nitrogen.type_value,
    service.nitrogen.type_nilreason;
create or replace view notes.note_view as
select
    notes.note_pt.id,
    jsonb_agg(notes.note_view.note) AS note_annotation,
    jsonb_build_object('nilreason', notes.note_pt.nilreason,
    'propertyname', coalesce(cast(notes.note.propertyname_value as varchar), '(' || notes.note.propertyname_nilreason || ')'),
    'purpose', coalesce(cast(notes.note.purpose_value as varchar), '(' || notes.note.purpose_nilreason || ')')  ) AS json_data
from notes.note_pt 
inner join notes.note on notes.note_pt.note_id = notes.note.id
left join master_join mj1 on notes.note.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.linguisticnote.translatednote
group by
    notes.note_pt.id,
    notes.note_pt.nilreason,
    notes.note.propertyname_value,
    notes.note.propertyname_nilreason,
    notes.note.purpose_value,
    notes.note.purpose_nilreason;
create or replace view shared.obstacleassessmentarea_view as
select
    shared.obstacleassessmentarea_pt.id,
    jsonb_agg(notes.note_view.note) AS obstacleassessmentarea_annotation,
    jsonb_build_object('nilreason', shared.obstacleassessmentarea_pt.nilreason,
    'type', coalesce(cast(shared.obstacleassessmentarea.type_value as varchar), '(' || shared.obstacleassessmentarea.type_nilreason || ')'),
    'sectionnumber', coalesce(cast(shared.obstacleassessmentarea.sectionnumber_value as varchar), '(' || shared.obstacleassessmentarea.sectionnumber_nilreason || ')'),
    'slope', coalesce(cast(shared.obstacleassessmentarea.slope_value as varchar), '(' || shared.obstacleassessmentarea.slope_nilreason || ')'),
    'gradientlowhigh', coalesce(cast(shared.obstacleassessmentarea.gradientlowhigh_value as varchar), '(' || shared.obstacleassessmentarea.gradientlowhigh_nilreason || ')'),
    'surfacezone', coalesce(cast(shared.obstacleassessmentarea.surfacezone_value as varchar), '(' || shared.obstacleassessmentarea.surfacezone_nilreason || ')'),
    'safetyregulation', coalesce(cast(shared.obstacleassessmentarea.safetyregulation_value as varchar), '(' || shared.obstacleassessmentarea.safetyregulation_nilreason || ')'),
    'assessedaltitude', coalesce(cast(shared.obstacleassessmentarea.assessedaltitude_value as varchar) || ' ' || shared.obstacleassessmentarea.assessedaltitude_uom, '(' || shared.obstacleassessmentarea.assessedaltitude_nilreason || ')'),
    'slopeloweraltitude', coalesce(cast(shared.obstacleassessmentarea.slopeloweraltitude_value as varchar) || ' ' || shared.obstacleassessmentarea.slopeloweraltitude_uom, '(' || shared.obstacleassessmentarea.slopeloweraltitude_nilreason || ')')  ) AS json_data
from shared.obstacleassessmentarea_pt 
inner join shared.obstacleassessmentarea on shared.obstacleassessmentarea_pt.obstacleassessmentarea_id = shared.obstacleassessmentarea.id
left join master_join mj1 on shared.obstacleassessmentarea.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.aircraftcharacteristic.aircraftcategory
--object shared.obstruction.significantobstacle
--object notes.note.annotation
group by
    shared.obstacleassessmentarea_pt.id,
    shared.obstacleassessmentarea_pt.nilreason,
    shared.obstacleassessmentarea.type_value,
    shared.obstacleassessmentarea.type_nilreason,
    shared.obstacleassessmentarea.sectionnumber_value,
    shared.obstacleassessmentarea.sectionnumber_nilreason,
    shared.obstacleassessmentarea.slope_value,
    shared.obstacleassessmentarea.slope_nilreason,
    shared.obstacleassessmentarea.gradientlowhigh_value,
    shared.obstacleassessmentarea.gradientlowhigh_nilreason,
    shared.obstacleassessmentarea.surfacezone_value,
    shared.obstacleassessmentarea.surfacezone_nilreason,
    shared.obstacleassessmentarea.safetyregulation_value,
    shared.obstacleassessmentarea.safetyregulation_nilreason,
    shared.obstacleassessmentarea.assessedaltitude_value,
    shared.obstacleassessmentarea.assessedaltitude_uom,
    shared.obstacleassessmentarea.assessedaltitude_nilreason,
    shared.obstacleassessmentarea.slopeloweraltitude_value,
    shared.obstacleassessmentarea.slopeloweraltitude_uom,
    shared.obstacleassessmentarea.slopeloweraltitude_nilreason;
create or replace view shared.obstacleplacement_view as
select
    shared.obstacleplacement_pt.id,
    jsonb_agg(notes.note_view.note) AS obstacleplacement_annotation,
    jsonb_build_object('nilreason', shared.obstacleplacement_pt.nilreason,
    'obstaclebearing', coalesce(cast(shared.obstacleplacement.obstaclebearing_value as varchar), '(' || shared.obstacleplacement.obstaclebearing_nilreason || ')'),
    'pointtype', coalesce(cast(shared.obstacleplacement.pointtype_value as varchar), '(' || shared.obstacleplacement.pointtype_nilreason || ')'),
    'obstacleplacement', coalesce(cast(shared.obstacleplacement.obstacleplacement_value as varchar), '(' || shared.obstacleplacement.obstacleplacement_nilreason || ')'),
    'obstacledistance', coalesce(cast(shared.obstacleplacement.obstacledistance_value as varchar) || ' ' || shared.obstacleplacement.obstacledistance_uom, '(' || shared.obstacleplacement.obstacledistance_nilreason || ')')  ) AS json_data
from shared.obstacleplacement_pt 
inner join shared.obstacleplacement on shared.obstacleplacement_pt.obstacleplacement_id = shared.obstacleplacement.id
left join master_join mj1 on shared.obstacleplacement.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.obstacleplacement_pt.id,
    shared.obstacleplacement_pt.nilreason,
    shared.obstacleplacement.obstaclebearing_value,
    shared.obstacleplacement.obstaclebearing_nilreason,
    shared.obstacleplacement.pointtype_value,
    shared.obstacleplacement.pointtype_nilreason,
    shared.obstacleplacement.obstacleplacement_value,
    shared.obstacleplacement.obstacleplacement_nilreason,
    shared.obstacleplacement.obstacledistance_value,
    shared.obstacleplacement.obstacledistance_uom,
    shared.obstacleplacement.obstacledistance_nilreason;
create or replace view shared.obstruction_view as
select
    shared.obstruction_pt.id,
    jsonb_agg(notes.note_view.note) AS obstruction_annotation,
    jsonb_build_object('nilreason', shared.obstruction_pt.nilreason,
    'surfacepenetration', coalesce(cast(shared.obstruction.surfacepenetration_value as varchar), '(' || shared.obstruction.surfacepenetration_nilreason || ')'),
    'slopepenetration', coalesce(cast(shared.obstruction.slopepenetration_value as varchar), '(' || shared.obstruction.slopepenetration_nilreason || ')'),
    'controlling', coalesce(cast(shared.obstruction.controlling_value as varchar), '(' || shared.obstruction.controlling_nilreason || ')'),
    'closein', coalesce(cast(shared.obstruction.closein_value as varchar), '(' || shared.obstruction.closein_nilreason || ')'),
    'requiredclearance', coalesce(cast(shared.obstruction.requiredclearance_value as varchar) || ' ' || shared.obstruction.requiredclearance_uom, '(' || shared.obstruction.requiredclearance_nilreason || ')'),
    'minimumaltitude', coalesce(cast(shared.obstruction.minimumaltitude_value as varchar) || ' ' || shared.obstruction.minimumaltitude_uom, '(' || shared.obstruction.minimumaltitude_nilreason || ')')  ) AS json_data
from shared.obstruction_pt 
inner join shared.obstruction on shared.obstruction_pt.obstruction_id = shared.obstruction.id
left join master_join mj1 on shared.obstruction.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.altitudeadjustment.adjustment
--object shared.obstacleplacement.obstacleplacement
--object notes.note.annotation
group by
    shared.obstruction_pt.id,
    shared.obstruction_pt.nilreason,
    shared.obstruction.surfacepenetration_value,
    shared.obstruction.surfacepenetration_nilreason,
    shared.obstruction.slopepenetration_value,
    shared.obstruction.slopepenetration_nilreason,
    shared.obstruction.controlling_value,
    shared.obstruction.controlling_nilreason,
    shared.obstruction.closein_value,
    shared.obstruction.closein_nilreason,
    shared.obstruction.requiredclearance_value,
    shared.obstruction.requiredclearance_uom,
    shared.obstruction.requiredclearance_nilreason,
    shared.obstruction.minimumaltitude_value,
    shared.obstruction.minimumaltitude_uom,
    shared.obstruction.minimumaltitude_nilreason;
create or replace view service.oil_view as
select
    service.oil_pt.id,
    jsonb_agg(notes.note_view.note) AS oil_annotation,
    jsonb_build_object('nilreason', service.oil_pt.nilreason,
    'category', coalesce(cast(service.oil.category_value as varchar), '(' || service.oil.category_nilreason || ')')  ) AS json_data
from service.oil_pt 
inner join service.oil on service.oil_pt.oil_id = service.oil.id
left join master_join mj1 on service.oil.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    service.oil_pt.id,
    service.oil_pt.nilreason,
    service.oil.category_value,
    service.oil.category_nilreason;
create or replace view shared.onlinecontact_view as
select
    shared.onlinecontact_pt.id,
    jsonb_agg(notes.note_view.note) AS onlinecontact_annotation,
    jsonb_build_object('nilreason', shared.onlinecontact_pt.nilreason,
    'network', coalesce(cast(shared.onlinecontact.network_value as varchar), '(' || shared.onlinecontact.network_nilreason || ')'),
    'linkage', coalesce(cast(shared.onlinecontact.linkage_value as varchar), '(' || shared.onlinecontact.linkage_nilreason || ')'),
    'protocol', coalesce(cast(shared.onlinecontact.protocol_value as varchar), '(' || shared.onlinecontact.protocol_nilreason || ')'),
    'email', coalesce(cast(shared.onlinecontact.email_value as varchar), '(' || shared.onlinecontact.email_nilreason || ')')  ) AS json_data
from shared.onlinecontact_pt 
inner join shared.onlinecontact on shared.onlinecontact_pt.onlinecontact_id = shared.onlinecontact.id
left join master_join mj1 on shared.onlinecontact.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    shared.onlinecontact_pt.id,
    shared.onlinecontact_pt.nilreason,
    shared.onlinecontact.network_value,
    shared.onlinecontact.network_nilreason,
    shared.onlinecontact.linkage_value,
    shared.onlinecontact.linkage_nilreason,
    shared.onlinecontact.protocol_value,
    shared.onlinecontact.protocol_nilreason,
    shared.onlinecontact.email_value,
    shared.onlinecontact.email_nilreason;
create or replace view organisation.organisationauthorityassociation_view as
select
    organisation.organisationauthorityassociation_pt.id,
    jsonb_agg(notes.note_view.note) AS organisationauthorityassociation_annotation,
    jsonb_build_object('nilreason', organisation.organisationauthorityassociation_pt.nilreason,
    'type', coalesce(cast(organisation.organisationauthorityassociation.type_value as varchar), '(' || organisation.organisationauthorityassociation.type_nilreason || ')')  ) AS json_data
from organisation.organisationauthorityassociation_pt 
inner join organisation.organisationauthorityassociation on organisation.organisationauthorityassociation_pt.organisationauthorityassociation_id = organisation.organisationauthorityassociation.id
left join master_join mj1 on organisation.organisationauthorityassociation.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    organisation.organisationauthorityassociation_pt.id,
    organisation.organisationauthorityassociation_pt.nilreason,
    organisation.organisationauthorityassociation.type_value,
    organisation.organisationauthorityassociation.type_nilreason;
create or replace view service.oxygen_view as
select
    service.oxygen_pt.id,
    jsonb_agg(notes.note_view.note) AS oxygen_annotation,
    jsonb_build_object('nilreason', service.oxygen_pt.nilreason,
    'type', coalesce(cast(service.oxygen.type_value as varchar), '(' || service.oxygen.type_nilreason || ')')  ) AS json_data
from service.oxygen_pt 
inner join service.oxygen on service.oxygen_pt.oxygen_id = service.oxygen.id
left join master_join mj1 on service.oxygen.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    service.oxygen_pt.id,
    service.oxygen_pt.nilreason,
    service.oxygen.type_value,
    service.oxygen.type_nilreason;
create or replace view navaids_points.pointreference_view as
select
    navaids_points.pointreference_pt.id,
    jsonb_agg(notes.note_view.note) AS pointreference_annotation,
    jsonb_build_object('nilreason', navaids_points.pointreference_pt.nilreason,
    'role', coalesce(cast(navaids_points.pointreference.role_value as varchar), '(' || navaids_points.pointreference.role_nilreason || ')'),
    'priorfixtolerance', coalesce(cast(navaids_points.pointreference.priorfixtolerance_value as varchar) || ' ' || navaids_points.pointreference.priorfixtolerance_uom, '(' || navaids_points.pointreference.priorfixtolerance_nilreason || ')'),
    'postfixtolerance', coalesce(cast(navaids_points.pointreference.postfixtolerance_value as varchar) || ' ' || navaids_points.pointreference.postfixtolerance_uom, '(' || navaids_points.pointreference.postfixtolerance_nilreason || ')')  ) AS json_data
from navaids_points.pointreference_pt 
inner join navaids_points.pointreference on navaids_points.pointreference_pt.pointreference_id = navaids_points.pointreference.id
left join master_join mj1 on navaids_points.pointreference.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object navaids_points.angleuse.facilityangle
--object notes.note.annotation
group by
    navaids_points.pointreference_pt.id,
    navaids_points.pointreference_pt.nilreason,
    navaids_points.pointreference.role_value,
    navaids_points.pointreference.role_nilreason,
    navaids_points.pointreference.priorfixtolerance_value,
    navaids_points.pointreference.priorfixtolerance_uom,
    navaids_points.pointreference.priorfixtolerance_nilreason,
    navaids_points.pointreference.postfixtolerance_value,
    navaids_points.pointreference.postfixtolerance_uom,
    navaids_points.pointreference.postfixtolerance_nilreason;
create or replace view shared.postaladdress_view as
select
    shared.postaladdress_pt.id,
    jsonb_agg(notes.note_view.note) AS postaladdress_annotation,
    jsonb_build_object('nilreason', shared.postaladdress_pt.nilreason,
    'deliverypoint', coalesce(cast(shared.postaladdress.deliverypoint_value as varchar), '(' || shared.postaladdress.deliverypoint_nilreason || ')'),
    'city', coalesce(cast(shared.postaladdress.city_value as varchar), '(' || shared.postaladdress.city_nilreason || ')'),
    'administrativearea', coalesce(cast(shared.postaladdress.administrativearea_value as varchar), '(' || shared.postaladdress.administrativearea_nilreason || ')'),
    'postalcode', coalesce(cast(shared.postaladdress.postalcode_value as varchar), '(' || shared.postaladdress.postalcode_nilreason || ')'),
    'country', coalesce(cast(shared.postaladdress.country_value as varchar), '(' || shared.postaladdress.country_nilreason || ')')  ) AS json_data
from shared.postaladdress_pt 
inner join shared.postaladdress on shared.postaladdress_pt.postaladdress_id = shared.postaladdress.id
left join master_join mj1 on shared.postaladdress.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    shared.postaladdress_pt.id,
    shared.postaladdress_pt.nilreason,
    shared.postaladdress.deliverypoint_value,
    shared.postaladdress.deliverypoint_nilreason,
    shared.postaladdress.city_value,
    shared.postaladdress.city_nilreason,
    shared.postaladdress.administrativearea_value,
    shared.postaladdress.administrativearea_nilreason,
    shared.postaladdress.postalcode_value,
    shared.postaladdress.postalcode_nilreason,
    shared.postaladdress.country_value,
    shared.postaladdress.country_nilreason;
create or replace view procedure.procedureavailability_view as
select
    procedure.procedureavailability_pt.id,
    jsonb_agg(notes.note_view.note) AS procedureavailability_annotation,
    jsonb_build_object('nilreason', procedure.procedureavailability_pt.nilreason,
    'status', coalesce(cast(procedure.procedureavailability.status_value as varchar), '(' || procedure.procedureavailability.status_nilreason || ')')  ) AS json_data
from procedure.procedureavailability_pt 
inner join procedure.procedureavailability on procedure.procedureavailability_pt.procedureavailability_id = procedure.procedureavailability.id
left join master_join mj1 on procedure.procedureavailability.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    procedure.procedureavailability_pt.id,
    procedure.procedureavailability_pt.nilreason,
    procedure.procedureavailability.status_value,
    procedure.procedureavailability.status_nilreason;
create or replace view procedure.proceduretransitionleg_view as
select
    procedure.proceduretransitionleg_pt.id,
    jsonb_agg(notes.note_view.note) AS proceduretransitionleg_annotation,
    jsonb_build_object('nilreason', procedure.proceduretransitionleg_pt.nilreason,
    'seqnumberarinc', coalesce(cast(procedure.proceduretransitionleg.seqnumberarinc_value as varchar), '(' || procedure.proceduretransitionleg.seqnumberarinc_nilreason || ')')  ) AS json_data
from procedure.proceduretransitionleg_pt 
inner join procedure.proceduretransitionleg on procedure.proceduretransitionleg_pt.proceduretransitionleg_id = procedure.proceduretransitionleg.id
left join master_join mj1 on procedure.proceduretransitionleg.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.proceduretransitionleg_pt.id,
    procedure.proceduretransitionleg_pt.nilreason,
    procedure.proceduretransitionleg.seqnumberarinc_value,
    procedure.proceduretransitionleg.seqnumberarinc_nilreason;
create or replace view procedure.proceduretransition_view as
select
    procedure.proceduretransition_pt.id,
    jsonb_agg(notes.note_view.note) AS proceduretransition_annotation,
    jsonb_build_object('nilreason', procedure.proceduretransition_pt.nilreason,
    'transitionid', coalesce(cast(procedure.proceduretransition.transitionid_value as varchar), '(' || procedure.proceduretransition.transitionid_nilreason || ')'),
    'type', coalesce(cast(procedure.proceduretransition.type_value as varchar), '(' || procedure.proceduretransition.type_nilreason || ')'),
    'instruction', coalesce(cast(procedure.proceduretransition.instruction_value as varchar), '(' || procedure.proceduretransition.instruction_nilreason || ')'),
    'vectorheading', coalesce(cast(procedure.proceduretransition.vectorheading_value as varchar), '(' || procedure.proceduretransition.vectorheading_nilreason || ')'),
    'departurerunwaytransition', procedure.landingtakeoffareacollection_view  ) AS json_data
from procedure.proceduretransition_pt 
inner join procedure.proceduretransition on procedure.proceduretransition_pt.proceduretransition_id = procedure.proceduretransition.id
left join master_join mj1 on procedure.proceduretransition.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join procedure.landingtakeoffareacollection_pt procedure_landingtakeoffareacollection_pt_npxivw on procedure.proceduretransition.departurerunwaytransition_id = procedure_landingtakeoffareacollection_pt_npxivw.id
--object procedure.proceduretransitionleg.transitionleg
--object notes.note.annotation
group by
    procedure.proceduretransition_pt.id,
    procedure.proceduretransition_pt.nilreason,
    procedure.proceduretransition.transitionid_value,
    procedure.proceduretransition.transitionid_nilreason,
    procedure.proceduretransition.type_value,
    procedure.proceduretransition.type_nilreason,
    procedure.proceduretransition.instruction_value,
    procedure.proceduretransition.instruction_nilreason,
    procedure.proceduretransition.vectorheading_value,
    procedure.proceduretransition.vectorheading_nilreason;
create or replace view shared.propertieswithschedule_view as
select
    shared.propertieswithschedule_pt.id,
    jsonb_agg(notes.note_view.note) AS propertieswithschedule_annotation,
    jsonb_build_object('nilreason', shared.propertieswithschedule_pt.nilreason  ) AS json_data
from shared.propertieswithschedule_pt 
inner join shared.propertieswithschedule on shared.propertieswithschedule_pt.propertieswithschedule_id = shared.propertieswithschedule.id
left join master_join mj1 on shared.propertieswithschedule.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
group by
    shared.propertieswithschedule_pt.id,
    shared.propertieswithschedule_pt.nilreason;
create or replace view surveillance.radarcomponent_view as
select
    surveillance.radarcomponent_pt.id,
    jsonb_agg(notes.note_view.note) AS radarcomponent_annotation,
    jsonb_build_object('nilreason', surveillance.radarcomponent_pt.nilreason,
    'collocationgroup', coalesce(cast(surveillance.radarcomponent.collocationgroup_value as varchar), '(' || surveillance.radarcomponent.collocationgroup_nilreason || ')')  ) AS json_data
from surveillance.radarcomponent_pt 
inner join surveillance.radarcomponent on surveillance.radarcomponent_pt.radarcomponent_id = surveillance.radarcomponent.id
left join master_join mj1 on surveillance.radarcomponent.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    surveillance.radarcomponent_pt.id,
    surveillance.radarcomponent_pt.nilreason,
    surveillance.radarcomponent.collocationgroup_value,
    surveillance.radarcomponent.collocationgroup_nilreason;
create or replace view service.radiocommunicationoperationalstatus_view as
select
    service.radiocommunicationoperationalstatus_pt.id,
    jsonb_agg(notes.note_view.note) AS radiocommunicationoperationalstatus_annotation,
    jsonb_build_object('nilreason', service.radiocommunicationoperationalstatus_pt.nilreason,
    'operationalstatus', coalesce(cast(service.radiocommunicationoperationalstatus.operationalstatus_value as varchar), '(' || service.radiocommunicationoperationalstatus.operationalstatus_nilreason || ')')  ) AS json_data
from service.radiocommunicationoperationalstatus_pt 
inner join service.radiocommunicationoperationalstatus on service.radiocommunicationoperationalstatus_pt.radiocommunicationoperationalstatus_id = service.radiocommunicationoperationalstatus.id
left join master_join mj1 on service.radiocommunicationoperationalstatus.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    service.radiocommunicationoperationalstatus_pt.id,
    service.radiocommunicationoperationalstatus_pt.nilreason,
    service.radiocommunicationoperationalstatus.operationalstatus_value,
    service.radiocommunicationoperationalstatus.operationalstatus_nilreason;
create or replace view surveillance.reflector_view as
select
    surveillance.reflector_pt.id,
    jsonb_agg(notes.note_view.note) AS reflector_annotation,
    jsonb_build_object('nilreason', surveillance.reflector_pt.nilreason,
    'type', coalesce(cast(surveillance.reflector.type_value as varchar), '(' || surveillance.reflector.type_nilreason || ')')  ) AS json_data
from surveillance.reflector_pt 
inner join surveillance.reflector on surveillance.reflector_pt.reflector_id = surveillance.reflector.id
left join master_join mj1 on surveillance.reflector.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    surveillance.reflector_pt.id,
    surveillance.reflector_pt.nilreason,
    surveillance.reflector.type_value,
    surveillance.reflector.type_nilreason;
create or replace view airport_heliport.ridge_view as
select
    airport_heliport.ridge_pt.id,
    jsonb_agg(notes.note_view.note) AS ridge_annotation,
    jsonb_build_object('nilreason', airport_heliport.ridge_pt.nilreason,
    'side', coalesce(cast(airport_heliport.ridge.side_value as varchar), '(' || airport_heliport.ridge.side_nilreason || ')'),
    'distance', coalesce(cast(airport_heliport.ridge.distance_value as varchar) || ' ' || airport_heliport.ridge.distance_uom, '(' || airport_heliport.ridge.distance_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.ridge.depth_value as varchar) || ' ' || airport_heliport.ridge.depth_uom, '(' || airport_heliport.ridge.depth_nilreason || ')')  ) AS json_data
from airport_heliport.ridge_pt 
inner join airport_heliport.ridge on airport_heliport.ridge_pt.ridge_id = airport_heliport.ridge.id
left join master_join mj1 on airport_heliport.ridge.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airport_heliport.ridge_pt.id,
    airport_heliport.ridge_pt.nilreason,
    airport_heliport.ridge.side_value,
    airport_heliport.ridge.side_nilreason,
    airport_heliport.ridge.distance_value,
    airport_heliport.ridge.distance_uom,
    airport_heliport.ridge.distance_nilreason,
    airport_heliport.ridge.depth_value,
    airport_heliport.ridge.depth_uom,
    airport_heliport.ridge.depth_nilreason;
create or replace view routes.routeavailability_view as
select
    routes.routeavailability_pt.id,
    jsonb_agg(notes.note_view.note) AS routeavailability_annotation,
    jsonb_build_object('nilreason', routes.routeavailability_pt.nilreason,
    'direction', coalesce(cast(routes.routeavailability.direction_value as varchar), '(' || routes.routeavailability.direction_nilreason || ')'),
    'cardinaldirection', coalesce(cast(routes.routeavailability.cardinaldirection_value as varchar), '(' || routes.routeavailability.cardinaldirection_nilreason || ')'),
    'status', coalesce(cast(routes.routeavailability.status_value as varchar), '(' || routes.routeavailability.status_nilreason || ')')  ) AS json_data
from routes.routeavailability_pt 
inner join routes.routeavailability on routes.routeavailability_pt.routeavailability_id = routes.routeavailability.id
left join master_join mj1 on routes.routeavailability.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object shared.airspacelayer.levels
group by
    routes.routeavailability_pt.id,
    routes.routeavailability_pt.nilreason,
    routes.routeavailability.direction_value,
    routes.routeavailability.direction_nilreason,
    routes.routeavailability.cardinaldirection_value,
    routes.routeavailability.cardinaldirection_nilreason,
    routes.routeavailability.status_value,
    routes.routeavailability.status_nilreason;
create or replace view routes.routeportion_view as
select
    routes.routeportion_pt.id,
    jsonb_agg(notes.note_view.note) AS routeportion_annotation,
    jsonb_build_object('nilreason', routes.routeportion_pt.nilreason  ) AS json_data
from routes.routeportion_pt 
inner join routes.routeportion on routes.routeportion_pt.routeportion_id = routes.routeportion.id
left join master_join mj1 on routes.routeportion.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    routes.routeportion_pt.id,
    routes.routeportion_pt.nilreason;
create or replace view airport_heliport.runwaycontamination_view as
select
    airport_heliport.runwaycontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS runwaycontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.runwaycontamination_pt.nilreason,
    'frictioncoefficient', coalesce(cast(airport_heliport.runwaycontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaycontamination.frictioncoefficient_nilreason || ')'),
    'frictionestimation', coalesce(cast(airport_heliport.runwaycontamination.frictionestimation_value as varchar), '(' || airport_heliport.runwaycontamination.frictionestimation_nilreason || ')'),
    'frictiondevice', coalesce(cast(airport_heliport.runwaycontamination.frictiondevice_value as varchar), '(' || airport_heliport.runwaycontamination.frictiondevice_nilreason || ')'),
    'obscuredlights', coalesce(cast(airport_heliport.runwaycontamination.obscuredlights_value as varchar), '(' || airport_heliport.runwaycontamination.obscuredlights_nilreason || ')'),
    'furtherclearancetime', coalesce(cast(airport_heliport.runwaycontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaycontamination.furtherclearancetime_nilreason || ')'),
    'furthertotalclearance', coalesce(cast(airport_heliport.runwaycontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaycontamination.furthertotalclearance_nilreason || ')'),
    'proportion', coalesce(cast(airport_heliport.runwaycontamination.proportion_value as varchar), '(' || airport_heliport.runwaycontamination.proportion_nilreason || ')'),
    'clearedside', coalesce(cast(airport_heliport.runwaycontamination.clearedside_value as varchar), '(' || airport_heliport.runwaycontamination.clearedside_nilreason || ')'),
    'obscuredlightsside', coalesce(cast(airport_heliport.runwaycontamination.obscuredlightsside_value as varchar), '(' || airport_heliport.runwaycontamination.obscuredlightsside_nilreason || ')'),
    'taxiwayavailable', coalesce(cast(airport_heliport.runwaycontamination.taxiwayavailable_value as varchar), '(' || airport_heliport.runwaycontamination.taxiwayavailable_nilreason || ')'),
    'apronavailable', coalesce(cast(airport_heliport.runwaycontamination.apronavailable_value as varchar), '(' || airport_heliport.runwaycontamination.apronavailable_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.runwaycontamination.depth_value as varchar) || ' ' || airport_heliport.runwaycontamination.depth_uom, '(' || airport_heliport.runwaycontamination.depth_nilreason || ')'),
    'clearedlength', coalesce(cast(airport_heliport.runwaycontamination.clearedlength_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedlength_uom, '(' || airport_heliport.runwaycontamination.clearedlength_nilreason || ')'),
    'clearedwidth', coalesce(cast(airport_heliport.runwaycontamination.clearedwidth_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedwidth_uom, '(' || airport_heliport.runwaycontamination.clearedwidth_nilreason || ')'),
    'furtherclearancelength', coalesce(cast(airport_heliport.runwaycontamination.furtherclearancelength_value as varchar) || ' ' || airport_heliport.runwaycontamination.furtherclearancelength_uom, '(' || airport_heliport.runwaycontamination.furtherclearancelength_nilreason || ')'),
    'furtherclearancewidth', coalesce(cast(airport_heliport.runwaycontamination.furtherclearancewidth_value as varchar) || ' ' || airport_heliport.runwaycontamination.furtherclearancewidth_uom, '(' || airport_heliport.runwaycontamination.furtherclearancewidth_nilreason || ')'),
    'clearedlengthbegin', coalesce(cast(airport_heliport.runwaycontamination.clearedlengthbegin_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedlengthbegin_uom, '(' || airport_heliport.runwaycontamination.clearedlengthbegin_nilreason || ')')  ) AS json_data
from airport_heliport.runwaycontamination_pt 
inner join airport_heliport.runwaycontamination on airport_heliport.runwaycontamination_pt.runwaycontamination_id = airport_heliport.runwaycontamination.id
left join master_join mj1 on airport_heliport.runwaycontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.ridge.criticalridge
--object airport_heliport.surfacecontaminationlayer.layer
--object notes.note.annotation
group by
    airport_heliport.runwaycontamination_pt.id,
    airport_heliport.runwaycontamination_pt.nilreason,
    airport_heliport.runwaycontamination.frictioncoefficient_value,
    airport_heliport.runwaycontamination.frictioncoefficient_nilreason,
    airport_heliport.runwaycontamination.frictionestimation_value,
    airport_heliport.runwaycontamination.frictionestimation_nilreason,
    airport_heliport.runwaycontamination.frictiondevice_value,
    airport_heliport.runwaycontamination.frictiondevice_nilreason,
    airport_heliport.runwaycontamination.obscuredlights_value,
    airport_heliport.runwaycontamination.obscuredlights_nilreason,
    airport_heliport.runwaycontamination.furtherclearancetime_value,
    airport_heliport.runwaycontamination.furtherclearancetime_nilreason,
    airport_heliport.runwaycontamination.furthertotalclearance_value,
    airport_heliport.runwaycontamination.furthertotalclearance_nilreason,
    airport_heliport.runwaycontamination.proportion_value,
    airport_heliport.runwaycontamination.proportion_nilreason,
    airport_heliport.runwaycontamination.clearedside_value,
    airport_heliport.runwaycontamination.clearedside_nilreason,
    airport_heliport.runwaycontamination.obscuredlightsside_value,
    airport_heliport.runwaycontamination.obscuredlightsside_nilreason,
    airport_heliport.runwaycontamination.taxiwayavailable_value,
    airport_heliport.runwaycontamination.taxiwayavailable_nilreason,
    airport_heliport.runwaycontamination.apronavailable_value,
    airport_heliport.runwaycontamination.apronavailable_nilreason,
    airport_heliport.runwaycontamination.depth_value,
    airport_heliport.runwaycontamination.depth_uom,
    airport_heliport.runwaycontamination.depth_nilreason,
    airport_heliport.runwaycontamination.clearedlength_value,
    airport_heliport.runwaycontamination.clearedlength_uom,
    airport_heliport.runwaycontamination.clearedlength_nilreason,
    airport_heliport.runwaycontamination.clearedwidth_value,
    airport_heliport.runwaycontamination.clearedwidth_uom,
    airport_heliport.runwaycontamination.clearedwidth_nilreason,
    airport_heliport.runwaycontamination.furtherclearancelength_value,
    airport_heliport.runwaycontamination.furtherclearancelength_uom,
    airport_heliport.runwaycontamination.furtherclearancelength_nilreason,
    airport_heliport.runwaycontamination.furtherclearancewidth_value,
    airport_heliport.runwaycontamination.furtherclearancewidth_uom,
    airport_heliport.runwaycontamination.furtherclearancewidth_nilreason,
    airport_heliport.runwaycontamination.clearedlengthbegin_value,
    airport_heliport.runwaycontamination.clearedlengthbegin_uom,
    airport_heliport.runwaycontamination.clearedlengthbegin_nilreason;
create or replace view airport_heliport.runwaydeclareddistance_view as
select
    airport_heliport.runwaydeclareddistance_pt.id,
    jsonb_agg(notes.note_view.note) AS runwaydeclareddistance_annotation,
    jsonb_build_object('nilreason', airport_heliport.runwaydeclareddistance_pt.nilreason,
    'type', coalesce(cast(airport_heliport.runwaydeclareddistance.type_value as varchar), '(' || airport_heliport.runwaydeclareddistance.type_nilreason || ')')  ) AS json_data
from airport_heliport.runwaydeclareddistance_pt 
inner join airport_heliport.runwaydeclareddistance on airport_heliport.runwaydeclareddistance_pt.runwaydeclareddistance_id = airport_heliport.runwaydeclareddistance.id
left join master_join mj1 on airport_heliport.runwaydeclareddistance.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.runwaydeclareddistancevalue.declaredvalue
--object notes.note.annotation
group by
    airport_heliport.runwaydeclareddistance_pt.id,
    airport_heliport.runwaydeclareddistance_pt.nilreason,
    airport_heliport.runwaydeclareddistance.type_value,
    airport_heliport.runwaydeclareddistance.type_nilreason;
create or replace view airport_heliport.runwaydeclareddistancevalue_view as
select
    airport_heliport.runwaydeclareddistancevalue_pt.id,
    jsonb_agg(notes.note_view.note) AS runwaydeclareddistancevalue_annotation,
    jsonb_build_object('nilreason', airport_heliport.runwaydeclareddistancevalue_pt.nilreason,
    'distance', coalesce(cast(airport_heliport.runwaydeclareddistancevalue.distance_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue.distance_uom, '(' || airport_heliport.runwaydeclareddistancevalue.distance_nilreason || ')'),
    'distanceaccuracy', coalesce(cast(airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_uom, '(' || airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_nilreason || ')')  ) AS json_data
from airport_heliport.runwaydeclareddistancevalue_pt 
inner join airport_heliport.runwaydeclareddistancevalue on airport_heliport.runwaydeclareddistancevalue_pt.runwaydeclareddistancevalue_id = airport_heliport.runwaydeclareddistancevalue.id
left join master_join mj1 on airport_heliport.runwaydeclareddistancevalue.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    airport_heliport.runwaydeclareddistancevalue_pt.id,
    airport_heliport.runwaydeclareddistancevalue_pt.nilreason,
    airport_heliport.runwaydeclareddistancevalue.distance_value,
    airport_heliport.runwaydeclareddistancevalue.distance_uom,
    airport_heliport.runwaydeclareddistancevalue.distance_nilreason,
    airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_value,
    airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_uom,
    airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_nilreason;
create or replace view airport_heliport.runwaysectioncontamination_view as
select
    airport_heliport.runwaysectioncontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS runwaysectioncontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.runwaysectioncontamination_pt.nilreason,
    'frictioncoefficient', coalesce(cast(airport_heliport.runwaysectioncontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictioncoefficient_nilreason || ')'),
    'frictionestimation', coalesce(cast(airport_heliport.runwaysectioncontamination.frictionestimation_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictionestimation_nilreason || ')'),
    'frictiondevice', coalesce(cast(airport_heliport.runwaysectioncontamination.frictiondevice_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictiondevice_nilreason || ')'),
    'obscuredlights', coalesce(cast(airport_heliport.runwaysectioncontamination.obscuredlights_value as varchar), '(' || airport_heliport.runwaysectioncontamination.obscuredlights_nilreason || ')'),
    'furtherclearancetime', coalesce(cast(airport_heliport.runwaysectioncontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaysectioncontamination.furtherclearancetime_nilreason || ')'),
    'furthertotalclearance', coalesce(cast(airport_heliport.runwaysectioncontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaysectioncontamination.furthertotalclearance_nilreason || ')'),
    'proportion', coalesce(cast(airport_heliport.runwaysectioncontamination.proportion_value as varchar), '(' || airport_heliport.runwaysectioncontamination.proportion_nilreason || ')'),
    'section', coalesce(cast(airport_heliport.runwaysectioncontamination.section_value as varchar), '(' || airport_heliport.runwaysectioncontamination.section_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.runwaysectioncontamination.depth_value as varchar) || ' ' || airport_heliport.runwaysectioncontamination.depth_uom, '(' || airport_heliport.runwaysectioncontamination.depth_nilreason || ')')  ) AS json_data
from airport_heliport.runwaysectioncontamination_pt 
inner join airport_heliport.runwaysectioncontamination on airport_heliport.runwaysectioncontamination_pt.runwaysectioncontamination_id = airport_heliport.runwaysectioncontamination.id
left join master_join mj1 on airport_heliport.runwaysectioncontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.ridge.criticalridge
--object airport_heliport.surfacecontaminationlayer.layer
--object notes.note.annotation
group by
    airport_heliport.runwaysectioncontamination_pt.id,
    airport_heliport.runwaysectioncontamination_pt.nilreason,
    airport_heliport.runwaysectioncontamination.frictioncoefficient_value,
    airport_heliport.runwaysectioncontamination.frictioncoefficient_nilreason,
    airport_heliport.runwaysectioncontamination.frictionestimation_value,
    airport_heliport.runwaysectioncontamination.frictionestimation_nilreason,
    airport_heliport.runwaysectioncontamination.frictiondevice_value,
    airport_heliport.runwaysectioncontamination.frictiondevice_nilreason,
    airport_heliport.runwaysectioncontamination.obscuredlights_value,
    airport_heliport.runwaysectioncontamination.obscuredlights_nilreason,
    airport_heliport.runwaysectioncontamination.furtherclearancetime_value,
    airport_heliport.runwaysectioncontamination.furtherclearancetime_nilreason,
    airport_heliport.runwaysectioncontamination.furthertotalclearance_value,
    airport_heliport.runwaysectioncontamination.furthertotalclearance_nilreason,
    airport_heliport.runwaysectioncontamination.proportion_value,
    airport_heliport.runwaysectioncontamination.proportion_nilreason,
    airport_heliport.runwaysectioncontamination.section_value,
    airport_heliport.runwaysectioncontamination.section_nilreason,
    airport_heliport.runwaysectioncontamination.depth_value,
    airport_heliport.runwaysectioncontamination.depth_uom,
    airport_heliport.runwaysectioncontamination.depth_nilreason;
create or replace view procedure.safealtitudeareasector_view as
select
    procedure.safealtitudeareasector_pt.id,
    jsonb_agg(notes.note_view.note) AS safealtitudeareasector_annotation,
    jsonb_build_object('nilreason', procedure.safealtitudeareasector_pt.nilreason,
    'bufferwidth', coalesce(cast(procedure.safealtitudeareasector.bufferwidth_value as varchar) || ' ' || procedure.safealtitudeareasector.bufferwidth_uom, '(' || procedure.safealtitudeareasector.bufferwidth_nilreason || ')'),
    'sectordefinition', shared.circlesector_view  ) AS json_data
from procedure.safealtitudeareasector_pt 
inner join procedure.safealtitudeareasector on procedure.safealtitudeareasector_pt.safealtitudeareasector_id = procedure.safealtitudeareasector.id
left join master_join mj1 on procedure.safealtitudeareasector.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join shared.circlesector_pt shared_circlesector_pt_grkscp on procedure.safealtitudeareasector.sectordefinition_id = shared_circlesector_pt_grkscp.id
--object shared.obstruction.significantobstacle
--object notes.note.annotation
group by
    procedure.safealtitudeareasector_pt.id,
    procedure.safealtitudeareasector_pt.nilreason,
    procedure.safealtitudeareasector.bufferwidth_value,
    procedure.safealtitudeareasector.bufferwidth_uom,
    procedure.safealtitudeareasector.bufferwidth_nilreason;
create or replace view procedure.sectordesign_view as
select
    procedure.sectordesign_pt.id,
    jsonb_agg(notes.note_view.note) AS sectordesign_annotation,
    jsonb_build_object('nilreason', procedure.sectordesign_pt.nilreason,
    'turndirection', coalesce(cast(procedure.sectordesign.turndirection_value as varchar), '(' || procedure.sectordesign.turndirection_nilreason || ')'),
    'designgradient', coalesce(cast(procedure.sectordesign.designgradient_value as varchar), '(' || procedure.sectordesign.designgradient_nilreason || ')'),
    'turnpermitted', coalesce(cast(procedure.sectordesign.turnpermitted_value as varchar), '(' || procedure.sectordesign.turnpermitted_nilreason || ')'),
    'terminationaltitude', coalesce(cast(procedure.sectordesign.terminationaltitude_value as varchar) || ' ' || procedure.sectordesign.terminationaltitude_uom, '(' || procedure.sectordesign.terminationaltitude_nilreason || ')')  ) AS json_data
from procedure.sectordesign_pt 
inner join procedure.sectordesign on procedure.sectordesign_pt.sectordesign_id = procedure.sectordesign.id
left join master_join mj1 on procedure.sectordesign.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    procedure.sectordesign_pt.id,
    procedure.sectordesign_pt.nilreason,
    procedure.sectordesign.turndirection_value,
    procedure.sectordesign.turndirection_nilreason,
    procedure.sectordesign.designgradient_value,
    procedure.sectordesign.designgradient_nilreason,
    procedure.sectordesign.turnpermitted_value,
    procedure.sectordesign.turnpermitted_nilreason,
    procedure.sectordesign.terminationaltitude_value,
    procedure.sectordesign.terminationaltitude_uom,
    procedure.sectordesign.terminationaltitude_nilreason;
create or replace view navaids_points.segmentpoint_view as
select
    navaids_points.segmentpoint_pt.id,
    jsonb_agg(notes.note_view.note) AS segmentpoint_annotation,
    jsonb_build_object('nilreason', navaids_points.segmentpoint_pt.nilreason  ) AS json_data
from navaids_points.segmentpoint_pt 
inner join navaids_points.segmentpoint on navaids_points.segmentpoint_pt.segmentpoint_id = navaids_points.segmentpoint.id
left join master_join mj1 on navaids_points.segmentpoint.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
group by
    navaids_points.segmentpoint_pt.id,
    navaids_points.segmentpoint_pt.nilreason;
create or replace view service.serviceoperationalstatus_view as
select
    service.serviceoperationalstatus_pt.id,
    jsonb_agg(notes.note_view.note) AS serviceoperationalstatus_annotation,
    jsonb_build_object('nilreason', service.serviceoperationalstatus_pt.nilreason,
    'operationalstatus', coalesce(cast(service.serviceoperationalstatus.operationalstatus_value as varchar), '(' || service.serviceoperationalstatus.operationalstatus_nilreason || ')')  ) AS json_data
from service.serviceoperationalstatus_pt 
inner join service.serviceoperationalstatus on service.serviceoperationalstatus_pt.serviceoperationalstatus_id = service.serviceoperationalstatus.id
left join master_join mj1 on service.serviceoperationalstatus.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    service.serviceoperationalstatus_pt.id,
    service.serviceoperationalstatus_pt.nilreason,
    service.serviceoperationalstatus.operationalstatus_value,
    service.serviceoperationalstatus.operationalstatus_nilreason;
create or replace view navaids_points.specialnavigationstationstatus_view as
select
    navaids_points.specialnavigationstationstatus_pt.id,
    jsonb_agg(notes.note_view.note) AS specialnavigationstationstatus_annotation,
    jsonb_build_object('nilreason', navaids_points.specialnavigationstationstatus_pt.nilreason,
    'operationalstatus', coalesce(cast(navaids_points.specialnavigationstationstatus.operationalstatus_value as varchar), '(' || navaids_points.specialnavigationstationstatus.operationalstatus_nilreason || ')')  ) AS json_data
from navaids_points.specialnavigationstationstatus_pt 
inner join navaids_points.specialnavigationstationstatus on navaids_points.specialnavigationstationstatus_pt.specialnavigationstationstatus_id = navaids_points.specialnavigationstationstatus.id
left join master_join mj1 on navaids_points.specialnavigationstationstatus.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    navaids_points.specialnavigationstationstatus_pt.id,
    navaids_points.specialnavigationstationstatus_pt.nilreason,
    navaids_points.specialnavigationstationstatus.operationalstatus_value,
    navaids_points.specialnavigationstationstatus.operationalstatus_nilreason;
create or replace view shared.standardlevel_view as
select
    shared.standardlevel_pt.id,
    jsonb_agg(notes.note_view.note) AS standardlevel_annotation,
    jsonb_build_object('nilreason', shared.standardlevel_pt.nilreason,
    'verticaldistance', coalesce(cast(shared.standardlevel.verticaldistance_value as varchar) || ' ' || shared.standardlevel.verticaldistance_uom, '(' || shared.standardlevel.verticaldistance_nilreason || ')')  ) AS json_data
from shared.standardlevel_pt 
inner join shared.standardlevel on shared.standardlevel_pt.standardlevel_id = shared.standardlevel.id
left join master_join mj1 on shared.standardlevel.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.standardlevel_pt.id,
    shared.standardlevel_pt.nilreason,
    shared.standardlevel.verticaldistance_value,
    shared.standardlevel.verticaldistance_uom,
    shared.standardlevel.verticaldistance_nilreason;
create or replace view airport_heliport.surfacecharacteristics_view as
select
    airport_heliport.surfacecharacteristics_pt.id,
    jsonb_agg(notes.note_view.note) AS surfacecharacteristics_annotation,
    jsonb_build_object('nilreason', airport_heliport.surfacecharacteristics_pt.nilreason,
    'composition', coalesce(cast(airport_heliport.surfacecharacteristics.composition_value as varchar), '(' || airport_heliport.surfacecharacteristics.composition_nilreason || ')'),
    'preparation', coalesce(cast(airport_heliport.surfacecharacteristics.preparation_value as varchar), '(' || airport_heliport.surfacecharacteristics.preparation_nilreason || ')'),
    'surfacecondition', coalesce(cast(airport_heliport.surfacecharacteristics.surfacecondition_value as varchar), '(' || airport_heliport.surfacecharacteristics.surfacecondition_nilreason || ')'),
    'classpcn', coalesce(cast(airport_heliport.surfacecharacteristics.classpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.classpcn_nilreason || ')'),
    'pavementtypepcn', coalesce(cast(airport_heliport.surfacecharacteristics.pavementtypepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.pavementtypepcn_nilreason || ')'),
    'pavementsubgradepcn', coalesce(cast(airport_heliport.surfacecharacteristics.pavementsubgradepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.pavementsubgradepcn_nilreason || ')'),
    'maxtyrepressurepcn', coalesce(cast(airport_heliport.surfacecharacteristics.maxtyrepressurepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.maxtyrepressurepcn_nilreason || ')'),
    'evaluationmethodpcn', coalesce(cast(airport_heliport.surfacecharacteristics.evaluationmethodpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.evaluationmethodpcn_nilreason || ')'),
    'classlcn', coalesce(cast(airport_heliport.surfacecharacteristics.classlcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.classlcn_nilreason || ')'),
    'weightsiwl', coalesce(cast(airport_heliport.surfacecharacteristics.weightsiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.weightsiwl_uom, '(' || airport_heliport.surfacecharacteristics.weightsiwl_nilreason || ')'),
    'tyrepressuresiwl', coalesce(cast(airport_heliport.surfacecharacteristics.tyrepressuresiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.tyrepressuresiwl_uom, '(' || airport_heliport.surfacecharacteristics.tyrepressuresiwl_nilreason || ')'),
    'weightauw', coalesce(cast(airport_heliport.surfacecharacteristics.weightauw_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.weightauw_uom, '(' || airport_heliport.surfacecharacteristics.weightauw_nilreason || ')')  ) AS json_data
from airport_heliport.surfacecharacteristics_pt 
inner join airport_heliport.surfacecharacteristics on airport_heliport.surfacecharacteristics_pt.surfacecharacteristics_id = airport_heliport.surfacecharacteristics.id
left join master_join mj1 on airport_heliport.surfacecharacteristics.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airport_heliport.surfacecharacteristics_pt.id,
    airport_heliport.surfacecharacteristics_pt.nilreason,
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
create or replace view airport_heliport.surfacecontaminationlayer_view as
select
    airport_heliport.surfacecontaminationlayer_pt.id,
    jsonb_agg(notes.note_view.note) AS surfacecontaminationlayer_annotation,
    jsonb_build_object('nilreason', airport_heliport.surfacecontaminationlayer_pt.nilreason,
    'layerorder', coalesce(cast(airport_heliport.surfacecontaminationlayer.layerorder_value as varchar), '(' || airport_heliport.surfacecontaminationlayer.layerorder_nilreason || ')'),
    'type', coalesce(cast(airport_heliport.surfacecontaminationlayer.type_value as varchar), '(' || airport_heliport.surfacecontaminationlayer.type_nilreason || ')')  ) AS json_data
from airport_heliport.surfacecontaminationlayer_pt 
inner join airport_heliport.surfacecontaminationlayer on airport_heliport.surfacecontaminationlayer_pt.surfacecontaminationlayer_id = airport_heliport.surfacecontaminationlayer.id
left join master_join mj1 on airport_heliport.surfacecontaminationlayer.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    airport_heliport.surfacecontaminationlayer_pt.id,
    airport_heliport.surfacecontaminationlayer_pt.nilreason,
    airport_heliport.surfacecontaminationlayer.layerorder_value,
    airport_heliport.surfacecontaminationlayer.layerorder_nilreason,
    airport_heliport.surfacecontaminationlayer.type_value,
    airport_heliport.surfacecontaminationlayer.type_nilreason;
create or replace view airport_heliport.surfacecontamination_view as
select
    airport_heliport.surfacecontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS surfacecontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.surfacecontamination_pt.nilreason  ) AS json_data
from airport_heliport.surfacecontamination_pt 
inner join airport_heliport.surfacecontamination on airport_heliport.surfacecontamination_pt.surfacecontamination_id = airport_heliport.surfacecontamination.id
left join master_join mj1 on airport_heliport.surfacecontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
group by
    airport_heliport.surfacecontamination_pt.id,
    airport_heliport.surfacecontamination_pt.nilreason;
create or replace view surveillance.surveillancegroundstation_view as
select
    surveillance.surveillancegroundstation_pt.id,
    jsonb_agg(notes.note_view.note) AS surveillancegroundstation_annotation,
    jsonb_build_object('nilreason', surveillance.surveillancegroundstation_pt.nilreason,
    'videomap', coalesce(cast(surveillance.surveillancegroundstation.videomap_value as varchar), '(' || surveillance.surveillancegroundstation.videomap_nilreason || ')')  ) AS json_data
from surveillance.surveillancegroundstation_pt 
inner join surveillance.surveillancegroundstation on surveillance.surveillancegroundstation_pt.surveillancegroundstation_id = surveillance.surveillancegroundstation.id
left join master_join mj1 on surveillance.surveillancegroundstation.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    surveillance.surveillancegroundstation_pt.id,
    surveillance.surveillancegroundstation_pt.nilreason,
    surveillance.surveillancegroundstation.videomap_value,
    surveillance.surveillancegroundstation.videomap_nilreason;
create or replace view airport_heliport.taxiwaycontamination_view as
select
    airport_heliport.taxiwaycontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS taxiwaycontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.taxiwaycontamination_pt.nilreason,
    'frictioncoefficient', coalesce(cast(airport_heliport.taxiwaycontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictioncoefficient_nilreason || ')'),
    'frictionestimation', coalesce(cast(airport_heliport.taxiwaycontamination.frictionestimation_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictionestimation_nilreason || ')'),
    'frictiondevice', coalesce(cast(airport_heliport.taxiwaycontamination.frictiondevice_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictiondevice_nilreason || ')'),
    'obscuredlights', coalesce(cast(airport_heliport.taxiwaycontamination.obscuredlights_value as varchar), '(' || airport_heliport.taxiwaycontamination.obscuredlights_nilreason || ')'),
    'furtherclearancetime', coalesce(cast(airport_heliport.taxiwaycontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.taxiwaycontamination.furtherclearancetime_nilreason || ')'),
    'furthertotalclearance', coalesce(cast(airport_heliport.taxiwaycontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.taxiwaycontamination.furthertotalclearance_nilreason || ')'),
    'proportion', coalesce(cast(airport_heliport.taxiwaycontamination.proportion_value as varchar), '(' || airport_heliport.taxiwaycontamination.proportion_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.taxiwaycontamination.depth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination.depth_uom, '(' || airport_heliport.taxiwaycontamination.depth_nilreason || ')'),
    'clearedwidth', coalesce(cast(airport_heliport.taxiwaycontamination.clearedwidth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination.clearedwidth_uom, '(' || airport_heliport.taxiwaycontamination.clearedwidth_nilreason || ')')  ) AS json_data
from airport_heliport.taxiwaycontamination_pt 
inner join airport_heliport.taxiwaycontamination on airport_heliport.taxiwaycontamination_pt.taxiwaycontamination_id = airport_heliport.taxiwaycontamination.id
left join master_join mj1 on airport_heliport.taxiwaycontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.ridge.criticalridge
--object airport_heliport.surfacecontaminationlayer.layer
--object notes.note.annotation
group by
    airport_heliport.taxiwaycontamination_pt.id,
    airport_heliport.taxiwaycontamination_pt.nilreason,
    airport_heliport.taxiwaycontamination.frictioncoefficient_value,
    airport_heliport.taxiwaycontamination.frictioncoefficient_nilreason,
    airport_heliport.taxiwaycontamination.frictionestimation_value,
    airport_heliport.taxiwaycontamination.frictionestimation_nilreason,
    airport_heliport.taxiwaycontamination.frictiondevice_value,
    airport_heliport.taxiwaycontamination.frictiondevice_nilreason,
    airport_heliport.taxiwaycontamination.obscuredlights_value,
    airport_heliport.taxiwaycontamination.obscuredlights_nilreason,
    airport_heliport.taxiwaycontamination.furtherclearancetime_value,
    airport_heliport.taxiwaycontamination.furtherclearancetime_nilreason,
    airport_heliport.taxiwaycontamination.furthertotalclearance_value,
    airport_heliport.taxiwaycontamination.furthertotalclearance_nilreason,
    airport_heliport.taxiwaycontamination.proportion_value,
    airport_heliport.taxiwaycontamination.proportion_nilreason,
    airport_heliport.taxiwaycontamination.depth_value,
    airport_heliport.taxiwaycontamination.depth_uom,
    airport_heliport.taxiwaycontamination.depth_nilreason,
    airport_heliport.taxiwaycontamination.clearedwidth_value,
    airport_heliport.taxiwaycontamination.clearedwidth_uom,
    airport_heliport.taxiwaycontamination.clearedwidth_nilreason;
create or replace view shared.telephonecontact_view as
select
    shared.telephonecontact_pt.id,
    jsonb_agg(notes.note_view.note) AS telephonecontact_annotation,
    jsonb_build_object('nilreason', shared.telephonecontact_pt.nilreason,
    'voice', coalesce(cast(shared.telephonecontact.voice_value as varchar), '(' || shared.telephonecontact.voice_nilreason || ')'),
    'facsimile', coalesce(cast(shared.telephonecontact.facsimile_value as varchar), '(' || shared.telephonecontact.facsimile_nilreason || ')')  ) AS json_data
from shared.telephonecontact_pt 
inner join shared.telephonecontact on shared.telephonecontact_pt.telephonecontact_id = shared.telephonecontact.id
left join master_join mj1 on shared.telephonecontact.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    shared.telephonecontact_pt.id,
    shared.telephonecontact_pt.nilreason,
    shared.telephonecontact.voice_value,
    shared.telephonecontact.voice_nilreason,
    shared.telephonecontact.facsimile_value,
    shared.telephonecontact.facsimile_nilreason;
create or replace view procedure.terminalarrivalareasector_view as
select
    procedure.terminalarrivalareasector_pt.id,
    jsonb_agg(notes.note_view.note) AS terminalarrivalareasector_annotation,
    jsonb_build_object('nilreason', procedure.terminalarrivalareasector_pt.nilreason,
    'flybycode', coalesce(cast(procedure.terminalarrivalareasector.flybycode_value as varchar), '(' || procedure.terminalarrivalareasector.flybycode_nilreason || ')'),
    'procedureturnrequired', coalesce(cast(procedure.terminalarrivalareasector.procedureturnrequired_value as varchar), '(' || procedure.terminalarrivalareasector.procedureturnrequired_nilreason || ')'),
    'altitudedescription', coalesce(cast(procedure.terminalarrivalareasector.altitudedescription_value as varchar), '(' || procedure.terminalarrivalareasector.altitudedescription_nilreason || ')'),
    'sectordefinition', shared.circlesector_view  ) AS json_data
from procedure.terminalarrivalareasector_pt 
inner join procedure.terminalarrivalareasector on procedure.terminalarrivalareasector_pt.terminalarrivalareasector_id = procedure.terminalarrivalareasector.id
left join master_join mj1 on procedure.terminalarrivalareasector.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
left join shared.circlesector_pt shared_circlesector_pt_qawmmh on procedure.terminalarrivalareasector.sectordefinition_id = shared_circlesector_pt_qawmmh.id
--object shared.obstruction.significantobstacle
--object notes.note.annotation
group by
    procedure.terminalarrivalareasector_pt.id,
    procedure.terminalarrivalareasector_pt.nilreason,
    procedure.terminalarrivalareasector.flybycode_value,
    procedure.terminalarrivalareasector.flybycode_nilreason,
    procedure.terminalarrivalareasector.procedureturnrequired_value,
    procedure.terminalarrivalareasector.procedureturnrequired_nilreason,
    procedure.terminalarrivalareasector.altitudedescription_value,
    procedure.terminalarrivalareasector.altitudedescription_nilreason;
create or replace view navaids_points.terminalsegmentpoint_view as
select
    navaids_points.terminalsegmentpoint_pt.id,
    jsonb_agg(notes.note_view.note) AS terminalsegmentpoint_annotation,
    jsonb_build_object('nilreason', navaids_points.terminalsegmentpoint_pt.nilreason,
    'reportingatc', coalesce(cast(navaids_points.terminalsegmentpoint.reportingatc_value as varchar), '(' || navaids_points.terminalsegmentpoint.reportingatc_nilreason || ')'),
    'flyover', coalesce(cast(navaids_points.terminalsegmentpoint.flyover_value as varchar), '(' || navaids_points.terminalsegmentpoint.flyover_nilreason || ')'),
    'waypoint', coalesce(cast(navaids_points.terminalsegmentpoint.waypoint_value as varchar), '(' || navaids_points.terminalsegmentpoint.waypoint_nilreason || ')'),
    'radarguidance', coalesce(cast(navaids_points.terminalsegmentpoint.radarguidance_value as varchar), '(' || navaids_points.terminalsegmentpoint.radarguidance_nilreason || ')'),
    'role', coalesce(cast(navaids_points.terminalsegmentpoint.role_value as varchar), '(' || navaids_points.terminalsegmentpoint.role_nilreason || ')'),
    'leadradial', coalesce(cast(navaids_points.terminalsegmentpoint.leadradial_value as varchar), '(' || navaids_points.terminalsegmentpoint.leadradial_nilreason || ')'),
    'indicatorfacf', coalesce(cast(navaids_points.terminalsegmentpoint.indicatorfacf_value as varchar), '(' || navaids_points.terminalsegmentpoint.indicatorfacf_nilreason || ')'),
    'leaddme', coalesce(cast(navaids_points.terminalsegmentpoint.leaddme_value as varchar) || ' ' || navaids_points.terminalsegmentpoint.leaddme_uom, '(' || navaids_points.terminalsegmentpoint.leaddme_nilreason || ')')  ) AS json_data
from navaids_points.terminalsegmentpoint_pt 
inner join navaids_points.terminalsegmentpoint on navaids_points.terminalsegmentpoint_pt.terminalsegmentpoint_id = navaids_points.terminalsegmentpoint.id
left join master_join mj1 on navaids_points.terminalsegmentpoint.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object navaids_points.pointreference.facilitymakeup
--object notes.note.annotation
group by
    navaids_points.terminalsegmentpoint_pt.id,
    navaids_points.terminalsegmentpoint_pt.nilreason,
    navaids_points.terminalsegmentpoint.reportingatc_value,
    navaids_points.terminalsegmentpoint.reportingatc_nilreason,
    navaids_points.terminalsegmentpoint.flyover_value,
    navaids_points.terminalsegmentpoint.flyover_nilreason,
    navaids_points.terminalsegmentpoint.waypoint_value,
    navaids_points.terminalsegmentpoint.waypoint_nilreason,
    navaids_points.terminalsegmentpoint.radarguidance_value,
    navaids_points.terminalsegmentpoint.radarguidance_nilreason,
    navaids_points.terminalsegmentpoint.role_value,
    navaids_points.terminalsegmentpoint.role_nilreason,
    navaids_points.terminalsegmentpoint.leadradial_value,
    navaids_points.terminalsegmentpoint.leadradial_nilreason,
    navaids_points.terminalsegmentpoint.indicatorfacf_value,
    navaids_points.terminalsegmentpoint.indicatorfacf_nilreason,
    navaids_points.terminalsegmentpoint.leaddme_value,
    navaids_points.terminalsegmentpoint.leaddme_uom,
    navaids_points.terminalsegmentpoint.leaddme_nilreason;
create or replace view shared.timesheet_view as
select
    shared.timesheet_pt.id,
    jsonb_agg(notes.note_view.note) AS timesheet_annotation,
    jsonb_build_object('nilreason', shared.timesheet_pt.nilreason,
    'timereference', coalesce(cast(shared.timesheet.timereference_value as varchar), '(' || shared.timesheet.timereference_nilreason || ')'),
    'startdate', coalesce(cast(shared.timesheet.startdate_value as varchar), '(' || shared.timesheet.startdate_nilreason || ')'),
    'enddate', coalesce(cast(shared.timesheet.enddate_value as varchar), '(' || shared.timesheet.enddate_nilreason || ')'),
    'day', coalesce(cast(shared.timesheet.day_value as varchar), '(' || shared.timesheet.day_nilreason || ')'),
    'daytil', coalesce(cast(shared.timesheet.daytil_value as varchar), '(' || shared.timesheet.daytil_nilreason || ')'),
    'starttime', coalesce(cast(shared.timesheet.starttime_value as varchar), '(' || shared.timesheet.starttime_nilreason || ')'),
    'startevent', coalesce(cast(shared.timesheet.startevent_value as varchar), '(' || shared.timesheet.startevent_nilreason || ')'),
    'starteventinterpretation', coalesce(cast(shared.timesheet.starteventinterpretation_value as varchar), '(' || shared.timesheet.starteventinterpretation_nilreason || ')'),
    'endtime', coalesce(cast(shared.timesheet.endtime_value as varchar), '(' || shared.timesheet.endtime_nilreason || ')'),
    'endevent', coalesce(cast(shared.timesheet.endevent_value as varchar), '(' || shared.timesheet.endevent_nilreason || ')'),
    'endeventinterpretation', coalesce(cast(shared.timesheet.endeventinterpretation_value as varchar), '(' || shared.timesheet.endeventinterpretation_nilreason || ')'),
    'daylightsavingadjust', coalesce(cast(shared.timesheet.daylightsavingadjust_value as varchar), '(' || shared.timesheet.daylightsavingadjust_nilreason || ')'),
    'excluded', coalesce(cast(shared.timesheet.excluded_value as varchar), '(' || shared.timesheet.excluded_nilreason || ')'),
    'starttimerelativeevent', coalesce(cast(shared.timesheet.starttimerelativeevent_value as varchar) || ' ' || shared.timesheet.starttimerelativeevent_uom, '(' || shared.timesheet.starttimerelativeevent_nilreason || ')'),
    'endtimerelativeevent', coalesce(cast(shared.timesheet.endtimerelativeevent_value as varchar) || ' ' || shared.timesheet.endtimerelativeevent_uom, '(' || shared.timesheet.endtimerelativeevent_nilreason || ')')  ) AS json_data
from shared.timesheet_pt 
inner join shared.timesheet on shared.timesheet_pt.timesheet_id = shared.timesheet.id
left join master_join mj1 on shared.timesheet.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    shared.timesheet_pt.id,
    shared.timesheet_pt.nilreason,
    shared.timesheet.timereference_value,
    shared.timesheet.timereference_nilreason,
    shared.timesheet.startdate_value,
    shared.timesheet.startdate_nilreason,
    shared.timesheet.enddate_value,
    shared.timesheet.enddate_nilreason,
    shared.timesheet.day_value,
    shared.timesheet.day_nilreason,
    shared.timesheet.daytil_value,
    shared.timesheet.daytil_nilreason,
    shared.timesheet.starttime_value,
    shared.timesheet.starttime_nilreason,
    shared.timesheet.startevent_value,
    shared.timesheet.startevent_nilreason,
    shared.timesheet.starteventinterpretation_value,
    shared.timesheet.starteventinterpretation_nilreason,
    shared.timesheet.endtime_value,
    shared.timesheet.endtime_nilreason,
    shared.timesheet.endevent_value,
    shared.timesheet.endevent_nilreason,
    shared.timesheet.endeventinterpretation_value,
    shared.timesheet.endeventinterpretation_nilreason,
    shared.timesheet.daylightsavingadjust_value,
    shared.timesheet.daylightsavingadjust_nilreason,
    shared.timesheet.excluded_value,
    shared.timesheet.excluded_nilreason,
    shared.timesheet.starttimerelativeevent_value,
    shared.timesheet.starttimerelativeevent_uom,
    shared.timesheet.starttimerelativeevent_nilreason,
    shared.timesheet.endtimerelativeevent_value,
    shared.timesheet.endtimerelativeevent_uom,
    shared.timesheet.endtimerelativeevent_nilreason;
create or replace view airport_heliport.touchdownliftoffcontamination_view as
select
    airport_heliport.touchdownliftoffcontamination_pt.id,
    jsonb_agg(notes.note_view.note) AS touchdownliftoffcontamination_annotation,
    jsonb_build_object('nilreason', airport_heliport.touchdownliftoffcontamination_pt.nilreason,
    'frictioncoefficient', coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictioncoefficient_nilreason || ')'),
    'frictionestimation', coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictionestimation_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictionestimation_nilreason || ')'),
    'frictiondevice', coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictiondevice_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictiondevice_nilreason || ')'),
    'obscuredlights', coalesce(cast(airport_heliport.touchdownliftoffcontamination.obscuredlights_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.obscuredlights_nilreason || ')'),
    'furtherclearancetime', coalesce(cast(airport_heliport.touchdownliftoffcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.furtherclearancetime_nilreason || ')'),
    'furthertotalclearance', coalesce(cast(airport_heliport.touchdownliftoffcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.furthertotalclearance_nilreason || ')'),
    'proportion', coalesce(cast(airport_heliport.touchdownliftoffcontamination.proportion_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.proportion_nilreason || ')'),
    'depth', coalesce(cast(airport_heliport.touchdownliftoffcontamination.depth_value as varchar) || ' ' || airport_heliport.touchdownliftoffcontamination.depth_uom, '(' || airport_heliport.touchdownliftoffcontamination.depth_nilreason || ')')  ) AS json_data
from airport_heliport.touchdownliftoffcontamination_pt 
inner join airport_heliport.touchdownliftoffcontamination on airport_heliport.touchdownliftoffcontamination_pt.touchdownliftoffcontamination_id = airport_heliport.touchdownliftoffcontamination.id
left join master_join mj1 on airport_heliport.touchdownliftoffcontamination.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object airport_heliport.ridge.criticalridge
--object airport_heliport.surfacecontaminationlayer.layer
--object notes.note.annotation
group by
    airport_heliport.touchdownliftoffcontamination_pt.id,
    airport_heliport.touchdownliftoffcontamination_pt.nilreason,
    airport_heliport.touchdownliftoffcontamination.frictioncoefficient_value,
    airport_heliport.touchdownliftoffcontamination.frictioncoefficient_nilreason,
    airport_heliport.touchdownliftoffcontamination.frictionestimation_value,
    airport_heliport.touchdownliftoffcontamination.frictionestimation_nilreason,
    airport_heliport.touchdownliftoffcontamination.frictiondevice_value,
    airport_heliport.touchdownliftoffcontamination.frictiondevice_nilreason,
    airport_heliport.touchdownliftoffcontamination.obscuredlights_value,
    airport_heliport.touchdownliftoffcontamination.obscuredlights_nilreason,
    airport_heliport.touchdownliftoffcontamination.furtherclearancetime_value,
    airport_heliport.touchdownliftoffcontamination.furtherclearancetime_nilreason,
    airport_heliport.touchdownliftoffcontamination.furthertotalclearance_value,
    airport_heliport.touchdownliftoffcontamination.furthertotalclearance_nilreason,
    airport_heliport.touchdownliftoffcontamination.proportion_value,
    airport_heliport.touchdownliftoffcontamination.proportion_nilreason,
    airport_heliport.touchdownliftoffcontamination.depth_value,
    airport_heliport.touchdownliftoffcontamination.depth_uom,
    airport_heliport.touchdownliftoffcontamination.depth_nilreason;
create or replace view organisation.unitavailability_view as
select
    organisation.unitavailability_pt.id,
    jsonb_agg(notes.note_view.note) AS unitavailability_annotation,
    jsonb_build_object('nilreason', organisation.unitavailability_pt.nilreason,
    'operationalstatus', coalesce(cast(organisation.unitavailability.operationalstatus_value as varchar), '(' || organisation.unitavailability.operationalstatus_nilreason || ')')  ) AS json_data
from organisation.unitavailability_pt 
inner join organisation.unitavailability on organisation.unitavailability_pt.unitavailability_id = organisation.unitavailability.id
left join master_join mj1 on organisation.unitavailability.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    organisation.unitavailability_pt.id,
    organisation.unitavailability_pt.nilreason,
    organisation.unitavailability.operationalstatus_value,
    organisation.unitavailability.operationalstatus_nilreason;
create or replace view organisation.unitdependency_view as
select
    organisation.unitdependency_pt.id,
    jsonb_agg(notes.note_view.note) AS unitdependency_annotation,
    jsonb_build_object('nilreason', organisation.unitdependency_pt.nilreason,
    'type', coalesce(cast(organisation.unitdependency.type_value as varchar), '(' || organisation.unitdependency.type_nilreason || ')')  ) AS json_data
from organisation.unitdependency_pt 
inner join organisation.unitdependency on organisation.unitdependency_pt.unitdependency_id = organisation.unitdependency.id
left join master_join mj1 on organisation.unitdependency.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object notes.note.annotation
group by
    organisation.unitdependency_pt.id,
    organisation.unitdependency_pt.nilreason,
    organisation.unitdependency.type_value,
    organisation.unitdependency.type_nilreason;
create or replace view airport_heliport.usagecondition_view as
select
    airport_heliport.usagecondition_pt.id,
    jsonb_agg(notes.note_view.note) AS usagecondition_annotation,
    jsonb_build_object('nilreason', airport_heliport.usagecondition_pt.nilreason  ) AS json_data
from airport_heliport.usagecondition_pt 
inner join airport_heliport.usagecondition on airport_heliport.usagecondition_pt.usagecondition_id = airport_heliport.usagecondition.id
left join master_join mj1 on airport_heliport.usagecondition.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
group by
    airport_heliport.usagecondition_pt.id,
    airport_heliport.usagecondition_pt.nilreason;
create or replace view obstacles.verticalstructurelightingstatus_view as
select
    obstacles.verticalstructurelightingstatus_pt.id,
    jsonb_agg(notes.note_view.note) AS verticalstructurelightingstatus_annotation,
    jsonb_build_object('nilreason', obstacles.verticalstructurelightingstatus_pt.nilreason,
    'status', coalesce(cast(obstacles.verticalstructurelightingstatus.status_value as varchar), '(' || obstacles.verticalstructurelightingstatus.status_nilreason || ')')  ) AS json_data
from obstacles.verticalstructurelightingstatus_pt 
inner join obstacles.verticalstructurelightingstatus on obstacles.verticalstructurelightingstatus_pt.verticalstructurelightingstatus_id = obstacles.verticalstructurelightingstatus.id
left join master_join mj1 on obstacles.verticalstructurelightingstatus.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    obstacles.verticalstructurelightingstatus_pt.id,
    obstacles.verticalstructurelightingstatus_pt.nilreason,
    obstacles.verticalstructurelightingstatus.status_value,
    obstacles.verticalstructurelightingstatus.status_nilreason;
create or replace view obstacles.verticalstructurepart_view as
select
    obstacles.verticalstructurepart_pt.id,
    jsonb_agg(notes.note_view.note) AS verticalstructurepart_annotation,
    jsonb_build_object('nilreason', obstacles.verticalstructurepart_pt.nilreason,
    'type', coalesce(cast(obstacles.verticalstructurepart.type_value as varchar), '(' || obstacles.verticalstructurepart.type_nilreason || ')'),
    'constructionstatus', coalesce(cast(obstacles.verticalstructurepart.constructionstatus_value as varchar), '(' || obstacles.verticalstructurepart.constructionstatus_nilreason || ')'),
    'markingpattern', coalesce(cast(obstacles.verticalstructurepart.markingpattern_value as varchar), '(' || obstacles.verticalstructurepart.markingpattern_nilreason || ')'),
    'markingfirstcolour', coalesce(cast(obstacles.verticalstructurepart.markingfirstcolour_value as varchar), '(' || obstacles.verticalstructurepart.markingfirstcolour_nilreason || ')'),
    'markingsecondcolour', coalesce(cast(obstacles.verticalstructurepart.markingsecondcolour_value as varchar), '(' || obstacles.verticalstructurepart.markingsecondcolour_nilreason || ')'),
    'mobile', coalesce(cast(obstacles.verticalstructurepart.mobile_value as varchar), '(' || obstacles.verticalstructurepart.mobile_nilreason || ')'),
    'frangible', coalesce(cast(obstacles.verticalstructurepart.frangible_value as varchar), '(' || obstacles.verticalstructurepart.frangible_nilreason || ')'),
    'visiblematerial', coalesce(cast(obstacles.verticalstructurepart.visiblematerial_value as varchar), '(' || obstacles.verticalstructurepart.visiblematerial_nilreason || ')'),
    'designator', coalesce(cast(obstacles.verticalstructurepart.designator_value as varchar), '(' || obstacles.verticalstructurepart.designator_nilreason || ')'),
    'verticalextent', coalesce(cast(obstacles.verticalstructurepart.verticalextent_value as varchar) || ' ' || obstacles.verticalstructurepart.verticalextent_uom, '(' || obstacles.verticalstructurepart.verticalextent_nilreason || ')'),
    'verticalextentaccuracy', coalesce(cast(obstacles.verticalstructurepart.verticalextentaccuracy_value as varchar) || ' ' || obstacles.verticalstructurepart.verticalextentaccuracy_uom, '(' || obstacles.verticalstructurepart.verticalextentaccuracy_nilreason || ')')  ) AS json_data
from obstacles.verticalstructurepart_pt 
inner join obstacles.verticalstructurepart on obstacles.verticalstructurepart_pt.verticalstructurepart_id = obstacles.verticalstructurepart.id
left join master_join mj1 on obstacles.verticalstructurepart.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
--object shared.lightelement.lighting
group by
    obstacles.verticalstructurepart_pt.id,
    obstacles.verticalstructurepart_pt.nilreason,
    obstacles.verticalstructurepart.type_value,
    obstacles.verticalstructurepart.type_nilreason,
    obstacles.verticalstructurepart.constructionstatus_value,
    obstacles.verticalstructurepart.constructionstatus_nilreason,
    obstacles.verticalstructurepart.markingpattern_value,
    obstacles.verticalstructurepart.markingpattern_nilreason,
    obstacles.verticalstructurepart.markingfirstcolour_value,
    obstacles.verticalstructurepart.markingfirstcolour_nilreason,
    obstacles.verticalstructurepart.markingsecondcolour_value,
    obstacles.verticalstructurepart.markingsecondcolour_nilreason,
    obstacles.verticalstructurepart.mobile_value,
    obstacles.verticalstructurepart.mobile_nilreason,
    obstacles.verticalstructurepart.frangible_value,
    obstacles.verticalstructurepart.frangible_nilreason,
    obstacles.verticalstructurepart.visiblematerial_value,
    obstacles.verticalstructurepart.visiblematerial_nilreason,
    obstacles.verticalstructurepart.designator_value,
    obstacles.verticalstructurepart.designator_nilreason,
    obstacles.verticalstructurepart.verticalextent_value,
    obstacles.verticalstructurepart.verticalextent_uom,
    obstacles.verticalstructurepart.verticalextent_nilreason,
    obstacles.verticalstructurepart.verticalextentaccuracy_value,
    obstacles.verticalstructurepart.verticalextentaccuracy_uom,
    obstacles.verticalstructurepart.verticalextentaccuracy_nilreason;
create or replace view airport_heliport.workareaactivity_view as
select
    airport_heliport.workareaactivity_pt.id,
    jsonb_agg(notes.note_view.note) AS workareaactivity_annotation,
    jsonb_build_object('nilreason', airport_heliport.workareaactivity_pt.nilreason,
    'isactive', coalesce(cast(airport_heliport.workareaactivity.isactive_value as varchar), '(' || airport_heliport.workareaactivity.isactive_nilreason || ')')  ) AS json_data
from airport_heliport.workareaactivity_pt 
inner join airport_heliport.workareaactivity on airport_heliport.workareaactivity_pt.workareaactivity_id = airport_heliport.workareaactivity.id
left join master_join mj1 on airport_heliport.workareaactivity.id = mj1.source_id
left join notes.note_view on mj1.target_id = notes.note_view.id
--object shared.timesheet.timeinterval
--object notes.note.annotation
group by
    airport_heliport.workareaactivity_pt.id,
    airport_heliport.workareaactivity_pt.nilreason,
    airport_heliport.workareaactivity.isactive_value,
    airport_heliport.workareaactivity.isactive_nilreason;