
create or replace view aerial_refuelling.aerialrefuellinganchor_view as
select
    aerial_refuelling.aerialrefuellinganchor.id,
    aerial_refuelling.aerialrefuellinganchor.nilreason,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.outboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor_ts.outboundcourse_nilreason || ')') as outboundcourse,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.outboundcoursetype_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor_ts.outboundcoursetype_nilreason || ')') as outboundcoursetype,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.inboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor_ts.inboundcourse_nilreason || ')') as inboundcourse,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.turndirection_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.refuellingbaselevelreference_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor_ts.refuellingbaselevelreference_nilreason || ')') as refuellingbaselevelreference,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.speedlimit_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor_ts.speedlimit_uom, '(' || aerial_refuelling.aerialrefuellinganchor_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.legseparation_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor_ts.legseparation_uom, '(' || aerial_refuelling.aerialrefuellinganchor_ts.legseparation_nilreason || ')') as legseparation,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.leglength_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor_ts.leglength_uom, '(' || aerial_refuelling.aerialrefuellinganchor_ts.leglength_nilreason || ')') as leglength,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor_ts.refuellingbaselevel_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor_ts.refuellingbaselevel_uom, '(' || aerial_refuelling.aerialrefuellinganchor_ts.refuellingbaselevel_nilreason || ')') as refuellingbaselevel
from aerial_refuelling.aerialrefuellinganchor 
create or replace view aerial_refuelling.aerialrefuellingpoint_view as
select
    aerial_refuelling.aerialrefuellingpoint.id,
    aerial_refuelling.aerialrefuellingpoint.nilreason,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint_ts.reportingatc_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint_ts.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint_ts.flyover_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint_ts.flyover_nilreason || ')') as flyover,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint_ts.waypoint_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint_ts.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint_ts.radarguidance_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint_ts.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint_ts.sequence_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint_ts.sequence_nilreason || ')') as sequence,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint_ts.usagetype_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint_ts.usagetype_nilreason || ')') as usagetype
from aerial_refuelling.aerialrefuellingpoint 
create or replace view aerial_refuelling.aerialrefuellingtrack_view as
select
    aerial_refuelling.aerialrefuellingtrack.id,
    aerial_refuelling.aerialrefuellingtrack.nilreason
from aerial_refuelling.aerialrefuellingtrack 
create or replace view shared.aircraftcharacteristic_view as
select
    shared.aircraftcharacteristic.id,
    shared.aircraftcharacteristic.nilreason,
    coalesce(cast(shared.aircraftcharacteristic_ts.type_value as varchar), '(' || shared.aircraftcharacteristic_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.aircraftcharacteristic_ts.engine_value as varchar), '(' || shared.aircraftcharacteristic_ts.engine_nilreason || ')') as engine,
    coalesce(cast(shared.aircraftcharacteristic_ts.numberengine_value as varchar), '(' || shared.aircraftcharacteristic_ts.numberengine_nilreason || ')') as numberengine,
    coalesce(cast(shared.aircraftcharacteristic_ts.typeaircrafticao_value as varchar), '(' || shared.aircraftcharacteristic_ts.typeaircrafticao_nilreason || ')') as typeaircrafticao,
    coalesce(cast(shared.aircraftcharacteristic_ts.aircraftlandingcategory_value as varchar), '(' || shared.aircraftcharacteristic_ts.aircraftlandingcategory_nilreason || ')') as aircraftlandingcategory,
    coalesce(cast(shared.aircraftcharacteristic_ts.wingspaninterpretation_value as varchar), '(' || shared.aircraftcharacteristic_ts.wingspaninterpretation_nilreason || ')') as wingspaninterpretation,
    coalesce(cast(shared.aircraftcharacteristic_ts.classwingspan_value as varchar), '(' || shared.aircraftcharacteristic_ts.classwingspan_nilreason || ')') as classwingspan,
    coalesce(cast(shared.aircraftcharacteristic_ts.weightinterpretation_value as varchar), '(' || shared.aircraftcharacteristic_ts.weightinterpretation_nilreason || ')') as weightinterpretation,
    coalesce(cast(shared.aircraftcharacteristic_ts.passengers_value as varchar), '(' || shared.aircraftcharacteristic_ts.passengers_nilreason || ')') as passengers,
    coalesce(cast(shared.aircraftcharacteristic_ts.passengersinterpretation_value as varchar), '(' || shared.aircraftcharacteristic_ts.passengersinterpretation_nilreason || ')') as passengersinterpretation,
    coalesce(cast(shared.aircraftcharacteristic_ts.speedinterpretation_value as varchar), '(' || shared.aircraftcharacteristic_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(shared.aircraftcharacteristic_ts.waketurbulence_value as varchar), '(' || shared.aircraftcharacteristic_ts.waketurbulence_nilreason || ')') as waketurbulence,
    coalesce(cast(shared.aircraftcharacteristic_ts.navigationequipment_value as varchar), '(' || shared.aircraftcharacteristic_ts.navigationequipment_nilreason || ')') as navigationequipment,
    coalesce(cast(shared.aircraftcharacteristic_ts.navigationspecification_value as varchar), '(' || shared.aircraftcharacteristic_ts.navigationspecification_nilreason || ')') as navigationspecification,
    coalesce(cast(shared.aircraftcharacteristic_ts.verticalseparationcapability_value as varchar), '(' || shared.aircraftcharacteristic_ts.verticalseparationcapability_nilreason || ')') as verticalseparationcapability,
    coalesce(cast(shared.aircraftcharacteristic_ts.anticollisionandseparationequipment_value as varchar), '(' || shared.aircraftcharacteristic_ts.anticollisionandseparationequipment_nilreason || ')') as anticollisionandseparationequipment,
    coalesce(cast(shared.aircraftcharacteristic_ts.communicationequipment_value as varchar), '(' || shared.aircraftcharacteristic_ts.communicationequipment_nilreason || ')') as communicationequipment,
    coalesce(cast(shared.aircraftcharacteristic_ts.surveillanceequipment_value as varchar), '(' || shared.aircraftcharacteristic_ts.surveillanceequipment_nilreason || ')') as surveillanceequipment,
    coalesce(cast(shared.aircraftcharacteristic_ts.wingspan_value as varchar) || ' ' || shared.aircraftcharacteristic_ts.wingspan_uom, '(' || shared.aircraftcharacteristic_ts.wingspan_nilreason || ')') as wingspan,
    coalesce(cast(shared.aircraftcharacteristic_ts.weight_value as varchar) || ' ' || shared.aircraftcharacteristic_ts.weight_uom, '(' || shared.aircraftcharacteristic_ts.weight_nilreason || ')') as weight,
    coalesce(cast(shared.aircraftcharacteristic_ts.speed_value as varchar) || ' ' || shared.aircraftcharacteristic_ts.speed_uom, '(' || shared.aircraftcharacteristic_ts.speed_nilreason || ')') as speed
from shared.aircraftcharacteristic 
create or replace view airport_heliport.aircraftstandcontamination_view as
select
    airport_heliport.aircraftstandcontamination.id,
    airport_heliport.aircraftstandcontamination.nilreason,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.observationTime_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.observationTime_nilreason || ')') as observationTime,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.nextObservationTime_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.nextObservationTime_nilreason || ')') as nextObservationTime,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.frictioncoefficient_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.frictionestimation_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.frictiondevice_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.obscuredlights_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.furtherclearancetime_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.furthertotalclearance_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.proportion_value as varchar), '(' || airport_heliport.aircraftstandcontamination_ts.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.aircraftstandcontamination_ts.depth_value as varchar) || ' ' || airport_heliport.aircraftstandcontamination_ts.depth_uom, '(' || airport_heliport.aircraftstandcontamination_ts.depth_nilreason || ')') as depth
from airport_heliport.aircraftstandcontamination 
create or replace view airport_heliport.airportheliportavailability_view as
select
    airport_heliport.airportheliportavailability.id,
    airport_heliport.airportheliportavailability.nilreason,
    coalesce(cast(airport_heliport.airportheliportavailability_ts.operationalstatus_value as varchar), '(' || airport_heliport.airportheliportavailability_ts.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(airport_heliport.airportheliportavailability_ts.warning_value as varchar), '(' || airport_heliport.airportheliportavailability_ts.warning_nilreason || ')') as warning
from airport_heliport.airportheliportavailability 
create or replace view airport_heliport.airportheliportcontamination_view as
select
    airport_heliport.airportheliportcontamination.id,
    airport_heliport.airportheliportcontamination.nilreason,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.observationTime_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.observationTime_nilreason || ')') as observationTime,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.nextObservationTime_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.nextObservationTime_nilreason || ')') as nextObservationTime,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.frictioncoefficient_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.frictionestimation_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.frictiondevice_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.obscuredlights_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.furtherclearancetime_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.furthertotalclearance_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.proportion_value as varchar), '(' || airport_heliport.airportheliportcontamination_ts.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.airportheliportcontamination_ts.depth_value as varchar) || ' ' || airport_heliport.airportheliportcontamination_ts.depth_uom, '(' || airport_heliport.airportheliportcontamination_ts.depth_nilreason || ')') as depth
from airport_heliport.airportheliportcontamination 
create or replace view airport_heliport.airportheliportresponsibilityorganisation_view as
select
    airport_heliport.airportheliportresponsibilityorganisation.id,
    airport_heliport.airportheliportresponsibilityorganisation.nilreason,
    coalesce(cast(airport_heliport.airportheliportresponsibilityorganisation_ts.role_value as varchar), '(' || airport_heliport.airportheliportresponsibilityorganisation_ts.role_nilreason || ')') as role
from airport_heliport.airportheliportresponsibilityorganisation 
create or replace view airport_heliport.airportheliportusage_view as
select
    airport_heliport.airportheliportusage.id,
    airport_heliport.airportheliportusage.nilreason,
    coalesce(cast(airport_heliport.airportheliportusage_ts.type_value as varchar), '(' || airport_heliport.airportheliportusage_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.airportheliportusage_ts.operation_value as varchar), '(' || airport_heliport.airportheliportusage_ts.operation_nilreason || ')') as operation,
    coalesce(cast(airport_heliport.airportheliportusage_ts.priorpermission_value as varchar) || ' ' || airport_heliport.airportheliportusage_ts.priorpermission_uom, '(' || airport_heliport.airportheliportusage_ts.priorpermission_nilreason || ')') as priorpermission,
    coalesce(cast(airport_heliport_conditioncombination_pt_auodem.title as varchar), '(' || airport_heliport_conditioncombination_pt_auodem.nilreason[1] || ')') AS selection,
    airport_heliport_conditioncombination_pt_auodem.href AS selection_href
from airport_heliport.airportheliportusage 
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_auodem on airport_heliport.airportheliportusage_ts.selection_id = airport_heliport_conditioncombination_pt_auodem.id
create or replace view airspace.airspaceactivation_view as
select
    airspace.airspaceactivation.id,
    airspace.airspaceactivation.nilreason,
    coalesce(cast(airspace.airspaceactivation_ts.activity_value as varchar), '(' || airspace.airspaceactivation_ts.activity_nilreason || ')') as activity,
    coalesce(cast(airspace.airspaceactivation_ts.status_value as varchar), '(' || airspace.airspaceactivation_ts.status_nilreason || ')') as status
from airspace.airspaceactivation 
create or replace view airspace.airspacegeometrycomponent_view as
select
    airspace.airspacegeometrycomponent.id,
    airspace.airspacegeometrycomponent.nilreason,
    coalesce(cast(airspace.airspacegeometrycomponent_ts.operation_value as varchar), '(' || airspace.airspacegeometrycomponent_ts.operation_nilreason || ')') as operation,
    coalesce(cast(airspace.airspacegeometrycomponent_ts.operationsequence_value as varchar), '(' || airspace.airspacegeometrycomponent_ts.operationsequence_nilreason || ')') as operationsequence,
    coalesce(cast(airspace_airspacevolume_pt_iyvudk.title as varchar), '(' || airspace_airspacevolume_pt_iyvudk.nilreason[1] || ')') AS theairspacevolume,
    airspace_airspacevolume_pt_iyvudk.href AS theairspacevolume_href
