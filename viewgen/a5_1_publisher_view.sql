-- LinguisticNotePropertyType
-- []
-- Snowflake SQL : LinguisticNotePropertyType 

CREATE INDEX ON notes.linguisticnote_pt (linguisticnote_id);
CREATE INDEX ON notes.linguisticnote (id);

DROP MATERIALIZED VIEW IF EXISTS notes.linguisticnote_view CASCADE;

CREATE MATERIALIZED VIEW notes.linguisticnote_view AS
SELECT 
    notes.linguisticnote_pt.id,
    notes.linguisticnote.note_lang AS lang,
    COALESCE(notes.linguisticnote.note_value, '('|| notes.linguisticnote.note_nilreason ||')') AS note
FROM notes.linguisticnote_pt
INNER JOIN notes.linguisticnote ON notes.linguisticnote_pt.linguisticnote_id = notes.linguisticnote.id;

CREATE INDEX ON notes.linguisticnote_view (id);
-- NotePropertyType
-- ['notes.linguisticnote_view']
-- Snowflake SQL : NotePropertyType 

CREATE INDEX ON notes.note_pt (note_id);
CREATE INDEX ON notes.note (id);

DROP MATERIALIZED VIEW IF EXISTS notes.note_view CASCADE;

CREATE MATERIALIZED VIEW notes.note_view AS
SELECT
    notes.note_pt.id,
    jsonb_build_object(
        'propertyName', COALESCE(notes.note.propertyname_value, '(' || notes.note.propertyname_nilreason || ')'),
        'purpose', COALESCE(notes.note.purpose_value, '(' || notes.note.purpose_nilreason || ')'),
        'notes', translated_notes.notes_array
    ) AS note
FROM notes.note_pt
INNER JOIN notes.note ON notes.note_pt.note_id = notes.note.id
LEFT JOIN LATERAL (
    SELECT jsonb_agg(
        jsonb_build_object(
            'id', notes.linguisticnote_view.id,
            'lang', notes.linguisticnote_view.lang,
            'note', notes.linguisticnote_view.note
        )
    ) AS notes_array
    FROM master_join
    JOIN notes.linguisticnote_view ON master_join.target_id = notes.linguisticnote_view.id
    WHERE master_join.source_id = notes.note.id
) AS translated_notes ON true;

CREATE INDEX ON notes.note_view (id);
-- AircraftCharacteristicPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.aircraftcharacteristic_view cascade;
create materialized view shared.aircraftcharacteristic_view as
select
    shared.aircraftcharacteristic_pt.id,
    shared.aircraftcharacteristic_pt.nilreason AS aircraftcharacteristic_nilreason,
    coalesce(cast(shared.aircraftcharacteristic.type_value as varchar), '(' || shared.aircraftcharacteristic.type_nilreason || ')') as type,
    coalesce(cast(shared.aircraftcharacteristic.engine_value as varchar), '(' || shared.aircraftcharacteristic.engine_nilreason || ')') as engine,
    coalesce(cast(shared.aircraftcharacteristic.numberengine_value as varchar), '(' || shared.aircraftcharacteristic.numberengine_nilreason || ')') as numberengine,
    coalesce(cast(shared.aircraftcharacteristic.typeaircrafticao_value as varchar), '(' || shared.aircraftcharacteristic.typeaircrafticao_nilreason || ')') as typeaircrafticao,
    coalesce(cast(shared.aircraftcharacteristic.aircraftlandingcategory_value as varchar), '(' || shared.aircraftcharacteristic.aircraftlandingcategory_nilreason || ')') as aircraftlandingcategory,
    coalesce(cast(shared.aircraftcharacteristic.wingspaninterpretation_value as varchar), '(' || shared.aircraftcharacteristic.wingspaninterpretation_nilreason || ')') as wingspaninterpretation,
    coalesce(cast(shared.aircraftcharacteristic.classwingspan_value as varchar), '(' || shared.aircraftcharacteristic.classwingspan_nilreason || ')') as classwingspan,
    coalesce(cast(shared.aircraftcharacteristic.weightinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.weightinterpretation_nilreason || ')') as weightinterpretation,
    coalesce(cast(shared.aircraftcharacteristic.passengers_value as varchar), '(' || shared.aircraftcharacteristic.passengers_nilreason || ')') as passengers,
    coalesce(cast(shared.aircraftcharacteristic.passengersinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.passengersinterpretation_nilreason || ')') as passengersinterpretation,
    coalesce(cast(shared.aircraftcharacteristic.speedinterpretation_value as varchar), '(' || shared.aircraftcharacteristic.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(shared.aircraftcharacteristic.waketurbulence_value as varchar), '(' || shared.aircraftcharacteristic.waketurbulence_nilreason || ')') as waketurbulence,
    coalesce(cast(shared.aircraftcharacteristic.navigationequipment_value as varchar), '(' || shared.aircraftcharacteristic.navigationequipment_nilreason || ')') as navigationequipment,
    coalesce(cast(shared.aircraftcharacteristic.navigationspecification_value as varchar), '(' || shared.aircraftcharacteristic.navigationspecification_nilreason || ')') as navigationspecification,
    coalesce(cast(shared.aircraftcharacteristic.verticalseparationcapability_value as varchar), '(' || shared.aircraftcharacteristic.verticalseparationcapability_nilreason || ')') as verticalseparationcapability,
    coalesce(cast(shared.aircraftcharacteristic.anticollisionandseparationequipment_value as varchar), '(' || shared.aircraftcharacteristic.anticollisionandseparationequipment_nilreason || ')') as anticollisionandseparationequipment,
    coalesce(cast(shared.aircraftcharacteristic.communicationequipment_value as varchar), '(' || shared.aircraftcharacteristic.communicationequipment_nilreason || ')') as communicationequipment,
    coalesce(cast(shared.aircraftcharacteristic.surveillanceequipment_value as varchar), '(' || shared.aircraftcharacteristic.surveillanceequipment_nilreason || ')') as surveillanceequipment,
    coalesce(cast(shared.aircraftcharacteristic.wingspan_value as varchar) || ' ' || shared.aircraftcharacteristic.wingspan_uom, '(' || shared.aircraftcharacteristic.wingspan_nilreason || ')') as wingspan,
    coalesce(cast(shared.aircraftcharacteristic.weight_value as varchar) || ' ' || shared.aircraftcharacteristic.weight_uom, '(' || shared.aircraftcharacteristic.weight_nilreason || ')') as weight,
    coalesce(cast(shared.aircraftcharacteristic.speed_value as varchar) || ' ' || shared.aircraftcharacteristic.speed_uom, '(' || shared.aircraftcharacteristic.speed_nilreason || ')') as speed,
    lat_annotation.annotation as annotation
from shared.aircraftcharacteristic_pt 
inner join shared.aircraftcharacteristic on shared.aircraftcharacteristic_pt.aircraftcharacteristic_id = shared.aircraftcharacteristic.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ahvpgq.*) AS annotation
  from master_join master_join_kkzcsq
  join notes.note_view notes_note_view_ahvpgq on master_join_kkzcsq.target_id = notes_note_view_ahvpgq.id
  where master_join_kkzcsq.source_id = shared.aircraftcharacteristic.id
) as lat_annotation on TRUE;
create index on shared.aircraftcharacteristic_view (id);
-- AircraftStandContaminationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.aircraftstandcontamination_view cascade;
create materialized view airport_heliport.aircraftstandcontamination_view as
select
    airport_heliport.aircraftstandcontamination_pt.id,
    airport_heliport.aircraftstandcontamination_pt.nilreason AS aircraftstandcontamination_nilreason,
    coalesce(cast(airport_heliport.aircraftstandcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.aircraftstandcontamination.frictionestimation_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.aircraftstandcontamination.frictiondevice_value as varchar), '(' || airport_heliport.aircraftstandcontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.aircraftstandcontamination.obscuredlights_value as varchar), '(' || airport_heliport.aircraftstandcontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.aircraftstandcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.aircraftstandcontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.aircraftstandcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.aircraftstandcontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.aircraftstandcontamination.proportion_value as varchar), '(' || airport_heliport.aircraftstandcontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.aircraftstandcontamination.depth_value as varchar) || ' ' || airport_heliport.aircraftstandcontamination.depth_uom, '(' || airport_heliport.aircraftstandcontamination.depth_nilreason || ')') as depth,
    lat_criticalridge.lat_criticalridge as criticalridge,
    lat_layer.lat_layer as layer,
    lat_annotation.annotation as annotation
from airport_heliport.aircraftstandcontamination_pt 
inner join airport_heliport.aircraftstandcontamination on airport_heliport.aircraftstandcontamination_pt.aircraftstandcontamination_id = airport_heliport.aircraftstandcontamination.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_ridge_pt_gggjkk.id) as lat_criticalridge
  from master_join master_join_kdkqeb
  join airport_heliport.ridge_pt airport_heliport_ridge_pt_gggjkk on master_join_kdkqeb.target_id = airport_heliport_ridge_pt_gggjkk.id
  where master_join_kdkqeb.source_id = airport_heliport.aircraftstandcontamination.id
) as lat_criticalridge on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_surfacecontaminationlayer_pt_nfjzmj.id) as lat_layer
  from master_join master_join_biwozr
  join airport_heliport.surfacecontaminationlayer_pt airport_heliport_surfacecontaminationlayer_pt_nfjzmj on master_join_biwozr.target_id = airport_heliport_surfacecontaminationlayer_pt_nfjzmj.id
  where master_join_biwozr.source_id = airport_heliport.aircraftstandcontamination.id
) as lat_layer on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_vdddav.*) AS annotation
  from master_join master_join_nyggsf
  join notes.note_view notes_note_view_vdddav on master_join_nyggsf.target_id = notes_note_view_vdddav.id
  where master_join_nyggsf.source_id = airport_heliport.aircraftstandcontamination.id
) as lat_annotation on TRUE;
create index on airport_heliport.aircraftstandcontamination_view (id);
-- AirportHeliportContaminationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.airportheliportcontamination_view cascade;
create materialized view airport_heliport.airportheliportcontamination_view as
select
    airport_heliport.airportheliportcontamination_pt.id,
    airport_heliport.airportheliportcontamination_pt.nilreason AS airportheliportcontamination_nilreason,
    coalesce(cast(airport_heliport.airportheliportcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.airportheliportcontamination.frictionestimation_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.airportheliportcontamination.frictiondevice_value as varchar), '(' || airport_heliport.airportheliportcontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.airportheliportcontamination.obscuredlights_value as varchar), '(' || airport_heliport.airportheliportcontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.airportheliportcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.airportheliportcontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.airportheliportcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.airportheliportcontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.airportheliportcontamination.proportion_value as varchar), '(' || airport_heliport.airportheliportcontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.airportheliportcontamination.depth_value as varchar) || ' ' || airport_heliport.airportheliportcontamination.depth_uom, '(' || airport_heliport.airportheliportcontamination.depth_nilreason || ')') as depth,
    lat_criticalridge.lat_criticalridge as criticalridge,
    lat_layer.lat_layer as layer,
    lat_annotation.annotation as annotation
from airport_heliport.airportheliportcontamination_pt 
inner join airport_heliport.airportheliportcontamination on airport_heliport.airportheliportcontamination_pt.airportheliportcontamination_id = airport_heliport.airportheliportcontamination.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_ridge_pt_wlbhhz.id) as lat_criticalridge
  from master_join master_join_wawgld
  join airport_heliport.ridge_pt airport_heliport_ridge_pt_wlbhhz on master_join_wawgld.target_id = airport_heliport_ridge_pt_wlbhhz.id
  where master_join_wawgld.source_id = airport_heliport.airportheliportcontamination.id
) as lat_criticalridge on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_surfacecontaminationlayer_pt_mmmudb.id) as lat_layer
  from master_join master_join_xmlbjl
  join airport_heliport.surfacecontaminationlayer_pt airport_heliport_surfacecontaminationlayer_pt_mmmudb on master_join_xmlbjl.target_id = airport_heliport_surfacecontaminationlayer_pt_mmmudb.id
  where master_join_xmlbjl.source_id = airport_heliport.airportheliportcontamination.id
) as lat_layer on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wqbkjf.*) AS annotation
  from master_join master_join_qbnius
  join notes.note_view notes_note_view_wqbkjf on master_join_qbnius.target_id = notes_note_view_wqbkjf.id
  where master_join_qbnius.source_id = airport_heliport.airportheliportcontamination.id
) as lat_annotation on TRUE;
create index on airport_heliport.airportheliportcontamination_view (id);
-- AirspaceGeometryComponentPropertyType
-- ['notes.note_view']
drop materialized view if exists airspace.airspacegeometrycomponent_view cascade;
create materialized view airspace.airspacegeometrycomponent_view as
select
    airspace.airspacegeometrycomponent_pt.id,
    airspace.airspacegeometrycomponent_pt.nilreason AS airspacegeometrycomponent_nilreason,
    coalesce(cast(airspace.airspacegeometrycomponent.operation_value as varchar), '(' || airspace.airspacegeometrycomponent.operation_nilreason || ')') as operation,
    coalesce(cast(airspace.airspacegeometrycomponent.operationsequence_value as varchar), '(' || airspace.airspacegeometrycomponent.operationsequence_nilreason || ')') as operationsequence,
    airspace_airspacevolume_pt_ujbppv.id AS theairspacevolume,
    lat_annotation.annotation as annotation
from airspace.airspacegeometrycomponent_pt 
inner join airspace.airspacegeometrycomponent on airspace.airspacegeometrycomponent_pt.airspacegeometrycomponent_id = airspace.airspacegeometrycomponent.id
left join airspace.airspacevolume_pt airspace_airspacevolume_pt_ujbppv on airspace.airspacegeometrycomponent.theairspacevolume_id = airspace_airspacevolume_pt_ujbppv.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ocmvyk.*) AS annotation
  from master_join master_join_bzaacz
  join notes.note_view notes_note_view_ocmvyk on master_join_bzaacz.target_id = notes_note_view_ocmvyk.id
  where master_join_bzaacz.source_id = airspace.airspacegeometrycomponent.id
) as lat_annotation on TRUE;
create index on airspace.airspacegeometrycomponent_view (id);
-- AirspaceLayerPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.airspacelayer_view cascade;
create materialized view shared.airspacelayer_view as
select
    shared.airspacelayer_pt.id,
    shared.airspacelayer_pt.nilreason AS airspacelayer_nilreason,
    coalesce(cast(shared.airspacelayer.upperlimitreference_value as varchar), '(' || shared.airspacelayer.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.airspacelayer.lowerlimitreference_value as varchar), '(' || shared.airspacelayer.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.airspacelayer.altitudeinterpretation_value as varchar), '(' || shared.airspacelayer.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(shared.airspacelayer.upperlimit_value as varchar) || ' ' || shared.airspacelayer.upperlimit_uom, '(' || shared.airspacelayer.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.airspacelayer.lowerlimit_value as varchar) || ' ' || shared.airspacelayer.lowerlimit_uom, '(' || shared.airspacelayer.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(shared_standardlevelcolumn_pt_ylxwef.title as varchar), '(' || shared_standardlevelcolumn_pt_ylxwef.nilreason[1] || ')') AS discretelevelseries,
    shared_standardlevelcolumn_pt_ylxwef.href AS discretelevelseries_href,
    lat_annotation.annotation as annotation
from shared.airspacelayer_pt 
inner join shared.airspacelayer on shared.airspacelayer_pt.airspacelayer_id = shared.airspacelayer.id
left join shared.standardlevelcolumn_pt shared_standardlevelcolumn_pt_ylxwef on shared.airspacelayer.discretelevelseries_id = shared_standardlevelcolumn_pt_ylxwef.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_iutxvj.*) AS annotation
  from master_join master_join_nelhxq
  join notes.note_view notes_note_view_iutxvj on master_join_nelhxq.target_id = notes_note_view_iutxvj.id
  where master_join_nelhxq.source_id = shared.airspacelayer.id
) as lat_annotation on TRUE;
create index on shared.airspacelayer_view (id);
-- AirspaceVolumeDependencyPropertyType
-- ['notes.note_view']
drop materialized view if exists airspace.airspacevolumedependency_view cascade;
create materialized view airspace.airspacevolumedependency_view as
select
    airspace.airspacevolumedependency_pt.id,
    airspace.airspacevolumedependency_pt.nilreason AS airspacevolumedependency_nilreason,
    coalesce(cast(airspace.airspacevolumedependency.dependency_value as varchar), '(' || airspace.airspacevolumedependency.dependency_nilreason || ')') as dependency,
    coalesce(cast(airspace_airspace_pt_uauuxc.title as varchar), '(' || airspace_airspace_pt_uauuxc.nilreason[1] || ')') AS theairspace,
    airspace_airspace_pt_uauuxc.href AS theairspace_href,
    lat_annotation.annotation as annotation
from airspace.airspacevolumedependency_pt 
inner join airspace.airspacevolumedependency on airspace.airspacevolumedependency_pt.airspacevolumedependency_id = airspace.airspacevolumedependency.id
left join airspace.airspace_pt airspace_airspace_pt_uauuxc on airspace.airspacevolumedependency.theairspace_id = airspace_airspace_pt_uauuxc.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_phsain.*) AS annotation
  from master_join master_join_gejcia
  join notes.note_view notes_note_view_phsain on master_join_gejcia.target_id = notes_note_view_phsain.id
  where master_join_gejcia.source_id = airspace.airspacevolumedependency.id
) as lat_annotation on TRUE;
create index on airspace.airspacevolumedependency_view (id);
-- AltitudeAdjustmentPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.altitudeadjustment_view cascade;
create materialized view shared.altitudeadjustment_view as
select
    shared.altitudeadjustment_pt.id,
    shared.altitudeadjustment_pt.nilreason AS altitudeadjustment_nilreason,
    coalesce(cast(shared.altitudeadjustment.altitudeadjustmenttype_value as varchar), '(' || shared.altitudeadjustment.altitudeadjustmenttype_nilreason || ')') as altitudeadjustmenttype,
    coalesce(cast(shared.altitudeadjustment.primaryalternateminimum_value as varchar), '(' || shared.altitudeadjustment.primaryalternateminimum_nilreason || ')') as primaryalternateminimum,
    coalesce(cast(shared.altitudeadjustment.localremotecode_value as varchar), '(' || shared.altitudeadjustment.localremotecode_nilreason || ')') as localremotecode,
    coalesce(cast(shared.altitudeadjustment.altitudeadjustment_value as varchar) || ' ' || shared.altitudeadjustment.altitudeadjustment_uom, '(' || shared.altitudeadjustment.altitudeadjustment_nilreason || ')') as altitudeadjustment,
    lat_annotation.annotation as annotation
from shared.altitudeadjustment_pt 
inner join shared.altitudeadjustment on shared.altitudeadjustment_pt.altitudeadjustment_id = shared.altitudeadjustment.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xnhxwb.*) AS annotation
  from master_join master_join_cbuoea
  join notes.note_view notes_note_view_xnhxwb on master_join_cbuoea.target_id = notes_note_view_xnhxwb.id
  where master_join_cbuoea.source_id = shared.altitudeadjustment.id
) as lat_annotation on TRUE;
create index on shared.altitudeadjustment_view (id);
-- AngleUsePropertyType
-- ['notes.note_view']
drop materialized view if exists navaids_points.angleuse_view cascade;
create materialized view navaids_points.angleuse_view as
select
    navaids_points.angleuse_pt.id,
    navaids_points.angleuse_pt.nilreason AS angleuse_nilreason,
    coalesce(cast(navaids_points.angleuse.alongcourseguidance_value as varchar), '(' || navaids_points.angleuse.alongcourseguidance_nilreason || ')') as alongcourseguidance,
    coalesce(cast(navaids_points_angleindication_pt_edakgk.title as varchar), '(' || navaids_points_angleindication_pt_edakgk.nilreason[1] || ')') AS theangleindication,
    navaids_points_angleindication_pt_edakgk.href AS theangleindication_href,
    lat_annotation.annotation as annotation
from navaids_points.angleuse_pt 
inner join navaids_points.angleuse on navaids_points.angleuse_pt.angleuse_id = navaids_points.angleuse.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_edakgk on navaids_points.angleuse.theangleindication_id = navaids_points_angleindication_pt_edakgk.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wucsfh.*) AS annotation
  from master_join master_join_ipmcbw
  join notes.note_view notes_note_view_wucsfh on master_join_ipmcbw.target_id = notes_note_view_wucsfh.id
  where master_join_ipmcbw.source_id = navaids_points.angleuse.id
) as lat_annotation on TRUE;
create index on navaids_points.angleuse_view (id);
-- ApproachAltitudeTablePropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.approachaltitudetable_view cascade;
create materialized view procedure.approachaltitudetable_view as
select
    procedure.approachaltitudetable_pt.id,
    procedure.approachaltitudetable_pt.nilreason AS approachaltitudetable_nilreason,
    coalesce(cast(procedure.approachaltitudetable.measurementpoint_value as varchar), '(' || procedure.approachaltitudetable.measurementpoint_nilreason || ')') as measurementpoint,
    coalesce(cast(procedure.approachaltitudetable.altitudereference_value as varchar), '(' || procedure.approachaltitudetable.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(procedure.approachaltitudetable.altitude_value as varchar) || ' ' || procedure.approachaltitudetable.altitude_uom, '(' || procedure.approachaltitudetable.altitude_nilreason || ')') as altitude,
    lat_annotation.annotation as annotation
from procedure.approachaltitudetable_pt 
inner join procedure.approachaltitudetable on procedure.approachaltitudetable_pt.approachaltitudetable_id = procedure.approachaltitudetable.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_nsayja.*) AS annotation
  from master_join master_join_tzayqb
  join notes.note_view notes_note_view_nsayja on master_join_tzayqb.target_id = notes_note_view_nsayja.id
  where master_join_tzayqb.source_id = procedure.approachaltitudetable.id
) as lat_annotation on TRUE;
create index on procedure.approachaltitudetable_view (id);
-- ApproachConditionPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.approachcondition_view cascade;
create materialized view procedure.approachcondition_view as
select
    procedure.approachcondition_pt.id,
    procedure.approachcondition_pt.nilreason AS approachcondition_nilreason,
    coalesce(cast(procedure.approachcondition.finalapproachpath_value as varchar), '(' || procedure.approachcondition.finalapproachpath_nilreason || ')') as finalapproachpath,
    coalesce(cast(procedure.approachcondition.requirednavigationperformance_value as varchar), '(' || procedure.approachcondition.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.approachcondition.climbgradient_value as varchar), '(' || procedure.approachcondition.climbgradient_nilreason || ')') as climbgradient,
    procedure_minima_pt_hfaetk.id AS minimumset,
    coalesce(cast(airport_heliport_altimetersource_pt_kqcunn.title as varchar), '(' || airport_heliport_altimetersource_pt_kqcunn.nilreason[1] || ')') AS altimeter,
    airport_heliport_altimetersource_pt_kqcunn.href AS altimeter_href,
    lat_circlingrestriction.lat_circlingrestriction as circlingrestriction,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_landingarea.lat_landingarea as landingarea,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation
from procedure.approachcondition_pt 
inner join procedure.approachcondition on procedure.approachcondition_pt.approachcondition_id = procedure.approachcondition.id
left join procedure.minima_pt procedure_minima_pt_hfaetk on procedure.approachcondition.minimumset_id = procedure_minima_pt_hfaetk.id
left join airport_heliport.altimetersource_pt airport_heliport_altimetersource_pt_kqcunn on procedure.approachcondition.altimeter_id = airport_heliport_altimetersource_pt_kqcunn.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_circlingrestriction_pt_zmleek.id) as lat_circlingrestriction
  from master_join master_join_wayush
  join procedure.circlingrestriction_pt procedure_circlingrestriction_pt_zmleek on master_join_wayush.target_id = procedure_circlingrestriction_pt_zmleek.id
  where master_join_wayush.source_id = procedure.approachcondition.id
) as lat_circlingrestriction on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_pt_vvqnhx.id) as lat_aircraftcategory
  from master_join master_join_itslak
  join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_vvqnhx on master_join_itslak.target_id = shared_aircraftcharacteristic_pt_vvqnhx.id
  where master_join_itslak.source_id = procedure.approachcondition.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_landingtakeoffareacollection_pt_cqgxgu.id) as lat_landingarea
  from master_join master_join_xbaahy
  join procedure.landingtakeoffareacollection_pt procedure_landingtakeoffareacollection_pt_cqgxgu on master_join_xbaahy.target_id = procedure_landingtakeoffareacollection_pt_cqgxgu.id
  where master_join_xbaahy.source_id = procedure.approachcondition.id
) as lat_landingarea on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_pt_urktcp.id) as lat_designsurface
  from master_join master_join_myzini
  join shared.obstacleassessmentarea_pt shared_obstacleassessmentarea_pt_urktcp on master_join_myzini.target_id = shared_obstacleassessmentarea_pt_urktcp.id
  where master_join_myzini.source_id = procedure.approachcondition.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wweqxn.*) AS annotation
  from master_join master_join_gbrijy
  join notes.note_view notes_note_view_wweqxn on master_join_gbrijy.target_id = notes_note_view_wweqxn.id
  where master_join_gbrijy.source_id = procedure.approachcondition.id
) as lat_annotation on TRUE;
create index on procedure.approachcondition_view (id);
-- ApproachDistanceTablePropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.approachdistancetable_view cascade;
create materialized view procedure.approachdistancetable_view as
select
    procedure.approachdistancetable_pt.id,
    procedure.approachdistancetable_pt.nilreason AS approachdistancetable_nilreason,
    coalesce(cast(procedure.approachdistancetable.startingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable.startingmeasurementpoint_nilreason || ')') as startingmeasurementpoint,
    coalesce(cast(procedure.approachdistancetable.endingmeasurementpoint_value as varchar), '(' || procedure.approachdistancetable.endingmeasurementpoint_nilreason || ')') as endingmeasurementpoint,
    coalesce(cast(procedure.approachdistancetable.valuehat_value as varchar) || ' ' || procedure.approachdistancetable.valuehat_uom, '(' || procedure.approachdistancetable.valuehat_nilreason || ')') as valuehat,
    coalesce(cast(procedure.approachdistancetable.distance_value as varchar) || ' ' || procedure.approachdistancetable.distance_uom, '(' || procedure.approachdistancetable.distance_nilreason || ')') as distance,
    lat_annotation.annotation as annotation
from procedure.approachdistancetable_pt 
inner join procedure.approachdistancetable on procedure.approachdistancetable_pt.approachdistancetable_id = procedure.approachdistancetable.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_zrscdm.*) AS annotation
  from master_join master_join_ethfoi
  join notes.note_view notes_note_view_zrscdm on master_join_ethfoi.target_id = notes_note_view_zrscdm.id
  where master_join_ethfoi.source_id = procedure.approachdistancetable.id
) as lat_annotation on TRUE;
create index on procedure.approachdistancetable_view (id);
-- ApproachTimingTablePropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.approachtimingtable_view cascade;
create materialized view procedure.approachtimingtable_view as
select
    procedure.approachtimingtable_pt.id,
    procedure.approachtimingtable_pt.nilreason AS approachtimingtable_nilreason,
    coalesce(cast(procedure.approachtimingtable.startingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable.startingmeasurementpoint_nilreason || ')') as startingmeasurementpoint,
    coalesce(cast(procedure.approachtimingtable.endingmeasurementpoint_value as varchar), '(' || procedure.approachtimingtable.endingmeasurementpoint_nilreason || ')') as endingmeasurementpoint,
    coalesce(cast(procedure.approachtimingtable.time_value as varchar) || ' ' || procedure.approachtimingtable.time_uom, '(' || procedure.approachtimingtable.time_nilreason || ')') as time,
    coalesce(cast(procedure.approachtimingtable.speed_value as varchar) || ' ' || procedure.approachtimingtable.speed_uom, '(' || procedure.approachtimingtable.speed_nilreason || ')') as speed,
    lat_annotation.annotation as annotation
from procedure.approachtimingtable_pt 
inner join procedure.approachtimingtable on procedure.approachtimingtable_pt.approachtimingtable_id = procedure.approachtimingtable.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ggfrhb.*) AS annotation
  from master_join master_join_yrepmp
  join notes.note_view notes_note_view_ggfrhb on master_join_yrepmp.target_id = notes_note_view_ggfrhb.id
  where master_join_yrepmp.source_id = procedure.approachtimingtable.id
) as lat_annotation on TRUE;
create index on procedure.approachtimingtable_view (id);
-- ApronContaminationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.aproncontamination_view cascade;
create materialized view airport_heliport.aproncontamination_view as
select
    airport_heliport.aproncontamination_pt.id,
    airport_heliport.aproncontamination_pt.nilreason AS aproncontamination_nilreason,
    coalesce(cast(airport_heliport.aproncontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.aproncontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.aproncontamination.frictionestimation_value as varchar), '(' || airport_heliport.aproncontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.aproncontamination.frictiondevice_value as varchar), '(' || airport_heliport.aproncontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.aproncontamination.obscuredlights_value as varchar), '(' || airport_heliport.aproncontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.aproncontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.aproncontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.aproncontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.aproncontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.aproncontamination.proportion_value as varchar), '(' || airport_heliport.aproncontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.aproncontamination.depth_value as varchar) || ' ' || airport_heliport.aproncontamination.depth_uom, '(' || airport_heliport.aproncontamination.depth_nilreason || ')') as depth,
    lat_criticalridge.lat_criticalridge as criticalridge,
    lat_layer.lat_layer as layer,
    lat_annotation.annotation as annotation
from airport_heliport.aproncontamination_pt 
inner join airport_heliport.aproncontamination on airport_heliport.aproncontamination_pt.aproncontamination_id = airport_heliport.aproncontamination.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_ridge_pt_ystafn.id) as lat_criticalridge
  from master_join master_join_spabmr
  join airport_heliport.ridge_pt airport_heliport_ridge_pt_ystafn on master_join_spabmr.target_id = airport_heliport_ridge_pt_ystafn.id
  where master_join_spabmr.source_id = airport_heliport.aproncontamination.id
) as lat_criticalridge on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_surfacecontaminationlayer_pt_bzyjek.id) as lat_layer
  from master_join master_join_qhxduz
  join airport_heliport.surfacecontaminationlayer_pt airport_heliport_surfacecontaminationlayer_pt_bzyjek on master_join_qhxduz.target_id = airport_heliport_surfacecontaminationlayer_pt_bzyjek.id
  where master_join_qhxduz.source_id = airport_heliport.aproncontamination.id
) as lat_layer on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_drwcke.*) AS annotation
  from master_join master_join_culmvm
  join notes.note_view notes_note_view_drwcke on master_join_culmvm.target_id = notes_note_view_drwcke.id
  where master_join_culmvm.source_id = airport_heliport.aproncontamination.id
) as lat_annotation on TRUE;
create index on airport_heliport.aproncontamination_view (id);
-- AuthorityForAerialRefuellingPropertyType
-- ['notes.note_view']
drop materialized view if exists aerial_refuelling.authorityforaerialrefuelling_view cascade;
create materialized view aerial_refuelling.authorityforaerialrefuelling_view as
select
    aerial_refuelling.authorityforaerialrefuelling_pt.id,
    aerial_refuelling.authorityforaerialrefuelling_pt.nilreason AS authorityforaerialrefuelling_nilreason,
    coalesce(cast(aerial_refuelling.authorityforaerialrefuelling.type_value as varchar), '(' || aerial_refuelling.authorityforaerialrefuelling.type_nilreason || ')') as type,
    coalesce(cast(organisation_organisationauthority_pt_mvtfjz.title as varchar), '(' || organisation_organisationauthority_pt_mvtfjz.nilreason[1] || ')') AS theorganisationauthority,
    organisation_organisationauthority_pt_mvtfjz.href AS theorganisationauthority_href,
    lat_annotation.annotation as annotation
from aerial_refuelling.authorityforaerialrefuelling_pt 
inner join aerial_refuelling.authorityforaerialrefuelling on aerial_refuelling.authorityforaerialrefuelling_pt.authorityforaerialrefuelling_id = aerial_refuelling.authorityforaerialrefuelling.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_mvtfjz on aerial_refuelling.authorityforaerialrefuelling.theorganisationauthority_id = organisation_organisationauthority_pt_mvtfjz.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_bhcait.*) AS annotation
  from master_join master_join_nrnfqr
  join notes.note_view notes_note_view_bhcait on master_join_nrnfqr.target_id = notes_note_view_bhcait.id
  where master_join_nrnfqr.source_id = aerial_refuelling.authorityforaerialrefuelling.id
) as lat_annotation on TRUE;
create index on aerial_refuelling.authorityforaerialrefuelling_view (id);
-- AuthorityForNavaidEquipmentPropertyType
-- ['notes.note_view']
drop materialized view if exists navaids_points.authorityfornavaidequipment_view cascade;
create materialized view navaids_points.authorityfornavaidequipment_view as
select
    navaids_points.authorityfornavaidequipment_pt.id,
    navaids_points.authorityfornavaidequipment_pt.nilreason AS authorityfornavaidequipment_nilreason,
    coalesce(cast(navaids_points.authorityfornavaidequipment.type_value as varchar), '(' || navaids_points.authorityfornavaidequipment.type_nilreason || ')') as type,
    coalesce(cast(organisation_organisationauthority_pt_epaclm.title as varchar), '(' || organisation_organisationauthority_pt_epaclm.nilreason[1] || ')') AS theorganisationauthority,
    organisation_organisationauthority_pt_epaclm.href AS theorganisationauthority_href,
    lat_annotation.annotation as annotation
from navaids_points.authorityfornavaidequipment_pt 
inner join navaids_points.authorityfornavaidequipment on navaids_points.authorityfornavaidequipment_pt.authorityfornavaidequipment_id = navaids_points.authorityfornavaidequipment.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_epaclm on navaids_points.authorityfornavaidequipment.theorganisationauthority_id = organisation_organisationauthority_pt_epaclm.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ibstcg.*) AS annotation
  from master_join master_join_ftjyhx
  join notes.note_view notes_note_view_ibstcg on master_join_ftjyhx.target_id = notes_note_view_ibstcg.id
  where master_join_ftjyhx.source_id = navaids_points.authorityfornavaidequipment.id
) as lat_annotation on TRUE;
create index on navaids_points.authorityfornavaidequipment_view (id);
-- AuthorityForSpecialNavigationStationPropertyType
-- ['notes.note_view']
drop materialized view if exists navaids_points.authorityforspecialnavigationstation_view cascade;
create materialized view navaids_points.authorityforspecialnavigationstation_view as
select
    navaids_points.authorityforspecialnavigationstation_pt.id,
    navaids_points.authorityforspecialnavigationstation_pt.nilreason AS authorityforspecialnavigationstation_nilreason,
    coalesce(cast(navaids_points.authorityforspecialnavigationstation.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationstation.type_nilreason || ')') as type,
    coalesce(cast(organisation_organisationauthority_pt_chzinu.title as varchar), '(' || organisation_organisationauthority_pt_chzinu.nilreason[1] || ')') AS theorganisationauthority,
    organisation_organisationauthority_pt_chzinu.href AS theorganisationauthority_href,
    lat_annotation.annotation as annotation
from navaids_points.authorityforspecialnavigationstation_pt 
inner join navaids_points.authorityforspecialnavigationstation on navaids_points.authorityforspecialnavigationstation_pt.authorityforspecialnavigationstation_id = navaids_points.authorityforspecialnavigationstation.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_chzinu on navaids_points.authorityforspecialnavigationstation.theorganisationauthority_id = organisation_organisationauthority_pt_chzinu.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gpjdef.*) AS annotation
  from master_join master_join_igfzgk
  join notes.note_view notes_note_view_gpjdef on master_join_igfzgk.target_id = notes_note_view_gpjdef.id
  where master_join_igfzgk.source_id = navaids_points.authorityforspecialnavigationstation.id
) as lat_annotation on TRUE;
create index on navaids_points.authorityforspecialnavigationstation_view (id);
-- AuthorityForSpecialNavigationSystemPropertyType
-- ['notes.note_view']
drop materialized view if exists navaids_points.authorityforspecialnavigationsystem_view cascade;
create materialized view navaids_points.authorityforspecialnavigationsystem_view as
select
    navaids_points.authorityforspecialnavigationsystem_pt.id,
    navaids_points.authorityforspecialnavigationsystem_pt.nilreason AS authorityforspecialnavigationsystem_nilreason,
    coalesce(cast(navaids_points.authorityforspecialnavigationsystem.type_value as varchar), '(' || navaids_points.authorityforspecialnavigationsystem.type_nilreason || ')') as type,
    coalesce(cast(organisation_organisationauthority_pt_mwaqqe.title as varchar), '(' || organisation_organisationauthority_pt_mwaqqe.nilreason[1] || ')') AS theorganisationauthority,
    organisation_organisationauthority_pt_mwaqqe.href AS theorganisationauthority_href,
    lat_annotation.annotation as annotation
from navaids_points.authorityforspecialnavigationsystem_pt 
inner join navaids_points.authorityforspecialnavigationsystem on navaids_points.authorityforspecialnavigationsystem_pt.authorityforspecialnavigationsystem_id = navaids_points.authorityforspecialnavigationsystem.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_mwaqqe on navaids_points.authorityforspecialnavigationsystem.theorganisationauthority_id = organisation_organisationauthority_pt_mwaqqe.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_fupahj.*) AS annotation
  from master_join master_join_qrveyt
  join notes.note_view notes_note_view_fupahj on master_join_qrveyt.target_id = notes_note_view_fupahj.id
  where master_join_qrveyt.source_id = navaids_points.authorityforspecialnavigationsystem.id
) as lat_annotation on TRUE;
create index on navaids_points.authorityforspecialnavigationsystem_view (id);
-- CallsignDetailPropertyType
-- ['notes.note_view']
drop materialized view if exists service.callsigndetail_view cascade;
create materialized view service.callsigndetail_view as
select
    service.callsigndetail_pt.id,
    service.callsigndetail_pt.nilreason AS callsigndetail_nilreason,
    coalesce(cast(service.callsigndetail.callsign_value as varchar), '(' || service.callsigndetail.callsign_nilreason || ')') as callsign,
    coalesce(cast(service.callsigndetail.language_value as varchar), '(' || service.callsigndetail.language_nilreason || ')') as language,
    lat_annotation.annotation as annotation
from service.callsigndetail_pt 
inner join service.callsigndetail on service.callsigndetail_pt.callsigndetail_id = service.callsigndetail.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_aasgod.*) AS annotation
  from master_join master_join_mrnedr
  join notes.note_view notes_note_view_aasgod on master_join_mrnedr.target_id = notes_note_view_aasgod.id
  where master_join_mrnedr.source_id = service.callsigndetail.id
) as lat_annotation on TRUE;
create index on service.callsigndetail_view (id);
-- CircleSectorPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.circlesector_view cascade;
create materialized view shared.circlesector_view as
select
    shared.circlesector_pt.id,
    shared.circlesector_pt.nilreason AS circlesector_nilreason,
    coalesce(cast(shared.circlesector.arcdirection_value as varchar), '(' || shared.circlesector.arcdirection_nilreason || ')') as arcdirection,
    coalesce(cast(shared.circlesector.fromangle_value as varchar), '(' || shared.circlesector.fromangle_nilreason || ')') as fromangle,
    coalesce(cast(shared.circlesector.toangle_value as varchar), '(' || shared.circlesector.toangle_nilreason || ')') as toangle,
    coalesce(cast(shared.circlesector.angletype_value as varchar), '(' || shared.circlesector.angletype_nilreason || ')') as angletype,
    coalesce(cast(shared.circlesector.angledirectionreference_value as varchar), '(' || shared.circlesector.angledirectionreference_nilreason || ')') as angledirectionreference,
    coalesce(cast(shared.circlesector.upperlimitreference_value as varchar), '(' || shared.circlesector.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.circlesector.lowerlimitreference_value as varchar), '(' || shared.circlesector.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.circlesector.innerdistance_value as varchar) || ' ' || shared.circlesector.innerdistance_uom, '(' || shared.circlesector.innerdistance_nilreason || ')') as innerdistance,
    coalesce(cast(shared.circlesector.outerdistance_value as varchar) || ' ' || shared.circlesector.outerdistance_uom, '(' || shared.circlesector.outerdistance_nilreason || ')') as outerdistance,
    coalesce(cast(shared.circlesector.upperlimit_value as varchar) || ' ' || shared.circlesector.upperlimit_uom, '(' || shared.circlesector.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.circlesector.lowerlimit_value as varchar) || ' ' || shared.circlesector.lowerlimit_uom, '(' || shared.circlesector.lowerlimit_nilreason || ')') as lowerlimit,
    lat_annotation.annotation as annotation
from shared.circlesector_pt 
inner join shared.circlesector on shared.circlesector_pt.circlesector_id = shared.circlesector.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ivqvey.*) AS annotation
  from master_join master_join_aeqtdd
  join notes.note_view notes_note_view_ivqvey on master_join_aeqtdd.target_id = notes_note_view_ivqvey.id
  where master_join_aeqtdd.source_id = shared.circlesector.id
) as lat_annotation on TRUE;
create index on shared.circlesector_view (id);
-- CityPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.city_view cascade;
create materialized view airport_heliport.city_view as
select
    airport_heliport.city_pt.id,
    airport_heliport.city_pt.nilreason AS city_nilreason,
    coalesce(cast(airport_heliport.city.name_value as varchar), '(' || airport_heliport.city.name_nilreason || ')') as name,
    lat_annotation.annotation as annotation
from airport_heliport.city_pt 
inner join airport_heliport.city on airport_heliport.city_pt.city_id = airport_heliport.city.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ipigcm.*) AS annotation
  from master_join master_join_irqipz
  join notes.note_view notes_note_view_ipigcm on master_join_irqipz.target_id = notes_note_view_ipigcm.id
  where master_join_irqipz.source_id = airport_heliport.city.id
) as lat_annotation on TRUE;
create index on airport_heliport.city_view (id);
-- CurvePropertyType
-- ['notes.note_view']
-- Snowflake SQL : CurvePropertyType 

DROP MATERIALIZED VIEW IF EXISTS geometry.curve_view CASCADE;

CREATE MATERIALIZED VIEW geometry.curve_view AS
WITH 
center AS (
    SELECT 
		id, 
		point,
		radius,
		start_angle,
		end_angle,
		(end_angle - start_angle) / 100 AS step_size
    FROM geometry.linestring_segment 
	WHERE geometry.linestring_segment.interpretation = 2
	UNION ALL 
	SELECT 
		id, 
		point,
		radius,
		0 as start_angle,
		2*PI() as end_angle,
		(0 - 2*PI()) / 100 AS step_size
    FROM geometry.linestring_segment 
	WHERE geometry.linestring_segment.interpretation = 3
),
interpolated_points AS (
    SELECT 
        center.id,
		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
    FROM 
        generate_series(0, 100) AS n, 	
        center
),
arc_line AS (
    SELECT 
        interpolated_points.id,
        ST_MakeLine(point_geom) AS arc_geom
    FROM interpolated_points
    GROUP BY id
),
segment_union AS (
    SELECT 
		id, 
		ST_ReducePrecision(linestring,0.000000000000001) AS geom
    FROM
		geometry.linestring_segment 
    WHERE 
		geometry.linestring_segment.interpretation = 0
    UNION ALL 
    SELECT 
		id, 
		ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 1000)::geometry AS geom
    FROM 
		geometry.linestring_segment 
    WHERE 
		geometry.linestring_segment.interpretation = 1
    UNION ALL 
    SELECT 
		id, 
		ST_ReducePrecision(arc_geom, 0.000000000000001) AS geom
    FROM 
		arc_line
),
merged_segments AS (
    SELECT 
        geometry.curve_pt.id,
        ST_LineMerge(ST_Collect(segment_union.geom)) AS merged_geom,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		nilreason
    FROM 
        geometry.curve_pt
    INNER JOIN 
		master_join_geometry ON  geometry.curve_pt.id = master_join_geometry.source_id 
    INNER JOIN 
        segment_union ON master_join_geometry.target_id = segment_union.id
    GROUP BY geometry.curve_pt.id
)
SELECT 
    merged_segments.id, 
	merged_geom as geom,
	COALESCE(merged_segments.horizontalaccuracy || ' ' || merged_segments.horizontalaccuracy_uom, '(' || merged_segments.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM merged_segments;

CREATE INDEX ON geometry.curve_view (id);
-- DepartureArrivalConditionPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.departurearrivalcondition_view cascade;
create materialized view procedure.departurearrivalcondition_view as
select
    procedure.departurearrivalcondition_pt.id,
    procedure.departurearrivalcondition_pt.nilreason AS departurearrivalcondition_nilreason,
    coalesce(cast(procedure.departurearrivalcondition.minimumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition.minimumcrossingatendreference_nilreason || ')') as minimumcrossingatendreference,
    coalesce(cast(procedure.departurearrivalcondition.maximumcrossingatendreference_value as varchar), '(' || procedure.departurearrivalcondition.maximumcrossingatendreference_nilreason || ')') as maximumcrossingatendreference,
    coalesce(cast(procedure.departurearrivalcondition.minimumenroutealtitude_value as varchar) || ' ' || procedure.departurearrivalcondition.minimumenroutealtitude_uom, '(' || procedure.departurearrivalcondition.minimumenroutealtitude_nilreason || ')') as minimumenroutealtitude,
    coalesce(cast(procedure.departurearrivalcondition.minimumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition.minimumcrossingatend_uom, '(' || procedure.departurearrivalcondition.minimumcrossingatend_nilreason || ')') as minimumcrossingatend,
    coalesce(cast(procedure.departurearrivalcondition.maximumcrossingatend_value as varchar) || ' ' || procedure.departurearrivalcondition.maximumcrossingatend_uom, '(' || procedure.departurearrivalcondition.maximumcrossingatend_nilreason || ')') as maximumcrossingatend,
    shared_aircraftcharacteristic_pt_fbcvod.id AS enginetype,
    lat_annotation.annotation as annotation
from procedure.departurearrivalcondition_pt 
inner join procedure.departurearrivalcondition on procedure.departurearrivalcondition_pt.departurearrivalcondition_id = procedure.departurearrivalcondition.id
left join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_fbcvod on procedure.departurearrivalcondition.engine_id = shared_aircraftcharacteristic_pt_fbcvod.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xotbav.*) AS annotation
  from master_join master_join_ftzqtt
  join notes.note_view notes_note_view_xotbav on master_join_ftzqtt.target_id = notes_note_view_xotbav.id
  where master_join_ftzqtt.source_id = procedure.departurearrivalcondition.id
) as lat_annotation on TRUE;
create index on procedure.departurearrivalcondition_view (id);
-- DirectFlightClassPropertyType
-- ['notes.note_view']
drop materialized view if exists routes.directflightclass_view cascade;
create materialized view routes.directflightclass_view as
select
    routes.directflightclass_pt.id,
    routes.directflightclass_pt.nilreason AS directflightclass_nilreason,
    coalesce(cast(routes.directflightclass.exceedlength_value as varchar) || ' ' || routes.directflightclass.exceedlength_uom, '(' || routes.directflightclass.exceedlength_nilreason || ')') as exceedlength,
    lat_annotation.annotation as annotation
from routes.directflightclass_pt 
inner join routes.directflightclass on routes.directflightclass_pt.directflightclass_id = routes.directflightclass.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_kiikao.*) AS annotation
  from master_join master_join_rqitxr
  join notes.note_view notes_note_view_kiikao on master_join_rqitxr.target_id = notes_note_view_kiikao.id
  where master_join_rqitxr.source_id = routes.directflightclass.id
) as lat_annotation on TRUE;
create index on routes.directflightclass_view (id);
-- ElevatedCurvePropertyType
-- ['notes.note_view']
-- Snowflake SQL : ElevatedCurvePropertyType

DROP MATERIALIZED VIEW IF EXISTS geometry.elevatedcurve_view CASCADE;

CREATE MATERIALIZED VIEW geometry.elevatedcurve_view AS
WITH 
center AS (
    SELECT 
		id, 
		point,
		radius,
		start_angle,
		end_angle,
		(end_angle - start_angle) / 100 AS step_size
    FROM geometry.linestring_segment 
	WHERE geometry.linestring_segment.interpretation = 2
	UNION ALL 
	SELECT 
		id, 
		point,
		radius,
		0 as start_angle,
		2*PI() as end_angle,
		(0 - 2*PI()) / 100 AS step_size
    FROM geometry.linestring_segment 
	WHERE geometry.linestring_segment.interpretation = 3
),
interpolated_points AS (
    SELECT 
        center.id,
		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
    FROM 
        generate_series(0, 100) AS n, 	
        center
),
arc_line AS (
    SELECT 
        id,
        ST_MakeLine(point_geom) AS arc_geom
    FROM interpolated_points
    GROUP BY id
),
segment_union AS (
    SELECT 
		id, 
		ST_ReducePrecision(linestring,0.000000000000001) AS geom
    FROM
		geometry.linestring_segment 
    WHERE 
		geometry.linestring_segment.interpretation = 0
    UNION ALL 
    SELECT 
		id, 
		ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 1000)::geometry AS geom
    FROM 
		geometry.linestring_segment 
    WHERE 
		geometry.linestring_segment.interpretation = 1
    UNION ALL 
    SELECT 
		id, 
		ST_ReducePrecision(arc_geom, 0.000000000000001) AS geom
    FROM 
		arc_line
),
merged_segments AS (
    SELECT 
        geometry.elevated_curve_pt.id,
        ST_LineMerge(ST_Collect(segment_union.geom)) AS merged_geom,
		elevation,
		elevation_uom,
		elevation_nilreason,
		geoidundulation,
		geoidundulation_uom,
		geoidundulation_nilreason,
		horizontalaccuracy,
		horizontalaccuracy_uom,
		horizontalaccuracy_nilreason,
		verticalaccuracy,
		verticalaccuracy_uom,
		verticalaccuracy_nilreason,
		verticaldatum,
		verticaldatum_nilreason,
		nilreason
    FROM 
        geometry.elevated_curve_pt
    INNER JOIN 
		master_join_geometry ON  geometry.elevated_curve_pt.id = master_join_geometry.source_id 
    INNER JOIN 
        segment_union ON master_join_geometry.target_id  = segment_union.id
    GROUP BY geometry.elevated_curve_pt.id
)
SELECT 
    merged_segments.id,
	merged_geom as geom,
	COALESCE(merged_segments.elevation || ' ' || merged_segments.elevation_uom, '(' || merged_segments.elevation_nilreason || ')') AS elevation,
	COALESCE(merged_segments.geoidundulation || ' ' || merged_segments.geoidundulation_uom, '(' || merged_segments.geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(merged_segments.verticaldatum || ' ' || merged_segments.geoidundulation_uom, '(' || merged_segments.geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(CAST(merged_segments.verticalaccuracy AS varchar), '(' || merged_segments.verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(merged_segments.horizontalaccuracy || ' ' || merged_segments.horizontalaccuracy_uom, '(' || merged_segments.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM merged_segments;

CREATE INDEX ON geometry.elevatedcurve_view (id);
-- ElevatedPointPropertyType
-- ['notes.note_view']
-- Snowflake SQL : ElevatedPointPropertyType

DROP MATERIALIZED VIEW IF EXISTS geometry.elevatedpoint_view CASCADE;

CREATE MATERIALIZED VIEW geometry.elevatedpoint_view AS
SELECT 
    id, 
    point as geom,
	ST_X(point) AS longitude,
	ST_Y(point) AS latitude,
	COALESCE(elevation || ' ' || elevation_uom, '(' || elevation_nilreason || ')') AS elevation,
	COALESCE(geoidundulation || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS geoidUndulation,
	COALESCE(verticaldatum || ' ' || geoidundulation_uom, '(' || geoidundulation_nilreason || ')') AS verticalDatum,
	COALESCE(verticalaccuracy || ' ' || horizontalaccuracy_uom, '(' || verticaldatum_nilreason || ')') AS verticalAccuracy,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM geometry.elevated_point_pt;

CREATE INDEX ON geometry.elevatedpoint_view (id);
-- ElevatedSurfacePropertyType
-- ['notes.note_view']
-- -- Snowflake SQL : ElevatedSurfacePropertyType

-- DROP VIEW IF EXISTS geometry.elevatedpoint_view CASCADE;

-- CREATE MATERIALIZED VIEW partial_elevatedsurface_view AS
-- WITH  
-- segment_ref AS(
-- 	SELECT 
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		SUBSTRING(
-- 	        curve_ref 
-- 	        FROM '([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$'
-- 	    ) AS uuid
--     FROM public.polygon_segment 
-- 	WHERE public.polygon_segment.interpretation = 4
-- ),
-- segment_value AS(
-- 	SELECT 
-- 		airspace.geoborder.identifier AS uuid,
-- 		geom
-- 	FROM airspace.geoborder
-- 	INNER JOIN public.geoborder_timeslice
-- 		ON airspace.geoborder.id = public.geoborder_timeslice.geoborder_id
-- 	INNER JOIN airspace.geoborder_tsp
-- 		ON public.geoborder_timeslice.geoborder_tsp_id = airspace.geoborder_tsp.id
-- 	INNER JOIN airspace.geoborder_ts
-- 		ON airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
-- 	INNER JOIN public.curve_pt
-- 		ON airspace.geoborder_ts.border_id = public.curve_pt.id
-- 	INNER JOIN geometry.curve_view
-- 		ON public.curve_pt.id = geometry.curve_view.id
-- ),
-- center AS (
--     SELECT 
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		point,
-- 		radius,
-- 		start_angle,
-- 		end_angle,
-- 		(end_angle - start_angle) / 256 AS step_size
--     FROM public.polygon_segment 
-- 	WHERE public.polygon_segment.interpretation = 2
-- 	UNION ALL 
-- 	SELECT 
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		point,
-- 		radius,
-- 		0 as start_angle,
-- 		2*PI() as end_angle,
-- 		(0 - 2*PI()) / 256 AS step_size
--     FROM public.polygon_segment 
-- 	WHERE public.polygon_segment.interpretation = 3
-- ),
-- interpolated_points AS (
--     SELECT 
--         center.id,
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
--     FROM 
--         generate_series(0, 256) AS n, 	
--         center
-- ),
-- arc_line AS (
--     SELECT 
--         id,
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
--         ST_MakeLine(point_geom) AS geom
--     FROM interpolated_points
--     GROUP BY 
-- 		id, 
-- 		curve_xml_id,
-- 		part, 
-- 		member, 
-- 		sequence, 
-- 		interpretation
-- ),
-- segment_union AS (
--     SELECT 
--         id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_ReducePrecision(linestring, 0.000000000000001) AS geom,
-- 		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
--     FROM 
--         public.polygon_segment 
--     WHERE 
--         public.polygon_segment.interpretation = 0
--     UNION ALL 
--     SELECT 
--         id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
--         ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 10000)::geometry as geom,
-- 		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
--     FROM 
--         public.polygon_segment 
--     WHERE 
--         public.polygon_segment.interpretation = 1
-- 	UNION ALL
-- 	SELECT
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
-- 		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
-- 	FROM
-- 		arc_line
-- 	UNION ALL
-- 	SELECT
-- 		id,
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
-- 		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
-- 	FROM segment_ref
-- 	INNER JOIN segment_value
-- 	ON segment_ref.uuid = segment_value.uuid		
-- ),
-- segement_ownership AS (
-- 	SELECT 
-- 		public.elevated_surface_pt.id,
--         public.elevated_surface_pt.xml_id,
-- 		segment_union.curve_xml_id,
-- 		segment_union.part AS part,
-- 		segment_union.member AS member,
-- 		segment_union.sequence AS sequence,
-- 		segment_union.interpretation AS interpretation,
-- 		segment_union.geom AS geom,
-- 		segment_union.first_point as first_point,
-- 		segment_union.last_point as last_point,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         public.elevated_surface_pt
--     INNER JOIN 
--         public.elevatedsurface_exterior 
--         ON public.elevated_surface_pt.id = public.elevatedsurface_exterior.elevatedsurfacepropertytype_id
--     INNER JOIN 
--         segment_union 
--         ON public.elevatedsurface_exterior.exteriorlinestring_id = segment_union.id
-- 	UNION ALL
-- 	SELECT 
-- 		public.elevated_surface_pt.id,
--         public.elevated_surface_pt.xml_id,
-- 		segment_union.curve_xml_id,
-- 		segment_union.part AS part,
-- 		segment_union.member AS member,
-- 		segment_union.sequence AS sequence,
-- 		segment_union.interpretation AS interpretation,
-- 		segment_union.geom AS geom,
-- 		segment_union.first_point AS first_point,
-- 		segment_union.last_point AS last_point,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         public.elevated_surface_pt
--     INNER JOIN 
--         public.elevatedsurface_interior 
--         ON public.elevated_surface_pt.id = public.elevatedsurface_interior.elevatedsurfacepropertytype_id
--     INNER JOIN 
--         segment_union 
--         ON public.elevatedsurface_interior.interiorlinestring_id = segment_union.id
-- ),
-- ordered_segments AS (
--     SELECT 
-- 		id,
--         xml_id, 
-- 		curve_xml_id,
--         part,
-- 		member,
--         sequence,
-- 		interpretation,
--         geom,
--         first_point, 
--         last_point,
-- 		ST_IsClosed(segement_ownership.geom) AS closed,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         segement_ownership
--     ORDER BY 
--         xml_id, 
-- 		part, 
-- 		member, 
-- 		sequence
-- ),
-- connecting_segments AS (
--     SELECT 
--         id,
-- 		xml_id,
-- 		curve_xml_id,
--         part,
-- 		member,
--         sequence,
-- 		interpretation,
--         geom,
--         first_point,
--         last_point,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         ordered_segments
--     UNION ALL
--     SELECT 
--         curr.id,
-- 		curr.xml_id,
-- 		Null AS curve_xml_id,
--         curr.part,
-- 		curr.member,
--         curr.sequence + 0.5 AS sequence,
-- 		1,
--         ST_MakeLine(curr.last_point, next.first_point) AS geom,
--         curr.last_point AS first_point,
--         next.first_point AS last_point,
-- 		NULL AS elevation,
-- 		NULL AS elevation_uom,
-- 		NULL AS elevation_nilreason,
-- 		NULL AS geoidundulation,
-- 		NULL AS geoidundulation_uom,
-- 		NULL AS geoidundulation_nilreason,
-- 		NULL AS horizontalaccuracy,
-- 		NULL AS horizontalaccuracy_uom,
-- 		NULL AS horizontalaccuracy_nilreason,
-- 		NULL AS verticalaccuracy,
-- 		NULL AS verticalaccuracy_uom,
-- 		NULL AS verticalaccuracy_nilreason,
-- 		NULL AS verticaldatum,
-- 		NULL AS verticaldatum_nilreason,
-- 		NULL AS nilreason
--     FROM 
--         ordered_segments curr
--     JOIN 
--         ordered_segments next
--     ON 
--         curr.xml_id = next.xml_id
--         AND curr.part = next.part
--         AND curr.sequence + 1 = next.sequence
-- 		AND curr.member = next.member
-- 	WHERE 
-- 		ST_IsClosed(curr.geom) = false
-- 		AND
-- 		curr.interpretation != 4
-- 		AND
-- 		next.interpretation != 4
--     UNION ALL
--     SELECT 
--         curr.id,
-- 		curr.xml_id,
-- 		Null AS curve_xml_id,
--         curr.part,
-- 		curr.member + 0.5 AS member,
--         curr.sequence,
-- 		1,
--         ST_MakeLine(curr.last_point, next.first_point) AS geom,
--         curr.last_point AS first_point,
--         next.first_point AS last_point,
-- 		NULL AS elevation,
-- 		NULL AS elevation_uom,
-- 		NULL AS elevation_nilreason,
-- 		NULL AS geoidundulation,
-- 		NULL AS geoidundulation_uom,
-- 		NULL AS geoidundulation_nilreason,
-- 		NULL AS horizontalaccuracy,
-- 		NULL AS horizontalaccuracy_uom,
-- 		NULL AS horizontalaccuracy_nilreason,
-- 		NULL AS verticalaccuracy,
-- 		NULL AS verticalaccuracy_uom,
-- 		NULL AS verticalaccuracy_nilreason,
-- 		NULL AS verticaldatum,
-- 		NULL AS verticaldatum_nilreason,
-- 		NULL AS nilreason
--     FROM 
--         ordered_segments curr
--     JOIN 
--         ordered_segments next
--     ON 
--         curr.xml_id = next.xml_id
--         AND curr.part = next.part
--         AND curr.member + 1 = next.member
-- 	WHERE 
-- 		ST_IsClosed(curr.geom) = false
-- 		AND
-- 		curr.interpretation != 4
-- 		AND
-- 		next.interpretation != 4
--     ORDER BY 
--         xml_id, 
--         part, 
--         member,
--         sequence
-- ),
-- clustered_segments AS (
--     SELECT 
--         id, 
--         xml_id,
-- 		curve_xml_id,
--         part,
--         member,
-- 		interpretation,
--         geom,
-- 		ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part)  AS cluster_id,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         connecting_segments
--     WHERE 
--         interpretation != 4
-- 	UNION ALL
--     SELECT 
--         id, 
-- 		xml_id,
-- 		curve_xml_id,
--         part,
--         member,
-- 		interpretation,
--         geom,
-- 		Null AS cluster_id,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         connecting_segments
--     WHERE 
--         interpretation = 4
-- 	ORDER BY
-- 		xml_id,
-- 		part, 
-- 		member
-- ),
-- partial_ring AS (
--     SELECT 
--         id, 
--         xml_id,
-- 		ARRAY_AGG(curve_xml_id) as curve_xml_id,
--         part,
--         MIN(member) AS member,
-- 		MIN(interpretation) AS interpretation,
--         ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
--         ST_GeometryType(ST_LineMerge(ST_Collect(geom))) AS type, 
--         ST_LineMerge(ST_Collect(geom)) AS geom,
--         NULL::geometry AS points,
-- 		MAX(elevation) AS elevation,
-- 		MAX(elevation_uom) AS elevation_uom,
-- 		MAX(elevation_nilreason) AS elevation_nilreason,
-- 		MAX(geoidundulation) AS geoidundulation,
-- 		MAX(geoidundulation_uom) AS geoidundulation_uom,
-- 		MAX(geoidundulation_nilreason) AS geoidundulation_nilreason,
-- 		MAX(horizontalaccuracy) AS horizontalaccuracy,
-- 		MAX(horizontalaccuracy_uom) AS horizontalaccuracy_uom,
-- 		MAX(horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
-- 		MAX(verticalaccuracy) AS verticalaccuracy,
-- 		MAX(verticalaccuracy_uom) AS verticalaccuracy_uom,
-- 		MAX(verticalaccuracy_nilreason) AS verticalaccuracy_nilreason,
-- 		MAX(verticaldatum) AS verticaldatum,
-- 		MAX(verticaldatum_nilreason) AS verticaldatum_nilreason,
-- 		MAX(nilreason) AS nilreason
--     FROM 
--         clustered_segments
-- 	WHERE 
-- 		interpretation != 4
--     GROUP BY 
-- 		id,
--         xml_id, 
--         part, 
--         cluster_id,
--         horizontalaccuracy, 
--         horizontalaccuracy_uom, 
--         horizontalaccuracy_nilreason,	
--         nilreason
-- 	UNION ALL
--     SELECT 
--         id, 
--         xml_id,
-- 		ARRAY[curve_xml_id] AS curve_xml_id,
--         part,
--         member,
-- 		interpretation,
--         ST_IsClosed(geom) AS closed,
--         ST_GeometryType(geom) AS type, 
-- 		geom AS geom,
-- 		ST_Points(geom) AS points,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         clustered_segments
-- 	WHERE 
-- 		interpretation = 4
-- 	ORDER BY 
--         xml_id, 
-- 		part, 
-- 		member
-- ),
-- output AS (
--     SELECT 
--         pr.id, 
--         pr.xml_id,
-- 		pr.curve_xml_id,
--         pr.part,
-- 		ROW_NUMBER() OVER (PARTITION BY xml_id, part ORDER BY id) - 1 AS increment,
-- 		COUNT(*) OVER (PARTITION BY xml_id, part ) AS total_count,
-- 		pr.interpretation,
-- 		pr.points,
--         COALESCE(dumped.geom, pr.geom) AS geom,
-- 		pr.elevation,
-- 		pr.elevation_uom,
-- 		pr.elevation_nilreason,
-- 		pr.geoidundulation,
-- 		pr.geoidundulation_uom,
-- 		pr.geoidundulation_nilreason,
-- 		pr.horizontalaccuracy,
-- 		pr.horizontalaccuracy_uom,
-- 		pr.horizontalaccuracy_nilreason,
-- 		pr.verticalaccuracy,
-- 		pr.verticalaccuracy_uom,
-- 		pr.verticalaccuracy_nilreason,
-- 		pr.verticaldatum,
-- 		pr.verticaldatum_nilreason,
-- 		pr.nilreason
--     FROM 
--         partial_ring pr
--     LEFT JOIN LATERAL (
--         SELECT (ST_Dump(pr.geom)).geom
--         WHERE ST_GeometryType(pr.geom) = 'ST_MultiLineString'
--     ) dumped ON true
-- 	ORDER BY
-- 		xml_id, 
-- 		part, 
-- 		member
-- )
-- SELECT 
-- 	ST_GeometryType(geom),
-- 	output.id, 
-- 	to_jsonb(output.xml_id) AS xml_id,
-- 	to_jsonb(output.curve_xml_id) AS curve_xml_id,
-- 	output.part,
-- 	output.increment,
-- 	output.total_count,
-- 	output.interpretation,
-- 	output.geom,
-- 	output.points,
-- 	output.elevation,
-- 	output.elevation_uom,
-- 	output.elevation_nilreason,
-- 	output.geoidundulation,
-- 	output.geoidundulation_uom,
-- 	output.geoidundulation_nilreason,
-- 	output.horizontalaccuracy,
-- 	output.horizontalaccuracy_uom,
-- 	output.horizontalaccuracy_nilreason,
-- 	output.verticalaccuracy,
-- 	output.verticalaccuracy_uom,
-- 	output.verticalaccuracy_nilreason,
-- 	output.verticaldatum,
-- 	output.verticaldatum_nilreason,
-- 	output.nilreason
-- FROM
-- output;

-- -- R1 : Simple feature, closed
-- -- R2 : Simple feature, unclosed
-- -- G1 : Complex feature wiht a single geoborder, 
-- -- G2 : Complex feature with multiple geoborder,
-- CREATE MATERIALIZED VIEW geometry.elevatedsurface_view AS
-- WITH 
-- g1_segment AS (
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom,
-- 			ST_Union(
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)),
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(ring.geom))
-- 			)
-- 		  )
-- 		)).geom AS geom,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)) AS  start_segment,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(ring.geom)) AS end_segment,
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_elevated_surface_view geoborder
-- 	JOIN
-- 		partial_elevated_surface_view ring
-- 	ON 
--         ring.xml_id = geoborder.xml_id
-- 		AND
-- 		ring.part = geoborder.part
-- 		AND 
-- 		ring.increment <> geoborder.increment
-- 	WHERE 
-- 		geoborder.total_count = 2
-- 		AND
-- 		geoborder.interpretation = 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.geom, 
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.geom, 
-- 		ring.geom,
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		partial_elevated_surface_view.id, 
-- 		partial_elevated_surface_view.xml_id,
-- 		partial_elevated_surface_view.curve_xml_id,
-- 		partial_elevated_surface_view.part,
-- 		partial_elevated_surface_view.increment,
-- 		partial_elevated_surface_view.interpretation,
-- 		partial_elevated_surface_view.geom,
-- 		Null::geometry AS start_segment,
-- 		Null::geometry AS end_segment,
-- 		partial_elevated_surface_view.elevation,
-- 		partial_elevated_surface_view.elevation_uom,
-- 		partial_elevated_surface_view.elevation_nilreason,
-- 		partial_elevated_surface_view.geoidundulation,
-- 		partial_elevated_surface_view.geoidundulation_uom,
-- 		partial_elevated_surface_view.geoidundulation_nilreason,
-- 		partial_elevated_surface_view.horizontalaccuracy,
-- 		partial_elevated_surface_view.horizontalaccuracy_uom,
-- 		partial_elevated_surface_view.horizontalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticalaccuracy,
-- 		partial_elevated_surface_view.verticalaccuracy_uom,
-- 		partial_elevated_surface_view.verticalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticaldatum,
-- 		partial_elevated_surface_view.verticaldatum_nilreason,
-- 		partial_elevated_surface_view.nilreason
-- 	FROM 
-- 		partial_elevated_surface_view
-- 	WHERE 
-- 		partial_elevated_surface_view.total_count = 2 
-- 		AND
-- 		partial_elevated_surface_view.interpretation != 4
-- 	ORDER BY
-- 		id, 
-- 		xml_id, 
-- 		part,
-- 		increment
-- ),
-- g2_segment AS (
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		geoborder.geom AS geom,
-- 		Null::geometry AS  start_segment,
-- 		Null::geometry AS end_segment,
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_elevated_surface_view geoborder
-- 	JOIN
-- 		partial_elevated_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_elevated_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation = 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom,
-- 			ST_Union(
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom)),
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
-- 			)
-- 		  )
-- 		)).geom AS geom,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_elevated_surface_view geoborder
-- 	JOIN
-- 		partial_elevated_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_elevated_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation != 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom, ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom))
-- 			)
-- 		  )
-- 		).geom AS geom,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
-- 		Null::geometry AS end_segment,
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_elevated_surface_view geoborder
-- 	JOIN
-- 		partial_elevated_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_elevated_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation = 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom,	ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
-- 			)
-- 		  )
-- 		).geom AS geom,
-- 		Null::geometry AS  start_segment,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_elevated_surface_view geoborder
-- 	JOIN
-- 		partial_elevated_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_elevated_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation != 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.elevation,
-- 		geoborder.elevation_uom,
-- 		geoborder.elevation_nilreason,
-- 		geoborder.geoidundulation,
-- 		geoborder.geoidundulation_uom,
-- 		geoborder.geoidundulation_nilreason,
-- 		geoborder.horizontalaccuracy,
-- 		geoborder.horizontalaccuracy_uom,
-- 		geoborder.horizontalaccuracy_nilreason,
-- 		geoborder.verticalaccuracy,
-- 		geoborder.verticalaccuracy_uom,
-- 		geoborder.verticalaccuracy_nilreason,
-- 		geoborder.verticaldatum,
-- 		geoborder.verticaldatum_nilreason,
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		partial_elevated_surface_view.id, 
-- 		partial_elevated_surface_view.xml_id,
-- 		partial_elevated_surface_view.curve_xml_id,
-- 		partial_elevated_surface_view.part,
-- 		partial_elevated_surface_view.increment,
-- 		partial_elevated_surface_view.interpretation,
-- 		partial_elevated_surface_view.total_count,
-- 		partial_elevated_surface_view.geom,
-- 		Null::geometry AS start_segment,
-- 		Null::geometry AS end_segment,
-- 		partial_elevated_surface_view.elevation,
-- 		partial_elevated_surface_view.elevation_uom,
-- 		partial_elevated_surface_view.elevation_nilreason,
-- 		partial_elevated_surface_view.geoidundulation,
-- 		partial_elevated_surface_view.geoidundulation_uom,
-- 		partial_elevated_surface_view.geoidundulation_nilreason,
-- 		partial_elevated_surface_view.horizontalaccuracy,
-- 		partial_elevated_surface_view.horizontalaccuracy_uom,
-- 		partial_elevated_surface_view.horizontalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticalaccuracy,
-- 		partial_elevated_surface_view.verticalaccuracy_uom,
-- 		partial_elevated_surface_view.verticalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticaldatum,
-- 		partial_elevated_surface_view.verticaldatum_nilreason,
-- 		partial_elevated_surface_view.nilreason
-- 	FROM 
-- 		partial_elevated_surface_view
-- 	WHERE 
-- 		partial_elevated_surface_view.total_count > 2 
-- 		AND
-- 		partial_elevated_surface_view.interpretation != 4
-- 	ORDER BY
-- 		id, 
-- 		xml_id, 
-- 		part,
-- 		increment
-- ),
-- g2_segment_filtered AS (
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		curr.geom AS geom,
-- 		curr.elevation,
-- 		curr.elevation_uom,
-- 		curr.elevation_nilreason,
-- 		curr.geoidundulation,
-- 		curr.geoidundulation_uom,
-- 		curr.geoidundulation_nilreason,
-- 		curr.horizontalaccuracy,
-- 		curr.horizontalaccuracy_uom,
-- 		curr.horizontalaccuracy_nilreason,
-- 		curr.verticalaccuracy,
-- 		curr.verticalaccuracy_uom,
-- 		curr.verticalaccuracy_nilreason,
-- 		curr.verticaldatum,
-- 		curr.verticaldatum_nilreason,
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 		g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, before.geom) 
-- 		AND 
-- 		ST_Intersects(curr.geom, after.geom)
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation = 4
-- 	UNION ALL
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.start_segment])) AS geom,
-- 		curr.elevation,
-- 		curr.elevation_uom,
-- 		curr.elevation_nilreason,
-- 		curr.geoidundulation,
-- 		curr.geoidundulation_uom,
-- 		curr.geoidundulation_nilreason,
-- 		curr.horizontalaccuracy,
-- 		curr.horizontalaccuracy_uom,
-- 		curr.horizontalaccuracy_nilreason,
-- 		curr.verticalaccuracy,
-- 		curr.verticalaccuracy_uom,
-- 		curr.verticalaccuracy_nilreason,
-- 		curr.verticaldatum,
-- 		curr.verticaldatum_nilreason,
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 		g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, curr.start_segment)  
-- 		AND 
-- 		ST_Intersects(curr.geom, after.geom)
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation = 4
-- 	UNION ALL
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment])) AS geom,
-- 		curr.elevation,
-- 		curr.elevation_uom,
-- 		curr.elevation_nilreason,
-- 		curr.geoidundulation,
-- 		curr.geoidundulation_uom,
-- 		curr.geoidundulation_nilreason,
-- 		curr.horizontalaccuracy,
-- 		curr.horizontalaccuracy_uom,
-- 		curr.horizontalaccuracy_nilreason,
-- 		curr.verticalaccuracy,
-- 		curr.verticalaccuracy_uom,
-- 		curr.verticalaccuracy_nilreason,
-- 		curr.verticaldatum,
-- 		curr.verticaldatum_nilreason,
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 		g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, before.geom) 
-- 		AND 
-- 		ST_Intersects(curr.geom, curr.end_segment)
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation != 4
-- 	UNION ALL
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment, curr.start_segment])) AS geom,
-- 		curr.elevation,
-- 		curr.elevation_uom,
-- 		curr.elevation_nilreason,
-- 		curr.geoidundulation,
-- 		curr.geoidundulation_uom,
-- 		curr.geoidundulation_nilreason,
-- 		curr.horizontalaccuracy,
-- 		curr.horizontalaccuracy_uom,
-- 		curr.horizontalaccuracy_nilreason,
-- 		curr.verticalaccuracy,
-- 		curr.verticalaccuracy_uom,
-- 		curr.verticalaccuracy_nilreason,
-- 		curr.verticaldatum,
-- 		curr.verticaldatum_nilreason,
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 	g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, curr.start_segment) 
-- 		AND 
-- 		ST_Intersects(curr.geom, curr.end_segment)
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation != 4
-- 	UNION ALL
-- 	SELECT
-- 		g2_segment.id, 
-- 		g2_segment.xml_id,
-- 		g2_segment.curve_xml_id,
-- 		g2_segment.part,
-- 		g2_segment.increment,
-- 		g2_segment.geom,
-- 		g2_segment.elevation,
-- 		g2_segment.elevation_uom,
-- 		g2_segment.elevation_nilreason,
-- 		g2_segment.geoidundulation,
-- 		g2_segment.geoidundulation_uom,
-- 		g2_segment.geoidundulation_nilreason,
-- 		g2_segment.horizontalaccuracy,
-- 		g2_segment.horizontalaccuracy_uom,
-- 		g2_segment.horizontalaccuracy_nilreason,
-- 		g2_segment.verticalaccuracy,
-- 		g2_segment.verticalaccuracy_uom,
-- 		g2_segment.verticalaccuracy_nilreason,
-- 		g2_segment.verticaldatum,
-- 		g2_segment.verticaldatum_nilreason,
-- 		g2_segment.nilreason
-- 	FROM 
-- 		g2_segment
-- 	WHERE 
-- 		g2_segment.interpretation != 4
-- 	ORDER BY
-- 		id, 
-- 		xml_id, 
-- 		part,
-- 		increment
-- ),
-- r1 AS (
-- 	SELECT
-- 		partial_elevated_surface_view.id,
-- 		partial_elevated_surface_view.xml_id,
-- 		partial_elevated_surface_view.curve_xml_id,
-- 		partial_elevated_surface_view.part,
-- 		partial_elevated_surface_view.geom,
-- 		partial_elevated_surface_view.elevation,
-- 		partial_elevated_surface_view.elevation_uom,
-- 		partial_elevated_surface_view.elevation_nilreason,
-- 		partial_elevated_surface_view.geoidundulation,
-- 		partial_elevated_surface_view.geoidundulation_uom,
-- 		partial_elevated_surface_view.geoidundulation_nilreason,
-- 		partial_elevated_surface_view.horizontalaccuracy,
-- 		partial_elevated_surface_view.horizontalaccuracy_uom,
-- 		partial_elevated_surface_view.horizontalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticalaccuracy,
-- 		partial_elevated_surface_view.verticalaccuracy_uom,
-- 		partial_elevated_surface_view.verticalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticaldatum,
-- 		partial_elevated_surface_view.verticaldatum_nilreason,
-- 		partial_elevated_surface_view.nilreason
-- 	FROM
-- 		partial_elevated_surface_view
-- 	WHERE
-- 		ST_IsClosed(partial_elevated_surface_view.geom) = true
-- 		AND 
-- 		partial_elevated_surface_view.total_count = 1
-- 		AND 
-- 		ST_NPoints(geom) >= 4
-- ),
-- r2 AS (
-- 	SELECT
-- 		partial_elevated_surface_view.id,
-- 		partial_elevated_surface_view.xml_id,
-- 		partial_elevated_surface_view.curve_xml_id,
-- 		partial_elevated_surface_view.part,
-- 		ST_AddPoint(partial_elevated_surface_view.geom, ST_StartPoint(partial_elevated_surface_view.geom)) AS geom,
-- 		partial_elevated_surface_view.elevation,
-- 		partial_elevated_surface_view.elevation_uom,
-- 		partial_elevated_surface_view.elevation_nilreason,
-- 		partial_elevated_surface_view.geoidundulation,
-- 		partial_elevated_surface_view.geoidundulation_uom,
-- 		partial_elevated_surface_view.geoidundulation_nilreason,
-- 		partial_elevated_surface_view.horizontalaccuracy,
-- 		partial_elevated_surface_view.horizontalaccuracy_uom,
-- 		partial_elevated_surface_view.horizontalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticalaccuracy,
-- 		partial_elevated_surface_view.verticalaccuracy_uom,
-- 		partial_elevated_surface_view.verticalaccuracy_nilreason,
-- 		partial_elevated_surface_view.verticaldatum,
-- 		partial_elevated_surface_view.verticaldatum_nilreason,
-- 		partial_elevated_surface_view.nilreason
-- 	FROM
-- 		partial_elevated_surface_view
-- 	WHERE
-- 		ST_IsClosed(partial_elevated_surface_view.geom) = false
-- 		AND 
-- 		partial_elevated_surface_view.total_count = 1
-- 		AND 
-- 		ST_NPoints(ST_AddPoint(partial_elevated_surface_view.geom, ST_StartPoint(partial_elevated_surface_view.geom))) >= 4		
-- ),
-- g1 AS (
-- 	SELECT 
-- 		ring.id,
-- 		ring.xml_id || geoborder.xml_id AS xml_id,
-- 		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
-- 		ring.part,
-- 		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
-- 		ring.elevation,
-- 		ring.elevation_uom,
-- 		ring.elevation_nilreason,
-- 		ring.geoidundulation,
-- 		ring.geoidundulation_uom,
-- 		ring.geoidundulation_nilreason,
-- 		ring.horizontalaccuracy,
-- 		ring.horizontalaccuracy_uom,
-- 		ring.horizontalaccuracy_nilreason,
-- 		ring.verticalaccuracy,
-- 		ring.verticalaccuracy_uom,
-- 		ring.verticalaccuracy_nilreason,
-- 		ring.verticaldatum,
-- 		ring.verticaldatum_nilreason,
-- 		ring.nilreason
-- 	FROM
-- 	g1_segment ring
-- 	JOIN
-- 	g1_segment geoborder
-- 	ON 
-- 		ring.xml_id = geoborder.xml_id
-- 		AND
-- 		geoborder.part = geoborder.part
-- 		AND 
-- 		ring.increment <> geoborder.increment
-- 	WHERE
-- 		ST_Intersects(geoborder.geom, geoborder.start_segment) 
-- 		AND 
-- 		ST_Intersects(geoborder.geom, geoborder.end_segment)
-- 		AND 
-- 		NOT ST_Intersects(geoborder.start_segment, geoborder.end_segment)
-- 		AND
-- 		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
-- 	UNION ALL
-- 	SELECT DISTINCT 
-- 		ring.id,
-- 		ring.xml_id || geoborder.xml_id AS xml_id,
-- 		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
-- 		ring.part,
-- 		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
-- 		ring.elevation,
-- 		ring.elevation_uom,
-- 		ring.elevation_nilreason,
-- 		ring.geoidundulation,
-- 		ring.geoidundulation_uom,
-- 		ring.geoidundulation_nilreason,
-- 		ring.horizontalaccuracy,
-- 		ring.horizontalaccuracy_uom,
-- 		ring.horizontalaccuracy_nilreason,
-- 		ring.verticalaccuracy,
-- 		ring.verticalaccuracy_uom,
-- 		ring.verticalaccuracy_nilreason,
-- 		ring.verticaldatum,
-- 		ring.verticaldatum_nilreason,
-- 		ring.nilreason
-- 	FROM
-- 	g1_segment ring
-- 	JOIN
-- 	g1_segment geoborder
-- 	ON 
-- 		ring.xml_id = geoborder.xml_id
-- 		AND
-- 		geoborder.part = geoborder.part
-- 		AND 
-- 		ring.increment <> geoborder.increment
-- 	WHERE
-- 		ST_Intersects(geoborder.geom, geoborder.start_segment) 
-- 		AND 
-- 		ST_Intersects(geoborder.geom, geoborder.end_segment)
-- 		AND 
-- 		ST_Intersects(geoborder.start_segment, geoborder.end_segment)
-- 		AND
-- 		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
-- ),
-- g2 AS (	
-- 	SELECT 
-- 		MIN(g2_segment_filtered.id) AS id,
-- 		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
-- 		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
-- 		MIN(g2_segment_filtered.part) AS part,
-- 		ST_LineMerge(ST_Collect(g2_segment_filtered.geom)) AS geom,
-- 		MAX(g2_segment_filtered.elevation) AS elevation,
-- 		MAX(g2_segment_filtered.elevation_uom) AS elevation_uom,
-- 		MAX(g2_segment_filtered.elevation_nilreason) AS elevation_nilreason,
-- 		MAX(g2_segment_filtered.geoidundulation) AS geoidundulation,
-- 		MAX(g2_segment_filtered.geoidundulation_uom) AS geoidundulation_uom,
-- 		MAX(g2_segment_filtered.geoidundulation_nilreason) AS geoidundulation_nilreason,
-- 		MAX(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
-- 		MAX(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
-- 		MAX(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
-- 		MAX(g2_segment_filtered.verticalaccuracy) AS verticalaccuracy,
-- 		MAX(g2_segment_filtered.verticalaccuracy_uom) AS verticalaccuracy_uom,
-- 		MAX(g2_segment_filtered.verticalaccuracy_nilreason) AS verticalaccuracy_nilreason,
-- 		MAX(g2_segment_filtered.verticaldatum) AS verticaldatum,
-- 		MAX(g2_segment_filtered.verticaldatum_nilreason) AS verticaldatum_nilreason,
-- 		MAX(g2_segment_filtered.nilreason) AS nilreason
-- 	FROM
-- 		g2_segment_filtered
-- 	GROUP BY
-- 		g2_segment_filtered.id,
-- 		g2_segment_filtered.xml_id,
-- 		g2_segment_filtered.part
-- 	HAVING
-- 		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = true
-- 		AND
-- 		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
-- 		AND 
-- 		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
-- 	UNION ALL
-- 	SELECT 
-- 		MIN(g2_segment_filtered.id) AS id,
-- 		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
-- 		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
-- 		MIN(g2_segment_filtered.part) AS part,
-- 		ST_AddPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)), ST_StartPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)))) AS geom,
-- 		MAX(g2_segment_filtered.elevation) AS elevation,
-- 		MAX(g2_segment_filtered.elevation_uom) AS elevation_uom,
-- 		MAX(g2_segment_filtered.elevation_nilreason) AS elevation_nilreason,
-- 		MAX(g2_segment_filtered.geoidundulation) AS geoidundulation,
-- 		MAX(g2_segment_filtered.geoidundulation_uom) AS geoidundulation_uom,
-- 		MAX(g2_segment_filtered.geoidundulation_nilreason) AS geoidundulation_nilreason,
-- 		MAX(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
-- 		MAX(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
-- 		MAX(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
-- 		MAX(g2_segment_filtered.verticalaccuracy) AS verticalaccuracy,
-- 		MAX(g2_segment_filtered.verticalaccuracy_uom) AS verticalaccuracy_uom,
-- 		MAX(g2_segment_filtered.verticalaccuracy_nilreason) AS verticalaccuracy_nilreason,
-- 		MAX(g2_segment_filtered.verticaldatum) AS verticaldatum,
-- 		MAX(g2_segment_filtered.verticaldatum_nilreason) AS verticaldatum_nilreason,
-- 		MAX(g2_segment_filtered.nilreason) AS nilreason
-- 	FROM
-- 		g2_segment_filtered
-- 	GROUP BY
-- 		g2_segment_filtered.id,
-- 		g2_segment_filtered.xml_id,
-- 		g2_segment_filtered.part
-- 	HAVING
-- 		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = false
-- 		AND
-- 		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
-- 		AND 
-- 		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
-- ),
-- combined_data AS (
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
-- 		geom,
-- 		part,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         r1
--     UNION ALL
--     SELECT 
--         id, 
--         xml_id,
-- 		curve_xml_id,
--         geom,
--         part,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         r2
--     UNION ALL
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         geom,
--         part,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         g1
--     UNION ALL
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         geom,
--         part,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         g2
-- ),
-- outer_shells AS (
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         ST_MakePolygon(geom) AS geom,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         combined_data
--     WHERE 
--         part = 0
-- ),
-- inner_shells AS (
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         geom,
-- 		elevation,
-- 		elevation_uom,
-- 		elevation_nilreason,
-- 		geoidundulation,
-- 		geoidundulation_uom,
-- 		geoidundulation_nilreason,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		verticalaccuracy,
-- 		verticalaccuracy_uom,
-- 		verticalaccuracy_nilreason,
-- 		verticaldatum,
-- 		verticaldatum_nilreason,
-- 		nilreason
--     FROM 
--         combined_data
--     WHERE 
--         part <> 0
-- )
-- SELECT 
--     outer_shells.id, 
--     ST_MakePolygon(
--         ST_ExteriorRing(outer_shells.geom),
--         ARRAY(
--             SELECT ST_ExteriorRing(inner_shells.geom)
--             FROM inner_shells 
--             WHERE inner_shells.id = outer_shells.id
--         )
--     ) AS geom,
-- 	COALESCE(outer_shells.elevation || ' ' || outer_shells.elevation_uom, '(' || outer_shells.elevation_nilreason || ')') AS elevation,
-- 	COALESCE(outer_shells.geoidundulation || ' ' || outer_shells.geoidundulation_uom, '(' || outer_shells.geoidundulation_nilreason || ')') AS geoidUndulation,
-- 	COALESCE(outer_shells.verticaldatum || ' ' || outer_shells.outer_shells.geoidundulation_uom, '(' || outer_shells.geoidundulation_nilreason || ')') AS verticalDatum,
-- 	COALESCE(CAST(outer_shells.verticalaccuracy AS varchar), '(' || outer_shells.verticaldatum_nilreason || ')') AS verticalAccuracy,
-- 	COALESCE(outer_shells.horizontalaccuracy || ' ' || outer_shells.horizontalaccuracy_uom, '(' || outer_shells.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
-- FROM 
-- outer_shells;

-- CREATE INDEX ON geometry.elevatedsurface_view (id);

DROP MATERIALIZED VIEW IF EXISTS geometry.elevatedsurface_view CASCADE;

CREATE MATERIALIZED VIEW geometry.elevatedsurface_view AS

SELECT 
0 AS id,
ST_GeomFromText('POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))', 4326) AS geom,
0 AS elevation,
0 AS geoidUndulation,
0 AS verticalDatum,
0 AS verticalAccuracy,
0 AS horizontalAccuracy;
-- EquipmentUnavailableAdjustmentColumnPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.equipmentunavailableadjustmentcolumn_view cascade;
create materialized view procedure.equipmentunavailableadjustmentcolumn_view as
select
    procedure.equipmentunavailableadjustmentcolumn_pt.id,
    procedure.equipmentunavailableadjustmentcolumn_pt.nilreason AS equipmentunavailableadjustmentcolumn_nilreason,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_nilreason || ')') as guidanceequipment,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_nilreason || ')') as landingsystemlights,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_nilreason || ')') as equipmentrvr,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_nilreason || ')') as approachlightinginoperative,
    coalesce(cast(procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_value as varchar) || ' ' || procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_uom, '(' || procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_nilreason || ')') as visibilityadjustment,
    lat_annotation.annotation as annotation
from procedure.equipmentunavailableadjustmentcolumn_pt 
inner join procedure.equipmentunavailableadjustmentcolumn on procedure.equipmentunavailableadjustmentcolumn_pt.equipmentunavailableadjustmentcolumn_id = procedure.equipmentunavailableadjustmentcolumn.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xvzoig.*) AS annotation
  from master_join master_join_zpjkki
  join notes.note_view notes_note_view_xvzoig on master_join_zpjkki.target_id = notes_note_view_xvzoig.id
  where master_join_zpjkki.source_id = procedure.equipmentunavailableadjustmentcolumn.id
) as lat_annotation on TRUE;
create index on procedure.equipmentunavailableadjustmentcolumn_view (id);
-- EquipmentUnavailableAdjustmentPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.equipmentunavailableadjustment_view cascade;
create materialized view procedure.equipmentunavailableadjustment_view as
select
    procedure.equipmentunavailableadjustment_pt.id,
    procedure.equipmentunavailableadjustment_pt.nilreason AS equipmentunavailableadjustment_nilreason,
    coalesce(cast(procedure.equipmentunavailableadjustment.type_value as varchar), '(' || procedure.equipmentunavailableadjustment.type_nilreason || ')') as type,
    coalesce(cast(procedure.equipmentunavailableadjustment.approachlightinginoperative_value as varchar), '(' || procedure.equipmentunavailableadjustment.approachlightinginoperative_nilreason || ')') as approachlightinginoperative,
    lat_adjustmentinopcol.lat_adjustmentinopcol as adjustmentinopcol,
    lat_annotation.annotation as annotation
from procedure.equipmentunavailableadjustment_pt 
inner join procedure.equipmentunavailableadjustment on procedure.equipmentunavailableadjustment_pt.equipmentunavailableadjustment_id = procedure.equipmentunavailableadjustment.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_equipmentunavailableadjustmentcolumn_pt_xxxjwj.id) as lat_adjustmentinopcol
  from master_join master_join_zwtfyu
  join procedure.equipmentunavailableadjustmentcolumn_pt procedure_equipmentunavailableadjustmentcolumn_pt_xxxjwj on master_join_zwtfyu.target_id = procedure_equipmentunavailableadjustmentcolumn_pt_xxxjwj.id
  where master_join_zwtfyu.source_id = procedure.equipmentunavailableadjustment.id
) as lat_adjustmentinopcol on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_geooiy.*) AS annotation
  from master_join master_join_mzmowg
  join notes.note_view notes_note_view_geooiy on master_join_mzmowg.target_id = notes_note_view_geooiy.id
  where master_join_mzmowg.source_id = procedure.equipmentunavailableadjustment.id
) as lat_annotation on TRUE;
create index on procedure.equipmentunavailableadjustment_view (id);
-- FASDataBlockPropertyType
-- ['notes.note_view']
drop materialized view if exists public.fasdatablock_view cascade;
create materialized view public.fasdatablock_view as
select
    public.fasdatablock_pt.id,
    public.fasdatablock_pt.nilreason AS fasdatablock_nilreason,
    coalesce(cast(public.fasdatablock.horizontalalarmlimit_value as varchar), '(' || public.fasdatablock.horizontalalarmlimit_nilreason || ')') as horizontalalarmlimit,
    coalesce(cast(public.fasdatablock.verticalalarmlimit_value as varchar), '(' || public.fasdatablock.verticalalarmlimit_nilreason || ')') as verticalalarmlimit,
    coalesce(cast(public.fasdatablock.crcremainder_value as varchar), '(' || public.fasdatablock.crcremainder_nilreason || ')') as crcremainder,
    coalesce(cast(public.fasdatablock.operationtype_value as varchar), '(' || public.fasdatablock.operationtype_nilreason || ')') as operationtype,
    coalesce(cast(public.fasdatablock.serviceprovidersbas_value as varchar), '(' || public.fasdatablock.serviceprovidersbas_nilreason || ')') as serviceprovidersbas,
    coalesce(cast(public.fasdatablock.approachperformancedesignator_value as varchar), '(' || public.fasdatablock.approachperformancedesignator_nilreason || ')') as approachperformancedesignator,
    coalesce(cast(public.fasdatablock.referencepathdataselector_value as varchar), '(' || public.fasdatablock.referencepathdataselector_nilreason || ')') as referencepathdataselector,
    coalesce(cast(public.fasdatablock.thresholdcoursewidth_value as varchar) || ' ' || public.fasdatablock.thresholdcoursewidth_uom, '(' || public.fasdatablock.thresholdcoursewidth_nilreason || ')') as thresholdcoursewidth,
    coalesce(cast(public.fasdatablock.lengthoffset_value as varchar) || ' ' || public.fasdatablock.lengthoffset_uom, '(' || public.fasdatablock.lengthoffset_nilreason || ')') as lengthoffset,
    lat_annotation.annotation as annotation
from public.fasdatablock_pt 
inner join public.fasdatablock on public.fasdatablock_pt.fasdatablock_id = public.fasdatablock.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ohfnch.*) AS annotation
  from master_join master_join_qdyadt
  join notes.note_view notes_note_view_ohfnch on master_join_qdyadt.target_id = notes_note_view_ohfnch.id
  where master_join_qdyadt.source_id = public.fasdatablock.id
) as lat_annotation on TRUE;
create index on public.fasdatablock_view (id);
-- FinalProfilePropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.finalprofile_view cascade;
create materialized view procedure.finalprofile_view as
select
    procedure.finalprofile_pt.id,
    procedure.finalprofile_pt.nilreason AS finalprofile_nilreason,
    lat_altitude.lat_altitude as altitude,
    lat_distance.lat_distance as distance,
    lat_timing.lat_timing as timing,
    lat_annotation.annotation as annotation
from procedure.finalprofile_pt 
inner join procedure.finalprofile on procedure.finalprofile_pt.finalprofile_id = procedure.finalprofile.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_approachaltitudetable_pt_sdfusw.id) as lat_altitude
  from master_join master_join_kjxrfs
  join procedure.approachaltitudetable_pt procedure_approachaltitudetable_pt_sdfusw on master_join_kjxrfs.target_id = procedure_approachaltitudetable_pt_sdfusw.id
  where master_join_kjxrfs.source_id = procedure.finalprofile.id
) as lat_altitude on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_approachdistancetable_pt_qsrjad.id) as lat_distance
  from master_join master_join_ivvvtd
  join procedure.approachdistancetable_pt procedure_approachdistancetable_pt_qsrjad on master_join_ivvvtd.target_id = procedure_approachdistancetable_pt_qsrjad.id
  where master_join_ivvvtd.source_id = procedure.finalprofile.id
) as lat_distance on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_approachtimingtable_pt_puuygq.id) as lat_timing
  from master_join master_join_wxbtfh
  join procedure.approachtimingtable_pt procedure_approachtimingtable_pt_puuygq on master_join_wxbtfh.target_id = procedure_approachtimingtable_pt_puuygq.id
  where master_join_wxbtfh.source_id = procedure.finalprofile.id
) as lat_timing on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_onfncq.*) AS annotation
  from master_join master_join_urofjy
  join notes.note_view notes_note_view_onfncq on master_join_urofjy.target_id = notes_note_view_onfncq.id
  where master_join_urofjy.source_id = procedure.finalprofile.id
) as lat_annotation on TRUE;
create index on procedure.finalprofile_view (id);
-- FlightCharacteristicPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.flightcharacteristic_view cascade;
create materialized view shared.flightcharacteristic_view as
select
    shared.flightcharacteristic_pt.id,
    shared.flightcharacteristic_pt.nilreason AS flightcharacteristic_nilreason,
    coalesce(cast(shared.flightcharacteristic.type_value as varchar), '(' || shared.flightcharacteristic.type_nilreason || ')') as type,
    coalesce(cast(shared.flightcharacteristic.rule_value as varchar), '(' || shared.flightcharacteristic.rule_nilreason || ')') as rule,
    coalesce(cast(shared.flightcharacteristic.status_value as varchar), '(' || shared.flightcharacteristic.status_nilreason || ')') as status,
    coalesce(cast(shared.flightcharacteristic.military_value as varchar), '(' || shared.flightcharacteristic.military_nilreason || ')') as military,
    coalesce(cast(shared.flightcharacteristic.origin_value as varchar), '(' || shared.flightcharacteristic.origin_nilreason || ')') as origin,
    coalesce(cast(shared.flightcharacteristic.purpose_value as varchar), '(' || shared.flightcharacteristic.purpose_nilreason || ')') as purpose,
    lat_annotation.annotation as annotation
from shared.flightcharacteristic_pt 
inner join shared.flightcharacteristic on shared.flightcharacteristic_pt.flightcharacteristic_id = shared.flightcharacteristic.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ibaqkp.*) AS annotation
  from master_join master_join_tqyspr
  join notes.note_view notes_note_view_ibaqkp on master_join_tqyspr.target_id = notes_note_view_ibaqkp.id
  where master_join_tqyspr.source_id = shared.flightcharacteristic.id
) as lat_annotation on TRUE;
create index on shared.flightcharacteristic_view (id);
-- FlightConditionCircumstancePropertyType
-- ['notes.note_view']
drop materialized view if exists routes.flightconditioncircumstance_view cascade;
create materialized view routes.flightconditioncircumstance_view as
select
    routes.flightconditioncircumstance_pt.id,
    routes.flightconditioncircumstance_pt.nilreason AS flightconditioncircumstance_nilreason,
    coalesce(cast(routes.flightconditioncircumstance.referencelocation_value as varchar), '(' || routes.flightconditioncircumstance.referencelocation_nilreason || ')') as referencelocation,
    coalesce(cast(routes.flightconditioncircumstance.relationwithlocation_value as varchar), '(' || routes.flightconditioncircumstance.relationwithlocation_nilreason || ')') as relationwithlocation,
    lat_annotation.annotation as annotation
from routes.flightconditioncircumstance_pt 
inner join routes.flightconditioncircumstance on routes.flightconditioncircumstance_pt.flightconditioncircumstance_id = routes.flightconditioncircumstance.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_enrddd.*) AS annotation
  from master_join master_join_haegix
  join notes.note_view notes_note_view_enrddd on master_join_haegix.target_id = notes_note_view_enrddd.id
  where master_join_haegix.source_id = routes.flightconditioncircumstance.id
) as lat_annotation on TRUE;
create index on routes.flightconditioncircumstance_view (id);
-- FlightRestrictionLevelPropertyType
-- ['notes.note_view']
drop materialized view if exists routes.flightrestrictionlevel_view cascade;
create materialized view routes.flightrestrictionlevel_view as
select
    routes.flightrestrictionlevel_pt.id,
    routes.flightrestrictionlevel_pt.nilreason AS flightrestrictionlevel_nilreason,
    coalesce(cast(routes.flightrestrictionlevel.upperlevelreference_value as varchar), '(' || routes.flightrestrictionlevel.upperlevelreference_nilreason || ')') as upperlevelreference,
    coalesce(cast(routes.flightrestrictionlevel.lowerlevelreference_value as varchar), '(' || routes.flightrestrictionlevel.lowerlevelreference_nilreason || ')') as lowerlevelreference,
    coalesce(cast(routes.flightrestrictionlevel.upperlevel_value as varchar) || ' ' || routes.flightrestrictionlevel.upperlevel_uom, '(' || routes.flightrestrictionlevel.upperlevel_nilreason || ')') as upperlevel,
    coalesce(cast(routes.flightrestrictionlevel.lowerlevel_value as varchar) || ' ' || routes.flightrestrictionlevel.lowerlevel_uom, '(' || routes.flightrestrictionlevel.lowerlevel_nilreason || ')') as lowerlevel,
    lat_annotation.annotation as annotation
from routes.flightrestrictionlevel_pt 
inner join routes.flightrestrictionlevel on routes.flightrestrictionlevel_pt.flightrestrictionlevel_id = routes.flightrestrictionlevel.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_quvayd.*) AS annotation
  from master_join master_join_kfnjgb
  join notes.note_view notes_note_view_quvayd on master_join_kfnjgb.target_id = notes_note_view_quvayd.id
  where master_join_kfnjgb.source_id = routes.flightrestrictionlevel.id
) as lat_annotation on TRUE;
create index on routes.flightrestrictionlevel_view (id);
-- FuelPropertyType
-- ['notes.note_view']
drop materialized view if exists service.fuel_view cascade;
create materialized view service.fuel_view as
select
    service.fuel_pt.id,
    service.fuel_pt.nilreason AS fuel_nilreason,
    coalesce(cast(service.fuel.category_value as varchar), '(' || service.fuel.category_nilreason || ')') as category,
    lat_annotation.annotation as annotation
from service.fuel_pt 
inner join service.fuel on service.fuel_pt.fuel_id = service.fuel.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ybqfbv.*) AS annotation
  from master_join master_join_bargmi
  join notes.note_view notes_note_view_ybqfbv on master_join_bargmi.target_id = notes_note_view_ybqfbv.id
  where master_join_bargmi.source_id = service.fuel.id
) as lat_annotation on TRUE;
create index on service.fuel_view (id);
-- HoldingPatternDistancePropertyType
-- ['notes.note_view']
drop materialized view if exists holding.holdingpatterndistance_view cascade;
create materialized view holding.holdingpatterndistance_view as
select
    holding.holdingpatterndistance_pt.id,
    holding.holdingpatterndistance_pt.nilreason AS holdingpatterndistance_nilreason,
    coalesce(cast(holding.holdingpatterndistance.length_value as varchar) || ' ' || holding.holdingpatterndistance.length_uom, '(' || holding.holdingpatterndistance.length_nilreason || ')') as length,
    lat_annotation.annotation as annotation
from holding.holdingpatterndistance_pt 
inner join holding.holdingpatterndistance on holding.holdingpatterndistance_pt.holdingpatterndistance_id = holding.holdingpatterndistance.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qhqpwv.*) AS annotation
  from master_join master_join_povlzf
  join notes.note_view notes_note_view_qhqpwv on master_join_povlzf.target_id = notes_note_view_qhqpwv.id
  where master_join_povlzf.source_id = holding.holdingpatterndistance.id
) as lat_annotation on TRUE;
create index on holding.holdingpatterndistance_view (id);
-- HoldingPatternDurationPropertyType
-- ['notes.note_view']
drop materialized view if exists holding.holdingpatternduration_view cascade;
create materialized view holding.holdingpatternduration_view as
select
    holding.holdingpatternduration_pt.id,
    holding.holdingpatternduration_pt.nilreason AS holdingpatternduration_nilreason,
    coalesce(cast(holding.holdingpatternduration.duration_value as varchar) || ' ' || holding.holdingpatternduration.duration_uom, '(' || holding.holdingpatternduration.duration_nilreason || ')') as duration,
    lat_annotation.annotation as annotation
from holding.holdingpatternduration_pt 
inner join holding.holdingpatternduration on holding.holdingpatternduration_pt.holdingpatternduration_id = holding.holdingpatternduration.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gxmgfh.*) AS annotation
  from master_join master_join_nhwkwn
  join notes.note_view notes_note_view_gxmgfh on master_join_nhwkwn.target_id = notes_note_view_gxmgfh.id
  where master_join_nhwkwn.source_id = holding.holdingpatternduration.id
) as lat_annotation on TRUE;
create index on holding.holdingpatternduration_view (id);
-- HoldingUsePropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.holdinguse_view cascade;
create materialized view procedure.holdinguse_view as
select
    procedure.holdinguse_pt.id,
    procedure.holdinguse_pt.nilreason AS holdinguse_nilreason,
    coalesce(cast(procedure.holdinguse.holdinguse_value as varchar), '(' || procedure.holdinguse.holdinguse_nilreason || ')') as holdinguse,
    coalesce(cast(procedure.holdinguse.instruction_value as varchar), '(' || procedure.holdinguse.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.holdinguse.instructionaltitudereference_value as varchar), '(' || procedure.holdinguse.instructionaltitudereference_nilreason || ')') as instructionaltitudereference,
    coalesce(cast(procedure.holdinguse.instructedaltitude_value as varchar) || ' ' || procedure.holdinguse.instructedaltitude_uom, '(' || procedure.holdinguse.instructedaltitude_nilreason || ')') as instructedaltitude,
    coalesce(cast(holding_holdingpattern_pt_kldpmt.title as varchar), '(' || holding_holdingpattern_pt_kldpmt.nilreason[1] || ')') AS theholdingpattern,
    holding_holdingpattern_pt_kldpmt.href AS theholdingpattern_href,
    lat_annotation.annotation as annotation
from procedure.holdinguse_pt 
inner join procedure.holdinguse on procedure.holdinguse_pt.holdinguse_id = procedure.holdinguse.id
left join holding.holdingpattern_pt holding_holdingpattern_pt_kldpmt on procedure.holdinguse.theholdingpattern_id = holding_holdingpattern_pt_kldpmt.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pfkfhl.*) AS annotation
  from master_join master_join_gkdkfk
  join notes.note_view notes_note_view_pfkfhl on master_join_gkdkfk.target_id = notes_note_view_pfkfhl.id
  where master_join_gkdkfk.source_id = procedure.holdinguse.id
) as lat_annotation on TRUE;
create index on procedure.holdinguse_view (id);
-- LandingTakeoffAreaCollectionPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.landingtakeoffareacollection_view cascade;
create materialized view procedure.landingtakeoffareacollection_view as
select
    procedure.landingtakeoffareacollection_pt.id,
    procedure.landingtakeoffareacollection_pt.nilreason AS landingtakeoffareacollection_nilreason,
    lat_runway.lat_runway as runway,
    lat_tlof.lat_tlof as tlof,
    lat_annotation.annotation as annotation
from procedure.landingtakeoffareacollection_pt 
inner join procedure.landingtakeoffareacollection on procedure.landingtakeoffareacollection_pt.landingtakeoffareacollection_id = procedure.landingtakeoffareacollection.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runwaydirection_pt_jdwikc.id,
      'title', coalesce(cast(airport_heliport_runwaydirection_pt_jdwikc.title AS varchar), '(' || airport_heliport_runwaydirection_pt_jdwikc.nilreason[1] || ')'),
      'href', airport_heliport_runwaydirection_pt_jdwikc.href
  )) as lat_runway  from master_join master_join_bootqg
  join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_jdwikc on master_join_bootqg.target_id = airport_heliport_runwaydirection_pt_jdwikc.id
  where master_join_bootqg.source_id = procedure.landingtakeoffareacollection.id
) as lat_runway on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_touchdownliftoff_pt_wcvppt.id,
      'title', coalesce(cast(airport_heliport_touchdownliftoff_pt_wcvppt.title AS varchar), '(' || airport_heliport_touchdownliftoff_pt_wcvppt.nilreason[1] || ')'),
      'href', airport_heliport_touchdownliftoff_pt_wcvppt.href
  )) as lat_tlof  from master_join master_join_qavnlx
  join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_wcvppt on master_join_qavnlx.target_id = airport_heliport_touchdownliftoff_pt_wcvppt.id
  where master_join_qavnlx.source_id = procedure.landingtakeoffareacollection.id
) as lat_tlof on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ihiods.*) AS annotation
  from master_join master_join_jdamaw
  join notes.note_view notes_note_view_ihiods on master_join_jdamaw.target_id = notes_note_view_ihiods.id
  where master_join_jdamaw.source_id = procedure.landingtakeoffareacollection.id
) as lat_annotation on TRUE;
create index on procedure.landingtakeoffareacollection_view (id);
-- LightActivationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.lightactivation_view cascade;
create materialized view airport_heliport.lightactivation_view as
select
    airport_heliport.lightactivation_pt.id,
    airport_heliport.lightactivation_pt.nilreason AS lightactivation_nilreason,
    coalesce(cast(airport_heliport.lightactivation.clicks_value as varchar), '(' || airport_heliport.lightactivation.clicks_nilreason || ')') as clicks,
    coalesce(cast(airport_heliport.lightactivation.intensitylevel_value as varchar), '(' || airport_heliport.lightactivation.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.lightactivation.activation_value as varchar), '(' || airport_heliport.lightactivation.activation_nilreason || ')') as activation,
    lat_annotation.annotation as annotation
from airport_heliport.lightactivation_pt 
inner join airport_heliport.lightactivation on airport_heliport.lightactivation_pt.lightactivation_id = airport_heliport.lightactivation.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_njkrcp.*) AS annotation
  from master_join master_join_nkyftg
  join notes.note_view notes_note_view_njkrcp on master_join_nkyftg.target_id = notes_note_view_njkrcp.id
  where master_join_nkyftg.source_id = airport_heliport.lightactivation.id
) as lat_annotation on TRUE;
create index on airport_heliport.lightactivation_view (id);
-- MeteorologyPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.meteorology_view cascade;
create materialized view shared.meteorology_view as
select
    shared.meteorology_pt.id,
    shared.meteorology_pt.nilreason AS meteorology_nilreason,
    coalesce(cast(shared.meteorology.flightconditions_value as varchar), '(' || shared.meteorology.flightconditions_nilreason || ')') as flightconditions,
    coalesce(cast(shared.meteorology.visibilityinterpretation_value as varchar), '(' || shared.meteorology.visibilityinterpretation_nilreason || ')') as visibilityinterpretation,
    coalesce(cast(shared.meteorology.runwayvisualrangeinterpretation_value as varchar), '(' || shared.meteorology.runwayvisualrangeinterpretation_nilreason || ')') as runwayvisualrangeinterpretation,
    coalesce(cast(shared.meteorology.visibility_value as varchar) || ' ' || shared.meteorology.visibility_uom, '(' || shared.meteorology.visibility_nilreason || ')') as visibility,
    coalesce(cast(shared.meteorology.runwayvisualrange_value as varchar) || ' ' || shared.meteorology.runwayvisualrange_uom, '(' || shared.meteorology.runwayvisualrange_nilreason || ')') as runwayvisualrange,
    lat_annotation.annotation as annotation
from shared.meteorology_pt 
inner join shared.meteorology on shared.meteorology_pt.meteorology_id = shared.meteorology.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_aztgsn.*) AS annotation
  from master_join master_join_xwbifk
  join notes.note_view notes_note_view_aztgsn on master_join_xwbifk.target_id = notes_note_view_aztgsn.id
  where master_join_xwbifk.source_id = shared.meteorology.id
) as lat_annotation on TRUE;
create index on shared.meteorology_view (id);
-- MinimaPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.minima_view cascade;
create materialized view procedure.minima_view as
select
    procedure.minima_pt.id,
    procedure.minima_pt.nilreason AS minima_nilreason,
    coalesce(cast(procedure.minima.altitudecode_value as varchar), '(' || procedure.minima.altitudecode_nilreason || ')') as altitudecode,
    coalesce(cast(procedure.minima.altitudereference_value as varchar), '(' || procedure.minima.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(procedure.minima.heightcode_value as varchar), '(' || procedure.minima.heightcode_nilreason || ')') as heightcode,
    coalesce(cast(procedure.minima.heightreference_value as varchar), '(' || procedure.minima.heightreference_nilreason || ')') as heightreference,
    coalesce(cast(procedure.minima.mandatoryrvr_value as varchar), '(' || procedure.minima.mandatoryrvr_nilreason || ')') as mandatoryrvr,
    coalesce(cast(procedure.minima.remotealtimeterminima_value as varchar), '(' || procedure.minima.remotealtimeterminima_nilreason || ')') as remotealtimeterminima,
    coalesce(cast(procedure.minima.altitude_value as varchar) || ' ' || procedure.minima.altitude_uom, '(' || procedure.minima.altitude_nilreason || ')') as altitude,
    coalesce(cast(procedure.minima.height_value as varchar) || ' ' || procedure.minima.height_uom, '(' || procedure.minima.height_nilreason || ')') as height,
    coalesce(cast(procedure.minima.militaryheight_value as varchar) || ' ' || procedure.minima.militaryheight_uom, '(' || procedure.minima.militaryheight_nilreason || ')') as militaryheight,
    coalesce(cast(procedure.minima.radioheight_value as varchar) || ' ' || procedure.minima.radioheight_uom, '(' || procedure.minima.radioheight_nilreason || ')') as radioheight,
    coalesce(cast(procedure.minima.visibility_value as varchar) || ' ' || procedure.minima.visibility_uom, '(' || procedure.minima.visibility_nilreason || ')') as visibility,
    coalesce(cast(procedure.minima.militaryvisibility_value as varchar) || ' ' || procedure.minima.militaryvisibility_uom, '(' || procedure.minima.militaryvisibility_nilreason || ')') as militaryvisibility,
    lat_adjustmentinop.lat_adjustmentinop as adjustmentinop,
    lat_annotation.annotation as annotation
from procedure.minima_pt 
inner join procedure.minima on procedure.minima_pt.minima_id = procedure.minima.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_equipmentunavailableadjustment_pt_ekkwea.id) as lat_adjustmentinop
  from master_join master_join_icrzfx
  join procedure.equipmentunavailableadjustment_pt procedure_equipmentunavailableadjustment_pt_ekkwea on master_join_icrzfx.target_id = procedure_equipmentunavailableadjustment_pt_ekkwea.id
  where master_join_icrzfx.source_id = procedure.minima.id
) as lat_adjustmentinop on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_rwaqfb.*) AS annotation
  from master_join master_join_xjrwrm
  join notes.note_view notes_note_view_rwaqfb on master_join_xjrwrm.target_id = notes_note_view_rwaqfb.id
  where master_join_xjrwrm.source_id = procedure.minima.id
) as lat_annotation on TRUE;
create index on procedure.minima_view (id);
-- MissedApproachGroupPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.missedapproachgroup_view cascade;
create materialized view procedure.missedapproachgroup_view as
select
    procedure.missedapproachgroup_pt.id,
    procedure.missedapproachgroup_pt.nilreason AS missedapproachgroup_nilreason,
    coalesce(cast(procedure.missedapproachgroup.instruction_value as varchar), '(' || procedure.missedapproachgroup.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.missedapproachgroup.alternateclimbinstruction_value as varchar), '(' || procedure.missedapproachgroup.alternateclimbinstruction_nilreason || ')') as alternateclimbinstruction,
    coalesce(cast(procedure.missedapproachgroup.alternateclimbaltitude_value as varchar) || ' ' || procedure.missedapproachgroup.alternateclimbaltitude_uom, '(' || procedure.missedapproachgroup.alternateclimbaltitude_nilreason || ')') as alternateclimbaltitude,
    lat_altimeter.lat_altimeter as altimeter,
    lat_annotation.annotation as annotation
from procedure.missedapproachgroup_pt 
inner join procedure.missedapproachgroup on procedure.missedapproachgroup_pt.missedapproachgroup_id = procedure.missedapproachgroup.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_altimetersource_pt_cnvlek.id,
      'title', coalesce(cast(airport_heliport_altimetersource_pt_cnvlek.title AS varchar), '(' || airport_heliport_altimetersource_pt_cnvlek.nilreason[1] || ')'),
      'href', airport_heliport_altimetersource_pt_cnvlek.href
  )) as lat_altimeter  from master_join master_join_jjjvir
  join airport_heliport.altimetersource_pt airport_heliport_altimetersource_pt_cnvlek on master_join_jjjvir.target_id = airport_heliport_altimetersource_pt_cnvlek.id
  where master_join_jjjvir.source_id = procedure.missedapproachgroup.id
) as lat_altimeter on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jwlgel.*) AS annotation
  from master_join master_join_elvrtc
  join notes.note_view notes_note_view_jwlgel on master_join_elvrtc.target_id = notes_note_view_jwlgel.id
  where master_join_elvrtc.source_id = procedure.missedapproachgroup.id
) as lat_annotation on TRUE;
create index on procedure.missedapproachgroup_view (id);
-- NavaidComponentPropertyType
-- ['notes.note_view']
drop materialized view if exists navaids_points.navaidcomponent_view cascade;
create materialized view navaids_points.navaidcomponent_view as
select
    navaids_points.navaidcomponent_pt.id,
    navaids_points.navaidcomponent_pt.nilreason AS navaidcomponent_nilreason,
    coalesce(cast(navaids_points.navaidcomponent.collocationgroup_value as varchar), '(' || navaids_points.navaidcomponent.collocationgroup_nilreason || ')') as collocationgroup,
    coalesce(cast(navaids_points.navaidcomponent.markerposition_value as varchar), '(' || navaids_points.navaidcomponent.markerposition_nilreason || ')') as markerposition,
    coalesce(cast(navaids_points.navaidcomponent.providesnavigablelocation_value as varchar), '(' || navaids_points.navaidcomponent.providesnavigablelocation_nilreason || ')') as providesnavigablelocation,
    lat_annotation.annotation as annotation
from navaids_points.navaidcomponent_pt 
inner join navaids_points.navaidcomponent on navaids_points.navaidcomponent_pt.navaidcomponent_id = navaids_points.navaidcomponent.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qzficq.*) AS annotation
  from master_join master_join_mgnmwr
  join notes.note_view notes_note_view_qzficq on master_join_mgnmwr.target_id = notes_note_view_qzficq.id
  where master_join_mgnmwr.source_id = navaids_points.navaidcomponent.id
) as lat_annotation on TRUE;
create index on navaids_points.navaidcomponent_view (id);
-- NavaidEquipmentDistancePropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.navaidequipmentdistance_view cascade;
create materialized view airport_heliport.navaidequipmentdistance_view as
select
    airport_heliport.navaidequipmentdistance_pt.id,
    airport_heliport.navaidequipmentdistance_pt.nilreason AS navaidequipmentdistance_nilreason,
    coalesce(cast(airport_heliport.navaidequipmentdistance.distance_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance.distance_uom, '(' || airport_heliport.navaidequipmentdistance.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.navaidequipmentdistance.distanceaccuracy_value as varchar) || ' ' || airport_heliport.navaidequipmentdistance.distanceaccuracy_uom, '(' || airport_heliport.navaidequipmentdistance.distanceaccuracy_nilreason || ')') as distanceaccuracy,
    lat_annotation.annotation as annotation
from airport_heliport.navaidequipmentdistance_pt 
inner join airport_heliport.navaidequipmentdistance on airport_heliport.navaidequipmentdistance_pt.navaidequipmentdistance_id = airport_heliport.navaidequipmentdistance.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_tmrmzd.*) AS annotation
  from master_join master_join_barbfv
  join notes.note_view notes_note_view_tmrmzd on master_join_barbfv.target_id = notes_note_view_tmrmzd.id
  where master_join_barbfv.source_id = airport_heliport.navaidequipmentdistance.id
) as lat_annotation on TRUE;
create index on airport_heliport.navaidequipmentdistance_view (id);
-- NitrogenPropertyType
-- ['notes.note_view']
drop materialized view if exists service.nitrogen_view cascade;
create materialized view service.nitrogen_view as
select
    service.nitrogen_pt.id,
    service.nitrogen_pt.nilreason AS nitrogen_nilreason,
    coalesce(cast(service.nitrogen.type_value as varchar), '(' || service.nitrogen.type_nilreason || ')') as type,
    lat_annotation.annotation as annotation
from service.nitrogen_pt 
inner join service.nitrogen on service.nitrogen_pt.nitrogen_id = service.nitrogen.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_swityp.*) AS annotation
  from master_join master_join_bfqtvj
  join notes.note_view notes_note_view_swityp on master_join_bfqtvj.target_id = notes_note_view_swityp.id
  where master_join_bfqtvj.source_id = service.nitrogen.id
) as lat_annotation on TRUE;
create index on service.nitrogen_view (id);
-- ObstaclePlacementPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.obstacleplacement_view cascade;
create materialized view shared.obstacleplacement_view as
select
    shared.obstacleplacement_pt.id,
    shared.obstacleplacement_pt.nilreason AS obstacleplacement_nilreason,
    coalesce(cast(shared.obstacleplacement.obstaclebearing_value as varchar), '(' || shared.obstacleplacement.obstaclebearing_nilreason || ')') as obstaclebearing,
    coalesce(cast(shared.obstacleplacement.pointtype_value as varchar), '(' || shared.obstacleplacement.pointtype_nilreason || ')') as pointtype,
    coalesce(cast(shared.obstacleplacement.obstacleplacement_value as varchar), '(' || shared.obstacleplacement.obstacleplacement_nilreason || ')') as obstacleplacement,
    coalesce(cast(shared.obstacleplacement.obstacledistance_value as varchar) || ' ' || shared.obstacleplacement.obstacledistance_uom, '(' || shared.obstacleplacement.obstacledistance_nilreason || ')') as obstacledistance,
    lat_annotation.annotation as annotation
from shared.obstacleplacement_pt 
inner join shared.obstacleplacement on shared.obstacleplacement_pt.obstacleplacement_id = shared.obstacleplacement.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_unnkih.*) AS annotation
  from master_join master_join_pdpixw
  join notes.note_view notes_note_view_unnkih on master_join_pdpixw.target_id = notes_note_view_unnkih.id
  where master_join_pdpixw.source_id = shared.obstacleplacement.id
) as lat_annotation on TRUE;
create index on shared.obstacleplacement_view (id);
-- ObstructionPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.obstruction_view cascade;
create materialized view shared.obstruction_view as
select
    shared.obstruction_pt.id,
    shared.obstruction_pt.nilreason AS obstruction_nilreason,
    coalesce(cast(shared.obstruction.surfacepenetration_value as varchar), '(' || shared.obstruction.surfacepenetration_nilreason || ')') as surfacepenetration,
    coalesce(cast(shared.obstruction.slopepenetration_value as varchar), '(' || shared.obstruction.slopepenetration_nilreason || ')') as slopepenetration,
    coalesce(cast(shared.obstruction.controlling_value as varchar), '(' || shared.obstruction.controlling_nilreason || ')') as controlling,
    coalesce(cast(shared.obstruction.closein_value as varchar), '(' || shared.obstruction.closein_nilreason || ')') as closein,
    coalesce(cast(shared.obstruction.requiredclearance_value as varchar) || ' ' || shared.obstruction.requiredclearance_uom, '(' || shared.obstruction.requiredclearance_nilreason || ')') as requiredclearance,
    coalesce(cast(shared.obstruction.minimumaltitude_value as varchar) || ' ' || shared.obstruction.minimumaltitude_uom, '(' || shared.obstruction.minimumaltitude_nilreason || ')') as minimumaltitude,
    coalesce(cast(obstacles_verticalstructure_pt_qrjjpf.title as varchar), '(' || obstacles_verticalstructure_pt_qrjjpf.nilreason[1] || ')') AS theverticalstructure,
    obstacles_verticalstructure_pt_qrjjpf.href AS theverticalstructure_href,
    lat_adjustment.lat_adjustment as adjustment,
    lat_obstacleplacement.lat_obstacleplacement as obstacleplacement,
    lat_annotation.annotation as annotation
from shared.obstruction_pt 
inner join shared.obstruction on shared.obstruction_pt.obstruction_id = shared.obstruction.id
left join obstacles.verticalstructure_pt obstacles_verticalstructure_pt_qrjjpf on shared.obstruction.theverticalstructure_id = obstacles_verticalstructure_pt_qrjjpf.id
left join lateral(
  select jsonb_agg(DISTINCT shared_altitudeadjustment_pt_urmtlx.id) as lat_adjustment
  from master_join master_join_bpawbh
  join shared.altitudeadjustment_pt shared_altitudeadjustment_pt_urmtlx on master_join_bpawbh.target_id = shared_altitudeadjustment_pt_urmtlx.id
  where master_join_bpawbh.source_id = shared.obstruction.id
) as lat_adjustment on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleplacement_pt_xmpenw.id) as lat_obstacleplacement
  from master_join master_join_zjajkt
  join shared.obstacleplacement_pt shared_obstacleplacement_pt_xmpenw on master_join_zjajkt.target_id = shared_obstacleplacement_pt_xmpenw.id
  where master_join_zjajkt.source_id = shared.obstruction.id
) as lat_obstacleplacement on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_kxusea.*) AS annotation
  from master_join master_join_aplbyk
  join notes.note_view notes_note_view_kxusea on master_join_aplbyk.target_id = notes_note_view_kxusea.id
  where master_join_aplbyk.source_id = shared.obstruction.id
) as lat_annotation on TRUE;
create index on shared.obstruction_view (id);
-- OilPropertyType
-- ['notes.note_view']
drop materialized view if exists service.oil_view cascade;
create materialized view service.oil_view as
select
    service.oil_pt.id,
    service.oil_pt.nilreason AS oil_nilreason,
    coalesce(cast(service.oil.category_value as varchar), '(' || service.oil.category_nilreason || ')') as category,
    lat_annotation.annotation as annotation
from service.oil_pt 
inner join service.oil on service.oil_pt.oil_id = service.oil.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jibxhj.*) AS annotation
  from master_join master_join_kkjrbr
  join notes.note_view notes_note_view_jibxhj on master_join_kkjrbr.target_id = notes_note_view_jibxhj.id
  where master_join_kkjrbr.source_id = service.oil.id
) as lat_annotation on TRUE;
create index on service.oil_view (id);
-- OrganisationAuthorityAssociationPropertyType
-- ['notes.note_view']
drop materialized view if exists organisation.organisationauthorityassociation_view cascade;
create materialized view organisation.organisationauthorityassociation_view as
select
    organisation.organisationauthorityassociation_pt.id,
    organisation.organisationauthorityassociation_pt.nilreason AS organisationauthorityassociation_nilreason,
    coalesce(cast(organisation.organisationauthorityassociation.type_value as varchar), '(' || organisation.organisationauthorityassociation.type_nilreason || ')') as type,
    coalesce(cast(organisation_organisationauthority_pt_cjrxdy.title as varchar), '(' || organisation_organisationauthority_pt_cjrxdy.nilreason[1] || ')') AS theorganisationauthority,
    organisation_organisationauthority_pt_cjrxdy.href AS theorganisationauthority_href,
    lat_annotation.annotation as annotation
from organisation.organisationauthorityassociation_pt 
inner join organisation.organisationauthorityassociation on organisation.organisationauthorityassociation_pt.organisationauthorityassociation_id = organisation.organisationauthorityassociation.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_cjrxdy on organisation.organisationauthorityassociation.theorganisationauthority_id = organisation_organisationauthority_pt_cjrxdy.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_rxvbej.*) AS annotation
  from master_join master_join_cdwvyi
  join notes.note_view notes_note_view_rxvbej on master_join_cdwvyi.target_id = notes_note_view_rxvbej.id
  where master_join_cdwvyi.source_id = organisation.organisationauthorityassociation.id
) as lat_annotation on TRUE;
create index on organisation.organisationauthorityassociation_view (id);
-- OxygenPropertyType
-- ['notes.note_view']
drop materialized view if exists service.oxygen_view cascade;
create materialized view service.oxygen_view as
select
    service.oxygen_pt.id,
    service.oxygen_pt.nilreason AS oxygen_nilreason,
    coalesce(cast(service.oxygen.type_value as varchar), '(' || service.oxygen.type_nilreason || ')') as type,
    lat_annotation.annotation as annotation
from service.oxygen_pt 
inner join service.oxygen on service.oxygen_pt.oxygen_id = service.oxygen.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_atoqgc.*) AS annotation
  from master_join master_join_vbltav
  join notes.note_view notes_note_view_atoqgc on master_join_vbltav.target_id = notes_note_view_atoqgc.id
  where master_join_vbltav.source_id = service.oxygen.id
) as lat_annotation on TRUE;
create index on service.oxygen_view (id);
-- PointPropertyType
-- ['notes.note_view']
-- Snowflake SQL : PointPropertyType

DROP MATERIALIZED VIEW IF EXISTS geometry.point_view CASCADE;

CREATE MATERIALIZED VIEW geometry.point_view AS
SELECT
    id, 
	point as geom,
	ST_X(point) AS longitude,
	ST_Y(point) AS latitude,
	COALESCE(horizontalaccuracy || ' ' || horizontalaccuracy_uom, '(' || horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
FROM geometry.point_pt;

CREATE INDEX ON geometry.point_view (id);
-- ProcedureTransitionLegPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.proceduretransitionleg_view cascade;
create materialized view procedure.proceduretransitionleg_view as
select
    procedure.proceduretransitionleg_pt.id,
    procedure.proceduretransitionleg_pt.nilreason AS proceduretransitionleg_nilreason,
    coalesce(cast(procedure.proceduretransitionleg.seqnumberarinc_value as varchar), '(' || procedure.proceduretransitionleg.seqnumberarinc_nilreason || ')') as seqnumberarinc,
    lat_annotation.annotation as annotation
from procedure.proceduretransitionleg_pt 
inner join procedure.proceduretransitionleg on procedure.proceduretransitionleg_pt.proceduretransitionleg_id = procedure.proceduretransitionleg.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_giyshk.*) AS annotation
  from master_join master_join_jymcoh
  join notes.note_view notes_note_view_giyshk on master_join_jymcoh.target_id = notes_note_view_giyshk.id
  where master_join_jymcoh.source_id = procedure.proceduretransitionleg.id
) as lat_annotation on TRUE;
create index on procedure.proceduretransitionleg_view (id);
-- RadarComponentPropertyType
-- ['notes.note_view']
drop materialized view if exists surveillance.radarcomponent_view cascade;
create materialized view surveillance.radarcomponent_view as
select
    surveillance.radarcomponent_pt.id,
    surveillance.radarcomponent_pt.nilreason AS radarcomponent_nilreason,
    coalesce(cast(surveillance.radarcomponent.collocationgroup_value as varchar), '(' || surveillance.radarcomponent.collocationgroup_nilreason || ')') as collocationgroup,
    lat_annotation.annotation as annotation
from surveillance.radarcomponent_pt 
inner join surveillance.radarcomponent on surveillance.radarcomponent_pt.radarcomponent_id = surveillance.radarcomponent.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xzmjmp.*) AS annotation
  from master_join master_join_pffauk
  join notes.note_view notes_note_view_xzmjmp on master_join_pffauk.target_id = notes_note_view_xzmjmp.id
  where master_join_pffauk.source_id = surveillance.radarcomponent.id
) as lat_annotation on TRUE;
create index on surveillance.radarcomponent_view (id);
-- RidgePropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.ridge_view cascade;
create materialized view airport_heliport.ridge_view as
select
    airport_heliport.ridge_pt.id,
    airport_heliport.ridge_pt.nilreason AS ridge_nilreason,
    coalesce(cast(airport_heliport.ridge.side_value as varchar), '(' || airport_heliport.ridge.side_nilreason || ')') as side,
    coalesce(cast(airport_heliport.ridge.distance_value as varchar) || ' ' || airport_heliport.ridge.distance_uom, '(' || airport_heliport.ridge.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.ridge.depth_value as varchar) || ' ' || airport_heliport.ridge.depth_uom, '(' || airport_heliport.ridge.depth_nilreason || ')') as depth,
    lat_annotation.annotation as annotation
from airport_heliport.ridge_pt 
inner join airport_heliport.ridge on airport_heliport.ridge_pt.ridge_id = airport_heliport.ridge.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_djntid.*) AS annotation
  from master_join master_join_tyqvtp
  join notes.note_view notes_note_view_djntid on master_join_tyqvtp.target_id = notes_note_view_djntid.id
  where master_join_tyqvtp.source_id = airport_heliport.ridge.id
) as lat_annotation on TRUE;
create index on airport_heliport.ridge_view (id);
-- RunwayContaminationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.runwaycontamination_view cascade;
create materialized view airport_heliport.runwaycontamination_view as
select
    airport_heliport.runwaycontamination_pt.id,
    airport_heliport.runwaycontamination_pt.nilreason AS runwaycontamination_nilreason,
    coalesce(cast(airport_heliport.runwaycontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaycontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.runwaycontamination.frictionestimation_value as varchar), '(' || airport_heliport.runwaycontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.runwaycontamination.frictiondevice_value as varchar), '(' || airport_heliport.runwaycontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.runwaycontamination.obscuredlights_value as varchar), '(' || airport_heliport.runwaycontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.runwaycontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaycontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.runwaycontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaycontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.runwaycontamination.proportion_value as varchar), '(' || airport_heliport.runwaycontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.runwaycontamination.clearedside_value as varchar), '(' || airport_heliport.runwaycontamination.clearedside_nilreason || ')') as clearedside,
    coalesce(cast(airport_heliport.runwaycontamination.obscuredlightsside_value as varchar), '(' || airport_heliport.runwaycontamination.obscuredlightsside_nilreason || ')') as obscuredlightsside,
    coalesce(cast(airport_heliport.runwaycontamination.taxiwayavailable_value as varchar), '(' || airport_heliport.runwaycontamination.taxiwayavailable_nilreason || ')') as taxiwayavailable,
    coalesce(cast(airport_heliport.runwaycontamination.apronavailable_value as varchar), '(' || airport_heliport.runwaycontamination.apronavailable_nilreason || ')') as apronavailable,
    coalesce(cast(airport_heliport.runwaycontamination.depth_value as varchar) || ' ' || airport_heliport.runwaycontamination.depth_uom, '(' || airport_heliport.runwaycontamination.depth_nilreason || ')') as depth,
    coalesce(cast(airport_heliport.runwaycontamination.clearedlength_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedlength_uom, '(' || airport_heliport.runwaycontamination.clearedlength_nilreason || ')') as clearedlength,
    coalesce(cast(airport_heliport.runwaycontamination.clearedwidth_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedwidth_uom, '(' || airport_heliport.runwaycontamination.clearedwidth_nilreason || ')') as clearedwidth,
    coalesce(cast(airport_heliport.runwaycontamination.furtherclearancelength_value as varchar) || ' ' || airport_heliport.runwaycontamination.furtherclearancelength_uom, '(' || airport_heliport.runwaycontamination.furtherclearancelength_nilreason || ')') as furtherclearancelength,
    coalesce(cast(airport_heliport.runwaycontamination.furtherclearancewidth_value as varchar) || ' ' || airport_heliport.runwaycontamination.furtherclearancewidth_uom, '(' || airport_heliport.runwaycontamination.furtherclearancewidth_nilreason || ')') as furtherclearancewidth,
    coalesce(cast(airport_heliport.runwaycontamination.clearedlengthbegin_value as varchar) || ' ' || airport_heliport.runwaycontamination.clearedlengthbegin_uom, '(' || airport_heliport.runwaycontamination.clearedlengthbegin_nilreason || ')') as clearedlengthbegin,
    lat_criticalridge.lat_criticalridge as criticalridge,
    lat_layer.lat_layer as layer,
    lat_annotation.annotation as annotation
from airport_heliport.runwaycontamination_pt 
inner join airport_heliport.runwaycontamination on airport_heliport.runwaycontamination_pt.runwaycontamination_id = airport_heliport.runwaycontamination.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_ridge_pt_opoumi.id) as lat_criticalridge
  from master_join master_join_zoucbk
  join airport_heliport.ridge_pt airport_heliport_ridge_pt_opoumi on master_join_zoucbk.target_id = airport_heliport_ridge_pt_opoumi.id
  where master_join_zoucbk.source_id = airport_heliport.runwaycontamination.id
) as lat_criticalridge on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_surfacecontaminationlayer_pt_sxdfid.id) as lat_layer
  from master_join master_join_cdjkoj
  join airport_heliport.surfacecontaminationlayer_pt airport_heliport_surfacecontaminationlayer_pt_sxdfid on master_join_cdjkoj.target_id = airport_heliport_surfacecontaminationlayer_pt_sxdfid.id
  where master_join_cdjkoj.source_id = airport_heliport.runwaycontamination.id
) as lat_layer on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hzbepe.*) AS annotation
  from master_join master_join_ejacla
  join notes.note_view notes_note_view_hzbepe on master_join_ejacla.target_id = notes_note_view_hzbepe.id
  where master_join_ejacla.source_id = airport_heliport.runwaycontamination.id
) as lat_annotation on TRUE;
create index on airport_heliport.runwaycontamination_view (id);
-- RunwayDeclaredDistancePropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.runwaydeclareddistance_view cascade;
create materialized view airport_heliport.runwaydeclareddistance_view as
select
    airport_heliport.runwaydeclareddistance_pt.id,
    airport_heliport.runwaydeclareddistance_pt.nilreason AS runwaydeclareddistance_nilreason,
    coalesce(cast(airport_heliport.runwaydeclareddistance.type_value as varchar), '(' || airport_heliport.runwaydeclareddistance.type_nilreason || ')') as type,
    lat_declaredvalue.lat_declaredvalue as declaredvalue,
    lat_annotation.annotation as annotation
from airport_heliport.runwaydeclareddistance_pt 
inner join airport_heliport.runwaydeclareddistance on airport_heliport.runwaydeclareddistance_pt.runwaydeclareddistance_id = airport_heliport.runwaydeclareddistance.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_runwaydeclareddistancevalue_pt_tnfgax.id) as lat_declaredvalue
  from master_join master_join_nfqzkm
  join airport_heliport.runwaydeclareddistancevalue_pt airport_heliport_runwaydeclareddistancevalue_pt_tnfgax on master_join_nfqzkm.target_id = airport_heliport_runwaydeclareddistancevalue_pt_tnfgax.id
  where master_join_nfqzkm.source_id = airport_heliport.runwaydeclareddistance.id
) as lat_declaredvalue on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_vyiwmd.*) AS annotation
  from master_join master_join_dshdpd
  join notes.note_view notes_note_view_vyiwmd on master_join_dshdpd.target_id = notes_note_view_vyiwmd.id
  where master_join_dshdpd.source_id = airport_heliport.runwaydeclareddistance.id
) as lat_annotation on TRUE;
create index on airport_heliport.runwaydeclareddistance_view (id);
-- RunwaySectionContaminationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.runwaysectioncontamination_view cascade;
create materialized view airport_heliport.runwaysectioncontamination_view as
select
    airport_heliport.runwaysectioncontamination_pt.id,
    airport_heliport.runwaysectioncontamination_pt.nilreason AS runwaysectioncontamination_nilreason,
    coalesce(cast(airport_heliport.runwaysectioncontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.runwaysectioncontamination.frictionestimation_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.runwaysectioncontamination.frictiondevice_value as varchar), '(' || airport_heliport.runwaysectioncontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.runwaysectioncontamination.obscuredlights_value as varchar), '(' || airport_heliport.runwaysectioncontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.runwaysectioncontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.runwaysectioncontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.runwaysectioncontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.runwaysectioncontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.runwaysectioncontamination.proportion_value as varchar), '(' || airport_heliport.runwaysectioncontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.runwaysectioncontamination.section_value as varchar), '(' || airport_heliport.runwaysectioncontamination.section_nilreason || ')') as section,
    coalesce(cast(airport_heliport.runwaysectioncontamination.depth_value as varchar) || ' ' || airport_heliport.runwaysectioncontamination.depth_uom, '(' || airport_heliport.runwaysectioncontamination.depth_nilreason || ')') as depth,
    lat_criticalridge.lat_criticalridge as criticalridge,
    lat_layer.lat_layer as layer,
    lat_annotation.annotation as annotation
from airport_heliport.runwaysectioncontamination_pt 
inner join airport_heliport.runwaysectioncontamination on airport_heliport.runwaysectioncontamination_pt.runwaysectioncontamination_id = airport_heliport.runwaysectioncontamination.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_ridge_pt_qajnzj.id) as lat_criticalridge
  from master_join master_join_qxxigw
  join airport_heliport.ridge_pt airport_heliport_ridge_pt_qajnzj on master_join_qxxigw.target_id = airport_heliport_ridge_pt_qajnzj.id
  where master_join_qxxigw.source_id = airport_heliport.runwaysectioncontamination.id
) as lat_criticalridge on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_surfacecontaminationlayer_pt_ibcukl.id) as lat_layer
  from master_join master_join_gonoei
  join airport_heliport.surfacecontaminationlayer_pt airport_heliport_surfacecontaminationlayer_pt_ibcukl on master_join_gonoei.target_id = airport_heliport_surfacecontaminationlayer_pt_ibcukl.id
  where master_join_gonoei.source_id = airport_heliport.runwaysectioncontamination.id
) as lat_layer on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_lksyfd.*) AS annotation
  from master_join master_join_pkjnhf
  join notes.note_view notes_note_view_lksyfd on master_join_pkjnhf.target_id = notes_note_view_lksyfd.id
  where master_join_pkjnhf.source_id = airport_heliport.runwaysectioncontamination.id
) as lat_annotation on TRUE;
create index on airport_heliport.runwaysectioncontamination_view (id);
-- SectorDesignPropertyType
-- ['notes.note_view']
drop materialized view if exists procedure.sectordesign_view cascade;
create materialized view procedure.sectordesign_view as
select
    procedure.sectordesign_pt.id,
    procedure.sectordesign_pt.nilreason AS sectordesign_nilreason,
    coalesce(cast(procedure.sectordesign.turndirection_value as varchar), '(' || procedure.sectordesign.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.sectordesign.designgradient_value as varchar), '(' || procedure.sectordesign.designgradient_nilreason || ')') as designgradient,
    coalesce(cast(procedure.sectordesign.turnpermitted_value as varchar), '(' || procedure.sectordesign.turnpermitted_nilreason || ')') as turnpermitted,
    coalesce(cast(procedure.sectordesign.terminationaltitude_value as varchar) || ' ' || procedure.sectordesign.terminationaltitude_uom, '(' || procedure.sectordesign.terminationaltitude_nilreason || ')') as terminationaltitude,
    lat_annotation.annotation as annotation
from procedure.sectordesign_pt 
inner join procedure.sectordesign on procedure.sectordesign_pt.sectordesign_id = procedure.sectordesign.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_vnarue.*) AS annotation
  from master_join master_join_wcjtur
  join notes.note_view notes_note_view_vnarue on master_join_wcjtur.target_id = notes_note_view_vnarue.id
  where master_join_wcjtur.source_id = procedure.sectordesign.id
) as lat_annotation on TRUE;
create index on procedure.sectordesign_view (id);
-- StandardLevelPropertyType
-- ['notes.note_view']
drop materialized view if exists shared.standardlevel_view cascade;
create materialized view shared.standardlevel_view as
select
    shared.standardlevel_pt.id,
    shared.standardlevel_pt.nilreason AS standardlevel_nilreason,
    coalesce(cast(shared.standardlevel.verticaldistance_value as varchar) || ' ' || shared.standardlevel.verticaldistance_uom, '(' || shared.standardlevel.verticaldistance_nilreason || ')') as verticaldistance,
    lat_annotation.annotation as annotation
from shared.standardlevel_pt 
inner join shared.standardlevel on shared.standardlevel_pt.standardlevel_id = shared.standardlevel.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qawcro.*) AS annotation
  from master_join master_join_thiwnf
  join notes.note_view notes_note_view_qawcro on master_join_thiwnf.target_id = notes_note_view_qawcro.id
  where master_join_thiwnf.source_id = shared.standardlevel.id
) as lat_annotation on TRUE;
create index on shared.standardlevel_view (id);
-- SurfaceCharacteristicsPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.surfacecharacteristics_view cascade;
create materialized view airport_heliport.surfacecharacteristics_view as
select
    airport_heliport.surfacecharacteristics_pt.id,
    airport_heliport.surfacecharacteristics_pt.nilreason AS surfacecharacteristics_nilreason,
    coalesce(cast(airport_heliport.surfacecharacteristics.composition_value as varchar), '(' || airport_heliport.surfacecharacteristics.composition_nilreason || ')') as composition,
    coalesce(cast(airport_heliport.surfacecharacteristics.preparation_value as varchar), '(' || airport_heliport.surfacecharacteristics.preparation_nilreason || ')') as preparation,
    coalesce(cast(airport_heliport.surfacecharacteristics.surfacecondition_value as varchar), '(' || airport_heliport.surfacecharacteristics.surfacecondition_nilreason || ')') as surfacecondition,
    coalesce(cast(airport_heliport.surfacecharacteristics.classpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.classpcn_nilreason || ')') as classpcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.pavementtypepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.pavementtypepcn_nilreason || ')') as pavementtypepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.pavementsubgradepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.pavementsubgradepcn_nilreason || ')') as pavementsubgradepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.maxtyrepressurepcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.maxtyrepressurepcn_nilreason || ')') as maxtyrepressurepcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.evaluationmethodpcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.evaluationmethodpcn_nilreason || ')') as evaluationmethodpcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.classlcn_value as varchar), '(' || airport_heliport.surfacecharacteristics.classlcn_nilreason || ')') as classlcn,
    coalesce(cast(airport_heliport.surfacecharacteristics.weightsiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.weightsiwl_uom, '(' || airport_heliport.surfacecharacteristics.weightsiwl_nilreason || ')') as weightsiwl,
    coalesce(cast(airport_heliport.surfacecharacteristics.tyrepressuresiwl_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.tyrepressuresiwl_uom, '(' || airport_heliport.surfacecharacteristics.tyrepressuresiwl_nilreason || ')') as tyrepressuresiwl,
    coalesce(cast(airport_heliport.surfacecharacteristics.weightauw_value as varchar) || ' ' || airport_heliport.surfacecharacteristics.weightauw_uom, '(' || airport_heliport.surfacecharacteristics.weightauw_nilreason || ')') as weightauw,
    lat_annotation.annotation as annotation
from airport_heliport.surfacecharacteristics_pt 
inner join airport_heliport.surfacecharacteristics on airport_heliport.surfacecharacteristics_pt.surfacecharacteristics_id = airport_heliport.surfacecharacteristics.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_lvgvlv.*) AS annotation
  from master_join master_join_tllvdb
  join notes.note_view notes_note_view_lvgvlv on master_join_tllvdb.target_id = notes_note_view_lvgvlv.id
  where master_join_tllvdb.source_id = airport_heliport.surfacecharacteristics.id
) as lat_annotation on TRUE;
create index on airport_heliport.surfacecharacteristics_view (id);
-- SurfacePropertyType
-- ['notes.note_view']
-- -- Snowflake SQL : SurfacePropertyType

-- CREATE MATERIALIZED VIEW partial_surface_view AS
-- WITH  
-- segment_ref AS(
-- 	SELECT 
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		SUBSTRING(
-- 	        curve_ref 
-- 	        FROM '([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$'
-- 	    ) AS uuid
--     FROM public.polygon_segment 
-- 	WHERE public.polygon_segment.interpretation = 4
-- ),
-- segment_value AS(
-- 	SELECT 
-- 		airspace.geoborder.identifier AS uuid,
-- 		geom
-- 	FROM airspace.geoborder
-- 	INNER JOIN public.geoborder_timeslice
-- 		ON airspace.geoborder.id = public.geoborder_timeslice.geoborder_id
-- 	INNER JOIN airspace.geoborder_tsp
-- 		ON public.geoborder_timeslice.geoborder_tsp_id = airspace.geoborder_tsp.id
-- 	INNER JOIN airspace.geoborder_ts
-- 		ON airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
-- 	INNER JOIN public.curve_pt
-- 		ON airspace.geoborder_ts.border_id = public.curve_pt.id
-- 	INNER JOIN geometry.curve_view
-- 		ON public.curve_pt.id = geometry.curve_view.id
-- ),
-- center AS (
--     SELECT 
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		point,
-- 		radius,
-- 		start_angle,
-- 		end_angle,
-- 		(end_angle - start_angle) / 256 AS step_size
--     FROM public.polygon_segment 
-- 	WHERE public.polygon_segment.interpretation = 2
-- 	UNION ALL 
-- 	SELECT 
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		point,
-- 		radius,
-- 		0 as start_angle,
-- 		2*PI() as end_angle,
-- 		(0 - 2*PI()) / 256 AS step_size
--     FROM public.polygon_segment 
-- 	WHERE public.polygon_segment.interpretation = 3
-- ),
-- interpolated_points AS (
--     SELECT 
--         center.id,
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_Project(center.point::geography, center.radius, center.start_angle + center.step_size * n)::geometry AS point_geom
--     FROM 
--         generate_series(0, 256) AS n, 	
--         center
-- ),
-- arc_line AS (
--     SELECT 
--         id,
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
--         ST_MakeLine(point_geom) AS geom
--     FROM interpolated_points
--     GROUP BY 
-- 		id, 
-- 		curve_xml_id,
-- 		part, 
-- 		member, 
-- 		sequence, 
-- 		interpretation
-- ),
-- segment_union AS (
--     SELECT 
--         id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_ReducePrecision(linestring, 0.000000000000001) AS geom,
-- 		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
--     FROM 
--         public.polygon_segment 
--     WHERE 
--         public.polygon_segment.interpretation = 0
--     UNION ALL 
--     SELECT 
--         id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
--         ST_Segmentize((ST_ReducePrecision(linestring, 0.000000000000001)::geography), 10000)::geometry as geom,
-- 		ST_StartPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(linestring, 0.000000000000001)) as last_point
--     FROM 
--         public.polygon_segment 
--     WHERE 
--         public.polygon_segment.interpretation = 1
-- 	UNION ALL
-- 	SELECT
-- 		id, 
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
-- 		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
-- 	FROM
-- 		arc_line
-- 	UNION ALL
-- 	SELECT
-- 		id,
-- 		curve_xml_id,
-- 		part,
-- 		member,
-- 		sequence,
-- 		interpretation,
-- 		ST_ReducePrecision(geom, 0.000000000000001) AS geom,
-- 		ST_StartPoint(ST_ReducePrecision(geom, 0.000000000000001)) as first_point,
-- 		ST_EndPoint(ST_ReducePrecision(geom, 0.000000000000001)) as last_point
-- 	FROM segment_ref
-- 	INNER JOIN segment_value
-- 	ON segment_ref.uuid = segment_value.uuid		
-- ),
-- segement_ownership AS (
-- 	SELECT 
-- 		public.surface_pt.id,
--         public.surface_pt.xml_id,
-- 		segment_union.curve_xml_id,
-- 		segment_union.part AS part,
-- 		segment_union.member AS member,
-- 		segment_union.sequence AS sequence,
-- 		segment_union.interpretation AS interpretation,
-- 		segment_union.geom AS geom,
-- 		segment_union.first_point as first_point,
-- 		segment_union.last_point as last_point,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		nilreason
--     FROM 
--         public.surface_pt
--     INNER JOIN 
--         public.surface_exterior 
--         ON public.surface_pt.id = public.surface_exterior.surfacepropertytype_id
--     INNER JOIN 
--         segment_union 
--         ON public.surface_exterior.exteriorlinestring_id = segment_union.id
-- 	UNION ALL
-- 	SELECT 
-- 		public.surface_pt.id,
--         public.surface_pt.xml_id,
-- 		segment_union.curve_xml_id,
-- 		segment_union.part AS part,
-- 		segment_union.member AS member,
-- 		segment_union.sequence AS sequence,
-- 		segment_union.interpretation AS interpretation,
-- 		segment_union.geom AS geom,
-- 		segment_union.first_point AS first_point,
-- 		segment_union.last_point AS last_point,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		nilreason
--     FROM 
--         public.surface_pt
--     INNER JOIN 
--         public.surface_interior 
--         ON public.surface_pt.id = public.surface_interior.surfacepropertytype_id
--     INNER JOIN 
--         segment_union 
--         ON public.surface_interior.interiorlinestring_id = segment_union.id
-- ),
-- ordered_segments AS (
--     SELECT 
-- 		id,
--         xml_id, 
-- 		curve_xml_id,
--         part,
-- 		member,
--         sequence,
-- 		interpretation,
--         geom,
--         first_point, 
--         last_point,
-- 		ST_IsClosed(segement_ownership.geom) AS closed,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		nilreason
--     FROM 
--         segement_ownership
--     ORDER BY 
--         xml_id, 
-- 		part, 
-- 		member, 
-- 		sequence
-- ),
-- connecting_segments AS (
--     SELECT 
--         id,
-- 		xml_id,
-- 		curve_xml_id,
--         part,
-- 		member,
--         sequence,
-- 		interpretation,
--         geom,
--         first_point,
--         last_point,
-- 		horizontalaccuracy,
-- 		horizontalaccuracy_uom,
-- 		horizontalaccuracy_nilreason,
-- 		nilreason
--     FROM 
--         ordered_segments
--     UNION ALL
--     SELECT 
--         curr.id,
-- 		curr.xml_id,
-- 		Null AS curve_xml_id,
--         curr.part,
-- 		curr.member,
--         curr.sequence + 0.5 AS sequence,
-- 		1,
--         ST_MakeLine(curr.last_point, next.first_point) AS geom,
--         curr.last_point AS first_point,
--         next.first_point AS last_point,
-- 		curr.horizontalaccuracy,
-- 		curr.horizontalaccuracy_uom,
-- 		curr.horizontalaccuracy_nilreason,
-- 		curr.nilreason
--     FROM 
--         ordered_segments curr
--     JOIN 
--         ordered_segments next
--     ON 
--         curr.xml_id = next.xml_id
--         AND curr.part = next.part
--         AND curr.sequence + 1 = next.sequence
-- 		AND curr.member = next.member
-- 	WHERE 
-- 		ST_IsClosed(curr.geom) = false
-- 		AND
-- 		curr.interpretation != 4
-- 		AND
-- 		next.interpretation != 4
--     UNION ALL
--     SELECT 
--         curr.id,
-- 		curr.xml_id,
-- 		Null AS curve_xml_id,
--         curr.part,
-- 		curr.member + 0.5 AS member,
--         curr.sequence,
-- 		1,
--         ST_MakeLine(curr.last_point, next.first_point) AS geom,
--         curr.last_point AS first_point,
--         next.first_point AS last_point,
-- 		curr.horizontalaccuracy,
-- 		curr.horizontalaccuracy_uom,
-- 		curr.horizontalaccuracy_nilreason,
-- 		curr.nilreason
--     FROM 
--         ordered_segments curr
--     JOIN 
--         ordered_segments next
--     ON 
--         curr.xml_id = next.xml_id
--         AND curr.part = next.part
--         AND curr.member + 1 = next.member
-- 	WHERE 
-- 		ST_IsClosed(curr.geom) = false
-- 		AND
-- 		curr.interpretation != 4
-- 		AND
-- 		next.interpretation != 4
--     ORDER BY 
--         xml_id, 
--         part, 
--         member,
--         sequence
-- ),
-- clustered_segments AS (
--     SELECT 
--         id, 
--         xml_id,
-- 		curve_xml_id,
--         part,
--         member,
--         geom,
-- 		interpretation,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
--         nilreason,
--         ST_ClusterDBSCAN(geom, eps := 0, minpoints := 1) OVER (PARTITION BY xml_id, part)  AS cluster_id
--     FROM 
--         connecting_segments
--     WHERE 
--         interpretation != 4
-- 	UNION ALL
--     SELECT 
--         id, 
-- 		xml_id,
-- 		curve_xml_id,
--         part,
--         member,
--         geom,
-- 		interpretation,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
--         nilreason,
--         Null AS cluster_id
--     FROM 
--         connecting_segments
--     WHERE 
--         interpretation = 4
-- 	ORDER BY
-- 		xml_id,
-- 		part, 
-- 		member
-- ),
-- partial_ring AS (
--     SELECT 
--         id, 
--         xml_id,
-- 		ARRAY_AGG(curve_xml_id) as curve_xml_id,
--         part,
--         MIN(member) AS member,
-- 		MIN(interpretation) AS interpretation,
--         ST_IsClosed(ST_LineMerge(ST_Collect(geom))) AS closed,
--         ST_GeometryType(ST_LineMerge(ST_Collect(geom))) AS type, 
--         ST_LineMerge(ST_Collect(geom)) AS geom,
--         NULL::geometry AS points,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
--         nilreason
--     FROM 
--         clustered_segments
-- 	WHERE 
-- 		interpretation != 4
--     GROUP BY 
-- 		id,
--         xml_id, 
--         part, 
--         cluster_id,
--         horizontalaccuracy, 
--         horizontalaccuracy_uom, 
--         horizontalaccuracy_nilreason,	
--         nilreason
-- 	UNION ALL
--     SELECT 
--         id, 
--         xml_id,
-- 		ARRAY[curve_xml_id] AS curve_xml_id,
--         part,
--         member,
-- 		interpretation,
--         ST_IsClosed(geom) AS closed,
--         ST_GeometryType(geom) AS type, 
-- 		geom AS geom,
-- 		ST_Points(geom) AS points,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
--         nilreason
--     FROM 
--         clustered_segments
-- 	WHERE 
-- 		interpretation = 4
-- 	ORDER BY 
--         xml_id, 
-- 		part, 
-- 		member
-- ),
-- output AS (
--     SELECT 
--         pr.id, 
--         pr.xml_id,
-- 		pr.curve_xml_id,
--         pr.part,
-- 		ROW_NUMBER() OVER (PARTITION BY xml_id, part ORDER BY id) - 1 AS increment,
-- 		COUNT(*) OVER (PARTITION BY xml_id, part ) AS total_count,
-- 		pr.interpretation,
-- 		pr.points,
--         COALESCE(dumped.geom, pr.geom) AS geom,
--         pr.horizontalaccuracy,
--         pr.horizontalaccuracy_uom,
--         pr.horizontalaccuracy_nilreason,
--         pr.nilreason
--     FROM 
--         partial_ring pr
--     LEFT JOIN LATERAL (
--         SELECT (ST_Dump(pr.geom)).geom
--         WHERE ST_GeometryType(pr.geom) = 'ST_MultiLineString'
--     ) dumped ON true
-- 	ORDER BY
-- 		xml_id, 
-- 		part, 
-- 		member
-- )
-- SELECT 
-- 	ST_GeometryType(geom),
-- 	output.id, 
-- 	to_jsonb(output.xml_id) AS xml_id,
-- 	to_jsonb(output.curve_xml_id) AS curve_xml_id,
-- 	output.part,
-- 	output.increment,
-- 	output.total_count,
-- 	output.interpretation,
-- 	output.geom,
-- 	output.points,
-- 	output.horizontalaccuracy,
-- 	output.horizontalaccuracy_uom,
-- 	output.horizontalaccuracy_nilreason,
-- 	output.nilreason
-- FROM
-- 	output;

-- -- R1 : Simple feature, closed
-- -- R2 : Simple feature, unclosed
-- -- G1 : Complex feature wiht a single geoborder, 
-- -- G2 : Complex feature with multiple geoborder,
-- CREATE MATERIALIZED VIEW geometry.surface_view AS
-- WITH 
-- g1_segment AS (
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom,
-- 			ST_Union(
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)),
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(ring.geom))
-- 			)
-- 		  )
-- 		)).geom AS geom,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(ring.geom)) AS  start_segment,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(ring.geom)) AS end_segment,
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_surface_view geoborder
-- 	JOIN
-- 		partial_surface_view ring
-- 	ON 
--         ring.xml_id = geoborder.xml_id
-- 		AND
-- 		ring.part = geoborder.part
-- 		AND 
-- 		ring.increment <> geoborder.increment
-- 	WHERE 
-- 		geoborder.total_count = 2
-- 		AND
-- 		geoborder.interpretation = 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.geom, 
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.geom, 
-- 		ring.geom,
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		partial_surface_view.id, 
-- 		partial_surface_view.xml_id,
-- 		partial_surface_view.curve_xml_id,
-- 		partial_surface_view.part,
-- 		partial_surface_view.increment,
-- 		partial_surface_view.interpretation,
-- 		partial_surface_view.geom,
-- 		Null::geometry AS start_segment,
-- 		Null::geometry AS end_segment,
-- 		partial_surface_view.horizontalaccuracy, 
-- 		partial_surface_view.horizontalaccuracy_uom, 
-- 		partial_surface_view.horizontalaccuracy_nilreason, 
-- 		partial_surface_view.nilreason
-- 	FROM 
-- 		partial_surface_view
-- 	WHERE 
-- 		partial_surface_view.total_count = 2 
-- 		AND
-- 		partial_surface_view.interpretation != 4
-- 	ORDER BY
-- 		id, 
-- 		xml_id, 
-- 		part,
-- 		increment
-- ),
-- g2_segment AS (
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		geoborder.geom AS geom,
-- 		Null::geometry AS  start_segment,
-- 		Null::geometry AS end_segment,
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_surface_view geoborder
-- 	JOIN
-- 		partial_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation = 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom,
-- 			ST_Union(
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom)),
-- 				ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
-- 			)
-- 		  )
-- 		)).geom AS geom,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_surface_view geoborder
-- 	JOIN
-- 		partial_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation != 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom, ST_ClosestPoint(ST_Collect(geoborder.points), ST_EndPoint(before.geom))
-- 			)
-- 		  )
-- 		).geom AS geom,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_EndPoint(before.geom)) AS  start_segment,
-- 		Null::geometry AS end_segment,
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_surface_view geoborder
-- 	JOIN
-- 		partial_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation = 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id, 
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		(ST_Dump(
-- 		  ST_Split(
-- 			geoborder.geom,	ST_ClosestPoint(ST_Collect(geoborder.points), ST_StartPoint(after.geom))
-- 			)
-- 		  )
-- 		).geom AS geom,
-- 		Null::geometry AS  start_segment,
-- 		ST_ShortestLine(ST_Collect(geoborder.points), ST_StartPoint(after.geom)) AS end_segment,
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	FROM 
-- 		partial_surface_view geoborder
-- 	JOIN
-- 		partial_surface_view before
-- 	ON 
--         before.xml_id = geoborder.xml_id
-- 		AND
-- 		before.part = geoborder.part
-- 	    AND (
-- 	        before.increment = geoborder.increment - 1
-- 	        OR (before.increment = geoborder.total_count - 1 AND geoborder.increment = 0)
-- 	    )
-- 	JOIN
-- 		partial_surface_view after
-- 	ON 
--         after.xml_id = geoborder.xml_id
-- 		AND
-- 		after.part = geoborder.part
-- 	    AND (
-- 	        after.increment = geoborder.increment + 1
-- 	        OR (after.increment = 0 AND geoborder.increment = geoborder.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		geoborder.total_count > 2 
-- 		AND
-- 		geoborder.interpretation = 4
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation != 4
-- 	GROUP BY
-- 		geoborder.id, 
-- 		geoborder.xml_id,
-- 		geoborder.curve_xml_id,
-- 		geoborder.part,
-- 		before.geom, 
-- 		after.geom,
-- 		geoborder.increment,
-- 		geoborder.interpretation,
-- 		geoborder.total_count,
-- 		before.increment,
-- 		after.increment,
-- 		geoborder.geom, 
-- 		geoborder.horizontalaccuracy, 
-- 		geoborder.horizontalaccuracy_uom, 
-- 		geoborder.horizontalaccuracy_nilreason, 
-- 		geoborder.nilreason
-- 	UNION ALL
-- 	SELECT
-- 		partial_surface_view.id, 
-- 		partial_surface_view.xml_id,
-- 		partial_surface_view.curve_xml_id,
-- 		partial_surface_view.part,
-- 		partial_surface_view.increment,
-- 		partial_surface_view.interpretation,
-- 		partial_surface_view.total_count,
-- 		partial_surface_view.geom,
-- 		Null::geometry AS start_segment,
-- 		Null::geometry AS end_segment,
-- 		partial_surface_view.horizontalaccuracy, 
-- 		partial_surface_view.horizontalaccuracy_uom, 
-- 		partial_surface_view.horizontalaccuracy_nilreason, 
-- 		partial_surface_view.nilreason
-- 	FROM 
-- 		partial_surface_view
-- 	WHERE 
-- 		partial_surface_view.total_count > 2 
-- 		AND
-- 		partial_surface_view.interpretation != 4
-- 	ORDER BY
-- 		id, 
-- 		xml_id, 
-- 		part,
-- 		increment
-- ),
-- g2_segment_filtered AS (
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		curr.geom AS geom,
-- 		curr.horizontalaccuracy, 
-- 		curr.horizontalaccuracy_uom, 
-- 		curr.horizontalaccuracy_nilreason, 
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 		g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, before.geom) 
-- 		AND 
-- 		ST_Intersects(curr.geom, after.geom)
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation = 4
-- 	UNION ALL
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.start_segment])) AS geom,
-- 		curr.horizontalaccuracy, 
-- 		curr.horizontalaccuracy_uom, 
-- 		curr.horizontalaccuracy_nilreason, 
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 		g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, curr.start_segment)  
-- 		AND 
-- 		ST_Intersects(curr.geom, after.geom)
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation = 4
-- 	UNION ALL
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment])) AS geom,
-- 		curr.horizontalaccuracy, 
-- 		curr.horizontalaccuracy_uom, 
-- 		curr.horizontalaccuracy_nilreason, 
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 		g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, before.geom) 
-- 		AND 
-- 		ST_Intersects(curr.geom, curr.end_segment)
-- 		AND 
-- 		before.interpretation = 4
-- 		AND 
-- 		after.interpretation != 4
-- 	UNION ALL
-- 	SELECT 
-- 		curr.id, 
-- 		curr.xml_id,
-- 		curr.curve_xml_id,
-- 		curr.part,
-- 		curr.increment,
-- 		ST_LineMerge(ST_Collect(ARRAY[curr.geom, curr.end_segment, curr.start_segment])) AS geom,
-- 		curr.horizontalaccuracy, 
-- 		curr.horizontalaccuracy_uom, 
-- 		curr.horizontalaccuracy_nilreason, 
-- 		curr.nilreason
-- 	FROM
-- 		g2_segment curr
-- 	JOIN
-- 		g2_segment before
-- 	ON 
--         before.xml_id = curr.xml_id
-- 		AND
-- 		before.part = curr.part
-- 	    AND (
-- 	        before.increment = curr.increment - 1
-- 	        OR (before.increment = curr.total_count - 1 AND curr.increment = 0)
-- 	    )
-- 	JOIN	
-- 	g2_segment after
-- 	ON 
--         after.xml_id = curr.xml_id
-- 		AND
-- 		after.part = curr.part
-- 	    AND (
-- 	        after.increment = curr.increment + 1
-- 	        OR (after.increment = 0 AND curr.increment = curr.total_count - 1)
-- 	    )
-- 	WHERE 
-- 		curr.interpretation = 4
-- 		AND
-- 		ST_Intersects(curr.geom, curr.start_segment) 
-- 		AND 
-- 		ST_Intersects(curr.geom, curr.end_segment)
-- 		AND 
-- 		before.interpretation != 4
-- 		AND 
-- 		after.interpretation != 4
-- 	UNION ALL
-- 	SELECT
-- 		g2_segment.id, 
-- 		g2_segment.xml_id,
-- 		g2_segment.curve_xml_id,
-- 		g2_segment.part,
-- 		g2_segment.increment,
-- 		g2_segment.geom,
-- 		g2_segment.horizontalaccuracy, 
-- 		g2_segment.horizontalaccuracy_uom, 
-- 		g2_segment.horizontalaccuracy_nilreason, 
-- 		g2_segment.nilreason
-- 	FROM 
-- 		g2_segment
-- 	WHERE 
-- 		g2_segment.interpretation != 4
-- 	ORDER BY
-- 		id, 
-- 		xml_id, 
-- 		part,
-- 		increment
-- ),
-- r1 AS (
-- 	SELECT
-- 		partial_surface_view.id,
-- 		partial_surface_view.xml_id,
-- 		partial_surface_view.curve_xml_id,
-- 		partial_surface_view.part,
-- 		partial_surface_view.geom,
-- 		partial_surface_view.horizontalaccuracy,
-- 		partial_surface_view.horizontalaccuracy_uom,
-- 		partial_surface_view.horizontalaccuracy_nilreason,
-- 		partial_surface_view.nilreason
-- 	FROM
-- 		partial_surface_view
-- 	WHERE
-- 		ST_IsClosed(partial_surface_view.geom) = true
-- 		AND 
-- 		partial_surface_view.total_count = 1
-- 		AND 
-- 		ST_NPoints(geom) >= 4
-- ),
-- r2 AS (
-- 	SELECT
-- 		partial_surface_view.id,
-- 		partial_surface_view.xml_id,
-- 		partial_surface_view.curve_xml_id,
-- 		partial_surface_view.part,
-- 		ST_AddPoint(partial_surface_view.geom, ST_StartPoint(partial_surface_view.geom)) AS geom,
-- 		partial_surface_view.horizontalaccuracy,
-- 		partial_surface_view.horizontalaccuracy_uom,
-- 		partial_surface_view.horizontalaccuracy_nilreason,
-- 		partial_surface_view.nilreason
-- 	FROM
-- 		partial_surface_view
-- 	WHERE
-- 		ST_IsClosed(partial_surface_view.geom) = false
-- 		AND 
-- 		partial_surface_view.total_count = 1
-- 		AND 
-- 		ST_NPoints(ST_AddPoint(partial_surface_view.geom, ST_StartPoint(partial_surface_view.geom))) >= 4		
-- ),
-- g1 AS (
-- 	SELECT 
-- 		ring.id,
-- 		ring.xml_id || geoborder.xml_id AS xml_id,
-- 		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
-- 		ring.part,
-- 		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
-- 		ring.horizontalaccuracy,
-- 		ring.horizontalaccuracy_uom,
-- 		ring.horizontalaccuracy_nilreason,
-- 		ring.nilreason
-- 	FROM
-- 	g1_segment ring
-- 	JOIN
-- 	g1_segment geoborder
-- 	ON 
-- 		ring.xml_id = geoborder.xml_id
-- 		AND
-- 		geoborder.part = geoborder.part
-- 		AND 
-- 		ring.increment <> geoborder.increment
-- 	WHERE
-- 		ST_Intersects(geoborder.geom, geoborder.start_segment) 
-- 		AND 
-- 		ST_Intersects(geoborder.geom, geoborder.end_segment)
-- 		AND 
-- 		NOT ST_Intersects(geoborder.start_segment, geoborder.end_segment)
-- 		AND
-- 		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
-- 	UNION ALL
-- 	SELECT DISTINCT 
-- 		ring.id,
-- 		ring.xml_id || geoborder.xml_id AS xml_id,
-- 		ring.curve_xml_id || geoborder.curve_xml_id AS curve_xml_id,
-- 		ring.part,
-- 		ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.end_segment, geoborder.start_segment])) AS geom,
-- 		ring.horizontalaccuracy,
-- 		ring.horizontalaccuracy_uom,
-- 		ring.horizontalaccuracy_nilreason,
-- 		ring.nilreason
-- 	FROM
-- 	g1_segment ring
-- 	JOIN
-- 	g1_segment geoborder
-- 	ON 
-- 		ring.xml_id = geoborder.xml_id
-- 		AND
-- 		geoborder.part = geoborder.part
-- 		AND 
-- 		ring.increment <> geoborder.increment
-- 	WHERE
-- 		ST_Intersects(geoborder.geom, geoborder.start_segment) 
-- 		AND 
-- 		ST_Intersects(geoborder.geom, geoborder.end_segment)
-- 		AND 
-- 		ST_Intersects(geoborder.start_segment, geoborder.end_segment)
-- 		AND
-- 		ST_NPoints(ST_LineMerge(ST_Collect(ARRAY[ring.geom, geoborder.geom, geoborder.end_segment, geoborder.start_segment]))) >= 4
-- ),
-- g2 AS (	
-- 	SELECT 
-- 		MIN(g2_segment_filtered.id) AS id,
-- 		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
-- 		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
-- 		MIN(g2_segment_filtered.part) AS part,
-- 		ST_LineMerge(ST_Collect(g2_segment_filtered.geom)) AS geom,
-- 		MIN(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
-- 		MIN(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
-- 		MIN(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
-- 		MIN(g2_segment_filtered.nilreason) AS nilreason
-- 	FROM
-- 		g2_segment_filtered
-- 	GROUP BY
-- 		g2_segment_filtered.id,
-- 		g2_segment_filtered.xml_id,
-- 		g2_segment_filtered.part
-- 	HAVING
-- 		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = true
-- 		AND
-- 		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
-- 		AND 
-- 		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
-- 	UNION ALL
-- 	SELECT 
-- 		MIN(g2_segment_filtered.id) AS id,
-- 		JSONB_AGG(g2_segment_filtered.xml_id) AS xml_id,
-- 		JSONB_AGG(g2_segment_filtered.curve_xml_id) AS curve_xml_id,
-- 		MIN(g2_segment_filtered.part) AS part,
-- 		ST_AddPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)), ST_StartPoint(ST_LineMerge(ST_Collect(g2_segment_filtered.geom)))) AS geom,
-- 		MIN(g2_segment_filtered.horizontalaccuracy) AS horizontalaccuracy,
-- 		MIN(g2_segment_filtered.horizontalaccuracy_uom) AS horizontalaccuracy_uom,
-- 		MIN(g2_segment_filtered.horizontalaccuracy_nilreason) AS horizontalaccuracy_nilreason,
-- 		MIN(g2_segment_filtered.nilreason) AS nilreason
-- 	FROM
-- 		g2_segment_filtered
-- 	GROUP BY
-- 		g2_segment_filtered.id,
-- 		g2_segment_filtered.xml_id,
-- 		g2_segment_filtered.part
-- 	HAVING
-- 		ST_IsClosed(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = false
-- 		AND
-- 		ST_GeometryType(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) = 'ST_LineString'
-- 		AND 
-- 		ST_NPoints(ST_LineMerge(ST_Collect(g2_segment_filtered.geom))) >= 4
-- ),
-- combined_data AS (
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
-- 		geom,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
-- 		nilreason,
--         part
--     FROM 
--         r1
--     UNION ALL
--     SELECT 
--         id, 
--         xml_id,
-- 		curve_xml_id,
--         geom,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
-- 		nilreason,
--         part
--     FROM 
--         r2
--     UNION ALL
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         geom,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
-- 		nilreason,
--         part
--     FROM 
--         g1
--     UNION ALL
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         geom,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
-- 		nilreason,
--         part
--     FROM 
--         g2
-- ),
-- outer_shells AS (
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         ST_MakePolygon(geom) AS geom,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
-- 		nilreason
--     FROM 
--         combined_data
--     WHERE 
--         part = 0
-- ),
-- inner_shells AS (
--     SELECT 
--         id, 
--         xml_id, 
-- 		curve_xml_id,
--         geom,
--         horizontalaccuracy,
--         horizontalaccuracy_uom,
--         horizontalaccuracy_nilreason,
-- 		nilreason
--     FROM 
--         combined_data
--     WHERE 
--         part <> 0
-- )
-- SELECT 
--     outer_shells.id,
--     ST_MakePolygon(
--         ST_ExteriorRing(outer_shells.geom),
--         ARRAY(
--             SELECT ST_ExteriorRing(inner_shells.geom)
--             FROM inner_shells 
--             WHERE inner_shells.id = outer_shells.id
--         )
--     ) AS geom,
-- 	COALESCE(outer_shells.horizontalaccuracy || ' ' ||outer_shells. horizontalaccuracy_uom, '(' || outer_shells.horizontalaccuracy_nilreason || ')') AS horizontalAccuracy
-- FROM 
-- outer_shells;

-- CREATE INDEX ON geometry.surface_view (id);

DROP MATERIALIZED VIEW IF EXISTS geometry.surface_view CASCADE;

CREATE MATERIALIZED VIEW geometry.surface_view AS
SELECT 
0 AS id,
ST_GeomFromText('POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))', 4326) AS geom,
0 AS horizontalAccuracy;
-- SurveillanceGroundStationPropertyType
-- ['notes.note_view']
drop materialized view if exists surveillance.surveillancegroundstation_view cascade;
create materialized view surveillance.surveillancegroundstation_view as
select
    surveillance.surveillancegroundstation_pt.id,
    surveillance.surveillancegroundstation_pt.nilreason AS surveillancegroundstation_nilreason,
    coalesce(cast(surveillance.surveillancegroundstation.videomap_value as varchar), '(' || surveillance.surveillancegroundstation.videomap_nilreason || ')') as videomap,
    coalesce(cast(organisation_unit_pt_hiqyzo.title as varchar), '(' || organisation_unit_pt_hiqyzo.nilreason[1] || ')') AS theunit,
    organisation_unit_pt_hiqyzo.href AS theunit_href,
    lat_annotation.annotation as annotation
from surveillance.surveillancegroundstation_pt 
inner join surveillance.surveillancegroundstation on surveillance.surveillancegroundstation_pt.surveillancegroundstation_id = surveillance.surveillancegroundstation.id
left join organisation.unit_pt organisation_unit_pt_hiqyzo on surveillance.surveillancegroundstation.theunit_id = organisation_unit_pt_hiqyzo.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mritmj.*) AS annotation
  from master_join master_join_zzmdem
  join notes.note_view notes_note_view_mritmj on master_join_zzmdem.target_id = notes_note_view_mritmj.id
  where master_join_zzmdem.source_id = surveillance.surveillancegroundstation.id
) as lat_annotation on TRUE;
create index on surveillance.surveillancegroundstation_view (id);
-- TaxiwayContaminationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.taxiwaycontamination_view cascade;
create materialized view airport_heliport.taxiwaycontamination_view as
select
    airport_heliport.taxiwaycontamination_pt.id,
    airport_heliport.taxiwaycontamination_pt.nilreason AS taxiwaycontamination_nilreason,
    coalesce(cast(airport_heliport.taxiwaycontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.taxiwaycontamination.frictionestimation_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.taxiwaycontamination.frictiondevice_value as varchar), '(' || airport_heliport.taxiwaycontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.taxiwaycontamination.obscuredlights_value as varchar), '(' || airport_heliport.taxiwaycontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.taxiwaycontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.taxiwaycontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.taxiwaycontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.taxiwaycontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.taxiwaycontamination.proportion_value as varchar), '(' || airport_heliport.taxiwaycontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.taxiwaycontamination.depth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination.depth_uom, '(' || airport_heliport.taxiwaycontamination.depth_nilreason || ')') as depth,
    coalesce(cast(airport_heliport.taxiwaycontamination.clearedwidth_value as varchar) || ' ' || airport_heliport.taxiwaycontamination.clearedwidth_uom, '(' || airport_heliport.taxiwaycontamination.clearedwidth_nilreason || ')') as clearedwidth,
    lat_criticalridge.lat_criticalridge as criticalridge,
    lat_layer.lat_layer as layer,
    lat_annotation.annotation as annotation
from airport_heliport.taxiwaycontamination_pt 
inner join airport_heliport.taxiwaycontamination on airport_heliport.taxiwaycontamination_pt.taxiwaycontamination_id = airport_heliport.taxiwaycontamination.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_ridge_pt_exnhvv.id) as lat_criticalridge
  from master_join master_join_kykamp
  join airport_heliport.ridge_pt airport_heliport_ridge_pt_exnhvv on master_join_kykamp.target_id = airport_heliport_ridge_pt_exnhvv.id
  where master_join_kykamp.source_id = airport_heliport.taxiwaycontamination.id
) as lat_criticalridge on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_surfacecontaminationlayer_pt_fowwzn.id) as lat_layer
  from master_join master_join_ckarfe
  join airport_heliport.surfacecontaminationlayer_pt airport_heliport_surfacecontaminationlayer_pt_fowwzn on master_join_ckarfe.target_id = airport_heliport_surfacecontaminationlayer_pt_fowwzn.id
  where master_join_ckarfe.source_id = airport_heliport.taxiwaycontamination.id
) as lat_layer on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_niylza.*) AS annotation
  from master_join master_join_busngx
  join notes.note_view notes_note_view_niylza on master_join_busngx.target_id = notes_note_view_niylza.id
  where master_join_busngx.source_id = airport_heliport.taxiwaycontamination.id
) as lat_annotation on TRUE;
create index on airport_heliport.taxiwaycontamination_view (id);
-- TimesheetPropertyType
-- ['notes.note_view']
-- Snowflake SQL : TimesheetPropertyType 

DROP MATERIALIZED VIEW IF EXISTS shared.timesheet_view CASCADE;

CREATE MATERIALIZED VIEW shared.timesheet_view AS
SELECT
shared.timesheet_pt.id,
jsonb_build_object(
	'timereference', COALESCE(shared.timesheet.timereference_value, '(' || shared.timesheet.timereference_nilreason || ')'),
	'startdate', COALESCE(shared.timesheet.startdate_value, '(' || shared.timesheet.startdate_nilreason || ')'),
	'enddate', COALESCE(shared.timesheet.enddate_value, '(' || shared.timesheet.enddate_nilreason || ')'),
	'day', COALESCE(shared.timesheet.day_value, '(' || shared.timesheet.day_nilreason || ')'),
	'daytil', COALESCE(shared.timesheet.daytil_value, '(' || shared.timesheet.daytil_nilreason || ')'),
	'starttime', COALESCE(shared.timesheet.starttime_value, '(' || shared.timesheet.starttime_nilreason || ')'),
	'startevent', COALESCE(shared.timesheet.startevent_value, '(' || shared.timesheet.startevent_nilreason || ')'),
	'starteventinterpretation', COALESCE(shared.timesheet.starteventinterpretation_value, '(' || shared.timesheet.starteventinterpretation_nilreason || ')'),
	'starttimerelativeevent', COALESCE(shared.timesheet.starttimerelativeevent_value || ' ' || shared.timesheet.starttimerelativeevent_uom, '(' || shared.timesheet.starttimerelativeevent_nilreason || ')'),
	'endtime', COALESCE(shared.timesheet.endtime_value, '(' || shared.timesheet.endtime_nilreason || ')'),
	'endevent', COALESCE(shared.timesheet.endevent_value, '(' || shared.timesheet.endevent_nilreason || ')'),
	'endeventinterpretation', COALESCE(shared.timesheet.endeventinterpretation_value, '(' || shared.timesheet.endeventinterpretation_nilreason || ')'),
	'endtimerelativeevent', COALESCE(shared.timesheet.endtimerelativeevent_value || ' ' || shared.timesheet.endtimerelativeevent_uom, '(' || shared.timesheet.endtimerelativeevent_nilreason || ')'),
	'daylightsavingadjust',COALESCE(shared.timesheet.daylightsavingadjust_value, '(' || shared.timesheet.daylightsavingadjust_nilreason || ')'),
	'excluded', COALESCE(shared.timesheet.excluded_value, '(' || shared.timesheet.excluded_nilreason || ')'),
	'annotations', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
)
FROM shared.timesheet_pt
INNER JOIN shared.timesheet ON shared.timesheet_pt.timesheet_id = shared.timesheet.id
LEFT JOIN master_join ON shared.timesheet.id = master_join.source_id
LEFT JOIN notes.note_view ON master_join.target_id = notes.note_view.id
GROUP BY
    shared.timesheet_pt.id,
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

CREATE INDEX ON shared.timesheet_view (id);
-- TouchDownLiftOffContaminationPropertyType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.touchdownliftoffcontamination_view cascade;
create materialized view airport_heliport.touchdownliftoffcontamination_view as
select
    airport_heliport.touchdownliftoffcontamination_pt.id,
    airport_heliport.touchdownliftoffcontamination_pt.nilreason AS touchdownliftoffcontamination_nilreason,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictioncoefficient_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictioncoefficient_nilreason || ')') as frictioncoefficient,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictionestimation_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictionestimation_nilreason || ')') as frictionestimation,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.frictiondevice_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.frictiondevice_nilreason || ')') as frictiondevice,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.obscuredlights_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.obscuredlights_nilreason || ')') as obscuredlights,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.furtherclearancetime_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.furtherclearancetime_nilreason || ')') as furtherclearancetime,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.furthertotalclearance_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.furthertotalclearance_nilreason || ')') as furthertotalclearance,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.proportion_value as varchar), '(' || airport_heliport.touchdownliftoffcontamination.proportion_nilreason || ')') as proportion,
    coalesce(cast(airport_heliport.touchdownliftoffcontamination.depth_value as varchar) || ' ' || airport_heliport.touchdownliftoffcontamination.depth_uom, '(' || airport_heliport.touchdownliftoffcontamination.depth_nilreason || ')') as depth,
    lat_criticalridge.lat_criticalridge as criticalridge,
    lat_layer.lat_layer as layer,
    lat_annotation.annotation as annotation
from airport_heliport.touchdownliftoffcontamination_pt 
inner join airport_heliport.touchdownliftoffcontamination on airport_heliport.touchdownliftoffcontamination_pt.touchdownliftoffcontamination_id = airport_heliport.touchdownliftoffcontamination.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_ridge_pt_qfuhrt.id) as lat_criticalridge
  from master_join master_join_sfkrzt
  join airport_heliport.ridge_pt airport_heliport_ridge_pt_qfuhrt on master_join_sfkrzt.target_id = airport_heliport_ridge_pt_qfuhrt.id
  where master_join_sfkrzt.source_id = airport_heliport.touchdownliftoffcontamination.id
) as lat_criticalridge on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_surfacecontaminationlayer_pt_wgvbda.id) as lat_layer
  from master_join master_join_dcwqgy
  join airport_heliport.surfacecontaminationlayer_pt airport_heliport_surfacecontaminationlayer_pt_wgvbda on master_join_dcwqgy.target_id = airport_heliport_surfacecontaminationlayer_pt_wgvbda.id
  where master_join_dcwqgy.source_id = airport_heliport.touchdownliftoffcontamination.id
) as lat_layer on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ufkuxo.*) AS annotation
  from master_join master_join_poctyk
  join notes.note_view notes_note_view_ufkuxo on master_join_poctyk.target_id = notes_note_view_ufkuxo.id
  where master_join_poctyk.source_id = airport_heliport.touchdownliftoffcontamination.id
) as lat_annotation on TRUE;
create index on airport_heliport.touchdownliftoffcontamination_view (id);
-- UnitDependencyPropertyType
-- ['notes.note_view']
drop materialized view if exists organisation.unitdependency_view cascade;
create materialized view organisation.unitdependency_view as
select
    organisation.unitdependency_pt.id,
    organisation.unitdependency_pt.nilreason AS unitdependency_nilreason,
    coalesce(cast(organisation.unitdependency.type_value as varchar), '(' || organisation.unitdependency.type_nilreason || ')') as type,
    coalesce(cast(organisation_unit_pt_qzhmox.title as varchar), '(' || organisation_unit_pt_qzhmox.nilreason[1] || ')') AS theunit,
    organisation_unit_pt_qzhmox.href AS theunit_href,
    lat_annotation.annotation as annotation
from organisation.unitdependency_pt 
inner join organisation.unitdependency on organisation.unitdependency_pt.unitdependency_id = organisation.unitdependency.id
left join organisation.unit_pt organisation_unit_pt_qzhmox on organisation.unitdependency.theunit_id = organisation_unit_pt_qzhmox.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gebfqp.*) AS annotation
  from master_join master_join_gzhsjy
  join notes.note_view notes_note_view_gebfqp on master_join_gzhsjy.target_id = notes_note_view_gebfqp.id
  where master_join_gzhsjy.source_id = organisation.unitdependency.id
) as lat_annotation on TRUE;
create index on organisation.unitdependency_view (id);
-- AerialRefuellingTrackPropertyType
-- ['geometry.curve_view', 'notes.note_view']
drop materialized view if exists aerial_refuelling.aerialrefuellingtrack_view cascade;
create materialized view aerial_refuelling.aerialrefuellingtrack_view as
select
    aerial_refuelling.aerialrefuellingtrack_pt.id,
    aerial_refuelling.aerialrefuellingtrack_pt.nilreason AS aerialrefuellingtrack_nilreason,
    lat_point.lat_point as point,
    lat_verticalextent.lat_verticalextent as verticalextent,
    lat_annotation.annotation as annotation
from aerial_refuelling.aerialrefuellingtrack_pt 
inner join aerial_refuelling.aerialrefuellingtrack on aerial_refuelling.aerialrefuellingtrack_pt.aerialrefuellingtrack_id = aerial_refuelling.aerialrefuellingtrack.id
left join lateral(
  select jsonb_agg(DISTINCT aerial_refuelling_aerialrefuellingpoint_pt_icskxb.id) as lat_point
  from master_join master_join_xhpipy
  join aerial_refuelling.aerialrefuellingpoint_pt aerial_refuelling_aerialrefuellingpoint_pt_icskxb on master_join_xhpipy.target_id = aerial_refuelling_aerialrefuellingpoint_pt_icskxb.id
  where master_join_xhpipy.source_id = aerial_refuelling.aerialrefuellingtrack.id
) as lat_point on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_airspacelayer_pt_wmxpcq.id) as lat_verticalextent
  from master_join master_join_yszgkx
  join shared.airspacelayer_pt shared_airspacelayer_pt_wmxpcq on master_join_yszgkx.target_id = shared_airspacelayer_pt_wmxpcq.id
  where master_join_yszgkx.source_id = aerial_refuelling.aerialrefuellingtrack.id
) as lat_verticalextent on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jknryv.*) AS annotation
  from master_join master_join_npyofd
  join notes.note_view notes_note_view_jknryv on master_join_npyofd.target_id = notes_note_view_jknryv.id
  where master_join_npyofd.source_id = aerial_refuelling.aerialrefuellingtrack.id
) as lat_annotation on TRUE;
create index on aerial_refuelling.aerialrefuellingtrack_view (id);
-- ProcedureTransitionPropertyType
-- ['geometry.curve_view', 'notes.note_view']
drop materialized view if exists procedure.proceduretransition_view cascade;
create materialized view procedure.proceduretransition_view as
select
    procedure.proceduretransition_pt.id,
    procedure.proceduretransition_pt.nilreason AS proceduretransition_nilreason,
    coalesce(cast(procedure.proceduretransition.transitionid_value as varchar), '(' || procedure.proceduretransition.transitionid_nilreason || ')') as transitionid,
    coalesce(cast(procedure.proceduretransition.type_value as varchar), '(' || procedure.proceduretransition.type_nilreason || ')') as type,
    coalesce(cast(procedure.proceduretransition.instruction_value as varchar), '(' || procedure.proceduretransition.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.proceduretransition.vectorheading_value as varchar), '(' || procedure.proceduretransition.vectorheading_nilreason || ')') as vectorheading,
    procedure_landingtakeoffareacollection_pt_gjcqfx.id AS departurerunwaytransition,
    lat_transitionleg.lat_transitionleg as transitionleg,
    lat_annotation.annotation as annotation
from procedure.proceduretransition_pt 
inner join procedure.proceduretransition on procedure.proceduretransition_pt.proceduretransition_id = procedure.proceduretransition.id
left join procedure.landingtakeoffareacollection_pt procedure_landingtakeoffareacollection_pt_gjcqfx on procedure.proceduretransition.departurerunwaytransition_id = procedure_landingtakeoffareacollection_pt_gjcqfx.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_proceduretransitionleg_pt_olgjmo.id) as lat_transitionleg
  from master_join master_join_uarhlp
  join procedure.proceduretransitionleg_pt procedure_proceduretransitionleg_pt_olgjmo on master_join_uarhlp.target_id = procedure_proceduretransitionleg_pt_olgjmo.id
  where master_join_uarhlp.source_id = procedure.proceduretransition.id
) as lat_transitionleg on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_apgkhv.*) AS annotation
  from master_join master_join_eslakk
  join notes.note_view notes_note_view_apgkhv on master_join_eslakk.target_id = notes_note_view_apgkhv.id
  where master_join_eslakk.source_id = procedure.proceduretransition.id
) as lat_annotation on TRUE;
create index on procedure.proceduretransition_view (id);
-- LightElementPropertyType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists shared.lightelement_view cascade;
create materialized view shared.lightelement_view as
select
    shared.lightelement_pt.id,
    shared.lightelement_pt.nilreason AS lightelement_nilreason,
    coalesce(cast(shared.lightelement.colour_value as varchar), '(' || shared.lightelement.colour_nilreason || ')') as colour,
    coalesce(cast(shared.lightelement.intensitylevel_value as varchar), '(' || shared.lightelement.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(shared.lightelement.type_value as varchar), '(' || shared.lightelement.type_nilreason || ')') as type,
    coalesce(cast(shared.lightelement.intensity_value as varchar) || ' ' || shared.lightelement.intensity_uom, '(' || shared.lightelement.intensity_nilreason || ')') as intensity,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from shared.lightelement_pt 
inner join shared.lightelement on shared.lightelement_pt.lightelement_id = shared.lightelement.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_fxdutn.*) AS annotation
  from master_join master_join_ssyayp
  join notes.note_view notes_note_view_fxdutn on master_join_ssyayp.target_id = notes_note_view_fxdutn.id
  where master_join_ssyayp.source_id = shared.lightelement.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelementstatus_pt_tafdxj.id) as lat_availability
  from master_join master_join_tylaog
  join shared.lightelementstatus_pt shared_lightelementstatus_pt_tafdxj on master_join_tylaog.target_id = shared_lightelementstatus_pt_tafdxj.id
  where master_join_tylaog.source_id = shared.lightelement.id
) as lat_availability on TRUE;
create index on shared.lightelement_view (id);
-- ReflectorPropertyType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists surveillance.reflector_view cascade;
create materialized view surveillance.reflector_view as
select
    surveillance.reflector_pt.id,
    surveillance.reflector_pt.nilreason AS reflector_nilreason,
    coalesce(cast(surveillance.reflector.type_value as varchar), '(' || surveillance.reflector.type_nilreason || ')') as type,
    lat_annotation.annotation as annotation
from surveillance.reflector_pt 
inner join surveillance.reflector on surveillance.reflector_pt.reflector_id = surveillance.reflector.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mdbvwo.*) AS annotation
  from master_join master_join_rtcgpq
  join notes.note_view notes_note_view_mdbvwo on master_join_rtcgpq.target_id = notes_note_view_mdbvwo.id
  where master_join_rtcgpq.source_id = surveillance.reflector.id
) as lat_annotation on TRUE;
create index on surveillance.reflector_view (id);
-- MarkingElementPropertyType
-- ['geometry.elevatedcurve_view', 'geometry.elevatedsurface_view', 'notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists airport_heliport.markingelement_view cascade;
create materialized view airport_heliport.markingelement_view as
select
    airport_heliport.markingelement_pt.id,
    airport_heliport.markingelement_pt.nilreason AS markingelement_nilreason,
    coalesce(cast(airport_heliport.markingelement.colour_value as varchar), '(' || airport_heliport.markingelement.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.markingelement.style_value as varchar), '(' || airport_heliport.markingelement.style_nilreason || ')') as style,
    lat_annotation.annotation as annotation
from airport_heliport.markingelement_pt 
inner join airport_heliport.markingelement on airport_heliport.markingelement_pt.markingelement_id = airport_heliport.markingelement.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_spzekf.*) AS annotation
  from master_join master_join_ylxkjj
  join notes.note_view notes_note_view_spzekf on master_join_ylxkjj.target_id = notes_note_view_spzekf.id
  where master_join_ylxkjj.source_id = airport_heliport.markingelement.id
) as lat_annotation on TRUE;
create index on airport_heliport.markingelement_view (id);
-- SurfaceContaminationLayerPropertyType
-- ['geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.surfacecontaminationlayer_view cascade;
create materialized view airport_heliport.surfacecontaminationlayer_view as
select
    airport_heliport.surfacecontaminationlayer_pt.id,
    airport_heliport.surfacecontaminationlayer_pt.nilreason AS surfacecontaminationlayer_nilreason,
    coalesce(cast(airport_heliport.surfacecontaminationlayer.layerorder_value as varchar), '(' || airport_heliport.surfacecontaminationlayer.layerorder_nilreason || ')') as layerorder,
    coalesce(cast(airport_heliport.surfacecontaminationlayer.type_value as varchar), '(' || airport_heliport.surfacecontaminationlayer.type_nilreason || ')') as type,
    lat_annotation.annotation as annotation
from airport_heliport.surfacecontaminationlayer_pt 
inner join airport_heliport.surfacecontaminationlayer on airport_heliport.surfacecontaminationlayer_pt.surfacecontaminationlayer_id = airport_heliport.surfacecontaminationlayer.id
left join lateral(
  select
  from master_join master_join_ddexgm
  join geometry.elevatedsurface_view geometry_elevatedsurface_view_qcqind on master_join_ddexgm.target_id = geometry_elevatedsurface_view_qcqind.id
  where master_join_ddexgm.source_id = airport_heliport.surfacecontaminationlayer.id
) as lat_extent on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_srexag.*) AS annotation
  from master_join master_join_mhbonq
  join notes.note_view notes_note_view_srexag on master_join_mhbonq.target_id = notes_note_view_srexag.id
  where master_join_mhbonq.source_id = airport_heliport.surfacecontaminationlayer.id
) as lat_annotation on TRUE;
create index on airport_heliport.surfacecontaminationlayer_view (id);
-- AerialRefuellingPointPropertyType
-- ['geometry.point_view', 'notes.note_view']
drop materialized view if exists aerial_refuelling.aerialrefuellingpoint_view cascade;
create materialized view aerial_refuelling.aerialrefuellingpoint_view as
select
    aerial_refuelling.aerialrefuellingpoint_pt.id,
    aerial_refuelling.aerialrefuellingpoint_pt.nilreason AS aerialrefuellingpoint_nilreason,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.reportingatc_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.flyover_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.flyover_nilreason || ')') as flyover,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.waypoint_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.radarguidance_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.sequence_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.sequence_nilreason || ')') as sequence,
    coalesce(cast(aerial_refuelling.aerialrefuellingpoint.usagetype_value as varchar), '(' || aerial_refuelling.aerialrefuellingpoint.usagetype_nilreason || ')') as usagetype,
    coalesce(cast(navaids_points_designatedpoint_pt_cutkii.title as varchar), '(' || navaids_points_designatedpoint_pt_cutkii.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_pt_cutkii.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_xmbtpm.title as varchar), '(' || navaids_points_navaid_pt_xmbtpm.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_pt_xmbtpm.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_uitboc.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_uitboc.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_pt_uitboc.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_cwqwjo.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_cwqwjo.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_cwqwjo.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_acfnre.title as varchar), '(' || airport_heliport_airportheliport_pt_acfnre.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_pt_acfnre.href AS pointchoiceairportreferencepoint_href,
    coalesce(cast(shared_radiofrequencyarea_pt_dolywb.title as varchar), '(' || shared_radiofrequencyarea_pt_dolywb.nilreason[1] || ')') AS extendedservicevolume,
    shared_radiofrequencyarea_pt_dolywb.href AS extendedservicevolume_href,
    lat_facilitymakeup.lat_facilitymakeup as facilitymakeup,
    lat_annotation.annotation as annotation
from aerial_refuelling.aerialrefuellingpoint_pt 
inner join aerial_refuelling.aerialrefuellingpoint on aerial_refuelling.aerialrefuellingpoint_pt.aerialrefuellingpoint_id = aerial_refuelling.aerialrefuellingpoint.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_cutkii on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_cutkii.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_xmbtpm on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_navaidsystem_id = navaids_points_navaid_pt_xmbtpm.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_uitboc on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_aimingpoint_id = airport_heliport_touchdownliftoff_pt_uitboc.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_cwqwjo on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_cwqwjo.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_acfnre on aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_airportreferencepoint_id = airport_heliport_airportheliport_pt_acfnre.id
left join shared.radiofrequencyarea_pt shared_radiofrequencyarea_pt_dolywb on aerial_refuelling.aerialrefuellingpoint.extendedservicevolume_id = shared_radiofrequencyarea_pt_dolywb.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_pointreference_pt_ypydln.id) as lat_facilitymakeup
  from master_join master_join_areesb
  join navaids_points.pointreference_pt navaids_points_pointreference_pt_ypydln on master_join_areesb.target_id = navaids_points_pointreference_pt_ypydln.id
  where master_join_areesb.source_id = aerial_refuelling.aerialrefuellingpoint.id
) as lat_facilitymakeup on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_szjceh.*) AS annotation
  from master_join master_join_fxpdlq
  join notes.note_view notes_note_view_szjceh on master_join_fxpdlq.target_id = notes_note_view_szjceh.id
  where master_join_fxpdlq.source_id = aerial_refuelling.aerialrefuellingpoint.id
) as lat_annotation on TRUE;
create index on aerial_refuelling.aerialrefuellingpoint_view (id);
-- DirectFlightSegmentPropertyType
-- ['geometry.point_view', 'notes.note_view']
drop materialized view if exists routes.directflightsegment_view cascade;
create materialized view routes.directflightsegment_view as
select
    routes.directflightsegment_pt.id,
    routes.directflightsegment_pt.nilreason AS directflightsegment_nilreason,
    coalesce(cast(navaids_points_designatedpoint_pt_fhrfed.title as varchar), '(' || navaids_points_designatedpoint_pt_fhrfed.nilreason[1] || ')') AS endfixdesignatedpoint,
    navaids_points_designatedpoint_pt_fhrfed.href AS endfixdesignatedpoint_href,
    coalesce(cast(navaids_points_designatedpoint_pt_npalzy.title as varchar), '(' || navaids_points_designatedpoint_pt_npalzy.nilreason[1] || ')') AS startfixdesignatedpoint,
    navaids_points_designatedpoint_pt_npalzy.href AS startfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_bdrhhb.title as varchar), '(' || navaids_points_navaid_pt_bdrhhb.nilreason[1] || ')') AS endnavaidsystem,
    navaids_points_navaid_pt_bdrhhb.href AS endnavaidsystem_href,
    coalesce(cast(navaids_points_navaid_pt_nzcjqn.title as varchar), '(' || navaids_points_navaid_pt_nzcjqn.nilreason[1] || ')') AS startnavaidsystem,
    navaids_points_navaid_pt_nzcjqn.href AS startnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_wngzbu.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_wngzbu.nilreason[1] || ')') AS endaimingpoint,
    airport_heliport_touchdownliftoff_pt_wngzbu.href AS endaimingpoint_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_owvqzh.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_owvqzh.nilreason[1] || ')') AS startaimingpoint,
    airport_heliport_touchdownliftoff_pt_owvqzh.href AS startaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_dmqulx.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_dmqulx.nilreason[1] || ')') AS endrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_dmqulx.href AS endrunwaypoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_mtgnde.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_mtgnde.nilreason[1] || ')') AS startrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_mtgnde.href AS startrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_edbhoj.title as varchar), '(' || airport_heliport_airportheliport_pt_edbhoj.nilreason[1] || ')') AS endairportreferencepoint,
    airport_heliport_airportheliport_pt_edbhoj.href AS endairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_hubzpb.title as varchar), '(' || airport_heliport_airportheliport_pt_hubzpb.nilreason[1] || ')') AS startairportreferencepoint,
    airport_heliport_airportheliport_pt_hubzpb.href AS startairportreferencepoint_href,
    lat_annotation.annotation as annotation
from routes.directflightsegment_pt 
inner join routes.directflightsegment on routes.directflightsegment_pt.directflightsegment_id = routes.directflightsegment.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_fhrfed on routes.directflightsegment.end_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_fhrfed.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_bdrhhb on routes.directflightsegment.end_navaidsystem_id = navaids_points_navaid_pt_bdrhhb.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_wngzbu on routes.directflightsegment.end_aimingpoint_id = airport_heliport_touchdownliftoff_pt_wngzbu.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_dmqulx on routes.directflightsegment.end_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_dmqulx.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_edbhoj on routes.directflightsegment.end_airportreferencepoint_id = airport_heliport_airportheliport_pt_edbhoj.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_npalzy on routes.directflightsegment.start_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_npalzy.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_nzcjqn on routes.directflightsegment.start_navaidsystem_id = navaids_points_navaid_pt_nzcjqn.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_owvqzh on routes.directflightsegment.start_aimingpoint_id = airport_heliport_touchdownliftoff_pt_owvqzh.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_mtgnde on routes.directflightsegment.start_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_mtgnde.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_hubzpb on routes.directflightsegment.start_airportreferencepoint_id = airport_heliport_airportheliport_pt_hubzpb.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_fyhsqq.*) AS annotation
  from master_join master_join_stcpfm
  join notes.note_view notes_note_view_fyhsqq on master_join_stcpfm.target_id = notes_note_view_fyhsqq.id
  where master_join_stcpfm.source_id = routes.directflightsegment.id
) as lat_annotation on TRUE;
create index on routes.directflightsegment_view (id);
-- EnRouteSegmentPointPropertyType
-- ['geometry.point_view', 'notes.note_view']
drop materialized view if exists navaids_points.enroutesegmentpoint_view cascade;
create materialized view navaids_points.enroutesegmentpoint_view as
select
    navaids_points.enroutesegmentpoint_pt.id,
    navaids_points.enroutesegmentpoint_pt.nilreason AS enroutesegmentpoint_nilreason,
    coalesce(cast(navaids_points.enroutesegmentpoint.reportingatc_value as varchar), '(' || navaids_points.enroutesegmentpoint.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(navaids_points.enroutesegmentpoint.flyover_value as varchar), '(' || navaids_points.enroutesegmentpoint.flyover_nilreason || ')') as flyover,
    coalesce(cast(navaids_points.enroutesegmentpoint.waypoint_value as varchar), '(' || navaids_points.enroutesegmentpoint.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(navaids_points.enroutesegmentpoint.radarguidance_value as varchar), '(' || navaids_points.enroutesegmentpoint.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(navaids_points.enroutesegmentpoint.rolefreeflight_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolefreeflight_nilreason || ')') as rolefreeflight,
    coalesce(cast(navaids_points.enroutesegmentpoint.rolervsm_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolervsm_nilreason || ')') as rolervsm,
    coalesce(cast(navaids_points.enroutesegmentpoint.rolemilitarytraining_value as varchar), '(' || navaids_points.enroutesegmentpoint.rolemilitarytraining_nilreason || ')') as rolemilitarytraining,
    coalesce(cast(navaids_points.enroutesegmentpoint.turnradius_value as varchar) || ' ' || navaids_points.enroutesegmentpoint.turnradius_uom, '(' || navaids_points.enroutesegmentpoint.turnradius_nilreason || ')') as turnradius,
    coalesce(cast(navaids_points_designatedpoint_pt_yhipmk.title as varchar), '(' || navaids_points_designatedpoint_pt_yhipmk.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_pt_yhipmk.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_icrety.title as varchar), '(' || navaids_points_navaid_pt_icrety.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_pt_icrety.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_ykkvxh.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_ykkvxh.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_pt_ykkvxh.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_bjlxmv.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_bjlxmv.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_bjlxmv.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_lrnioh.title as varchar), '(' || airport_heliport_airportheliport_pt_lrnioh.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_pt_lrnioh.href AS pointchoiceairportreferencepoint_href,
    coalesce(cast(shared_radiofrequencyarea_pt_ddqmld.title as varchar), '(' || shared_radiofrequencyarea_pt_ddqmld.nilreason[1] || ')') AS extendedservicevolume,
    shared_radiofrequencyarea_pt_ddqmld.href AS extendedservicevolume_href,
    lat_facilitymakeup.lat_facilitymakeup as facilitymakeup,
    lat_annotation.annotation as annotation
from navaids_points.enroutesegmentpoint_pt 
inner join navaids_points.enroutesegmentpoint on navaids_points.enroutesegmentpoint_pt.enroutesegmentpoint_id = navaids_points.enroutesegmentpoint.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_yhipmk on navaids_points.enroutesegmentpoint.enroutesegmentpoint_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_yhipmk.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_icrety on navaids_points.enroutesegmentpoint.enroutesegmentpoint_navaidsystem_id = navaids_points_navaid_pt_icrety.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_ykkvxh on navaids_points.enroutesegmentpoint.enroutesegmentpoint_aimingpoint_id = airport_heliport_touchdownliftoff_pt_ykkvxh.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_bjlxmv on navaids_points.enroutesegmentpoint.enroutesegmentpoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_bjlxmv.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_lrnioh on navaids_points.enroutesegmentpoint.enroutesegmentpoint_airportreferencepoint_id = airport_heliport_airportheliport_pt_lrnioh.id
left join shared.radiofrequencyarea_pt shared_radiofrequencyarea_pt_ddqmld on navaids_points.enroutesegmentpoint.extendedservicevolume_id = shared_radiofrequencyarea_pt_ddqmld.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_pointreference_pt_kbbrhd.id) as lat_facilitymakeup
  from master_join master_join_skbody
  join navaids_points.pointreference_pt navaids_points_pointreference_pt_kbbrhd on master_join_skbody.target_id = navaids_points_pointreference_pt_kbbrhd.id
  where master_join_skbody.source_id = navaids_points.enroutesegmentpoint.id
) as lat_facilitymakeup on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jjqssv.*) AS annotation
  from master_join master_join_wgbfvb
  join notes.note_view notes_note_view_jjqssv on master_join_wgbfvb.target_id = notes_note_view_jjqssv.id
  where master_join_wgbfvb.source_id = navaids_points.enroutesegmentpoint.id
) as lat_annotation on TRUE;
create index on navaids_points.enroutesegmentpoint_view (id);
-- FlightConditionElementPropertyType
-- ['geometry.point_view', 'notes.note_view']
drop materialized view if exists routes.flightconditionelement_view cascade;
create materialized view routes.flightconditionelement_view as
select
    routes.flightconditionelement_pt.id,
    routes.flightconditionelement_pt.nilreason AS flightconditionelement_nilreason,
    coalesce(cast(routes.flightconditionelement.index_value as varchar), '(' || routes.flightconditionelement.index_nilreason || ')') as index,
    coalesce(cast(airport_heliport_airportheliport_pt_bwcynq.title as varchar), '(' || airport_heliport_airportheliport_pt_bwcynq.nilreason[1] || ')') AS flightconditionairportheliportcondition,
    airport_heliport_airportheliport_pt_bwcynq.href AS flightconditionairportheliportcondition_href,
    coalesce(cast(airport_heliport_airportheliport_pt_bgznsw.title as varchar), '(' || airport_heliport_airportheliport_pt_bgznsw.nilreason[1] || ')') AS significantpointconditionairportreferencepoint,
    airport_heliport_airportheliport_pt_bgznsw.href AS significantpointconditionairportreferencepoint_href,
    coalesce(cast(procedure_standardinstrumentdeparture_pt_tkmjlo.title as varchar), '(' || procedure_standardinstrumentdeparture_pt_tkmjlo.nilreason[1] || ')') AS flightconditionstandardinstrumentdeparturecondition,
    procedure_standardinstrumentdeparture_pt_tkmjlo.href AS flightconditionstandardinstrumentdeparturecondition_href,
    routes_routeportion_pt_xjpmlm.id AS flightconditionrouteportioncondition,
    coalesce(cast(organisation_organisationauthority_pt_sbevsf.title as varchar), '(' || organisation_organisationauthority_pt_sbevsf.nilreason[1] || ')') AS flightconditionorganisationcondition,
    organisation_organisationauthority_pt_sbevsf.href AS flightconditionorganisationcondition_href,
    coalesce(cast(navaids_points_designatedpoint_pt_loqdnv.title as varchar), '(' || navaids_points_designatedpoint_pt_loqdnv.nilreason[1] || ')') AS significantpointconditionfixdesignatedpoint,
    navaids_points_designatedpoint_pt_loqdnv.href AS significantpointconditionfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_ndafjz.title as varchar), '(' || navaids_points_navaid_pt_ndafjz.nilreason[1] || ')') AS significantpointconditionnavaidsystem,
    navaids_points_navaid_pt_ndafjz.href AS significantpointconditionnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_sjzovo.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_sjzovo.nilreason[1] || ')') AS significantpointconditionaimingpoint,
    airport_heliport_touchdownliftoff_pt_sjzovo.href AS significantpointconditionaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_gurvew.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_gurvew.nilreason[1] || ')') AS significantpointconditionrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_gurvew.href AS significantpointconditionrunwaypoint_href,
    shared_aircraftcharacteristic_pt_cggbeh.id AS flightconditionaircraft,
    coalesce(cast(routes_airspacebordercrossing_pt_ffizvf.title as varchar), '(' || routes_airspacebordercrossing_pt_ffizvf.nilreason[1] || ')') AS flightconditionbordercrossingcondition,
    routes_airspacebordercrossing_pt_ffizvf.href AS flightconditionbordercrossingcondition_href,
    coalesce(cast(airspace_airspace_pt_nvmkyi.title as varchar), '(' || airspace_airspace_pt_nvmkyi.nilreason[1] || ')') AS flightconditionairspacecondition,
    airspace_airspace_pt_nvmkyi.href AS flightconditionairspacecondition_href,
    shared_flightcharacteristic_pt_rkjdwj.id AS flightconditionflight,
    coalesce(cast(procedure_standardinstrumentarrival_pt_dxfkkj.title as varchar), '(' || procedure_standardinstrumentarrival_pt_dxfkkj.nilreason[1] || ')') AS flightconditionstandardinstrumentarrivalcondition,
    procedure_standardinstrumentarrival_pt_dxfkkj.href AS flightconditionstandardinstrumentarrivalcondition_href,
    routes_flightconditioncombination_pt_qohtbt.id AS flightconditionoperand,
    shared_meteorology_pt_yvztjb.id AS flightconditionweather,
    coalesce(cast(aerial_refuelling_aerialrefuelling_pt_edjwcv.title as varchar), '(' || aerial_refuelling_aerialrefuelling_pt_edjwcv.nilreason[1] || ')') AS flightconditionaerialrefuellingcondition,
    aerial_refuelling_aerialrefuelling_pt_edjwcv.href AS flightconditionaerialrefuellingcondition_href,
    routes_flightconditioncircumstance_pt_nwwuep.id AS operationalcondition,
    lat_flightlevel.lat_flightlevel as flightlevel,
    lat_annotation.annotation as annotation
from routes.flightconditionelement_pt 
inner join routes.flightconditionelement on routes.flightconditionelement_pt.flightconditionelement_id = routes.flightconditionelement.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_bwcynq on routes.flightconditionelement.flightcondition_airportheliportcondition_id = airport_heliport_airportheliport_pt_bwcynq.id
left join procedure.standardinstrumentdeparture_pt procedure_standardinstrumentdeparture_pt_tkmjlo on routes.flightconditionelement.flightcondition_standardinstrumentdeparturecondition_id = procedure_standardinstrumentdeparture_pt_tkmjlo.id
left join routes.routeportion_pt routes_routeportion_pt_xjpmlm on routes.flightconditionelement.flightcondition_routeportioncondition_id = routes_routeportion_pt_xjpmlm.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_sbevsf on routes.flightconditionelement.flightcondition_organisationcondition_id = organisation_organisationauthority_pt_sbevsf.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_loqdnv on routes.flightconditionelement.significantpointcondition_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_loqdnv.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_ndafjz on routes.flightconditionelement.significantpointcondition_navaidsystem_id = navaids_points_navaid_pt_ndafjz.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_sjzovo on routes.flightconditionelement.significantpointcondition_aimingpoint_id = airport_heliport_touchdownliftoff_pt_sjzovo.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_gurvew on routes.flightconditionelement.significantpointcondition_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_gurvew.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_bgznsw on routes.flightconditionelement.significantpointcondition_airportreferencepoint_id = airport_heliport_airportheliport_pt_bgznsw.id
left join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_cggbeh on routes.flightconditionelement.flightcondition_aircraft_id = shared_aircraftcharacteristic_pt_cggbeh.id
left join routes.airspacebordercrossing_pt routes_airspacebordercrossing_pt_ffizvf on routes.flightconditionelement.flightcondition_bordercrossingcondition_id = routes_airspacebordercrossing_pt_ffizvf.id
left join airspace.airspace_pt airspace_airspace_pt_nvmkyi on routes.flightconditionelement.flightcondition_airspacecondition_id = airspace_airspace_pt_nvmkyi.id
left join shared.flightcharacteristic_pt shared_flightcharacteristic_pt_rkjdwj on routes.flightconditionelement.flightcondition_flight_id = shared_flightcharacteristic_pt_rkjdwj.id
left join procedure.standardinstrumentarrival_pt procedure_standardinstrumentarrival_pt_dxfkkj on routes.flightconditionelement.flightcondition_standardinstrumentarrivalcondition_id = procedure_standardinstrumentarrival_pt_dxfkkj.id
left join routes.flightconditioncombination_pt routes_flightconditioncombination_pt_qohtbt on routes.flightconditionelement.flightcondition_operand_id = routes_flightconditioncombination_pt_qohtbt.id
left join shared.meteorology_pt shared_meteorology_pt_yvztjb on routes.flightconditionelement.flightcondition_weather_id = shared_meteorology_pt_yvztjb.id
left join aerial_refuelling.aerialrefuelling_pt aerial_refuelling_aerialrefuelling_pt_edjwcv on routes.flightconditionelement.flightcondition_aerialrefuellingcondition_id = aerial_refuelling_aerialrefuelling_pt_edjwcv.id
left join routes.flightconditioncircumstance_pt routes_flightconditioncircumstance_pt_nwwuep on routes.flightconditionelement.operationalcondition_id = routes_flightconditioncircumstance_pt_nwwuep.id
left join lateral(
  select jsonb_agg(DISTINCT routes_flightrestrictionlevel_pt_jvfdpz.id) as lat_flightlevel
  from master_join master_join_fksavo
  join routes.flightrestrictionlevel_pt routes_flightrestrictionlevel_pt_jvfdpz on master_join_fksavo.target_id = routes_flightrestrictionlevel_pt_jvfdpz.id
  where master_join_fksavo.source_id = routes.flightconditionelement.id
) as lat_flightlevel on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_cmzfoa.*) AS annotation
  from master_join master_join_mpsmmj
  join notes.note_view notes_note_view_cmzfoa on master_join_mpsmmj.target_id = notes_note_view_cmzfoa.id
  where master_join_mpsmmj.source_id = routes.flightconditionelement.id
) as lat_annotation on TRUE;
create index on routes.flightconditionelement_view (id);
-- FlightRoutingElementPropertyType
-- ['geometry.point_view', 'notes.note_view']
drop materialized view if exists routes.flightroutingelement_view cascade;
create materialized view routes.flightroutingelement_view as
select
    routes.flightroutingelement_pt.id,
    routes.flightroutingelement_pt.nilreason AS flightroutingelement_nilreason,
    coalesce(cast(routes.flightroutingelement.ordernumber_value as varchar), '(' || routes.flightroutingelement.ordernumber_nilreason || ')') as ordernumber,
    coalesce(cast(routes.flightroutingelement.speedreference_value as varchar), '(' || routes.flightroutingelement.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(routes.flightroutingelement.speedcriteria_value as varchar), '(' || routes.flightroutingelement.speedcriteria_nilreason || ')') as speedcriteria,
    coalesce(cast(routes.flightroutingelement.speed_value as varchar) || ' ' || routes.flightroutingelement.speed_uom, '(' || routes.flightroutingelement.speed_nilreason || ')') as speed,
    coalesce(cast(procedure_standardinstrumentarrival_pt_gvrfxp.title as varchar), '(' || procedure_standardinstrumentarrival_pt_gvrfxp.nilreason[1] || ')') AS elementstandardinstrumentarrivalelement,
    procedure_standardinstrumentarrival_pt_gvrfxp.href AS elementstandardinstrumentarrivalelement_href,
    coalesce(cast(airspace_airspace_pt_bmhlxe.title as varchar), '(' || airspace_airspace_pt_bmhlxe.nilreason[1] || ')') AS elementairspaceelement,
    airspace_airspace_pt_bmhlxe.href AS elementairspaceelement_href,
    coalesce(cast(navaids_points_designatedpoint_pt_tuyqvw.title as varchar), '(' || navaids_points_designatedpoint_pt_tuyqvw.nilreason[1] || ')') AS pointelementfixdesignatedpoint,
    navaids_points_designatedpoint_pt_tuyqvw.href AS pointelementfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_sbxugq.title as varchar), '(' || navaids_points_navaid_pt_sbxugq.nilreason[1] || ')') AS pointelementnavaidsystem,
    navaids_points_navaid_pt_sbxugq.href AS pointelementnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_tucass.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_tucass.nilreason[1] || ')') AS pointelementaimingpoint,
    airport_heliport_touchdownliftoff_pt_tucass.href AS pointelementaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_fqitrt.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_fqitrt.nilreason[1] || ')') AS pointelementrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_fqitrt.href AS pointelementrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_csvdcs.title as varchar), '(' || airport_heliport_airportheliport_pt_csvdcs.nilreason[1] || ')') AS pointelementairportreferencepoint,
    airport_heliport_airportheliport_pt_csvdcs.href AS pointelementairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_pemmpl.title as varchar), '(' || airport_heliport_airportheliport_pt_pemmpl.nilreason[1] || ')') AS elementairportheliportelement,
    airport_heliport_airportheliport_pt_pemmpl.href AS elementairportheliportelement_href,
    routes_directflightsegment_pt_mrfsvr.id AS elementdirectflightelement,
    coalesce(cast(procedure_standardinstrumentdeparture_pt_ykurpf.title as varchar), '(' || procedure_standardinstrumentdeparture_pt_ykurpf.nilreason[1] || ')') AS elementstandardinstrumentdepartureelement,
    procedure_standardinstrumentdeparture_pt_ykurpf.href AS elementstandardinstrumentdepartureelement_href,
    routes_routeportion_pt_bxblyk.id AS elementrouteportionelement,
    coalesce(cast(aerial_refuelling_aerialrefuelling_pt_wjsyeu.title as varchar), '(' || aerial_refuelling_aerialrefuelling_pt_wjsyeu.nilreason[1] || ')') AS elementaerialrefuellingelement,
    aerial_refuelling_aerialrefuelling_pt_wjsyeu.href AS elementaerialrefuellingelement_href,
    lat_flightlevel.lat_flightlevel as flightlevel,
    lat_annotation.annotation as annotation
from routes.flightroutingelement_pt 
inner join routes.flightroutingelement on routes.flightroutingelement_pt.flightroutingelement_id = routes.flightroutingelement.id
left join procedure.standardinstrumentarrival_pt procedure_standardinstrumentarrival_pt_gvrfxp on routes.flightroutingelement.element_standardinstrumentarrivalelement_id = procedure_standardinstrumentarrival_pt_gvrfxp.id
left join airspace.airspace_pt airspace_airspace_pt_bmhlxe on routes.flightroutingelement.element_airspaceelement_id = airspace_airspace_pt_bmhlxe.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_tuyqvw on routes.flightroutingelement.pointelement_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_tuyqvw.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_sbxugq on routes.flightroutingelement.pointelement_navaidsystem_id = navaids_points_navaid_pt_sbxugq.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_tucass on routes.flightroutingelement.pointelement_aimingpoint_id = airport_heliport_touchdownliftoff_pt_tucass.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_fqitrt on routes.flightroutingelement.pointelement_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_fqitrt.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_csvdcs on routes.flightroutingelement.pointelement_airportreferencepoint_id = airport_heliport_airportheliport_pt_csvdcs.id
left join routes.directflightsegment_pt routes_directflightsegment_pt_mrfsvr on routes.flightroutingelement.element_directflightelement_id = routes_directflightsegment_pt_mrfsvr.id
left join procedure.standardinstrumentdeparture_pt procedure_standardinstrumentdeparture_pt_ykurpf on routes.flightroutingelement.element_standardinstrumentdepartureelement_id = procedure_standardinstrumentdeparture_pt_ykurpf.id
left join routes.routeportion_pt routes_routeportion_pt_bxblyk on routes.flightroutingelement.element_routeportionelement_id = routes_routeportion_pt_bxblyk.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_pemmpl on routes.flightroutingelement.element_airportheliportelement_id = airport_heliport_airportheliport_pt_pemmpl.id
left join aerial_refuelling.aerialrefuelling_pt aerial_refuelling_aerialrefuelling_pt_wjsyeu on routes.flightroutingelement.element_aerialrefuellingelement_id = aerial_refuelling_aerialrefuelling_pt_wjsyeu.id
left join lateral(
  select jsonb_agg(DISTINCT routes_flightrestrictionlevel_pt_vwcfxp.id) as lat_flightlevel
  from master_join master_join_edanvj
  join routes.flightrestrictionlevel_pt routes_flightrestrictionlevel_pt_vwcfxp on master_join_edanvj.target_id = routes_flightrestrictionlevel_pt_vwcfxp.id
  where master_join_edanvj.source_id = routes.flightroutingelement.id
) as lat_flightlevel on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wizfcg.*) AS annotation
  from master_join master_join_tqvdbq
  join notes.note_view notes_note_view_wizfcg on master_join_tqvdbq.target_id = notes_note_view_wizfcg.id
  where master_join_tqvdbq.source_id = routes.flightroutingelement.id
) as lat_annotation on TRUE;
create index on routes.flightroutingelement_view (id);
-- RoutePortionPropertyType
-- ['geometry.point_view', 'notes.note_view']
drop materialized view if exists routes.routeportion_view cascade;
create materialized view routes.routeportion_view as
select
    routes.routeportion_pt.id,
    routes.routeportion_pt.nilreason AS routeportion_nilreason,
    coalesce(cast(navaids_points_designatedpoint_pt_wqoqoe.title as varchar), '(' || navaids_points_designatedpoint_pt_wqoqoe.nilreason[1] || ')') AS startfixdesignatedpoint,
    navaids_points_designatedpoint_pt_wqoqoe.href AS startfixdesignatedpoint_href,
    coalesce(cast(navaids_points_designatedpoint_pt_wutafh.title as varchar), '(' || navaids_points_designatedpoint_pt_wutafh.nilreason[1] || ')') AS intermediatepointfixdesignatedpoint,
    navaids_points_designatedpoint_pt_wutafh.href AS intermediatepointfixdesignatedpoint_href,
    coalesce(cast(navaids_points_designatedpoint_pt_vbuwkw.title as varchar), '(' || navaids_points_designatedpoint_pt_vbuwkw.nilreason[1] || ')') AS endfixdesignatedpoint,
    navaids_points_designatedpoint_pt_vbuwkw.href AS endfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_xcfezp.title as varchar), '(' || navaids_points_navaid_pt_xcfezp.nilreason[1] || ')') AS startnavaidsystem,
    navaids_points_navaid_pt_xcfezp.href AS startnavaidsystem_href,
    coalesce(cast(navaids_points_navaid_pt_tuxbfm.title as varchar), '(' || navaids_points_navaid_pt_tuxbfm.nilreason[1] || ')') AS intermediatepointnavaidsystem,
    navaids_points_navaid_pt_tuxbfm.href AS intermediatepointnavaidsystem_href,
    coalesce(cast(navaids_points_navaid_pt_wucxyy.title as varchar), '(' || navaids_points_navaid_pt_wucxyy.nilreason[1] || ')') AS endnavaidsystem,
    navaids_points_navaid_pt_wucxyy.href AS endnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_qsqhxd.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_qsqhxd.nilreason[1] || ')') AS startaimingpoint,
    airport_heliport_touchdownliftoff_pt_qsqhxd.href AS startaimingpoint_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_svxuee.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_svxuee.nilreason[1] || ')') AS intermediatepointaimingpoint,
    airport_heliport_touchdownliftoff_pt_svxuee.href AS intermediatepointaimingpoint_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_zsynqm.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_zsynqm.nilreason[1] || ')') AS endaimingpoint,
    airport_heliport_touchdownliftoff_pt_zsynqm.href AS endaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_acabay.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_acabay.nilreason[1] || ')') AS startrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_acabay.href AS startrunwaypoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_fzulef.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_fzulef.nilreason[1] || ')') AS intermediatepointrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_fzulef.href AS intermediatepointrunwaypoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_zwjhkm.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_zwjhkm.nilreason[1] || ')') AS endrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_zwjhkm.href AS endrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_jdofhm.title as varchar), '(' || airport_heliport_airportheliport_pt_jdofhm.nilreason[1] || ')') AS startairportreferencepoint,
    airport_heliport_airportheliport_pt_jdofhm.href AS startairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_qaedig.title as varchar), '(' || airport_heliport_airportheliport_pt_qaedig.nilreason[1] || ')') AS intermediatepointairportreferencepoint,
    airport_heliport_airportheliport_pt_qaedig.href AS intermediatepointairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_kktbie.title as varchar), '(' || airport_heliport_airportheliport_pt_kktbie.nilreason[1] || ')') AS endairportreferencepoint,
    airport_heliport_airportheliport_pt_kktbie.href AS endairportreferencepoint_href,
    coalesce(cast(routes_route_pt_mwgxag.title as varchar), '(' || routes_route_pt_mwgxag.nilreason[1] || ')') AS referencedroute,
    routes_route_pt_mwgxag.href AS referencedroute_href,
    lat_annotation.annotation as annotation
from routes.routeportion_pt 
inner join routes.routeportion on routes.routeportion_pt.routeportion_id = routes.routeportion.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_wqoqoe on routes.routeportion.start_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_wqoqoe.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_xcfezp on routes.routeportion.start_navaidsystem_id = navaids_points_navaid_pt_xcfezp.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_qsqhxd on routes.routeportion.start_aimingpoint_id = airport_heliport_touchdownliftoff_pt_qsqhxd.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_acabay on routes.routeportion.start_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_acabay.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_jdofhm on routes.routeportion.start_airportreferencepoint_id = airport_heliport_airportheliport_pt_jdofhm.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_wutafh on routes.routeportion.intermediatepoint_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_wutafh.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_tuxbfm on routes.routeportion.intermediatepoint_navaidsystem_id = navaids_points_navaid_pt_tuxbfm.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_svxuee on routes.routeportion.intermediatepoint_aimingpoint_id = airport_heliport_touchdownliftoff_pt_svxuee.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_fzulef on routes.routeportion.intermediatepoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_fzulef.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_qaedig on routes.routeportion.intermediatepoint_airportreferencepoint_id = airport_heliport_airportheliport_pt_qaedig.id
left join routes.route_pt routes_route_pt_mwgxag on routes.routeportion.referencedroute_id = routes_route_pt_mwgxag.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_vbuwkw on routes.routeportion.end_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_vbuwkw.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_wucxyy on routes.routeportion.end_navaidsystem_id = navaids_points_navaid_pt_wucxyy.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_zsynqm on routes.routeportion.end_aimingpoint_id = airport_heliport_touchdownliftoff_pt_zsynqm.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_zwjhkm on routes.routeportion.end_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_zwjhkm.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_kktbie on routes.routeportion.end_airportreferencepoint_id = airport_heliport_airportheliport_pt_kktbie.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_nlvbqx.*) AS annotation
  from master_join master_join_wlxisp
  join notes.note_view notes_note_view_nlvbqx on master_join_wlxisp.target_id = notes_note_view_nlvbqx.id
  where master_join_wlxisp.source_id = routes.routeportion.id
) as lat_annotation on TRUE;
create index on routes.routeportion_view (id);
-- TerminalSegmentPointPropertyType
-- ['geometry.point_view', 'notes.note_view']
drop materialized view if exists navaids_points.terminalsegmentpoint_view cascade;
create materialized view navaids_points.terminalsegmentpoint_view as
select
    navaids_points.terminalsegmentpoint_pt.id,
    navaids_points.terminalsegmentpoint_pt.nilreason AS terminalsegmentpoint_nilreason,
    coalesce(cast(navaids_points.terminalsegmentpoint.reportingatc_value as varchar), '(' || navaids_points.terminalsegmentpoint.reportingatc_nilreason || ')') as reportingatc,
    coalesce(cast(navaids_points.terminalsegmentpoint.flyover_value as varchar), '(' || navaids_points.terminalsegmentpoint.flyover_nilreason || ')') as flyover,
    coalesce(cast(navaids_points.terminalsegmentpoint.waypoint_value as varchar), '(' || navaids_points.terminalsegmentpoint.waypoint_nilreason || ')') as waypoint,
    coalesce(cast(navaids_points.terminalsegmentpoint.radarguidance_value as varchar), '(' || navaids_points.terminalsegmentpoint.radarguidance_nilreason || ')') as radarguidance,
    coalesce(cast(navaids_points.terminalsegmentpoint.role_value as varchar), '(' || navaids_points.terminalsegmentpoint.role_nilreason || ')') as role,
    coalesce(cast(navaids_points.terminalsegmentpoint.leadradial_value as varchar), '(' || navaids_points.terminalsegmentpoint.leadradial_nilreason || ')') as leadradial,
    coalesce(cast(navaids_points.terminalsegmentpoint.indicatorfacf_value as varchar), '(' || navaids_points.terminalsegmentpoint.indicatorfacf_nilreason || ')') as indicatorfacf,
    coalesce(cast(navaids_points.terminalsegmentpoint.leaddme_value as varchar) || ' ' || navaids_points.terminalsegmentpoint.leaddme_uom, '(' || navaids_points.terminalsegmentpoint.leaddme_nilreason || ')') as leaddme,
    coalesce(cast(navaids_points_designatedpoint_pt_qgqojq.title as varchar), '(' || navaids_points_designatedpoint_pt_qgqojq.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_pt_qgqojq.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_nbofia.title as varchar), '(' || navaids_points_navaid_pt_nbofia.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_pt_nbofia.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_sgsara.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_sgsara.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_pt_sgsara.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_gyoqzn.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_gyoqzn.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_gyoqzn.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_lkxcsu.title as varchar), '(' || airport_heliport_airportheliport_pt_lkxcsu.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_pt_lkxcsu.href AS pointchoiceairportreferencepoint_href,
    coalesce(cast(shared_radiofrequencyarea_pt_bolgku.title as varchar), '(' || shared_radiofrequencyarea_pt_bolgku.nilreason[1] || ')') AS extendedservicevolume,
    shared_radiofrequencyarea_pt_bolgku.href AS extendedservicevolume_href,
    lat_facilitymakeup.lat_facilitymakeup as facilitymakeup,
    lat_annotation.annotation as annotation
from navaids_points.terminalsegmentpoint_pt 
inner join navaids_points.terminalsegmentpoint on navaids_points.terminalsegmentpoint_pt.terminalsegmentpoint_id = navaids_points.terminalsegmentpoint.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_qgqojq on navaids_points.terminalsegmentpoint.terminalsegmentpoint_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_qgqojq.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_nbofia on navaids_points.terminalsegmentpoint.terminalsegmentpoint_navaidsystem_id = navaids_points_navaid_pt_nbofia.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_sgsara on navaids_points.terminalsegmentpoint.terminalsegmentpoint_aimingpoint_id = airport_heliport_touchdownliftoff_pt_sgsara.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_gyoqzn on navaids_points.terminalsegmentpoint.terminalsegmentpoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_gyoqzn.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_lkxcsu on navaids_points.terminalsegmentpoint.terminalsegmentpoint_airportreferencepoint_id = airport_heliport_airportheliport_pt_lkxcsu.id
left join shared.radiofrequencyarea_pt shared_radiofrequencyarea_pt_bolgku on navaids_points.terminalsegmentpoint.extendedservicevolume_id = shared_radiofrequencyarea_pt_bolgku.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_pointreference_pt_dwokmq.id) as lat_facilitymakeup
  from master_join master_join_nqcfyz
  join navaids_points.pointreference_pt navaids_points_pointreference_pt_dwokmq on master_join_nqcfyz.target_id = navaids_points_pointreference_pt_dwokmq.id
  where master_join_nqcfyz.source_id = navaids_points.terminalsegmentpoint.id
) as lat_facilitymakeup on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_dyfuom.*) AS annotation
  from master_join master_join_mibwrf
  join notes.note_view notes_note_view_dyfuom on master_join_mibwrf.target_id = notes_note_view_dyfuom.id
  where master_join_mibwrf.source_id = navaids_points.terminalsegmentpoint.id
) as lat_annotation on TRUE;
create index on navaids_points.terminalsegmentpoint_view (id);
-- AerialRefuellingAnchorPropertyType
-- ['notes.note_view', 'geometry.surface_view']
drop materialized view if exists aerial_refuelling.aerialrefuellinganchor_view cascade;
create materialized view aerial_refuelling.aerialrefuellinganchor_view as
select
    aerial_refuelling.aerialrefuellinganchor_pt.id,
    aerial_refuelling.aerialrefuellinganchor_pt.nilreason AS aerialrefuellinganchor_nilreason,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.outboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.outboundcourse_nilreason || ')') as outboundcourse,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_nilreason || ')') as outboundcoursetype,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.inboundcourse_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.inboundcourse_nilreason || ')') as inboundcourse,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.turndirection_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_value as varchar), '(' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_nilreason || ')') as refuellingbaselevelreference,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.speedlimit_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.speedlimit_uom, '(' || aerial_refuelling.aerialrefuellinganchor.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.legseparation_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.legseparation_uom, '(' || aerial_refuelling.aerialrefuellinganchor.legseparation_nilreason || ')') as legseparation,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.leglength_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.leglength_uom, '(' || aerial_refuelling.aerialrefuellinganchor.leglength_nilreason || ')') as leglength,
    coalesce(cast(aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_value as varchar) || ' ' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_uom, '(' || aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_nilreason || ')') as refuellingbaselevel,
    lat_verticalextent.lat_verticalextent as verticalextent,
    lat_point.lat_point as point,
    lat_annotation.annotation as annotation
from aerial_refuelling.aerialrefuellinganchor_pt 
inner join aerial_refuelling.aerialrefuellinganchor on aerial_refuelling.aerialrefuellinganchor_pt.aerialrefuellinganchor_id = aerial_refuelling.aerialrefuellinganchor.id
left join lateral(
  select jsonb_agg(DISTINCT shared_airspacelayer_pt_jqjndr.id) as lat_verticalextent
  from master_join master_join_wbpmlp
  join shared.airspacelayer_pt shared_airspacelayer_pt_jqjndr on master_join_wbpmlp.target_id = shared_airspacelayer_pt_jqjndr.id
  where master_join_wbpmlp.source_id = aerial_refuelling.aerialrefuellinganchor.id
) as lat_verticalextent on TRUE
left join lateral(
  select jsonb_agg(DISTINCT aerial_refuelling_aerialrefuellingpoint_pt_vyrcww.id) as lat_point
  from master_join master_join_esxczo
  join aerial_refuelling.aerialrefuellingpoint_pt aerial_refuelling_aerialrefuellingpoint_pt_vyrcww on master_join_esxczo.target_id = aerial_refuelling_aerialrefuellingpoint_pt_vyrcww.id
  where master_join_esxczo.source_id = aerial_refuelling.aerialrefuellinganchor.id
) as lat_point on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_bfchoh.*) AS annotation
  from master_join master_join_btzlpn
  join notes.note_view notes_note_view_bfchoh on master_join_btzlpn.target_id = notes_note_view_bfchoh.id
  where master_join_btzlpn.source_id = aerial_refuelling.aerialrefuellinganchor.id
) as lat_annotation on TRUE;
create index on aerial_refuelling.aerialrefuellinganchor_view (id);
-- AirspaceVolumePropertyType
-- ['geometry.curve_view', 'notes.note_view', 'geometry.surface_view']
drop materialized view if exists airspace.airspacevolume_view cascade;
create materialized view airspace.airspacevolume_view as
select
    airspace.airspacevolume_pt.id,
    airspace.airspacevolume_pt.nilreason AS airspacevolume_nilreason,
    coalesce(cast(airspace.airspacevolume.upperlimitreference_value as varchar), '(' || airspace.airspacevolume.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(airspace.airspacevolume.maximumlimitreference_value as varchar), '(' || airspace.airspacevolume.maximumlimitreference_nilreason || ')') as maximumlimitreference,
    coalesce(cast(airspace.airspacevolume.lowerlimitreference_value as varchar), '(' || airspace.airspacevolume.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(airspace.airspacevolume.minimumlimitreference_value as varchar), '(' || airspace.airspacevolume.minimumlimitreference_nilreason || ')') as minimumlimitreference,
    coalesce(cast(airspace.airspacevolume.upperlimit_value as varchar) || ' ' || airspace.airspacevolume.upperlimit_uom, '(' || airspace.airspacevolume.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(airspace.airspacevolume.maximumlimit_value as varchar) || ' ' || airspace.airspacevolume.maximumlimit_uom, '(' || airspace.airspacevolume.maximumlimit_nilreason || ')') as maximumlimit,
    coalesce(cast(airspace.airspacevolume.lowerlimit_value as varchar) || ' ' || airspace.airspacevolume.lowerlimit_uom, '(' || airspace.airspacevolume.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(airspace.airspacevolume.minimumlimit_value as varchar) || ' ' || airspace.airspacevolume.minimumlimit_uom, '(' || airspace.airspacevolume.minimumlimit_nilreason || ')') as minimumlimit,
    coalesce(cast(airspace.airspacevolume.width_value as varchar) || ' ' || airspace.airspacevolume.width_uom, '(' || airspace.airspacevolume.width_nilreason || ')') as width,
    airspace_airspacevolumedependency_pt_tetsvw.id AS contributorairspace,
    lat_annotation.annotation as annotation
from airspace.airspacevolume_pt 
inner join airspace.airspacevolume on airspace.airspacevolume_pt.airspacevolume_id = airspace.airspacevolume.id
left join airspace.airspacevolumedependency_pt airspace_airspacevolumedependency_pt_tetsvw on airspace.airspacevolume.contributorairspace_id = airspace_airspacevolumedependency_pt_tetsvw.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_nmperp.*) AS annotation
  from master_join master_join_eamecx
  join notes.note_view notes_note_view_nmperp on master_join_eamecx.target_id = notes_note_view_nmperp.id
  where master_join_eamecx.source_id = airspace.airspacevolume.id
) as lat_annotation on TRUE;
create index on airspace.airspacevolume_view (id);
-- NavigationAreaSectorPropertyType
-- ['notes.note_view', 'geometry.surface_view']
drop materialized view if exists procedure.navigationareasector_view cascade;
create materialized view procedure.navigationareasector_view as
select
    procedure.navigationareasector_pt.id,
    procedure.navigationareasector_pt.nilreason AS navigationareasector_nilreason,
    shared_circlesector_pt_azrkps.id AS sectordefinition,
    lat_significantobstacle.lat_significantobstacle as significantobstacle,
    lat_sectorcriteria.lat_sectorcriteria as sectorcriteria,
    lat_annotation.annotation as annotation
from procedure.navigationareasector_pt 
inner join procedure.navigationareasector on procedure.navigationareasector_pt.navigationareasector_id = procedure.navigationareasector.id
left join shared.circlesector_pt shared_circlesector_pt_azrkps on procedure.navigationareasector.sectordefinition_id = shared_circlesector_pt_azrkps.id
left join lateral(
  select jsonb_agg(DISTINCT shared_obstruction_pt_banogq.id) as lat_significantobstacle
  from master_join master_join_ultidj
  join shared.obstruction_pt shared_obstruction_pt_banogq on master_join_ultidj.target_id = shared_obstruction_pt_banogq.id
  where master_join_ultidj.source_id = procedure.navigationareasector.id
) as lat_significantobstacle on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_sectordesign_pt_cnbtmk.id) as lat_sectorcriteria
  from master_join master_join_ztjsbv
  join procedure.sectordesign_pt procedure_sectordesign_pt_cnbtmk on master_join_ztjsbv.target_id = procedure_sectordesign_pt_cnbtmk.id
  where master_join_ztjsbv.source_id = procedure.navigationareasector.id
) as lat_sectorcriteria on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_bdnnpf.*) AS annotation
  from master_join master_join_wxkqsu
  join notes.note_view notes_note_view_bdnnpf on master_join_wxkqsu.target_id = notes_note_view_bdnnpf.id
  where master_join_wxkqsu.source_id = procedure.navigationareasector.id
) as lat_annotation on TRUE;
create index on procedure.navigationareasector_view (id);
-- ObstacleAssessmentAreaPropertyType
-- ['geometry.curve_view', 'notes.note_view', 'geometry.surface_view']
drop materialized view if exists shared.obstacleassessmentarea_view cascade;
create materialized view shared.obstacleassessmentarea_view as
select
    shared.obstacleassessmentarea_pt.id,
    shared.obstacleassessmentarea_pt.nilreason AS obstacleassessmentarea_nilreason,
    coalesce(cast(shared.obstacleassessmentarea.type_value as varchar), '(' || shared.obstacleassessmentarea.type_nilreason || ')') as type,
    coalesce(cast(shared.obstacleassessmentarea.sectionnumber_value as varchar), '(' || shared.obstacleassessmentarea.sectionnumber_nilreason || ')') as sectionnumber,
    coalesce(cast(shared.obstacleassessmentarea.slope_value as varchar), '(' || shared.obstacleassessmentarea.slope_nilreason || ')') as slope,
    coalesce(cast(shared.obstacleassessmentarea.gradientlowhigh_value as varchar), '(' || shared.obstacleassessmentarea.gradientlowhigh_nilreason || ')') as gradientlowhigh,
    coalesce(cast(shared.obstacleassessmentarea.surfacezone_value as varchar), '(' || shared.obstacleassessmentarea.surfacezone_nilreason || ')') as surfacezone,
    coalesce(cast(shared.obstacleassessmentarea.safetyregulation_value as varchar), '(' || shared.obstacleassessmentarea.safetyregulation_nilreason || ')') as safetyregulation,
    coalesce(cast(shared.obstacleassessmentarea.assessedaltitude_value as varchar) || ' ' || shared.obstacleassessmentarea.assessedaltitude_uom, '(' || shared.obstacleassessmentarea.assessedaltitude_nilreason || ')') as assessedaltitude,
    coalesce(cast(shared.obstacleassessmentarea.slopeloweraltitude_value as varchar) || ' ' || shared.obstacleassessmentarea.slopeloweraltitude_uom, '(' || shared.obstacleassessmentarea.slopeloweraltitude_nilreason || ')') as slopeloweraltitude,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_significantobstacle.lat_significantobstacle as significantobstacle,
    lat_annotation.annotation as annotation
from shared.obstacleassessmentarea_pt 
inner join shared.obstacleassessmentarea on shared.obstacleassessmentarea_pt.obstacleassessmentarea_id = shared.obstacleassessmentarea.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_pt_gheywx.id) as lat_aircraftcategory
  from master_join master_join_fxpwmp
  join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_gheywx on master_join_fxpwmp.target_id = shared_aircraftcharacteristic_pt_gheywx.id
  where master_join_fxpwmp.source_id = shared.obstacleassessmentarea.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstruction_pt_zzsjcs.id) as lat_significantobstacle
  from master_join master_join_uyojsa
  join shared.obstruction_pt shared_obstruction_pt_zzsjcs on master_join_uyojsa.target_id = shared_obstruction_pt_zzsjcs.id
  where master_join_uyojsa.source_id = shared.obstacleassessmentarea.id
) as lat_significantobstacle on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_tjrjxh.*) AS annotation
  from master_join master_join_ctmocs
  join notes.note_view notes_note_view_tjrjxh on master_join_ctmocs.target_id = notes_note_view_tjrjxh.id
  where master_join_ctmocs.source_id = shared.obstacleassessmentarea.id
) as lat_annotation on TRUE;
create index on shared.obstacleassessmentarea_view (id);
-- PointReferencePropertyType
-- ['notes.note_view', 'geometry.surface_view']
drop materialized view if exists navaids_points.pointreference_view cascade;
create materialized view navaids_points.pointreference_view as
select
    navaids_points.pointreference_pt.id,
    navaids_points.pointreference_pt.nilreason AS pointreference_nilreason,
    coalesce(cast(navaids_points.pointreference.role_value as varchar), '(' || navaids_points.pointreference.role_nilreason || ')') as role,
    coalesce(cast(navaids_points.pointreference.priorfixtolerance_value as varchar) || ' ' || navaids_points.pointreference.priorfixtolerance_uom, '(' || navaids_points.pointreference.priorfixtolerance_nilreason || ')') as priorfixtolerance,
    coalesce(cast(navaids_points.pointreference.postfixtolerance_value as varchar) || ' ' || navaids_points.pointreference.postfixtolerance_uom, '(' || navaids_points.pointreference.postfixtolerance_nilreason || ')') as postfixtolerance,
    coalesce(cast(navaids_points_designatedpoint_pt_gcqdyj.title as varchar), '(' || navaids_points_designatedpoint_pt_gcqdyj.nilreason[1] || ')') AS point,
    navaids_points_designatedpoint_pt_gcqdyj.href AS point_href,
    lat_facilityangle.lat_facilityangle as facilityangle,
    lat_facilitydistance.lat_facilitydistance as facilitydistance,
    lat_annotation.annotation as annotation
from navaids_points.pointreference_pt 
inner join navaids_points.pointreference on navaids_points.pointreference_pt.pointreference_id = navaids_points.pointreference.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_gcqdyj on navaids_points.pointreference.point_id = navaids_points_designatedpoint_pt_gcqdyj.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_angleuse_pt_ekrryp.id) as lat_facilityangle
  from master_join master_join_jwblom
  join navaids_points.angleuse_pt navaids_points_angleuse_pt_ekrryp on master_join_jwblom.target_id = navaids_points_angleuse_pt_ekrryp.id
  where master_join_jwblom.source_id = navaids_points.pointreference.id
) as lat_facilityangle on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', navaids_points_distanceindication_pt_rnykiz.id,
      'title', coalesce(cast(navaids_points_distanceindication_pt_rnykiz.title AS varchar), '(' || navaids_points_distanceindication_pt_rnykiz.nilreason[1] || ')'),
      'href', navaids_points_distanceindication_pt_rnykiz.href
  )) as lat_facilitydistance  from master_join master_join_rftkkg
  join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_rnykiz on master_join_rftkkg.target_id = navaids_points_distanceindication_pt_rnykiz.id
  where master_join_rftkkg.source_id = navaids_points.pointreference.id
) as lat_facilitydistance on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xyuhys.*) AS annotation
  from master_join master_join_zuqrfo
  join notes.note_view notes_note_view_xyuhys on master_join_zuqrfo.target_id = notes_note_view_xyuhys.id
  where master_join_zuqrfo.source_id = navaids_points.pointreference.id
) as lat_annotation on TRUE;
create index on navaids_points.pointreference_view (id);
-- SafeAltitudeAreaSectorPropertyType
-- ['notes.note_view', 'geometry.surface_view']
drop materialized view if exists procedure.safealtitudeareasector_view cascade;
create materialized view procedure.safealtitudeareasector_view as
select
    procedure.safealtitudeareasector_pt.id,
    procedure.safealtitudeareasector_pt.nilreason AS safealtitudeareasector_nilreason,
    coalesce(cast(procedure.safealtitudeareasector.bufferwidth_value as varchar) || ' ' || procedure.safealtitudeareasector.bufferwidth_uom, '(' || procedure.safealtitudeareasector.bufferwidth_nilreason || ')') as bufferwidth,
    shared_circlesector_pt_sgvnwf.id AS sectordefinition,
    lat_significantobstacle.lat_significantobstacle as significantobstacle,
    lat_annotation.annotation as annotation
from procedure.safealtitudeareasector_pt 
inner join procedure.safealtitudeareasector on procedure.safealtitudeareasector_pt.safealtitudeareasector_id = procedure.safealtitudeareasector.id
left join shared.circlesector_pt shared_circlesector_pt_sgvnwf on procedure.safealtitudeareasector.sectordefinition_id = shared_circlesector_pt_sgvnwf.id
left join lateral(
  select jsonb_agg(DISTINCT shared_obstruction_pt_ddrqai.id) as lat_significantobstacle
  from master_join master_join_njmnmv
  join shared.obstruction_pt shared_obstruction_pt_ddrqai on master_join_njmnmv.target_id = shared_obstruction_pt_ddrqai.id
  where master_join_njmnmv.source_id = procedure.safealtitudeareasector.id
) as lat_significantobstacle on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_dqjttg.*) AS annotation
  from master_join master_join_isknsf
  join notes.note_view notes_note_view_dqjttg on master_join_isknsf.target_id = notes_note_view_dqjttg.id
  where master_join_isknsf.source_id = procedure.safealtitudeareasector.id
) as lat_annotation on TRUE;
create index on procedure.safealtitudeareasector_view (id);
-- TerminalArrivalAreaSectorPropertyType
-- ['notes.note_view', 'geometry.surface_view']
drop materialized view if exists procedure.terminalarrivalareasector_view cascade;
create materialized view procedure.terminalarrivalareasector_view as
select
    procedure.terminalarrivalareasector_pt.id,
    procedure.terminalarrivalareasector_pt.nilreason AS terminalarrivalareasector_nilreason,
    coalesce(cast(procedure.terminalarrivalareasector.flybycode_value as varchar), '(' || procedure.terminalarrivalareasector.flybycode_nilreason || ')') as flybycode,
    coalesce(cast(procedure.terminalarrivalareasector.procedureturnrequired_value as varchar), '(' || procedure.terminalarrivalareasector.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.terminalarrivalareasector.altitudedescription_value as varchar), '(' || procedure.terminalarrivalareasector.altitudedescription_nilreason || ')') as altitudedescription,
    shared_circlesector_pt_pbnskf.id AS sectordefinition,
    lat_significantobstacle.lat_significantobstacle as significantobstacle,
    lat_annotation.annotation as annotation
from procedure.terminalarrivalareasector_pt 
inner join procedure.terminalarrivalareasector on procedure.terminalarrivalareasector_pt.terminalarrivalareasector_id = procedure.terminalarrivalareasector.id
left join shared.circlesector_pt shared_circlesector_pt_pbnskf on procedure.terminalarrivalareasector.sectordefinition_id = shared_circlesector_pt_pbnskf.id
left join lateral(
  select jsonb_agg(DISTINCT shared_obstruction_pt_asudwt.id) as lat_significantobstacle
  from master_join master_join_orctse
  join shared.obstruction_pt shared_obstruction_pt_asudwt on master_join_orctse.target_id = shared_obstruction_pt_asudwt.id
  where master_join_orctse.source_id = procedure.terminalarrivalareasector.id
) as lat_significantobstacle on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qcknlz.*) AS annotation
  from master_join master_join_ubthga
  join notes.note_view notes_note_view_qcknlz on master_join_ubthga.target_id = notes_note_view_qcknlz.id
  where master_join_ubthga.source_id = procedure.terminalarrivalareasector.id
) as lat_annotation on TRUE;
create index on procedure.terminalarrivalareasector_view (id);
-- AirportHeliportAvailabilityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.airportheliportavailability_view cascade;
create materialized view airport_heliport.airportheliportavailability_view as
select
    airport_heliport.airportheliportavailability_pt.id,
    airport_heliport.airportheliportavailability_pt.nilreason AS airportheliportavailability_nilreason,
    coalesce(cast(airport_heliport.airportheliportavailability.operationalstatus_value as varchar), '(' || airport_heliport.airportheliportavailability.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(airport_heliport.airportheliportavailability.warning_value as varchar), '(' || airport_heliport.airportheliportavailability.warning_nilreason || ')') as warning,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_usage.lat_usage as usage
from airport_heliport.airportheliportavailability_pt 
inner join airport_heliport.airportheliportavailability on airport_heliport.airportheliportavailability_pt.airportheliportavailability_id = airport_heliport.airportheliportavailability.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_ofncsd.*) AS timeinterval
  from master_join master_join_pgpuxw
  join shared.timesheet_view shared_timesheet_view_ofncsd on master_join_pgpuxw.target_id = shared_timesheet_view_ofncsd.id
  where master_join_pgpuxw.source_id = airport_heliport.airportheliportavailability.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ntkeyg.*) AS annotation
  from master_join master_join_lyraue
  join notes.note_view notes_note_view_ntkeyg on master_join_lyraue.target_id = notes_note_view_ntkeyg.id
  where master_join_lyraue.source_id = airport_heliport.airportheliportavailability.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_bxxpsl.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_bxxpsl.title AS varchar), '(' || organisation_organisationauthority_pt_bxxpsl.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_bxxpsl.href
  )) as lat_specialdateauthority  from master_join master_join_brsteq
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_bxxpsl on master_join_brsteq.target_id = organisation_organisationauthority_pt_bxxpsl.id
  where master_join_brsteq.source_id = airport_heliport.airportheliportavailability.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_airportheliportusage_pt_dirorh.id) as lat_usage
  from master_join master_join_avytpc
  join airport_heliport.airportheliportusage_pt airport_heliport_airportheliportusage_pt_dirorh on master_join_avytpc.target_id = airport_heliport_airportheliportusage_pt_dirorh.id
  where master_join_avytpc.source_id = airport_heliport.airportheliportavailability.id
) as lat_usage on TRUE;
create index on airport_heliport.airportheliportavailability_view (id);
-- AirportHeliportResponsibilityOrganisationPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.airportheliportresponsibilityorganisation_view cascade;
create materialized view airport_heliport.airportheliportresponsibilityorganisation_view as
select
    airport_heliport.airportheliportresponsibilityorganisation_pt.id,
    airport_heliport.airportheliportresponsibilityorganisation_pt.nilreason AS airportheliportresponsibilityorganisation_nilreason,
    coalesce(cast(airport_heliport.airportheliportresponsibilityorganisation.role_value as varchar), '(' || airport_heliport.airportheliportresponsibilityorganisation.role_nilreason || ')') as role,
    coalesce(cast(organisation_organisationauthority_pt_pyaxoe.title as varchar), '(' || organisation_organisationauthority_pt_pyaxoe.nilreason[1] || ')') AS theorganisationauthority,
    organisation_organisationauthority_pt_pyaxoe.href AS theorganisationauthority_href,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation
from airport_heliport.airportheliportresponsibilityorganisation_pt 
inner join airport_heliport.airportheliportresponsibilityorganisation on airport_heliport.airportheliportresponsibilityorganisation_pt.airportheliportresponsibilityorganisation_id = airport_heliport.airportheliportresponsibilityorganisation.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_pyaxoe on airport_heliport.airportheliportresponsibilityorganisation.theorganisationauthority_id = organisation_organisationauthority_pt_pyaxoe.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_yohklw.*) AS timeinterval
  from master_join master_join_vavimj
  join shared.timesheet_view shared_timesheet_view_yohklw on master_join_vavimj.target_id = shared_timesheet_view_yohklw.id
  where master_join_vavimj.source_id = airport_heliport.airportheliportresponsibilityorganisation.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_msuvvp.*) AS annotation
  from master_join master_join_iccxth
  join notes.note_view notes_note_view_msuvvp on master_join_iccxth.target_id = notes_note_view_msuvvp.id
  where master_join_iccxth.source_id = airport_heliport.airportheliportresponsibilityorganisation.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_nezqtm.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_nezqtm.title AS varchar), '(' || organisation_organisationauthority_pt_nezqtm.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_nezqtm.href
  )) as lat_specialdateauthority  from master_join master_join_zzsohe
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_nezqtm on master_join_zzsohe.target_id = organisation_organisationauthority_pt_nezqtm.id
  where master_join_zzsohe.source_id = airport_heliport.airportheliportresponsibilityorganisation.id
) as lat_specialdateauthority on TRUE;
create index on airport_heliport.airportheliportresponsibilityorganisation_view (id);
-- AirspaceActivationPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airspace.airspaceactivation_view cascade;
create materialized view airspace.airspaceactivation_view as
select
    airspace.airspaceactivation_pt.id,
    airspace.airspaceactivation_pt.nilreason AS airspaceactivation_nilreason,
    coalesce(cast(airspace.airspaceactivation.activity_value as varchar), '(' || airspace.airspaceactivation.activity_nilreason || ')') as activity,
    coalesce(cast(airspace.airspaceactivation.status_value as varchar), '(' || airspace.airspaceactivation.status_nilreason || ')') as status,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_user.lat_user as user,
    lat_levels.lat_levels as levels,
    lat_aircraft.lat_aircraft as aircraft
from airspace.airspaceactivation_pt 
inner join airspace.airspaceactivation on airspace.airspaceactivation_pt.airspaceactivation_id = airspace.airspaceactivation.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_idbmaz.*) AS timeinterval
  from master_join master_join_cbikie
  join shared.timesheet_view shared_timesheet_view_idbmaz on master_join_cbikie.target_id = shared_timesheet_view_idbmaz.id
  where master_join_cbikie.source_id = airspace.airspaceactivation.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mhtntm.*) AS annotation
  from master_join master_join_qfxnfn
  join notes.note_view notes_note_view_mhtntm on master_join_qfxnfn.target_id = notes_note_view_mhtntm.id
  where master_join_qfxnfn.source_id = airspace.airspaceactivation.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_yendrc.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_yendrc.title AS varchar), '(' || organisation_organisationauthority_pt_yendrc.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_yendrc.href
  )) as lat_specialdateauthority  from master_join master_join_mfkwnt
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_yendrc on master_join_mfkwnt.target_id = organisation_organisationauthority_pt_yendrc.id
  where master_join_mfkwnt.source_id = airspace.airspaceactivation.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_airspacelayer_pt_mvrbna.id) as lat_levels
  from master_join master_join_ogmnnr
  join shared.airspacelayer_pt shared_airspacelayer_pt_mvrbna on master_join_ogmnnr.target_id = shared_airspacelayer_pt_mvrbna.id
  where master_join_ogmnnr.source_id = airspace.airspaceactivation.id
) as lat_levels on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_rwsqhr.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_rwsqhr.title AS varchar), '(' || organisation_organisationauthority_pt_rwsqhr.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_rwsqhr.href
  )) as lat_user  from master_join master_join_elnuzs
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_rwsqhr on master_join_elnuzs.target_id = organisation_organisationauthority_pt_rwsqhr.id
  where master_join_elnuzs.source_id = airspace.airspaceactivation.id
) as lat_user on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_pt_tqvykk.id) as lat_aircraft
  from master_join master_join_jiejix
  join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_tqvykk on master_join_jiejix.target_id = shared_aircraftcharacteristic_pt_tqvykk.id
  where master_join_jiejix.source_id = airspace.airspaceactivation.id
) as lat_aircraft on TRUE;
create index on airspace.airspaceactivation_view (id);
-- AirspaceLayerClassPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airspace.airspacelayerclass_view cascade;
create materialized view airspace.airspacelayerclass_view as
select
    airspace.airspacelayerclass_pt.id,
    airspace.airspacelayerclass_pt.nilreason AS airspacelayerclass_nilreason,
    coalesce(cast(airspace.airspacelayerclass.classification_value as varchar), '(' || airspace.airspacelayerclass.classification_nilreason || ')') as classification,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_associatedlevels.lat_associatedlevels as associatedlevels
from airspace.airspacelayerclass_pt 
inner join airspace.airspacelayerclass on airspace.airspacelayerclass_pt.airspacelayerclass_id = airspace.airspacelayerclass.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_pvpbse.*) AS timeinterval
  from master_join master_join_ipxleo
  join shared.timesheet_view shared_timesheet_view_pvpbse on master_join_ipxleo.target_id = shared_timesheet_view_pvpbse.id
  where master_join_ipxleo.source_id = airspace.airspacelayerclass.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_iaxpfe.*) AS annotation
  from master_join master_join_hgmrof
  join notes.note_view notes_note_view_iaxpfe on master_join_hgmrof.target_id = notes_note_view_iaxpfe.id
  where master_join_hgmrof.source_id = airspace.airspacelayerclass.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_onhbom.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_onhbom.title AS varchar), '(' || organisation_organisationauthority_pt_onhbom.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_onhbom.href
  )) as lat_specialdateauthority  from master_join master_join_lopkqd
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_onhbom on master_join_lopkqd.target_id = organisation_organisationauthority_pt_onhbom.id
  where master_join_lopkqd.source_id = airspace.airspacelayerclass.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_airspacelayer_pt_krpdgy.id) as lat_associatedlevels
  from master_join master_join_zpchle
  join shared.airspacelayer_pt shared_airspacelayer_pt_krpdgy on master_join_zpchle.target_id = shared_airspacelayer_pt_krpdgy.id
  where master_join_zpchle.source_id = airspace.airspacelayerclass.id
) as lat_associatedlevels on TRUE;
create index on airspace.airspacelayerclass_view (id);
-- AltimeterSourceStatusPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.altimetersourcestatus_view cascade;
create materialized view airport_heliport.altimetersourcestatus_view as
select
    airport_heliport.altimetersourcestatus_pt.id,
    airport_heliport.altimetersourcestatus_pt.nilreason AS altimetersourcestatus_nilreason,
    coalesce(cast(airport_heliport.altimetersourcestatus.operationalstatus_value as varchar), '(' || airport_heliport.altimetersourcestatus.operationalstatus_nilreason || ')') as operationalstatus,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from airport_heliport.altimetersourcestatus_pt 
inner join airport_heliport.altimetersourcestatus on airport_heliport.altimetersourcestatus_pt.altimetersourcestatus_id = airport_heliport.altimetersourcestatus.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_itketa.*) AS timeinterval
  from master_join master_join_gpmcxi
  join shared.timesheet_view shared_timesheet_view_itketa on master_join_gpmcxi.target_id = shared_timesheet_view_itketa.id
  where master_join_gpmcxi.source_id = airport_heliport.altimetersourcestatus.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_azupdd.*) AS annotation
  from master_join master_join_oiaerj
  join notes.note_view notes_note_view_azupdd on master_join_oiaerj.target_id = notes_note_view_azupdd.id
  where master_join_oiaerj.source_id = airport_heliport.altimetersourcestatus.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_glsptk.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_glsptk.title AS varchar), '(' || organisation_organisationauthority_pt_glsptk.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_glsptk.href
  )) as lat_specialdateauthority  from master_join master_join_tjzqkn
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_glsptk on master_join_tjzqkn.target_id = organisation_organisationauthority_pt_glsptk.id
  where master_join_tjzqkn.source_id = airport_heliport.altimetersourcestatus.id
) as lat_specialdateauthority on TRUE;
create index on airport_heliport.altimetersourcestatus_view (id);
-- ApronAreaAvailabilityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.apronareaavailability_view cascade;
create materialized view airport_heliport.apronareaavailability_view as
select
    airport_heliport.apronareaavailability_pt.id,
    airport_heliport.apronareaavailability_pt.nilreason AS apronareaavailability_nilreason,
    coalesce(cast(airport_heliport.apronareaavailability.operationalstatus_value as varchar), '(' || airport_heliport.apronareaavailability.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(airport_heliport.apronareaavailability.warning_value as varchar), '(' || airport_heliport.apronareaavailability.warning_nilreason || ')') as warning,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_usage.lat_usage as usage
from airport_heliport.apronareaavailability_pt 
inner join airport_heliport.apronareaavailability on airport_heliport.apronareaavailability_pt.apronareaavailability_id = airport_heliport.apronareaavailability.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_wloaph.*) AS timeinterval
  from master_join master_join_kgpuhy
  join shared.timesheet_view shared_timesheet_view_wloaph on master_join_kgpuhy.target_id = shared_timesheet_view_wloaph.id
  where master_join_kgpuhy.source_id = airport_heliport.apronareaavailability.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ioicoy.*) AS annotation
  from master_join master_join_xcqqkk
  join notes.note_view notes_note_view_ioicoy on master_join_xcqqkk.target_id = notes_note_view_ioicoy.id
  where master_join_xcqqkk.source_id = airport_heliport.apronareaavailability.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_fkxulz.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_fkxulz.title AS varchar), '(' || organisation_organisationauthority_pt_fkxulz.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_fkxulz.href
  )) as lat_specialdateauthority  from master_join master_join_eloiny
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_fkxulz on master_join_eloiny.target_id = organisation_organisationauthority_pt_fkxulz.id
  where master_join_eloiny.source_id = airport_heliport.apronareaavailability.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_apronareausage_pt_fijywe.id) as lat_usage
  from master_join master_join_xkwvaz
  join airport_heliport.apronareausage_pt airport_heliport_apronareausage_pt_fijywe on master_join_xkwvaz.target_id = airport_heliport_apronareausage_pt_fijywe.id
  where master_join_xkwvaz.source_id = airport_heliport.apronareaavailability.id
) as lat_usage on TRUE;
create index on airport_heliport.apronareaavailability_view (id);
-- CirclingRestrictionPropertyType
-- ['shared.timesheet_view', 'notes.note_view', 'geometry.surface_view']
drop materialized view if exists procedure.circlingrestriction_view cascade;
create materialized view procedure.circlingrestriction_view as
select
    procedure.circlingrestriction_pt.id,
    procedure.circlingrestriction_pt.nilreason AS circlingrestriction_nilreason,
    shared_circlesector_pt_hlcnhl.id AS sectordescription,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from procedure.circlingrestriction_pt 
inner join procedure.circlingrestriction on procedure.circlingrestriction_pt.circlingrestriction_id = procedure.circlingrestriction.id
left join shared.circlesector_pt shared_circlesector_pt_hlcnhl on procedure.circlingrestriction.sectordescription_id = shared_circlesector_pt_hlcnhl.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_fffdfa.*) AS timeinterval
  from master_join master_join_xzodsr
  join shared.timesheet_view shared_timesheet_view_fffdfa on master_join_xzodsr.target_id = shared_timesheet_view_fffdfa.id
  where master_join_xzodsr.source_id = procedure.circlingrestriction.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_owwgjp.*) AS annotation
  from master_join master_join_krtjwa
  join notes.note_view notes_note_view_owwgjp on master_join_krtjwa.target_id = notes_note_view_owwgjp.id
  where master_join_krtjwa.source_id = procedure.circlingrestriction.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_tkquov.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_tkquov.title AS varchar), '(' || organisation_organisationauthority_pt_tkquov.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_tkquov.href
  )) as lat_specialdateauthority  from master_join master_join_fdktac
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_tkquov on master_join_fdktac.target_id = organisation_organisationauthority_pt_tkquov.id
  where master_join_fdktac.source_id = procedure.circlingrestriction.id
) as lat_specialdateauthority on TRUE;
create index on procedure.circlingrestriction_view (id);
-- ConditionCombinationPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.conditioncombination_view cascade;
create materialized view airport_heliport.conditioncombination_view as
select
    airport_heliport.conditioncombination_pt.id,
    airport_heliport.conditioncombination_pt.nilreason AS conditioncombination_nilreason,
    coalesce(cast(airport_heliport.conditioncombination.logicaloperator_value as varchar), '(' || airport_heliport.conditioncombination.logicaloperator_nilreason || ')') as logicaloperator,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_weather.lat_weather as weather,
    lat_aircraft.lat_aircraft as aircraft,
    lat_flight.lat_flight as flight,
    lat_subcondition.lat_subcondition as subcondition
from airport_heliport.conditioncombination_pt 
inner join airport_heliport.conditioncombination on airport_heliport.conditioncombination_pt.conditioncombination_id = airport_heliport.conditioncombination.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_bdkqgi.*) AS timeinterval
  from master_join master_join_dfbjsr
  join shared.timesheet_view shared_timesheet_view_bdkqgi on master_join_dfbjsr.target_id = shared_timesheet_view_bdkqgi.id
  where master_join_dfbjsr.source_id = airport_heliport.conditioncombination.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_bwzxrh.*) AS annotation
  from master_join master_join_uuacfp
  join notes.note_view notes_note_view_bwzxrh on master_join_uuacfp.target_id = notes_note_view_bwzxrh.id
  where master_join_uuacfp.source_id = airport_heliport.conditioncombination.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_vghdab.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_vghdab.title AS varchar), '(' || organisation_organisationauthority_pt_vghdab.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_vghdab.href
  )) as lat_specialdateauthority  from master_join master_join_kpniht
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_vghdab on master_join_kpniht.target_id = organisation_organisationauthority_pt_vghdab.id
  where master_join_kpniht.source_id = airport_heliport.conditioncombination.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_meteorology_pt_mygjgl.id) as lat_weather
  from master_join master_join_sywvax
  join shared.meteorology_pt shared_meteorology_pt_mygjgl on master_join_sywvax.target_id = shared_meteorology_pt_mygjgl.id
  where master_join_sywvax.source_id = airport_heliport.conditioncombination.id
) as lat_weather on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_pt_qgamxi.id) as lat_aircraft
  from master_join master_join_wtkdad
  join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_qgamxi on master_join_wtkdad.target_id = shared_aircraftcharacteristic_pt_qgamxi.id
  where master_join_wtkdad.source_id = airport_heliport.conditioncombination.id
) as lat_aircraft on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_flightcharacteristic_pt_rsnkxq.id) as lat_flight
  from master_join master_join_aizqxv
  join shared.flightcharacteristic_pt shared_flightcharacteristic_pt_rsnkxq on master_join_aizqxv.target_id = shared_flightcharacteristic_pt_rsnkxq.id
  where master_join_aizqxv.source_id = airport_heliport.conditioncombination.id
) as lat_flight on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_conditioncombination_pt_scacjw.id) as lat_subcondition
  from master_join master_join_rjdpwv
  join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_scacjw on master_join_rjdpwv.target_id = airport_heliport_conditioncombination_pt_scacjw.id
  where master_join_rjdpwv.source_id = airport_heliport.conditioncombination.id
) as lat_subcondition on TRUE;
create index on airport_heliport.conditioncombination_view (id);
-- FlightConditionCombinationPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists routes.flightconditioncombination_view cascade;
create materialized view routes.flightconditioncombination_view as
select
    routes.flightconditioncombination_pt.id,
    routes.flightconditioncombination_pt.nilreason AS flightconditioncombination_nilreason,
    coalesce(cast(routes.flightconditioncombination.logicaloperator_value as varchar), '(' || routes.flightconditioncombination.logicaloperator_nilreason || ')') as logicaloperator,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_element.lat_element as element
from routes.flightconditioncombination_pt 
inner join routes.flightconditioncombination on routes.flightconditioncombination_pt.flightconditioncombination_id = routes.flightconditioncombination.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_cmoray.*) AS timeinterval
  from master_join master_join_cweeee
  join shared.timesheet_view shared_timesheet_view_cmoray on master_join_cweeee.target_id = shared_timesheet_view_cmoray.id
  where master_join_cweeee.source_id = routes.flightconditioncombination.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_eizcfl.*) AS annotation
  from master_join master_join_sxlfef
  join notes.note_view notes_note_view_eizcfl on master_join_sxlfef.target_id = notes_note_view_eizcfl.id
  where master_join_sxlfef.source_id = routes.flightconditioncombination.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_ngglnf.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_ngglnf.title AS varchar), '(' || organisation_organisationauthority_pt_ngglnf.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_ngglnf.href
  )) as lat_specialdateauthority  from master_join master_join_exqzxx
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_ngglnf on master_join_exqzxx.target_id = organisation_organisationauthority_pt_ngglnf.id
  where master_join_exqzxx.source_id = routes.flightconditioncombination.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT routes_flightconditionelement_pt_wsycga.id) as lat_element
  from master_join master_join_hofzkm
  join routes.flightconditionelement_pt routes_flightconditionelement_pt_wsycga on master_join_hofzkm.target_id = routes_flightconditionelement_pt_wsycga.id
  where master_join_hofzkm.source_id = routes.flightconditioncombination.id
) as lat_element on TRUE;
create index on routes.flightconditioncombination_view (id);
-- GroundLightingAvailabilityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.groundlightingavailability_view cascade;
create materialized view airport_heliport.groundlightingavailability_view as
select
    airport_heliport.groundlightingavailability_pt.id,
    airport_heliport.groundlightingavailability_pt.nilreason AS groundlightingavailability_nilreason,
    coalesce(cast(airport_heliport.groundlightingavailability.operationalstatus_value as varchar), '(' || airport_heliport.groundlightingavailability.operationalstatus_nilreason || ')') as operationalstatus,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from airport_heliport.groundlightingavailability_pt 
inner join airport_heliport.groundlightingavailability on airport_heliport.groundlightingavailability_pt.groundlightingavailability_id = airport_heliport.groundlightingavailability.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_qrtonf.*) AS timeinterval
  from master_join master_join_vbcdup
  join shared.timesheet_view shared_timesheet_view_qrtonf on master_join_vbcdup.target_id = shared_timesheet_view_qrtonf.id
  where master_join_vbcdup.source_id = airport_heliport.groundlightingavailability.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ldwhar.*) AS annotation
  from master_join master_join_diengf
  join notes.note_view notes_note_view_ldwhar on master_join_diengf.target_id = notes_note_view_ldwhar.id
  where master_join_diengf.source_id = airport_heliport.groundlightingavailability.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_zriiwh.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_zriiwh.title AS varchar), '(' || organisation_organisationauthority_pt_zriiwh.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_zriiwh.href
  )) as lat_specialdateauthority  from master_join master_join_pbrzla
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_zriiwh on master_join_pbrzla.target_id = organisation_organisationauthority_pt_zriiwh.id
  where master_join_pbrzla.source_id = airport_heliport.groundlightingavailability.id
) as lat_specialdateauthority on TRUE;
create index on airport_heliport.groundlightingavailability_view (id);
-- LightElementStatusPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists shared.lightelementstatus_view cascade;
create materialized view shared.lightelementstatus_view as
select
    shared.lightelementstatus_pt.id,
    shared.lightelementstatus_pt.nilreason AS lightelementstatus_nilreason,
    coalesce(cast(shared.lightelementstatus.status_value as varchar), '(' || shared.lightelementstatus.status_nilreason || ')') as status,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from shared.lightelementstatus_pt 
inner join shared.lightelementstatus on shared.lightelementstatus_pt.lightelementstatus_id = shared.lightelementstatus.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_clfptg.*) AS timeinterval
  from master_join master_join_miwtti
  join shared.timesheet_view shared_timesheet_view_clfptg on master_join_miwtti.target_id = shared_timesheet_view_clfptg.id
  where master_join_miwtti.source_id = shared.lightelementstatus.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jpgncv.*) AS annotation
  from master_join master_join_lkrkbb
  join notes.note_view notes_note_view_jpgncv on master_join_lkrkbb.target_id = notes_note_view_jpgncv.id
  where master_join_lkrkbb.source_id = shared.lightelementstatus.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_yyqqez.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_yyqqez.title AS varchar), '(' || organisation_organisationauthority_pt_yyqqez.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_yyqqez.href
  )) as lat_specialdateauthority  from master_join master_join_nsvsvl
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_yyqqez on master_join_nsvsvl.target_id = organisation_organisationauthority_pt_yyqqez.id
  where master_join_nsvsvl.source_id = shared.lightelementstatus.id
) as lat_specialdateauthority on TRUE;
create index on shared.lightelementstatus_view (id);
-- ManoeuvringAreaAvailabilityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.manoeuvringareaavailability_view cascade;
create materialized view airport_heliport.manoeuvringareaavailability_view as
select
    airport_heliport.manoeuvringareaavailability_pt.id,
    airport_heliport.manoeuvringareaavailability_pt.nilreason AS manoeuvringareaavailability_nilreason,
    coalesce(cast(airport_heliport.manoeuvringareaavailability.operationalstatus_value as varchar), '(' || airport_heliport.manoeuvringareaavailability.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(airport_heliport.manoeuvringareaavailability.warning_value as varchar), '(' || airport_heliport.manoeuvringareaavailability.warning_nilreason || ')') as warning,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_usage.lat_usage as usage
from airport_heliport.manoeuvringareaavailability_pt 
inner join airport_heliport.manoeuvringareaavailability on airport_heliport.manoeuvringareaavailability_pt.manoeuvringareaavailability_id = airport_heliport.manoeuvringareaavailability.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_jtyhiq.*) AS timeinterval
  from master_join master_join_mavimq
  join shared.timesheet_view shared_timesheet_view_jtyhiq on master_join_mavimq.target_id = shared_timesheet_view_jtyhiq.id
  where master_join_mavimq.source_id = airport_heliport.manoeuvringareaavailability.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qjtedc.*) AS annotation
  from master_join master_join_ejhosd
  join notes.note_view notes_note_view_qjtedc on master_join_ejhosd.target_id = notes_note_view_qjtedc.id
  where master_join_ejhosd.source_id = airport_heliport.manoeuvringareaavailability.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_rcftxk.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_rcftxk.title AS varchar), '(' || organisation_organisationauthority_pt_rcftxk.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_rcftxk.href
  )) as lat_specialdateauthority  from master_join master_join_ellzbf
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_rcftxk on master_join_ellzbf.target_id = organisation_organisationauthority_pt_rcftxk.id
  where master_join_ellzbf.source_id = airport_heliport.manoeuvringareaavailability.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_manoeuvringareausage_pt_nnvedl.id) as lat_usage
  from master_join master_join_vklhfy
  join airport_heliport.manoeuvringareausage_pt airport_heliport_manoeuvringareausage_pt_nnvedl on master_join_vklhfy.target_id = airport_heliport_manoeuvringareausage_pt_nnvedl.id
  where master_join_vklhfy.source_id = airport_heliport.manoeuvringareaavailability.id
) as lat_usage on TRUE;
create index on airport_heliport.manoeuvringareaavailability_view (id);
-- NavaidEquipmentMonitoringPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists navaids_points.navaidequipmentmonitoring_view cascade;
create materialized view navaids_points.navaidequipmentmonitoring_view as
select
    navaids_points.navaidequipmentmonitoring_pt.id,
    navaids_points.navaidequipmentmonitoring_pt.nilreason AS navaidequipmentmonitoring_nilreason,
    coalesce(cast(navaids_points.navaidequipmentmonitoring.monitored_value as varchar), '(' || navaids_points.navaidequipmentmonitoring.monitored_nilreason || ')') as monitored,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from navaids_points.navaidequipmentmonitoring_pt 
inner join navaids_points.navaidequipmentmonitoring on navaids_points.navaidequipmentmonitoring_pt.navaidequipmentmonitoring_id = navaids_points.navaidequipmentmonitoring.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_gdqxcz.*) AS timeinterval
  from master_join master_join_fnmrds
  join shared.timesheet_view shared_timesheet_view_gdqxcz on master_join_fnmrds.target_id = shared_timesheet_view_gdqxcz.id
  where master_join_fnmrds.source_id = navaids_points.navaidequipmentmonitoring.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jbcefp.*) AS annotation
  from master_join master_join_tpyafl
  join notes.note_view notes_note_view_jbcefp on master_join_tpyafl.target_id = notes_note_view_jbcefp.id
  where master_join_tpyafl.source_id = navaids_points.navaidequipmentmonitoring.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_aqasuq.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_aqasuq.title AS varchar), '(' || organisation_organisationauthority_pt_aqasuq.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_aqasuq.href
  )) as lat_specialdateauthority  from master_join master_join_sgklar
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_aqasuq on master_join_sgklar.target_id = organisation_organisationauthority_pt_aqasuq.id
  where master_join_sgklar.source_id = navaids_points.navaidequipmentmonitoring.id
) as lat_specialdateauthority on TRUE;
create index on navaids_points.navaidequipmentmonitoring_view (id);
-- NavaidOperationalStatusPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists navaids_points.navaidoperationalstatus_view cascade;
create materialized view navaids_points.navaidoperationalstatus_view as
select
    navaids_points.navaidoperationalstatus_pt.id,
    navaids_points.navaidoperationalstatus_pt.nilreason AS navaidoperationalstatus_nilreason,
    coalesce(cast(navaids_points.navaidoperationalstatus.operationalstatus_value as varchar), '(' || navaids_points.navaidoperationalstatus.operationalstatus_nilreason || ')') as operationalstatus,
    coalesce(cast(navaids_points.navaidoperationalstatus.signaltype_value as varchar), '(' || navaids_points.navaidoperationalstatus.signaltype_nilreason || ')') as signaltype,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from navaids_points.navaidoperationalstatus_pt 
inner join navaids_points.navaidoperationalstatus on navaids_points.navaidoperationalstatus_pt.navaidoperationalstatus_id = navaids_points.navaidoperationalstatus.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_bbmegz.*) AS timeinterval
  from master_join master_join_hqxari
  join shared.timesheet_view shared_timesheet_view_bbmegz on master_join_hqxari.target_id = shared_timesheet_view_bbmegz.id
  where master_join_hqxari.source_id = navaids_points.navaidoperationalstatus.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_snvxbp.*) AS annotation
  from master_join master_join_npvkcz
  join notes.note_view notes_note_view_snvxbp on master_join_npvkcz.target_id = notes_note_view_snvxbp.id
  where master_join_npvkcz.source_id = navaids_points.navaidoperationalstatus.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_plaojf.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_plaojf.title AS varchar), '(' || organisation_organisationauthority_pt_plaojf.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_plaojf.href
  )) as lat_specialdateauthority  from master_join master_join_yieiib
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_plaojf on master_join_yieiib.target_id = organisation_organisationauthority_pt_plaojf.id
  where master_join_yieiib.source_id = navaids_points.navaidoperationalstatus.id
) as lat_specialdateauthority on TRUE;
create index on navaids_points.navaidoperationalstatus_view (id);
-- OnlineContactPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists shared.onlinecontact_view cascade;
create materialized view shared.onlinecontact_view as
select
    shared.onlinecontact_pt.id,
    shared.onlinecontact_pt.nilreason AS onlinecontact_nilreason,
    coalesce(cast(shared.onlinecontact.network_value as varchar), '(' || shared.onlinecontact.network_nilreason || ')') as network,
    coalesce(cast(shared.onlinecontact.linkage_value as varchar), '(' || shared.onlinecontact.linkage_nilreason || ')') as linkage,
    coalesce(cast(shared.onlinecontact.protocol_value as varchar), '(' || shared.onlinecontact.protocol_nilreason || ')') as protocol,
    coalesce(cast(shared.onlinecontact.email_value as varchar), '(' || shared.onlinecontact.email_nilreason || ')') as email,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from shared.onlinecontact_pt 
inner join shared.onlinecontact on shared.onlinecontact_pt.onlinecontact_id = shared.onlinecontact.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_yvdjpl.*) AS timeinterval
  from master_join master_join_ufmqxv
  join shared.timesheet_view shared_timesheet_view_yvdjpl on master_join_ufmqxv.target_id = shared_timesheet_view_yvdjpl.id
  where master_join_ufmqxv.source_id = shared.onlinecontact.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_cbacmh.*) AS annotation
  from master_join master_join_cuictp
  join notes.note_view notes_note_view_cbacmh on master_join_cuictp.target_id = notes_note_view_cbacmh.id
  where master_join_cuictp.source_id = shared.onlinecontact.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_rkriyh.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_rkriyh.title AS varchar), '(' || organisation_organisationauthority_pt_rkriyh.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_rkriyh.href
  )) as lat_specialdateauthority  from master_join master_join_zvseou
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_rkriyh on master_join_zvseou.target_id = organisation_organisationauthority_pt_rkriyh.id
  where master_join_zvseou.source_id = shared.onlinecontact.id
) as lat_specialdateauthority on TRUE;
create index on shared.onlinecontact_view (id);
-- PostalAddressPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists shared.postaladdress_view cascade;
create materialized view shared.postaladdress_view as
select
    shared.postaladdress_pt.id,
    shared.postaladdress_pt.nilreason AS postaladdress_nilreason,
    coalesce(cast(shared.postaladdress.deliverypoint_value as varchar), '(' || shared.postaladdress.deliverypoint_nilreason || ')') as deliverypoint,
    coalesce(cast(shared.postaladdress.city_value as varchar), '(' || shared.postaladdress.city_nilreason || ')') as city,
    coalesce(cast(shared.postaladdress.administrativearea_value as varchar), '(' || shared.postaladdress.administrativearea_nilreason || ')') as administrativearea,
    coalesce(cast(shared.postaladdress.postalcode_value as varchar), '(' || shared.postaladdress.postalcode_nilreason || ')') as postalcode,
    coalesce(cast(shared.postaladdress.country_value as varchar), '(' || shared.postaladdress.country_nilreason || ')') as country,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from shared.postaladdress_pt 
inner join shared.postaladdress on shared.postaladdress_pt.postaladdress_id = shared.postaladdress.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_omthqr.*) AS timeinterval
  from master_join master_join_ijsimm
  join shared.timesheet_view shared_timesheet_view_omthqr on master_join_ijsimm.target_id = shared_timesheet_view_omthqr.id
  where master_join_ijsimm.source_id = shared.postaladdress.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ntbhox.*) AS annotation
  from master_join master_join_kuliox
  join notes.note_view notes_note_view_ntbhox on master_join_kuliox.target_id = notes_note_view_ntbhox.id
  where master_join_kuliox.source_id = shared.postaladdress.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_uztsfd.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_uztsfd.title AS varchar), '(' || organisation_organisationauthority_pt_uztsfd.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_uztsfd.href
  )) as lat_specialdateauthority  from master_join master_join_xdwtmw
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_uztsfd on master_join_xdwtmw.target_id = organisation_organisationauthority_pt_uztsfd.id
  where master_join_xdwtmw.source_id = shared.postaladdress.id
) as lat_specialdateauthority on TRUE;
create index on shared.postaladdress_view (id);
-- ProcedureAvailabilityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists procedure.procedureavailability_view cascade;
create materialized view procedure.procedureavailability_view as
select
    procedure.procedureavailability_pt.id,
    procedure.procedureavailability_pt.nilreason AS procedureavailability_nilreason,
    coalesce(cast(procedure.procedureavailability.status_value as varchar), '(' || procedure.procedureavailability.status_nilreason || ')') as status,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from procedure.procedureavailability_pt 
inner join procedure.procedureavailability on procedure.procedureavailability_pt.procedureavailability_id = procedure.procedureavailability.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_fpcdem.*) AS timeinterval
  from master_join master_join_dbzazm
  join shared.timesheet_view shared_timesheet_view_fpcdem on master_join_dbzazm.target_id = shared_timesheet_view_fpcdem.id
  where master_join_dbzazm.source_id = procedure.procedureavailability.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wipqus.*) AS annotation
  from master_join master_join_tyxrqx
  join notes.note_view notes_note_view_wipqus on master_join_tyxrqx.target_id = notes_note_view_wipqus.id
  where master_join_tyxrqx.source_id = procedure.procedureavailability.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_hnbnzy.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_hnbnzy.title AS varchar), '(' || organisation_organisationauthority_pt_hnbnzy.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_hnbnzy.href
  )) as lat_specialdateauthority  from master_join master_join_sakufp
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_hnbnzy on master_join_sakufp.target_id = organisation_organisationauthority_pt_hnbnzy.id
  where master_join_sakufp.source_id = procedure.procedureavailability.id
) as lat_specialdateauthority on TRUE;
create index on procedure.procedureavailability_view (id);
-- RadioCommunicationOperationalStatusPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists service.radiocommunicationoperationalstatus_view cascade;
create materialized view service.radiocommunicationoperationalstatus_view as
select
    service.radiocommunicationoperationalstatus_pt.id,
    service.radiocommunicationoperationalstatus_pt.nilreason AS radiocommunicationoperationalstatus_nilreason,
    coalesce(cast(service.radiocommunicationoperationalstatus.operationalstatus_value as varchar), '(' || service.radiocommunicationoperationalstatus.operationalstatus_nilreason || ')') as operationalstatus,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from service.radiocommunicationoperationalstatus_pt 
inner join service.radiocommunicationoperationalstatus on service.radiocommunicationoperationalstatus_pt.radiocommunicationoperationalstatus_id = service.radiocommunicationoperationalstatus.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_lnziqe.*) AS timeinterval
  from master_join master_join_wsukzt
  join shared.timesheet_view shared_timesheet_view_lnziqe on master_join_wsukzt.target_id = shared_timesheet_view_lnziqe.id
  where master_join_wsukzt.source_id = service.radiocommunicationoperationalstatus.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_uzsifd.*) AS annotation
  from master_join master_join_shyrck
  join notes.note_view notes_note_view_uzsifd on master_join_shyrck.target_id = notes_note_view_uzsifd.id
  where master_join_shyrck.source_id = service.radiocommunicationoperationalstatus.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_ogqrqn.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_ogqrqn.title AS varchar), '(' || organisation_organisationauthority_pt_ogqrqn.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_ogqrqn.href
  )) as lat_specialdateauthority  from master_join master_join_hclojr
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_ogqrqn on master_join_hclojr.target_id = organisation_organisationauthority_pt_ogqrqn.id
  where master_join_hclojr.source_id = service.radiocommunicationoperationalstatus.id
) as lat_specialdateauthority on TRUE;
create index on service.radiocommunicationoperationalstatus_view (id);
-- RouteAvailabilityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists routes.routeavailability_view cascade;
create materialized view routes.routeavailability_view as
select
    routes.routeavailability_pt.id,
    routes.routeavailability_pt.nilreason AS routeavailability_nilreason,
    coalesce(cast(routes.routeavailability.direction_value as varchar), '(' || routes.routeavailability.direction_nilreason || ')') as direction,
    coalesce(cast(routes.routeavailability.cardinaldirection_value as varchar), '(' || routes.routeavailability.cardinaldirection_nilreason || ')') as cardinaldirection,
    coalesce(cast(routes.routeavailability.status_value as varchar), '(' || routes.routeavailability.status_nilreason || ')') as status,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_levels.lat_levels as levels
from routes.routeavailability_pt 
inner join routes.routeavailability on routes.routeavailability_pt.routeavailability_id = routes.routeavailability.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_hmxfyn.*) AS timeinterval
  from master_join master_join_epyogr
  join shared.timesheet_view shared_timesheet_view_hmxfyn on master_join_epyogr.target_id = shared_timesheet_view_hmxfyn.id
  where master_join_epyogr.source_id = routes.routeavailability.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_kzzlyv.*) AS annotation
  from master_join master_join_wvsqsy
  join notes.note_view notes_note_view_kzzlyv on master_join_wvsqsy.target_id = notes_note_view_kzzlyv.id
  where master_join_wvsqsy.source_id = routes.routeavailability.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_fxblqo.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_fxblqo.title AS varchar), '(' || organisation_organisationauthority_pt_fxblqo.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_fxblqo.href
  )) as lat_specialdateauthority  from master_join master_join_aqgrau
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_fxblqo on master_join_aqgrau.target_id = organisation_organisationauthority_pt_fxblqo.id
  where master_join_aqgrau.source_id = routes.routeavailability.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_airspacelayer_pt_ywpvva.id) as lat_levels
  from master_join master_join_wxmcuq
  join shared.airspacelayer_pt shared_airspacelayer_pt_ywpvva on master_join_wxmcuq.target_id = shared_airspacelayer_pt_ywpvva.id
  where master_join_wxmcuq.source_id = routes.routeavailability.id
) as lat_levels on TRUE;
create index on routes.routeavailability_view (id);
-- RunwayDeclaredDistanceValuePropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.runwaydeclareddistancevalue_view cascade;
create materialized view airport_heliport.runwaydeclareddistancevalue_view as
select
    airport_heliport.runwaydeclareddistancevalue_pt.id,
    airport_heliport.runwaydeclareddistancevalue_pt.nilreason AS runwaydeclareddistancevalue_nilreason,
    coalesce(cast(airport_heliport.runwaydeclareddistancevalue.distance_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue.distance_uom, '(' || airport_heliport.runwaydeclareddistancevalue.distance_nilreason || ')') as distance,
    coalesce(cast(airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_value as varchar) || ' ' || airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_uom, '(' || airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_nilreason || ')') as distanceaccuracy,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from airport_heliport.runwaydeclareddistancevalue_pt 
inner join airport_heliport.runwaydeclareddistancevalue on airport_heliport.runwaydeclareddistancevalue_pt.runwaydeclareddistancevalue_id = airport_heliport.runwaydeclareddistancevalue.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_ecbmol.*) AS timeinterval
  from master_join master_join_rpvcoq
  join shared.timesheet_view shared_timesheet_view_ecbmol on master_join_rpvcoq.target_id = shared_timesheet_view_ecbmol.id
  where master_join_rpvcoq.source_id = airport_heliport.runwaydeclareddistancevalue.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hrzkgd.*) AS annotation
  from master_join master_join_rtinsm
  join notes.note_view notes_note_view_hrzkgd on master_join_rtinsm.target_id = notes_note_view_hrzkgd.id
  where master_join_rtinsm.source_id = airport_heliport.runwaydeclareddistancevalue.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_oytbnw.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_oytbnw.title AS varchar), '(' || organisation_organisationauthority_pt_oytbnw.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_oytbnw.href
  )) as lat_specialdateauthority  from master_join master_join_psdqhy
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_oytbnw on master_join_psdqhy.target_id = organisation_organisationauthority_pt_oytbnw.id
  where master_join_psdqhy.source_id = airport_heliport.runwaydeclareddistancevalue.id
) as lat_specialdateauthority on TRUE;
create index on airport_heliport.runwaydeclareddistancevalue_view (id);
-- ServiceOperationalStatusPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists service.serviceoperationalstatus_view cascade;
create materialized view service.serviceoperationalstatus_view as
select
    service.serviceoperationalstatus_pt.id,
    service.serviceoperationalstatus_pt.nilreason AS serviceoperationalstatus_nilreason,
    coalesce(cast(service.serviceoperationalstatus.operationalstatus_value as varchar), '(' || service.serviceoperationalstatus.operationalstatus_nilreason || ')') as operationalstatus,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from service.serviceoperationalstatus_pt 
inner join service.serviceoperationalstatus on service.serviceoperationalstatus_pt.serviceoperationalstatus_id = service.serviceoperationalstatus.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_tgrqhp.*) AS timeinterval
  from master_join master_join_eyhbtj
  join shared.timesheet_view shared_timesheet_view_tgrqhp on master_join_eyhbtj.target_id = shared_timesheet_view_tgrqhp.id
  where master_join_eyhbtj.source_id = service.serviceoperationalstatus.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_sggotv.*) AS annotation
  from master_join master_join_kuxqsr
  join notes.note_view notes_note_view_sggotv on master_join_kuxqsr.target_id = notes_note_view_sggotv.id
  where master_join_kuxqsr.source_id = service.serviceoperationalstatus.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_hwxeed.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_hwxeed.title AS varchar), '(' || organisation_organisationauthority_pt_hwxeed.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_hwxeed.href
  )) as lat_specialdateauthority  from master_join master_join_alcwad
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_hwxeed on master_join_alcwad.target_id = organisation_organisationauthority_pt_hwxeed.id
  where master_join_alcwad.source_id = service.serviceoperationalstatus.id
) as lat_specialdateauthority on TRUE;
create index on service.serviceoperationalstatus_view (id);
-- SpecialNavigationStationStatusPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists navaids_points.specialnavigationstationstatus_view cascade;
create materialized view navaids_points.specialnavigationstationstatus_view as
select
    navaids_points.specialnavigationstationstatus_pt.id,
    navaids_points.specialnavigationstationstatus_pt.nilreason AS specialnavigationstationstatus_nilreason,
    coalesce(cast(navaids_points.specialnavigationstationstatus.operationalstatus_value as varchar), '(' || navaids_points.specialnavigationstationstatus.operationalstatus_nilreason || ')') as operationalstatus,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from navaids_points.specialnavigationstationstatus_pt 
inner join navaids_points.specialnavigationstationstatus on navaids_points.specialnavigationstationstatus_pt.specialnavigationstationstatus_id = navaids_points.specialnavigationstationstatus.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_lokift.*) AS timeinterval
  from master_join master_join_arjabi
  join shared.timesheet_view shared_timesheet_view_lokift on master_join_arjabi.target_id = shared_timesheet_view_lokift.id
  where master_join_arjabi.source_id = navaids_points.specialnavigationstationstatus.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hmdnwh.*) AS annotation
  from master_join master_join_kaksaw
  join notes.note_view notes_note_view_hmdnwh on master_join_kaksaw.target_id = notes_note_view_hmdnwh.id
  where master_join_kaksaw.source_id = navaids_points.specialnavigationstationstatus.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_yubqjm.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_yubqjm.title AS varchar), '(' || organisation_organisationauthority_pt_yubqjm.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_yubqjm.href
  )) as lat_specialdateauthority  from master_join master_join_ghhpmt
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_yubqjm on master_join_ghhpmt.target_id = organisation_organisationauthority_pt_yubqjm.id
  where master_join_ghhpmt.source_id = navaids_points.specialnavigationstationstatus.id
) as lat_specialdateauthority on TRUE;
create index on navaids_points.specialnavigationstationstatus_view (id);
-- TelephoneContactPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists shared.telephonecontact_view cascade;
create materialized view shared.telephonecontact_view as
select
    shared.telephonecontact_pt.id,
    shared.telephonecontact_pt.nilreason AS telephonecontact_nilreason,
    coalesce(cast(shared.telephonecontact.voice_value as varchar), '(' || shared.telephonecontact.voice_nilreason || ')') as voice,
    coalesce(cast(shared.telephonecontact.facsimile_value as varchar), '(' || shared.telephonecontact.facsimile_nilreason || ')') as facsimile,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from shared.telephonecontact_pt 
inner join shared.telephonecontact on shared.telephonecontact_pt.telephonecontact_id = shared.telephonecontact.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_rhesdx.*) AS timeinterval
  from master_join master_join_jlfbxo
  join shared.timesheet_view shared_timesheet_view_rhesdx on master_join_jlfbxo.target_id = shared_timesheet_view_rhesdx.id
  where master_join_jlfbxo.source_id = shared.telephonecontact.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pxqwwx.*) AS annotation
  from master_join master_join_diyrgq
  join notes.note_view notes_note_view_pxqwwx on master_join_diyrgq.target_id = notes_note_view_pxqwwx.id
  where master_join_diyrgq.source_id = shared.telephonecontact.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_gglpps.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_gglpps.title AS varchar), '(' || organisation_organisationauthority_pt_gglpps.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_gglpps.href
  )) as lat_specialdateauthority  from master_join master_join_cvzoeq
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_gglpps on master_join_cvzoeq.target_id = organisation_organisationauthority_pt_gglpps.id
  where master_join_cvzoeq.source_id = shared.telephonecontact.id
) as lat_specialdateauthority on TRUE;
create index on shared.telephonecontact_view (id);
-- UnitAvailabilityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists organisation.unitavailability_view cascade;
create materialized view organisation.unitavailability_view as
select
    organisation.unitavailability_pt.id,
    organisation.unitavailability_pt.nilreason AS unitavailability_nilreason,
    coalesce(cast(organisation.unitavailability.operationalstatus_value as varchar), '(' || organisation.unitavailability.operationalstatus_nilreason || ')') as operationalstatus,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from organisation.unitavailability_pt 
inner join organisation.unitavailability on organisation.unitavailability_pt.unitavailability_id = organisation.unitavailability.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_crlmkv.*) AS timeinterval
  from master_join master_join_ymorbz
  join shared.timesheet_view shared_timesheet_view_crlmkv on master_join_ymorbz.target_id = shared_timesheet_view_crlmkv.id
  where master_join_ymorbz.source_id = organisation.unitavailability.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_iazfdg.*) AS annotation
  from master_join master_join_zsfyha
  join notes.note_view notes_note_view_iazfdg on master_join_zsfyha.target_id = notes_note_view_iazfdg.id
  where master_join_zsfyha.source_id = organisation.unitavailability.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_gzeuii.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_gzeuii.title AS varchar), '(' || organisation_organisationauthority_pt_gzeuii.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_gzeuii.href
  )) as lat_specialdateauthority  from master_join master_join_kjcudr
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_gzeuii on master_join_kjcudr.target_id = organisation_organisationauthority_pt_gzeuii.id
  where master_join_kjcudr.source_id = organisation.unitavailability.id
) as lat_specialdateauthority on TRUE;
create index on organisation.unitavailability_view (id);
-- VerticalStructureLightingStatusPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists obstacles.verticalstructurelightingstatus_view cascade;
create materialized view obstacles.verticalstructurelightingstatus_view as
select
    obstacles.verticalstructurelightingstatus_pt.id,
    obstacles.verticalstructurelightingstatus_pt.nilreason AS verticalstructurelightingstatus_nilreason,
    coalesce(cast(obstacles.verticalstructurelightingstatus.status_value as varchar), '(' || obstacles.verticalstructurelightingstatus.status_nilreason || ')') as status,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from obstacles.verticalstructurelightingstatus_pt 
inner join obstacles.verticalstructurelightingstatus on obstacles.verticalstructurelightingstatus_pt.verticalstructurelightingstatus_id = obstacles.verticalstructurelightingstatus.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_rleodw.*) AS timeinterval
  from master_join master_join_lpftad
  join shared.timesheet_view shared_timesheet_view_rleodw on master_join_lpftad.target_id = shared_timesheet_view_rleodw.id
  where master_join_lpftad.source_id = obstacles.verticalstructurelightingstatus.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_serlnc.*) AS annotation
  from master_join master_join_gevgun
  join notes.note_view notes_note_view_serlnc on master_join_gevgun.target_id = notes_note_view_serlnc.id
  where master_join_gevgun.source_id = obstacles.verticalstructurelightingstatus.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_tqlscq.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_tqlscq.title AS varchar), '(' || organisation_organisationauthority_pt_tqlscq.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_tqlscq.href
  )) as lat_specialdateauthority  from master_join master_join_vhuuio
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_tqlscq on master_join_vhuuio.target_id = organisation_organisationauthority_pt_tqlscq.id
  where master_join_vhuuio.source_id = obstacles.verticalstructurelightingstatus.id
) as lat_specialdateauthority on TRUE;
create index on obstacles.verticalstructurelightingstatus_view (id);
-- VerticalStructurePartPropertyType
-- ['notes.note_view', 'shared.timesheet_view', 'geometry.elevatedcurve_view', 'geometry.elevatedsurface_view', 'geometry.elevatedpoint_view']
drop materialized view if exists obstacles.verticalstructurepart_view cascade;
create materialized view obstacles.verticalstructurepart_view as
select
    obstacles.verticalstructurepart_pt.id,
    obstacles.verticalstructurepart_pt.nilreason AS verticalstructurepart_nilreason,
    coalesce(cast(obstacles.verticalstructurepart.type_value as varchar), '(' || obstacles.verticalstructurepart.type_nilreason || ')') as type,
    coalesce(cast(obstacles.verticalstructurepart.constructionstatus_value as varchar), '(' || obstacles.verticalstructurepart.constructionstatus_nilreason || ')') as constructionstatus,
    coalesce(cast(obstacles.verticalstructurepart.markingpattern_value as varchar), '(' || obstacles.verticalstructurepart.markingpattern_nilreason || ')') as markingpattern,
    coalesce(cast(obstacles.verticalstructurepart.markingfirstcolour_value as varchar), '(' || obstacles.verticalstructurepart.markingfirstcolour_nilreason || ')') as markingfirstcolour,
    coalesce(cast(obstacles.verticalstructurepart.markingsecondcolour_value as varchar), '(' || obstacles.verticalstructurepart.markingsecondcolour_nilreason || ')') as markingsecondcolour,
    coalesce(cast(obstacles.verticalstructurepart.mobile_value as varchar), '(' || obstacles.verticalstructurepart.mobile_nilreason || ')') as mobile,
    coalesce(cast(obstacles.verticalstructurepart.frangible_value as varchar), '(' || obstacles.verticalstructurepart.frangible_nilreason || ')') as frangible,
    coalesce(cast(obstacles.verticalstructurepart.visiblematerial_value as varchar), '(' || obstacles.verticalstructurepart.visiblematerial_nilreason || ')') as visiblematerial,
    coalesce(cast(obstacles.verticalstructurepart.designator_value as varchar), '(' || obstacles.verticalstructurepart.designator_nilreason || ')') as designator,
    coalesce(cast(obstacles.verticalstructurepart.verticalextent_value as varchar) || ' ' || obstacles.verticalstructurepart.verticalextent_uom, '(' || obstacles.verticalstructurepart.verticalextent_nilreason || ')') as verticalextent,
    coalesce(cast(obstacles.verticalstructurepart.verticalextentaccuracy_value as varchar) || ' ' || obstacles.verticalstructurepart.verticalextentaccuracy_uom, '(' || obstacles.verticalstructurepart.verticalextentaccuracy_nilreason || ')') as verticalextentaccuracy,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority,
    lat_lighting.lat_lighting as lighting
from obstacles.verticalstructurepart_pt 
inner join obstacles.verticalstructurepart on obstacles.verticalstructurepart_pt.verticalstructurepart_id = obstacles.verticalstructurepart.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_tskqxl.*) AS timeinterval
  from master_join master_join_zlncwx
  join shared.timesheet_view shared_timesheet_view_tskqxl on master_join_zlncwx.target_id = shared_timesheet_view_tskqxl.id
  where master_join_zlncwx.source_id = obstacles.verticalstructurepart.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_vtqjwm.*) AS annotation
  from master_join master_join_mzgldp
  join notes.note_view notes_note_view_vtqjwm on master_join_mzgldp.target_id = notes_note_view_vtqjwm.id
  where master_join_mzgldp.source_id = obstacles.verticalstructurepart.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_oirgnc.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_oirgnc.title AS varchar), '(' || organisation_organisationauthority_pt_oirgnc.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_oirgnc.href
  )) as lat_specialdateauthority  from master_join master_join_uczzvp
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_oirgnc on master_join_uczzvp.target_id = organisation_organisationauthority_pt_oirgnc.id
  where master_join_uczzvp.source_id = obstacles.verticalstructurepart.id
) as lat_specialdateauthority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_pt_cuitan.id) as lat_lighting
  from master_join master_join_khnfoi
  join shared.lightelement_pt shared_lightelement_pt_cuitan on master_join_khnfoi.target_id = shared_lightelement_pt_cuitan.id
  where master_join_khnfoi.source_id = obstacles.verticalstructurepart.id
) as lat_lighting on TRUE;
create index on obstacles.verticalstructurepart_view (id);
-- WorkareaActivityPropertyType
-- ['notes.note_view', 'shared.timesheet_view']
drop materialized view if exists airport_heliport.workareaactivity_view cascade;
create materialized view airport_heliport.workareaactivity_view as
select
    airport_heliport.workareaactivity_pt.id,
    airport_heliport.workareaactivity_pt.nilreason AS workareaactivity_nilreason,
    coalesce(cast(airport_heliport.workareaactivity.isactive_value as varchar), '(' || airport_heliport.workareaactivity.isactive_nilreason || ')') as isactive,
    lat_timeinterval.timeinterval as timeinterval,
    lat_annotation.annotation as annotation,
    lat_specialdateauthority.lat_specialdateauthority as specialdateauthority
from airport_heliport.workareaactivity_pt 
inner join airport_heliport.workareaactivity on airport_heliport.workareaactivity_pt.workareaactivity_id = airport_heliport.workareaactivity.id
left join lateral(
  select
    jsonb_agg(DISTINCT shared_timesheet_view_cqulka.*) AS timeinterval
  from master_join master_join_ufspkb
  join shared.timesheet_view shared_timesheet_view_cqulka on master_join_ufspkb.target_id = shared_timesheet_view_cqulka.id
  where master_join_ufspkb.source_id = airport_heliport.workareaactivity.id
) as lat_timeinterval on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xaysqa.*) AS annotation
  from master_join master_join_lafmza
  join notes.note_view notes_note_view_xaysqa on master_join_lafmza.target_id = notes_note_view_xaysqa.id
  where master_join_lafmza.source_id = airport_heliport.workareaactivity.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_xwucym.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_xwucym.title AS varchar), '(' || organisation_organisationauthority_pt_xwucym.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_xwucym.href
  )) as lat_specialdateauthority  from master_join master_join_xtnlok
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_xwucym on master_join_xtnlok.target_id = organisation_organisationauthority_pt_xwucym.id
  where master_join_xtnlok.source_id = airport_heliport.workareaactivity.id
) as lat_specialdateauthority on TRUE;
create index on airport_heliport.workareaactivity_view (id);
-- ContactInformationPropertyType
-- ['shared.postaladdress_view', 'shared.telephonecontact_view', 'shared.onlinecontact_view', 'notes.note_view']
-- Snowflake SQL : ContactInformationPropertyType 

DROP MATERIALIZED VIEW IF EXISTS shared.contactinformation_view CASCADE;

CREATE MATERIALIZED VIEW shared.contactinformation_view AS
SELECT 
0 AS id;
-- AirportHeliportUsagePropertyType
-- ['shared.contactinformation_view', 'notes.note_view']
drop materialized view if exists airport_heliport.airportheliportusage_view cascade;
create materialized view airport_heliport.airportheliportusage_view as
select
    airport_heliport.airportheliportusage_pt.id,
    airport_heliport.airportheliportusage_pt.nilreason AS airportheliportusage_nilreason,
    coalesce(cast(airport_heliport.airportheliportusage.type_value as varchar), '(' || airport_heliport.airportheliportusage.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.airportheliportusage.operation_value as varchar), '(' || airport_heliport.airportheliportusage.operation_nilreason || ')') as operation,
    coalesce(cast(airport_heliport.airportheliportusage.priorpermission_value as varchar) || ' ' || airport_heliport.airportheliportusage.priorpermission_uom, '(' || airport_heliport.airportheliportusage.priorpermission_nilreason || ')') as priorpermission,
    airport_heliport_conditioncombination_pt_dnktvh.id AS selection,
    lat_annotation.annotation as annotation
from airport_heliport.airportheliportusage_pt 
inner join airport_heliport.airportheliportusage on airport_heliport.airportheliportusage_pt.airportheliportusage_id = airport_heliport.airportheliportusage.id
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_dnktvh on airport_heliport.airportheliportusage.selection_id = airport_heliport_conditioncombination_pt_dnktvh.id
left join lateral(
  select
  from master_join master_join_fenvrl
  join shared.contactinformation_view shared_contactinformation_view_olkgzz on master_join_fenvrl.target_id = shared_contactinformation_view_olkgzz.id
  where master_join_fenvrl.source_id = airport_heliport.airportheliportusage.id
) as lat_contact on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ylpvkg.*) AS annotation
  from master_join master_join_gyimvl
  join notes.note_view notes_note_view_ylpvkg on master_join_gyimvl.target_id = notes_note_view_ylpvkg.id
  where master_join_gyimvl.source_id = airport_heliport.airportheliportusage.id
) as lat_annotation on TRUE;
create index on airport_heliport.airportheliportusage_view (id);
-- ApronAreaUsagePropertyType
-- ['shared.contactinformation_view', 'notes.note_view']
drop materialized view if exists airport_heliport.apronareausage_view cascade;
create materialized view airport_heliport.apronareausage_view as
select
    airport_heliport.apronareausage_pt.id,
    airport_heliport.apronareausage_pt.nilreason AS apronareausage_nilreason,
    coalesce(cast(airport_heliport.apronareausage.type_value as varchar), '(' || airport_heliport.apronareausage.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.apronareausage.priorpermission_value as varchar) || ' ' || airport_heliport.apronareausage.priorpermission_uom, '(' || airport_heliport.apronareausage.priorpermission_nilreason || ')') as priorpermission,
    airport_heliport_conditioncombination_pt_wvkmlx.id AS selection,
    lat_annotation.annotation as annotation
from airport_heliport.apronareausage_pt 
inner join airport_heliport.apronareausage on airport_heliport.apronareausage_pt.apronareausage_id = airport_heliport.apronareausage.id
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_wvkmlx on airport_heliport.apronareausage.selection_id = airport_heliport_conditioncombination_pt_wvkmlx.id
left join lateral(
  select
  from master_join master_join_veqdtj
  join shared.contactinformation_view shared_contactinformation_view_aqenyv on master_join_veqdtj.target_id = shared_contactinformation_view_aqenyv.id
  where master_join_veqdtj.source_id = airport_heliport.apronareausage.id
) as lat_contact on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_itilit.*) AS annotation
  from master_join master_join_lxjxga
  join notes.note_view notes_note_view_itilit on master_join_lxjxga.target_id = notes_note_view_itilit.id
  where master_join_lxjxga.source_id = airport_heliport.apronareausage.id
) as lat_annotation on TRUE;
create index on airport_heliport.apronareausage_view (id);
-- FlightRestrictionRoutePropertyType
-- ['shared.contactinformation_view', 'notes.note_view']
drop materialized view if exists routes.flightrestrictionroute_view cascade;
create materialized view routes.flightrestrictionroute_view as
select
    routes.flightrestrictionroute_pt.id,
    routes.flightrestrictionroute_pt.nilreason AS flightrestrictionroute_nilreason,
    coalesce(cast(routes.flightrestrictionroute.priorpermission_value as varchar), '(' || routes.flightrestrictionroute.priorpermission_nilreason || ')') as priorpermission,
    lat_routeelement.lat_routeelement as routeelement,
    lat_annotation.annotation as annotation
from routes.flightrestrictionroute_pt 
inner join routes.flightrestrictionroute on routes.flightrestrictionroute_pt.flightrestrictionroute_id = routes.flightrestrictionroute.id
left join lateral(
  select jsonb_agg(DISTINCT routes_flightroutingelement_pt_xprbwu.id) as lat_routeelement
  from master_join master_join_dvlbem
  join routes.flightroutingelement_pt routes_flightroutingelement_pt_xprbwu on master_join_dvlbem.target_id = routes_flightroutingelement_pt_xprbwu.id
  where master_join_dvlbem.source_id = routes.flightrestrictionroute.id
) as lat_routeelement on TRUE
left join lateral(
  select
  from master_join master_join_wxgbqw
  join shared.contactinformation_view shared_contactinformation_view_mqdplj on master_join_wxgbqw.target_id = shared_contactinformation_view_mqdplj.id
  where master_join_wxgbqw.source_id = routes.flightrestrictionroute.id
) as lat_contact on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jxzecz.*) AS annotation
  from master_join master_join_ldliar
  join notes.note_view notes_note_view_jxzecz on master_join_ldliar.target_id = notes_note_view_jxzecz.id
  where master_join_ldliar.source_id = routes.flightrestrictionroute.id
) as lat_annotation on TRUE;
create index on routes.flightrestrictionroute_view (id);
-- ManoeuvringAreaUsagePropertyType
-- ['shared.contactinformation_view', 'notes.note_view']
drop materialized view if exists airport_heliport.manoeuvringareausage_view cascade;
create materialized view airport_heliport.manoeuvringareausage_view as
select
    airport_heliport.manoeuvringareausage_pt.id,
    airport_heliport.manoeuvringareausage_pt.nilreason AS manoeuvringareausage_nilreason,
    coalesce(cast(airport_heliport.manoeuvringareausage.type_value as varchar), '(' || airport_heliport.manoeuvringareausage.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.manoeuvringareausage.operation_value as varchar), '(' || airport_heliport.manoeuvringareausage.operation_nilreason || ')') as operation,
    coalesce(cast(airport_heliport.manoeuvringareausage.priorpermission_value as varchar) || ' ' || airport_heliport.manoeuvringareausage.priorpermission_uom, '(' || airport_heliport.manoeuvringareausage.priorpermission_nilreason || ')') as priorpermission,
    airport_heliport_conditioncombination_pt_lkxoke.id AS selection,
    lat_annotation.annotation as annotation
from airport_heliport.manoeuvringareausage_pt 
inner join airport_heliport.manoeuvringareausage on airport_heliport.manoeuvringareausage_pt.manoeuvringareausage_id = airport_heliport.manoeuvringareausage.id
left join airport_heliport.conditioncombination_pt airport_heliport_conditioncombination_pt_lkxoke on airport_heliport.manoeuvringareausage.selection_id = airport_heliport_conditioncombination_pt_lkxoke.id
left join lateral(
  select
  from master_join master_join_rjgrse
  join shared.contactinformation_view shared_contactinformation_view_lgiupg on master_join_rjgrse.target_id = shared_contactinformation_view_lgiupg.id
  where master_join_rjgrse.source_id = airport_heliport.manoeuvringareausage.id
) as lat_contact on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_msooed.*) AS annotation
  from master_join master_join_ywzgux
  join notes.note_view notes_note_view_msooed on master_join_ywzgux.target_id = notes_note_view_msooed.id
  where master_join_ywzgux.source_id = airport_heliport.manoeuvringareausage.id
) as lat_annotation on TRUE;
create index on airport_heliport.manoeuvringareausage_view (id);