from airspace.airspacegeometrycomponent 
left join airspace.airspacevolume_pt airspace_airspacevolume_pt_iyvudk on airspace.airspacegeometrycomponent_ts.theairspacevolume_id = airspace_airspacevolume_pt_iyvudk.id
create or replace view airspace.airspacelayerclass_view as
select
    airspace.airspacelayerclass.id,
    airspace.airspacelayerclass.nilreason,
    coalesce(cast(airspace.airspacelayerclass_ts.classification_value as varchar), '(' || airspace.airspacelayerclass_ts.classification_nilreason || ')') as classification
from airspace.airspacelayerclass 
create or replace view shared.airspacelayer_view as
select
    shared.airspacelayer.id,
    shared.airspacelayer.nilreason,
    coalesce(cast(shared.airspacelayer_ts.upperlimitreference_value as varchar), '(' || shared.airspacelayer_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.airspacelayer_ts.lowerlimitreference_value as varchar), '(' || shared.airspacelayer_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.airspacelayer_ts.altitudeinterpretation_value as varchar), '(' || shared.airspacelayer_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(shared.airspacelayer_ts.upperlimit_value as varchar) || ' ' || shared.airspacelayer_ts.upperlimit_uom, '(' || shared.airspacelayer_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.airspacelayer_ts.lowerlimit_value as varchar) || ' ' || shared.airspacelayer_ts.lowerlimit_uom, '(' || shared.airspacelayer_ts.lowerlimit_nilreason || ')') as lowerlimit
from shared.airspacelayer 
create or replace view airspace.airspacevolumedependency_view as
select
    airspace.airspacevolumedependency.id,
    airspace.airspacevolumedependency.nilreason,
    coalesce(cast(airspace.airspacevolumedependency_ts.dependency_value as varchar), '(' || airspace.airspacevolumedependency_ts.dependency_nilreason || ')') as dependency
from airspace.airspacevolumedependency 
create or replace view airspace.airspacevolume_view as
select
    airspace.airspacevolume.id,
    airspace.airspacevolume.nilreason,
    coalesce(cast(airspace.airspacevolume_ts.upperlimitreference_value as varchar), '(' || airspace.airspacevolume_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(airspace.airspacevolume_ts.maximumlimitreference_value as varchar), '(' || airspace.airspacevolume_ts.maximumlimitreference_nilreason || ')') as maximumlimitreference,
    coalesce(cast(airspace.airspacevolume_ts.lowerlimitreference_value as varchar), '(' || airspace.airspacevolume_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(airspace.airspacevolume_ts.minimumlimitreference_value as varchar), '(' || airspace.airspacevolume_ts.minimumlimitreference_nilreason || ')') as minimumlimitreference,
    coalesce(cast(airspace.airspacevolume_ts.upperlimit_value as varchar) || ' ' || airspace.airspacevolume_ts.upperlimit_uom, '(' || airspace.airspacevolume_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(airspace.airspacevolume_ts.maximumlimit_value as varchar) || ' ' || airspace.airspacevolume_ts.maximumlimit_uom, '(' || airspace.airspacevolume_ts.maximumlimit_nilreason || ')') as maximumlimit,
    coalesce(cast(airspace.airspacevolume_ts.lowerlimit_value as varchar) || ' ' || airspace.airspacevolume_ts.lowerlimit_uom, '(' || airspace.airspacevolume_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(airspace.airspacevolume_ts.minimumlimit_value as varchar) || ' ' || airspace.airspacevolume_ts.minimumlimit_uom, '(' || airspace.airspacevolume_ts.minimumlimit_nilreason || ')') as minimumlimit,
    coalesce(cast(airspace.airspacevolume_ts.width_value as varchar) || ' ' || airspace.airspacevolume_ts.width_uom, '(' || airspace.airspacevolume_ts.width_nilreason || ')') as width,
    coalesce(cast(airspace_airspacevolumedependency_pt_kgcpyt.title as varchar), '(' || airspace_airspacevolumedependency_pt_kgcpyt.nilreason[1] || ')') AS contributorairspace,
    airspace_airspacevolumedependency_pt_kgcpyt.href AS contributorairspace_href
from airspace.airspacevolume 
left join airspace.airspacevolumedependency_pt airspace_airspacevolumedependency_pt_kgcpyt on airspace.airspacevolume_ts.contributorairspace_id = airspace_airspacevolumedependency_pt_kgcpyt.id
create or replace view airport_heliport.altimetersourcestatus_view as
select
    airport_heliport.altimetersourcestatus.id,
    airport_heliport.altimetersourcestatus.nilreason,
    coalesce(cast(airport_heliport.altimetersourcestatus_ts.operationalstatus_value as varchar), '(' || airport_heliport.altimetersourcestatus_ts.operationalstatus_nilreason || ')') as operationalstatus
from airport_heliport.altimetersourcestatus 
create or replace view shared.altitudeadjustment_view as
select
    shared.altitudeadjustment.id,
    shared.altitudeadjustment.nilreason,
    coalesce(cast(shared.altitudeadjustment_ts.altitudeadjustmenttype_value as varchar), '(' || shared.altitudeadjustment_ts.altitudeadjustmenttype_nilreason || ')') as altitudeadjustmenttype,
    coalesce(cast(shared.altitudeadjustment_ts.primaryalternateminimum_value as varchar), '(' || shared.altitudeadjustment_ts.primaryalternateminimum_nilreason || ')') as primaryalternateminimum,
    coalesce(cast(shared.altitudeadjustment_ts.localremotecode_value as varchar), '(' || shared.altitudeadjustment_ts.localremotecode_nilreason || ')') as localremotecode,
    coalesce(cast(shared.altitudeadjustment_ts.altitudeadjustment_value as varchar) || ' ' || shared.altitudeadjustment_ts.altitudeadjustment_uom, '(' || shared.altitudeadjustment_ts.altitudeadjustment_nilreason || ')') as altitudeadjustment
from shared.altitudeadjustment 
create or replace view navaids_points.angleuse_view as
select
    navaids_points.angleuse.id,
    navaids_points.angleuse.nilreason,
    coalesce(cast(navaids_points.angleuse_ts.alongcourseguidance_value as varchar), '(' || navaids_points.angleuse_ts.alongcourseguidance_nilreason || ')') as alongcourseguidance
from navaids_points.angleuse 
create or replace view procedure.approachaltitudetable_view as
select
    procedure.approachaltitudetable.id,
    procedure.approachaltitudetable.nilreason,
    coalesce(cast(procedure.approachaltitudetable_ts.measurementpoint_value as varchar), '(' || procedure.approachaltitudetable_ts.measurementpoint_nilreason || ')') as measurementpoint,
    coalesce(cast(procedure.approachaltitudetable_ts.altitudereference_value as varchar), '(' || procedure.approachaltitudetable_ts.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(procedure.approachaltitudetable_ts.altitude_value as varchar) || ' ' || procedure.approachaltitudetable_ts.altitude_uom, '(' || procedure.approachaltitudetable_ts.altitude_nilreason || ')') as altitude
from procedure.approachaltitudetable 
create or replace view procedure.approachcondition_view as
select
    procedure.approachcondition.id,
    procedure.approachcondition.nilreason,
    coalesce(cast(procedure.approachcondition_ts.finalapproachpath_value as varchar), '(' || procedure.approachcondition_ts.finalapproachpath_nilreason || ')') as finalapproachpath,
    coalesce(cast(procedure.approachcondition_ts.requirednavigationperformance_value as varchar), '(' || procedure.approachcondition_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.approachcondition_ts.climbgradient_value as varchar), '(' || procedure.approachcondition_ts.climbgradient_nilreason || ')') as climbgradient,
    coalesce(cast(procedure_minima_pt_eorcnh.title as varchar), '(' || procedure_minima_pt_eorcnh.nilreason[1] || ')') AS minimumset,
    procedure_minima_pt_eorcnh.href AS minimumset_href
from procedure.approachcondition 
left join procedure.minima_pt procedure_minima_pt_eorcnh on procedure.approachcondition_ts.minimumset_id = procedure_minima_pt_eorcnh.id
create or replace view procedure.approachdistancetable_view as
select
    procedure.approachdistancetable.id,
    procedure.approachdistancetable.nilreason,
    coalesce(cast(procedure.approachdistancetable_ts.startingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable_ts.startingmeasurementpoint_nilreason || ')') as startingmeasurementpoint,
    coalesce(cast(procedure.approachdistancetable_ts.endingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable_ts.endingmeasurementpoint_nilreason || ')') as endingmeasurementpoint,
    coalesce(cast(procedure.approachdistancetable_ts.valuehat_value as varchar) || ' ' || procedure.approachdistancetable_ts.valuehat_uom, '(' || procedure.approachdistancetable_ts.valuehat_nilreason || ')') as valuehat,
    coalesce(cast(procedure.approachdistancetable_ts.distance_value as varchar) || ' ' || procedure.approachdistancetable_ts.distance_uom, '(' || procedure.approachdistancetable_ts.distance_nilreason || ')') as distance
from procedure.approachdistancetable 
create or replace view procedure.approachtimingtable_view as
select
    procedure.approachtimingtable.id,
    procedure.approachtimingtable.nilreason,
    coalesce(cast(procedure.approachtimingtable_ts.startingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable_ts.startingmeasurementpoint_nilreason || ')') as startingmeasurementpoint,
    coalesce(cast(procedure.approachtimingtable_ts.endingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable_ts.endingmeasurementpoint_nilreason || ')') as endingmeasurementpoint,
    coalesce(cast(procedure.approachtimingtable_ts.time_value as varchar) || ' ' || procedure.approachtimingtable_ts.time_uom, '(' || procedure.approachtimingtable_ts.time_nilreason || ')') as time,
    coalesce(cast(procedure.approachtimingtable_ts.speed_value as varchar) || ' ' || procedure.approachtimingtable_ts.speed_uom, '(' || procedure.approachtimingtable_ts.speed_nilreason || ')') as speed
from procedure.approachtimingtable 
create or replace view airport_heliport.apronareaavailability_view as
select
    airport_heliport.apronareaavailability.id,
    airport_heliport.apronareaavailability.nilreason,
    coalesce(cast(airport_heliport.apronareaavailability_ts.operationalstatus_value as varchar), '(' || airport_heliport.apronareaavailability_ts.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(airport_heliport.apronareaavailability_ts.warning_value as varchar), '(' || airport_heliport.apronareaavailability_ts.warning_nilreason || ')') as warning
from airport_heliport.apronareaavailability 
create or replace view airport_heliport.apronareausage_view as
select
    airport_heliport.apronareausage.id,
    airport_heliport.apronareausage.nilreason,
    coalesce(cast(airport_heliport.apronareausage_ts.type_value as varchar), '(' || airport_heliport.apronareausage_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.apronareausage_ts.priorpermission_value as varchar) || ' ' || airport_heliport.apronareausage_ts.priorpermission_uom, '(' || airport_heliport.apronareausage_ts.priorpermission_nilreason || ')') as priorpermission,
    coalesce(cast(airport_heliport_conditioncombination_pt_zfjqjv.title as varchar), '(' || airport_heliport_conditioncombination_pt_zfjqjv.nilreason[1] || ')') AS selection,
    airport_heliport_conditioncombination_pt_zfjqjv.href AS selection_href
from airport_heliport.apronareausage 
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_zfjqjv on airport_heliport.apronareausage_ts.selection_id = airport_heliport_conditioncombination_pt_zfjqjv.id
create or replace view airport_heliport.aproncontamination_view as
select
    airport_heliport.aproncontamination.id,
    airport_heliport.aproncontamination.nilreason,
    coalesce(cast(airport_heliport.aproncontamination_ts.observationTime_value as varchar), '(' || airport_heliport.aproncontamination_ts.observationTime_nilreason || ')') as observationTime,
    coalesce(cast(airport_heliport.aproncontamination_ts.nextObservationTime_value as varchar), '(' || airport_heliport.aproncontamination_ts.nextObservationTime_nilreason || ')') as nextObservationTime,
    coalesce(cast(airport_heliport.aproncontamination_ts.frictioncoefficient_value as varchar), '(' || airport_heliport.aproncontamination_ts.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.aproncontamination_ts.frictionestimation_value as varchar), '(' || airport_heliport.aproncontamination_ts.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.aproncontamination_ts.frictiondevice_value as varchar), '(' || airport_heliport.aproncontamination_ts.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.aproncontamination_ts.obscuredlights_value as varchar), '(' || airport_heliport.aproncontamination_ts.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.aproncontamination_ts.furtherclearancetime_value as varchar), '(' || airport_heliport.aproncontamination_ts.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.aproncontamination_ts.furthertotalclearance_value as varchar), '(' || airport_heliport.aproncontamination_ts.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.aproncontamination_ts.proportion_value as varchar), '(' || airport_heliport.aproncontamination_ts.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.aproncontamination_ts.depth_value as varchar) || ' ' || airport_heliport.aproncontamination_ts.depth_uom, '(' || airport_heliport.aproncontamination_ts.depth_nilreason || ')') as depth
from airport_heliport.aproncontamination 
create or replace view aerial_refuelling.authorityforaerialrefuelling_view as
select
    aerial_refuelling.authorityforaerialrefuelling.id,
    aerial_refuelling.authorityforaerialrefuelling.nilreason,
    coalesce(cast(aerial_refuelling.authorityforaerialrefuelling_ts.type_value as varchar), '(' || aerial_refuelling.authorityforaerialrefuelling_ts.type_nilreason || ')') as type
from aerial_refuelling.authorityforaerialrefuelling 
create or replace view navaids_points.authorityfornavaidequipment_view as
select
    navaids_points.authorityfornavaidequipment.id,
    navaids_points.authorityfornavaidequipment.nilreason,
    coalesce(cast(navaids_points.authorityfornavaidequipment_ts.type_value as varchar), '(' || navaids_points.authorityfornavaidequipment_ts.type_nilreason || ')') as type
from navaids_points.authorityfornavaidequipment 
create or replace view navaids_points.authorityforspecialnavigationstation_view as
select
    navaids_points.authorityforspecialnavigationstation.id,
    navaids_points.authorityforspecialnavigationstation.nilreason,
    coalesce(cast(navaids_points.authorityforspecialnavigationstation_ts.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationstation_ts.type_nilreason || ')') as type
from navaids_points.authorityforspecialnavigationstation 
create or replace view navaids_points.authorityforspecialnavigationsystem_view as
select
    navaids_points.authorityforspecialnavigationsystem.id,
    navaids_points.authorityforspecialnavigationsystem.nilreason,
    coalesce(cast(navaids_points.authorityforspecialnavigationsystem_ts.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationsystem_ts.type_nilreason || ')') as type
from navaids_points.authorityforspecialnavigationsystem 
create or replace view service.callsigndetail_view as
select
    service.callsigndetail.id,
    service.callsigndetail.nilreason,
    coalesce(cast(service.callsigndetail_ts.callsign_value as varchar), '(' || service.callsigndetail_ts.callsign_nilreason || ')') as callsign,
    coalesce(cast(service.callsigndetail_ts.language_value as varchar), '(' || service.callsigndetail_ts.language_nilreason || ')') as language
from service.callsigndetail 
create or replace view shared.circlesector_view as
select
    shared.circlesector.id,
    shared.circlesector.nilreason,
    coalesce(cast(shared.circlesector_ts.arcdirection_value as varchar), '(' || shared.circlesector_ts.arcdirection_nilreason || ')') as arcdirection,
    coalesce(cast(shared.circlesector_ts.fromangle_value as varchar), '(' || shared.circlesector_ts.fromangle_nilreason || ')') as fromangle,
    coalesce(cast(shared.circlesector_ts.toangle_value as varchar), '(' || shared.circlesector_ts.toangle_nilreason || ')') as toangle,
    coalesce(cast(shared.circlesector_ts.angletype_value as varchar), '(' || shared.circlesector_ts.angletype_nilreason || ')') as angletype,
    coalesce(cast(shared.circlesector_ts.angledirectionreference_value as varchar), '(' || shared.circlesector_ts.angledirectionreference_nilreason || ')') as angledirectionreference,
    coalesce(cast(shared.circlesector_ts.upperlimitreference_value as varchar), '(' || shared.circlesector_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.circlesector_ts.lowerlimitreference_value as varchar), '(' || shared.circlesector_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.circlesector_ts.innerdistance_value as varchar) || ' ' || shared.circlesector_ts.innerdistance_uom, '(' || shared.circlesector_ts.innerdistance_nilreason || ')') as innerdistance,
    coalesce(cast(shared.circlesector_ts.outerdistance_value as varchar) || ' ' || shared.circlesector_ts.outerdistance_uom, '(' || shared.circlesector_ts.outerdistance_nilreason || ')') as outerdistance,
    coalesce(cast(shared.circlesector_ts.upperlimit_value as varchar) || ' ' || shared.circlesector_ts.upperlimit_uom, '(' || shared.circlesector_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.circlesector_ts.lowerlimit_value as varchar) || ' ' || shared.circlesector_ts.lowerlimit_uom, '(' || shared.circlesector_ts.lowerlimit_nilreason || ')') as lowerlimit
from shared.circlesector 
create or replace view procedure.circlingrestriction_view as
select
    procedure.circlingrestriction.id,
    procedure.circlingrestriction.nilreason,
    coalesce(cast(shared_circlesector_pt_lovywh.title as varchar), '(' || shared_circlesector_pt_lovywh.nilreason[1] || ')') AS sectordescription,
    shared_circlesector_pt_lovywh.href AS sectordescription_href
from procedure.circlingrestriction 
left join shared.circlesector_pt shared_circlesector_pt_lovywh on procedure.circlingrestriction_ts.sectordescription_id = shared_circlesector_pt_lovywh.id
create or replace view airport_heliport.city_view as
select
    airport_heliport.city.id,
    airport_heliport.city.nilreason,
    coalesce(cast(airport_heliport.city_ts.name_value as varchar), '(' || airport_heliport.city_ts.name_nilreason || ')') as name
from airport_heliport.city 
create or replace view airport_heliport.conditioncombination_view as
select
    airport_heliport.conditioncombination.id,
    airport_heliport.conditioncombination.nilreason,
    coalesce(cast(airport_heliport.conditioncombination_ts.logicaloperator_value as varchar), '(' || airport_heliport.conditioncombination_ts.logicaloperator_nilreason || ')') as logicaloperator
from airport_heliport.conditioncombination 
create or replace view shared.contactinformation_view as
select
    shared.contactinformation.id,
    shared.contactinformation.nilreason,
    coalesce(cast(shared.contactinformation_ts.name_value as varchar), '(' || shared.contactinformation_ts.name_nilreason || ')') as name,
    coalesce(cast(shared.contactinformation_ts.title_value as varchar), '(' || shared.contactinformation_ts.title_nilreason || ')') as title
from shared.contactinformation 
create or replace view procedure.departurearrivalcondition_view as
select
    procedure.departurearrivalcondition.id,
    procedure.departurearrivalcondition.nilreason,
    coalesce(cast(procedure.departurearrivalcondition_ts.minimumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition_ts.minimumcrossingatendreference_nilreason || ')') as minimumcrossingatendreference,
    coalesce(cast(procedure.departurearrivalcondition_ts.maximumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition_ts.maximumcrossingatendreference_nilreason || ')') as maximumcrossingatendreference,
    coalesce(cast(procedure.departurearrivalcondition_ts.minimumenroutealtitude_value as varchar) || ' ' || procedure.departurearrivalcondition_ts.minimumenroutealtitude_uom, '(' || procedure.departurearrivalcondition_ts.minimumenroutealtitude_nilreason || ')') as minimumenroutealtitude,
    coalesce(cast(procedure.departurearrivalcondition_ts.minimumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition_ts.minimumcrossingatend_uom, '(' || procedure.departurearrivalcondition_ts.minimumcrossingatend_nilreason || ')') as minimumcrossingatend,
    coalesce(cast(procedure.departurearrivalcondition_ts.maximumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition_ts.maximumcrossingatend_uom, '(' || procedure.departurearrivalcondition_ts.maximumcrossingatend_nilreason || ')') as maximumcrossingatend,
    coalesce(cast(shared_aircraftcharacteristic_pt_kfrual.title as varchar), '(' || shared_aircraftcharacteristic_pt_kfrual.nilreason[1] || ')') AS enginetype,
    shared_aircraftcharacteristic_pt_kfrual.href AS enginetype_href
from procedure.departurearrivalcondition 
left join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_kfrual on procedure.departurearrivalcondition_ts.engine_id = shared_aircraftcharacteristic_pt_kfrual.id
create or replace view routes.directflightclass_view as
select
    routes.directflightclass.id,
    routes.directflightclass.nilreason,
    coalesce(cast(routes.directflightclass_ts.exceedlength_value as varchar) || ' ' || routes.directflightclass_ts.exceedlength_uom, '(' || routes.directflightclass_ts.exceedlength_nilreason || ')') as exceedlength
from routes.directflightclass 
create or replace view routes.directflight_view as
select
    routes.directflight.id,
    routes.directflight.nilreason
from routes.directflight 
create or replace view routes.directflightsegment_view as
select
    routes.directflightsegment.id,
    routes.directflightsegment.nilreason
from routes.directflightsegment 
create or replace view navaids_points.enroutesegmentpoint_view as
select
    navaids_points.enroutesegmentpoint.id,
    navaids_points.enroutesegmentpoint.nilreason,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.reportingatc_value as varchar), '(' || navaids_points.enroutesegmentpoint_ts.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.flyover_value as varchar), '(' || navaids_points.enroutesegmentpoint_ts.flyover_nilreason || ')') as flyover,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.waypoint_value as varchar), '(' || navaids_points.enroutesegmentpoint_ts.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.radarguidance_value as varchar), '(' || navaids_points.enroutesegmentpoint_ts.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.rolefreeflight_value as varchar), '(' || navaids_points.enroutesegmentpoint_ts.rolefreeflight_nilreason || ')') as rolefreeflight,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.rolervsm_value as varchar), '(' || navaids_points.enroutesegmentpoint_ts.rolervsm_nilreason || ')') as rolervsm,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.rolemilitarytraining_value as varchar), '(' || navaids_points.enroutesegmentpoint_ts.rolemilitarytraining_nilreason || ')') as rolemilitarytraining,
    coalesce(cast(navaids_points.enroutesegmentpoint_ts.turnradius_value as varchar) || ' ' || navaids_points.enroutesegmentpoint_ts.turnradius_uom, '(' || navaids_points.enroutesegmentpoint_ts.turnradius_nilreason || ')') as turnradius
from navaids_points.enroutesegmentpoint 
create or replace view procedure.equipmentunavailableadjustmentcolumn_view as
select
    procedure.equipmentunavailableadjustmentcolumn.id,
    procedure.equipmentunavailableadjustmentcolumn.nilreason,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn_ts.guidanceequipment_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn_ts.guidanceequipment_nilreason || ')') as guidanceequipment,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn_ts.landingsystemlights_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn_ts.landingsystemlights_nilreason || ')') as landingsystemlights,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn_ts.equipmentrvr_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn_ts.equipmentrvr_nilreason || ')') as equipmentrvr,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn_ts.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn_ts.approachlightinginoperative_nilreason || ')') as approachlightinginoperative,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn_ts.visibilityadjustment_value as varchar) || ' ' || procedure.equipmentunavailableadjustmentcolumn_ts.visibilityadjustment_uom, '(' || procedure.equipmentunavailableadjustmentcolumn_ts.visibilityadjustment_nilreason || ')') as visibilityadjustment
from procedure.equipmentunavailableadjustmentcolumn 
create or replace view procedure.equipmentunavailableadjustment_view as
select
    procedure.equipmentunavailableadjustment.id,
    procedure.equipmentunavailableadjustment.nilreason,
    coalesce(cast(procedure.equipmentunavailableadjustment_ts.type_value as varchar), '(' || procedure.equipmentunavailableadjustment_ts.type_nilreason || ')') as type,
    coalesce(cast(procedure.equipmentunavailableadjustment_ts.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustment_ts.approachlightinginoperative_nilreason || ')') as approachlightinginoperative
from procedure.equipmentunavailableadjustment 
create or replace view public.fasdatablock_view as
select
    public.fasdatablock.id,
    public.fasdatablock.nilreason,
    coalesce(cast(public.fasdatablock_ts.horizontalalarmlimit_value as varchar), '(' || public.fasdatablock_ts.horizontalalarmlimit_nilreason || ')') as horizontalalarmlimit,
    coalesce(cast(public.fasdatablock_ts.verticalalarmlimit_value as varchar), '(' || public.fasdatablock_ts.verticalalarmlimit_nilreason || ')') as verticalalarmlimit,
    coalesce(cast(public.fasdatablock_ts.crcremainder_value as varchar), '(' || public.fasdatablock_ts.crcremainder_nilreason || ')') as crcremainder,
    coalesce(cast(public.fasdatablock_ts.operationtype_value as varchar), '(' || public.fasdatablock_ts.operationtype_nilreason || ')') as operationtype,
    coalesce(cast(public.fasdatablock_ts.serviceprovidersbas_value as varchar), '(' || public.fasdatablock_ts.serviceprovidersbas_nilreason || ')') as serviceprovidersbas,
    coalesce(cast(public.fasdatablock_ts.approachperformancedesignator_value as varchar), '(' || public.fasdatablock_ts.approachperformancedesignator_nilreason || ')') as approachperformancedesignator,
    coalesce(cast(public.fasdatablock_ts.referencepathdataselector_value as varchar), '(' || public.fasdatablock_ts.referencepathdataselector_nilreason || ')') as referencepathdataselector,
    coalesce(cast(public.fasdatablock_ts.thresholdcoursewidth_value as varchar) || ' ' || public.fasdatablock_ts.thresholdcoursewidth_uom, '(' || public.fasdatablock_ts.thresholdcoursewidth_nilreason || ')') as thresholdcoursewidth,
    coalesce(cast(public.fasdatablock_ts.lengthoffset_value as varchar) || ' ' || public.fasdatablock_ts.lengthoffset_uom, '(' || public.fasdatablock_ts.lengthoffset_nilreason || ')') as lengthoffset
from public.fasdatablock 
create or replace view procedure.finalprofile_view as
select
    procedure.finalprofile.id,
    procedure.finalprofile.nilreason
from procedure.finalprofile 
create or replace view shared.flightcharacteristic_view as
select
    shared.flightcharacteristic.id,
    shared.flightcharacteristic.nilreason,
    coalesce(cast(shared.flightcharacteristic_ts.type_value as varchar), '(' || shared.flightcharacteristic_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.flightcharacteristic_ts.rule_value as varchar), '(' || shared.flightcharacteristic_ts.rule_nilreason || ')') as rule,
    coalesce(cast(shared.flightcharacteristic_ts.status_value as varchar), '(' || shared.flightcharacteristic_ts.status_nilreason || ')') as status,
    coalesce(cast(shared.flightcharacteristic_ts.military_value as varchar), '(' || shared.flightcharacteristic_ts.military_nilreason || ')') as military,
    coalesce(cast(shared.flightcharacteristic_ts.origin_value as varchar), '(' || shared.flightcharacteristic_ts.origin_nilreason || ')') as origin,
    coalesce(cast(shared.flightcharacteristic_ts.purpose_value as varchar), '(' || shared.flightcharacteristic_ts.purpose_nilreason || ')') as purpose
from shared.flightcharacteristic 
create or replace view routes.flightconditioncircumstance_view as
select
    routes.flightconditioncircumstance.id,
    routes.flightconditioncircumstance.nilreason,
    coalesce(cast(routes.flightconditioncircumstance_ts.referencelocation_value as varchar), '(' || routes.flightconditioncircumstance_ts.referencelocation_nilreason || ')') as referencelocation,
    coalesce(cast(routes.flightconditioncircumstance_ts.relationwithlocation_value as varchar), '(' || routes.flightconditioncircumstance_ts.relationwithlocation_nilreason || ')') as relationwithlocation
from routes.flightconditioncircumstance 
create or replace view routes.flightconditioncombination_view as
select
    routes.flightconditioncombination.id,
    routes.flightconditioncombination.nilreason,
    coalesce(cast(routes.flightconditioncombination_ts.logicaloperator_value as varchar), '(' || routes.flightconditioncombination_ts.logicaloperator_nilreason || ')') as logicaloperator
from routes.flightconditioncombination 
create or replace view routes.flightconditionelement_view as
select
    routes.flightconditionelement.id,
    routes.flightconditionelement.nilreason,
    coalesce(cast(routes.flightconditionelement_ts.index_value as varchar), '(' || routes.flightconditionelement_ts.index_nilreason || ')') as index,
    coalesce(cast(routes_routeportion_pt_tkcnwc.title as varchar), '(' || routes_routeportion_pt_tkcnwc.nilreason[1] || ')') AS flightconditionrouteportioncondition,
    routes_routeportion_pt_tkcnwc.href AS flightconditionrouteportioncondition_href,
    coalesce(cast(routes_directflight_pt_xobymx.title as varchar), '(' || routes_directflight_pt_xobymx.nilreason[1] || ')') AS flightconditiondirectflightcondition,
    routes_directflight_pt_xobymx.href AS flightconditiondirectflightcondition_href,
    coalesce(cast(shared_aircraftcharacteristic_pt_acknuv.title as varchar), '(' || shared_aircraftcharacteristic_pt_acknuv.nilreason[1] || ')') AS flightconditionaircraft,
    shared_aircraftcharacteristic_pt_acknuv.href AS flightconditionaircraft_href,
    coalesce(cast(shared_flightcharacteristic_pt_foltay.title as varchar), '(' || shared_flightcharacteristic_pt_foltay.nilreason[1] || ')') AS flightconditionflight,
    shared_flightcharacteristic_pt_foltay.href AS flightconditionflight_href,
    coalesce(cast(routes_flightconditioncombination_pt_jzvlfn.title as varchar), '(' || routes_flightconditioncombination_pt_jzvlfn.nilreason[1] || ')') AS flightconditionoperand,
    routes_flightconditioncombination_pt_jzvlfn.href AS flightconditionoperand_href,
    coalesce(cast(shared_meteorology_pt_wrdqed.title as varchar), '(' || shared_meteorology_pt_wrdqed.nilreason[1] || ')') AS flightconditionweather,
    shared_meteorology_pt_wrdqed.href AS flightconditionweather_href,
    coalesce(cast(routes_flightconditioncircumstance_pt_mhcxxi.title as varchar), '(' || routes_flightconditioncircumstance_pt_mhcxxi.nilreason[1] || ')') AS operationalcondition,
    routes_flightconditioncircumstance_pt_mhcxxi.href AS operationalcondition_href
from routes.flightconditionelement 
left join routes.routeportion_pt routes_routeportion_pt_tkcnwc on routes.flightconditionelement_ts.flightcondition_routeportioncondition_id = routes_routeportion_pt_tkcnwc.id
left join routes.directflight_pt routes_directflight_pt_xobymx on routes.flightconditionelement_ts.flightcondition_directflightcondition_id = routes_directflight_pt_xobymx.id
left join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_acknuv on routes.flightconditionelement_ts.flightcondition_aircraft_id = shared_aircraftcharacteristic_pt_acknuv.id
left join shared.flightcharacteristic_pt shared_flightcharacteristic_pt_foltay on routes.flightconditionelement_ts.flightcondition_flight_id = shared_flightcharacteristic_pt_foltay.id
left join routes.flightconditioncombination_pt routes_flightconditioncombination_pt_jzvlfn on routes.flightconditionelement_ts.flightcondition_operand_id = routes_flightconditioncombination_pt_jzvlfn.id
left join shared.meteorology_pt shared_meteorology_pt_wrdqed on routes.flightconditionelement_ts.flightcondition_weather_id = shared_meteorology_pt_wrdqed.id
left join routes.flightconditioncircumstance_pt routes_flightconditioncircumstance_pt_mhcxxi on routes.flightconditionelement_ts.operationalcondition_id = routes_flightconditioncircumstance_pt_mhcxxi.id
create or replace view routes.flightrestrictionlevel_view as
select
    routes.flightrestrictionlevel.id,
    routes.flightrestrictionlevel.nilreason,
    coalesce(cast(routes.flightrestrictionlevel_ts.upperlevelreference_value as varchar), '(' || routes.flightrestrictionlevel_ts.upperlevelreference_nilreason || ')') as upperlevelreference,
    coalesce(cast(routes.flightrestrictionlevel_ts.lowerlevelreference_value as varchar), '(' || routes.flightrestrictionlevel_ts.lowerlevelreference_nilreason || ')') as lowerlevelreference,
    coalesce(cast(routes.flightrestrictionlevel_ts.upperlevel_value as varchar) || ' ' || routes.flightrestrictionlevel_ts.upperlevel_uom, '(' || routes.flightrestrictionlevel_ts.upperlevel_nilreason || ')') as upperlevel,
    coalesce(cast(routes.flightrestrictionlevel_ts.lowerlevel_value as varchar) || ' ' || routes.flightrestrictionlevel_ts.lowerlevel_uom, '(' || routes.flightrestrictionlevel_ts.lowerlevel_nilreason || ')') as lowerlevel
from routes.flightrestrictionlevel 
create or replace view routes.flightrestrictionroute_view as
select
    routes.flightrestrictionroute.id,
    routes.flightrestrictionroute.nilreason,
    coalesce(cast(routes.flightrestrictionroute_ts.priorpermission_value as varchar), '(' || routes.flightrestrictionroute_ts.priorpermission_nilreason || ')') as priorpermission
from routes.flightrestrictionroute 
create or replace view routes.flightroutingelement_view as
select
    routes.flightroutingelement.id,
    routes.flightroutingelement.nilreason,
    coalesce(cast(routes.flightroutingelement_ts.ordernumber_value as varchar), '(' || routes.flightroutingelement_ts.ordernumber_nilreason || ')') as ordernumber,
    coalesce(cast(routes.flightroutingelement_ts.speedreference_value as varchar), '(' || routes.flightroutingelement_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(routes.flightroutingelement_ts.speedcriteria_value as varchar), '(' || routes.flightroutingelement_ts.speedcriteria_nilreason || ')') as speedcriteria,
    coalesce(cast(routes.flightroutingelement_ts.speed_value as varchar) || ' ' || routes.flightroutingelement_ts.speed_uom, '(' || routes.flightroutingelement_ts.speed_nilreason || ')') as speed,
    coalesce(cast(routes_directflightsegment_pt_vaqlxc.title as varchar), '(' || routes_directflightsegment_pt_vaqlxc.nilreason[1] || ')') AS elementdirectflightelement,
    routes_directflightsegment_pt_vaqlxc.href AS elementdirectflightelement_href,
    coalesce(cast(routes_routeportion_pt_dkpggh.title as varchar), '(' || routes_routeportion_pt_dkpggh.nilreason[1] || ')') AS elementrouteportionelement,
    routes_routeportion_pt_dkpggh.href AS elementrouteportionelement_href
from routes.flightroutingelement 
left join routes.directflightsegment_pt routes_directflightsegment_pt_vaqlxc on routes.flightroutingelement_ts.element_directflightelement_id = routes_directflightsegment_pt_vaqlxc.id
left join routes.routeportion_pt routes_routeportion_pt_dkpggh on routes.flightroutingelement_ts.element_routeportionelement_id = routes_routeportion_pt_dkpggh.id
create or replace view service.fuel_view as
select
    service.fuel.id,
    service.fuel.nilreason,
    coalesce(cast(service.fuel_ts.category_value as varchar), '(' || service.fuel_ts.category_nilreason || ')') as category
from service.fuel 
create or replace view airport_heliport.groundlightingavailability_view as
select
    airport_heliport.groundlightingavailability.id,
    airport_heliport.groundlightingavailability.nilreason,
    coalesce(cast(airport_heliport.groundlightingavailability_ts.operationalstatus_value as varchar), '(' || airport_heliport.groundlightingavailability_ts.operationalstatus_nilreason || ')') as operationalstatus
from airport_heliport.groundlightingavailability 
create or replace view holding.holdingpatterndistance_view as
select
    holding.holdingpatterndistance.id,
    holding.holdingpatterndistance.nilreason,
    coalesce(cast(holding.holdingpatterndistance_ts.length_value as varchar) || ' ' || holding.holdingpatterndistance_ts.length_uom, '(' || holding.holdingpatterndistance_ts.length_nilreason || ')') as length
from holding.holdingpatterndistance 
create or replace view holding.holdingpatternduration_view as
select
    holding.holdingpatternduration.id,
    holding.holdingpatternduration.nilreason,
    coalesce(cast(holding.holdingpatternduration_ts.duration_value as varchar) || ' ' || holding.holdingpatternduration_ts.duration_uom, '(' || holding.holdingpatternduration_ts.duration_nilreason || ')') as duration
from holding.holdingpatternduration 
create or replace view procedure.holdinguse_view as
select
    procedure.holdinguse.id,
    procedure.holdinguse.nilreason,
    coalesce(cast(procedure.holdinguse_ts.holdinguse_value as varchar), '(' || procedure.holdinguse_ts.holdinguse_nilreason || ')') as holdinguse,
    coalesce(cast(procedure.holdinguse_ts.instruction_value as varchar), '(' || procedure.holdinguse_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.holdinguse_ts.instructionaltitudereference_value as varchar), '(' || procedure.holdinguse_ts.instructionaltitudereference_nilreason || ')') as instructionaltitudereference,
    coalesce(cast(procedure.holdinguse_ts.instructedaltitude_value as varchar) || ' ' || procedure.holdinguse_ts.instructedaltitude_uom, '(' || procedure.holdinguse_ts.instructedaltitude_nilreason || ')') as instructedaltitude
from procedure.holdinguse 
create or replace view procedure.landingtakeoffareacollection_view as
select
    procedure.landingtakeoffareacollection.id,
    procedure.landingtakeoffareacollection.nilreason
from procedure.landingtakeoffareacollection 
create or replace view airport_heliport.lightactivation_view as
select
    airport_heliport.lightactivation.id,
    airport_heliport.lightactivation.nilreason,
    coalesce(cast(airport_heliport.lightactivation_ts.clicks_value as varchar), '(' || airport_heliport.lightactivation_ts.clicks_nilreason || ')') as clicks,
    coalesce(cast(airport_heliport.lightactivation_ts.intensitylevel_value as varchar), '(' || airport_heliport.lightactivation_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.lightactivation_ts.activation_value as varchar), '(' || airport_heliport.lightactivation_ts.activation_nilreason || ')') as activation
from airport_heliport.lightactivation 
create or replace view shared.lightelement_view as
select
    shared.lightelement.id,
    shared.lightelement.nilreason,
    coalesce(cast(shared.lightelement_ts.colour_value as varchar), '(' || shared.lightelement_ts.colour_nilreason || ')') as colour,
    coalesce(cast(shared.lightelement_ts.intensitylevel_value as varchar), '(' || shared.lightelement_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(shared.lightelement_ts.type_value as varchar), '(' || shared.lightelement_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.lightelement_ts.intensity_value as varchar) || ' ' || shared.lightelement_ts.intensity_uom, '(' || shared.lightelement_ts.intensity_nilreason || ')') as intensity
from shared.lightelement 
create or replace view shared.lightelementstatus_view as
select
    shared.lightelementstatus.id,
    shared.lightelementstatus.nilreason,
    coalesce(cast(shared.lightelementstatus_ts.status_value as varchar), '(' || shared.lightelementstatus_ts.status_nilreason || ')') as status
from shared.lightelementstatus 
create or replace view notes.linguisticnote_view as
select
    notes.linguisticnote.id,
    notes.linguisticnote.nilreason,
    coalesce(cast(notes.linguisticnote_ts.note_value as varchar) || ' ' || notes.linguisticnote_ts.note_nilreason, '(' || notes.linguisticnote_ts.note_lang || ')') as note
from notes.linguisticnote 
create or replace view airport_heliport.manoeuvringareaavailability_view as
select
    airport_heliport.manoeuvringareaavailability.id,
    airport_heliport.manoeuvringareaavailability.nilreason,
    coalesce(cast(airport_heliport.manoeuvringareaavailability_ts.operationalstatus_value as varchar), '(' || airport_heliport.manoeuvringareaavailability_ts.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(airport_heliport.manoeuvringareaavailability_ts.warning_value as varchar), '(' || airport_heliport.manoeuvringareaavailability_ts.warning_nilreason || ')') as warning
from airport_heliport.manoeuvringareaavailability 
create or replace view airport_heliport.manoeuvringareausage_view as
select
    airport_heliport.manoeuvringareausage.id,
    airport_heliport.manoeuvringareausage.nilreason,
    coalesce(cast(airport_heliport.manoeuvringareausage_ts.type_value as varchar), '(' || airport_heliport.manoeuvringareausage_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.manoeuvringareausage_ts.operation_value as varchar), '(' || airport_heliport.manoeuvringareausage_ts.operation_nilreason || ')') as operation,
    coalesce(cast(airport_heliport.manoeuvringareausage_ts.priorpermission_value as varchar) || ' ' || airport_heliport.manoeuvringareausage_ts.priorpermission_uom, '(' || airport_heliport.manoeuvringareausage_ts.priorpermission_nilreason || ')') as priorpermission,
    coalesce(cast(airport_heliport_conditioncombination_pt_prpnej.title as varchar), '(' || airport_heliport_conditioncombination_pt_prpnej.nilreason[1] || ')') AS selection,
    airport_heliport_conditioncombination_pt_prpnej.href AS selection_href
from airport_heliport.manoeuvringareausage 
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_prpnej on airport_heliport.manoeuvringareausage_ts.selection_id = airport_heliport_conditioncombination_pt_prpnej.id
create or replace view airport_heliport.markingelement_view as
select
    airport_heliport.markingelement.id,
    airport_heliport.markingelement.nilreason,
    coalesce(cast(airport_heliport.markingelement_ts.colour_value as varchar), '(' || airport_heliport.markingelement_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.markingelement_ts.style_value as varchar), '(' || airport_heliport.markingelement_ts.style_nilreason || ')') as style
from airport_heliport.markingelement 
create or replace view shared.meteorology_view as
select
    shared.meteorology.id,
    shared.meteorology.nilreason,
    coalesce(cast(shared.meteorology_ts.flightconditions_value as varchar), '(' || shared.meteorology_ts.flightconditions_nilreason || ')') as flightconditions,
    coalesce(cast(shared.meteorology_ts.visibilityinterpretation_value as varchar), '(' || shared.meteorology_ts.visibilityinterpretation_nilreason || ')') as visibilityinterpretation,
    coalesce(cast(shared.meteorology_ts.runwayvisualrangeinterpretation_value as varchar), '(' || shared.meteorology_ts.runwayvisualrangeinterpretation_nilreason || ')') as runwayvisualrangeinterpretation,
    coalesce(cast(shared.meteorology_ts.visibility_value as varchar) || ' ' || shared.meteorology_ts.visibility_uom, '(' || shared.meteorology_ts.visibility_nilreason || ')') as visibility,
    coalesce(cast(shared.meteorology_ts.runwayvisualrange_value as varchar) || ' ' || shared.meteorology_ts.runwayvisualrange_uom, '(' || shared.meteorology_ts.runwayvisualrange_nilreason || ')') as runwayvisualrange
from shared.meteorology 
create or replace view procedure.minima_view as
select
    procedure.minima.id,
    procedure.minima.nilreason,
    coalesce(cast(procedure.minima_ts.altitudecode_value as varchar), '(' || procedure.minima_ts.altitudecode_nilreason || ')') as altitudecode,
    coalesce(cast(procedure.minima_ts.altitudereference_value as varchar), '(' || procedure.minima_ts.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(procedure.minima_ts.heightcode_value as varchar), '(' || procedure.minima_ts.heightcode_nilreason || ')') as heightcode,
    coalesce(cast(procedure.minima_ts.heightreference_value as varchar), '(' || procedure.minima_ts.heightreference_nilreason || ')') as heightreference,
    coalesce(cast(procedure.minima_ts.mandatoryrvr_value as varchar), '(' || procedure.minima_ts.mandatoryrvr_nilreason || ')') as mandatoryrvr,
    coalesce(cast(procedure.minima_ts.remotealtimeterminima_value as varchar), '(' || procedure.minima_ts.remotealtimeterminima_nilreason || ')') as remotealtimeterminima,
    coalesce(cast(procedure.minima_ts.altitude_value as varchar) || ' ' || procedure.minima_ts.altitude_uom, '(' || procedure.minima_ts.altitude_nilreason || ')') as altitude,
    coalesce(cast(procedure.minima_ts.height_value as varchar) || ' ' || procedure.minima_ts.height_uom, '(' || procedure.minima_ts.height_nilreason || ')') as height,
    coalesce(cast(procedure.minima_ts.militaryheight_value as varchar) || ' ' || procedure.minima_ts.militaryheight_uom, '(' || procedure.minima_ts.militaryheight_nilreason || ')') as militaryheight,
    coalesce(cast(procedure.minima_ts.radioheight_value as varchar) || ' ' || procedure.minima_ts.radioheight_uom, '(' || procedure.minima_ts.radioheight_nilreason || ')') as radioheight,
    coalesce(cast(procedure.minima_ts.visibility_value as varchar) || ' ' || procedure.minima_ts.visibility_uom, '(' || procedure.minima_ts.visibility_nilreason || ')') as visibility,
    coalesce(cast(procedure.minima_ts.militaryvisibility_value as varchar) || ' ' || procedure.minima_ts.militaryvisibility_uom, '(' || procedure.minima_ts.militaryvisibility_nilreason || ')') as militaryvisibility
from procedure.minima 
create or replace view procedure.missedapproachgroup_view as
select
    procedure.missedapproachgroup.id,
    procedure.missedapproachgroup.nilreason,
    coalesce(cast(procedure.missedapproachgroup_ts.instruction_value as varchar), '(' || procedure.missedapproachgroup_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.missedapproachgroup_ts.alternateclimbinstruction_value as varchar), '(' || procedure.missedapproachgroup_ts.alternateclimbinstruction_nilreason || ')') as alternateclimbinstruction,
    coalesce(cast(procedure.missedapproachgroup_ts.alternateclimbaltitude_value as varchar) || ' ' || procedure.missedapproachgroup_ts.alternateclimbaltitude_uom, '(' || procedure.missedapproachgroup_ts.alternateclimbaltitude_nilreason || ')') as alternateclimbaltitude
from procedure.missedapproachgroup 
create or replace view navaids_points.navaidcomponent_view as
select
    navaids_points.navaidcomponent.id,
    navaids_points.navaidcomponent.nilreason,
    coalesce(cast(navaids_points.navaidcomponent_ts.collocationgroup_value as varchar), '(' || navaids_points.navaidcomponent_ts.collocationgroup_nilreason || ')') as collocationgroup,
    coalesce(cast(navaids_points.navaidcomponent_ts.markerposition_value as varchar), '(' || navaids_points.navaidcomponent_ts.markerposition_nilreason || ')') as markerposition,
    coalesce(cast(navaids_points.navaidcomponent_ts.providesnavigablelocation_value as varchar), '(' || navaids_points.navaidcomponent_ts.providesnavigablelocation_nilreason || ')') as providesnavigablelocation
from navaids_points.navaidcomponent 
create or replace view airport_heliport.navaidequipmentdistance_view as
select
    airport_heliport.navaidequipmentdistance.id,
    airport_heliport.navaidequipmentdistance.nilreason,
    coalesce(cast(airport_heliport.navaidequipmentdistance_ts.distance_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance_ts.distance_uom, '(' || airport_heliport.navaidequipmentdistance_ts.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.navaidequipmentdistance_ts.distanceaccuracy_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance_ts.distanceaccuracy_uom, '(' || airport_heliport.navaidequipmentdistance_ts.distanceaccuracy_nilreason || ')') as distanceaccuracy
from airport_heliport.navaidequipmentdistance 
create or replace view navaids_points.navaidequipmentmonitoring_view as
select
    navaids_points.navaidequipmentmonitoring.id,
    navaids_points.navaidequipmentmonitoring.nilreason,
    coalesce(cast(navaids_points.navaidequipmentmonitoring_ts.monitored_value as varchar), '(' || navaids_points.navaidequipmentmonitoring_ts.monitored_nilreason || ')') as monitored
from navaids_points.navaidequipmentmonitoring 
create or replace view navaids_points.navaidoperationalstatus_view as
select
    navaids_points.navaidoperationalstatus.id,
    navaids_points.navaidoperationalstatus.nilreason,
    coalesce(cast(navaids_points.navaidoperationalstatus_ts.operationalstatus_value as varchar), '(' || navaids_points.navaidoperationalstatus_ts.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(navaids_points.navaidoperationalstatus_ts.signaltype_value as varchar), '(' || navaids_points.navaidoperationalstatus_ts.signaltype_nilreason || ')') as signaltype
from navaids_points.navaidoperationalstatus 
create or replace view procedure.navigationareasector_view as
select
    procedure.navigationareasector.id,
    procedure.navigationareasector.nilreason,
    coalesce(cast(shared_circlesector_pt_aotjuq.title as varchar), '(' || shared_circlesector_pt_aotjuq.nilreason[1] || ')') AS sectordefinition,
    shared_circlesector_pt_aotjuq.href AS sectordefinition_href
from procedure.navigationareasector 
left join shared.circlesector_pt shared_circlesector_pt_aotjuq on procedure.navigationareasector_ts.sectordefinition_id = shared_circlesector_pt_aotjuq.id
create or replace view service.nitrogen_view as
select
    service.nitrogen.id,
    service.nitrogen.nilreason,
    coalesce(cast(service.nitrogen_ts.type_value as varchar), '(' || service.nitrogen_ts.type_nilreason || ')') as type
from service.nitrogen 
create or replace view notes.note_view as
select
    notes.note.id,
    notes.note.nilreason,
    coalesce(cast(notes.note_ts.propertyname_value as varchar), '(' || notes.note_ts.propertyname_nilreason || ')') as propertyname,
    coalesce(cast(notes.note_ts.purpose_value as varchar), '(' || notes.note_ts.purpose_nilreason || ')') as purpose
from notes.note 
create or replace view shared.obstacleassessmentarea_view as
select
    shared.obstacleassessmentarea.id,
    shared.obstacleassessmentarea.nilreason,
    coalesce(cast(shared.obstacleassessmentarea_ts.type_value as varchar), '(' || shared.obstacleassessmentarea_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.obstacleassessmentarea_ts.sectionnumber_value as varchar), '(' || shared.obstacleassessmentarea_ts.sectionnumber_nilreason || ')') as sectionnumber,
    coalesce(cast(shared.obstacleassessmentarea_ts.slope_value as varchar), '(' || shared.obstacleassessmentarea_ts.slope_nilreason || ')') as slope,
    coalesce(cast(shared.obstacleassessmentarea_ts.gradientlowhigh_value as varchar), '(' || shared.obstacleassessmentarea_ts.gradientlowhigh_nilreason || ')') as gradientlowhigh,
    coalesce(cast(shared.obstacleassessmentarea_ts.surfacezone_value as varchar), '(' || shared.obstacleassessmentarea_ts.surfacezone_nilreason || ')') as surfacezone,
    coalesce(cast(shared.obstacleassessmentarea_ts.safetyregulation_value as varchar), '(' || shared.obstacleassessmentarea_ts.safetyregulation_nilreason || ')') as safetyregulation,
    coalesce(cast(shared.obstacleassessmentarea_ts.assessedaltitude_value as varchar) || ' ' || shared.obstacleassessmentarea_ts.assessedaltitude_uom, '(' || shared.obstacleassessmentarea_ts.assessedaltitude_nilreason || ')') as assessedaltitude,
    coalesce(cast(shared.obstacleassessmentarea_ts.slopeloweraltitude_value as varchar) || ' ' || shared.obstacleassessmentarea_ts.slopeloweraltitude_uom, '(' || shared.obstacleassessmentarea_ts.slopeloweraltitude_nilreason || ')') as slopeloweraltitude
from shared.obstacleassessmentarea 
create or replace view shared.obstacleplacement_view as
select
    shared.obstacleplacement.id,
    shared.obstacleplacement.nilreason,
    coalesce(cast(shared.obstacleplacement_ts.obstaclebearing_value as varchar), '(' || shared.obstacleplacement_ts.obstaclebearing_nilreason || ')') as obstaclebearing,
    coalesce(cast(shared.obstacleplacement_ts.pointtype_value as varchar), '(' || shared.obstacleplacement_ts.pointtype_nilreason || ')') as pointtype,
    coalesce(cast(shared.obstacleplacement_ts.obstacleplacement_value as varchar), '(' || shared.obstacleplacement_ts.obstacleplacement_nilreason || ')') as obstacleplacement,
    coalesce(cast(shared.obstacleplacement_ts.obstacledistance_value as varchar) || ' ' || shared.obstacleplacement_ts.obstacledistance_uom, '(' || shared.obstacleplacement_ts.obstacledistance_nilreason || ')') as obstacledistance
from shared.obstacleplacement 
create or replace view shared.obstruction_view as
select
    shared.obstruction.id,
    shared.obstruction.nilreason,
    coalesce(cast(shared.obstruction_ts.surfacepenetration_value as varchar), '(' || shared.obstruction_ts.surfacepenetration_nilreason || ')') as surfacepenetration,
    coalesce(cast(shared.obstruction_ts.slopepenetration_value as varchar), '(' || shared.obstruction_ts.slopepenetration_nilreason || ')') as slopepenetration,
    coalesce(cast(shared.obstruction_ts.controlling_value as varchar), '(' || shared.obstruction_ts.controlling_nilreason || ')') as controlling,
    coalesce(cast(shared.obstruction_ts.closein_value as varchar), '(' || shared.obstruction_ts.closein_nilreason || ')') as closein,
    coalesce(cast(shared.obstruction_ts.requiredclearance_value as varchar) || ' ' || shared.obstruction_ts.requiredclearance_uom, '(' || shared.obstruction_ts.requiredclearance_nilreason || ')') as requiredclearance,
    coalesce(cast(shared.obstruction_ts.minimumaltitude_value as varchar) || ' ' || shared.obstruction_ts.minimumaltitude_uom, '(' || shared.obstruction_ts.minimumaltitude_nilreason || ')') as minimumaltitude
from shared.obstruction 
create or replace view service.oil_view as
select
    service.oil.id,
    service.oil.nilreason,
    coalesce(cast(service.oil_ts.category_value as varchar), '(' || service.oil_ts.category_nilreason || ')') as category
from service.oil 
create or replace view shared.onlinecontact_view as
select
    shared.onlinecontact.id,
    shared.onlinecontact.nilreason,
    coalesce(cast(shared.onlinecontact_ts.network_value as varchar), '(' || shared.onlinecontact_ts.network_nilreason || ')') as network,
    coalesce(cast(shared.onlinecontact_ts.linkage_value as varchar), '(' || shared.onlinecontact_ts.linkage_nilreason || ')') as linkage,
    coalesce(cast(shared.onlinecontact_ts.protocol_value as varchar), '(' || shared.onlinecontact_ts.protocol_nilreason || ')') as protocol,
    coalesce(cast(shared.onlinecontact_ts.email_value as varchar), '(' || shared.onlinecontact_ts.email_nilreason || ')') as email
from shared.onlinecontact 
create or replace view organisation.organisationauthorityassociation_view as
select
    organisation.organisationauthorityassociation.id,
    organisation.organisationauthorityassociation.nilreason,
    coalesce(cast(organisation.organisationauthorityassociation_ts.type_value as varchar), '(' || organisation.organisationauthorityassociation_ts.type_nilreason || ')') as type
from organisation.organisationauthorityassociation 
create or replace view service.oxygen_view as
select
    service.oxygen.id,
    service.oxygen.nilreason,
    coalesce(cast(service.oxygen_ts.type_value as varchar), '(' || service.oxygen_ts.type_nilreason || ')') as type
from service.oxygen 
create or replace view navaids_points.pointreference_view as
select
    navaids_points.pointreference.id,
    navaids_points.pointreference.nilreason,
    coalesce(cast(navaids_points.pointreference_ts.role_value as varchar), '(' || navaids_points.pointreference_ts.role_nilreason || ')') as role,
    coalesce(cast(navaids_points.pointreference_ts.priorfixtolerance_value as varchar) || ' ' || navaids_points.pointreference_ts.priorfixtolerance_uom, '(' || navaids_points.pointreference_ts.priorfixtolerance_nilreason || ')') as priorfixtolerance,
    coalesce(cast(navaids_points.pointreference_ts.postfixtolerance_value as varchar) || ' ' || navaids_points.pointreference_ts.postfixtolerance_uom, '(' || navaids_points.pointreference_ts.postfixtolerance_nilreason || ')') as postfixtolerance
from navaids_points.pointreference 
create or replace view shared.postaladdress_view as
select
    shared.postaladdress.id,
    shared.postaladdress.nilreason,
    coalesce(cast(shared.postaladdress_ts.deliverypoint_value as varchar), '(' || shared.postaladdress_ts.deliverypoint_nilreason || ')') as deliverypoint,
    coalesce(cast(shared.postaladdress_ts.city_value as varchar), '(' || shared.postaladdress_ts.city_nilreason || ')') as city,
    coalesce(cast(shared.postaladdress_ts.administrativearea_value as varchar), '(' || shared.postaladdress_ts.administrativearea_nilreason || ')') as administrativearea,
    coalesce(cast(shared.postaladdress_ts.postalcode_value as varchar), '(' || shared.postaladdress_ts.postalcode_nilreason || ')') as postalcode,
    coalesce(cast(shared.postaladdress_ts.country_value as varchar), '(' || shared.postaladdress_ts.country_nilreason || ')') as country
from shared.postaladdress 
create or replace view procedure.procedureavailability_view as
select
    procedure.procedureavailability.id,
    procedure.procedureavailability.nilreason,
    coalesce(cast(procedure.procedureavailability_ts.status_value as varchar), '(' || procedure.procedureavailability_ts.status_nilreason || ')') as status
from procedure.procedureavailability 
create or replace view procedure.proceduretransitionleg_view as
select
    procedure.proceduretransitionleg.id,
    procedure.proceduretransitionleg.nilreason,
    coalesce(cast(procedure.proceduretransitionleg_ts.seqnumberarinc_value as varchar), '(' || procedure.proceduretransitionleg_ts.seqnumberarinc_nilreason || ')') as seqnumberarinc
from procedure.proceduretransitionleg 
create or replace view procedure.proceduretransition_view as
select
    procedure.proceduretransition.id,
    procedure.proceduretransition.nilreason,
    coalesce(cast(procedure.proceduretransition_ts.transitionid_value as varchar), '(' || procedure.proceduretransition_ts.transitionid_nilreason || ')') as transitionid,
    coalesce(cast(procedure.proceduretransition_ts.type_value as varchar), '(' || procedure.proceduretransition_ts.type_nilreason || ')') as type,
    coalesce(cast(procedure.proceduretransition_ts.instruction_value as varchar), '(' || procedure.proceduretransition_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.proceduretransition_ts.vectorheading_value as varchar), '(' || procedure.proceduretransition_ts.vectorheading_nilreason || ')') as vectorheading,
    coalesce(cast(procedure_landingtakeoffareacollection_pt_cozcvz.title as varchar), '(' || procedure_landingtakeoffareacollection_pt_cozcvz.nilreason[1] || ')') AS departurerunwaytransition,
    procedure_landingtakeoffareacollection_pt_cozcvz.href AS departurerunwaytransition_href
from procedure.proceduretransition 
left join procedure.landingtakeoffareacollection_pt procedure_landingtakeoffareacollection_pt_cozcvz on procedure.proceduretransition_ts.departurerunwaytransition_id = procedure_landingtakeoffareacollection_pt_cozcvz.id
create or replace view shared.propertieswithschedule_view as
select
    shared.propertieswithschedule.id,
    shared.propertieswithschedule.nilreason
from shared.propertieswithschedule 
create or replace view surveillance.radarcomponent_view as
select
    surveillance.radarcomponent.id,
    surveillance.radarcomponent.nilreason,
    coalesce(cast(surveillance.radarcomponent_ts.collocationgroup_value as varchar), '(' || surveillance.radarcomponent_ts.collocationgroup_nilreason || ')') as collocationgroup
from surveillance.radarcomponent 
create or replace view service.radiocommunicationoperationalstatus_view as
select
    service.radiocommunicationoperationalstatus.id,
    service.radiocommunicationoperationalstatus.nilreason,
    coalesce(cast(service.radiocommunicationoperationalstatus_ts.operationalstatus_value as varchar), '(' || service.radiocommunicationoperationalstatus_ts.operationalstatus_nilreason || ')') as operationalstatus
from service.radiocommunicationoperationalstatus 
create or replace view surveillance.reflector_view as
select
    surveillance.reflector.id,
    surveillance.reflector.nilreason,
    coalesce(cast(surveillance.reflector_ts.type_value as varchar), '(' || surveillance.reflector_ts.type_nilreason || ')') as type
from surveillance.reflector 
create or replace view airport_heliport.ridge_view as
select
    airport_heliport.ridge.id,
    airport_heliport.ridge.nilreason,
    coalesce(cast(airport_heliport.ridge_ts.side_value as varchar), '(' || airport_heliport.ridge_ts.side_nilreason || ')') as side,
    coalesce(cast(airport_heliport.ridge_ts.distance_value as varchar) || ' ' || airport_heliport.ridge_ts.distance_uom, '(' || airport_heliport.ridge_ts.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.ridge_ts.depth_value as varchar) || ' ' || airport_heliport.ridge_ts.depth_uom, '(' || airport_heliport.ridge_ts.depth_nilreason || ')') as depth
from airport_heliport.ridge 
create or replace view routes.routeavailability_view as
select
    routes.routeavailability.id,
    routes.routeavailability.nilreason,
    coalesce(cast(routes.routeavailability_ts.direction_value as varchar), '(' || routes.routeavailability_ts.direction_nilreason || ')') as direction,
    coalesce(cast(routes.routeavailability_ts.cardinaldirection_value as varchar), '(' || routes.routeavailability_ts.cardinaldirection_nilreason || ')') as cardinaldirection,
    coalesce(cast(routes.routeavailability_ts.status_value as varchar), '(' || routes.routeavailability_ts.status_nilreason || ')') as status
from routes.routeavailability 
create or replace view routes.routeportion_view as
select
    routes.routeportion.id,
    routes.routeportion.nilreason
from routes.routeportion 
create or replace view airport_heliport.runwaycontamination_view as
select
    airport_heliport.runwaycontamination.id,
    airport_heliport.runwaycontamination.nilreason,
    coalesce(cast(airport_heliport.runwaycontamination_ts.observationTime_value as varchar), '(' || airport_heliport.runwaycontamination_ts.observationTime_nilreason || ')') as observationTime,
    coalesce(cast(airport_heliport.runwaycontamination_ts.nextObservationTime_value as varchar), '(' || airport_heliport.runwaycontamination_ts.nextObservationTime_nilreason || ')') as nextObservationTime,
    coalesce(cast(airport_heliport.runwaycontamination_ts.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaycontamination_ts.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.runwaycontamination_ts.frictionestimation_value as varchar), '(' || airport_heliport.runwaycontamination_ts.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.runwaycontamination_ts.frictiondevice_value as varchar), '(' || airport_heliport.runwaycontamination_ts.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.runwaycontamination_ts.obscuredlights_value as varchar), '(' || airport_heliport.runwaycontamination_ts.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.runwaycontamination_ts.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaycontamination_ts.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.runwaycontamination_ts.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaycontamination_ts.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.runwaycontamination_ts.proportion_value as varchar), '(' || airport_heliport.runwaycontamination_ts.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.runwaycontamination_ts.clearedside_value as varchar), '(' || airport_heliport.runwaycontamination_ts.clearedside_nilreason || ')') as clearedside,
    coalesce(cast(airport_heliport.runwaycontamination_ts.obscuredlightsside_value as varchar), '(' || airport_heliport.runwaycontamination_ts.obscuredlightsside_nilreason || ')') as obscuredlightsside,
    coalesce(cast(airport_heliport.runwaycontamination_ts.taxiwayavailable_value as varchar), '(' || airport_heliport.runwaycontamination_ts.taxiwayavailable_nilreason || ')') as taxiwayavailable,
    coalesce(cast(airport_heliport.runwaycontamination_ts.apronavailable_value as varchar), '(' || airport_heliport.runwaycontamination_ts.apronavailable_nilreason || ')') as apronavailable,
    coalesce(cast(airport_heliport.runwaycontamination_ts.depth_value as varchar) || ' ' || airport_heliport.runwaycontamination_ts.depth_uom, '(' || airport_heliport.runwaycontamination_ts.depth_nilreason || ')') as depth,
    coalesce(cast(airport_heliport.runwaycontamination_ts.clearedlength_value as varchar) || ' ' || airport_heliport.runwaycontamination_ts.clearedlength_uom, '(' || airport_heliport.runwaycontamination_ts.clearedlength_nilreason || ')') as clearedlength,
    coalesce(cast(airport_heliport.runwaycontamination_ts.clearedwidth_value as varchar) || ' ' || airport_heliport.runwaycontamination_ts.clearedwidth_uom, '(' || airport_heliport.runwaycontamination_ts.clearedwidth_nilreason || ')') as clearedwidth,
    coalesce(cast(airport_heliport.runwaycontamination_ts.furtherclearancelength_value as varchar) || ' ' || airport_heliport.runwaycontamination_ts.furtherclearancelength_uom, '(' || airport_heliport.runwaycontamination_ts.furtherclearancelength_nilreason || ')') as furtherclearancelength,
    coalesce(cast(airport_heliport.runwaycontamination_ts.furtherclearancewidth_value as varchar) || ' ' || airport_heliport.runwaycontamination_ts.furtherclearancewidth_uom, '(' || airport_heliport.runwaycontamination_ts.furtherclearancewidth_nilreason || ')') as furtherclearancewidth,
    coalesce(cast(airport_heliport.runwaycontamination_ts.clearedlengthbegin_value as varchar) || ' ' || airport_heliport.runwaycontamination_ts.clearedlengthbegin_uom, '(' || airport_heliport.runwaycontamination_ts.clearedlengthbegin_nilreason || ')') as clearedlengthbegin
from airport_heliport.runwaycontamination 
create or replace view airport_heliport.runwaydeclareddistance_view as
select
    airport_heliport.runwaydeclareddistance.id,
    airport_heliport.runwaydeclareddistance.nilreason,
    coalesce(cast(airport_heliport.runwaydeclareddistance_ts.type_value as varchar), '(' || airport_heliport.runwaydeclareddistance_ts.type_nilreason || ')') as type
from airport_heliport.runwaydeclareddistance 
create or replace view airport_heliport.runwaydeclareddistancevalue_view as
select
    airport_heliport.runwaydeclareddistancevalue.id,
    airport_heliport.runwaydeclareddistancevalue.nilreason,
    coalesce(cast(airport_heliport.runwaydeclareddistancevalue_ts.distance_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue_ts.distance_uom, '(' || airport_heliport.runwaydeclareddistancevalue_ts.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.runwaydeclareddistancevalue_ts.distanceaccuracy_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue_ts.distanceaccuracy_uom, '(' || airport_heliport.runwaydeclareddistancevalue_ts.distanceaccuracy_nilreason || ')') as distanceaccuracy
from airport_heliport.runwaydeclareddistancevalue 
create or replace view airport_heliport.runwaysectioncontamination_view as
select
    airport_heliport.runwaysectioncontamination.id,
    airport_heliport.runwaysectioncontamination.nilreason,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.observationTime_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.observationTime_nilreason || ')') as observationTime,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.nextObservationTime_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.nextObservationTime_nilreason || ')') as nextObservationTime,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.frictionestimation_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.frictiondevice_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.obscuredlights_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.proportion_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.section_value as varchar), '(' || airport_heliport.runwaysectioncontamination_ts.section_nilreason || ')') as section,
    coalesce(cast(airport_heliport.runwaysectioncontamination_ts.depth_value as varchar) || ' ' || airport_heliport.runwaysectioncontamination_ts.depth_uom, '(' || airport_heliport.runwaysectioncontamination_ts.depth_nilreason || ')') as depth
from airport_heliport.runwaysectioncontamination 
create or replace view procedure.safealtitudeareasector_view as
select
    procedure.safealtitudeareasector.id,
    procedure.safealtitudeareasector.nilreason,
    coalesce(cast(procedure.safealtitudeareasector_ts.bufferwidth_value as varchar) || ' ' || procedure.safealtitudeareasector_ts.bufferwidth_uom, '(' || procedure.safealtitudeareasector_ts.bufferwidth_nilreason || ')') as bufferwidth,
    coalesce(cast(shared_circlesector_pt_xblotq.title as varchar), '(' || shared_circlesector_pt_xblotq.nilreason[1] || ')') AS sectordefinition,
    shared_circlesector_pt_xblotq.href AS sectordefinition_href
from procedure.safealtitudeareasector 
left join shared.circlesector_pt shared_circlesector_pt_xblotq on procedure.safealtitudeareasector_ts.sectordefinition_id = shared_circlesector_pt_xblotq.id
create or replace view procedure.sectordesign_view as
select
    procedure.sectordesign.id,
    procedure.sectordesign.nilreason,
    coalesce(cast(procedure.sectordesign_ts.turndirection_value as varchar), '(' || procedure.sectordesign_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.sectordesign_ts.designgradient_value as varchar), '(' || procedure.sectordesign_ts.designgradient_nilreason || ')') as designgradient,
    coalesce(cast(procedure.sectordesign_ts.turnpermitted_value as varchar), '(' || procedure.sectordesign_ts.turnpermitted_nilreason || ')') as turnpermitted,
    coalesce(cast(procedure.sectordesign_ts.terminationaltitude_value as varchar) || ' ' || procedure.sectordesign_ts.terminationaltitude_uom, '(' || procedure.sectordesign_ts.terminationaltitude_nilreason || ')') as terminationaltitude
from procedure.sectordesign 
create or replace view navaids_points.segmentpoint_view as
select
    navaids_points.segmentpoint.id,
    navaids_points.segmentpoint.nilreason
from navaids_points.segmentpoint 
create or replace view service.serviceoperationalstatus_view as
select
    service.serviceoperationalstatus.id,
    service.serviceoperationalstatus.nilreason,
    coalesce(cast(service.serviceoperationalstatus_ts.operationalstatus_value as varchar), '(' || service.serviceoperationalstatus_ts.operationalstatus_nilreason || ')') as operationalstatus
from service.serviceoperationalstatus 
create or replace view navaids_points.specialnavigationstationstatus_view as
select
    navaids_points.specialnavigationstationstatus.id,
    navaids_points.specialnavigationstationstatus.nilreason,
    coalesce(cast(navaids_points.specialnavigationstationstatus_ts.operationalstatus_value as varchar), '(' || navaids_points.specialnavigationstationstatus_ts.operationalstatus_nilreason || ')') as operationalstatus
from navaids_points.specialnavigationstationstatus 
create or replace view shared.standardlevel_view as
select
    shared.standardlevel.id,
    shared.standardlevel.nilreason,
    coalesce(cast(shared.standardlevel_ts.verticaldistance_value as varchar) || ' ' || shared.standardlevel_ts.verticaldistance_uom, '(' || shared.standardlevel_ts.verticaldistance_nilreason || ')') as verticaldistance
from shared.standardlevel 
create or replace view airport_heliport.surfacecharacteristics_view as
select
    airport_heliport.surfacecharacteristics.id,
    airport_heliport.surfacecharacteristics.nilreason,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.composition_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.composition_nilreason || ')') as composition,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.preparation_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.preparation_nilreason || ')') as preparation,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.surfacecondition_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.surfacecondition_nilreason || ')') as surfacecondition,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.classpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.classpcn_nilreason || ')') as classpcn,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.pavementtypepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.pavementtypepcn_nilreason || ')') as pavementtypepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.pavementsubgradepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.pavementsubgradepcn_nilreason || ')') as pavementsubgradepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.maxtyrepressurepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.maxtyrepressurepcn_nilreason || ')') as maxtyrepressurepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.evaluationmethodpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.evaluationmethodpcn_nilreason || ')') as evaluationmethodpcn,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.classlcn_value as varchar), '(' || airport_heliport.surfacecharacteristics_ts.classlcn_nilreason || ')') as classlcn,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.weightsiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics_ts.weightsiwl_uom, '(' || airport_heliport.surfacecharacteristics_ts.weightsiwl_nilreason || ')') as weightsiwl,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.tyrepressuresiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics_ts.tyrepressuresiwl_uom, '(' || airport_heliport.surfacecharacteristics_ts.tyrepressuresiwl_nilreason || ')') as tyrepressuresiwl,
    coalesce(cast(airport_heliport.surfacecharacteristics_ts.weightauw_value as varchar) || ' ' || airport_heliport.surfacecharacteristics_ts.weightauw_uom, '(' || airport_heliport.surfacecharacteristics_ts.weightauw_nilreason || ')') as weightauw
from airport_heliport.surfacecharacteristics 
create or replace view airport_heliport.surfacecontaminationlayer_view as
select
    airport_heliport.surfacecontaminationlayer.id,
    airport_heliport.surfacecontaminationlayer.nilreason,
    coalesce(cast(airport_heliport.surfacecontaminationlayer_ts.layerorder_value as varchar), '(' || airport_heliport.surfacecontaminationlayer_ts.layerorder_nilreason || ')') as layerorder,
    coalesce(cast(airport_heliport.surfacecontaminationlayer_ts.type_value as varchar), '(' || airport_heliport.surfacecontaminationlayer_ts.type_nilreason || ')') as type
from airport_heliport.surfacecontaminationlayer 
create or replace view airport_heliport.surfacecontamination_view as
select
    airport_heliport.surfacecontamination.id,
    airport_heliport.surfacecontamination.nilreason
from airport_heliport.surfacecontamination 
create or replace view surveillance.surveillancegroundstation_view as
select
    surveillance.surveillancegroundstation.id,
    surveillance.surveillancegroundstation.nilreason,
    coalesce(cast(surveillance.surveillancegroundstation_ts.videomap_value as varchar), '(' || surveillance.surveillancegroundstation_ts.videomap_nilreason || ')') as videomap
from surveillance.surveillancegroundstation 
create or replace view airport_heliport.taxiwaycontamination_view as
select
    airport_heliport.taxiwaycontamination.id,
    airport_heliport.taxiwaycontamination.nilreason,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.observationTime_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.observationTime_nilreason || ')') as observationTime,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.nextObservationTime_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.nextObservationTime_nilreason || ')') as nextObservationTime,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.frictioncoefficient_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.frictionestimation_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.frictiondevice_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.obscuredlights_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.furtherclearancetime_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.furthertotalclearance_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.proportion_value as varchar), '(' || airport_heliport.taxiwaycontamination_ts.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.depth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination_ts.depth_uom, '(' || airport_heliport.taxiwaycontamination_ts.depth_nilreason || ')') as depth,
    coalesce(cast(airport_heliport.taxiwaycontamination_ts.clearedwidth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination_ts.clearedwidth_uom, '(' || airport_heliport.taxiwaycontamination_ts.clearedwidth_nilreason || ')') as clearedwidth
from airport_heliport.taxiwaycontamination 
create or replace view shared.telephonecontact_view as
select
    shared.telephonecontact.id,
    shared.telephonecontact.nilreason,
    coalesce(cast(shared.telephonecontact_ts.voice_value as varchar), '(' || shared.telephonecontact_ts.voice_nilreason || ')') as voice,
    coalesce(cast(shared.telephonecontact_ts.facsimile_value as varchar), '(' || shared.telephonecontact_ts.facsimile_nilreason || ')') as facsimile
from shared.telephonecontact 
create or replace view procedure.terminalarrivalareasector_view as
select
    procedure.terminalarrivalareasector.id,
    procedure.terminalarrivalareasector.nilreason,
    coalesce(cast(procedure.terminalarrivalareasector_ts.flybycode_value as varchar), '(' || procedure.terminalarrivalareasector_ts.flybycode_nilreason || ')') as flybycode,
    coalesce(cast(procedure.terminalarrivalareasector_ts.procedureturnrequired_value as varchar), '(' || procedure.terminalarrivalareasector_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.terminalarrivalareasector_ts.altitudedescription_value as varchar), '(' || procedure.terminalarrivalareasector_ts.altitudedescription_nilreason || ')') as altitudedescription,
    coalesce(cast(shared_circlesector_pt_wicawq.title as varchar), '(' || shared_circlesector_pt_wicawq.nilreason[1] || ')') AS sectordefinition,
    shared_circlesector_pt_wicawq.href AS sectordefinition_href
from procedure.terminalarrivalareasector 
left join shared.circlesector_pt shared_circlesector_pt_wicawq on procedure.terminalarrivalareasector_ts.sectordefinition_id = shared_circlesector_pt_wicawq.id
create or replace view navaids_points.terminalsegmentpoint_view as
select
    navaids_points.terminalsegmentpoint.id,
    navaids_points.terminalsegmentpoint.nilreason,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.reportingatc_value as varchar), '(' || navaids_points.terminalsegmentpoint_ts.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.flyover_value as varchar), '(' || navaids_points.terminalsegmentpoint_ts.flyover_nilreason || ')') as flyover,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.waypoint_value as varchar), '(' || navaids_points.terminalsegmentpoint_ts.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.radarguidance_value as varchar), '(' || navaids_points.terminalsegmentpoint_ts.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.role_value as varchar), '(' || navaids_points.terminalsegmentpoint_ts.role_nilreason || ')') as role,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.leadradial_value as varchar), '(' || navaids_points.terminalsegmentpoint_ts.leadradial_nilreason || ')') as leadradial,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.indicatorfacf_value as varchar), '(' || navaids_points.terminalsegmentpoint_ts.indicatorfacf_nilreason || ')') as indicatorfacf,
    coalesce(cast(navaids_points.terminalsegmentpoint_ts.leaddme_value as varchar) || ' ' || navaids_points.terminalsegmentpoint_ts.leaddme_uom, '(' || navaids_points.terminalsegmentpoint_ts.leaddme_nilreason || ')') as leaddme
from navaids_points.terminalsegmentpoint 
create or replace view shared.timesheet_view as
select
    shared.timesheet.id,
    shared.timesheet.nilreason,
    coalesce(cast(shared.timesheet_ts.timereference_value as varchar), '(' || shared.timesheet_ts.timereference_nilreason || ')') as timereference,
    coalesce(cast(shared.timesheet_ts.startdate_value as varchar), '(' || shared.timesheet_ts.startdate_nilreason || ')') as startdate,
    coalesce(cast(shared.timesheet_ts.enddate_value as varchar), '(' || shared.timesheet_ts.enddate_nilreason || ')') as enddate,
    coalesce(cast(shared.timesheet_ts.day_value as varchar), '(' || shared.timesheet_ts.day_nilreason || ')') as day,
    coalesce(cast(shared.timesheet_ts.daytil_value as varchar), '(' || shared.timesheet_ts.daytil_nilreason || ')') as daytil,
    coalesce(cast(shared.timesheet_ts.starttime_value as varchar), '(' || shared.timesheet_ts.starttime_nilreason || ')') as starttime,
    coalesce(cast(shared.timesheet_ts.startevent_value as varchar), '(' || shared.timesheet_ts.startevent_nilreason || ')') as startevent,
    coalesce(cast(shared.timesheet_ts.starteventinterpretation_value as varchar), '(' || shared.timesheet_ts.starteventinterpretation_nilreason || ')') as starteventinterpretation,
    coalesce(cast(shared.timesheet_ts.endtime_value as varchar), '(' || shared.timesheet_ts.endtime_nilreason || ')') as endtime,
    coalesce(cast(shared.timesheet_ts.endevent_value as varchar), '(' || shared.timesheet_ts.endevent_nilreason || ')') as endevent,
    coalesce(cast(shared.timesheet_ts.endeventinterpretation_value as varchar), '(' || shared.timesheet_ts.endeventinterpretation_nilreason || ')') as endeventinterpretation,
    coalesce(cast(shared.timesheet_ts.daylightsavingadjust_value as varchar), '(' || shared.timesheet_ts.daylightsavingadjust_nilreason || ')') as daylightsavingadjust,
    coalesce(cast(shared.timesheet_ts.excluded_value as varchar), '(' || shared.timesheet_ts.excluded_nilreason || ')') as excluded,
    coalesce(cast(shared.timesheet_ts.starttimerelativeevent_value as varchar) || ' ' || shared.timesheet_ts.starttimerelativeevent_uom, '(' || shared.timesheet_ts.starttimerelativeevent_nilreason || ')') as starttimerelativeevent,
    coalesce(cast(shared.timesheet_ts.endtimerelativeevent_value as varchar) || ' ' || shared.timesheet_ts.endtimerelativeevent_uom, '(' || shared.timesheet_ts.endtimerelativeevent_nilreason || ')') as endtimerelativeevent
from shared.timesheet 
create or replace view airport_heliport.touchdownliftoffcontamination_view as
select
    airport_heliport.touchdownliftoffcontamination.id,
    airport_heliport.touchdownliftoffcontamination.nilreason,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.observationTime_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.observationTime_nilreason || ')') as observationTime,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.nextObservationTime_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.nextObservationTime_nilreason || ')') as nextObservationTime,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.frictioncoefficient_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.frictionestimation_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.frictiondevice_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.obscuredlights_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.furtherclearancetime_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.furthertotalclearance_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.proportion_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination_ts.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination_ts.depth_value as varchar) || ' ' || airport_heliport.touchdownliftoffcontamination_ts.depth_uom, '(' || airport_heliport.touchdownliftoffcontamination_ts.depth_nilreason || ')') as depth
from airport_heliport.touchdownliftoffcontamination 
create or replace view organisation.unitavailability_view as
select
    organisation.unitavailability.id,
    organisation.unitavailability.nilreason,
    coalesce(cast(organisation.unitavailability_ts.operationalstatus_value as varchar), '(' || organisation.unitavailability_ts.operationalstatus_nilreason || ')') as operationalstatus
from organisation.unitavailability 
create or replace view organisation.unitdependency_view as
select
    organisation.unitdependency.id,
    organisation.unitdependency.nilreason,
    coalesce(cast(organisation.unitdependency_ts.type_value as varchar), '(' || organisation.unitdependency_ts.type_nilreason || ')') as type
from organisation.unitdependency 
create or replace view airport_heliport.usagecondition_view as
select
    airport_heliport.usagecondition.id,
    airport_heliport.usagecondition.nilreason
from airport_heliport.usagecondition 
create or replace view obstacles.verticalstructurelightingstatus_view as
select
    obstacles.verticalstructurelightingstatus.id,
    obstacles.verticalstructurelightingstatus.nilreason,
    coalesce(cast(obstacles.verticalstructurelightingstatus_ts.status_value as varchar), '(' || obstacles.verticalstructurelightingstatus_ts.status_nilreason || ')') as status
from obstacles.verticalstructurelightingstatus 
create or replace view obstacles.verticalstructurepart_view as
select
    obstacles.verticalstructurepart.id,
    obstacles.verticalstructurepart.nilreason,
    coalesce(cast(obstacles.verticalstructurepart_ts.type_value as varchar), '(' || obstacles.verticalstructurepart_ts.type_nilreason || ')') as type,
    coalesce(cast(obstacles.verticalstructurepart_ts.constructionstatus_value as varchar), '(' || obstacles.verticalstructurepart_ts.constructionstatus_nilreason || ')') as constructionstatus,
    coalesce(cast(obstacles.verticalstructurepart_ts.markingpattern_value as varchar), '(' || obstacles.verticalstructurepart_ts.markingpattern_nilreason || ')') as markingpattern,
    coalesce(cast(obstacles.verticalstructurepart_ts.markingfirstcolour_value as varchar), '(' || obstacles.verticalstructurepart_ts.markingfirstcolour_nilreason || ')') as markingfirstcolour,
    coalesce(cast(obstacles.verticalstructurepart_ts.markingsecondcolour_value as varchar), '(' || obstacles.verticalstructurepart_ts.markingsecondcolour_nilreason || ')') as markingsecondcolour,
    coalesce(cast(obstacles.verticalstructurepart_ts.mobile_value as varchar), '(' || obstacles.verticalstructurepart_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(obstacles.verticalstructurepart_ts.frangible_value as varchar), '(' || obstacles.verticalstructurepart_ts.frangible_nilreason || ')') as frangible,
    coalesce(cast(obstacles.verticalstructurepart_ts.visiblematerial_value as varchar), '(' || obstacles.verticalstructurepart_ts.visiblematerial_nilreason || ')') as visiblematerial,
    coalesce(cast(obstacles.verticalstructurepart_ts.designator_value as varchar), '(' || obstacles.verticalstructurepart_ts.designator_nilreason || ')') as designator,
    coalesce(cast(obstacles.verticalstructurepart_ts.verticalextent_value as varchar) || ' ' || obstacles.verticalstructurepart_ts.verticalextent_uom, '(' || obstacles.verticalstructurepart_ts.verticalextent_nilreason || ')') as verticalextent,
    coalesce(cast(obstacles.verticalstructurepart_ts.verticalextentaccuracy_value as varchar) || ' ' || obstacles.verticalstructurepart_ts.verticalextentaccuracy_uom, '(' || obstacles.verticalstructurepart_ts.verticalextentaccuracy_nilreason || ')') as verticalextentaccuracy
from obstacles.verticalstructurepart 
create or replace view airport_heliport.workareaactivity_view as
select
    airport_heliport.workareaactivity.id,
    airport_heliport.workareaactivity.nilreason,
    coalesce(cast(airport_heliport.workareaactivity_ts.isactive_value as varchar), '(' || airport_heliport.workareaactivity_ts.isactive_nilreason || ')') as isactive
from airport_heliport.workareaactivity 