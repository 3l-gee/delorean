-- AerialRefuellingTimeSliceType
-- ['routes.routeavailability_view', 'notes.note_view', 'aerial_refuelling.aerialrefuellinganchor_view', 'aerial_refuelling.aerialrefuellingtrack_view', 'aerial_refuelling.authorityforaerialrefuelling_view']
drop materialized view if exists aerial_refuelling.aerialrefuelling_view cascade;
create materialized view aerial_refuelling.aerialrefuelling_view as
select distinct on (aerialrefuelling.identifier,aerialrefuelling_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    aerial_refuelling.aerialrefuelling.id,
    aerial_refuelling.aerialrefuelling_ts.id as ts_id,
    aerial_refuelling.aerialrefuelling_tsp.id as tsp_id,
    aerial_refuelling.aerialrefuelling.identifier,
    aerial_refuelling.aerialrefuelling_ts.interpretation,
    aerial_refuelling.aerialrefuelling_ts.sequence_number,
    aerial_refuelling.aerialrefuelling_ts.correction_number,
    aerial_refuelling.aerialrefuelling_ts.valid_time_begin,
    aerial_refuelling.aerialrefuelling_ts.valid_time_end,
    aerial_refuelling.aerialrefuelling_ts.feature_lifetime_begin,
    aerial_refuelling.aerialrefuelling_ts.feature_lifetime_end,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.designatorprefix_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.designatorprefix_nilreason || ')') as designatorprefix,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.designatornumber_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.designatornumber_nilreason || ')') as designatornumber,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.designatorsuffix_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.designatorsuffix_nilreason || ')') as designatorsuffix,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.designatordirection_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.designatordirection_nilreason || ')') as designatordirection,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.name_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.name_nilreason || ')') as name,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.type_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.type_nilreason || ')') as type,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.radarbeaconsetting_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.radarbeaconsetting_nilreason || ')') as radarbeaconsetting,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.xbandradarsetting_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.xbandradarsetting_nilreason || ')') as xbandradarsetting,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.tankerchannel_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.tankerchannel_nilreason || ')') as tankerchannel,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.receiverchannel_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.receiverchannel_nilreason || ')') as receiverchannel,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.helicopterroute_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.helicopterroute_nilreason || ')') as helicopterroute,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.specialrefuelling_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.specialrefuelling_nilreason || ')') as specialrefuelling,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.bidirectionaluse_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.bidirectionaluse_nilreason || ')') as bidirectionaluse,
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.reversedirectionturn_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.reversedirectionturn_nilreason || ')') as reversedirectionturn,
    coalesce(cast(aerial_refuelling_aerialrefuelling_pt_sgndap.title as varchar), '(' || aerial_refuelling_aerialrefuelling_pt_sgndap.nilreason[1] || ')') AS oppositetrack,
    aerial_refuelling_aerialrefuelling_pt_sgndap.href AS oppositetrack_href,
    lat_availability.lat_availability as availability,
    lat_protectingairspace.lat_protectingairspace as protectingairspace,
    lat_track.lat_track as track,
    lat_anchor.lat_anchor as anchor,
    lat_managingorganisation.lat_managingorganisation as managingorganisation,
    lat_annotation.annotation as annotation
from aerial_refuelling.aerialrefuelling 
inner join master_join mj2 on aerial_refuelling.aerialrefuelling.id = mj2.source_id
inner join aerial_refuelling.aerialrefuelling_tsp on mj2.target_id = aerial_refuelling.aerialrefuelling_tsp.id
inner join aerial_refuelling.aerialrefuelling_ts on aerial_refuelling.aerialrefuelling_tsp.aerialrefuellingtimeslice_id = aerial_refuelling.aerialrefuelling_ts.id
left join aerial_refuelling.aerialrefuelling_pt aerial_refuelling_aerialrefuelling_pt_sgndap on aerial_refuelling.aerialrefuelling_ts.oppositetrack_id = aerial_refuelling_aerialrefuelling_pt_sgndap.id
left join lateral(
  select jsonb_agg(DISTINCT routes_routeavailability_view_oxbpgc.*) as lat_availability
  from master_join master_join_kmtjhl
  join routes.routeavailability_view routes_routeavailability_view_oxbpgc on master_join_kmtjhl.target_id = routes_routeavailability_view_oxbpgc.id
  where master_join_kmtjhl.source_id = aerial_refuelling.aerialrefuelling_ts.id
) as lat_availability on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airspace_airspace_pt_btgpcg.id,
      'title', coalesce(cast(airspace_airspace_pt_btgpcg.title AS varchar), '(' || airspace_airspace_pt_btgpcg.nilreason[1] || ')'),
      'href', airspace_airspace_pt_btgpcg.href
  )) as lat_protectingairspace  from master_join master_join_ltmhvv
  join airspace.airspace_pt airspace_airspace_pt_btgpcg on master_join_ltmhvv.target_id = airspace_airspace_pt_btgpcg.id
  where master_join_ltmhvv.source_id = aerial_refuelling.aerialrefuelling_ts.id
) as lat_protectingairspace on TRUE
left join lateral(
  select jsonb_agg(DISTINCT aerial_refuelling_aerialrefuellingtrack_view_eehkfz.*) as lat_track
  from master_join master_join_rkupie
  join aerial_refuelling.aerialrefuellingtrack_view aerial_refuelling_aerialrefuellingtrack_view_eehkfz on master_join_rkupie.target_id = aerial_refuelling_aerialrefuellingtrack_view_eehkfz.id
  where master_join_rkupie.source_id = aerial_refuelling.aerialrefuelling_ts.id
) as lat_track on TRUE
left join lateral(
  select jsonb_agg(DISTINCT aerial_refuelling_aerialrefuellinganchor_view_wlctyz.*) as lat_anchor
  from master_join master_join_psevsw
  join aerial_refuelling.aerialrefuellinganchor_view aerial_refuelling_aerialrefuellinganchor_view_wlctyz on master_join_psevsw.target_id = aerial_refuelling_aerialrefuellinganchor_view_wlctyz.id
  where master_join_psevsw.source_id = aerial_refuelling.aerialrefuelling_ts.id
) as lat_anchor on TRUE
left join lateral(
  select jsonb_agg(DISTINCT aerial_refuelling_authorityforaerialrefuelling_view_dtkcvk.*) as lat_managingorganisation
  from master_join master_join_ebsvxu
  join aerial_refuelling.authorityforaerialrefuelling_view aerial_refuelling_authorityforaerialrefuelling_view_dtkcvk on master_join_ebsvxu.target_id = aerial_refuelling_authorityforaerialrefuelling_view_dtkcvk.id
  where master_join_ebsvxu.source_id = aerial_refuelling.aerialrefuelling_ts.id
) as lat_managingorganisation on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jjysfx.*) AS annotation
  from master_join master_join_xsyoql
  join notes.note_view notes_note_view_jjysfx on master_join_xsyoql.target_id = notes_note_view_jjysfx.id
  where master_join_xsyoql.source_id = aerial_refuelling.aerialrefuelling_ts.id
) as lat_annotation on TRUE
where aerial_refuelling.aerialrefuelling.feature_status = 'APPROVED'
  and aerial_refuelling.aerialrefuelling_ts.feature_status = 'APPROVED'
order by aerialrefuelling.identifier, aerialrefuelling_ts.sequence_number, aerialrefuelling_ts.correction_number DESC;
create index on aerial_refuelling.aerialrefuelling_view (id);
-- AeronauticalGroundLightTimeSliceType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists navaids_points.aeronauticalgroundlight_view cascade;
create materialized view navaids_points.aeronauticalgroundlight_view as
select distinct on (aeronauticalgroundlight.identifier,aeronauticalgroundlight_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.aeronauticalgroundlight.id,
    navaids_points.aeronauticalgroundlight_ts.id as ts_id,
    navaids_points.aeronauticalgroundlight_tsp.id as tsp_id,
    navaids_points.aeronauticalgroundlight.identifier,
    navaids_points.aeronauticalgroundlight_ts.interpretation,
    navaids_points.aeronauticalgroundlight_ts.sequence_number,
    navaids_points.aeronauticalgroundlight_ts.correction_number,
    navaids_points.aeronauticalgroundlight_ts.valid_time_begin,
    navaids_points.aeronauticalgroundlight_ts.valid_time_end,
    navaids_points.aeronauticalgroundlight_ts.feature_lifetime_begin,
    navaids_points.aeronauticalgroundlight_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.name_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.type_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.colour_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.colour_nilreason || ')') as colour,
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.flashing_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.flashing_nilreason || ')') as flashing,
    coalesce(cast(obstacles_verticalstructure_pt_ahnhfg.title as varchar), '(' || obstacles_verticalstructure_pt_ahnhfg.nilreason[1] || ')') AS structurebeacon,
    obstacles_verticalstructure_pt_ahnhfg.href AS structurebeacon_href,
    coalesce(cast(airport_heliport_airportheliport_pt_pteifp.title as varchar), '(' || airport_heliport_airportheliport_pt_pteifp.nilreason[1] || ')') AS aerodromebeacon,
    airport_heliport_airportheliport_pt_pteifp.href AS aerodromebeacon_href,
    geometry_elevatedpoint_view_ekyfze.geom AS location_geom,
    geometry_elevatedpoint_view_ekyfze.longitude AS location_longitude,
    geometry_elevatedpoint_view_ekyfze.latitude AS location_latitude,
    geometry_elevatedpoint_view_ekyfze.elevation AS location_elevation,
    geometry_elevatedpoint_view_ekyfze.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_ekyfze.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_ekyfze.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_ekyfze.horizontalAccuracy AS location_horizontalaccuracy,
    lat_annotation.annotation as annotation
from navaids_points.aeronauticalgroundlight 
inner join master_join mj2 on navaids_points.aeronauticalgroundlight.id = mj2.source_id
inner join navaids_points.aeronauticalgroundlight_tsp on mj2.target_id = navaids_points.aeronauticalgroundlight_tsp.id
inner join navaids_points.aeronauticalgroundlight_ts on navaids_points.aeronauticalgroundlight_tsp.aeronauticalgroundlighttimeslice_id = navaids_points.aeronauticalgroundlight_ts.id
left join obstacles.verticalstructure_pt obstacles_verticalstructure_pt_ahnhfg on navaids_points.aeronauticalgroundlight_ts.structurebeacon_id = obstacles_verticalstructure_pt_ahnhfg.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_pteifp on navaids_points.aeronauticalgroundlight_ts.aerodromebeacon_id = airport_heliport_airportheliport_pt_pteifp.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_ekyfze on navaids_points.aeronauticalgroundlight_ts.location_id = geometry_elevatedpoint_view_ekyfze.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xmzwsl.*) AS annotation
  from master_join master_join_ynduzv
  join notes.note_view notes_note_view_xmzwsl on master_join_ynduzv.target_id = notes_note_view_xmzwsl.id
  where master_join_ynduzv.source_id = navaids_points.aeronauticalgroundlight_ts.id
) as lat_annotation on TRUE
where navaids_points.aeronauticalgroundlight.feature_status = 'APPROVED'
  and navaids_points.aeronauticalgroundlight_ts.feature_status = 'APPROVED'
order by aeronauticalgroundlight.identifier, aeronauticalgroundlight_ts.sequence_number, aeronauticalgroundlight_ts.correction_number DESC;
create index on navaids_points.aeronauticalgroundlight_view (id);
-- AircraftGroundServiceTimeSliceType
-- ['geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.aircraftgroundservice_view cascade;
create materialized view service.aircraftgroundservice_view as
select distinct on (aircraftgroundservice.identifier,aircraftgroundservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.aircraftgroundservice.id,
    service.aircraftgroundservice_ts.id as ts_id,
    service.aircraftgroundservice_tsp.id as tsp_id,
    service.aircraftgroundservice.identifier,
    service.aircraftgroundservice_ts.interpretation,
    service.aircraftgroundservice_ts.sequence_number,
    service.aircraftgroundservice_ts.correction_number,
    service.aircraftgroundservice_ts.valid_time_begin,
    service.aircraftgroundservice_ts.valid_time_end,
    service.aircraftgroundservice_ts.feature_lifetime_begin,
    service.aircraftgroundservice_ts.feature_lifetime_end,
    coalesce(cast(service.aircraftgroundservice_ts.flightoperations_value as varchar), '(' || service.aircraftgroundservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.aircraftgroundservice_ts.rank_value as varchar), '(' || service.aircraftgroundservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.aircraftgroundservice_ts.complianticao_value as varchar), '(' || service.aircraftgroundservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.aircraftgroundservice_ts.name_value as varchar), '(' || service.aircraftgroundservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.aircraftgroundservice_ts.type_value as varchar), '(' || service.aircraftgroundservice_ts.type_nilreason || ')') as type,
    geometry_elevatedpoint_view_qqwwlu.geom AS location_geom,
    geometry_elevatedpoint_view_qqwwlu.longitude AS location_longitude,
    geometry_elevatedpoint_view_qqwwlu.latitude AS location_latitude,
    geometry_elevatedpoint_view_qqwwlu.elevation AS location_elevation,
    geometry_elevatedpoint_view_qqwwlu.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_qqwwlu.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_qqwwlu.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_qqwwlu.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_mupuvc.title as varchar), '(' || organisation_unit_pt_mupuvc.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_mupuvc.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_airportheliport.lat_airportheliport as airportheliport
from service.aircraftgroundservice 
inner join master_join mj2 on service.aircraftgroundservice.id = mj2.source_id
inner join service.aircraftgroundservice_tsp on mj2.target_id = service.aircraftgroundservice_tsp.id
inner join service.aircraftgroundservice_ts on service.aircraftgroundservice_tsp.aircraftgroundservicetimeslice_id = service.aircraftgroundservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_qqwwlu on service.aircraftgroundservice_ts.location_id = geometry_elevatedpoint_view_qqwwlu.id
left join organisation.unit_pt organisation_unit_pt_mupuvc on service.aircraftgroundservice_ts.serviceprovider_id = organisation_unit_pt_mupuvc.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_hoqhqz.*) as lat_callsign
  from master_join master_join_ejaewf
  join service.callsigndetail_view service_callsigndetail_view_hoqhqz on master_join_ejaewf.target_id = service_callsigndetail_view_hoqhqz.id
  where master_join_ejaewf.source_id = service.aircraftgroundservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_nhxmvk.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_nhxmvk.title AS varchar), '(' || service_radiocommunicationchannel_pt_nhxmvk.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_nhxmvk.href
  )) as lat_radiocommunication  from master_join master_join_eusptc
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_nhxmvk on master_join_eusptc.target_id = service_radiocommunicationchannel_pt_nhxmvk.id
  where master_join_eusptc.source_id = service.aircraftgroundservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_lmbpkg
  join shared.contactinformation_view shared_contactinformation_view_ccorba on master_join_lmbpkg.target_id = shared_contactinformation_view_ccorba.id
  where master_join_lmbpkg.source_id = service.aircraftgroundservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_jnuksb.*) as lat_availability
  from master_join master_join_mtxanx
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_jnuksb on master_join_mtxanx.target_id = service_serviceoperationalstatus_view_jnuksb.id
  where master_join_mtxanx.source_id = service.aircraftgroundservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pqjals.*) AS annotation
  from master_join master_join_xkplji
  join notes.note_view notes_note_view_pqjals on master_join_xkplji.target_id = notes_note_view_pqjals.id
  where master_join_xkplji.source_id = service.aircraftgroundservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_xvtlbk.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_xvtlbk.title AS varchar), '(' || airport_heliport_airportheliport_pt_xvtlbk.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_xvtlbk.href
  )) as lat_airportheliport  from master_join master_join_edgemv
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_xvtlbk on master_join_edgemv.target_id = airport_heliport_airportheliport_pt_xvtlbk.id
  where master_join_edgemv.source_id = service.aircraftgroundservice_ts.id
) as lat_airportheliport on TRUE
where service.aircraftgroundservice.feature_status = 'APPROVED'
  and service.aircraftgroundservice_ts.feature_status = 'APPROVED'
order by aircraftgroundservice.identifier, aircraftgroundservice_ts.sequence_number, aircraftgroundservice_ts.correction_number DESC;
create index on service.aircraftgroundservice_view (id);
-- AircraftStandTimeSliceType
-- ['geometry.elevatedsurface_view', 'geometry.elevatedpoint_view', 'airport_heliport.aircraftstandcontamination_view', 'notes.note_view', 'airport_heliport.surfacecharacteristics_view', 'airport_heliport.apronareaavailability_view']
drop materialized view if exists airport_heliport.aircraftstand_view cascade;
create materialized view airport_heliport.aircraftstand_view as
select distinct on (aircraftstand.identifier,aircraftstand_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.aircraftstand.id,
    airport_heliport.aircraftstand_ts.id as ts_id,
    airport_heliport.aircraftstand_tsp.id as tsp_id,
    airport_heliport.aircraftstand.identifier,
    airport_heliport.aircraftstand_ts.interpretation,
    airport_heliport.aircraftstand_ts.sequence_number,
    airport_heliport.aircraftstand_ts.correction_number,
    airport_heliport.aircraftstand_ts.valid_time_begin,
    airport_heliport.aircraftstand_ts.valid_time_end,
    airport_heliport.aircraftstand_ts.feature_lifetime_begin,
    airport_heliport.aircraftstand_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.aircraftstand_ts.designator_value as varchar), '(' || airport_heliport.aircraftstand_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.aircraftstand_ts.type_value as varchar), '(' || airport_heliport.aircraftstand_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.aircraftstand_ts.visualdockingsystem_value as varchar), '(' || airport_heliport.aircraftstand_ts.visualdockingsystem_nilreason || ')') as visualdockingsystem,
    to_jsonb(airport_heliport_surfacecharacteristics_view_qizuxq.*) AS surfaceproperties,
    geometry_elevatedpoint_view_ftbjtf.geom AS location_geom,
    geometry_elevatedpoint_view_ftbjtf.longitude AS location_longitude,
    geometry_elevatedpoint_view_ftbjtf.latitude AS location_latitude,
    geometry_elevatedpoint_view_ftbjtf.elevation AS location_elevation,
    geometry_elevatedpoint_view_ftbjtf.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_ftbjtf.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_ftbjtf.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_ftbjtf.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(airport_heliport_apronelement_pt_ptkbvl.title as varchar), '(' || airport_heliport_apronelement_pt_ptkbvl.nilreason[1] || ')') AS apronlocation,
    airport_heliport_apronelement_pt_ptkbvl.href AS apronlocation_href,
    geometry_elevatedsurface_view_xwvewv.geom AS extent_geom,
    geometry_elevatedsurface_view_xwvewv.elevation AS extent_elevation,
    geometry_elevatedsurface_view_xwvewv.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_xwvewv.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_xwvewv.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_xwvewv.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_contaminant.lat_contaminant as contaminant,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.aircraftstand 
inner join master_join mj2 on airport_heliport.aircraftstand.id = mj2.source_id
inner join airport_heliport.aircraftstand_tsp on mj2.target_id = airport_heliport.aircraftstand_tsp.id
inner join airport_heliport.aircraftstand_ts on airport_heliport.aircraftstand_tsp.aircraftstandtimeslice_id = airport_heliport.aircraftstand_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_qizuxq on airport_heliport.aircraftstand_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_qizuxq.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_ftbjtf on airport_heliport.aircraftstand_ts.location_id = geometry_elevatedpoint_view_ftbjtf.id
left join airport_heliport.apronelement_pt airport_heliport_apronelement_pt_ptkbvl on airport_heliport.aircraftstand_ts.apronlocation_id = airport_heliport_apronelement_pt_ptkbvl.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_xwvewv on airport_heliport.aircraftstand_ts.extent_id = geometry_elevatedsurface_view_xwvewv.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_aircraftstandcontamination_view_wsfmiu.*) as lat_contaminant
  from master_join master_join_kdfrsw
  join airport_heliport.aircraftstandcontamination_view airport_heliport_aircraftstandcontamination_view_wsfmiu on master_join_kdfrsw.target_id = airport_heliport_aircraftstandcontamination_view_wsfmiu.id
  where master_join_kdfrsw.source_id = airport_heliport.aircraftstand_ts.id
) as lat_contaminant on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_cluqtx.*) AS annotation
  from master_join master_join_gkybzh
  join notes.note_view notes_note_view_cluqtx on master_join_gkybzh.target_id = notes_note_view_cluqtx.id
  where master_join_gkybzh.source_id = airport_heliport.aircraftstand_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_apronareaavailability_view_dsyavs.*) as lat_availability
  from master_join master_join_tzxhxq
  join airport_heliport.apronareaavailability_view airport_heliport_apronareaavailability_view_dsyavs on master_join_tzxhxq.target_id = airport_heliport_apronareaavailability_view_dsyavs.id
  where master_join_tzxhxq.source_id = airport_heliport.aircraftstand_ts.id
) as lat_availability on TRUE
where airport_heliport.aircraftstand.feature_status = 'APPROVED'
  and airport_heliport.aircraftstand_ts.feature_status = 'APPROVED'
order by aircraftstand.identifier, aircraftstand_ts.sequence_number, aircraftstand_ts.correction_number DESC;
create index on airport_heliport.aircraftstand_view (id);
-- AirportClearanceServiceTimeSliceType
-- ['geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.airportclearanceservice_view cascade;
create materialized view service.airportclearanceservice_view as
select distinct on (airportclearanceservice.identifier,airportclearanceservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.airportclearanceservice.id,
    service.airportclearanceservice_ts.id as ts_id,
    service.airportclearanceservice_tsp.id as tsp_id,
    service.airportclearanceservice.identifier,
    service.airportclearanceservice_ts.interpretation,
    service.airportclearanceservice_ts.sequence_number,
    service.airportclearanceservice_ts.correction_number,
    service.airportclearanceservice_ts.valid_time_begin,
    service.airportclearanceservice_ts.valid_time_end,
    service.airportclearanceservice_ts.feature_lifetime_begin,
    service.airportclearanceservice_ts.feature_lifetime_end,
    coalesce(cast(service.airportclearanceservice_ts.flightoperations_value as varchar), '(' || service.airportclearanceservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airportclearanceservice_ts.rank_value as varchar), '(' || service.airportclearanceservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airportclearanceservice_ts.complianticao_value as varchar), '(' || service.airportclearanceservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airportclearanceservice_ts.name_value as varchar), '(' || service.airportclearanceservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.airportclearanceservice_ts.snowplan_value as varchar), '(' || service.airportclearanceservice_ts.snowplan_nilreason || ')') as snowplan,
    geometry_elevatedpoint_view_axkjsp.geom AS location_geom,
    geometry_elevatedpoint_view_axkjsp.longitude AS location_longitude,
    geometry_elevatedpoint_view_axkjsp.latitude AS location_latitude,
    geometry_elevatedpoint_view_axkjsp.elevation AS location_elevation,
    geometry_elevatedpoint_view_axkjsp.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_axkjsp.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_axkjsp.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_axkjsp.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_bgckjp.title as varchar), '(' || organisation_unit_pt_bgckjp.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_bgckjp.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_airportheliport.lat_airportheliport as airportheliport
from service.airportclearanceservice 
inner join master_join mj2 on service.airportclearanceservice.id = mj2.source_id
inner join service.airportclearanceservice_tsp on mj2.target_id = service.airportclearanceservice_tsp.id
inner join service.airportclearanceservice_ts on service.airportclearanceservice_tsp.airportclearanceservicetimeslice_id = service.airportclearanceservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_axkjsp on service.airportclearanceservice_ts.location_id = geometry_elevatedpoint_view_axkjsp.id
left join organisation.unit_pt organisation_unit_pt_bgckjp on service.airportclearanceservice_ts.serviceprovider_id = organisation_unit_pt_bgckjp.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_orsssc.*) as lat_callsign
  from master_join master_join_hyxipk
  join service.callsigndetail_view service_callsigndetail_view_orsssc on master_join_hyxipk.target_id = service_callsigndetail_view_orsssc.id
  where master_join_hyxipk.source_id = service.airportclearanceservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_toxhvq.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_toxhvq.title AS varchar), '(' || service_radiocommunicationchannel_pt_toxhvq.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_toxhvq.href
  )) as lat_radiocommunication  from master_join master_join_dieymz
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_toxhvq on master_join_dieymz.target_id = service_radiocommunicationchannel_pt_toxhvq.id
  where master_join_dieymz.source_id = service.airportclearanceservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_wrwcos
  join shared.contactinformation_view shared_contactinformation_view_xgpgtl on master_join_wrwcos.target_id = shared_contactinformation_view_xgpgtl.id
  where master_join_wrwcos.source_id = service.airportclearanceservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_tnghpf.*) as lat_availability
  from master_join master_join_twzagi
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_tnghpf on master_join_twzagi.target_id = service_serviceoperationalstatus_view_tnghpf.id
  where master_join_twzagi.source_id = service.airportclearanceservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ipuelu.*) AS annotation
  from master_join master_join_kyewyl
  join notes.note_view notes_note_view_ipuelu on master_join_kyewyl.target_id = notes_note_view_ipuelu.id
  where master_join_kyewyl.source_id = service.airportclearanceservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_kajwon.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_kajwon.title AS varchar), '(' || airport_heliport_airportheliport_pt_kajwon.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_kajwon.href
  )) as lat_airportheliport  from master_join master_join_zjguam
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_kajwon on master_join_zjguam.target_id = airport_heliport_airportheliport_pt_kajwon.id
  where master_join_zjguam.source_id = service.airportclearanceservice_ts.id
) as lat_airportheliport on TRUE
where service.airportclearanceservice.feature_status = 'APPROVED'
  and service.airportclearanceservice_ts.feature_status = 'APPROVED'
order by airportclearanceservice.identifier, airportclearanceservice_ts.sequence_number, airportclearanceservice_ts.correction_number DESC;
create index on service.airportclearanceservice_view (id);
-- AirportHeliportCollocationTimeSliceType
-- ['notes.note_view']
drop materialized view if exists airport_heliport.airportheliportcollocation_view cascade;
create materialized view airport_heliport.airportheliportcollocation_view as
select distinct on (airportheliportcollocation.identifier,airportheliportcollocation_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.airportheliportcollocation.id,
    airport_heliport.airportheliportcollocation_ts.id as ts_id,
    airport_heliport.airportheliportcollocation_tsp.id as tsp_id,
    airport_heliport.airportheliportcollocation.identifier,
    airport_heliport.airportheliportcollocation_ts.interpretation,
    airport_heliport.airportheliportcollocation_ts.sequence_number,
    airport_heliport.airportheliportcollocation_ts.correction_number,
    airport_heliport.airportheliportcollocation_ts.valid_time_begin,
    airport_heliport.airportheliportcollocation_ts.valid_time_end,
    airport_heliport.airportheliportcollocation_ts.feature_lifetime_begin,
    airport_heliport.airportheliportcollocation_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.airportheliportcollocation_ts.type_value as varchar), '(' || airport_heliport.airportheliportcollocation_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport_airportheliport_pt_zrsbkv.title as varchar), '(' || airport_heliport_airportheliport_pt_zrsbkv.nilreason[1] || ')') AS hostairport,
    airport_heliport_airportheliport_pt_zrsbkv.href AS hostairport_href,
    coalesce(cast(airport_heliport_airportheliport_pt_hpklnc.title as varchar), '(' || airport_heliport_airportheliport_pt_hpklnc.nilreason[1] || ')') AS dependentairport,
    airport_heliport_airportheliport_pt_hpklnc.href AS dependentairport_href,
    lat_annotation.annotation as annotation
from airport_heliport.airportheliportcollocation 
inner join master_join mj2 on airport_heliport.airportheliportcollocation.id = mj2.source_id
inner join airport_heliport.airportheliportcollocation_tsp on mj2.target_id = airport_heliport.airportheliportcollocation_tsp.id
inner join airport_heliport.airportheliportcollocation_ts on airport_heliport.airportheliportcollocation_tsp.airportheliportcollocationtimeslice_id = airport_heliport.airportheliportcollocation_ts.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_zrsbkv on airport_heliport.airportheliportcollocation_ts.hostairport_id = airport_heliport_airportheliport_pt_zrsbkv.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_hpklnc on airport_heliport.airportheliportcollocation_ts.dependentairport_id = airport_heliport_airportheliport_pt_hpklnc.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_helifu.*) AS annotation
  from master_join master_join_kzjzky
  join notes.note_view notes_note_view_helifu on master_join_kzjzky.target_id = notes_note_view_helifu.id
  where master_join_kzjzky.source_id = airport_heliport.airportheliportcollocation_ts.id
) as lat_annotation on TRUE
where airport_heliport.airportheliportcollocation.feature_status = 'APPROVED'
  and airport_heliport.airportheliportcollocation_ts.feature_status = 'APPROVED'
order by airportheliportcollocation.identifier, airportheliportcollocation_ts.sequence_number, airportheliportcollocation_ts.correction_number DESC;
create index on airport_heliport.airportheliportcollocation_view (id);
-- AirportHeliportTimeSliceType
-- ['geometry.elevatedsurface_view', 'geometry.elevatedpoint_view', 'airport_heliport.airportheliportavailability_view', 'airport_heliport.airportheliportresponsibilityorganisation_view', 'airport_heliport.airportheliportcontamination_view', 'airport_heliport.city_view', 'shared.contactinformation_view', 'notes.note_view']
drop materialized view if exists airport_heliport.airportheliport_view cascade;
create materialized view airport_heliport.airportheliport_view as
select distinct on (airportheliport.identifier,airportheliport_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.airportheliport.id,
    airport_heliport.airportheliport_ts.id as ts_id,
    airport_heliport.airportheliport_tsp.id as tsp_id,
    airport_heliport.airportheliport.identifier,
    airport_heliport.airportheliport_ts.interpretation,
    airport_heliport.airportheliport_ts.sequence_number,
    airport_heliport.airportheliport_ts.correction_number,
    airport_heliport.airportheliport_ts.valid_time_begin,
    airport_heliport.airportheliport_ts.valid_time_end,
    airport_heliport.airportheliport_ts.feature_lifetime_begin,
    airport_heliport.airportheliport_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.airportheliport_ts.designator_value as varchar), '(' || airport_heliport.airportheliport_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.airportheliport_ts.name_value as varchar), '(' || airport_heliport.airportheliport_ts.name_nilreason || ')') as name,
    coalesce(cast(airport_heliport.airportheliport_ts.locationindicatoricao_value as varchar), '(' || airport_heliport.airportheliport_ts.locationindicatoricao_nilreason || ')') as locationindicatoricao,
    coalesce(cast(airport_heliport.airportheliport_ts.designatoriata_value as varchar), '(' || airport_heliport.airportheliport_ts.designatoriata_nilreason || ')') as designatoriata,
    coalesce(cast(airport_heliport.airportheliport_ts.type_value as varchar), '(' || airport_heliport.airportheliport_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.airportheliport_ts.certifiedicao_value as varchar), '(' || airport_heliport.airportheliport_ts.certifiedicao_nilreason || ')') as certifiedicao,
    coalesce(cast(airport_heliport.airportheliport_ts.privateuse_value as varchar), '(' || airport_heliport.airportheliport_ts.privateuse_nilreason || ')') as privateuse,
    coalesce(cast(airport_heliport.airportheliport_ts.controltype_value as varchar), '(' || airport_heliport.airportheliport_ts.controltype_nilreason || ')') as controltype,
    coalesce(cast(airport_heliport.airportheliport_ts.verticaldatum_value as varchar), '(' || airport_heliport.airportheliport_ts.verticaldatum_nilreason || ')') as verticaldatum,
    coalesce(cast(airport_heliport.airportheliport_ts.magneticvariation_value as varchar), '(' || airport_heliport.airportheliport_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(airport_heliport.airportheliport_ts.magneticvariationaccuracy_value as varchar), '(' || airport_heliport.airportheliport_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(airport_heliport.airportheliport_ts.datemagneticvariation_value as varchar), '(' || airport_heliport.airportheliport_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(airport_heliport.airportheliport_ts.magneticvariationchange_value as varchar), '(' || airport_heliport.airportheliport_ts.magneticvariationchange_nilreason || ')') as magneticvariationchange,
    coalesce(cast(airport_heliport.airportheliport_ts.altimeterchecklocation_value as varchar), '(' || airport_heliport.airportheliport_ts.altimeterchecklocation_nilreason || ')') as altimeterchecklocation,
    coalesce(cast(airport_heliport.airportheliport_ts.secondarypowersupply_value as varchar), '(' || airport_heliport.airportheliport_ts.secondarypowersupply_nilreason || ')') as secondarypowersupply,
    coalesce(cast(airport_heliport.airportheliport_ts.winddirectionindicator_value as varchar), '(' || airport_heliport.airportheliport_ts.winddirectionindicator_nilreason || ')') as winddirectionindicator,
    coalesce(cast(airport_heliport.airportheliport_ts.landingdirectionindicator_value as varchar), '(' || airport_heliport.airportheliport_ts.landingdirectionindicator_nilreason || ')') as landingdirectionindicator,
    coalesce(cast(airport_heliport.airportheliport_ts.abandoned_value as varchar), '(' || airport_heliport.airportheliport_ts.abandoned_nilreason || ')') as abandoned,
    coalesce(cast(airport_heliport.airportheliport_ts.fieldelevation_value as varchar) || ' ' || airport_heliport.airportheliport_ts.fieldelevation_uom, '(' || airport_heliport.airportheliport_ts.fieldelevation_nilreason || ')') as fieldelevation,
    coalesce(cast(airport_heliport.airportheliport_ts.fieldelevationaccuracy_value as varchar) || ' ' || airport_heliport.airportheliport_ts.fieldelevationaccuracy_uom, '(' || airport_heliport.airportheliport_ts.fieldelevationaccuracy_nilreason || ')') as fieldelevationaccuracy,
    coalesce(cast(airport_heliport.airportheliport_ts.referencetemperature_value as varchar) || ' ' || airport_heliport.airportheliport_ts.referencetemperature_uom, '(' || airport_heliport.airportheliport_ts.referencetemperature_nilreason || ')') as referencetemperature,
    coalesce(cast(airport_heliport.airportheliport_ts.transitionaltitude_value as varchar) || ' ' || airport_heliport.airportheliport_ts.transitionaltitude_uom, '(' || airport_heliport.airportheliport_ts.transitionaltitude_nilreason || ')') as transitionaltitude,
    coalesce(cast(airport_heliport.airportheliport_ts.transitionlevel_value as varchar) || ' ' || airport_heliport.airportheliport_ts.transitionlevel_uom, '(' || airport_heliport.airportheliport_ts.transitionlevel_nilreason || ')') as transitionlevel,
    coalesce(cast(airport_heliport.airportheliport_ts.lowesttemperature_value as varchar) || ' ' || airport_heliport.airportheliport_ts.lowesttemperature_uom, '(' || airport_heliport.airportheliport_ts.lowesttemperature_nilreason || ')') as lowesttemperature,
    to_jsonb(airport_heliport_airportheliportresponsibilityorganisation_view_vgszly.*) AS responsibleorganisation,
    geometry_elevatedpoint_view_gpugcu.geom AS arp_geom,
    geometry_elevatedpoint_view_gpugcu.longitude AS arp_longitude,
    geometry_elevatedpoint_view_gpugcu.latitude AS arp_latitude,
    geometry_elevatedpoint_view_gpugcu.elevation AS arp_elevation,
    geometry_elevatedpoint_view_gpugcu.geoidUndulation AS arp_geoidundulation,
    geometry_elevatedpoint_view_gpugcu.verticalDatum AS arp_verticaldatum,
    geometry_elevatedpoint_view_gpugcu.verticalAccuracy AS arp_verticalaccuracy,
    geometry_elevatedpoint_view_gpugcu.horizontalAccuracy AS arp_horizontalaccuracy,
    geometry_elevatedsurface_view_enpdpi.geom AS aviationboundary_geom,
    geometry_elevatedsurface_view_enpdpi.elevation AS aviationboundary_elevation,
    geometry_elevatedsurface_view_enpdpi.geoidUndulation AS aviationboundary_geoidundulation,
    geometry_elevatedsurface_view_enpdpi.verticalDatum AS aviationboundary_verticaldatum,
    geometry_elevatedsurface_view_enpdpi.verticalAccuracy AS aviationboundary_verticalaccuracy,
    geometry_elevatedsurface_view_enpdpi.horizontalAccuracy AS aviationboundary_horizontalaccuracy,
    lat_contaminant.lat_contaminant as contaminant,
    lat_servedcity.lat_servedcity as servedcity,
    lat_altimetersource.lat_altimetersource as altimetersource,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.airportheliport 
inner join master_join mj2 on airport_heliport.airportheliport.id = mj2.source_id
inner join airport_heliport.airportheliport_tsp on mj2.target_id = airport_heliport.airportheliport_tsp.id
inner join airport_heliport.airportheliport_ts on airport_heliport.airportheliport_tsp.airportheliporttimeslice_id = airport_heliport.airportheliport_ts.id
left join airport_heliport.airportheliportresponsibilityorganisation_view airport_heliport_airportheliportresponsibilityorganisation_view_vgszly on airport_heliport.airportheliport_ts.responsibleorganisation_id = airport_heliport_airportheliportresponsibilityorganisation_view_vgszly.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_gpugcu on airport_heliport.airportheliport_ts.arp_id = geometry_elevatedpoint_view_gpugcu.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_enpdpi on airport_heliport.airportheliport_ts.aviationboundary_id = geometry_elevatedsurface_view_enpdpi.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_airportheliportcontamination_view_vytksm.*) as lat_contaminant
  from master_join master_join_znwgnk
  join airport_heliport.airportheliportcontamination_view airport_heliport_airportheliportcontamination_view_vytksm on master_join_znwgnk.target_id = airport_heliport_airportheliportcontamination_view_vytksm.id
  where master_join_znwgnk.source_id = airport_heliport.airportheliport_ts.id
) as lat_contaminant on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_city_view_vsgumv.*) as lat_servedcity
  from master_join master_join_hczvaq
  join airport_heliport.city_view airport_heliport_city_view_vsgumv on master_join_hczvaq.target_id = airport_heliport_city_view_vsgumv.id
  where master_join_hczvaq.source_id = airport_heliport.airportheliport_ts.id
) as lat_servedcity on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_altimetersource_pt_oszvrt.id,
      'title', coalesce(cast(airport_heliport_altimetersource_pt_oszvrt.title AS varchar), '(' || airport_heliport_altimetersource_pt_oszvrt.nilreason[1] || ')'),
      'href', airport_heliport_altimetersource_pt_oszvrt.href
  )) as lat_altimetersource  from master_join master_join_sigyoe
  join airport_heliport.altimetersource_pt airport_heliport_altimetersource_pt_oszvrt on master_join_sigyoe.target_id = airport_heliport_altimetersource_pt_oszvrt.id
  where master_join_sigyoe.source_id = airport_heliport.airportheliport_ts.id
) as lat_altimetersource on TRUE
left join lateral(
  select
  from master_join master_join_hvbzcq
  join shared.contactinformation_view shared_contactinformation_view_wdxgaq on master_join_hvbzcq.target_id = shared_contactinformation_view_wdxgaq.id
  where master_join_hvbzcq.source_id = airport_heliport.airportheliport_ts.id
) as lat_contact on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_airportheliportavailability_view_pkcget.*) as lat_availability
  from master_join master_join_awxytb
  join airport_heliport.airportheliportavailability_view airport_heliport_airportheliportavailability_view_pkcget on master_join_awxytb.target_id = airport_heliport_airportheliportavailability_view_pkcget.id
  where master_join_awxytb.source_id = airport_heliport.airportheliport_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_zchlgn.*) AS annotation
  from master_join master_join_fnypsp
  join notes.note_view notes_note_view_zchlgn on master_join_fnypsp.target_id = notes_note_view_zchlgn.id
  where master_join_fnypsp.source_id = airport_heliport.airportheliport_ts.id
) as lat_annotation on TRUE
where airport_heliport.airportheliport.feature_status = 'APPROVED'
  and airport_heliport.airportheliport_ts.feature_status = 'APPROVED'
order by airportheliport.identifier, airportheliport_ts.sequence_number, airportheliport_ts.correction_number DESC;
create index on airport_heliport.airportheliport_view (id);
-- AirportHotSpotTimeSliceType
-- ['geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.airporthotspot_view cascade;
create materialized view airport_heliport.airporthotspot_view as
select distinct on (airporthotspot.identifier,airporthotspot_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.airporthotspot.id,
    airport_heliport.airporthotspot_ts.id as ts_id,
    airport_heliport.airporthotspot_tsp.id as tsp_id,
    airport_heliport.airporthotspot.identifier,
    airport_heliport.airporthotspot_ts.interpretation,
    airport_heliport.airporthotspot_ts.sequence_number,
    airport_heliport.airporthotspot_ts.correction_number,
    airport_heliport.airporthotspot_ts.valid_time_begin,
    airport_heliport.airporthotspot_ts.valid_time_end,
    airport_heliport.airporthotspot_ts.feature_lifetime_begin,
    airport_heliport.airporthotspot_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.airporthotspot_ts.designator_value as varchar), '(' || airport_heliport.airporthotspot_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.airporthotspot_ts.instruction_value as varchar), '(' || airport_heliport.airporthotspot_ts.instruction_nilreason || ')') as instruction,
    geometry_elevatedsurface_view_eowmoe.geom AS area_geom,
    geometry_elevatedsurface_view_eowmoe.elevation AS area_elevation,
    geometry_elevatedsurface_view_eowmoe.geoidUndulation AS area_geoidundulation,
    geometry_elevatedsurface_view_eowmoe.verticalDatum AS area_verticaldatum,
    geometry_elevatedsurface_view_eowmoe.verticalAccuracy AS area_verticalaccuracy,
    geometry_elevatedsurface_view_eowmoe.horizontalAccuracy AS area_horizontalaccuracy,
    coalesce(cast(airport_heliport_airportheliport_pt_vyrgex.title as varchar), '(' || airport_heliport_airportheliport_pt_vyrgex.nilreason[1] || ')') AS affectedairport,
    airport_heliport_airportheliport_pt_vyrgex.href AS affectedairport_href,
    lat_annotation.annotation as annotation
from airport_heliport.airporthotspot 
inner join master_join mj2 on airport_heliport.airporthotspot.id = mj2.source_id
inner join airport_heliport.airporthotspot_tsp on mj2.target_id = airport_heliport.airporthotspot_tsp.id
inner join airport_heliport.airporthotspot_ts on airport_heliport.airporthotspot_tsp.airporthotspottimeslice_id = airport_heliport.airporthotspot_ts.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_eowmoe on airport_heliport.airporthotspot_ts.area_id = geometry_elevatedsurface_view_eowmoe.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_vyrgex on airport_heliport.airporthotspot_ts.affectedairport_id = airport_heliport_airportheliport_pt_vyrgex.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_oievjn.*) AS annotation
  from master_join master_join_elpmlj
  join notes.note_view notes_note_view_oievjn on master_join_elpmlj.target_id = notes_note_view_oievjn.id
  where master_join_elpmlj.source_id = airport_heliport.airporthotspot_ts.id
) as lat_annotation on TRUE
where airport_heliport.airporthotspot.feature_status = 'APPROVED'
  and airport_heliport.airporthotspot_ts.feature_status = 'APPROVED'
order by airporthotspot.identifier, airporthotspot_ts.sequence_number, airporthotspot_ts.correction_number DESC;
create index on airport_heliport.airporthotspot_view (id);
-- AirportProtectionAreaMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.airportprotectionareamarking_view cascade;
create materialized view airport_heliport.airportprotectionareamarking_view as
select distinct on (airportprotectionareamarking.identifier,airportprotectionareamarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.airportprotectionareamarking.id,
    airport_heliport.airportprotectionareamarking_ts.id as ts_id,
    airport_heliport.airportprotectionareamarking_tsp.id as tsp_id,
    airport_heliport.airportprotectionareamarking.identifier,
    airport_heliport.airportprotectionareamarking_ts.interpretation,
    airport_heliport.airportprotectionareamarking_ts.sequence_number,
    airport_heliport.airportprotectionareamarking_ts.correction_number,
    airport_heliport.airportprotectionareamarking_ts.valid_time_begin,
    airport_heliport.airportprotectionareamarking_ts.valid_time_end,
    airport_heliport.airportprotectionareamarking_ts.feature_lifetime_begin,
    airport_heliport.airportprotectionareamarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.airportprotectionareamarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.airportprotectionareamarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.airportprotectionareamarking_ts.condition_value as varchar), '(' || airport_heliport.airportprotectionareamarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.airportprotectionareamarking_ts.markinglocation_value as varchar), '(' || airport_heliport.airportprotectionareamarking_ts.markinglocation_nilreason || ')') as markinglocation,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.airportprotectionareamarking 
inner join master_join mj2 on airport_heliport.airportprotectionareamarking.id = mj2.source_id
inner join airport_heliport.airportprotectionareamarking_tsp on mj2.target_id = airport_heliport.airportprotectionareamarking_tsp.id
inner join airport_heliport.airportprotectionareamarking_ts on airport_heliport.airportprotectionareamarking_tsp.airportprotectionareamarkingtimeslice_id = airport_heliport.airportprotectionareamarking_ts.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_dekdlx.*) as lat_element
  from master_join master_join_xjhlbi
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_dekdlx on master_join_xjhlbi.target_id = airport_heliport_markingelement_view_dekdlx.id
  where master_join_xjhlbi.source_id = airport_heliport.airportprotectionareamarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_opayfk.*) AS annotation
  from master_join master_join_xamcco
  join notes.note_view notes_note_view_opayfk on master_join_xamcco.target_id = notes_note_view_opayfk.id
  where master_join_xamcco.source_id = airport_heliport.airportprotectionareamarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.airportprotectionareamarking.feature_status = 'APPROVED'
  and airport_heliport.airportprotectionareamarking_ts.feature_status = 'APPROVED'
order by airportprotectionareamarking.identifier, airportprotectionareamarking_ts.sequence_number, airportprotectionareamarking_ts.correction_number DESC;
create index on airport_heliport.airportprotectionareamarking_view (id);
-- AirportSuppliesServiceTimeSliceType
-- ['service.oil_view', 'service.oxygen_view', 'geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.nitrogen_view', 'service.fuel_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.airportsuppliesservice_view cascade;
create materialized view service.airportsuppliesservice_view as
select distinct on (airportsuppliesservice.identifier,airportsuppliesservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.airportsuppliesservice.id,
    service.airportsuppliesservice_ts.id as ts_id,
    service.airportsuppliesservice_tsp.id as tsp_id,
    service.airportsuppliesservice.identifier,
    service.airportsuppliesservice_ts.interpretation,
    service.airportsuppliesservice_ts.sequence_number,
    service.airportsuppliesservice_ts.correction_number,
    service.airportsuppliesservice_ts.valid_time_begin,
    service.airportsuppliesservice_ts.valid_time_end,
    service.airportsuppliesservice_ts.feature_lifetime_begin,
    service.airportsuppliesservice_ts.feature_lifetime_end,
    coalesce(cast(service.airportsuppliesservice_ts.flightoperations_value as varchar), '(' || service.airportsuppliesservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airportsuppliesservice_ts.rank_value as varchar), '(' || service.airportsuppliesservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airportsuppliesservice_ts.complianticao_value as varchar), '(' || service.airportsuppliesservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airportsuppliesservice_ts.name_value as varchar), '(' || service.airportsuppliesservice_ts.name_nilreason || ')') as name,
    geometry_elevatedpoint_view_mmdzgm.geom AS location_geom,
    geometry_elevatedpoint_view_mmdzgm.longitude AS location_longitude,
    geometry_elevatedpoint_view_mmdzgm.latitude AS location_latitude,
    geometry_elevatedpoint_view_mmdzgm.elevation AS location_elevation,
    geometry_elevatedpoint_view_mmdzgm.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_mmdzgm.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_mmdzgm.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_mmdzgm.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_sawdep.title as varchar), '(' || organisation_unit_pt_sawdep.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_sawdep.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_airportheliport.lat_airportheliport as airportheliport,
    lat_fuelsupply.lat_fuelsupply as fuelsupply,
    lat_oilsupply.lat_oilsupply as oilsupply,
    lat_nitrogensupply.lat_nitrogensupply as nitrogensupply,
    lat_oxygensupply.lat_oxygensupply as oxygensupply
from service.airportsuppliesservice 
inner join master_join mj2 on service.airportsuppliesservice.id = mj2.source_id
inner join service.airportsuppliesservice_tsp on mj2.target_id = service.airportsuppliesservice_tsp.id
inner join service.airportsuppliesservice_ts on service.airportsuppliesservice_tsp.airportsuppliesservicetimeslice_id = service.airportsuppliesservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_mmdzgm on service.airportsuppliesservice_ts.location_id = geometry_elevatedpoint_view_mmdzgm.id
left join organisation.unit_pt organisation_unit_pt_sawdep on service.airportsuppliesservice_ts.serviceprovider_id = organisation_unit_pt_sawdep.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_adezce.*) as lat_callsign
  from master_join master_join_kegudb
  join service.callsigndetail_view service_callsigndetail_view_adezce on master_join_kegudb.target_id = service_callsigndetail_view_adezce.id
  where master_join_kegudb.source_id = service.airportsuppliesservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_nnwvwf.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_nnwvwf.title AS varchar), '(' || service_radiocommunicationchannel_pt_nnwvwf.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_nnwvwf.href
  )) as lat_radiocommunication  from master_join master_join_prjavr
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_nnwvwf on master_join_prjavr.target_id = service_radiocommunicationchannel_pt_nnwvwf.id
  where master_join_prjavr.source_id = service.airportsuppliesservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_gvfohw
  join shared.contactinformation_view shared_contactinformation_view_ozdoim on master_join_gvfohw.target_id = shared_contactinformation_view_ozdoim.id
  where master_join_gvfohw.source_id = service.airportsuppliesservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_jhnetz.*) as lat_availability
  from master_join master_join_bexkia
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_jhnetz on master_join_bexkia.target_id = service_serviceoperationalstatus_view_jhnetz.id
  where master_join_bexkia.source_id = service.airportsuppliesservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_oyjecm.*) AS annotation
  from master_join master_join_kwmbca
  join notes.note_view notes_note_view_oyjecm on master_join_kwmbca.target_id = notes_note_view_oyjecm.id
  where master_join_kwmbca.source_id = service.airportsuppliesservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_nxyxyx.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_nxyxyx.title AS varchar), '(' || airport_heliport_airportheliport_pt_nxyxyx.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_nxyxyx.href
  )) as lat_airportheliport  from master_join master_join_smucip
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_nxyxyx on master_join_smucip.target_id = airport_heliport_airportheliport_pt_nxyxyx.id
  where master_join_smucip.source_id = service.airportsuppliesservice_ts.id
) as lat_airportheliport on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_fuel_view_ghlqcs.*) as lat_fuelsupply
  from master_join master_join_fsqgha
  join service.fuel_view service_fuel_view_ghlqcs on master_join_fsqgha.target_id = service_fuel_view_ghlqcs.id
  where master_join_fsqgha.source_id = service.airportsuppliesservice_ts.id
) as lat_fuelsupply on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_oil_view_rcpmps.*) as lat_oilsupply
  from master_join master_join_stuqxx
  join service.oil_view service_oil_view_rcpmps on master_join_stuqxx.target_id = service_oil_view_rcpmps.id
  where master_join_stuqxx.source_id = service.airportsuppliesservice_ts.id
) as lat_oilsupply on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_nitrogen_view_nkswoj.*) as lat_nitrogensupply
  from master_join master_join_erqbba
  join service.nitrogen_view service_nitrogen_view_nkswoj on master_join_erqbba.target_id = service_nitrogen_view_nkswoj.id
  where master_join_erqbba.source_id = service.airportsuppliesservice_ts.id
) as lat_nitrogensupply on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_oxygen_view_tsklzd.*) as lat_oxygensupply
  from master_join master_join_znncah
  join service.oxygen_view service_oxygen_view_tsklzd on master_join_znncah.target_id = service_oxygen_view_tsklzd.id
  where master_join_znncah.source_id = service.airportsuppliesservice_ts.id
) as lat_oxygensupply on TRUE
where service.airportsuppliesservice.feature_status = 'APPROVED'
  and service.airportsuppliesservice_ts.feature_status = 'APPROVED'
order by airportsuppliesservice.identifier, airportsuppliesservice_ts.sequence_number, airportsuppliesservice_ts.correction_number DESC;
create index on service.airportsuppliesservice_view (id);
-- AirspaceBorderCrossingTimeSliceType
-- ['notes.note_view']
drop materialized view if exists routes.airspacebordercrossing_view cascade;
create materialized view routes.airspacebordercrossing_view as
select distinct on (airspacebordercrossing.identifier,airspacebordercrossing_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    routes.airspacebordercrossing.id,
    routes.airspacebordercrossing_ts.id as ts_id,
    routes.airspacebordercrossing_tsp.id as tsp_id,
    routes.airspacebordercrossing.identifier,
    routes.airspacebordercrossing_ts.interpretation,
    routes.airspacebordercrossing_ts.sequence_number,
    routes.airspacebordercrossing_ts.correction_number,
    routes.airspacebordercrossing_ts.valid_time_begin,
    routes.airspacebordercrossing_ts.valid_time_end,
    routes.airspacebordercrossing_ts.feature_lifetime_begin,
    routes.airspacebordercrossing_ts.feature_lifetime_end,
    coalesce(cast(airspace_airspace_pt_vgmtgs.title as varchar), '(' || airspace_airspace_pt_vgmtgs.nilreason[1] || ')') AS exitedairspace,
    airspace_airspace_pt_vgmtgs.href AS exitedairspace_href,
    coalesce(cast(airspace_airspace_pt_thhtap.title as varchar), '(' || airspace_airspace_pt_thhtap.nilreason[1] || ')') AS enteredairspace,
    airspace_airspace_pt_thhtap.href AS enteredairspace_href,
    lat_annotation.annotation as annotation
from routes.airspacebordercrossing 
inner join master_join mj2 on routes.airspacebordercrossing.id = mj2.source_id
inner join routes.airspacebordercrossing_tsp on mj2.target_id = routes.airspacebordercrossing_tsp.id
inner join routes.airspacebordercrossing_ts on routes.airspacebordercrossing_tsp.airspacebordercrossingtimeslice_id = routes.airspacebordercrossing_ts.id
left join airspace.airspace_pt airspace_airspace_pt_vgmtgs on routes.airspacebordercrossing_ts.exitedairspace_id = airspace_airspace_pt_vgmtgs.id
left join airspace.airspace_pt airspace_airspace_pt_thhtap on routes.airspacebordercrossing_ts.enteredairspace_id = airspace_airspace_pt_thhtap.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wswdkh.*) AS annotation
  from master_join master_join_fzqgxz
  join notes.note_view notes_note_view_wswdkh on master_join_fzqgxz.target_id = notes_note_view_wswdkh.id
  where master_join_fzqgxz.source_id = routes.airspacebordercrossing_ts.id
) as lat_annotation on TRUE
where routes.airspacebordercrossing.feature_status = 'APPROVED'
  and routes.airspacebordercrossing_ts.feature_status = 'APPROVED'
order by airspacebordercrossing.identifier, airspacebordercrossing_ts.sequence_number, airspacebordercrossing_ts.correction_number DESC;
create index on routes.airspacebordercrossing_view (id);
-- AirspaceTimeSliceType
-- ['airspace.airspaceactivation_view', 'airspace.airspacegeometrycomponent_view', 'notes.note_view', 'airspace.airspacelayerclass_view']
drop materialized view if exists airspace.airspace_view cascade;
create materialized view airspace.airspace_view as
select distinct on (airspace.identifier,airspace_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airspace.airspace.id,
    airspace.airspace_ts.id as ts_id,
    airspace.airspace_tsp.id as tsp_id,
    airspace.airspace.identifier,
    airspace.airspace_ts.interpretation,
    airspace.airspace_ts.sequence_number,
    airspace.airspace_ts.correction_number,
    airspace.airspace_ts.valid_time_begin,
    airspace.airspace_ts.valid_time_end,
    airspace.airspace_ts.feature_lifetime_begin,
    airspace.airspace_ts.feature_lifetime_end,
    coalesce(cast(airspace.airspace_ts.type_value as varchar), '(' || airspace.airspace_ts.type_nilreason || ')') as type,
    coalesce(cast(airspace.airspace_ts.designator_value as varchar), '(' || airspace.airspace_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airspace.airspace_ts.localtype_value as varchar), '(' || airspace.airspace_ts.localtype_nilreason || ')') as localtype,
    coalesce(cast(airspace.airspace_ts.name_value as varchar), '(' || airspace.airspace_ts.name_nilreason || ')') as name,
    coalesce(cast(airspace.airspace_ts.designatoricao_value as varchar), '(' || airspace.airspace_ts.designatoricao_nilreason || ')') as designatoricao,
    coalesce(cast(airspace.airspace_ts.controltype_value as varchar), '(' || airspace.airspace_ts.controltype_nilreason || ')') as controltype,
    coalesce(cast(airspace.airspace_ts.upperlowerseparation_value as varchar) || ' ' || airspace.airspace_ts.upperlowerseparation_uom, '(' || airspace.airspace_ts.upperlowerseparation_nilreason || ')') as upperlowerseparation,
    coalesce(cast(routes_route_pt_hkmdul.title as varchar), '(' || routes_route_pt_hkmdul.nilreason[1] || ')') AS protectedroute,
    routes_route_pt_hkmdul.href AS protectedroute_href,
    lat_clazz.lat_clazz as clazz,
    lat_geometrycomponent.lat_geometrycomponent as geometrycomponent,
    lat_activation.lat_activation as activation,
    lat_annotation.annotation as annotation
from airspace.airspace 
inner join master_join mj2 on airspace.airspace.id = mj2.source_id
inner join airspace.airspace_tsp on mj2.target_id = airspace.airspace_tsp.id
inner join airspace.airspace_ts on airspace.airspace_tsp.airspacetimeslice_id = airspace.airspace_ts.id
left join routes.route_pt routes_route_pt_hkmdul on airspace.airspace_ts.protectedroute_id = routes_route_pt_hkmdul.id
left join lateral(
  select jsonb_agg(DISTINCT airspace_airspacelayerclass_view_kxnzkc.*) as lat_clazz
  from master_join master_join_jjhqso
  join airspace.airspacelayerclass_view airspace_airspacelayerclass_view_kxnzkc on master_join_jjhqso.target_id = airspace_airspacelayerclass_view_kxnzkc.id
  where master_join_jjhqso.source_id = airspace.airspace_ts.id
) as lat_clazz on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airspace_airspacegeometrycomponent_view_uvljjx.*) as lat_geometrycomponent
  from master_join master_join_pwtjiv
  join airspace.airspacegeometrycomponent_view airspace_airspacegeometrycomponent_view_uvljjx on master_join_pwtjiv.target_id = airspace_airspacegeometrycomponent_view_uvljjx.id
  where master_join_pwtjiv.source_id = airspace.airspace_ts.id
) as lat_geometrycomponent on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airspace_airspaceactivation_view_byrkfu.*) as lat_activation
  from master_join master_join_svmyoy
  join airspace.airspaceactivation_view airspace_airspaceactivation_view_byrkfu on master_join_svmyoy.target_id = airspace_airspaceactivation_view_byrkfu.id
  where master_join_svmyoy.source_id = airspace.airspace_ts.id
) as lat_activation on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jvgatx.*) AS annotation
  from master_join master_join_hclzhc
  join notes.note_view notes_note_view_jvgatx on master_join_hclzhc.target_id = notes_note_view_jvgatx.id
  where master_join_hclzhc.source_id = airspace.airspace_ts.id
) as lat_annotation on TRUE
where airspace.airspace.feature_status = 'APPROVED'
  and airspace.airspace_ts.feature_status = 'APPROVED'
order by airspace.identifier, airspace_ts.sequence_number, airspace_ts.correction_number DESC;
create index on airspace.airspace_view (id);
-- AirTrafficControlServiceTimeSliceType
-- ['routes.routeportion_view', 'geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.airtrafficcontrolservice_view cascade;
create materialized view service.airtrafficcontrolservice_view as
select distinct on (airtrafficcontrolservice.identifier,airtrafficcontrolservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.airtrafficcontrolservice.id,
    service.airtrafficcontrolservice_ts.id as ts_id,
    service.airtrafficcontrolservice_tsp.id as tsp_id,
    service.airtrafficcontrolservice.identifier,
    service.airtrafficcontrolservice_ts.interpretation,
    service.airtrafficcontrolservice_ts.sequence_number,
    service.airtrafficcontrolservice_ts.correction_number,
    service.airtrafficcontrolservice_ts.valid_time_begin,
    service.airtrafficcontrolservice_ts.valid_time_end,
    service.airtrafficcontrolservice_ts.feature_lifetime_begin,
    service.airtrafficcontrolservice_ts.feature_lifetime_end,
    coalesce(cast(service.airtrafficcontrolservice_ts.flightoperations_value as varchar), '(' || service.airtrafficcontrolservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airtrafficcontrolservice_ts.rank_value as varchar), '(' || service.airtrafficcontrolservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airtrafficcontrolservice_ts.complianticao_value as varchar), '(' || service.airtrafficcontrolservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airtrafficcontrolservice_ts.name_value as varchar), '(' || service.airtrafficcontrolservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.airtrafficcontrolservice_ts.radarassisted_value as varchar), '(' || service.airtrafficcontrolservice_ts.radarassisted_nilreason || ')') as radarassisted,
    coalesce(cast(service.airtrafficcontrolservice_ts.datalinkenabled_value as varchar), '(' || service.airtrafficcontrolservice_ts.datalinkenabled_nilreason || ')') as datalinkenabled,
    coalesce(cast(service.airtrafficcontrolservice_ts.datalinkchannel_value as varchar), '(' || service.airtrafficcontrolservice_ts.datalinkchannel_nilreason || ')') as datalinkchannel,
    coalesce(cast(service.airtrafficcontrolservice_ts.type_value as varchar), '(' || service.airtrafficcontrolservice_ts.type_nilreason || ')') as type,
    geometry_elevatedpoint_view_onolwz.geom AS location_geom,
    geometry_elevatedpoint_view_onolwz.longitude AS location_longitude,
    geometry_elevatedpoint_view_onolwz.latitude AS location_latitude,
    geometry_elevatedpoint_view_onolwz.elevation AS location_elevation,
    geometry_elevatedpoint_view_onolwz.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_onolwz.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_onolwz.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_onolwz.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_fkiuqh.title as varchar), '(' || organisation_unit_pt_fkiuqh.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_fkiuqh.href AS serviceprovider_href,
    coalesce(cast(navaids_points_directionfinder_pt_dndmtb.title as varchar), '(' || navaids_points_directionfinder_pt_dndmtb.nilreason[1] || ')') AS aircraftlocator,
    navaids_points_directionfinder_pt_dndmtb.href AS aircraftlocator_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_clientairport.lat_clientairport as clientairport,
    lat_clientairspace.lat_clientairspace as clientairspace,
    lat_clientroute.lat_clientroute as clientroute,
    lat_clientholding.lat_clientholding as clientholding,
    lat_clientaerialrefuelling.lat_clientaerialrefuelling as clientaerialrefuelling
from service.airtrafficcontrolservice 
inner join master_join mj2 on service.airtrafficcontrolservice.id = mj2.source_id
inner join service.airtrafficcontrolservice_tsp on mj2.target_id = service.airtrafficcontrolservice_tsp.id
inner join service.airtrafficcontrolservice_ts on service.airtrafficcontrolservice_tsp.airtrafficcontrolservicetimeslice_id = service.airtrafficcontrolservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_onolwz on service.airtrafficcontrolservice_ts.location_id = geometry_elevatedpoint_view_onolwz.id
left join organisation.unit_pt organisation_unit_pt_fkiuqh on service.airtrafficcontrolservice_ts.serviceprovider_id = organisation_unit_pt_fkiuqh.id
left join navaids_points.directionfinder_pt navaids_points_directionfinder_pt_dndmtb on service.airtrafficcontrolservice_ts.aircraftlocator_id = navaids_points_directionfinder_pt_dndmtb.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_hgkian.*) as lat_callsign
  from master_join master_join_kvrlob
  join service.callsigndetail_view service_callsigndetail_view_hgkian on master_join_kvrlob.target_id = service_callsigndetail_view_hgkian.id
  where master_join_kvrlob.source_id = service.airtrafficcontrolservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_xtqqgc.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_xtqqgc.title AS varchar), '(' || service_radiocommunicationchannel_pt_xtqqgc.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_xtqqgc.href
  )) as lat_radiocommunication  from master_join master_join_xqjqlh
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_xtqqgc on master_join_xqjqlh.target_id = service_radiocommunicationchannel_pt_xtqqgc.id
  where master_join_xqjqlh.source_id = service.airtrafficcontrolservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_atsuwp
  join shared.contactinformation_view shared_contactinformation_view_hgaklj on master_join_atsuwp.target_id = shared_contactinformation_view_hgaklj.id
  where master_join_atsuwp.source_id = service.airtrafficcontrolservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_yhaurm.*) as lat_availability
  from master_join master_join_usrqgx
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_yhaurm on master_join_usrqgx.target_id = service_serviceoperationalstatus_view_yhaurm.id
  where master_join_usrqgx.source_id = service.airtrafficcontrolservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ehvove.*) AS annotation
  from master_join master_join_jnzhag
  join notes.note_view notes_note_view_ehvove on master_join_jnzhag.target_id = notes_note_view_ehvove.id
  where master_join_jnzhag.source_id = service.airtrafficcontrolservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_nyjtbn.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_nyjtbn.title AS varchar), '(' || airport_heliport_airportheliport_pt_nyjtbn.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_nyjtbn.href
  )) as lat_clientairport  from master_join master_join_jodimv
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_nyjtbn on master_join_jodimv.target_id = airport_heliport_airportheliport_pt_nyjtbn.id
  where master_join_jodimv.source_id = service.airtrafficcontrolservice_ts.id
) as lat_clientairport on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airspace_airspace_pt_tpitvd.id,
      'title', coalesce(cast(airspace_airspace_pt_tpitvd.title AS varchar), '(' || airspace_airspace_pt_tpitvd.nilreason[1] || ')'),
      'href', airspace_airspace_pt_tpitvd.href
  )) as lat_clientairspace  from master_join master_join_hbsfan
  join airspace.airspace_pt airspace_airspace_pt_tpitvd on master_join_hbsfan.target_id = airspace_airspace_pt_tpitvd.id
  where master_join_hbsfan.source_id = service.airtrafficcontrolservice_ts.id
) as lat_clientairspace on TRUE
left join lateral(
  select jsonb_agg(DISTINCT routes_routeportion_view_tfvhyx.*) as lat_clientroute
  from master_join master_join_skvsfo
  join routes.routeportion_view routes_routeportion_view_tfvhyx on master_join_skvsfo.target_id = routes_routeportion_view_tfvhyx.id
  where master_join_skvsfo.source_id = service.airtrafficcontrolservice_ts.id
) as lat_clientroute on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', holding_holdingpattern_pt_vnepjq.id,
      'title', coalesce(cast(holding_holdingpattern_pt_vnepjq.title AS varchar), '(' || holding_holdingpattern_pt_vnepjq.nilreason[1] || ')'),
      'href', holding_holdingpattern_pt_vnepjq.href
  )) as lat_clientholding  from master_join master_join_ecwfbw
  join holding.holdingpattern_pt holding_holdingpattern_pt_vnepjq on master_join_ecwfbw.target_id = holding_holdingpattern_pt_vnepjq.id
  where master_join_ecwfbw.source_id = service.airtrafficcontrolservice_ts.id
) as lat_clientholding on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', aerial_refuelling_aerialrefuelling_pt_oyemyo.id,
      'title', coalesce(cast(aerial_refuelling_aerialrefuelling_pt_oyemyo.title AS varchar), '(' || aerial_refuelling_aerialrefuelling_pt_oyemyo.nilreason[1] || ')'),
      'href', aerial_refuelling_aerialrefuelling_pt_oyemyo.href
  )) as lat_clientaerialrefuelling  from master_join master_join_gulovj
  join aerial_refuelling.aerialrefuelling_pt aerial_refuelling_aerialrefuelling_pt_oyemyo on master_join_gulovj.target_id = aerial_refuelling_aerialrefuelling_pt_oyemyo.id
  where master_join_gulovj.source_id = service.airtrafficcontrolservice_ts.id
) as lat_clientaerialrefuelling on TRUE
where service.airtrafficcontrolservice.feature_status = 'APPROVED'
  and service.airtrafficcontrolservice_ts.feature_status = 'APPROVED'
order by airtrafficcontrolservice.identifier, airtrafficcontrolservice_ts.sequence_number, airtrafficcontrolservice_ts.correction_number DESC;
create index on service.airtrafficcontrolservice_view (id);
-- AirTrafficManagementServiceTimeSliceType
-- ['routes.routeportion_view', 'geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.airtrafficmanagementservice_view cascade;
create materialized view service.airtrafficmanagementservice_view as
select distinct on (airtrafficmanagementservice.identifier,airtrafficmanagementservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.airtrafficmanagementservice.id,
    service.airtrafficmanagementservice_ts.id as ts_id,
    service.airtrafficmanagementservice_tsp.id as tsp_id,
    service.airtrafficmanagementservice.identifier,
    service.airtrafficmanagementservice_ts.interpretation,
    service.airtrafficmanagementservice_ts.sequence_number,
    service.airtrafficmanagementservice_ts.correction_number,
    service.airtrafficmanagementservice_ts.valid_time_begin,
    service.airtrafficmanagementservice_ts.valid_time_end,
    service.airtrafficmanagementservice_ts.feature_lifetime_begin,
    service.airtrafficmanagementservice_ts.feature_lifetime_end,
    coalesce(cast(service.airtrafficmanagementservice_ts.flightoperations_value as varchar), '(' || service.airtrafficmanagementservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airtrafficmanagementservice_ts.rank_value as varchar), '(' || service.airtrafficmanagementservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airtrafficmanagementservice_ts.complianticao_value as varchar), '(' || service.airtrafficmanagementservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airtrafficmanagementservice_ts.name_value as varchar), '(' || service.airtrafficmanagementservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.airtrafficmanagementservice_ts.type_value as varchar), '(' || service.airtrafficmanagementservice_ts.type_nilreason || ')') as type,
    geometry_elevatedpoint_view_iqgbnd.geom AS location_geom,
    geometry_elevatedpoint_view_iqgbnd.longitude AS location_longitude,
    geometry_elevatedpoint_view_iqgbnd.latitude AS location_latitude,
    geometry_elevatedpoint_view_iqgbnd.elevation AS location_elevation,
    geometry_elevatedpoint_view_iqgbnd.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_iqgbnd.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_iqgbnd.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_iqgbnd.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_cvbtgk.title as varchar), '(' || organisation_unit_pt_cvbtgk.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_cvbtgk.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_clientairspace.lat_clientairspace as clientairspace,
    lat_clientaerialrefuelling.lat_clientaerialrefuelling as clientaerialrefuelling,
    lat_clientroute.lat_clientroute as clientroute
from service.airtrafficmanagementservice 
inner join master_join mj2 on service.airtrafficmanagementservice.id = mj2.source_id
inner join service.airtrafficmanagementservice_tsp on mj2.target_id = service.airtrafficmanagementservice_tsp.id
inner join service.airtrafficmanagementservice_ts on service.airtrafficmanagementservice_tsp.airtrafficmanagementservicetimeslice_id = service.airtrafficmanagementservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_iqgbnd on service.airtrafficmanagementservice_ts.location_id = geometry_elevatedpoint_view_iqgbnd.id
left join organisation.unit_pt organisation_unit_pt_cvbtgk on service.airtrafficmanagementservice_ts.serviceprovider_id = organisation_unit_pt_cvbtgk.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_nznzsx.*) as lat_callsign
  from master_join master_join_zqwbtn
  join service.callsigndetail_view service_callsigndetail_view_nznzsx on master_join_zqwbtn.target_id = service_callsigndetail_view_nznzsx.id
  where master_join_zqwbtn.source_id = service.airtrafficmanagementservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_oncqrb.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_oncqrb.title AS varchar), '(' || service_radiocommunicationchannel_pt_oncqrb.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_oncqrb.href
  )) as lat_radiocommunication  from master_join master_join_eigsgh
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_oncqrb on master_join_eigsgh.target_id = service_radiocommunicationchannel_pt_oncqrb.id
  where master_join_eigsgh.source_id = service.airtrafficmanagementservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_ifthtv
  join shared.contactinformation_view shared_contactinformation_view_wdhyre on master_join_ifthtv.target_id = shared_contactinformation_view_wdhyre.id
  where master_join_ifthtv.source_id = service.airtrafficmanagementservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_flbosk.*) as lat_availability
  from master_join master_join_wxzgvp
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_flbosk on master_join_wxzgvp.target_id = service_serviceoperationalstatus_view_flbosk.id
  where master_join_wxzgvp.source_id = service.airtrafficmanagementservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wqgigf.*) AS annotation
  from master_join master_join_oryljd
  join notes.note_view notes_note_view_wqgigf on master_join_oryljd.target_id = notes_note_view_wqgigf.id
  where master_join_oryljd.source_id = service.airtrafficmanagementservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airspace_airspace_pt_uldwnd.id,
      'title', coalesce(cast(airspace_airspace_pt_uldwnd.title AS varchar), '(' || airspace_airspace_pt_uldwnd.nilreason[1] || ')'),
      'href', airspace_airspace_pt_uldwnd.href
  )) as lat_clientairspace  from master_join master_join_lwqhfb
  join airspace.airspace_pt airspace_airspace_pt_uldwnd on master_join_lwqhfb.target_id = airspace_airspace_pt_uldwnd.id
  where master_join_lwqhfb.source_id = service.airtrafficmanagementservice_ts.id
) as lat_clientairspace on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', aerial_refuelling_aerialrefuelling_pt_xmvukc.id,
      'title', coalesce(cast(aerial_refuelling_aerialrefuelling_pt_xmvukc.title AS varchar), '(' || aerial_refuelling_aerialrefuelling_pt_xmvukc.nilreason[1] || ')'),
      'href', aerial_refuelling_aerialrefuelling_pt_xmvukc.href
  )) as lat_clientaerialrefuelling  from master_join master_join_qswqwa
  join aerial_refuelling.aerialrefuelling_pt aerial_refuelling_aerialrefuelling_pt_xmvukc on master_join_qswqwa.target_id = aerial_refuelling_aerialrefuelling_pt_xmvukc.id
  where master_join_qswqwa.source_id = service.airtrafficmanagementservice_ts.id
) as lat_clientaerialrefuelling on TRUE
left join lateral(
  select jsonb_agg(DISTINCT routes_routeportion_view_ugvvob.*) as lat_clientroute
  from master_join master_join_uiicvy
  join routes.routeportion_view routes_routeportion_view_ugvvob on master_join_uiicvy.target_id = routes_routeportion_view_ugvvob.id
  where master_join_uiicvy.source_id = service.airtrafficmanagementservice_ts.id
) as lat_clientroute on TRUE
where service.airtrafficmanagementservice.feature_status = 'APPROVED'
  and service.airtrafficmanagementservice_ts.feature_status = 'APPROVED'
order by airtrafficmanagementservice.identifier, airtrafficmanagementservice_ts.sequence_number, airtrafficmanagementservice_ts.correction_number DESC;
create index on service.airtrafficmanagementservice_view (id);
-- AltimeterSourceTimeSliceType
-- ['airport_heliport.altimetersourcestatus_view', 'notes.note_view']
drop materialized view if exists airport_heliport.altimetersource_view cascade;
create materialized view airport_heliport.altimetersource_view as
select distinct on (altimetersource.identifier,altimetersource_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.altimetersource.id,
    airport_heliport.altimetersource_ts.id as ts_id,
    airport_heliport.altimetersource_tsp.id as tsp_id,
    airport_heliport.altimetersource.identifier,
    airport_heliport.altimetersource_ts.interpretation,
    airport_heliport.altimetersource_ts.sequence_number,
    airport_heliport.altimetersource_ts.correction_number,
    airport_heliport.altimetersource_ts.valid_time_begin,
    airport_heliport.altimetersource_ts.valid_time_end,
    airport_heliport.altimetersource_ts.feature_lifetime_begin,
    airport_heliport.altimetersource_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.altimetersource_ts.isremote_value as varchar), '(' || airport_heliport.altimetersource_ts.isremote_nilreason || ')') as isremote,
    coalesce(cast(airport_heliport.altimetersource_ts.isprimary_value as varchar), '(' || airport_heliport.altimetersource_ts.isprimary_nilreason || ')') as isprimary,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.altimetersource 
inner join master_join mj2 on airport_heliport.altimetersource.id = mj2.source_id
inner join airport_heliport.altimetersource_tsp on mj2.target_id = airport_heliport.altimetersource_tsp.id
inner join airport_heliport.altimetersource_ts on airport_heliport.altimetersource_tsp.altimetersourcetimeslice_id = airport_heliport.altimetersource_ts.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_altimetersourcestatus_view_uwnhlo.*) as lat_availability
  from master_join master_join_cgskkp
  join airport_heliport.altimetersourcestatus_view airport_heliport_altimetersourcestatus_view_uwnhlo on master_join_cgskkp.target_id = airport_heliport_altimetersourcestatus_view_uwnhlo.id
  where master_join_cgskkp.source_id = airport_heliport.altimetersource_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_dlivas.*) AS annotation
  from master_join master_join_vrklxc
  join notes.note_view notes_note_view_dlivas on master_join_vrklxc.target_id = notes_note_view_dlivas.id
  where master_join_vrklxc.source_id = airport_heliport.altimetersource_ts.id
) as lat_annotation on TRUE
where airport_heliport.altimetersource.feature_status = 'APPROVED'
  and airport_heliport.altimetersource_ts.feature_status = 'APPROVED'
order by altimetersource.identifier, altimetersource_ts.sequence_number, altimetersource_ts.correction_number DESC;
create index on airport_heliport.altimetersource_view (id);
-- AngleIndicationTimeSliceType
-- ['notes.note_view', 'geometry.point_view']
drop materialized view if exists navaids_points.angleindication_view cascade;
create materialized view navaids_points.angleindication_view as
select distinct on (angleindication.identifier,angleindication_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.angleindication.id,
    navaids_points.angleindication_ts.id as ts_id,
    navaids_points.angleindication_tsp.id as tsp_id,
    navaids_points.angleindication.identifier,
    navaids_points.angleindication_ts.interpretation,
    navaids_points.angleindication_ts.sequence_number,
    navaids_points.angleindication_ts.correction_number,
    navaids_points.angleindication_ts.valid_time_begin,
    navaids_points.angleindication_ts.valid_time_end,
    navaids_points.angleindication_ts.feature_lifetime_begin,
    navaids_points.angleindication_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.angleindication_ts.angle_value as varchar), '(' || navaids_points.angleindication_ts.angle_nilreason || ')') as angle,
    coalesce(cast(navaids_points.angleindication_ts.angletype_value as varchar), '(' || navaids_points.angleindication_ts.angletype_nilreason || ')') as angletype,
    coalesce(cast(navaids_points.angleindication_ts.indicationdirection_value as varchar), '(' || navaids_points.angleindication_ts.indicationdirection_nilreason || ')') as indicationdirection,
    coalesce(cast(navaids_points.angleindication_ts.trueangle_value as varchar), '(' || navaids_points.angleindication_ts.trueangle_nilreason || ')') as trueangle,
    coalesce(cast(navaids_points.angleindication_ts.cardinaldirection_value as varchar), '(' || navaids_points.angleindication_ts.cardinaldirection_nilreason || ')') as cardinaldirection,
    coalesce(cast(navaids_points.angleindication_ts.minimumreceptionaltitude_value as varchar) || ' ' || navaids_points.angleindication_ts.minimumreceptionaltitude_uom, '(' || navaids_points.angleindication_ts.minimumreceptionaltitude_nilreason || ')') as minimumreceptionaltitude,
    coalesce(cast(navaids_points_designatedpoint_pt_oimmam.title as varchar), '(' || navaids_points_designatedpoint_pt_oimmam.nilreason[1] || ')') AS fix,
    navaids_points_designatedpoint_pt_oimmam.href AS fix_href,
    coalesce(cast(navaids_points_designatedpoint_pt_qtetnc.title as varchar), '(' || navaids_points_designatedpoint_pt_qtetnc.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_pt_qtetnc.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_mvnrzl.title as varchar), '(' || navaids_points_navaid_pt_mvnrzl.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_pt_mvnrzl.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_cgizil.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_cgizil.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_pt_cgizil.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_zoygem.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_zoygem.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_zoygem.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_tvnsnb.title as varchar), '(' || airport_heliport_airportheliport_pt_tvnsnb.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_pt_tvnsnb.href AS pointchoiceairportreferencepoint_href,
    geometry_point_view_hledrf.geom AS pointchoiceposition_geom,
    geometry_point_view_hledrf.longitude AS pointchoiceposition_longitude,
    geometry_point_view_hledrf.latitude AS pointchoiceposition_latitude,
    geometry_point_view_hledrf.horizontalAccuracy AS pointchoiceposition_horizontalaccuracy,
    lat_annotation.annotation as annotation
from navaids_points.angleindication 
inner join master_join mj2 on navaids_points.angleindication.id = mj2.source_id
inner join navaids_points.angleindication_tsp on mj2.target_id = navaids_points.angleindication_tsp.id
inner join navaids_points.angleindication_ts on navaids_points.angleindication_tsp.angleindicationtimeslice_id = navaids_points.angleindication_ts.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_oimmam on navaids_points.angleindication_ts.fix_id = navaids_points_designatedpoint_pt_oimmam.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_qtetnc on navaids_points.angleindication_ts.angleindication_ts_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_qtetnc.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_mvnrzl on navaids_points.angleindication_ts.angleindication_ts_navaidsystem_id = navaids_points_navaid_pt_mvnrzl.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_cgizil on navaids_points.angleindication_ts.angleindication_ts_aimingpoint_id = airport_heliport_touchdownliftoff_pt_cgizil.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_zoygem on navaids_points.angleindication_ts.angleindication_ts_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_zoygem.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_tvnsnb on navaids_points.angleindication_ts.angleindication_ts_airportreferencepoint_id = airport_heliport_airportheliport_pt_tvnsnb.id
left join geometry.point_view geometry_point_view_hledrf on navaids_points.angleindication_ts.angleindication_ts_position_id = geometry_point_view_hledrf.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_zznjbq.*) AS annotation
  from master_join master_join_eomsjs
  join notes.note_view notes_note_view_zznjbq on master_join_eomsjs.target_id = notes_note_view_zznjbq.id
  where master_join_eomsjs.source_id = navaids_points.angleindication_ts.id
) as lat_annotation on TRUE
where navaids_points.angleindication.feature_status = 'APPROVED'
  and navaids_points.angleindication_ts.feature_status = 'APPROVED'
order by angleindication.identifier, angleindication_ts.sequence_number, angleindication_ts.correction_number DESC;
create index on navaids_points.angleindication_view (id);
-- ApproachLightingSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.approachlightingsystem_view cascade;
create materialized view airport_heliport.approachlightingsystem_view as
select distinct on (approachlightingsystem.identifier,approachlightingsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.approachlightingsystem.id,
    airport_heliport.approachlightingsystem_ts.id as ts_id,
    airport_heliport.approachlightingsystem_tsp.id as tsp_id,
    airport_heliport.approachlightingsystem.identifier,
    airport_heliport.approachlightingsystem_ts.interpretation,
    airport_heliport.approachlightingsystem_ts.sequence_number,
    airport_heliport.approachlightingsystem_ts.correction_number,
    airport_heliport.approachlightingsystem_ts.valid_time_begin,
    airport_heliport.approachlightingsystem_ts.valid_time_end,
    airport_heliport.approachlightingsystem_ts.feature_lifetime_begin,
    airport_heliport.approachlightingsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.colour_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.classicao_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.classicao_nilreason || ')') as classicao,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.type_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.sequencedflashing_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.sequencedflashing_nilreason || ')') as sequencedflashing,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.alignmentindicator_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.alignmentindicator_nilreason || ')') as alignmentindicator,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.length_value as varchar) || ' ' || airport_heliport.approachlightingsystem_ts.length_uom, '(' || airport_heliport.approachlightingsystem_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport_runwaydirection_pt_vvpsmt.title as varchar), '(' || airport_heliport_runwaydirection_pt_vvpsmt.nilreason[1] || ')') AS servedrunwaydirection,
    airport_heliport_runwaydirection_pt_vvpsmt.href AS servedrunwaydirection_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.approachlightingsystem 
inner join master_join mj2 on airport_heliport.approachlightingsystem.id = mj2.source_id
inner join airport_heliport.approachlightingsystem_tsp on mj2.target_id = airport_heliport.approachlightingsystem_tsp.id
inner join airport_heliport.approachlightingsystem_ts on airport_heliport.approachlightingsystem_tsp.approachlightingsystemtimeslice_id = airport_heliport.approachlightingsystem_ts.id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_vvpsmt on airport_heliport.approachlightingsystem_ts.servedrunwaydirection_id = airport_heliport_runwaydirection_pt_vvpsmt.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_pxbnww.*) as lat_element
  from master_join master_join_qncvjk
  join shared.lightelement_view shared_lightelement_view_pxbnww on master_join_qncvjk.target_id = shared_lightelement_view_pxbnww.id
  where master_join_qncvjk.source_id = airport_heliport.approachlightingsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_cgwkyf.*) as lat_availability
  from master_join master_join_oqqczz
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_cgwkyf on master_join_oqqczz.target_id = airport_heliport_groundlightingavailability_view_cgwkyf.id
  where master_join_oqqczz.source_id = airport_heliport.approachlightingsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hmhjmc.*) AS annotation
  from master_join master_join_gvjmbk
  join notes.note_view notes_note_view_hmhjmc on master_join_gvjmbk.target_id = notes_note_view_hmhjmc.id
  where master_join_gvjmbk.source_id = airport_heliport.approachlightingsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.approachlightingsystem.feature_status = 'APPROVED'
  and airport_heliport.approachlightingsystem_ts.feature_status = 'APPROVED'
order by approachlightingsystem.identifier, approachlightingsystem_ts.sequence_number, approachlightingsystem_ts.correction_number DESC;
create index on airport_heliport.approachlightingsystem_view (id);
-- ApronElementTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'airport_heliport.apronareaavailability_view', 'geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.apronelement_view cascade;
create materialized view airport_heliport.apronelement_view as
select distinct on (apronelement.identifier,apronelement_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.apronelement.id,
    airport_heliport.apronelement_ts.id as ts_id,
    airport_heliport.apronelement_tsp.id as tsp_id,
    airport_heliport.apronelement.identifier,
    airport_heliport.apronelement_ts.interpretation,
    airport_heliport.apronelement_ts.sequence_number,
    airport_heliport.apronelement_ts.correction_number,
    airport_heliport.apronelement_ts.valid_time_begin,
    airport_heliport.apronelement_ts.valid_time_end,
    airport_heliport.apronelement_ts.feature_lifetime_begin,
    airport_heliport.apronelement_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.apronelement_ts.type_value as varchar), '(' || airport_heliport.apronelement_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.apronelement_ts.jetwayavailability_value as varchar), '(' || airport_heliport.apronelement_ts.jetwayavailability_nilreason || ')') as jetwayavailability,
    coalesce(cast(airport_heliport.apronelement_ts.towingavailability_value as varchar), '(' || airport_heliport.apronelement_ts.towingavailability_nilreason || ')') as towingavailability,
    coalesce(cast(airport_heliport.apronelement_ts.dockingavailability_value as varchar), '(' || airport_heliport.apronelement_ts.dockingavailability_nilreason || ')') as dockingavailability,
    coalesce(cast(airport_heliport.apronelement_ts.groundpoweravailability_value as varchar), '(' || airport_heliport.apronelement_ts.groundpoweravailability_nilreason || ')') as groundpoweravailability,
    coalesce(cast(airport_heliport.apronelement_ts.length_value as varchar) || ' ' || airport_heliport.apronelement_ts.length_uom, '(' || airport_heliport.apronelement_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.apronelement_ts.width_value as varchar) || ' ' || airport_heliport.apronelement_ts.width_uom, '(' || airport_heliport.apronelement_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport_apron_pt_wgdkyh.title as varchar), '(' || airport_heliport_apron_pt_wgdkyh.nilreason[1] || ')') AS associatedapron,
    airport_heliport_apron_pt_wgdkyh.href AS associatedapron_href,
    to_jsonb(airport_heliport_surfacecharacteristics_view_kpnbbc.*) AS surfaceproperties,
    geometry_elevatedsurface_view_hietkr.geom AS extent_geom,
    geometry_elevatedsurface_view_hietkr.elevation AS extent_elevation,
    geometry_elevatedsurface_view_hietkr.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_hietkr.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_hietkr.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_hietkr.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_supplyservice.lat_supplyservice as supplyservice,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.apronelement 
inner join master_join mj2 on airport_heliport.apronelement.id = mj2.source_id
inner join airport_heliport.apronelement_tsp on mj2.target_id = airport_heliport.apronelement_tsp.id
inner join airport_heliport.apronelement_ts on airport_heliport.apronelement_tsp.apronelementtimeslice_id = airport_heliport.apronelement_ts.id
left join airport_heliport.apron_pt airport_heliport_apron_pt_wgdkyh on airport_heliport.apronelement_ts.associatedapron_id = airport_heliport_apron_pt_wgdkyh.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_kpnbbc on airport_heliport.apronelement_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_kpnbbc.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_hietkr on airport_heliport.apronelement_ts.extent_id = geometry_elevatedsurface_view_hietkr.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_airportsuppliesservice_pt_ysghco.id,
      'title', coalesce(cast(service_airportsuppliesservice_pt_ysghco.title AS varchar), '(' || service_airportsuppliesservice_pt_ysghco.nilreason[1] || ')'),
      'href', service_airportsuppliesservice_pt_ysghco.href
  )) as lat_supplyservice  from master_join master_join_cjgehm
  join service.airportsuppliesservice_pt service_airportsuppliesservice_pt_ysghco on master_join_cjgehm.target_id = service_airportsuppliesservice_pt_ysghco.id
  where master_join_cjgehm.source_id = airport_heliport.apronelement_ts.id
) as lat_supplyservice on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_dylmcj.*) AS annotation
  from master_join master_join_fuhgcv
  join notes.note_view notes_note_view_dylmcj on master_join_fuhgcv.target_id = notes_note_view_dylmcj.id
  where master_join_fuhgcv.source_id = airport_heliport.apronelement_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_apronareaavailability_view_ggdfit.*) as lat_availability
  from master_join master_join_bpljli
  join airport_heliport.apronareaavailability_view airport_heliport_apronareaavailability_view_ggdfit on master_join_bpljli.target_id = airport_heliport_apronareaavailability_view_ggdfit.id
  where master_join_bpljli.source_id = airport_heliport.apronelement_ts.id
) as lat_availability on TRUE
where airport_heliport.apronelement.feature_status = 'APPROVED'
  and airport_heliport.apronelement_ts.feature_status = 'APPROVED'
order by apronelement.identifier, apronelement_ts.sequence_number, apronelement_ts.correction_number DESC;
create index on airport_heliport.apronelement_view (id);
-- ApronLightSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.apronlightsystem_view cascade;
create materialized view airport_heliport.apronlightsystem_view as
select distinct on (apronlightsystem.identifier,apronlightsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.apronlightsystem.id,
    airport_heliport.apronlightsystem_ts.id as ts_id,
    airport_heliport.apronlightsystem_tsp.id as tsp_id,
    airport_heliport.apronlightsystem.identifier,
    airport_heliport.apronlightsystem_ts.interpretation,
    airport_heliport.apronlightsystem_ts.sequence_number,
    airport_heliport.apronlightsystem_ts.correction_number,
    airport_heliport.apronlightsystem_ts.valid_time_begin,
    airport_heliport.apronlightsystem_ts.valid_time_end,
    airport_heliport.apronlightsystem_ts.feature_lifetime_begin,
    airport_heliport.apronlightsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.apronlightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.apronlightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.apronlightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.apronlightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.apronlightsystem_ts.colour_value as varchar), '(' || airport_heliport.apronlightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.apronlightsystem_ts.position_value as varchar), '(' || airport_heliport.apronlightsystem_ts.position_nilreason || ')') as position,
    coalesce(cast(airport_heliport_apron_pt_dwhufo.title as varchar), '(' || airport_heliport_apron_pt_dwhufo.nilreason[1] || ')') AS lightedapron,
    airport_heliport_apron_pt_dwhufo.href AS lightedapron_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.apronlightsystem 
inner join master_join mj2 on airport_heliport.apronlightsystem.id = mj2.source_id
inner join airport_heliport.apronlightsystem_tsp on mj2.target_id = airport_heliport.apronlightsystem_tsp.id
inner join airport_heliport.apronlightsystem_ts on airport_heliport.apronlightsystem_tsp.apronlightsystemtimeslice_id = airport_heliport.apronlightsystem_ts.id
left join airport_heliport.apron_pt airport_heliport_apron_pt_dwhufo on airport_heliport.apronlightsystem_ts.lightedapron_id = airport_heliport_apron_pt_dwhufo.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_rrncbx.*) as lat_element
  from master_join master_join_ykzvfk
  join shared.lightelement_view shared_lightelement_view_rrncbx on master_join_ykzvfk.target_id = shared_lightelement_view_rrncbx.id
  where master_join_ykzvfk.source_id = airport_heliport.apronlightsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_sxzodn.*) as lat_availability
  from master_join master_join_jusuyf
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_sxzodn on master_join_jusuyf.target_id = airport_heliport_groundlightingavailability_view_sxzodn.id
  where master_join_jusuyf.source_id = airport_heliport.apronlightsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hoyehl.*) AS annotation
  from master_join master_join_smanem
  join notes.note_view notes_note_view_hoyehl on master_join_smanem.target_id = notes_note_view_hoyehl.id
  where master_join_smanem.source_id = airport_heliport.apronlightsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.apronlightsystem.feature_status = 'APPROVED'
  and airport_heliport.apronlightsystem_ts.feature_status = 'APPROVED'
order by apronlightsystem.identifier, apronlightsystem_ts.sequence_number, apronlightsystem_ts.correction_number DESC;
create index on airport_heliport.apronlightsystem_view (id);
-- ApronMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.apronmarking_view cascade;
create materialized view airport_heliport.apronmarking_view as
select distinct on (apronmarking.identifier,apronmarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.apronmarking.id,
    airport_heliport.apronmarking_ts.id as ts_id,
    airport_heliport.apronmarking_tsp.id as tsp_id,
    airport_heliport.apronmarking.identifier,
    airport_heliport.apronmarking_ts.interpretation,
    airport_heliport.apronmarking_ts.sequence_number,
    airport_heliport.apronmarking_ts.correction_number,
    airport_heliport.apronmarking_ts.valid_time_begin,
    airport_heliport.apronmarking_ts.valid_time_end,
    airport_heliport.apronmarking_ts.feature_lifetime_begin,
    airport_heliport.apronmarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.apronmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.apronmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.apronmarking_ts.condition_value as varchar), '(' || airport_heliport.apronmarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.apronmarking_ts.markinglocation_value as varchar), '(' || airport_heliport.apronmarking_ts.markinglocation_nilreason || ')') as markinglocation,
    coalesce(cast(airport_heliport_apron_pt_mkbbyw.title as varchar), '(' || airport_heliport_apron_pt_mkbbyw.nilreason[1] || ')') AS markedapron,
    airport_heliport_apron_pt_mkbbyw.href AS markedapron_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.apronmarking 
inner join master_join mj2 on airport_heliport.apronmarking.id = mj2.source_id
inner join airport_heliport.apronmarking_tsp on mj2.target_id = airport_heliport.apronmarking_tsp.id
inner join airport_heliport.apronmarking_ts on airport_heliport.apronmarking_tsp.apronmarkingtimeslice_id = airport_heliport.apronmarking_ts.id
left join airport_heliport.apron_pt airport_heliport_apron_pt_mkbbyw on airport_heliport.apronmarking_ts.markedapron_id = airport_heliport_apron_pt_mkbbyw.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_dhpalj.*) as lat_element
  from master_join master_join_yistlf
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_dhpalj on master_join_yistlf.target_id = airport_heliport_markingelement_view_dhpalj.id
  where master_join_yistlf.source_id = airport_heliport.apronmarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_fhxros.*) AS annotation
  from master_join master_join_hrmzfn
  join notes.note_view notes_note_view_fhxros on master_join_hrmzfn.target_id = notes_note_view_fhxros.id
  where master_join_hrmzfn.source_id = airport_heliport.apronmarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.apronmarking.feature_status = 'APPROVED'
  and airport_heliport.apronmarking_ts.feature_status = 'APPROVED'
order by apronmarking.identifier, apronmarking_ts.sequence_number, apronmarking_ts.correction_number DESC;
create index on airport_heliport.apronmarking_view (id);
-- ApronTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'airport_heliport.apronareaavailability_view', 'notes.note_view', 'airport_heliport.aproncontamination_view']
drop materialized view if exists airport_heliport.apron_view cascade;
create materialized view airport_heliport.apron_view as
select distinct on (apron.identifier,apron_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.apron.id,
    airport_heliport.apron_ts.id as ts_id,
    airport_heliport.apron_tsp.id as tsp_id,
    airport_heliport.apron.identifier,
    airport_heliport.apron_ts.interpretation,
    airport_heliport.apron_ts.sequence_number,
    airport_heliport.apron_ts.correction_number,
    airport_heliport.apron_ts.valid_time_begin,
    airport_heliport.apron_ts.valid_time_end,
    airport_heliport.apron_ts.feature_lifetime_begin,
    airport_heliport.apron_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.apron_ts.name_value as varchar), '(' || airport_heliport.apron_ts.name_nilreason || ')') as name,
    coalesce(cast(airport_heliport.apron_ts.abandoned_value as varchar), '(' || airport_heliport.apron_ts.abandoned_nilreason || ')') as abandoned,
    to_jsonb(airport_heliport_surfacecharacteristics_view_wxdwlv.*) AS surfaceproperties,
    coalesce(cast(airport_heliport_airportheliport_pt_zsrjqi.title as varchar), '(' || airport_heliport_airportheliport_pt_zsrjqi.nilreason[1] || ')') AS associatedairportheliport,
    airport_heliport_airportheliport_pt_zsrjqi.href AS associatedairportheliport_href,
    lat_contaminant.lat_contaminant as contaminant,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.apron 
inner join master_join mj2 on airport_heliport.apron.id = mj2.source_id
inner join airport_heliport.apron_tsp on mj2.target_id = airport_heliport.apron_tsp.id
inner join airport_heliport.apron_ts on airport_heliport.apron_tsp.aprontimeslice_id = airport_heliport.apron_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_wxdwlv on airport_heliport.apron_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_wxdwlv.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_zsrjqi on airport_heliport.apron_ts.associatedairportheliport_id = airport_heliport_airportheliport_pt_zsrjqi.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_aproncontamination_view_eeeyst.*) as lat_contaminant
  from master_join master_join_kpmwgo
  join airport_heliport.aproncontamination_view airport_heliport_aproncontamination_view_eeeyst on master_join_kpmwgo.target_id = airport_heliport_aproncontamination_view_eeeyst.id
  where master_join_kpmwgo.source_id = airport_heliport.apron_ts.id
) as lat_contaminant on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pdjfft.*) AS annotation
  from master_join master_join_bvtjqf
  join notes.note_view notes_note_view_pdjfft on master_join_bvtjqf.target_id = notes_note_view_pdjfft.id
  where master_join_bvtjqf.source_id = airport_heliport.apron_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_apronareaavailability_view_uqyabi.*) as lat_availability
  from master_join master_join_mkigen
  join airport_heliport.apronareaavailability_view airport_heliport_apronareaavailability_view_uqyabi on master_join_mkigen.target_id = airport_heliport_apronareaavailability_view_uqyabi.id
  where master_join_mkigen.source_id = airport_heliport.apron_ts.id
) as lat_availability on TRUE
where airport_heliport.apron.feature_status = 'APPROVED'
  and airport_heliport.apron_ts.feature_status = 'APPROVED'
order by apron.identifier, apron_ts.sequence_number, apron_ts.correction_number DESC;
create index on airport_heliport.apron_view (id);
-- ArrestingGearTimeSliceType
-- ['geometry.elevatedcurve_view', 'geometry.elevatedsurface_view', 'geometry.elevatedpoint_view', 'notes.note_view', 'airport_heliport.surfacecharacteristics_view']
drop materialized view if exists airport_heliport.arrestinggear_view cascade;
create materialized view airport_heliport.arrestinggear_view as
select distinct on (arrestinggear.identifier,arrestinggear_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.arrestinggear.id,
    airport_heliport.arrestinggear_ts.id as ts_id,
    airport_heliport.arrestinggear_tsp.id as tsp_id,
    airport_heliport.arrestinggear.identifier,
    airport_heliport.arrestinggear_ts.interpretation,
    airport_heliport.arrestinggear_ts.sequence_number,
    airport_heliport.arrestinggear_ts.correction_number,
    airport_heliport.arrestinggear_ts.valid_time_begin,
    airport_heliport.arrestinggear_ts.valid_time_end,
    airport_heliport.arrestinggear_ts.feature_lifetime_begin,
    airport_heliport.arrestinggear_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.arrestinggear_ts.status_value as varchar), '(' || airport_heliport.arrestinggear_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.arrestinggear_ts.engagedevice_value as varchar), '(' || airport_heliport.arrestinggear_ts.engagedevice_nilreason || ')') as engagedevice,
    coalesce(cast(airport_heliport.arrestinggear_ts.absorbtype_value as varchar), '(' || airport_heliport.arrestinggear_ts.absorbtype_nilreason || ')') as absorbtype,
    coalesce(cast(airport_heliport.arrestinggear_ts.bidirectional_value as varchar), '(' || airport_heliport.arrestinggear_ts.bidirectional_nilreason || ')') as bidirectional,
    coalesce(cast(airport_heliport.arrestinggear_ts.length_value as varchar) || ' ' || airport_heliport.arrestinggear_ts.length_uom, '(' || airport_heliport.arrestinggear_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.arrestinggear_ts.width_value as varchar) || ' ' || airport_heliport.arrestinggear_ts.width_uom, '(' || airport_heliport.arrestinggear_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.arrestinggear_ts.location_value as varchar) || ' ' || airport_heliport.arrestinggear_ts.location_uom, '(' || airport_heliport.arrestinggear_ts.location_nilreason || ')') as location,
    to_jsonb(airport_heliport_surfacecharacteristics_view_qlkpme.*) AS surfaceproperties,
    geometry_elevatedcurve_view_jdxixx.geom AS extentcurveextent_geom,
    geometry_elevatedcurve_view_jdxixx.elevation AS extentcurveextent_elevation,
    geometry_elevatedcurve_view_jdxixx.geoidUndulation AS extentcurveextent_geoidundulation,
    geometry_elevatedcurve_view_jdxixx.verticalDatum AS extentcurveextent_verticaldatum,
    geometry_elevatedcurve_view_jdxixx.verticalAccuracy AS extentcurveextent_verticalaccuracy,
    geometry_elevatedcurve_view_jdxixx.horizontalAccuracy AS extentcurveextent_horizontalaccuracy,
    geometry_elevatedsurface_view_htkzdg.geom AS extentsurfaceextent_geom,
    geometry_elevatedsurface_view_htkzdg.elevation AS extentsurfaceextent_elevation,
    geometry_elevatedsurface_view_htkzdg.geoidUndulation AS extentsurfaceextent_geoidundulation,
    geometry_elevatedsurface_view_htkzdg.verticalDatum AS extentsurfaceextent_verticaldatum,
    geometry_elevatedsurface_view_htkzdg.verticalAccuracy AS extentsurfaceextent_verticalaccuracy,
    geometry_elevatedsurface_view_htkzdg.horizontalAccuracy AS extentsurfaceextent_horizontalaccuracy,
    geometry_elevatedpoint_view_drwdhd.geom AS extentpointextent_geom,
    geometry_elevatedpoint_view_drwdhd.longitude AS extentpointextent_longitude,
    geometry_elevatedpoint_view_drwdhd.latitude AS extentpointextent_latitude,
    geometry_elevatedpoint_view_drwdhd.elevation AS extentpointextent_elevation,
    geometry_elevatedpoint_view_drwdhd.geoidUndulation AS extentpointextent_geoidundulation,
    geometry_elevatedpoint_view_drwdhd.verticalDatum AS extentpointextent_verticaldatum,
    geometry_elevatedpoint_view_drwdhd.verticalAccuracy AS extentpointextent_verticalaccuracy,
    geometry_elevatedpoint_view_drwdhd.horizontalAccuracy AS extentpointextent_horizontalaccuracy,
    lat_runwaydirection.lat_runwaydirection as runwaydirection,
    lat_annotation.annotation as annotation
from airport_heliport.arrestinggear 
inner join master_join mj2 on airport_heliport.arrestinggear.id = mj2.source_id
inner join airport_heliport.arrestinggear_tsp on mj2.target_id = airport_heliport.arrestinggear_tsp.id
inner join airport_heliport.arrestinggear_ts on airport_heliport.arrestinggear_tsp.arrestinggeartimeslice_id = airport_heliport.arrestinggear_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_qlkpme on airport_heliport.arrestinggear_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_qlkpme.id
left join geometry.elevatedcurve_view geometry_elevatedcurve_view_jdxixx on airport_heliport.arrestinggear_ts.extent_curveextent_id = geometry_elevatedcurve_view_jdxixx.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_htkzdg on airport_heliport.arrestinggear_ts.extent_surfaceextent_id = geometry_elevatedsurface_view_htkzdg.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_drwdhd on airport_heliport.arrestinggear_ts.extent_pointextent_id = geometry_elevatedpoint_view_drwdhd.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runwaydirection_pt_vklctw.id,
      'title', coalesce(cast(airport_heliport_runwaydirection_pt_vklctw.title AS varchar), '(' || airport_heliport_runwaydirection_pt_vklctw.nilreason[1] || ')'),
      'href', airport_heliport_runwaydirection_pt_vklctw.href
  )) as lat_runwaydirection  from master_join master_join_qgnekl
  join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_vklctw on master_join_qgnekl.target_id = airport_heliport_runwaydirection_pt_vklctw.id
  where master_join_qgnekl.source_id = airport_heliport.arrestinggear_ts.id
) as lat_runwaydirection on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_auhydo.*) AS annotation
  from master_join master_join_kdhnzg
  join notes.note_view notes_note_view_auhydo on master_join_kdhnzg.target_id = notes_note_view_auhydo.id
  where master_join_kdhnzg.source_id = airport_heliport.arrestinggear_ts.id
) as lat_annotation on TRUE
where airport_heliport.arrestinggear.feature_status = 'APPROVED'
  and airport_heliport.arrestinggear_ts.feature_status = 'APPROVED'
order by arrestinggear.identifier, arrestinggear_ts.sequence_number, arrestinggear_ts.correction_number DESC;
create index on airport_heliport.arrestinggear_view (id);
-- ArrivalFeederLegTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.aircraftcharacteristic_view', 'navaids_points.terminalsegmentpoint_view', 'geometry.curve_view', 'procedure.holdinguse_view']
drop materialized view if exists procedure.arrivalfeederleg_view cascade;
create materialized view procedure.arrivalfeederleg_view as
select distinct on (arrivalfeederleg.identifier,arrivalfeederleg_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.arrivalfeederleg.id,
    procedure.arrivalfeederleg_ts.id as ts_id,
    procedure.arrivalfeederleg_tsp.id as tsp_id,
    procedure.arrivalfeederleg.identifier,
    procedure.arrivalfeederleg_ts.interpretation,
    procedure.arrivalfeederleg_ts.sequence_number,
    procedure.arrivalfeederleg_ts.correction_number,
    procedure.arrivalfeederleg_ts.valid_time_begin,
    procedure.arrivalfeederleg_ts.valid_time_end,
    procedure.arrivalfeederleg_ts.feature_lifetime_begin,
    procedure.arrivalfeederleg_ts.feature_lifetime_end,
    coalesce(cast(procedure.arrivalfeederleg_ts.endconditiondesignator_value as varchar), '(' || procedure.arrivalfeederleg_ts.endconditiondesignator_nilreason || ')') as endconditiondesignator,
    coalesce(cast(procedure.arrivalfeederleg_ts.legpath_value as varchar), '(' || procedure.arrivalfeederleg_ts.legpath_nilreason || ')') as legpath,
    coalesce(cast(procedure.arrivalfeederleg_ts.legtypearinc_value as varchar), '(' || procedure.arrivalfeederleg_ts.legtypearinc_nilreason || ')') as legtypearinc,
    coalesce(cast(procedure.arrivalfeederleg_ts.course_value as varchar), '(' || procedure.arrivalfeederleg_ts.course_nilreason || ')') as course,
    coalesce(cast(procedure.arrivalfeederleg_ts.coursetype_value as varchar), '(' || procedure.arrivalfeederleg_ts.coursetype_nilreason || ')') as coursetype,
    coalesce(cast(procedure.arrivalfeederleg_ts.coursedirection_value as varchar), '(' || procedure.arrivalfeederleg_ts.coursedirection_nilreason || ')') as coursedirection,
    coalesce(cast(procedure.arrivalfeederleg_ts.turndirection_value as varchar), '(' || procedure.arrivalfeederleg_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.arrivalfeederleg_ts.speedreference_value as varchar), '(' || procedure.arrivalfeederleg_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(procedure.arrivalfeederleg_ts.speedinterpretation_value as varchar), '(' || procedure.arrivalfeederleg_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(procedure.arrivalfeederleg_ts.bankangle_value as varchar), '(' || procedure.arrivalfeederleg_ts.bankangle_nilreason || ')') as bankangle,
    coalesce(cast(procedure.arrivalfeederleg_ts.procedureturnrequired_value as varchar), '(' || procedure.arrivalfeederleg_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.arrivalfeederleg_ts.upperlimitreference_value as varchar), '(' || procedure.arrivalfeederleg_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(procedure.arrivalfeederleg_ts.lowerlimitreference_value as varchar), '(' || procedure.arrivalfeederleg_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(procedure.arrivalfeederleg_ts.altitudeinterpretation_value as varchar), '(' || procedure.arrivalfeederleg_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(procedure.arrivalfeederleg_ts.altitudeoverridereference_value as varchar), '(' || procedure.arrivalfeederleg_ts.altitudeoverridereference_nilreason || ')') as altitudeoverridereference,
    coalesce(cast(procedure.arrivalfeederleg_ts.verticalangle_value as varchar), '(' || procedure.arrivalfeederleg_ts.verticalangle_nilreason || ')') as verticalangle,
    coalesce(cast(procedure.arrivalfeederleg_ts.requirednavigationperformance_value as varchar), '(' || procedure.arrivalfeederleg_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.arrivalfeederleg_ts.speedlimit_value as varchar) || ' ' || procedure.arrivalfeederleg_ts.speedlimit_uom, '(' || procedure.arrivalfeederleg_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(procedure.arrivalfeederleg_ts.length_value as varchar) || ' ' || procedure.arrivalfeederleg_ts.length_uom, '(' || procedure.arrivalfeederleg_ts.length_nilreason || ')') as length,
    coalesce(cast(procedure.arrivalfeederleg_ts.duration_value as varchar) || ' ' || procedure.arrivalfeederleg_ts.duration_uom, '(' || procedure.arrivalfeederleg_ts.duration_nilreason || ')') as duration,
    coalesce(cast(procedure.arrivalfeederleg_ts.upperlimitaltitude_value as varchar) || ' ' || procedure.arrivalfeederleg_ts.upperlimitaltitude_uom, '(' || procedure.arrivalfeederleg_ts.upperlimitaltitude_nilreason || ')') as upperlimitaltitude,
    coalesce(cast(procedure.arrivalfeederleg_ts.lowerlimitaltitude_value as varchar) || ' ' || procedure.arrivalfeederleg_ts.lowerlimitaltitude_uom, '(' || procedure.arrivalfeederleg_ts.lowerlimitaltitude_nilreason || ')') as lowerlimitaltitude,
    coalesce(cast(procedure.arrivalfeederleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.arrivalfeederleg_ts.altitudeoverrideatc_uom, '(' || procedure.arrivalfeederleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc,
    to_jsonb(navaids_points_terminalsegmentpoint_view_kustxh.*) AS startpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_dpdloi.*) AS endpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_yqucjb.*) AS arccentre,
    geometry_curve_view_xzrwjw.geom AS trajectory_geom,
    geometry_curve_view_xzrwjw.horizontalAccuracy as trajectory_horizontalaccuracy,
    coalesce(cast(navaids_points_angleindication_pt_vcwlcz.title as varchar), '(' || navaids_points_angleindication_pt_vcwlcz.nilreason[1] || ')') AS angle,
    navaids_points_angleindication_pt_vcwlcz.href AS angle_href,
    coalesce(cast(navaids_points_distanceindication_pt_wpphgc.title as varchar), '(' || navaids_points_distanceindication_pt_wpphgc.nilreason[1] || ')') AS distance,
    navaids_points_distanceindication_pt_wpphgc.href AS distance_href,
    to_jsonb(procedure_holdinguse_view_cvcnkf.*) AS holding,
    coalesce(cast(procedure_instrumentapproachprocedure_pt_oodlxa.title as varchar), '(' || procedure_instrumentapproachprocedure_pt_oodlxa.nilreason[1] || ')') AS approach,
    procedure_instrumentapproachprocedure_pt_oodlxa.href AS approach_href,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation
from procedure.arrivalfeederleg 
inner join master_join mj2 on procedure.arrivalfeederleg.id = mj2.source_id
inner join procedure.arrivalfeederleg_tsp on mj2.target_id = procedure.arrivalfeederleg_tsp.id
inner join procedure.arrivalfeederleg_ts on procedure.arrivalfeederleg_tsp.arrivalfeederlegtimeslice_id = procedure.arrivalfeederleg_ts.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_kustxh on procedure.arrivalfeederleg_ts.startpoint_id = navaids_points_terminalsegmentpoint_view_kustxh.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_dpdloi on procedure.arrivalfeederleg_ts.endpoint_id = navaids_points_terminalsegmentpoint_view_dpdloi.id
left join geometry.curve_view geometry_curve_view_xzrwjw on procedure.arrivalfeederleg_ts.trajectory_id = geometry_curve_view_xzrwjw.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_yqucjb on procedure.arrivalfeederleg_ts.arccentre_id = navaids_points_terminalsegmentpoint_view_yqucjb.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_vcwlcz on procedure.arrivalfeederleg_ts.angle_id = navaids_points_angleindication_pt_vcwlcz.id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_wpphgc on procedure.arrivalfeederleg_ts.distance_id = navaids_points_distanceindication_pt_wpphgc.id
left join procedure.holdinguse_view procedure_holdinguse_view_cvcnkf on procedure.arrivalfeederleg_ts.holding_id = procedure_holdinguse_view_cvcnkf.id
left join procedure.instrumentapproachprocedure_pt procedure_instrumentapproachprocedure_pt_oodlxa on procedure.arrivalfeederleg_ts.approach_id = procedure_instrumentapproachprocedure_pt_oodlxa.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_qrbgzv.*) as lat_aircraftcategory
  from master_join master_join_bckmvc
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_qrbgzv on master_join_bckmvc.target_id = shared_aircraftcharacteristic_view_qrbgzv.id
  where master_join_bckmvc.source_id = procedure.arrivalfeederleg_ts.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_gtajpg.*) as lat_designsurface
  from master_join master_join_kcetuq
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_gtajpg on master_join_kcetuq.target_id = shared_obstacleassessmentarea_view_gtajpg.id
  where master_join_kcetuq.source_id = procedure.arrivalfeederleg_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_tyuhme.*) AS annotation
  from master_join master_join_rmdcpz
  join notes.note_view notes_note_view_tyuhme on master_join_rmdcpz.target_id = notes_note_view_tyuhme.id
  where master_join_rmdcpz.source_id = procedure.arrivalfeederleg_ts.id
) as lat_annotation on TRUE
where procedure.arrivalfeederleg.feature_status = 'APPROVED'
  and procedure.arrivalfeederleg_ts.feature_status = 'APPROVED'
order by arrivalfeederleg.identifier, arrivalfeederleg_ts.sequence_number, arrivalfeederleg_ts.correction_number DESC;
create index on procedure.arrivalfeederleg_view (id);
-- ArrivalLegTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.aircraftcharacteristic_view', 'navaids_points.terminalsegmentpoint_view', 'geometry.curve_view', 'procedure.holdinguse_view']
drop materialized view if exists procedure.arrivalleg_view cascade;
create materialized view procedure.arrivalleg_view as
select distinct on (arrivalleg.identifier,arrivalleg_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.arrivalleg.id,
    procedure.arrivalleg_ts.id as ts_id,
    procedure.arrivalleg_tsp.id as tsp_id,
    procedure.arrivalleg.identifier,
    procedure.arrivalleg_ts.interpretation,
    procedure.arrivalleg_ts.sequence_number,
    procedure.arrivalleg_ts.correction_number,
    procedure.arrivalleg_ts.valid_time_begin,
    procedure.arrivalleg_ts.valid_time_end,
    procedure.arrivalleg_ts.feature_lifetime_begin,
    procedure.arrivalleg_ts.feature_lifetime_end,
    coalesce(cast(procedure.arrivalleg_ts.endconditiondesignator_value as varchar), '(' || procedure.arrivalleg_ts.endconditiondesignator_nilreason || ')') as endconditiondesignator,
    coalesce(cast(procedure.arrivalleg_ts.legpath_value as varchar), '(' || procedure.arrivalleg_ts.legpath_nilreason || ')') as legpath,
    coalesce(cast(procedure.arrivalleg_ts.legtypearinc_value as varchar), '(' || procedure.arrivalleg_ts.legtypearinc_nilreason || ')') as legtypearinc,
    coalesce(cast(procedure.arrivalleg_ts.course_value as varchar), '(' || procedure.arrivalleg_ts.course_nilreason || ')') as course,
    coalesce(cast(procedure.arrivalleg_ts.coursetype_value as varchar), '(' || procedure.arrivalleg_ts.coursetype_nilreason || ')') as coursetype,
    coalesce(cast(procedure.arrivalleg_ts.coursedirection_value as varchar), '(' || procedure.arrivalleg_ts.coursedirection_nilreason || ')') as coursedirection,
    coalesce(cast(procedure.arrivalleg_ts.turndirection_value as varchar), '(' || procedure.arrivalleg_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.arrivalleg_ts.speedreference_value as varchar), '(' || procedure.arrivalleg_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(procedure.arrivalleg_ts.speedinterpretation_value as varchar), '(' || procedure.arrivalleg_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(procedure.arrivalleg_ts.bankangle_value as varchar), '(' || procedure.arrivalleg_ts.bankangle_nilreason || ')') as bankangle,
    coalesce(cast(procedure.arrivalleg_ts.procedureturnrequired_value as varchar), '(' || procedure.arrivalleg_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.arrivalleg_ts.upperlimitreference_value as varchar), '(' || procedure.arrivalleg_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(procedure.arrivalleg_ts.lowerlimitreference_value as varchar), '(' || procedure.arrivalleg_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(procedure.arrivalleg_ts.altitudeinterpretation_value as varchar), '(' || procedure.arrivalleg_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(procedure.arrivalleg_ts.altitudeoverridereference_value as varchar), '(' || procedure.arrivalleg_ts.altitudeoverridereference_nilreason || ')') as altitudeoverridereference,
    coalesce(cast(procedure.arrivalleg_ts.verticalangle_value as varchar), '(' || procedure.arrivalleg_ts.verticalangle_nilreason || ')') as verticalangle,
    coalesce(cast(procedure.arrivalleg_ts.requirednavigationperformance_value as varchar), '(' || procedure.arrivalleg_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.arrivalleg_ts.speedlimit_value as varchar) || ' ' || procedure.arrivalleg_ts.speedlimit_uom, '(' || procedure.arrivalleg_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(procedure.arrivalleg_ts.length_value as varchar) || ' ' || procedure.arrivalleg_ts.length_uom, '(' || procedure.arrivalleg_ts.length_nilreason || ')') as length,
    coalesce(cast(procedure.arrivalleg_ts.duration_value as varchar) || ' ' || procedure.arrivalleg_ts.duration_uom, '(' || procedure.arrivalleg_ts.duration_nilreason || ')') as duration,
    coalesce(cast(procedure.arrivalleg_ts.upperlimitaltitude_value as varchar) || ' ' || procedure.arrivalleg_ts.upperlimitaltitude_uom, '(' || procedure.arrivalleg_ts.upperlimitaltitude_nilreason || ')') as upperlimitaltitude,
    coalesce(cast(procedure.arrivalleg_ts.lowerlimitaltitude_value as varchar) || ' ' || procedure.arrivalleg_ts.lowerlimitaltitude_uom, '(' || procedure.arrivalleg_ts.lowerlimitaltitude_nilreason || ')') as lowerlimitaltitude,
    coalesce(cast(procedure.arrivalleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.arrivalleg_ts.altitudeoverrideatc_uom, '(' || procedure.arrivalleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc,
    to_jsonb(navaids_points_terminalsegmentpoint_view_jhfiab.*) AS startpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_pwaezj.*) AS endpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_ptqabe.*) AS arccentre,
    geometry_curve_view_rcxrkn.geom AS trajectory_geom,
    geometry_curve_view_rcxrkn.horizontalAccuracy as trajectory_horizontalaccuracy,
    coalesce(cast(navaids_points_angleindication_pt_xcdyba.title as varchar), '(' || navaids_points_angleindication_pt_xcdyba.nilreason[1] || ')') AS angle,
    navaids_points_angleindication_pt_xcdyba.href AS angle_href,
    coalesce(cast(navaids_points_distanceindication_pt_fqycsr.title as varchar), '(' || navaids_points_distanceindication_pt_fqycsr.nilreason[1] || ')') AS distance,
    navaids_points_distanceindication_pt_fqycsr.href AS distance_href,
    to_jsonb(procedure_holdinguse_view_rhnvpr.*) AS holding,
    coalesce(cast(procedure_standardinstrumentarrival_pt_kdascv.title as varchar), '(' || procedure_standardinstrumentarrival_pt_kdascv.nilreason[1] || ')') AS arrival,
    procedure_standardinstrumentarrival_pt_kdascv.href AS arrival_href,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation
from procedure.arrivalleg 
inner join master_join mj2 on procedure.arrivalleg.id = mj2.source_id
inner join procedure.arrivalleg_tsp on mj2.target_id = procedure.arrivalleg_tsp.id
inner join procedure.arrivalleg_ts on procedure.arrivalleg_tsp.arrivallegtimeslice_id = procedure.arrivalleg_ts.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_jhfiab on procedure.arrivalleg_ts.startpoint_id = navaids_points_terminalsegmentpoint_view_jhfiab.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_pwaezj on procedure.arrivalleg_ts.endpoint_id = navaids_points_terminalsegmentpoint_view_pwaezj.id
left join geometry.curve_view geometry_curve_view_rcxrkn on procedure.arrivalleg_ts.trajectory_id = geometry_curve_view_rcxrkn.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_ptqabe on procedure.arrivalleg_ts.arccentre_id = navaids_points_terminalsegmentpoint_view_ptqabe.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_xcdyba on procedure.arrivalleg_ts.angle_id = navaids_points_angleindication_pt_xcdyba.id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_fqycsr on procedure.arrivalleg_ts.distance_id = navaids_points_distanceindication_pt_fqycsr.id
left join procedure.holdinguse_view procedure_holdinguse_view_rhnvpr on procedure.arrivalleg_ts.holding_id = procedure_holdinguse_view_rhnvpr.id
left join procedure.standardinstrumentarrival_pt procedure_standardinstrumentarrival_pt_kdascv on procedure.arrivalleg_ts.arrival_id = procedure_standardinstrumentarrival_pt_kdascv.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_vdqfbk.*) as lat_aircraftcategory
  from master_join master_join_kejejn
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_vdqfbk on master_join_kejejn.target_id = shared_aircraftcharacteristic_view_vdqfbk.id
  where master_join_kejejn.source_id = procedure.arrivalleg_ts.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_fufdhb.*) as lat_designsurface
  from master_join master_join_fmtupx
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_fufdhb on master_join_fmtupx.target_id = shared_obstacleassessmentarea_view_fufdhb.id
  where master_join_fmtupx.source_id = procedure.arrivalleg_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_cyeblk.*) AS annotation
  from master_join master_join_ffvcoh
  join notes.note_view notes_note_view_cyeblk on master_join_ffvcoh.target_id = notes_note_view_cyeblk.id
  where master_join_ffvcoh.source_id = procedure.arrivalleg_ts.id
) as lat_annotation on TRUE
where procedure.arrivalleg.feature_status = 'APPROVED'
  and procedure.arrivalleg_ts.feature_status = 'APPROVED'
order by arrivalleg.identifier, arrivalleg_ts.sequence_number, arrivalleg_ts.correction_number DESC;
create index on procedure.arrivalleg_view (id);
-- AuthorityForAirspaceTimeSliceType
-- ['notes.note_view']
drop materialized view if exists airspace.authorityforairspace_view cascade;
create materialized view airspace.authorityforairspace_view as
select distinct on (authorityforairspace.identifier,authorityforairspace_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airspace.authorityforairspace.id,
    airspace.authorityforairspace_ts.id as ts_id,
    airspace.authorityforairspace_tsp.id as tsp_id,
    airspace.authorityforairspace.identifier,
    airspace.authorityforairspace_ts.interpretation,
    airspace.authorityforairspace_ts.sequence_number,
    airspace.authorityforairspace_ts.correction_number,
    airspace.authorityforairspace_ts.valid_time_begin,
    airspace.authorityforairspace_ts.valid_time_end,
    airspace.authorityforairspace_ts.feature_lifetime_begin,
    airspace.authorityforairspace_ts.feature_lifetime_end,
    coalesce(cast(airspace.authorityforairspace_ts.type_value as varchar), '(' || airspace.authorityforairspace_ts.type_nilreason || ')') as type,
    coalesce(cast(organisation_organisationauthority_pt_lkjizv.title as varchar), '(' || organisation_organisationauthority_pt_lkjizv.nilreason[1] || ')') AS responsibleorganisation,
    organisation_organisationauthority_pt_lkjizv.href AS responsibleorganisation_href,
    coalesce(cast(airspace_airspace_pt_ohyiym.title as varchar), '(' || airspace_airspace_pt_ohyiym.nilreason[1] || ')') AS assignedairspace,
    airspace_airspace_pt_ohyiym.href AS assignedairspace_href,
    lat_annotation.annotation as annotation
from airspace.authorityforairspace 
inner join master_join mj2 on airspace.authorityforairspace.id = mj2.source_id
inner join airspace.authorityforairspace_tsp on mj2.target_id = airspace.authorityforairspace_tsp.id
inner join airspace.authorityforairspace_ts on airspace.authorityforairspace_tsp.authorityforairspacetimeslice_id = airspace.authorityforairspace_ts.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_lkjizv on airspace.authorityforairspace_ts.responsibleorganisation_id = organisation_organisationauthority_pt_lkjizv.id
left join airspace.airspace_pt airspace_airspace_pt_ohyiym on airspace.authorityforairspace_ts.assignedairspace_id = airspace_airspace_pt_ohyiym.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ppshxt.*) AS annotation
  from master_join master_join_qglnyj
  join notes.note_view notes_note_view_ppshxt on master_join_qglnyj.target_id = notes_note_view_ppshxt.id
  where master_join_qglnyj.source_id = airspace.authorityforairspace_ts.id
) as lat_annotation on TRUE
where airspace.authorityforairspace.feature_status = 'APPROVED'
  and airspace.authorityforairspace_ts.feature_status = 'APPROVED'
order by authorityforairspace.identifier, authorityforairspace_ts.sequence_number, authorityforairspace_ts.correction_number DESC;
create index on airspace.authorityforairspace_view (id);
-- AzimuthTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.azimuth_view cascade;
create materialized view navaids_points.azimuth_view as
select distinct on (azimuth.identifier,azimuth_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.azimuth.id,
    navaids_points.azimuth_ts.id as ts_id,
    navaids_points.azimuth_tsp.id as tsp_id,
    navaids_points.azimuth.identifier,
    navaids_points.azimuth_ts.interpretation,
    navaids_points.azimuth_ts.sequence_number,
    navaids_points.azimuth_ts.correction_number,
    navaids_points.azimuth_ts.valid_time_begin,
    navaids_points.azimuth_ts.valid_time_end,
    navaids_points.azimuth_ts.feature_lifetime_begin,
    navaids_points.azimuth_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.azimuth_ts.designator_value as varchar), '(' || navaids_points.azimuth_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.azimuth_ts.name_value as varchar), '(' || navaids_points.azimuth_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.azimuth_ts.emissionclass_value as varchar), '(' || navaids_points.azimuth_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.azimuth_ts.mobile_value as varchar), '(' || navaids_points.azimuth_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.azimuth_ts.magneticvariation_value as varchar), '(' || navaids_points.azimuth_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.azimuth_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.azimuth_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.azimuth_ts.datemagneticvariation_value as varchar), '(' || navaids_points.azimuth_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.azimuth_ts.flightchecked_value as varchar), '(' || navaids_points.azimuth_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.azimuth_ts.type_value as varchar), '(' || navaids_points.azimuth_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.azimuth_ts.truebearing_value as varchar), '(' || navaids_points.azimuth_ts.truebearing_nilreason || ')') as truebearing,
    coalesce(cast(navaids_points.azimuth_ts.truebearingaccuracy_value as varchar), '(' || navaids_points.azimuth_ts.truebearingaccuracy_nilreason || ')') as truebearingaccuracy,
    coalesce(cast(navaids_points.azimuth_ts.magneticbearing_value as varchar), '(' || navaids_points.azimuth_ts.magneticbearing_nilreason || ')') as magneticbearing,
    coalesce(cast(navaids_points.azimuth_ts.angleproportionalleft_value as varchar), '(' || navaids_points.azimuth_ts.angleproportionalleft_nilreason || ')') as angleproportionalleft,
    coalesce(cast(navaids_points.azimuth_ts.angleproportionalright_value as varchar), '(' || navaids_points.azimuth_ts.angleproportionalright_nilreason || ')') as angleproportionalright,
    coalesce(cast(navaids_points.azimuth_ts.anglecoverleft_value as varchar), '(' || navaids_points.azimuth_ts.anglecoverleft_nilreason || ')') as anglecoverleft,
    coalesce(cast(navaids_points.azimuth_ts.anglecoverright_value as varchar), '(' || navaids_points.azimuth_ts.anglecoverright_nilreason || ')') as anglecoverright,
    coalesce(cast(navaids_points.azimuth_ts.channel_value as varchar), '(' || navaids_points.azimuth_ts.channel_nilreason || ')') as channel,
    geometry_elevatedpoint_view_semchb.geom AS location_geom,
    geometry_elevatedpoint_view_semchb.longitude AS location_longitude,
    geometry_elevatedpoint_view_semchb.latitude AS location_latitude,
    geometry_elevatedpoint_view_semchb.elevation AS location_elevation,
    geometry_elevatedpoint_view_semchb.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_semchb.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_semchb.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_semchb.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.azimuth 
inner join master_join mj2 on navaids_points.azimuth.id = mj2.source_id
inner join navaids_points.azimuth_tsp on mj2.target_id = navaids_points.azimuth_tsp.id
inner join navaids_points.azimuth_ts on navaids_points.azimuth_tsp.azimuthtimeslice_id = navaids_points.azimuth_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_semchb on navaids_points.azimuth_ts.location_id = geometry_elevatedpoint_view_semchb.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_knlxqi.*) as lat_authority
  from master_join master_join_zbzdga
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_knlxqi on master_join_zbzdga.target_id = navaids_points_authorityfornavaidequipment_view_knlxqi.id
  where master_join_zbzdga.source_id = navaids_points.azimuth_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_nnriuk.*) as lat_monitoring
  from master_join master_join_nmszde
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_nnriuk on master_join_nmszde.target_id = navaids_points_navaidequipmentmonitoring_view_nnriuk.id
  where master_join_nmszde.source_id = navaids_points.azimuth_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_dgfkjo.*) as lat_availability
  from master_join master_join_induuw
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_dgfkjo on master_join_induuw.target_id = navaids_points_navaidoperationalstatus_view_dgfkjo.id
  where master_join_induuw.source_id = navaids_points.azimuth_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gwtiup.*) AS annotation
  from master_join master_join_lvybuu
  join notes.note_view notes_note_view_gwtiup on master_join_lvybuu.target_id = notes_note_view_gwtiup.id
  where master_join_lvybuu.source_id = navaids_points.azimuth_ts.id
) as lat_annotation on TRUE
where navaids_points.azimuth.feature_status = 'APPROVED'
  and navaids_points.azimuth_ts.feature_status = 'APPROVED'
order by azimuth.identifier, azimuth_ts.sequence_number, azimuth_ts.correction_number DESC;
create index on navaids_points.azimuth_view (id);
-- ChangeOverPointTimeSliceType
-- ['routes.routeportion_view', 'notes.note_view', 'geometry.point_view']
drop materialized view if exists routes.changeoverpoint_view cascade;
create materialized view routes.changeoverpoint_view as
select distinct on (changeoverpoint.identifier,changeoverpoint_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    routes.changeoverpoint.id,
    routes.changeoverpoint_ts.id as ts_id,
    routes.changeoverpoint_tsp.id as tsp_id,
    routes.changeoverpoint.identifier,
    routes.changeoverpoint_ts.interpretation,
    routes.changeoverpoint_ts.sequence_number,
    routes.changeoverpoint_ts.correction_number,
    routes.changeoverpoint_ts.valid_time_begin,
    routes.changeoverpoint_ts.valid_time_end,
    routes.changeoverpoint_ts.feature_lifetime_begin,
    routes.changeoverpoint_ts.feature_lifetime_end,
    coalesce(cast(routes.changeoverpoint_ts.distance_value as varchar) || ' ' || routes.changeoverpoint_ts.distance_uom, '(' || routes.changeoverpoint_ts.distance_nilreason || ')') as distance,
    coalesce(cast(navaids_points_designatedpoint_pt_tjreup.title as varchar), '(' || navaids_points_designatedpoint_pt_tjreup.nilreason[1] || ')') AS locationfixdesignatedpoint,
    navaids_points_designatedpoint_pt_tjreup.href AS locationfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_tifjwg.title as varchar), '(' || navaids_points_navaid_pt_tifjwg.nilreason[1] || ')') AS locationnavaidsystem,
    navaids_points_navaid_pt_tifjwg.href AS locationnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_axpyvy.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_axpyvy.nilreason[1] || ')') AS locationaimingpoint,
    airport_heliport_touchdownliftoff_pt_axpyvy.href AS locationaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_mbnlpr.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_mbnlpr.nilreason[1] || ')') AS locationrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_mbnlpr.href AS locationrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_khxlvw.title as varchar), '(' || airport_heliport_airportheliport_pt_khxlvw.nilreason[1] || ')') AS locationairportreferencepoint,
    airport_heliport_airportheliport_pt_khxlvw.href AS locationairportreferencepoint_href,
    geometry_point_view_wddqmc.geom AS locationposition_geom,
    geometry_point_view_wddqmc.longitude AS locationposition_longitude,
    geometry_point_view_wddqmc.latitude AS locationposition_latitude,
    geometry_point_view_wddqmc.horizontalAccuracy AS locationposition_horizontalaccuracy,
    to_jsonb(routes_routeportion_view_jitdsu.*) AS applicablerouteportion,
    lat_annotation.annotation as annotation
from routes.changeoverpoint 
inner join master_join mj2 on routes.changeoverpoint.id = mj2.source_id
inner join routes.changeoverpoint_tsp on mj2.target_id = routes.changeoverpoint_tsp.id
inner join routes.changeoverpoint_ts on routes.changeoverpoint_tsp.changeoverpointtimeslice_id = routes.changeoverpoint_ts.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_tjreup on routes.changeoverpoint_ts.location_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_tjreup.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_tifjwg on routes.changeoverpoint_ts.location_navaidsystem_id = navaids_points_navaid_pt_tifjwg.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_axpyvy on routes.changeoverpoint_ts.location_aimingpoint_id = airport_heliport_touchdownliftoff_pt_axpyvy.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_mbnlpr on routes.changeoverpoint_ts.location_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_mbnlpr.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_khxlvw on routes.changeoverpoint_ts.location_airportreferencepoint_id = airport_heliport_airportheliport_pt_khxlvw.id
left join geometry.point_view geometry_point_view_wddqmc on routes.changeoverpoint_ts.location_position_id = geometry_point_view_wddqmc.id
left join routes.routeportion_view routes_routeportion_view_jitdsu on routes.changeoverpoint_ts.applicablerouteportion_id = routes_routeportion_view_jitdsu.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_zxmoym.*) AS annotation
  from master_join master_join_ggmrhd
  join notes.note_view notes_note_view_zxmoym on master_join_ggmrhd.target_id = notes_note_view_zxmoym.id
  where master_join_ggmrhd.source_id = routes.changeoverpoint_ts.id
) as lat_annotation on TRUE
where routes.changeoverpoint.feature_status = 'APPROVED'
  and routes.changeoverpoint_ts.feature_status = 'APPROVED'
order by changeoverpoint.identifier, changeoverpoint_ts.sequence_number, changeoverpoint_ts.correction_number DESC;
create index on routes.changeoverpoint_view (id);
-- CheckpointINSTimeSliceType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists navaids_points.checkpointins_view cascade;
create materialized view navaids_points.checkpointins_view as
select distinct on (checkpointins.identifier,checkpointins_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.checkpointins.id,
    navaids_points.checkpointins_ts.id as ts_id,
    navaids_points.checkpointins_tsp.id as tsp_id,
    navaids_points.checkpointins.identifier,
    navaids_points.checkpointins_ts.interpretation,
    navaids_points.checkpointins_ts.sequence_number,
    navaids_points.checkpointins_ts.correction_number,
    navaids_points.checkpointins_ts.valid_time_begin,
    navaids_points.checkpointins_ts.valid_time_end,
    navaids_points.checkpointins_ts.feature_lifetime_begin,
    navaids_points.checkpointins_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.checkpointins_ts.category_value as varchar), '(' || navaids_points.checkpointins_ts.category_nilreason || ')') as category,
    coalesce(cast(navaids_points.checkpointins_ts.upperlimitreference_value as varchar), '(' || navaids_points.checkpointins_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(navaids_points.checkpointins_ts.lowerlimitreference_value as varchar), '(' || navaids_points.checkpointins_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(navaids_points.checkpointins_ts.altitudeinterpretation_value as varchar), '(' || navaids_points.checkpointins_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(navaids_points.checkpointins_ts.angle_value as varchar), '(' || navaids_points.checkpointins_ts.angle_nilreason || ')') as angle,
    coalesce(cast(navaids_points.checkpointins_ts.upperlimit_value as varchar) || ' ' || navaids_points.checkpointins_ts.upperlimit_uom, '(' || navaids_points.checkpointins_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(navaids_points.checkpointins_ts.lowerlimit_value as varchar) || ' ' || navaids_points.checkpointins_ts.lowerlimit_uom, '(' || navaids_points.checkpointins_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(navaids_points.checkpointins_ts.distance_value as varchar) || ' ' || navaids_points.checkpointins_ts.distance_uom, '(' || navaids_points.checkpointins_ts.distance_nilreason || ')') as distance,
    geometry_elevatedpoint_view_lrnriv.geom AS position_geom,
    geometry_elevatedpoint_view_lrnriv.longitude AS position_longitude,
    geometry_elevatedpoint_view_lrnriv.latitude AS position_latitude,
    geometry_elevatedpoint_view_lrnriv.elevation AS position_elevation,
    geometry_elevatedpoint_view_lrnriv.geoidUndulation AS position_geoidundulation,
    geometry_elevatedpoint_view_lrnriv.verticalDatum AS position_verticaldatum,
    geometry_elevatedpoint_view_lrnriv.verticalAccuracy AS position_verticalaccuracy,
    geometry_elevatedpoint_view_lrnriv.horizontalAccuracy AS position_horizontalaccuracy,
    coalesce(cast(airport_heliport_airportheliport_pt_casfmj.title as varchar), '(' || airport_heliport_airportheliport_pt_casfmj.nilreason[1] || ')') AS airportheliport,
    airport_heliport_airportheliport_pt_casfmj.href AS airportheliport_href,
    lat_annotation.annotation as annotation
from navaids_points.checkpointins 
inner join master_join mj2 on navaids_points.checkpointins.id = mj2.source_id
inner join navaids_points.checkpointins_tsp on mj2.target_id = navaids_points.checkpointins_tsp.id
inner join navaids_points.checkpointins_ts on navaids_points.checkpointins_tsp.checkpointinstimeslice_id = navaids_points.checkpointins_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_lrnriv on navaids_points.checkpointins_ts.position_id = geometry_elevatedpoint_view_lrnriv.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_casfmj on navaids_points.checkpointins_ts.airportheliport_id = airport_heliport_airportheliport_pt_casfmj.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mqhbge.*) AS annotation
  from master_join master_join_kokrjn
  join notes.note_view notes_note_view_mqhbge on master_join_kokrjn.target_id = notes_note_view_mqhbge.id
  where master_join_kokrjn.source_id = navaids_points.checkpointins_ts.id
) as lat_annotation on TRUE
where navaids_points.checkpointins.feature_status = 'APPROVED'
  and navaids_points.checkpointins_ts.feature_status = 'APPROVED'
order by checkpointins.identifier, checkpointins_ts.sequence_number, checkpointins_ts.correction_number DESC;
create index on navaids_points.checkpointins_view (id);
-- CheckpointVORTimeSliceType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists navaids_points.checkpointvor_view cascade;
create materialized view navaids_points.checkpointvor_view as
select distinct on (checkpointvor.identifier,checkpointvor_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.checkpointvor.id,
    navaids_points.checkpointvor_ts.id as ts_id,
    navaids_points.checkpointvor_tsp.id as tsp_id,
    navaids_points.checkpointvor.identifier,
    navaids_points.checkpointvor_ts.interpretation,
    navaids_points.checkpointvor_ts.sequence_number,
    navaids_points.checkpointvor_ts.correction_number,
    navaids_points.checkpointvor_ts.valid_time_begin,
    navaids_points.checkpointvor_ts.valid_time_end,
    navaids_points.checkpointvor_ts.feature_lifetime_begin,
    navaids_points.checkpointvor_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.checkpointvor_ts.category_value as varchar), '(' || navaids_points.checkpointvor_ts.category_nilreason || ')') as category,
    coalesce(cast(navaids_points.checkpointvor_ts.upperlimitreference_value as varchar), '(' || navaids_points.checkpointvor_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(navaids_points.checkpointvor_ts.lowerlimitreference_value as varchar), '(' || navaids_points.checkpointvor_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(navaids_points.checkpointvor_ts.altitudeinterpretation_value as varchar), '(' || navaids_points.checkpointvor_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(navaids_points.checkpointvor_ts.angle_value as varchar), '(' || navaids_points.checkpointvor_ts.angle_nilreason || ')') as angle,
    coalesce(cast(navaids_points.checkpointvor_ts.upperlimit_value as varchar) || ' ' || navaids_points.checkpointvor_ts.upperlimit_uom, '(' || navaids_points.checkpointvor_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(navaids_points.checkpointvor_ts.lowerlimit_value as varchar) || ' ' || navaids_points.checkpointvor_ts.lowerlimit_uom, '(' || navaids_points.checkpointvor_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(navaids_points.checkpointvor_ts.distance_value as varchar) || ' ' || navaids_points.checkpointvor_ts.distance_uom, '(' || navaids_points.checkpointvor_ts.distance_nilreason || ')') as distance,
    geometry_elevatedpoint_view_vklioj.geom AS position_geom,
    geometry_elevatedpoint_view_vklioj.longitude AS position_longitude,
    geometry_elevatedpoint_view_vklioj.latitude AS position_latitude,
    geometry_elevatedpoint_view_vklioj.elevation AS position_elevation,
    geometry_elevatedpoint_view_vklioj.geoidUndulation AS position_geoidundulation,
    geometry_elevatedpoint_view_vklioj.verticalDatum AS position_verticaldatum,
    geometry_elevatedpoint_view_vklioj.verticalAccuracy AS position_verticalaccuracy,
    geometry_elevatedpoint_view_vklioj.horizontalAccuracy AS position_horizontalaccuracy,
    coalesce(cast(airport_heliport_airportheliport_pt_moksix.title as varchar), '(' || airport_heliport_airportheliport_pt_moksix.nilreason[1] || ')') AS airportheliport,
    airport_heliport_airportheliport_pt_moksix.href AS airportheliport_href,
    coalesce(cast(navaids_points_vor_pt_spgjeu.title as varchar), '(' || navaids_points_vor_pt_spgjeu.nilreason[1] || ')') AS checkpointfacility,
    navaids_points_vor_pt_spgjeu.href AS checkpointfacility_href,
    lat_annotation.annotation as annotation
from navaids_points.checkpointvor 
inner join master_join mj2 on navaids_points.checkpointvor.id = mj2.source_id
inner join navaids_points.checkpointvor_tsp on mj2.target_id = navaids_points.checkpointvor_tsp.id
inner join navaids_points.checkpointvor_ts on navaids_points.checkpointvor_tsp.checkpointvortimeslice_id = navaids_points.checkpointvor_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_vklioj on navaids_points.checkpointvor_ts.position_id = geometry_elevatedpoint_view_vklioj.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_moksix on navaids_points.checkpointvor_ts.airportheliport_id = airport_heliport_airportheliport_pt_moksix.id
left join navaids_points.vor_pt navaids_points_vor_pt_spgjeu on navaids_points.checkpointvor_ts.checkpointfacility_id = navaids_points_vor_pt_spgjeu.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_rauhhy.*) AS annotation
  from master_join master_join_zfnsus
  join notes.note_view notes_note_view_rauhhy on master_join_zfnsus.target_id = notes_note_view_rauhhy.id
  where master_join_zfnsus.source_id = navaids_points.checkpointvor_ts.id
) as lat_annotation on TRUE
where navaids_points.checkpointvor.feature_status = 'APPROVED'
  and navaids_points.checkpointvor_ts.feature_status = 'APPROVED'
order by checkpointvor.identifier, checkpointvor_ts.sequence_number, checkpointvor_ts.correction_number DESC;
create index on navaids_points.checkpointvor_view (id);
-- CirclingAreaTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'geometry.surface_view', 'procedure.approachcondition_view', 'shared.aircraftcharacteristic_view']
drop materialized view if exists public.circlingarea_view cascade;
create materialized view public.circlingarea_view as
select distinct on (circlingarea.identifier,circlingarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    public.circlingarea.id,
    public.circlingarea_ts.id as ts_id,
    public.circlingarea_tsp.id as tsp_id,
    public.circlingarea.identifier,
    public.circlingarea_ts.interpretation,
    public.circlingarea_ts.sequence_number,
    public.circlingarea_ts.correction_number,
    public.circlingarea_ts.valid_time_begin,
    public.circlingarea_ts.valid_time_end,
    public.circlingarea_ts.feature_lifetime_begin,
    public.circlingarea_ts.feature_lifetime_end,
    geometry_surface_view_sqzndr.geom AS extent_geom,
    geometry_surface_view_sqzndr.horizontalAccuracy as extent_horizontalaccuracy,
    coalesce(cast(procedure_instrumentapproachprocedure_pt_dlqkwp.title as varchar), '(' || procedure_instrumentapproachprocedure_pt_dlqkwp.nilreason[1] || ')') AS approach,
    procedure_instrumentapproachprocedure_pt_dlqkwp.href AS approach_href,
    to_jsonb(shared_aircraftcharacteristic_view_waceck.*) AS aircraftcategory,
    lat_condition.lat_condition as condition,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation
from public.circlingarea 
inner join master_join mj2 on public.circlingarea.id = mj2.source_id
inner join public.circlingarea_tsp on mj2.target_id = public.circlingarea_tsp.id
inner join public.circlingarea_ts on public.circlingarea_tsp.circlingareatimeslice_id = public.circlingarea_ts.id
left join geometry.surface_view geometry_surface_view_sqzndr on public.circlingarea_ts.extent_id = geometry_surface_view_sqzndr.id
left join procedure.instrumentapproachprocedure_pt procedure_instrumentapproachprocedure_pt_dlqkwp on public.circlingarea_ts.approach_id = procedure_instrumentapproachprocedure_pt_dlqkwp.id
left join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_waceck on public.circlingarea_ts.aircraftcategory_id = shared_aircraftcharacteristic_view_waceck.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_approachcondition_view_hymdve.*) as lat_condition
  from master_join master_join_blvqha
  join procedure.approachcondition_view procedure_approachcondition_view_hymdve on master_join_blvqha.target_id = procedure_approachcondition_view_hymdve.id
  where master_join_blvqha.source_id = public.circlingarea_ts.id
) as lat_condition on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_tcxbca.*) as lat_designsurface
  from master_join master_join_ldsksu
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_tcxbca on master_join_ldsksu.target_id = shared_obstacleassessmentarea_view_tcxbca.id
  where master_join_ldsksu.source_id = public.circlingarea_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_iqfbgz.*) AS annotation
  from master_join master_join_zqixfb
  join notes.note_view notes_note_view_iqfbgz on master_join_zqixfb.target_id = notes_note_view_iqfbgz.id
  where master_join_zqixfb.source_id = public.circlingarea_ts.id
) as lat_annotation on TRUE
where public.circlingarea.feature_status = 'APPROVED'
  and public.circlingarea_ts.feature_status = 'APPROVED'
order by circlingarea.identifier, circlingarea_ts.sequence_number, circlingarea_ts.correction_number DESC;
create index on public.circlingarea_view (id);
-- DeicingAreaMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.deicingareamarking_view cascade;
create materialized view airport_heliport.deicingareamarking_view as
select distinct on (deicingareamarking.identifier,deicingareamarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.deicingareamarking.id,
    airport_heliport.deicingareamarking_ts.id as ts_id,
    airport_heliport.deicingareamarking_tsp.id as tsp_id,
    airport_heliport.deicingareamarking.identifier,
    airport_heliport.deicingareamarking_ts.interpretation,
    airport_heliport.deicingareamarking_ts.sequence_number,
    airport_heliport.deicingareamarking_ts.correction_number,
    airport_heliport.deicingareamarking_ts.valid_time_begin,
    airport_heliport.deicingareamarking_ts.valid_time_end,
    airport_heliport.deicingareamarking_ts.feature_lifetime_begin,
    airport_heliport.deicingareamarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.deicingareamarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.deicingareamarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.deicingareamarking_ts.condition_value as varchar), '(' || airport_heliport.deicingareamarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport_deicingarea_pt_vsdgjm.title as varchar), '(' || airport_heliport_deicingarea_pt_vsdgjm.nilreason[1] || ')') AS markeddeicingarea,
    airport_heliport_deicingarea_pt_vsdgjm.href AS markeddeicingarea_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.deicingareamarking 
inner join master_join mj2 on airport_heliport.deicingareamarking.id = mj2.source_id
inner join airport_heliport.deicingareamarking_tsp on mj2.target_id = airport_heliport.deicingareamarking_tsp.id
inner join airport_heliport.deicingareamarking_ts on airport_heliport.deicingareamarking_tsp.deicingareamarkingtimeslice_id = airport_heliport.deicingareamarking_ts.id
left join airport_heliport.deicingarea_pt airport_heliport_deicingarea_pt_vsdgjm on airport_heliport.deicingareamarking_ts.markeddeicingarea_id = airport_heliport_deicingarea_pt_vsdgjm.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_hmgfsr.*) as lat_element
  from master_join master_join_sepolp
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_hmgfsr on master_join_sepolp.target_id = airport_heliport_markingelement_view_hmgfsr.id
  where master_join_sepolp.source_id = airport_heliport.deicingareamarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wciyjs.*) AS annotation
  from master_join master_join_ezewpl
  join notes.note_view notes_note_view_wciyjs on master_join_ezewpl.target_id = notes_note_view_wciyjs.id
  where master_join_ezewpl.source_id = airport_heliport.deicingareamarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.deicingareamarking.feature_status = 'APPROVED'
  and airport_heliport.deicingareamarking_ts.feature_status = 'APPROVED'
order by deicingareamarking.identifier, deicingareamarking_ts.sequence_number, deicingareamarking_ts.correction_number DESC;
create index on airport_heliport.deicingareamarking_view (id);
-- DeicingAreaTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'airport_heliport.apronareaavailability_view', 'geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.deicingarea_view cascade;
create materialized view airport_heliport.deicingarea_view as
select distinct on (deicingarea.identifier,deicingarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.deicingarea.id,
    airport_heliport.deicingarea_ts.id as ts_id,
    airport_heliport.deicingarea_tsp.id as tsp_id,
    airport_heliport.deicingarea.identifier,
    airport_heliport.deicingarea_ts.interpretation,
    airport_heliport.deicingarea_ts.sequence_number,
    airport_heliport.deicingarea_ts.correction_number,
    airport_heliport.deicingarea_ts.valid_time_begin,
    airport_heliport.deicingarea_ts.valid_time_end,
    airport_heliport.deicingarea_ts.feature_lifetime_begin,
    airport_heliport.deicingarea_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport_apron_pt_tndnbc.title as varchar), '(' || airport_heliport_apron_pt_tndnbc.nilreason[1] || ')') AS associatedapron,
    airport_heliport_apron_pt_tndnbc.href AS associatedapron_href,
    coalesce(cast(airport_heliport_taxiway_pt_sahlkg.title as varchar), '(' || airport_heliport_taxiway_pt_sahlkg.nilreason[1] || ')') AS taxiwaylocation,
    airport_heliport_taxiway_pt_sahlkg.href AS taxiwaylocation_href,
    coalesce(cast(airport_heliport_aircraftstand_pt_golgcs.title as varchar), '(' || airport_heliport_aircraftstand_pt_golgcs.nilreason[1] || ')') AS standlocation,
    airport_heliport_aircraftstand_pt_golgcs.href AS standlocation_href,
    to_jsonb(airport_heliport_surfacecharacteristics_view_mggtgz.*) AS surfaceproperties,
    geometry_elevatedsurface_view_prqpqg.geom AS extent_geom,
    geometry_elevatedsurface_view_prqpqg.elevation AS extent_elevation,
    geometry_elevatedsurface_view_prqpqg.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_prqpqg.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_prqpqg.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_prqpqg.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.deicingarea 
inner join master_join mj2 on airport_heliport.deicingarea.id = mj2.source_id
inner join airport_heliport.deicingarea_tsp on mj2.target_id = airport_heliport.deicingarea_tsp.id
inner join airport_heliport.deicingarea_ts on airport_heliport.deicingarea_tsp.deicingareatimeslice_id = airport_heliport.deicingarea_ts.id
left join airport_heliport.apron_pt airport_heliport_apron_pt_tndnbc on airport_heliport.deicingarea_ts.associatedapron_id = airport_heliport_apron_pt_tndnbc.id
left join airport_heliport.taxiway_pt airport_heliport_taxiway_pt_sahlkg on airport_heliport.deicingarea_ts.taxiwaylocation_id = airport_heliport_taxiway_pt_sahlkg.id
left join airport_heliport.aircraftstand_pt airport_heliport_aircraftstand_pt_golgcs on airport_heliport.deicingarea_ts.standlocation_id = airport_heliport_aircraftstand_pt_golgcs.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_mggtgz on airport_heliport.deicingarea_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_mggtgz.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_prqpqg on airport_heliport.deicingarea_ts.extent_id = geometry_elevatedsurface_view_prqpqg.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_kigsjy.*) AS annotation
  from master_join master_join_zdvzmp
  join notes.note_view notes_note_view_kigsjy on master_join_zdvzmp.target_id = notes_note_view_kigsjy.id
  where master_join_zdvzmp.source_id = airport_heliport.deicingarea_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_apronareaavailability_view_xvsbfv.*) as lat_availability
  from master_join master_join_vcnpjy
  join airport_heliport.apronareaavailability_view airport_heliport_apronareaavailability_view_xvsbfv on master_join_vcnpjy.target_id = airport_heliport_apronareaavailability_view_xvsbfv.id
  where master_join_vcnpjy.source_id = airport_heliport.deicingarea_ts.id
) as lat_availability on TRUE
where airport_heliport.deicingarea.feature_status = 'APPROVED'
  and airport_heliport.deicingarea_ts.feature_status = 'APPROVED'
order by deicingarea.identifier, deicingarea_ts.sequence_number, deicingarea_ts.correction_number DESC;
create index on airport_heliport.deicingarea_view (id);
-- DepartureLegTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.aircraftcharacteristic_view', 'navaids_points.terminalsegmentpoint_view', 'procedure.departurearrivalcondition_view', 'geometry.curve_view', 'procedure.holdinguse_view']
drop materialized view if exists procedure.departureleg_view cascade;
create materialized view procedure.departureleg_view as
select distinct on (departureleg.identifier,departureleg_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.departureleg.id,
    procedure.departureleg_ts.id as ts_id,
    procedure.departureleg_tsp.id as tsp_id,
    procedure.departureleg.identifier,
    procedure.departureleg_ts.interpretation,
    procedure.departureleg_ts.sequence_number,
    procedure.departureleg_ts.correction_number,
    procedure.departureleg_ts.valid_time_begin,
    procedure.departureleg_ts.valid_time_end,
    procedure.departureleg_ts.feature_lifetime_begin,
    procedure.departureleg_ts.feature_lifetime_end,
    coalesce(cast(procedure.departureleg_ts.endconditiondesignator_value as varchar), '(' || procedure.departureleg_ts.endconditiondesignator_nilreason || ')') as endconditiondesignator,
    coalesce(cast(procedure.departureleg_ts.legpath_value as varchar), '(' || procedure.departureleg_ts.legpath_nilreason || ')') as legpath,
    coalesce(cast(procedure.departureleg_ts.legtypearinc_value as varchar), '(' || procedure.departureleg_ts.legtypearinc_nilreason || ')') as legtypearinc,
    coalesce(cast(procedure.departureleg_ts.course_value as varchar), '(' || procedure.departureleg_ts.course_nilreason || ')') as course,
    coalesce(cast(procedure.departureleg_ts.coursetype_value as varchar), '(' || procedure.departureleg_ts.coursetype_nilreason || ')') as coursetype,
    coalesce(cast(procedure.departureleg_ts.coursedirection_value as varchar), '(' || procedure.departureleg_ts.coursedirection_nilreason || ')') as coursedirection,
    coalesce(cast(procedure.departureleg_ts.turndirection_value as varchar), '(' || procedure.departureleg_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.departureleg_ts.speedreference_value as varchar), '(' || procedure.departureleg_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(procedure.departureleg_ts.speedinterpretation_value as varchar), '(' || procedure.departureleg_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(procedure.departureleg_ts.bankangle_value as varchar), '(' || procedure.departureleg_ts.bankangle_nilreason || ')') as bankangle,
    coalesce(cast(procedure.departureleg_ts.procedureturnrequired_value as varchar), '(' || procedure.departureleg_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.departureleg_ts.upperlimitreference_value as varchar), '(' || procedure.departureleg_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(procedure.departureleg_ts.lowerlimitreference_value as varchar), '(' || procedure.departureleg_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(procedure.departureleg_ts.altitudeinterpretation_value as varchar), '(' || procedure.departureleg_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(procedure.departureleg_ts.altitudeoverridereference_value as varchar), '(' || procedure.departureleg_ts.altitudeoverridereference_nilreason || ')') as altitudeoverridereference,
    coalesce(cast(procedure.departureleg_ts.verticalangle_value as varchar), '(' || procedure.departureleg_ts.verticalangle_nilreason || ')') as verticalangle,
    coalesce(cast(procedure.departureleg_ts.requirednavigationperformance_value as varchar), '(' || procedure.departureleg_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.departureleg_ts.speedlimit_value as varchar) || ' ' || procedure.departureleg_ts.speedlimit_uom, '(' || procedure.departureleg_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(procedure.departureleg_ts.length_value as varchar) || ' ' || procedure.departureleg_ts.length_uom, '(' || procedure.departureleg_ts.length_nilreason || ')') as length,
    coalesce(cast(procedure.departureleg_ts.duration_value as varchar) || ' ' || procedure.departureleg_ts.duration_uom, '(' || procedure.departureleg_ts.duration_nilreason || ')') as duration,
    coalesce(cast(procedure.departureleg_ts.upperlimitaltitude_value as varchar) || ' ' || procedure.departureleg_ts.upperlimitaltitude_uom, '(' || procedure.departureleg_ts.upperlimitaltitude_nilreason || ')') as upperlimitaltitude,
    coalesce(cast(procedure.departureleg_ts.lowerlimitaltitude_value as varchar) || ' ' || procedure.departureleg_ts.lowerlimitaltitude_uom, '(' || procedure.departureleg_ts.lowerlimitaltitude_nilreason || ')') as lowerlimitaltitude,
    coalesce(cast(procedure.departureleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.departureleg_ts.altitudeoverrideatc_uom, '(' || procedure.departureleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc,
    coalesce(cast(procedure.departureleg_ts.minimumobstacleclearancealtitude_value as varchar) || ' ' || procedure.departureleg_ts.minimumobstacleclearancealtitude_uom, '(' || procedure.departureleg_ts.minimumobstacleclearancealtitude_nilreason || ')') as minimumobstacleclearancealtitude,
    to_jsonb(navaids_points_terminalsegmentpoint_view_cktczd.*) AS startpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_pcuysx.*) AS endpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_qmineh.*) AS arccentre,
    geometry_curve_view_zogfdl.geom AS trajectory_geom,
    geometry_curve_view_zogfdl.horizontalAccuracy as trajectory_horizontalaccuracy,
    coalesce(cast(navaids_points_angleindication_pt_etmccn.title as varchar), '(' || navaids_points_angleindication_pt_etmccn.nilreason[1] || ')') AS angle,
    navaids_points_angleindication_pt_etmccn.href AS angle_href,
    coalesce(cast(navaids_points_distanceindication_pt_hzdrtk.title as varchar), '(' || navaids_points_distanceindication_pt_hzdrtk.nilreason[1] || ')') AS distance,
    navaids_points_distanceindication_pt_hzdrtk.href AS distance_href,
    to_jsonb(procedure_holdinguse_view_hohvwi.*) AS holding,
    coalesce(cast(procedure_standardinstrumentdeparture_pt_ozgcde.title as varchar), '(' || procedure_standardinstrumentdeparture_pt_ozgcde.nilreason[1] || ')') AS departure,
    procedure_standardinstrumentdeparture_pt_ozgcde.href AS departure_href,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation,
    lat_condition.lat_condition as condition
from procedure.departureleg 
inner join master_join mj2 on procedure.departureleg.id = mj2.source_id
inner join procedure.departureleg_tsp on mj2.target_id = procedure.departureleg_tsp.id
inner join procedure.departureleg_ts on procedure.departureleg_tsp.departurelegtimeslice_id = procedure.departureleg_ts.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_cktczd on procedure.departureleg_ts.startpoint_id = navaids_points_terminalsegmentpoint_view_cktczd.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_pcuysx on procedure.departureleg_ts.endpoint_id = navaids_points_terminalsegmentpoint_view_pcuysx.id
left join geometry.curve_view geometry_curve_view_zogfdl on procedure.departureleg_ts.trajectory_id = geometry_curve_view_zogfdl.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_qmineh on procedure.departureleg_ts.arccentre_id = navaids_points_terminalsegmentpoint_view_qmineh.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_etmccn on procedure.departureleg_ts.angle_id = navaids_points_angleindication_pt_etmccn.id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_hzdrtk on procedure.departureleg_ts.distance_id = navaids_points_distanceindication_pt_hzdrtk.id
left join procedure.holdinguse_view procedure_holdinguse_view_hohvwi on procedure.departureleg_ts.holding_id = procedure_holdinguse_view_hohvwi.id
left join procedure.standardinstrumentdeparture_pt procedure_standardinstrumentdeparture_pt_ozgcde on procedure.departureleg_ts.departure_id = procedure_standardinstrumentdeparture_pt_ozgcde.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_tkgeql.*) as lat_aircraftcategory
  from master_join master_join_imlwao
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_tkgeql on master_join_imlwao.target_id = shared_aircraftcharacteristic_view_tkgeql.id
  where master_join_imlwao.source_id = procedure.departureleg_ts.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_hjubkd.*) as lat_designsurface
  from master_join master_join_ykytdj
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_hjubkd on master_join_ykytdj.target_id = shared_obstacleassessmentarea_view_hjubkd.id
  where master_join_ykytdj.source_id = procedure.departureleg_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gsglfp.*) AS annotation
  from master_join master_join_jbwrel
  join notes.note_view notes_note_view_gsglfp on master_join_jbwrel.target_id = notes_note_view_gsglfp.id
  where master_join_jbwrel.source_id = procedure.departureleg_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_departurearrivalcondition_view_aqgoad.*) as lat_condition
  from master_join master_join_skdjel
  join procedure.departurearrivalcondition_view procedure_departurearrivalcondition_view_aqgoad on master_join_skdjel.target_id = procedure_departurearrivalcondition_view_aqgoad.id
  where master_join_skdjel.source_id = procedure.departureleg_ts.id
) as lat_condition on TRUE
where procedure.departureleg.feature_status = 'APPROVED'
  and procedure.departureleg_ts.feature_status = 'APPROVED'
order by departureleg.identifier, departureleg_ts.sequence_number, departureleg_ts.correction_number DESC;
create index on procedure.departureleg_view (id);
-- DesignatedPointTimeSliceType
-- ['notes.note_view', 'geometry.point_view']
drop materialized view if exists navaids_points.designatedpoint_view cascade;
create materialized view navaids_points.designatedpoint_view as
select distinct on (designatedpoint.identifier,designatedpoint_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.designatedpoint.id,
    navaids_points.designatedpoint_ts.id as ts_id,
    navaids_points.designatedpoint_tsp.id as tsp_id,
    navaids_points.designatedpoint.identifier,
    navaids_points.designatedpoint_ts.interpretation,
    navaids_points.designatedpoint_ts.sequence_number,
    navaids_points.designatedpoint_ts.correction_number,
    navaids_points.designatedpoint_ts.valid_time_begin,
    navaids_points.designatedpoint_ts.valid_time_end,
    navaids_points.designatedpoint_ts.feature_lifetime_begin,
    navaids_points.designatedpoint_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.designatedpoint_ts.designator_value as varchar), '(' || navaids_points.designatedpoint_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.designatedpoint_ts.type_value as varchar), '(' || navaids_points.designatedpoint_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.designatedpoint_ts.name_value as varchar), '(' || navaids_points.designatedpoint_ts.name_nilreason || ')') as name,
    geometry_point_view_cylgda.geom AS location_geom,
    geometry_point_view_cylgda.longitude AS location_longitude,
    geometry_point_view_cylgda.latitude AS location_latitude,
    geometry_point_view_cylgda.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_klgljs.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_klgljs.nilreason[1] || ')') AS aimingpoint,
    airport_heliport_touchdownliftoff_pt_klgljs.href AS aimingpoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_digyhh.title as varchar), '(' || airport_heliport_airportheliport_pt_digyhh.nilreason[1] || ')') AS airportheliport,
    airport_heliport_airportheliport_pt_digyhh.href AS airportheliport_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_rockxw.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_rockxw.nilreason[1] || ')') AS runwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_rockxw.href AS runwaypoint_href,
    lat_annotation.annotation as annotation
from navaids_points.designatedpoint 
inner join master_join mj2 on navaids_points.designatedpoint.id = mj2.source_id
inner join navaids_points.designatedpoint_tsp on mj2.target_id = navaids_points.designatedpoint_tsp.id
inner join navaids_points.designatedpoint_ts on navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = navaids_points.designatedpoint_ts.id
left join geometry.point_view geometry_point_view_cylgda on navaids_points.designatedpoint_ts.location_id = geometry_point_view_cylgda.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_klgljs on navaids_points.designatedpoint_ts.aimingpoint_id = airport_heliport_touchdownliftoff_pt_klgljs.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_digyhh on navaids_points.designatedpoint_ts.airportheliport_id = airport_heliport_airportheliport_pt_digyhh.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_rockxw on navaids_points.designatedpoint_ts.runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_rockxw.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_boshwe.*) AS annotation
  from master_join master_join_jllbui
  join notes.note_view notes_note_view_boshwe on master_join_jllbui.target_id = notes_note_view_boshwe.id
  where master_join_jllbui.source_id = navaids_points.designatedpoint_ts.id
) as lat_annotation on TRUE
where navaids_points.designatedpoint.feature_status = 'APPROVED'
  and navaids_points.designatedpoint_ts.feature_status = 'APPROVED'
order by designatedpoint.identifier, designatedpoint_ts.sequence_number, designatedpoint_ts.correction_number DESC;
create index on navaids_points.designatedpoint_view (id);
-- DirectionFinderTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.directionfinder_view cascade;
create materialized view navaids_points.directionfinder_view as
select distinct on (directionfinder.identifier,directionfinder_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.directionfinder.id,
    navaids_points.directionfinder_ts.id as ts_id,
    navaids_points.directionfinder_tsp.id as tsp_id,
    navaids_points.directionfinder.identifier,
    navaids_points.directionfinder_ts.interpretation,
    navaids_points.directionfinder_ts.sequence_number,
    navaids_points.directionfinder_ts.correction_number,
    navaids_points.directionfinder_ts.valid_time_begin,
    navaids_points.directionfinder_ts.valid_time_end,
    navaids_points.directionfinder_ts.feature_lifetime_begin,
    navaids_points.directionfinder_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.directionfinder_ts.designator_value as varchar), '(' || navaids_points.directionfinder_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.directionfinder_ts.name_value as varchar), '(' || navaids_points.directionfinder_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.directionfinder_ts.emissionclass_value as varchar), '(' || navaids_points.directionfinder_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.directionfinder_ts.mobile_value as varchar), '(' || navaids_points.directionfinder_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.directionfinder_ts.magneticvariation_value as varchar), '(' || navaids_points.directionfinder_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.directionfinder_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.directionfinder_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.directionfinder_ts.datemagneticvariation_value as varchar), '(' || navaids_points.directionfinder_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.directionfinder_ts.flightchecked_value as varchar), '(' || navaids_points.directionfinder_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.directionfinder_ts.doppler_value as varchar), '(' || navaids_points.directionfinder_ts.doppler_nilreason || ')') as doppler,
    geometry_elevatedpoint_view_vnrhvz.geom AS location_geom,
    geometry_elevatedpoint_view_vnrhvz.longitude AS location_longitude,
    geometry_elevatedpoint_view_vnrhvz.latitude AS location_latitude,
    geometry_elevatedpoint_view_vnrhvz.elevation AS location_elevation,
    geometry_elevatedpoint_view_vnrhvz.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_vnrhvz.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_vnrhvz.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_vnrhvz.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_informationprovision.lat_informationprovision as informationprovision
from navaids_points.directionfinder 
inner join master_join mj2 on navaids_points.directionfinder.id = mj2.source_id
inner join navaids_points.directionfinder_tsp on mj2.target_id = navaids_points.directionfinder_tsp.id
inner join navaids_points.directionfinder_ts on navaids_points.directionfinder_tsp.directionfindertimeslice_id = navaids_points.directionfinder_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_vnrhvz on navaids_points.directionfinder_ts.location_id = geometry_elevatedpoint_view_vnrhvz.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_nctpqc.*) as lat_authority
  from master_join master_join_fkjltd
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_nctpqc on master_join_fkjltd.target_id = navaids_points_authorityfornavaidequipment_view_nctpqc.id
  where master_join_fkjltd.source_id = navaids_points.directionfinder_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_aqaczf.*) as lat_monitoring
  from master_join master_join_senazp
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_aqaczf on master_join_senazp.target_id = navaids_points_navaidequipmentmonitoring_view_aqaczf.id
  where master_join_senazp.source_id = navaids_points.directionfinder_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_hsjvim.*) as lat_availability
  from master_join master_join_jduclt
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_hsjvim on master_join_jduclt.target_id = navaids_points_navaidoperationalstatus_view_hsjvim.id
  where master_join_jduclt.source_id = navaids_points.directionfinder_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qungkq.*) AS annotation
  from master_join master_join_oildjn
  join notes.note_view notes_note_view_qungkq on master_join_oildjn.target_id = notes_note_view_qungkq.id
  where master_join_oildjn.source_id = navaids_points.directionfinder_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_informationservice_pt_btkyjd.id,
      'title', coalesce(cast(service_informationservice_pt_btkyjd.title AS varchar), '(' || service_informationservice_pt_btkyjd.nilreason[1] || ')'),
      'href', service_informationservice_pt_btkyjd.href
  )) as lat_informationprovision  from master_join master_join_pteimb
  join service.informationservice_pt service_informationservice_pt_btkyjd on master_join_pteimb.target_id = service_informationservice_pt_btkyjd.id
  where master_join_pteimb.source_id = navaids_points.directionfinder_ts.id
) as lat_informationprovision on TRUE
where navaids_points.directionfinder.feature_status = 'APPROVED'
  and navaids_points.directionfinder_ts.feature_status = 'APPROVED'
order by directionfinder.identifier, directionfinder_ts.sequence_number, directionfinder_ts.correction_number DESC;
create index on navaids_points.directionfinder_view (id);
-- DistanceIndicationTimeSliceType
-- ['notes.note_view', 'geometry.point_view']
drop materialized view if exists navaids_points.distanceindication_view cascade;
create materialized view navaids_points.distanceindication_view as
select distinct on (distanceindication.identifier,distanceindication_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.distanceindication.id,
    navaids_points.distanceindication_ts.id as ts_id,
    navaids_points.distanceindication_tsp.id as tsp_id,
    navaids_points.distanceindication.identifier,
    navaids_points.distanceindication_ts.interpretation,
    navaids_points.distanceindication_ts.sequence_number,
    navaids_points.distanceindication_ts.correction_number,
    navaids_points.distanceindication_ts.valid_time_begin,
    navaids_points.distanceindication_ts.valid_time_end,
    navaids_points.distanceindication_ts.feature_lifetime_begin,
    navaids_points.distanceindication_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.distanceindication_ts.type_value as varchar), '(' || navaids_points.distanceindication_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.distanceindication_ts.distance_value as varchar) || ' ' || navaids_points.distanceindication_ts.distance_uom, '(' || navaids_points.distanceindication_ts.distance_nilreason || ')') as distance,
    coalesce(cast(navaids_points.distanceindication_ts.minimumreceptionaltitude_value as varchar) || ' ' || navaids_points.distanceindication_ts.minimumreceptionaltitude_uom, '(' || navaids_points.distanceindication_ts.minimumreceptionaltitude_nilreason || ')') as minimumreceptionaltitude,
    coalesce(cast(navaids_points_designatedpoint_pt_adovoi.title as varchar), '(' || navaids_points_designatedpoint_pt_adovoi.nilreason[1] || ')') AS fix,
    navaids_points_designatedpoint_pt_adovoi.href AS fix_href,
    coalesce(cast(navaids_points_designatedpoint_pt_yykxin.title as varchar), '(' || navaids_points_designatedpoint_pt_yykxin.nilreason[1] || ')') AS pointchoicefixdesignatedpoint,
    navaids_points_designatedpoint_pt_yykxin.href AS pointchoicefixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_xklrth.title as varchar), '(' || navaids_points_navaid_pt_xklrth.nilreason[1] || ')') AS pointchoicenavaidsystem,
    navaids_points_navaid_pt_xklrth.href AS pointchoicenavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_ngiohu.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_ngiohu.nilreason[1] || ')') AS pointchoiceaimingpoint,
    airport_heliport_touchdownliftoff_pt_ngiohu.href AS pointchoiceaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_rreksr.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_rreksr.nilreason[1] || ')') AS pointchoicerunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_rreksr.href AS pointchoicerunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_qxxpkq.title as varchar), '(' || airport_heliport_airportheliport_pt_qxxpkq.nilreason[1] || ')') AS pointchoiceairportreferencepoint,
    airport_heliport_airportheliport_pt_qxxpkq.href AS pointchoiceairportreferencepoint_href,
    geometry_point_view_pkxcau.geom AS pointchoiceposition_geom,
    geometry_point_view_pkxcau.longitude AS pointchoiceposition_longitude,
    geometry_point_view_pkxcau.latitude AS pointchoiceposition_latitude,
    geometry_point_view_pkxcau.horizontalAccuracy AS pointchoiceposition_horizontalaccuracy,
    lat_annotation.annotation as annotation
from navaids_points.distanceindication 
inner join master_join mj2 on navaids_points.distanceindication.id = mj2.source_id
inner join navaids_points.distanceindication_tsp on mj2.target_id = navaids_points.distanceindication_tsp.id
inner join navaids_points.distanceindication_ts on navaids_points.distanceindication_tsp.distanceindicationtimeslice_id = navaids_points.distanceindication_ts.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_adovoi on navaids_points.distanceindication_ts.fix_id = navaids_points_designatedpoint_pt_adovoi.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_yykxin on navaids_points.distanceindication_ts.distanceindication_ts_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_yykxin.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_xklrth on navaids_points.distanceindication_ts.distanceindication_ts_navaidsystem_id = navaids_points_navaid_pt_xklrth.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_ngiohu on navaids_points.distanceindication_ts.distanceindication_ts_aimingpoint_id = airport_heliport_touchdownliftoff_pt_ngiohu.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_rreksr on navaids_points.distanceindication_ts.distanceindication_ts_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_rreksr.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_qxxpkq on navaids_points.distanceindication_ts.distanceindication_ts_airportreferencepoint_id = airport_heliport_airportheliport_pt_qxxpkq.id
left join geometry.point_view geometry_point_view_pkxcau on navaids_points.distanceindication_ts.distanceindication_ts_position_id = geometry_point_view_pkxcau.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jbalck.*) AS annotation
  from master_join master_join_gdaywj
  join notes.note_view notes_note_view_jbalck on master_join_gdaywj.target_id = notes_note_view_jbalck.id
  where master_join_gdaywj.source_id = navaids_points.distanceindication_ts.id
) as lat_annotation on TRUE
where navaids_points.distanceindication.feature_status = 'APPROVED'
  and navaids_points.distanceindication_ts.feature_status = 'APPROVED'
order by distanceindication.identifier, distanceindication_ts.sequence_number, distanceindication_ts.correction_number DESC;
create index on navaids_points.distanceindication_view (id);
-- DMETimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.dme_view cascade;
create materialized view navaids_points.dme_view as
select distinct on (dme.identifier,dme_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.dme.id,
    navaids_points.dme_ts.id as ts_id,
    navaids_points.dme_tsp.id as tsp_id,
    navaids_points.dme.identifier,
    navaids_points.dme_ts.interpretation,
    navaids_points.dme_ts.sequence_number,
    navaids_points.dme_ts.correction_number,
    navaids_points.dme_ts.valid_time_begin,
    navaids_points.dme_ts.valid_time_end,
    navaids_points.dme_ts.feature_lifetime_begin,
    navaids_points.dme_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.dme_ts.designator_value as varchar), '(' || navaids_points.dme_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.dme_ts.name_value as varchar), '(' || navaids_points.dme_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.dme_ts.emissionclass_value as varchar), '(' || navaids_points.dme_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.dme_ts.mobile_value as varchar), '(' || navaids_points.dme_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.dme_ts.magneticvariation_value as varchar), '(' || navaids_points.dme_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.dme_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.dme_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.dme_ts.datemagneticvariation_value as varchar), '(' || navaids_points.dme_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.dme_ts.flightchecked_value as varchar), '(' || navaids_points.dme_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.dme_ts.type_value as varchar), '(' || navaids_points.dme_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.dme_ts.channel_value as varchar), '(' || navaids_points.dme_ts.channel_nilreason || ')') as channel,
    coalesce(cast(navaids_points.dme_ts.ghostfrequency_value as varchar) || ' ' || navaids_points.dme_ts.ghostfrequency_uom, '(' || navaids_points.dme_ts.ghostfrequency_nilreason || ')') as ghostfrequency,
    coalesce(cast(navaids_points.dme_ts.displace_value as varchar) || ' ' || navaids_points.dme_ts.displace_uom, '(' || navaids_points.dme_ts.displace_nilreason || ')') as displace,
    geometry_elevatedpoint_view_oozijx.geom AS location_geom,
    geometry_elevatedpoint_view_oozijx.longitude AS location_longitude,
    geometry_elevatedpoint_view_oozijx.latitude AS location_latitude,
    geometry_elevatedpoint_view_oozijx.elevation AS location_elevation,
    geometry_elevatedpoint_view_oozijx.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_oozijx.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_oozijx.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_oozijx.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.dme 
inner join master_join mj2 on navaids_points.dme.id = mj2.source_id
inner join navaids_points.dme_tsp on mj2.target_id = navaids_points.dme_tsp.id
inner join navaids_points.dme_ts on navaids_points.dme_tsp.dmetimeslice_id = navaids_points.dme_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_oozijx on navaids_points.dme_ts.location_id = geometry_elevatedpoint_view_oozijx.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_qafptk.*) as lat_authority
  from master_join master_join_zkpumr
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_qafptk on master_join_zkpumr.target_id = navaids_points_authorityfornavaidequipment_view_qafptk.id
  where master_join_zkpumr.source_id = navaids_points.dme_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_okxvtw.*) as lat_monitoring
  from master_join master_join_gdbtap
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_okxvtw on master_join_gdbtap.target_id = navaids_points_navaidequipmentmonitoring_view_okxvtw.id
  where master_join_gdbtap.source_id = navaids_points.dme_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_vvqgph.*) as lat_availability
  from master_join master_join_ogrtnq
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_vvqgph on master_join_ogrtnq.target_id = navaids_points_navaidoperationalstatus_view_vvqgph.id
  where master_join_ogrtnq.source_id = navaids_points.dme_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_asayeq.*) AS annotation
  from master_join master_join_mgleoj
  join notes.note_view notes_note_view_asayeq on master_join_mgleoj.target_id = notes_note_view_asayeq.id
  where master_join_mgleoj.source_id = navaids_points.dme_ts.id
) as lat_annotation on TRUE
where navaids_points.dme.feature_status = 'APPROVED'
  and navaids_points.dme_ts.feature_status = 'APPROVED'
order by dme.identifier, dme_ts.sequence_number, dme_ts.correction_number DESC;
create index on navaids_points.dme_view (id);
-- ElevationTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.elevation_view cascade;
create materialized view navaids_points.elevation_view as
select distinct on (elevation.identifier,elevation_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.elevation.id,
    navaids_points.elevation_ts.id as ts_id,
    navaids_points.elevation_tsp.id as tsp_id,
    navaids_points.elevation.identifier,
    navaids_points.elevation_ts.interpretation,
    navaids_points.elevation_ts.sequence_number,
    navaids_points.elevation_ts.correction_number,
    navaids_points.elevation_ts.valid_time_begin,
    navaids_points.elevation_ts.valid_time_end,
    navaids_points.elevation_ts.feature_lifetime_begin,
    navaids_points.elevation_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.elevation_ts.designator_value as varchar), '(' || navaids_points.elevation_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.elevation_ts.name_value as varchar), '(' || navaids_points.elevation_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.elevation_ts.emissionclass_value as varchar), '(' || navaids_points.elevation_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.elevation_ts.mobile_value as varchar), '(' || navaids_points.elevation_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.elevation_ts.magneticvariation_value as varchar), '(' || navaids_points.elevation_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.elevation_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.elevation_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.elevation_ts.datemagneticvariation_value as varchar), '(' || navaids_points.elevation_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.elevation_ts.flightchecked_value as varchar), '(' || navaids_points.elevation_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.elevation_ts.anglenominal_value as varchar), '(' || navaids_points.elevation_ts.anglenominal_nilreason || ')') as anglenominal,
    coalesce(cast(navaids_points.elevation_ts.angleminimum_value as varchar), '(' || navaids_points.elevation_ts.angleminimum_nilreason || ')') as angleminimum,
    coalesce(cast(navaids_points.elevation_ts.anglespan_value as varchar), '(' || navaids_points.elevation_ts.anglespan_nilreason || ')') as anglespan,
    coalesce(cast(navaids_points.elevation_ts.angleaccuracy_value as varchar), '(' || navaids_points.elevation_ts.angleaccuracy_nilreason || ')') as angleaccuracy,
    geometry_elevatedpoint_view_hvzsth.geom AS location_geom,
    geometry_elevatedpoint_view_hvzsth.longitude AS location_longitude,
    geometry_elevatedpoint_view_hvzsth.latitude AS location_latitude,
    geometry_elevatedpoint_view_hvzsth.elevation AS location_elevation,
    geometry_elevatedpoint_view_hvzsth.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_hvzsth.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_hvzsth.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_hvzsth.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.elevation 
inner join master_join mj2 on navaids_points.elevation.id = mj2.source_id
inner join navaids_points.elevation_tsp on mj2.target_id = navaids_points.elevation_tsp.id
inner join navaids_points.elevation_ts on navaids_points.elevation_tsp.elevationtimeslice_id = navaids_points.elevation_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_hvzsth on navaids_points.elevation_ts.location_id = geometry_elevatedpoint_view_hvzsth.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_xfwfqc.*) as lat_authority
  from master_join master_join_jxijwa
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_xfwfqc on master_join_jxijwa.target_id = navaids_points_authorityfornavaidequipment_view_xfwfqc.id
  where master_join_jxijwa.source_id = navaids_points.elevation_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_ykgxrm.*) as lat_monitoring
  from master_join master_join_jrpqxn
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_ykgxrm on master_join_jrpqxn.target_id = navaids_points_navaidequipmentmonitoring_view_ykgxrm.id
  where master_join_jrpqxn.source_id = navaids_points.elevation_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_zjtuss.*) as lat_availability
  from master_join master_join_hbdgsi
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_zjtuss on master_join_hbdgsi.target_id = navaids_points_navaidoperationalstatus_view_zjtuss.id
  where master_join_hbdgsi.source_id = navaids_points.elevation_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_scvjmq.*) AS annotation
  from master_join master_join_megsvr
  join notes.note_view notes_note_view_scvjmq on master_join_megsvr.target_id = notes_note_view_scvjmq.id
  where master_join_megsvr.source_id = navaids_points.elevation_ts.id
) as lat_annotation on TRUE
where navaids_points.elevation.feature_status = 'APPROVED'
  and navaids_points.elevation_ts.feature_status = 'APPROVED'
order by elevation.identifier, elevation_ts.sequence_number, elevation_ts.correction_number DESC;
create index on navaids_points.elevation_view (id);
-- FinalLegTimeSliceType
-- ['public.fasdatablock_view', 'shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.aircraftcharacteristic_view', 'navaids_points.terminalsegmentpoint_view', 'geometry.point_view', 'procedure.approachcondition_view', 'geometry.curve_view', 'procedure.holdinguse_view']
drop materialized view if exists procedure.finalleg_view cascade;
create materialized view procedure.finalleg_view as
select distinct on (finalleg.identifier,finalleg_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.finalleg.id,
    procedure.finalleg_ts.id as ts_id,
    procedure.finalleg_tsp.id as tsp_id,
    procedure.finalleg.identifier,
    procedure.finalleg_ts.interpretation,
    procedure.finalleg_ts.sequence_number,
    procedure.finalleg_ts.correction_number,
    procedure.finalleg_ts.valid_time_begin,
    procedure.finalleg_ts.valid_time_end,
    procedure.finalleg_ts.feature_lifetime_begin,
    procedure.finalleg_ts.feature_lifetime_end,
    coalesce(cast(procedure.finalleg_ts.endconditiondesignator_value as varchar), '(' || procedure.finalleg_ts.endconditiondesignator_nilreason || ')') as endconditiondesignator,
    coalesce(cast(procedure.finalleg_ts.legpath_value as varchar), '(' || procedure.finalleg_ts.legpath_nilreason || ')') as legpath,
    coalesce(cast(procedure.finalleg_ts.legtypearinc_value as varchar), '(' || procedure.finalleg_ts.legtypearinc_nilreason || ')') as legtypearinc,
    coalesce(cast(procedure.finalleg_ts.course_value as varchar), '(' || procedure.finalleg_ts.course_nilreason || ')') as course,
    coalesce(cast(procedure.finalleg_ts.coursetype_value as varchar), '(' || procedure.finalleg_ts.coursetype_nilreason || ')') as coursetype,
    coalesce(cast(procedure.finalleg_ts.coursedirection_value as varchar), '(' || procedure.finalleg_ts.coursedirection_nilreason || ')') as coursedirection,
    coalesce(cast(procedure.finalleg_ts.turndirection_value as varchar), '(' || procedure.finalleg_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.finalleg_ts.speedreference_value as varchar), '(' || procedure.finalleg_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(procedure.finalleg_ts.speedinterpretation_value as varchar), '(' || procedure.finalleg_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(procedure.finalleg_ts.bankangle_value as varchar), '(' || procedure.finalleg_ts.bankangle_nilreason || ')') as bankangle,
    coalesce(cast(procedure.finalleg_ts.procedureturnrequired_value as varchar), '(' || procedure.finalleg_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.finalleg_ts.upperlimitreference_value as varchar), '(' || procedure.finalleg_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(procedure.finalleg_ts.lowerlimitreference_value as varchar), '(' || procedure.finalleg_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(procedure.finalleg_ts.altitudeinterpretation_value as varchar), '(' || procedure.finalleg_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(procedure.finalleg_ts.altitudeoverridereference_value as varchar), '(' || procedure.finalleg_ts.altitudeoverridereference_nilreason || ')') as altitudeoverridereference,
    coalesce(cast(procedure.finalleg_ts.verticalangle_value as varchar), '(' || procedure.finalleg_ts.verticalangle_nilreason || ')') as verticalangle,
    coalesce(cast(procedure.finalleg_ts.guidancesystem_value as varchar), '(' || procedure.finalleg_ts.guidancesystem_nilreason || ')') as guidancesystem,
    coalesce(cast(procedure.finalleg_ts.landingsystemcategory_value as varchar), '(' || procedure.finalleg_ts.landingsystemcategory_nilreason || ')') as landingsystemcategory,
    coalesce(cast(procedure.finalleg_ts.rnpdmeauthorized_value as varchar), '(' || procedure.finalleg_ts.rnpdmeauthorized_nilreason || ')') as rnpdmeauthorized,
    coalesce(cast(procedure.finalleg_ts.courseoffsetangle_value as varchar), '(' || procedure.finalleg_ts.courseoffsetangle_nilreason || ')') as courseoffsetangle,
    coalesce(cast(procedure.finalleg_ts.courseoffsetside_value as varchar), '(' || procedure.finalleg_ts.courseoffsetside_nilreason || ')') as courseoffsetside,
    coalesce(cast(procedure.finalleg_ts.coursecentrelineintersect_value as varchar), '(' || procedure.finalleg_ts.coursecentrelineintersect_nilreason || ')') as coursecentrelineintersect,
    coalesce(cast(procedure.finalleg_ts.speedlimit_value as varchar) || ' ' || procedure.finalleg_ts.speedlimit_uom, '(' || procedure.finalleg_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(procedure.finalleg_ts.length_value as varchar) || ' ' || procedure.finalleg_ts.length_uom, '(' || procedure.finalleg_ts.length_nilreason || ')') as length,
    coalesce(cast(procedure.finalleg_ts.duration_value as varchar) || ' ' || procedure.finalleg_ts.duration_uom, '(' || procedure.finalleg_ts.duration_nilreason || ')') as duration,
    coalesce(cast(procedure.finalleg_ts.upperlimitaltitude_value as varchar) || ' ' || procedure.finalleg_ts.upperlimitaltitude_uom, '(' || procedure.finalleg_ts.upperlimitaltitude_nilreason || ')') as upperlimitaltitude,
    coalesce(cast(procedure.finalleg_ts.lowerlimitaltitude_value as varchar) || ' ' || procedure.finalleg_ts.lowerlimitaltitude_uom, '(' || procedure.finalleg_ts.lowerlimitaltitude_nilreason || ')') as lowerlimitaltitude,
    coalesce(cast(procedure.finalleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.finalleg_ts.altitudeoverrideatc_uom, '(' || procedure.finalleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc,
    coalesce(cast(procedure.finalleg_ts.minimumbarovnavtemperature_value as varchar) || ' ' || procedure.finalleg_ts.minimumbarovnavtemperature_uom, '(' || procedure.finalleg_ts.minimumbarovnavtemperature_nilreason || ')') as minimumbarovnavtemperature,
    coalesce(cast(procedure.finalleg_ts.coursecentrelinedistance_value as varchar) || ' ' || procedure.finalleg_ts.coursecentrelinedistance_uom, '(' || procedure.finalleg_ts.coursecentrelinedistance_nilreason || ')') as coursecentrelinedistance,
    coalesce(cast(procedure.finalleg_ts.courseoffsetdistance_value as varchar) || ' ' || procedure.finalleg_ts.courseoffsetdistance_uom, '(' || procedure.finalleg_ts.courseoffsetdistance_nilreason || ')') as courseoffsetdistance,
    to_jsonb(navaids_points_terminalsegmentpoint_view_eiihpa.*) AS startpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_gtprzf.*) AS endpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_hvrzrj.*) AS arccentre,
    to_jsonb(navaids_points_terminalsegmentpoint_view_vrzkki.*) AS visualdescentpoint,
    geometry_curve_view_obvunm.geom AS trajectory_geom,
    geometry_curve_view_obvunm.horizontalAccuracy as trajectory_horizontalaccuracy,
    coalesce(cast(navaids_points_angleindication_pt_hwmhfw.title as varchar), '(' || navaids_points_angleindication_pt_hwmhfw.nilreason[1] || ')') AS angle,
    navaids_points_angleindication_pt_hwmhfw.href AS angle_href,
    coalesce(cast(navaids_points_distanceindication_pt_argpkb.title as varchar), '(' || navaids_points_distanceindication_pt_argpkb.nilreason[1] || ')') AS distance,
    navaids_points_distanceindication_pt_argpkb.href AS distance_href,
    to_jsonb(procedure_holdinguse_view_cmmand.*) AS holding,
    coalesce(cast(procedure_instrumentapproachprocedure_pt_gunwnz.title as varchar), '(' || procedure_instrumentapproachprocedure_pt_gunwnz.nilreason[1] || ')') AS approach,
    procedure_instrumentapproachprocedure_pt_gunwnz.href AS approach_href,
    coalesce(cast(navaids_points_designatedpoint_pt_stirbp.title as varchar), '(' || navaids_points_designatedpoint_pt_stirbp.nilreason[1] || ')') AS finalpathalignmentpointfixdesignatedpoint,
    navaids_points_designatedpoint_pt_stirbp.href AS finalpathalignmentpointfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_lsllab.title as varchar), '(' || navaids_points_navaid_pt_lsllab.nilreason[1] || ')') AS finalpathalignmentpointnavaidsystem,
    navaids_points_navaid_pt_lsllab.href AS finalpathalignmentpointnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_fewwnq.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_fewwnq.nilreason[1] || ')') AS finalpathalignmentpointaimingpoint,
    airport_heliport_touchdownliftoff_pt_fewwnq.href AS finalpathalignmentpointaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_jqlndy.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_jqlndy.nilreason[1] || ')') AS finalpathalignmentpointrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_jqlndy.href AS finalpathalignmentpointrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_kbnzul.title as varchar), '(' || airport_heliport_airportheliport_pt_kbnzul.nilreason[1] || ')') AS finalpathalignmentpointairportreferencepoint,
    airport_heliport_airportheliport_pt_kbnzul.href AS finalpathalignmentpointairportreferencepoint_href,
    geometry_point_view_ejwdfs.geom AS finalpathalignmentpointposition_geom,
    geometry_point_view_ejwdfs.longitude AS finalpathalignmentpointposition_longitude,
    geometry_point_view_ejwdfs.latitude AS finalpathalignmentpointposition_latitude,
    geometry_point_view_ejwdfs.horizontalAccuracy AS finalpathalignmentpointposition_horizontalaccuracy,
    to_jsonb(public_fasdatablock_view_lqezgd.*) AS fasdata,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation,
    lat_condition.lat_condition as condition
from procedure.finalleg 
inner join master_join mj2 on procedure.finalleg.id = mj2.source_id
inner join procedure.finalleg_tsp on mj2.target_id = procedure.finalleg_tsp.id
inner join procedure.finalleg_ts on procedure.finalleg_tsp.finallegtimeslice_id = procedure.finalleg_ts.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_eiihpa on procedure.finalleg_ts.startpoint_id = navaids_points_terminalsegmentpoint_view_eiihpa.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_gtprzf on procedure.finalleg_ts.endpoint_id = navaids_points_terminalsegmentpoint_view_gtprzf.id
left join geometry.curve_view geometry_curve_view_obvunm on procedure.finalleg_ts.trajectory_id = geometry_curve_view_obvunm.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_hvrzrj on procedure.finalleg_ts.arccentre_id = navaids_points_terminalsegmentpoint_view_hvrzrj.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_hwmhfw on procedure.finalleg_ts.angle_id = navaids_points_angleindication_pt_hwmhfw.id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_argpkb on procedure.finalleg_ts.distance_id = navaids_points_distanceindication_pt_argpkb.id
left join procedure.holdinguse_view procedure_holdinguse_view_cmmand on procedure.finalleg_ts.holding_id = procedure_holdinguse_view_cmmand.id
left join procedure.instrumentapproachprocedure_pt procedure_instrumentapproachprocedure_pt_gunwnz on procedure.finalleg_ts.approach_id = procedure_instrumentapproachprocedure_pt_gunwnz.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_stirbp on procedure.finalleg_ts.finalpathalignmentpoint_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_stirbp.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_lsllab on procedure.finalleg_ts.finalpathalignmentpoint_navaidsystem_id = navaids_points_navaid_pt_lsllab.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_fewwnq on procedure.finalleg_ts.finalpathalignmentpoint_aimingpoint_id = airport_heliport_touchdownliftoff_pt_fewwnq.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_jqlndy on procedure.finalleg_ts.finalpathalignmentpoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_jqlndy.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_kbnzul on procedure.finalleg_ts.finalpathalignmentpoint_airportreferencepoint_id = airport_heliport_airportheliport_pt_kbnzul.id
left join geometry.point_view geometry_point_view_ejwdfs on procedure.finalleg_ts.finalpathalignmentpoint_position_id = geometry_point_view_ejwdfs.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_vrzkki on procedure.finalleg_ts.visualdescentpoint_id = navaids_points_terminalsegmentpoint_view_vrzkki.id
left join public.fasdatablock_view public_fasdatablock_view_lqezgd on procedure.finalleg_ts.fasdata_id = public_fasdatablock_view_lqezgd.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_qazuzt.*) as lat_aircraftcategory
  from master_join master_join_kebjyg
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_qazuzt on master_join_kebjyg.target_id = shared_aircraftcharacteristic_view_qazuzt.id
  where master_join_kebjyg.source_id = procedure.finalleg_ts.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_gymlxt.*) as lat_designsurface
  from master_join master_join_ufmwhr
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_gymlxt on master_join_ufmwhr.target_id = shared_obstacleassessmentarea_view_gymlxt.id
  where master_join_ufmwhr.source_id = procedure.finalleg_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_nmyavx.*) AS annotation
  from master_join master_join_ojgqmt
  join notes.note_view notes_note_view_nmyavx on master_join_ojgqmt.target_id = notes_note_view_nmyavx.id
  where master_join_ojgqmt.source_id = procedure.finalleg_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_approachcondition_view_gyboym.*) as lat_condition
  from master_join master_join_befrjm
  join procedure.approachcondition_view procedure_approachcondition_view_gyboym on master_join_befrjm.target_id = procedure_approachcondition_view_gyboym.id
  where master_join_befrjm.source_id = procedure.finalleg_ts.id
) as lat_condition on TRUE
where procedure.finalleg.feature_status = 'APPROVED'
  and procedure.finalleg_ts.feature_status = 'APPROVED'
order by finalleg.identifier, finalleg_ts.sequence_number, finalleg_ts.correction_number DESC;
create index on procedure.finalleg_view (id);
-- FireFightingServiceTimeSliceType
-- ['geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.firefightingservice_view cascade;
create materialized view service.firefightingservice_view as
select distinct on (firefightingservice.identifier,firefightingservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.firefightingservice.id,
    service.firefightingservice_ts.id as ts_id,
    service.firefightingservice_tsp.id as tsp_id,
    service.firefightingservice.identifier,
    service.firefightingservice_ts.interpretation,
    service.firefightingservice_ts.sequence_number,
    service.firefightingservice_ts.correction_number,
    service.firefightingservice_ts.valid_time_begin,
    service.firefightingservice_ts.valid_time_end,
    service.firefightingservice_ts.feature_lifetime_begin,
    service.firefightingservice_ts.feature_lifetime_end,
    coalesce(cast(service.firefightingservice_ts.flightoperations_value as varchar), '(' || service.firefightingservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.firefightingservice_ts.rank_value as varchar), '(' || service.firefightingservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.firefightingservice_ts.complianticao_value as varchar), '(' || service.firefightingservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.firefightingservice_ts.name_value as varchar), '(' || service.firefightingservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.firefightingservice_ts.category_value as varchar), '(' || service.firefightingservice_ts.category_nilreason || ')') as category,
    coalesce(cast(service.firefightingservice_ts.standard_value as varchar), '(' || service.firefightingservice_ts.standard_nilreason || ')') as standard,
    geometry_elevatedpoint_view_ecagoa.geom AS location_geom,
    geometry_elevatedpoint_view_ecagoa.longitude AS location_longitude,
    geometry_elevatedpoint_view_ecagoa.latitude AS location_latitude,
    geometry_elevatedpoint_view_ecagoa.elevation AS location_elevation,
    geometry_elevatedpoint_view_ecagoa.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_ecagoa.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_ecagoa.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_ecagoa.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_lvqfxy.title as varchar), '(' || organisation_unit_pt_lvqfxy.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_lvqfxy.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_airportheliport.lat_airportheliport as airportheliport
from service.firefightingservice 
inner join master_join mj2 on service.firefightingservice.id = mj2.source_id
inner join service.firefightingservice_tsp on mj2.target_id = service.firefightingservice_tsp.id
inner join service.firefightingservice_ts on service.firefightingservice_tsp.firefightingservicetimeslice_id = service.firefightingservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_ecagoa on service.firefightingservice_ts.location_id = geometry_elevatedpoint_view_ecagoa.id
left join organisation.unit_pt organisation_unit_pt_lvqfxy on service.firefightingservice_ts.serviceprovider_id = organisation_unit_pt_lvqfxy.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_wjsnpg.*) as lat_callsign
  from master_join master_join_rzeklp
  join service.callsigndetail_view service_callsigndetail_view_wjsnpg on master_join_rzeklp.target_id = service_callsigndetail_view_wjsnpg.id
  where master_join_rzeklp.source_id = service.firefightingservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_pnzqzu.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_pnzqzu.title AS varchar), '(' || service_radiocommunicationchannel_pt_pnzqzu.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_pnzqzu.href
  )) as lat_radiocommunication  from master_join master_join_qpenbg
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_pnzqzu on master_join_qpenbg.target_id = service_radiocommunicationchannel_pt_pnzqzu.id
  where master_join_qpenbg.source_id = service.firefightingservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_srbkkc
  join shared.contactinformation_view shared_contactinformation_view_llcmhc on master_join_srbkkc.target_id = shared_contactinformation_view_llcmhc.id
  where master_join_srbkkc.source_id = service.firefightingservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_edhcku.*) as lat_availability
  from master_join master_join_uvddty
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_edhcku on master_join_uvddty.target_id = service_serviceoperationalstatus_view_edhcku.id
  where master_join_uvddty.source_id = service.firefightingservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mwjfiw.*) AS annotation
  from master_join master_join_pdrbqp
  join notes.note_view notes_note_view_mwjfiw on master_join_pdrbqp.target_id = notes_note_view_mwjfiw.id
  where master_join_pdrbqp.source_id = service.firefightingservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_mdkbdz.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_mdkbdz.title AS varchar), '(' || airport_heliport_airportheliport_pt_mdkbdz.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_mdkbdz.href
  )) as lat_airportheliport  from master_join master_join_lxjpzj
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_mdkbdz on master_join_lxjpzj.target_id = airport_heliport_airportheliport_pt_mdkbdz.id
  where master_join_lxjpzj.source_id = service.firefightingservice_ts.id
) as lat_airportheliport on TRUE
where service.firefightingservice.feature_status = 'APPROVED'
  and service.firefightingservice_ts.feature_status = 'APPROVED'
order by firefightingservice.identifier, firefightingservice_ts.sequence_number, firefightingservice_ts.correction_number DESC;
create index on service.firefightingservice_view (id);
-- FlightRestrictionTimeSliceType
-- ['routes.flightrestrictionroute_view', 'notes.note_view', 'routes.flightconditioncombination_view']
drop materialized view if exists routes.flightrestriction_view cascade;
create materialized view routes.flightrestriction_view as
select distinct on (flightrestriction.identifier,flightrestriction_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    routes.flightrestriction.id,
    routes.flightrestriction_ts.id as ts_id,
    routes.flightrestriction_tsp.id as tsp_id,
    routes.flightrestriction.identifier,
    routes.flightrestriction_ts.interpretation,
    routes.flightrestriction_ts.sequence_number,
    routes.flightrestriction_ts.correction_number,
    routes.flightrestriction_ts.valid_time_begin,
    routes.flightrestriction_ts.valid_time_end,
    routes.flightrestriction_ts.feature_lifetime_begin,
    routes.flightrestriction_ts.feature_lifetime_end,
    coalesce(cast(routes.flightrestriction_ts.designator_value as varchar), '(' || routes.flightrestriction_ts.designator_nilreason || ')') as designator,
    coalesce(cast(routes.flightrestriction_ts.type_value as varchar), '(' || routes.flightrestriction_ts.type_nilreason || ')') as type,
    coalesce(cast(routes.flightrestriction_ts.instruction_value as varchar), '(' || routes.flightrestriction_ts.instruction_nilreason || ')') as instruction,
    to_jsonb(routes_flightconditioncombination_view_kmuacg.*) AS flight,
    lat_regulatedroute.lat_regulatedroute as regulatedroute,
    lat_annotation.annotation as annotation
from routes.flightrestriction 
inner join master_join mj2 on routes.flightrestriction.id = mj2.source_id
inner join routes.flightrestriction_tsp on mj2.target_id = routes.flightrestriction_tsp.id
inner join routes.flightrestriction_ts on routes.flightrestriction_tsp.flightrestrictiontimeslice_id = routes.flightrestriction_ts.id
left join routes.flightconditioncombination_view routes_flightconditioncombination_view_kmuacg on routes.flightrestriction_ts.flight_id = routes_flightconditioncombination_view_kmuacg.id
left join lateral(
  select jsonb_agg(DISTINCT routes_flightrestrictionroute_view_qacurl.*) as lat_regulatedroute
  from master_join master_join_jlffkn
  join routes.flightrestrictionroute_view routes_flightrestrictionroute_view_qacurl on master_join_jlffkn.target_id = routes_flightrestrictionroute_view_qacurl.id
  where master_join_jlffkn.source_id = routes.flightrestriction_ts.id
) as lat_regulatedroute on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_seijzg.*) AS annotation
  from master_join master_join_gtwinq
  join notes.note_view notes_note_view_seijzg on master_join_gtwinq.target_id = notes_note_view_seijzg.id
  where master_join_gtwinq.source_id = routes.flightrestriction_ts.id
) as lat_annotation on TRUE
where routes.flightrestriction.feature_status = 'APPROVED'
  and routes.flightrestriction_ts.feature_status = 'APPROVED'
order by flightrestriction.identifier, flightrestriction_ts.sequence_number, flightrestriction_ts.correction_number DESC;
create index on routes.flightrestriction_view (id);
-- FloatingDockSiteTimeSliceType
-- ['geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.floatingdocksite_view cascade;
create materialized view airport_heliport.floatingdocksite_view as
select distinct on (floatingdocksite.identifier,floatingdocksite_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.floatingdocksite.id,
    airport_heliport.floatingdocksite_ts.id as ts_id,
    airport_heliport.floatingdocksite_tsp.id as tsp_id,
    airport_heliport.floatingdocksite.identifier,
    airport_heliport.floatingdocksite_ts.interpretation,
    airport_heliport.floatingdocksite_ts.sequence_number,
    airport_heliport.floatingdocksite_ts.correction_number,
    airport_heliport.floatingdocksite_ts.valid_time_begin,
    airport_heliport.floatingdocksite_ts.valid_time_end,
    airport_heliport.floatingdocksite_ts.feature_lifetime_begin,
    airport_heliport.floatingdocksite_ts.feature_lifetime_end,
    geometry_elevatedsurface_view_gznfuu.geom AS extent_geom,
    geometry_elevatedsurface_view_gznfuu.elevation AS extent_elevation,
    geometry_elevatedsurface_view_gznfuu.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_gznfuu.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_gznfuu.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_gznfuu.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_annotation.annotation as annotation
from airport_heliport.floatingdocksite 
inner join master_join mj2 on airport_heliport.floatingdocksite.id = mj2.source_id
inner join airport_heliport.floatingdocksite_tsp on mj2.target_id = airport_heliport.floatingdocksite_tsp.id
inner join airport_heliport.floatingdocksite_ts on airport_heliport.floatingdocksite_tsp.floatingdocksitetimeslice_id = airport_heliport.floatingdocksite_ts.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_gznfuu on airport_heliport.floatingdocksite_ts.extent_id = geometry_elevatedsurface_view_gznfuu.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wpursp.*) AS annotation
  from master_join master_join_jcwnim
  join notes.note_view notes_note_view_wpursp on master_join_jcwnim.target_id = notes_note_view_wpursp.id
  where master_join_jcwnim.source_id = airport_heliport.floatingdocksite_ts.id
) as lat_annotation on TRUE
where airport_heliport.floatingdocksite.feature_status = 'APPROVED'
  and airport_heliport.floatingdocksite_ts.feature_status = 'APPROVED'
order by floatingdocksite.identifier, floatingdocksite_ts.sequence_number, floatingdocksite_ts.correction_number DESC;
create index on airport_heliport.floatingdocksite_view (id);
-- GeoBorderTimeSliceType
-- ['geometry.curve_view', 'notes.note_view']
drop materialized view if exists airspace.geoborder_view cascade;
create materialized view airspace.geoborder_view as
select distinct on (geoborder.identifier,geoborder_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airspace.geoborder.id,
    airspace.geoborder_ts.id as ts_id,
    airspace.geoborder_tsp.id as tsp_id,
    airspace.geoborder.identifier,
    airspace.geoborder_ts.interpretation,
    airspace.geoborder_ts.sequence_number,
    airspace.geoborder_ts.correction_number,
    airspace.geoborder_ts.valid_time_begin,
    airspace.geoborder_ts.valid_time_end,
    airspace.geoborder_ts.feature_lifetime_begin,
    airspace.geoborder_ts.feature_lifetime_end,
    coalesce(cast(airspace.geoborder_ts.name_value as varchar), '(' || airspace.geoborder_ts.name_nilreason || ')') as name,
    coalesce(cast(airspace.geoborder_ts.type_value as varchar), '(' || airspace.geoborder_ts.type_nilreason || ')') as type,
    geometry_curve_view_rjnogy.geom AS border_geom,
    geometry_curve_view_rjnogy.horizontalAccuracy as border_horizontalaccuracy,
    lat_annotation.annotation as annotation
from airspace.geoborder 
inner join master_join mj2 on airspace.geoborder.id = mj2.source_id
inner join airspace.geoborder_tsp on mj2.target_id = airspace.geoborder_tsp.id
inner join airspace.geoborder_ts on airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
left join geometry.curve_view geometry_curve_view_rjnogy on airspace.geoborder_ts.border_id = geometry_curve_view_rjnogy.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ifdirb.*) AS annotation
  from master_join master_join_thdnrp
  join notes.note_view notes_note_view_ifdirb on master_join_thdnrp.target_id = notes_note_view_ifdirb.id
  where master_join_thdnrp.source_id = airspace.geoborder_ts.id
) as lat_annotation on TRUE
where airspace.geoborder.feature_status = 'APPROVED'
  and airspace.geoborder_ts.feature_status = 'APPROVED'
order by geoborder.identifier, geoborder_ts.sequence_number, geoborder_ts.correction_number DESC;
create index on airspace.geoborder_view (id);
-- GlidepathTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.glidepath_view cascade;
create materialized view navaids_points.glidepath_view as
select distinct on (glidepath.identifier,glidepath_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.glidepath.id,
    navaids_points.glidepath_ts.id as ts_id,
    navaids_points.glidepath_tsp.id as tsp_id,
    navaids_points.glidepath.identifier,
    navaids_points.glidepath_ts.interpretation,
    navaids_points.glidepath_ts.sequence_number,
    navaids_points.glidepath_ts.correction_number,
    navaids_points.glidepath_ts.valid_time_begin,
    navaids_points.glidepath_ts.valid_time_end,
    navaids_points.glidepath_ts.feature_lifetime_begin,
    navaids_points.glidepath_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.glidepath_ts.designator_value as varchar), '(' || navaids_points.glidepath_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.glidepath_ts.name_value as varchar), '(' || navaids_points.glidepath_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.glidepath_ts.emissionclass_value as varchar), '(' || navaids_points.glidepath_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.glidepath_ts.mobile_value as varchar), '(' || navaids_points.glidepath_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.glidepath_ts.magneticvariation_value as varchar), '(' || navaids_points.glidepath_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.glidepath_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.glidepath_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.glidepath_ts.datemagneticvariation_value as varchar), '(' || navaids_points.glidepath_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.glidepath_ts.flightchecked_value as varchar), '(' || navaids_points.glidepath_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.glidepath_ts.slope_value as varchar), '(' || navaids_points.glidepath_ts.slope_nilreason || ')') as slope,
    coalesce(cast(navaids_points.glidepath_ts.angleaccuracy_value as varchar), '(' || navaids_points.glidepath_ts.angleaccuracy_nilreason || ')') as angleaccuracy,
    coalesce(cast(navaids_points.glidepath_ts.frequency_value as varchar) || ' ' || navaids_points.glidepath_ts.frequency_uom, '(' || navaids_points.glidepath_ts.frequency_nilreason || ')') as frequency,
    coalesce(cast(navaids_points.glidepath_ts.rdh_value as varchar) || ' ' || navaids_points.glidepath_ts.rdh_uom, '(' || navaids_points.glidepath_ts.rdh_nilreason || ')') as rdh,
    coalesce(cast(navaids_points.glidepath_ts.rdhaccuracy_value as varchar) || ' ' || navaids_points.glidepath_ts.rdhaccuracy_uom, '(' || navaids_points.glidepath_ts.rdhaccuracy_nilreason || ')') as rdhaccuracy,
    geometry_elevatedpoint_view_qrkikb.geom AS location_geom,
    geometry_elevatedpoint_view_qrkikb.longitude AS location_longitude,
    geometry_elevatedpoint_view_qrkikb.latitude AS location_latitude,
    geometry_elevatedpoint_view_qrkikb.elevation AS location_elevation,
    geometry_elevatedpoint_view_qrkikb.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_qrkikb.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_qrkikb.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_qrkikb.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.glidepath 
inner join master_join mj2 on navaids_points.glidepath.id = mj2.source_id
inner join navaids_points.glidepath_tsp on mj2.target_id = navaids_points.glidepath_tsp.id
inner join navaids_points.glidepath_ts on navaids_points.glidepath_tsp.glidepathtimeslice_id = navaids_points.glidepath_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_qrkikb on navaids_points.glidepath_ts.location_id = geometry_elevatedpoint_view_qrkikb.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_pmdwzi.*) as lat_authority
  from master_join master_join_szsnwi
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_pmdwzi on master_join_szsnwi.target_id = navaids_points_authorityfornavaidequipment_view_pmdwzi.id
  where master_join_szsnwi.source_id = navaids_points.glidepath_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_cdfejf.*) as lat_monitoring
  from master_join master_join_kuozya
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_cdfejf on master_join_kuozya.target_id = navaids_points_navaidequipmentmonitoring_view_cdfejf.id
  where master_join_kuozya.source_id = navaids_points.glidepath_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_jfjbfd.*) as lat_availability
  from master_join master_join_ylstch
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_jfjbfd on master_join_ylstch.target_id = navaids_points_navaidoperationalstatus_view_jfjbfd.id
  where master_join_ylstch.source_id = navaids_points.glidepath_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jbjdlb.*) AS annotation
  from master_join master_join_ewsxmp
  join notes.note_view notes_note_view_jbjdlb on master_join_ewsxmp.target_id = notes_note_view_jbjdlb.id
  where master_join_ewsxmp.source_id = navaids_points.glidepath_ts.id
) as lat_annotation on TRUE
where navaids_points.glidepath.feature_status = 'APPROVED'
  and navaids_points.glidepath_ts.feature_status = 'APPROVED'
order by glidepath.identifier, glidepath_ts.sequence_number, glidepath_ts.correction_number DESC;
create index on navaids_points.glidepath_view (id);
-- GroundTrafficControlServiceTimeSliceType
-- ['geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.groundtrafficcontrolservice_view cascade;
create materialized view service.groundtrafficcontrolservice_view as
select distinct on (groundtrafficcontrolservice.identifier,groundtrafficcontrolservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.groundtrafficcontrolservice.id,
    service.groundtrafficcontrolservice_ts.id as ts_id,
    service.groundtrafficcontrolservice_tsp.id as tsp_id,
    service.groundtrafficcontrolservice.identifier,
    service.groundtrafficcontrolservice_ts.interpretation,
    service.groundtrafficcontrolservice_ts.sequence_number,
    service.groundtrafficcontrolservice_ts.correction_number,
    service.groundtrafficcontrolservice_ts.valid_time_begin,
    service.groundtrafficcontrolservice_ts.valid_time_end,
    service.groundtrafficcontrolservice_ts.feature_lifetime_begin,
    service.groundtrafficcontrolservice_ts.feature_lifetime_end,
    coalesce(cast(service.groundtrafficcontrolservice_ts.flightoperations_value as varchar), '(' || service.groundtrafficcontrolservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.groundtrafficcontrolservice_ts.rank_value as varchar), '(' || service.groundtrafficcontrolservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.groundtrafficcontrolservice_ts.complianticao_value as varchar), '(' || service.groundtrafficcontrolservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.groundtrafficcontrolservice_ts.name_value as varchar), '(' || service.groundtrafficcontrolservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.groundtrafficcontrolservice_ts.radarassisted_value as varchar), '(' || service.groundtrafficcontrolservice_ts.radarassisted_nilreason || ')') as radarassisted,
    coalesce(cast(service.groundtrafficcontrolservice_ts.datalinkenabled_value as varchar), '(' || service.groundtrafficcontrolservice_ts.datalinkenabled_nilreason || ')') as datalinkenabled,
    coalesce(cast(service.groundtrafficcontrolservice_ts.datalinkchannel_value as varchar), '(' || service.groundtrafficcontrolservice_ts.datalinkchannel_nilreason || ')') as datalinkchannel,
    coalesce(cast(service.groundtrafficcontrolservice_ts.type_value as varchar), '(' || service.groundtrafficcontrolservice_ts.type_nilreason || ')') as type,
    geometry_elevatedpoint_view_xjzsjt.geom AS location_geom,
    geometry_elevatedpoint_view_xjzsjt.longitude AS location_longitude,
    geometry_elevatedpoint_view_xjzsjt.latitude AS location_latitude,
    geometry_elevatedpoint_view_xjzsjt.elevation AS location_elevation,
    geometry_elevatedpoint_view_xjzsjt.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_xjzsjt.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_xjzsjt.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_xjzsjt.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_rhjpvo.title as varchar), '(' || organisation_unit_pt_rhjpvo.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_rhjpvo.href AS serviceprovider_href,
    coalesce(cast(airport_heliport_airportheliport_pt_kzckrs.title as varchar), '(' || airport_heliport_airportheliport_pt_kzckrs.nilreason[1] || ')') AS clientairport,
    airport_heliport_airportheliport_pt_kzckrs.href AS clientairport_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from service.groundtrafficcontrolservice 
inner join master_join mj2 on service.groundtrafficcontrolservice.id = mj2.source_id
inner join service.groundtrafficcontrolservice_tsp on mj2.target_id = service.groundtrafficcontrolservice_tsp.id
inner join service.groundtrafficcontrolservice_ts on service.groundtrafficcontrolservice_tsp.groundtrafficcontrolservicetimeslice_id = service.groundtrafficcontrolservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_xjzsjt on service.groundtrafficcontrolservice_ts.location_id = geometry_elevatedpoint_view_xjzsjt.id
left join organisation.unit_pt organisation_unit_pt_rhjpvo on service.groundtrafficcontrolservice_ts.serviceprovider_id = organisation_unit_pt_rhjpvo.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_kzckrs on service.groundtrafficcontrolservice_ts.clientairport_id = airport_heliport_airportheliport_pt_kzckrs.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_yyicwn.*) as lat_callsign
  from master_join master_join_vausou
  join service.callsigndetail_view service_callsigndetail_view_yyicwn on master_join_vausou.target_id = service_callsigndetail_view_yyicwn.id
  where master_join_vausou.source_id = service.groundtrafficcontrolservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_oelujf.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_oelujf.title AS varchar), '(' || service_radiocommunicationchannel_pt_oelujf.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_oelujf.href
  )) as lat_radiocommunication  from master_join master_join_ycwugj
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_oelujf on master_join_ycwugj.target_id = service_radiocommunicationchannel_pt_oelujf.id
  where master_join_ycwugj.source_id = service.groundtrafficcontrolservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_yepqtj
  join shared.contactinformation_view shared_contactinformation_view_cojszl on master_join_yepqtj.target_id = shared_contactinformation_view_cojszl.id
  where master_join_yepqtj.source_id = service.groundtrafficcontrolservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_rwbqku.*) as lat_availability
  from master_join master_join_kxvmgb
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_rwbqku on master_join_kxvmgb.target_id = service_serviceoperationalstatus_view_rwbqku.id
  where master_join_kxvmgb.source_id = service.groundtrafficcontrolservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jkgfre.*) AS annotation
  from master_join master_join_hfwatu
  join notes.note_view notes_note_view_jkgfre on master_join_hfwatu.target_id = notes_note_view_jkgfre.id
  where master_join_hfwatu.source_id = service.groundtrafficcontrolservice_ts.id
) as lat_annotation on TRUE
where service.groundtrafficcontrolservice.feature_status = 'APPROVED'
  and service.groundtrafficcontrolservice_ts.feature_status = 'APPROVED'
order by groundtrafficcontrolservice.identifier, groundtrafficcontrolservice_ts.sequence_number, groundtrafficcontrolservice_ts.correction_number DESC;
create index on service.groundtrafficcontrolservice_view (id);
-- GuidanceLineLightSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.guidancelinelightsystem_view cascade;
create materialized view airport_heliport.guidancelinelightsystem_view as
select distinct on (guidancelinelightsystem.identifier,guidancelinelightsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.guidancelinelightsystem.id,
    airport_heliport.guidancelinelightsystem_ts.id as ts_id,
    airport_heliport.guidancelinelightsystem_tsp.id as tsp_id,
    airport_heliport.guidancelinelightsystem.identifier,
    airport_heliport.guidancelinelightsystem_ts.interpretation,
    airport_heliport.guidancelinelightsystem_ts.sequence_number,
    airport_heliport.guidancelinelightsystem_ts.correction_number,
    airport_heliport.guidancelinelightsystem_ts.valid_time_begin,
    airport_heliport.guidancelinelightsystem_ts.valid_time_end,
    airport_heliport.guidancelinelightsystem_ts.feature_lifetime_begin,
    airport_heliport.guidancelinelightsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.guidancelinelightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.guidancelinelightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.guidancelinelightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.guidancelinelightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.guidancelinelightsystem_ts.colour_value as varchar), '(' || airport_heliport.guidancelinelightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport_guidanceline_pt_zzrqzp.title as varchar), '(' || airport_heliport_guidanceline_pt_zzrqzp.nilreason[1] || ')') AS lightedguidanceline,
    airport_heliport_guidanceline_pt_zzrqzp.href AS lightedguidanceline_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.guidancelinelightsystem 
inner join master_join mj2 on airport_heliport.guidancelinelightsystem.id = mj2.source_id
inner join airport_heliport.guidancelinelightsystem_tsp on mj2.target_id = airport_heliport.guidancelinelightsystem_tsp.id
inner join airport_heliport.guidancelinelightsystem_ts on airport_heliport.guidancelinelightsystem_tsp.guidancelinelightsystemtimeslice_id = airport_heliport.guidancelinelightsystem_ts.id
left join airport_heliport.guidanceline_pt airport_heliport_guidanceline_pt_zzrqzp on airport_heliport.guidancelinelightsystem_ts.lightedguidanceline_id = airport_heliport_guidanceline_pt_zzrqzp.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_qaupre.*) as lat_element
  from master_join master_join_pnrbil
  join shared.lightelement_view shared_lightelement_view_qaupre on master_join_pnrbil.target_id = shared_lightelement_view_qaupre.id
  where master_join_pnrbil.source_id = airport_heliport.guidancelinelightsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_bcgeil.*) as lat_availability
  from master_join master_join_ifhcdq
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_bcgeil on master_join_ifhcdq.target_id = airport_heliport_groundlightingavailability_view_bcgeil.id
  where master_join_ifhcdq.source_id = airport_heliport.guidancelinelightsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ewnlej.*) AS annotation
  from master_join master_join_caqjth
  join notes.note_view notes_note_view_ewnlej on master_join_caqjth.target_id = notes_note_view_ewnlej.id
  where master_join_caqjth.source_id = airport_heliport.guidancelinelightsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.guidancelinelightsystem.feature_status = 'APPROVED'
  and airport_heliport.guidancelinelightsystem_ts.feature_status = 'APPROVED'
order by guidancelinelightsystem.identifier, guidancelinelightsystem_ts.sequence_number, guidancelinelightsystem_ts.correction_number DESC;
create index on airport_heliport.guidancelinelightsystem_view (id);
-- GuidanceLineMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.guidancelinemarking_view cascade;
create materialized view airport_heliport.guidancelinemarking_view as
select distinct on (guidancelinemarking.identifier,guidancelinemarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.guidancelinemarking.id,
    airport_heliport.guidancelinemarking_ts.id as ts_id,
    airport_heliport.guidancelinemarking_tsp.id as tsp_id,
    airport_heliport.guidancelinemarking.identifier,
    airport_heliport.guidancelinemarking_ts.interpretation,
    airport_heliport.guidancelinemarking_ts.sequence_number,
    airport_heliport.guidancelinemarking_ts.correction_number,
    airport_heliport.guidancelinemarking_ts.valid_time_begin,
    airport_heliport.guidancelinemarking_ts.valid_time_end,
    airport_heliport.guidancelinemarking_ts.feature_lifetime_begin,
    airport_heliport.guidancelinemarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.guidancelinemarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.guidancelinemarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.guidancelinemarking_ts.condition_value as varchar), '(' || airport_heliport.guidancelinemarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport_guidanceline_pt_wbkzff.title as varchar), '(' || airport_heliport_guidanceline_pt_wbkzff.nilreason[1] || ')') AS markedguidanceline,
    airport_heliport_guidanceline_pt_wbkzff.href AS markedguidanceline_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.guidancelinemarking 
inner join master_join mj2 on airport_heliport.guidancelinemarking.id = mj2.source_id
inner join airport_heliport.guidancelinemarking_tsp on mj2.target_id = airport_heliport.guidancelinemarking_tsp.id
inner join airport_heliport.guidancelinemarking_ts on airport_heliport.guidancelinemarking_tsp.guidancelinemarkingtimeslice_id = airport_heliport.guidancelinemarking_ts.id
left join airport_heliport.guidanceline_pt airport_heliport_guidanceline_pt_wbkzff on airport_heliport.guidancelinemarking_ts.markedguidanceline_id = airport_heliport_guidanceline_pt_wbkzff.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_xjqhzb.*) as lat_element
  from master_join master_join_wkednr
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_xjqhzb on master_join_wkednr.target_id = airport_heliport_markingelement_view_xjqhzb.id
  where master_join_wkednr.source_id = airport_heliport.guidancelinemarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pzulff.*) AS annotation
  from master_join master_join_jqnvha
  join notes.note_view notes_note_view_pzulff on master_join_jqnvha.target_id = notes_note_view_pzulff.id
  where master_join_jqnvha.source_id = airport_heliport.guidancelinemarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.guidancelinemarking.feature_status = 'APPROVED'
  and airport_heliport.guidancelinemarking_ts.feature_status = 'APPROVED'
order by guidancelinemarking.identifier, guidancelinemarking_ts.sequence_number, guidancelinemarking_ts.correction_number DESC;
create index on airport_heliport.guidancelinemarking_view (id);
-- GuidanceLineTimeSliceType
-- ['geometry.elevatedcurve_view', 'notes.note_view']
drop materialized view if exists airport_heliport.guidanceline_view cascade;
create materialized view airport_heliport.guidanceline_view as
select distinct on (guidanceline.identifier,guidanceline_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.guidanceline.id,
    airport_heliport.guidanceline_ts.id as ts_id,
    airport_heliport.guidanceline_tsp.id as tsp_id,
    airport_heliport.guidanceline.identifier,
    airport_heliport.guidanceline_ts.interpretation,
    airport_heliport.guidanceline_ts.sequence_number,
    airport_heliport.guidanceline_ts.correction_number,
    airport_heliport.guidanceline_ts.valid_time_begin,
    airport_heliport.guidanceline_ts.valid_time_end,
    airport_heliport.guidanceline_ts.feature_lifetime_begin,
    airport_heliport.guidanceline_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.guidanceline_ts.designator_value as varchar), '(' || airport_heliport.guidanceline_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.guidanceline_ts.type_value as varchar), '(' || airport_heliport.guidanceline_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.guidanceline_ts.usagedirection_value as varchar), '(' || airport_heliport.guidanceline_ts.usagedirection_nilreason || ')') as usagedirection,
    coalesce(cast(airport_heliport.guidanceline_ts.maxspeed_value as varchar) || ' ' || airport_heliport.guidanceline_ts.maxspeed_uom, '(' || airport_heliport.guidanceline_ts.maxspeed_nilreason || ')') as maxspeed,
    geometry_elevatedcurve_view_qzejln.geom AS extent_geom,
    geometry_elevatedcurve_view_qzejln.elevation AS extent_elevation,
    geometry_elevatedcurve_view_qzejln.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedcurve_view_qzejln.verticalDatum AS extent_verticaldatum,
    geometry_elevatedcurve_view_qzejln.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedcurve_view_qzejln.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_connectedtouchdownliftoff.lat_connectedtouchdownliftoff as connectedtouchdownliftoff,
    lat_connectedrunwaycentrelinepoint.lat_connectedrunwaycentrelinepoint as connectedrunwaycentrelinepoint,
    lat_connectedapron.lat_connectedapron as connectedapron,
    lat_connectedstand.lat_connectedstand as connectedstand,
    lat_connectedtaxiway.lat_connectedtaxiway as connectedtaxiway,
    lat_annotation.annotation as annotation
from airport_heliport.guidanceline 
inner join master_join mj2 on airport_heliport.guidanceline.id = mj2.source_id
inner join airport_heliport.guidanceline_tsp on mj2.target_id = airport_heliport.guidanceline_tsp.id
inner join airport_heliport.guidanceline_ts on airport_heliport.guidanceline_tsp.guidancelinetimeslice_id = airport_heliport.guidanceline_ts.id
left join geometry.elevatedcurve_view geometry_elevatedcurve_view_qzejln on airport_heliport.guidanceline_ts.extent_id = geometry_elevatedcurve_view_qzejln.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_touchdownliftoff_pt_yrdjrh.id,
      'title', coalesce(cast(airport_heliport_touchdownliftoff_pt_yrdjrh.title AS varchar), '(' || airport_heliport_touchdownliftoff_pt_yrdjrh.nilreason[1] || ')'),
      'href', airport_heliport_touchdownliftoff_pt_yrdjrh.href
  )) as lat_connectedtouchdownliftoff  from master_join master_join_zozfed
  join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_yrdjrh on master_join_zozfed.target_id = airport_heliport_touchdownliftoff_pt_yrdjrh.id
  where master_join_zozfed.source_id = airport_heliport.guidanceline_ts.id
) as lat_connectedtouchdownliftoff on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runwaycentrelinepoint_pt_gltydl.id,
      'title', coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_gltydl.title AS varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_gltydl.nilreason[1] || ')'),
      'href', airport_heliport_runwaycentrelinepoint_pt_gltydl.href
  )) as lat_connectedrunwaycentrelinepoint  from master_join master_join_nwfabe
  join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_gltydl on master_join_nwfabe.target_id = airport_heliport_runwaycentrelinepoint_pt_gltydl.id
  where master_join_nwfabe.source_id = airport_heliport.guidanceline_ts.id
) as lat_connectedrunwaycentrelinepoint on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_apron_pt_oitglz.id,
      'title', coalesce(cast(airport_heliport_apron_pt_oitglz.title AS varchar), '(' || airport_heliport_apron_pt_oitglz.nilreason[1] || ')'),
      'href', airport_heliport_apron_pt_oitglz.href
  )) as lat_connectedapron  from master_join master_join_eygasn
  join airport_heliport.apron_pt airport_heliport_apron_pt_oitglz on master_join_eygasn.target_id = airport_heliport_apron_pt_oitglz.id
  where master_join_eygasn.source_id = airport_heliport.guidanceline_ts.id
) as lat_connectedapron on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_aircraftstand_pt_rtruce.id,
      'title', coalesce(cast(airport_heliport_aircraftstand_pt_rtruce.title AS varchar), '(' || airport_heliport_aircraftstand_pt_rtruce.nilreason[1] || ')'),
      'href', airport_heliport_aircraftstand_pt_rtruce.href
  )) as lat_connectedstand  from master_join master_join_phizag
  join airport_heliport.aircraftstand_pt airport_heliport_aircraftstand_pt_rtruce on master_join_phizag.target_id = airport_heliport_aircraftstand_pt_rtruce.id
  where master_join_phizag.source_id = airport_heliport.guidanceline_ts.id
) as lat_connectedstand on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_taxiway_pt_qekqtv.id,
      'title', coalesce(cast(airport_heliport_taxiway_pt_qekqtv.title AS varchar), '(' || airport_heliport_taxiway_pt_qekqtv.nilreason[1] || ')'),
      'href', airport_heliport_taxiway_pt_qekqtv.href
  )) as lat_connectedtaxiway  from master_join master_join_yozfly
  join airport_heliport.taxiway_pt airport_heliport_taxiway_pt_qekqtv on master_join_yozfly.target_id = airport_heliport_taxiway_pt_qekqtv.id
  where master_join_yozfly.source_id = airport_heliport.guidanceline_ts.id
) as lat_connectedtaxiway on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_spsfdq.*) AS annotation
  from master_join master_join_lduzou
  join notes.note_view notes_note_view_spsfdq on master_join_lduzou.target_id = notes_note_view_spsfdq.id
  where master_join_lduzou.source_id = airport_heliport.guidanceline_ts.id
) as lat_annotation on TRUE
where airport_heliport.guidanceline.feature_status = 'APPROVED'
  and airport_heliport.guidanceline_ts.feature_status = 'APPROVED'
order by guidanceline.identifier, guidanceline_ts.sequence_number, guidanceline_ts.correction_number DESC;
create index on airport_heliport.guidanceline_view (id);
-- HoldingAssessmentTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view']
drop materialized view if exists shared.holdingassessment_view cascade;
create materialized view shared.holdingassessment_view as
select distinct on (holdingassessment.identifier,holdingassessment_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    shared.holdingassessment.id,
    shared.holdingassessment_ts.id as ts_id,
    shared.holdingassessment_tsp.id as tsp_id,
    shared.holdingassessment.identifier,
    shared.holdingassessment_ts.interpretation,
    shared.holdingassessment_ts.sequence_number,
    shared.holdingassessment_ts.correction_number,
    shared.holdingassessment_ts.valid_time_begin,
    shared.holdingassessment_ts.valid_time_end,
    shared.holdingassessment_ts.feature_lifetime_begin,
    shared.holdingassessment_ts.feature_lifetime_end,
    coalesce(cast(shared.holdingassessment_ts.upperlimitreference_value as varchar), '(' || shared.holdingassessment_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.holdingassessment_ts.lowerlimitreference_value as varchar), '(' || shared.holdingassessment_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.holdingassessment_ts.patterntemplate_value as varchar), '(' || shared.holdingassessment_ts.patterntemplate_nilreason || ')') as patterntemplate,
    coalesce(cast(shared.holdingassessment_ts.turbulentair_value as varchar), '(' || shared.holdingassessment_ts.turbulentair_nilreason || ')') as turbulentair,
    coalesce(cast(shared.holdingassessment_ts.upperlimit_value as varchar) || ' ' || shared.holdingassessment_ts.upperlimit_uom, '(' || shared.holdingassessment_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.holdingassessment_ts.lowerlimit_value as varchar) || ' ' || shared.holdingassessment_ts.lowerlimit_uom, '(' || shared.holdingassessment_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(shared.holdingassessment_ts.speedlimit_value as varchar) || ' ' || shared.holdingassessment_ts.speedlimit_uom, '(' || shared.holdingassessment_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(shared.holdingassessment_ts.leglengthtoward_value as varchar) || ' ' || shared.holdingassessment_ts.leglengthtoward_uom, '(' || shared.holdingassessment_ts.leglengthtoward_nilreason || ')') as leglengthtoward,
    coalesce(cast(shared.holdingassessment_ts.leglengthaway_value as varchar) || ' ' || shared.holdingassessment_ts.leglengthaway_uom, '(' || shared.holdingassessment_ts.leglengthaway_nilreason || ')') as leglengthaway,
    coalesce(cast(holding_unplannedholding_pt_hwooip.title as varchar), '(' || holding_unplannedholding_pt_hwooip.nilreason[1] || ')') AS unplannedholding,
    holding_unplannedholding_pt_hwooip.href AS unplannedholding_href,
    coalesce(cast(holding_holdingpattern_pt_gtshyd.title as varchar), '(' || holding_holdingpattern_pt_gtshyd.nilreason[1] || ')') AS assessedholdingpattern,
    holding_holdingpattern_pt_gtshyd.href AS assessedholdingpattern_href,
    lat_obstacleassessment.lat_obstacleassessment as obstacleassessment,
    lat_annotation.annotation as annotation
from shared.holdingassessment 
inner join master_join mj2 on shared.holdingassessment.id = mj2.source_id
inner join shared.holdingassessment_tsp on mj2.target_id = shared.holdingassessment_tsp.id
inner join shared.holdingassessment_ts on shared.holdingassessment_tsp.holdingassessmenttimeslice_id = shared.holdingassessment_ts.id
left join holding.unplannedholding_pt holding_unplannedholding_pt_hwooip on shared.holdingassessment_ts.unplannedholding_id = holding_unplannedholding_pt_hwooip.id
left join holding.holdingpattern_pt holding_holdingpattern_pt_gtshyd on shared.holdingassessment_ts.assessedholdingpattern_id = holding_holdingpattern_pt_gtshyd.id
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_clikxw.*) as lat_obstacleassessment
  from master_join master_join_pkgrie
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_clikxw on master_join_pkgrie.target_id = shared_obstacleassessmentarea_view_clikxw.id
  where master_join_pkgrie.source_id = shared.holdingassessment_ts.id
) as lat_obstacleassessment on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gkkghd.*) AS annotation
  from master_join master_join_uqtywa
  join notes.note_view notes_note_view_gkkghd on master_join_uqtywa.target_id = notes_note_view_gkkghd.id
  where master_join_uqtywa.source_id = shared.holdingassessment_ts.id
) as lat_annotation on TRUE
where shared.holdingassessment.feature_status = 'APPROVED'
  and shared.holdingassessment_ts.feature_status = 'APPROVED'
order by holdingassessment.identifier, holdingassessment_ts.sequence_number, holdingassessment_ts.correction_number DESC;
create index on shared.holdingassessment_view (id);
-- HoldingPatternTimeSliceType
-- ['holding.holdingpatterndistance_view', 'geometry.curve_view', 'holding.holdingpatternduration_view', 'notes.note_view']
drop materialized view if exists holding.holdingpattern_view cascade;
create materialized view holding.holdingpattern_view as
select distinct on (holdingpattern.identifier,holdingpattern_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    holding.holdingpattern.id,
    holding.holdingpattern_ts.id as ts_id,
    holding.holdingpattern_tsp.id as tsp_id,
    holding.holdingpattern.identifier,
    holding.holdingpattern_ts.interpretation,
    holding.holdingpattern_ts.sequence_number,
    holding.holdingpattern_ts.correction_number,
    holding.holdingpattern_ts.valid_time_begin,
    holding.holdingpattern_ts.valid_time_end,
    holding.holdingpattern_ts.feature_lifetime_begin,
    holding.holdingpattern_ts.feature_lifetime_end,
    coalesce(cast(holding.holdingpattern_ts.type_value as varchar), '(' || holding.holdingpattern_ts.type_nilreason || ')') as type,
    coalesce(cast(holding.holdingpattern_ts.outboundcourse_value as varchar), '(' || holding.holdingpattern_ts.outboundcourse_nilreason || ')') as outboundcourse,
    coalesce(cast(holding.holdingpattern_ts.outboundcoursetype_value as varchar), '(' || holding.holdingpattern_ts.outboundcoursetype_nilreason || ')') as outboundcoursetype,
    coalesce(cast(holding.holdingpattern_ts.inboundcourse_value as varchar), '(' || holding.holdingpattern_ts.inboundcourse_nilreason || ')') as inboundcourse,
    coalesce(cast(holding.holdingpattern_ts.turndirection_value as varchar), '(' || holding.holdingpattern_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(holding.holdingpattern_ts.upperlimitreference_value as varchar), '(' || holding.holdingpattern_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(holding.holdingpattern_ts.lowerlimitreference_value as varchar), '(' || holding.holdingpattern_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(holding.holdingpattern_ts.instruction_value as varchar), '(' || holding.holdingpattern_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(holding.holdingpattern_ts.nonstandardholding_value as varchar), '(' || holding.holdingpattern_ts.nonstandardholding_nilreason || ')') as nonstandardholding,
    coalesce(cast(holding.holdingpattern_ts.upperlimit_value as varchar) || ' ' || holding.holdingpattern_ts.upperlimit_uom, '(' || holding.holdingpattern_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(holding.holdingpattern_ts.lowerlimit_value as varchar) || ' ' || holding.holdingpattern_ts.lowerlimit_uom, '(' || holding.holdingpattern_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(holding.holdingpattern_ts.speedlimit_value as varchar) || ' ' || holding.holdingpattern_ts.speedlimit_uom, '(' || holding.holdingpattern_ts.speedlimit_nilreason || ')') as speedlimit,
    to_jsonb(holding_holdingpatternduration_view_htvbgy.*) AS outboundlegspanendtime,
    to_jsonb(holding_holdingpatterndistance_view_tqabyi.*) AS outboundlegspanenddistance,
    geometry_curve_view_iomlsv.geom AS extent_geom,
    geometry_curve_view_iomlsv.horizontalAccuracy as extent_horizontalaccuracy,
    lat_annotation.annotation as annotation
from holding.holdingpattern 
inner join master_join mj2 on holding.holdingpattern.id = mj2.source_id
inner join holding.holdingpattern_tsp on mj2.target_id = holding.holdingpattern_tsp.id
inner join holding.holdingpattern_ts on holding.holdingpattern_tsp.holdingpatterntimeslice_id = holding.holdingpattern_ts.id
left join holding.holdingpatternduration_view holding_holdingpatternduration_view_htvbgy on holding.holdingpattern_ts.outboundlegspan_endtime_id = holding_holdingpatternduration_view_htvbgy.id
left join holding.holdingpatterndistance_view holding_holdingpatterndistance_view_tqabyi on holding.holdingpattern_ts.outboundlegspan_enddistance_id = holding_holdingpatterndistance_view_tqabyi.id
left join geometry.curve_view geometry_curve_view_iomlsv on holding.holdingpattern_ts.extent_id = geometry_curve_view_iomlsv.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_dvpfpe.*) AS annotation
  from master_join master_join_vrwbuj
  join notes.note_view notes_note_view_dvpfpe on master_join_vrwbuj.target_id = notes_note_view_dvpfpe.id
  where master_join_vrwbuj.source_id = holding.holdingpattern_ts.id
) as lat_annotation on TRUE
where holding.holdingpattern.feature_status = 'APPROVED'
  and holding.holdingpattern_ts.feature_status = 'APPROVED'
order by holdingpattern.identifier, holdingpattern_ts.sequence_number, holdingpattern_ts.correction_number DESC;
create index on holding.holdingpattern_view (id);
-- InformationServiceTimeSliceType
-- ['routes.routeportion_view', 'geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.informationservice_view cascade;
create materialized view service.informationservice_view as
select distinct on (informationservice.identifier,informationservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.informationservice.id,
    service.informationservice_ts.id as ts_id,
    service.informationservice_tsp.id as tsp_id,
    service.informationservice.identifier,
    service.informationservice_ts.interpretation,
    service.informationservice_ts.sequence_number,
    service.informationservice_ts.correction_number,
    service.informationservice_ts.valid_time_begin,
    service.informationservice_ts.valid_time_end,
    service.informationservice_ts.feature_lifetime_begin,
    service.informationservice_ts.feature_lifetime_end,
    coalesce(cast(service.informationservice_ts.flightoperations_value as varchar), '(' || service.informationservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.informationservice_ts.rank_value as varchar), '(' || service.informationservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.informationservice_ts.complianticao_value as varchar), '(' || service.informationservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.informationservice_ts.name_value as varchar), '(' || service.informationservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.informationservice_ts.type_value as varchar), '(' || service.informationservice_ts.type_nilreason || ')') as type,
    coalesce(cast(service.informationservice_ts.voice_value as varchar), '(' || service.informationservice_ts.voice_nilreason || ')') as voice,
    coalesce(cast(service.informationservice_ts.datalink_value as varchar), '(' || service.informationservice_ts.datalink_nilreason || ')') as datalink,
    coalesce(cast(service.informationservice_ts.recorded_value as varchar), '(' || service.informationservice_ts.recorded_nilreason || ')') as recorded,
    geometry_elevatedpoint_view_ujvgol.geom AS location_geom,
    geometry_elevatedpoint_view_ujvgol.longitude AS location_longitude,
    geometry_elevatedpoint_view_ujvgol.latitude AS location_latitude,
    geometry_elevatedpoint_view_ujvgol.elevation AS location_elevation,
    geometry_elevatedpoint_view_ujvgol.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_ujvgol.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_ujvgol.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_ujvgol.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_wlmgjh.title as varchar), '(' || organisation_unit_pt_wlmgjh.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_wlmgjh.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_navaidbroadcast.lat_navaidbroadcast as navaidbroadcast,
    lat_clientairspace.lat_clientairspace as clientairspace,
    lat_clientairport.lat_clientairport as clientairport,
    lat_clientroute.lat_clientroute as clientroute,
    lat_clientholding.lat_clientholding as clientholding,
    lat_clientaerialrefuelling.lat_clientaerialrefuelling as clientaerialrefuelling
from service.informationservice 
inner join master_join mj2 on service.informationservice.id = mj2.source_id
inner join service.informationservice_tsp on mj2.target_id = service.informationservice_tsp.id
inner join service.informationservice_ts on service.informationservice_tsp.informationservicetimeslice_id = service.informationservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_ujvgol on service.informationservice_ts.location_id = geometry_elevatedpoint_view_ujvgol.id
left join organisation.unit_pt organisation_unit_pt_wlmgjh on service.informationservice_ts.serviceprovider_id = organisation_unit_pt_wlmgjh.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_zfocbh.*) as lat_callsign
  from master_join master_join_shgjwx
  join service.callsigndetail_view service_callsigndetail_view_zfocbh on master_join_shgjwx.target_id = service_callsigndetail_view_zfocbh.id
  where master_join_shgjwx.source_id = service.informationservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_kscpzk.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_kscpzk.title AS varchar), '(' || service_radiocommunicationchannel_pt_kscpzk.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_kscpzk.href
  )) as lat_radiocommunication  from master_join master_join_wjxncx
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_kscpzk on master_join_wjxncx.target_id = service_radiocommunicationchannel_pt_kscpzk.id
  where master_join_wjxncx.source_id = service.informationservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_rxiyyp
  join shared.contactinformation_view shared_contactinformation_view_jathvd on master_join_rxiyyp.target_id = shared_contactinformation_view_jathvd.id
  where master_join_rxiyyp.source_id = service.informationservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_zvlaje.*) as lat_availability
  from master_join master_join_wdmlvm
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_zvlaje on master_join_wdmlvm.target_id = service_serviceoperationalstatus_view_zvlaje.id
  where master_join_wdmlvm.source_id = service.informationservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_czysrb.*) AS annotation
  from master_join master_join_byreuk
  join notes.note_view notes_note_view_czysrb on master_join_byreuk.target_id = notes_note_view_czysrb.id
  where master_join_byreuk.source_id = service.informationservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', navaids_points_vor_pt_pemvan.id,
      'title', coalesce(cast(navaids_points_vor_pt_pemvan.title AS varchar), '(' || navaids_points_vor_pt_pemvan.nilreason[1] || ')'),
      'href', navaids_points_vor_pt_pemvan.href
  )) as lat_navaidbroadcast  from master_join master_join_ovrvwf
  join navaids_points.vor_pt navaids_points_vor_pt_pemvan on master_join_ovrvwf.target_id = navaids_points_vor_pt_pemvan.id
  where master_join_ovrvwf.source_id = service.informationservice_ts.id
) as lat_navaidbroadcast on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airspace_airspace_pt_jzwbbf.id,
      'title', coalesce(cast(airspace_airspace_pt_jzwbbf.title AS varchar), '(' || airspace_airspace_pt_jzwbbf.nilreason[1] || ')'),
      'href', airspace_airspace_pt_jzwbbf.href
  )) as lat_clientairspace  from master_join master_join_dqozak
  join airspace.airspace_pt airspace_airspace_pt_jzwbbf on master_join_dqozak.target_id = airspace_airspace_pt_jzwbbf.id
  where master_join_dqozak.source_id = service.informationservice_ts.id
) as lat_clientairspace on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_qmukyn.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_qmukyn.title AS varchar), '(' || airport_heliport_airportheliport_pt_qmukyn.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_qmukyn.href
  )) as lat_clientairport  from master_join master_join_ghcltk
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_qmukyn on master_join_ghcltk.target_id = airport_heliport_airportheliport_pt_qmukyn.id
  where master_join_ghcltk.source_id = service.informationservice_ts.id
) as lat_clientairport on TRUE
left join lateral(
  select jsonb_agg(DISTINCT routes_routeportion_view_hvuiww.*) as lat_clientroute
  from master_join master_join_ctffnc
  join routes.routeportion_view routes_routeportion_view_hvuiww on master_join_ctffnc.target_id = routes_routeportion_view_hvuiww.id
  where master_join_ctffnc.source_id = service.informationservice_ts.id
) as lat_clientroute on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', holding_holdingpattern_pt_tybaho.id,
      'title', coalesce(cast(holding_holdingpattern_pt_tybaho.title AS varchar), '(' || holding_holdingpattern_pt_tybaho.nilreason[1] || ')'),
      'href', holding_holdingpattern_pt_tybaho.href
  )) as lat_clientholding  from master_join master_join_zhesni
  join holding.holdingpattern_pt holding_holdingpattern_pt_tybaho on master_join_zhesni.target_id = holding_holdingpattern_pt_tybaho.id
  where master_join_zhesni.source_id = service.informationservice_ts.id
) as lat_clientholding on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', aerial_refuelling_aerialrefuelling_pt_ywyctv.id,
      'title', coalesce(cast(aerial_refuelling_aerialrefuelling_pt_ywyctv.title AS varchar), '(' || aerial_refuelling_aerialrefuelling_pt_ywyctv.nilreason[1] || ')'),
      'href', aerial_refuelling_aerialrefuelling_pt_ywyctv.href
  )) as lat_clientaerialrefuelling  from master_join master_join_ilaplk
  join aerial_refuelling.aerialrefuelling_pt aerial_refuelling_aerialrefuelling_pt_ywyctv on master_join_ilaplk.target_id = aerial_refuelling_aerialrefuelling_pt_ywyctv.id
  where master_join_ilaplk.source_id = service.informationservice_ts.id
) as lat_clientaerialrefuelling on TRUE
where service.informationservice.feature_status = 'APPROVED'
  and service.informationservice_ts.feature_status = 'APPROVED'
order by informationservice.identifier, informationservice_ts.sequence_number, informationservice_ts.correction_number DESC;
create index on service.informationservice_view (id);
-- InitialLegTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.aircraftcharacteristic_view', 'navaids_points.terminalsegmentpoint_view', 'geometry.curve_view', 'procedure.holdinguse_view']
drop materialized view if exists procedure.initialleg_view cascade;
create materialized view procedure.initialleg_view as
select distinct on (initialleg.identifier,initialleg_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.initialleg.id,
    procedure.initialleg_ts.id as ts_id,
    procedure.initialleg_tsp.id as tsp_id,
    procedure.initialleg.identifier,
    procedure.initialleg_ts.interpretation,
    procedure.initialleg_ts.sequence_number,
    procedure.initialleg_ts.correction_number,
    procedure.initialleg_ts.valid_time_begin,
    procedure.initialleg_ts.valid_time_end,
    procedure.initialleg_ts.feature_lifetime_begin,
    procedure.initialleg_ts.feature_lifetime_end,
    coalesce(cast(procedure.initialleg_ts.endconditiondesignator_value as varchar), '(' || procedure.initialleg_ts.endconditiondesignator_nilreason || ')') as endconditiondesignator,
    coalesce(cast(procedure.initialleg_ts.legpath_value as varchar), '(' || procedure.initialleg_ts.legpath_nilreason || ')') as legpath,
    coalesce(cast(procedure.initialleg_ts.legtypearinc_value as varchar), '(' || procedure.initialleg_ts.legtypearinc_nilreason || ')') as legtypearinc,
    coalesce(cast(procedure.initialleg_ts.course_value as varchar), '(' || procedure.initialleg_ts.course_nilreason || ')') as course,
    coalesce(cast(procedure.initialleg_ts.coursetype_value as varchar), '(' || procedure.initialleg_ts.coursetype_nilreason || ')') as coursetype,
    coalesce(cast(procedure.initialleg_ts.coursedirection_value as varchar), '(' || procedure.initialleg_ts.coursedirection_nilreason || ')') as coursedirection,
    coalesce(cast(procedure.initialleg_ts.turndirection_value as varchar), '(' || procedure.initialleg_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.initialleg_ts.speedreference_value as varchar), '(' || procedure.initialleg_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(procedure.initialleg_ts.speedinterpretation_value as varchar), '(' || procedure.initialleg_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(procedure.initialleg_ts.bankangle_value as varchar), '(' || procedure.initialleg_ts.bankangle_nilreason || ')') as bankangle,
    coalesce(cast(procedure.initialleg_ts.procedureturnrequired_value as varchar), '(' || procedure.initialleg_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.initialleg_ts.upperlimitreference_value as varchar), '(' || procedure.initialleg_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(procedure.initialleg_ts.lowerlimitreference_value as varchar), '(' || procedure.initialleg_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(procedure.initialleg_ts.altitudeinterpretation_value as varchar), '(' || procedure.initialleg_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(procedure.initialleg_ts.altitudeoverridereference_value as varchar), '(' || procedure.initialleg_ts.altitudeoverridereference_nilreason || ')') as altitudeoverridereference,
    coalesce(cast(procedure.initialleg_ts.verticalangle_value as varchar), '(' || procedure.initialleg_ts.verticalangle_nilreason || ')') as verticalangle,
    coalesce(cast(procedure.initialleg_ts.requirednavigationperformance_value as varchar), '(' || procedure.initialleg_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.initialleg_ts.speedlimit_value as varchar) || ' ' || procedure.initialleg_ts.speedlimit_uom, '(' || procedure.initialleg_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(procedure.initialleg_ts.length_value as varchar) || ' ' || procedure.initialleg_ts.length_uom, '(' || procedure.initialleg_ts.length_nilreason || ')') as length,
    coalesce(cast(procedure.initialleg_ts.duration_value as varchar) || ' ' || procedure.initialleg_ts.duration_uom, '(' || procedure.initialleg_ts.duration_nilreason || ')') as duration,
    coalesce(cast(procedure.initialleg_ts.upperlimitaltitude_value as varchar) || ' ' || procedure.initialleg_ts.upperlimitaltitude_uom, '(' || procedure.initialleg_ts.upperlimitaltitude_nilreason || ')') as upperlimitaltitude,
    coalesce(cast(procedure.initialleg_ts.lowerlimitaltitude_value as varchar) || ' ' || procedure.initialleg_ts.lowerlimitaltitude_uom, '(' || procedure.initialleg_ts.lowerlimitaltitude_nilreason || ')') as lowerlimitaltitude,
    coalesce(cast(procedure.initialleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.initialleg_ts.altitudeoverrideatc_uom, '(' || procedure.initialleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc,
    to_jsonb(navaids_points_terminalsegmentpoint_view_rjuups.*) AS startpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_ywsfug.*) AS endpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_ecukfy.*) AS arccentre,
    geometry_curve_view_nwovth.geom AS trajectory_geom,
    geometry_curve_view_nwovth.horizontalAccuracy as trajectory_horizontalaccuracy,
    coalesce(cast(navaids_points_angleindication_pt_wcyhjl.title as varchar), '(' || navaids_points_angleindication_pt_wcyhjl.nilreason[1] || ')') AS angle,
    navaids_points_angleindication_pt_wcyhjl.href AS angle_href,
    coalesce(cast(navaids_points_distanceindication_pt_hxkcwu.title as varchar), '(' || navaids_points_distanceindication_pt_hxkcwu.nilreason[1] || ')') AS distance,
    navaids_points_distanceindication_pt_hxkcwu.href AS distance_href,
    to_jsonb(procedure_holdinguse_view_vxzkkl.*) AS holding,
    coalesce(cast(procedure_instrumentapproachprocedure_pt_cwjwtp.title as varchar), '(' || procedure_instrumentapproachprocedure_pt_cwjwtp.nilreason[1] || ')') AS approach,
    procedure_instrumentapproachprocedure_pt_cwjwtp.href AS approach_href,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation
from procedure.initialleg 
inner join master_join mj2 on procedure.initialleg.id = mj2.source_id
inner join procedure.initialleg_tsp on mj2.target_id = procedure.initialleg_tsp.id
inner join procedure.initialleg_ts on procedure.initialleg_tsp.initiallegtimeslice_id = procedure.initialleg_ts.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_rjuups on procedure.initialleg_ts.startpoint_id = navaids_points_terminalsegmentpoint_view_rjuups.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_ywsfug on procedure.initialleg_ts.endpoint_id = navaids_points_terminalsegmentpoint_view_ywsfug.id
left join geometry.curve_view geometry_curve_view_nwovth on procedure.initialleg_ts.trajectory_id = geometry_curve_view_nwovth.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_ecukfy on procedure.initialleg_ts.arccentre_id = navaids_points_terminalsegmentpoint_view_ecukfy.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_wcyhjl on procedure.initialleg_ts.angle_id = navaids_points_angleindication_pt_wcyhjl.id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_hxkcwu on procedure.initialleg_ts.distance_id = navaids_points_distanceindication_pt_hxkcwu.id
left join procedure.holdinguse_view procedure_holdinguse_view_vxzkkl on procedure.initialleg_ts.holding_id = procedure_holdinguse_view_vxzkkl.id
left join procedure.instrumentapproachprocedure_pt procedure_instrumentapproachprocedure_pt_cwjwtp on procedure.initialleg_ts.approach_id = procedure_instrumentapproachprocedure_pt_cwjwtp.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_vgmjof.*) as lat_aircraftcategory
  from master_join master_join_ehuxaj
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_vgmjof on master_join_ehuxaj.target_id = shared_aircraftcharacteristic_view_vgmjof.id
  where master_join_ehuxaj.source_id = procedure.initialleg_ts.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_xhaulr.*) as lat_designsurface
  from master_join master_join_myvdbo
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_xhaulr on master_join_myvdbo.target_id = shared_obstacleassessmentarea_view_xhaulr.id
  where master_join_myvdbo.source_id = procedure.initialleg_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ffmatb.*) AS annotation
  from master_join master_join_qmjzfh
  join notes.note_view notes_note_view_ffmatb on master_join_qmjzfh.target_id = notes_note_view_ffmatb.id
  where master_join_qmjzfh.source_id = procedure.initialleg_ts.id
) as lat_annotation on TRUE
where procedure.initialleg.feature_status = 'APPROVED'
  and procedure.initialleg_ts.feature_status = 'APPROVED'
order by initialleg.identifier, initialleg_ts.sequence_number, initialleg_ts.correction_number DESC;
create index on procedure.initialleg_view (id);
-- InstrumentApproachProcedureTimeSliceType
-- ['procedure.missedapproachgroup_view', 'procedure.finalprofile_view', 'notes.note_view', 'procedure.proceduretransition_view', 'shared.aircraftcharacteristic_view', 'procedure.procedureavailability_view', 'procedure.landingtakeoffareacollection_view']
drop materialized view if exists procedure.instrumentapproachprocedure_view cascade;
create materialized view procedure.instrumentapproachprocedure_view as
select distinct on (instrumentapproachprocedure.identifier,instrumentapproachprocedure_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.instrumentapproachprocedure.id,
    procedure.instrumentapproachprocedure_ts.id as ts_id,
    procedure.instrumentapproachprocedure_tsp.id as tsp_id,
    procedure.instrumentapproachprocedure.identifier,
    procedure.instrumentapproachprocedure_ts.interpretation,
    procedure.instrumentapproachprocedure_ts.sequence_number,
    procedure.instrumentapproachprocedure_ts.correction_number,
    procedure.instrumentapproachprocedure_ts.valid_time_begin,
    procedure.instrumentapproachprocedure_ts.valid_time_end,
    procedure.instrumentapproachprocedure_ts.feature_lifetime_begin,
    procedure.instrumentapproachprocedure_ts.feature_lifetime_end,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.communicationfailureinstruction_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.communicationfailureinstruction_nilreason || ')') as communicationfailureinstruction,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.instruction_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.designcriteria_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.designcriteria_nilreason || ')') as designcriteria,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.codingstandard_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.codingstandard_nilreason || ')') as codingstandard,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.flightchecked_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.name_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.name_nilreason || ')') as name,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.rnav_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.rnav_nilreason || ')') as rnav,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.approachprefix_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.approachprefix_nilreason || ')') as approachprefix,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.approachtype_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.approachtype_nilreason || ')') as approachtype,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.multipleidentification_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.multipleidentification_nilreason || ')') as multipleidentification,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.coptertrack_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.coptertrack_nilreason || ')') as coptertrack,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.circlingidentification_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.circlingidentification_nilreason || ')') as circlingidentification,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.coursereversalinstruction_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.coursereversalinstruction_nilreason || ')') as coursereversalinstruction,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.additionalequipment_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.additionalequipment_nilreason || ')') as additionalequipment,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.channelgnss_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.channelgnss_nilreason || ')') as channelgnss,
    coalesce(cast(procedure.instrumentapproachprocedure_ts.waasreliable_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.waasreliable_nilreason || ')') as waasreliable,
    coalesce(cast(navaids_points_navaid_pt_qjaglp.title as varchar), '(' || navaids_points_navaid_pt_qjaglp.nilreason[1] || ')') AS guidancefacilitynavaid,
    navaids_points_navaid_pt_qjaglp.href AS guidancefacilitynavaid_href,
    coalesce(cast(navaids_points_specialnavigationsystem_pt_peearw.title as varchar), '(' || navaids_points_specialnavigationsystem_pt_peearw.nilreason[1] || ')') AS guidancefacilityspecialnavigationsystem,
    navaids_points_specialnavigationsystem_pt_peearw.href AS guidancefacilityspecialnavigationsystem_href,
    coalesce(cast(surveillance_radarsystem_pt_jgrwby.title as varchar), '(' || surveillance_radarsystem_pt_jgrwby.nilreason[1] || ')') AS guidancefacilityradar,
    surveillance_radarsystem_pt_jgrwby.href AS guidancefacilityradar_href,
    coalesce(cast(procedure_safealtitudearea_pt_xxjkoq.title as varchar), '(' || procedure_safealtitudearea_pt_xxjkoq.nilreason[1] || ')') AS safealtitude,
    procedure_safealtitudearea_pt_xxjkoq.href AS safealtitude_href,
    to_jsonb(procedure_landingtakeoffareacollection_view_pkvjyy.*) AS landing,
    to_jsonb(procedure_finalprofile_view_aaqzgm.*) AS finalprofile,
    lat_availability.lat_availability as availability,
    lat_airportheliport.lat_airportheliport as airportheliport,
    lat_aircraftcharacteristic.lat_aircraftcharacteristic as aircraftcharacteristic,
    lat_flighttransition.lat_flighttransition as flighttransition,
    lat_annotation.annotation as annotation,
    lat_missedinstruction.lat_missedinstruction as missedinstruction
from procedure.instrumentapproachprocedure 
inner join master_join mj2 on procedure.instrumentapproachprocedure.id = mj2.source_id
inner join procedure.instrumentapproachprocedure_tsp on mj2.target_id = procedure.instrumentapproachprocedure_tsp.id
inner join procedure.instrumentapproachprocedure_ts on procedure.instrumentapproachprocedure_tsp.instrumentapproachproceduretimeslice_id = procedure.instrumentapproachprocedure_ts.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_qjaglp on procedure.instrumentapproachprocedure_ts.guidancefacility_navaid_id = navaids_points_navaid_pt_qjaglp.id
left join navaids_points.specialnavigationsystem_pt navaids_points_specialnavigationsystem_pt_peearw on procedure.instrumentapproachprocedure_ts.guidancefacility_specialnavigationsystem_id = navaids_points_specialnavigationsystem_pt_peearw.id
left join surveillance.radarsystem_pt surveillance_radarsystem_pt_jgrwby on procedure.instrumentapproachprocedure_ts.guidancefacility_radar_id = surveillance_radarsystem_pt_jgrwby.id
left join procedure.safealtitudearea_pt procedure_safealtitudearea_pt_xxjkoq on procedure.instrumentapproachprocedure_ts.safealtitude_id = procedure_safealtitudearea_pt_xxjkoq.id
left join procedure.landingtakeoffareacollection_view procedure_landingtakeoffareacollection_view_pkvjyy on procedure.instrumentapproachprocedure_ts.landing_id = procedure_landingtakeoffareacollection_view_pkvjyy.id
left join procedure.finalprofile_view procedure_finalprofile_view_aaqzgm on procedure.instrumentapproachprocedure_ts.finalprofile_id = procedure_finalprofile_view_aaqzgm.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_procedureavailability_view_hcbtrt.*) as lat_availability
  from master_join master_join_irthty
  join procedure.procedureavailability_view procedure_procedureavailability_view_hcbtrt on master_join_irthty.target_id = procedure_procedureavailability_view_hcbtrt.id
  where master_join_irthty.source_id = procedure.instrumentapproachprocedure_ts.id
) as lat_availability on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_pqtyjs.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_pqtyjs.title AS varchar), '(' || airport_heliport_airportheliport_pt_pqtyjs.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_pqtyjs.href
  )) as lat_airportheliport  from master_join master_join_xktalu
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_pqtyjs on master_join_xktalu.target_id = airport_heliport_airportheliport_pt_pqtyjs.id
  where master_join_xktalu.source_id = procedure.instrumentapproachprocedure_ts.id
) as lat_airportheliport on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_fzcnzg.*) as lat_aircraftcharacteristic
  from master_join master_join_vqaixq
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_fzcnzg on master_join_vqaixq.target_id = shared_aircraftcharacteristic_view_fzcnzg.id
  where master_join_vqaixq.source_id = procedure.instrumentapproachprocedure_ts.id
) as lat_aircraftcharacteristic on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_proceduretransition_view_dxhaaq.*) as lat_flighttransition
  from master_join master_join_defebo
  join procedure.proceduretransition_view procedure_proceduretransition_view_dxhaaq on master_join_defebo.target_id = procedure_proceduretransition_view_dxhaaq.id
  where master_join_defebo.source_id = procedure.instrumentapproachprocedure_ts.id
) as lat_flighttransition on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_oiwcfh.*) AS annotation
  from master_join master_join_qffuuz
  join notes.note_view notes_note_view_oiwcfh on master_join_qffuuz.target_id = notes_note_view_oiwcfh.id
  where master_join_qffuuz.source_id = procedure.instrumentapproachprocedure_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_missedapproachgroup_view_gxbzsk.*) as lat_missedinstruction
  from master_join master_join_yhelae
  join procedure.missedapproachgroup_view procedure_missedapproachgroup_view_gxbzsk on master_join_yhelae.target_id = procedure_missedapproachgroup_view_gxbzsk.id
  where master_join_yhelae.source_id = procedure.instrumentapproachprocedure_ts.id
) as lat_missedinstruction on TRUE
where procedure.instrumentapproachprocedure.feature_status = 'APPROVED'
  and procedure.instrumentapproachprocedure_ts.feature_status = 'APPROVED'
order by instrumentapproachprocedure.identifier, instrumentapproachprocedure_ts.sequence_number, instrumentapproachprocedure_ts.correction_number DESC;
create index on procedure.instrumentapproachprocedure_view (id);
-- IntermediateLegTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.aircraftcharacteristic_view', 'navaids_points.terminalsegmentpoint_view', 'geometry.curve_view', 'procedure.holdinguse_view']
drop materialized view if exists procedure.intermediateleg_view cascade;
create materialized view procedure.intermediateleg_view as
select distinct on (intermediateleg.identifier,intermediateleg_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.intermediateleg.id,
    procedure.intermediateleg_ts.id as ts_id,
    procedure.intermediateleg_tsp.id as tsp_id,
    procedure.intermediateleg.identifier,
    procedure.intermediateleg_ts.interpretation,
    procedure.intermediateleg_ts.sequence_number,
    procedure.intermediateleg_ts.correction_number,
    procedure.intermediateleg_ts.valid_time_begin,
    procedure.intermediateleg_ts.valid_time_end,
    procedure.intermediateleg_ts.feature_lifetime_begin,
    procedure.intermediateleg_ts.feature_lifetime_end,
    coalesce(cast(procedure.intermediateleg_ts.endconditiondesignator_value as varchar), '(' || procedure.intermediateleg_ts.endconditiondesignator_nilreason || ')') as endconditiondesignator,
    coalesce(cast(procedure.intermediateleg_ts.legpath_value as varchar), '(' || procedure.intermediateleg_ts.legpath_nilreason || ')') as legpath,
    coalesce(cast(procedure.intermediateleg_ts.legtypearinc_value as varchar), '(' || procedure.intermediateleg_ts.legtypearinc_nilreason || ')') as legtypearinc,
    coalesce(cast(procedure.intermediateleg_ts.course_value as varchar), '(' || procedure.intermediateleg_ts.course_nilreason || ')') as course,
    coalesce(cast(procedure.intermediateleg_ts.coursetype_value as varchar), '(' || procedure.intermediateleg_ts.coursetype_nilreason || ')') as coursetype,
    coalesce(cast(procedure.intermediateleg_ts.coursedirection_value as varchar), '(' || procedure.intermediateleg_ts.coursedirection_nilreason || ')') as coursedirection,
    coalesce(cast(procedure.intermediateleg_ts.turndirection_value as varchar), '(' || procedure.intermediateleg_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.intermediateleg_ts.speedreference_value as varchar), '(' || procedure.intermediateleg_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(procedure.intermediateleg_ts.speedinterpretation_value as varchar), '(' || procedure.intermediateleg_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(procedure.intermediateleg_ts.bankangle_value as varchar), '(' || procedure.intermediateleg_ts.bankangle_nilreason || ')') as bankangle,
    coalesce(cast(procedure.intermediateleg_ts.procedureturnrequired_value as varchar), '(' || procedure.intermediateleg_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.intermediateleg_ts.upperlimitreference_value as varchar), '(' || procedure.intermediateleg_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(procedure.intermediateleg_ts.lowerlimitreference_value as varchar), '(' || procedure.intermediateleg_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(procedure.intermediateleg_ts.altitudeinterpretation_value as varchar), '(' || procedure.intermediateleg_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(procedure.intermediateleg_ts.altitudeoverridereference_value as varchar), '(' || procedure.intermediateleg_ts.altitudeoverridereference_nilreason || ')') as altitudeoverridereference,
    coalesce(cast(procedure.intermediateleg_ts.verticalangle_value as varchar), '(' || procedure.intermediateleg_ts.verticalangle_nilreason || ')') as verticalangle,
    coalesce(cast(procedure.intermediateleg_ts.requirednavigationperformance_value as varchar), '(' || procedure.intermediateleg_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.intermediateleg_ts.speedlimit_value as varchar) || ' ' || procedure.intermediateleg_ts.speedlimit_uom, '(' || procedure.intermediateleg_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(procedure.intermediateleg_ts.length_value as varchar) || ' ' || procedure.intermediateleg_ts.length_uom, '(' || procedure.intermediateleg_ts.length_nilreason || ')') as length,
    coalesce(cast(procedure.intermediateleg_ts.duration_value as varchar) || ' ' || procedure.intermediateleg_ts.duration_uom, '(' || procedure.intermediateleg_ts.duration_nilreason || ')') as duration,
    coalesce(cast(procedure.intermediateleg_ts.upperlimitaltitude_value as varchar) || ' ' || procedure.intermediateleg_ts.upperlimitaltitude_uom, '(' || procedure.intermediateleg_ts.upperlimitaltitude_nilreason || ')') as upperlimitaltitude,
    coalesce(cast(procedure.intermediateleg_ts.lowerlimitaltitude_value as varchar) || ' ' || procedure.intermediateleg_ts.lowerlimitaltitude_uom, '(' || procedure.intermediateleg_ts.lowerlimitaltitude_nilreason || ')') as lowerlimitaltitude,
    coalesce(cast(procedure.intermediateleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.intermediateleg_ts.altitudeoverrideatc_uom, '(' || procedure.intermediateleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc,
    to_jsonb(navaids_points_terminalsegmentpoint_view_desrgk.*) AS startpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_fqfkho.*) AS endpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_xkjgyq.*) AS arccentre,
    geometry_curve_view_ffaghy.geom AS trajectory_geom,
    geometry_curve_view_ffaghy.horizontalAccuracy as trajectory_horizontalaccuracy,
    coalesce(cast(navaids_points_angleindication_pt_ptoxej.title as varchar), '(' || navaids_points_angleindication_pt_ptoxej.nilreason[1] || ')') AS angle,
    navaids_points_angleindication_pt_ptoxej.href AS angle_href,
    coalesce(cast(navaids_points_distanceindication_pt_kkhozb.title as varchar), '(' || navaids_points_distanceindication_pt_kkhozb.nilreason[1] || ')') AS distance,
    navaids_points_distanceindication_pt_kkhozb.href AS distance_href,
    to_jsonb(procedure_holdinguse_view_owfjrq.*) AS holding,
    coalesce(cast(procedure_instrumentapproachprocedure_pt_qfcfiq.title as varchar), '(' || procedure_instrumentapproachprocedure_pt_qfcfiq.nilreason[1] || ')') AS approach,
    procedure_instrumentapproachprocedure_pt_qfcfiq.href AS approach_href,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation
from procedure.intermediateleg 
inner join master_join mj2 on procedure.intermediateleg.id = mj2.source_id
inner join procedure.intermediateleg_tsp on mj2.target_id = procedure.intermediateleg_tsp.id
inner join procedure.intermediateleg_ts on procedure.intermediateleg_tsp.intermediatelegtimeslice_id = procedure.intermediateleg_ts.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_desrgk on procedure.intermediateleg_ts.startpoint_id = navaids_points_terminalsegmentpoint_view_desrgk.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_fqfkho on procedure.intermediateleg_ts.endpoint_id = navaids_points_terminalsegmentpoint_view_fqfkho.id
left join geometry.curve_view geometry_curve_view_ffaghy on procedure.intermediateleg_ts.trajectory_id = geometry_curve_view_ffaghy.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_xkjgyq on procedure.intermediateleg_ts.arccentre_id = navaids_points_terminalsegmentpoint_view_xkjgyq.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_ptoxej on procedure.intermediateleg_ts.angle_id = navaids_points_angleindication_pt_ptoxej.id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_kkhozb on procedure.intermediateleg_ts.distance_id = navaids_points_distanceindication_pt_kkhozb.id
left join procedure.holdinguse_view procedure_holdinguse_view_owfjrq on procedure.intermediateleg_ts.holding_id = procedure_holdinguse_view_owfjrq.id
left join procedure.instrumentapproachprocedure_pt procedure_instrumentapproachprocedure_pt_qfcfiq on procedure.intermediateleg_ts.approach_id = procedure_instrumentapproachprocedure_pt_qfcfiq.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_dtwqom.*) as lat_aircraftcategory
  from master_join master_join_lpdxmf
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_dtwqom on master_join_lpdxmf.target_id = shared_aircraftcharacteristic_view_dtwqom.id
  where master_join_lpdxmf.source_id = procedure.intermediateleg_ts.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_vpflkw.*) as lat_designsurface
  from master_join master_join_ngblfe
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_vpflkw on master_join_ngblfe.target_id = shared_obstacleassessmentarea_view_vpflkw.id
  where master_join_ngblfe.source_id = procedure.intermediateleg_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mjxqkn.*) AS annotation
  from master_join master_join_ijnxmo
  join notes.note_view notes_note_view_mjxqkn on master_join_ijnxmo.target_id = notes_note_view_mjxqkn.id
  where master_join_ijnxmo.source_id = procedure.intermediateleg_ts.id
) as lat_annotation on TRUE
where procedure.intermediateleg.feature_status = 'APPROVED'
  and procedure.intermediateleg_ts.feature_status = 'APPROVED'
order by intermediateleg.identifier, intermediateleg_ts.sequence_number, intermediateleg_ts.correction_number DESC;
create index on procedure.intermediateleg_view (id);
-- LocalizerTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.localizer_view cascade;
create materialized view navaids_points.localizer_view as
select distinct on (localizer.identifier,localizer_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.localizer.id,
    navaids_points.localizer_ts.id as ts_id,
    navaids_points.localizer_tsp.id as tsp_id,
    navaids_points.localizer.identifier,
    navaids_points.localizer_ts.interpretation,
    navaids_points.localizer_ts.sequence_number,
    navaids_points.localizer_ts.correction_number,
    navaids_points.localizer_ts.valid_time_begin,
    navaids_points.localizer_ts.valid_time_end,
    navaids_points.localizer_ts.feature_lifetime_begin,
    navaids_points.localizer_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.localizer_ts.designator_value as varchar), '(' || navaids_points.localizer_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.localizer_ts.name_value as varchar), '(' || navaids_points.localizer_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.localizer_ts.emissionclass_value as varchar), '(' || navaids_points.localizer_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.localizer_ts.mobile_value as varchar), '(' || navaids_points.localizer_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.localizer_ts.magneticvariation_value as varchar), '(' || navaids_points.localizer_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.localizer_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.localizer_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.localizer_ts.datemagneticvariation_value as varchar), '(' || navaids_points.localizer_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.localizer_ts.flightchecked_value as varchar), '(' || navaids_points.localizer_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.localizer_ts.magneticbearing_value as varchar), '(' || navaids_points.localizer_ts.magneticbearing_nilreason || ')') as magneticbearing,
    coalesce(cast(navaids_points.localizer_ts.magneticbearingaccuracy_value as varchar), '(' || navaids_points.localizer_ts.magneticbearingaccuracy_nilreason || ')') as magneticbearingaccuracy,
    coalesce(cast(navaids_points.localizer_ts.truebearing_value as varchar), '(' || navaids_points.localizer_ts.truebearing_nilreason || ')') as truebearing,
    coalesce(cast(navaids_points.localizer_ts.truebearingaccuracy_value as varchar), '(' || navaids_points.localizer_ts.truebearingaccuracy_nilreason || ')') as truebearingaccuracy,
    coalesce(cast(navaids_points.localizer_ts.declination_value as varchar), '(' || navaids_points.localizer_ts.declination_nilreason || ')') as declination,
    coalesce(cast(navaids_points.localizer_ts.widthcourse_value as varchar), '(' || navaids_points.localizer_ts.widthcourse_nilreason || ')') as widthcourse,
    coalesce(cast(navaids_points.localizer_ts.widthcourseaccuracy_value as varchar), '(' || navaids_points.localizer_ts.widthcourseaccuracy_nilreason || ')') as widthcourseaccuracy,
    coalesce(cast(navaids_points.localizer_ts.backcourseusable_value as varchar), '(' || navaids_points.localizer_ts.backcourseusable_nilreason || ')') as backcourseusable,
    coalesce(cast(navaids_points.localizer_ts.frequency_value as varchar) || ' ' || navaids_points.localizer_ts.frequency_uom, '(' || navaids_points.localizer_ts.frequency_nilreason || ')') as frequency,
    geometry_elevatedpoint_view_kusnbh.geom AS location_geom,
    geometry_elevatedpoint_view_kusnbh.longitude AS location_longitude,
    geometry_elevatedpoint_view_kusnbh.latitude AS location_latitude,
    geometry_elevatedpoint_view_kusnbh.elevation AS location_elevation,
    geometry_elevatedpoint_view_kusnbh.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_kusnbh.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_kusnbh.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_kusnbh.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.localizer 
inner join master_join mj2 on navaids_points.localizer.id = mj2.source_id
inner join navaids_points.localizer_tsp on mj2.target_id = navaids_points.localizer_tsp.id
inner join navaids_points.localizer_ts on navaids_points.localizer_tsp.localizertimeslice_id = navaids_points.localizer_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_kusnbh on navaids_points.localizer_ts.location_id = geometry_elevatedpoint_view_kusnbh.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_pbgaqy.*) as lat_authority
  from master_join master_join_rqordm
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_pbgaqy on master_join_rqordm.target_id = navaids_points_authorityfornavaidequipment_view_pbgaqy.id
  where master_join_rqordm.source_id = navaids_points.localizer_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_weuulc.*) as lat_monitoring
  from master_join master_join_jpxluk
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_weuulc on master_join_jpxluk.target_id = navaids_points_navaidequipmentmonitoring_view_weuulc.id
  where master_join_jpxluk.source_id = navaids_points.localizer_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_wzools.*) as lat_availability
  from master_join master_join_zdttej
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_wzools on master_join_zdttej.target_id = navaids_points_navaidoperationalstatus_view_wzools.id
  where master_join_zdttej.source_id = navaids_points.localizer_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pwhekw.*) AS annotation
  from master_join master_join_xoogjq
  join notes.note_view notes_note_view_pwhekw on master_join_xoogjq.target_id = notes_note_view_pwhekw.id
  where master_join_xoogjq.source_id = navaids_points.localizer_ts.id
) as lat_annotation on TRUE
where navaids_points.localizer.feature_status = 'APPROVED'
  and navaids_points.localizer_ts.feature_status = 'APPROVED'
order by localizer.identifier, localizer_ts.sequence_number, localizer_ts.correction_number DESC;
create index on navaids_points.localizer_view (id);
-- MarkerBeaconTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.markerbeacon_view cascade;
create materialized view navaids_points.markerbeacon_view as
select distinct on (markerbeacon.identifier,markerbeacon_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.markerbeacon.id,
    navaids_points.markerbeacon_ts.id as ts_id,
    navaids_points.markerbeacon_tsp.id as tsp_id,
    navaids_points.markerbeacon.identifier,
    navaids_points.markerbeacon_ts.interpretation,
    navaids_points.markerbeacon_ts.sequence_number,
    navaids_points.markerbeacon_ts.correction_number,
    navaids_points.markerbeacon_ts.valid_time_begin,
    navaids_points.markerbeacon_ts.valid_time_end,
    navaids_points.markerbeacon_ts.feature_lifetime_begin,
    navaids_points.markerbeacon_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.markerbeacon_ts.designator_value as varchar), '(' || navaids_points.markerbeacon_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.markerbeacon_ts.name_value as varchar), '(' || navaids_points.markerbeacon_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.markerbeacon_ts.emissionclass_value as varchar), '(' || navaids_points.markerbeacon_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.markerbeacon_ts.mobile_value as varchar), '(' || navaids_points.markerbeacon_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.markerbeacon_ts.magneticvariation_value as varchar), '(' || navaids_points.markerbeacon_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.markerbeacon_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.markerbeacon_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.markerbeacon_ts.datemagneticvariation_value as varchar), '(' || navaids_points.markerbeacon_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.markerbeacon_ts.flightchecked_value as varchar), '(' || navaids_points.markerbeacon_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.markerbeacon_ts.class_value as varchar), '(' || navaids_points.markerbeacon_ts.class_nilreason || ')') as class,
    coalesce(cast(navaids_points.markerbeacon_ts.axisbearing_value as varchar), '(' || navaids_points.markerbeacon_ts.axisbearing_nilreason || ')') as axisbearing,
    coalesce(cast(navaids_points.markerbeacon_ts.auralmorsecode_value as varchar), '(' || navaids_points.markerbeacon_ts.auralmorsecode_nilreason || ')') as auralmorsecode,
    coalesce(cast(navaids_points.markerbeacon_ts.frequency_value as varchar) || ' ' || navaids_points.markerbeacon_ts.frequency_uom, '(' || navaids_points.markerbeacon_ts.frequency_nilreason || ')') as frequency,
    geometry_elevatedpoint_view_mjrxsz.geom AS location_geom,
    geometry_elevatedpoint_view_mjrxsz.longitude AS location_longitude,
    geometry_elevatedpoint_view_mjrxsz.latitude AS location_latitude,
    geometry_elevatedpoint_view_mjrxsz.elevation AS location_elevation,
    geometry_elevatedpoint_view_mjrxsz.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_mjrxsz.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_mjrxsz.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_mjrxsz.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.markerbeacon 
inner join master_join mj2 on navaids_points.markerbeacon.id = mj2.source_id
inner join navaids_points.markerbeacon_tsp on mj2.target_id = navaids_points.markerbeacon_tsp.id
inner join navaids_points.markerbeacon_ts on navaids_points.markerbeacon_tsp.markerbeacontimeslice_id = navaids_points.markerbeacon_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_mjrxsz on navaids_points.markerbeacon_ts.location_id = geometry_elevatedpoint_view_mjrxsz.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_fvzpxa.*) as lat_authority
  from master_join master_join_wzmtir
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_fvzpxa on master_join_wzmtir.target_id = navaids_points_authorityfornavaidequipment_view_fvzpxa.id
  where master_join_wzmtir.source_id = navaids_points.markerbeacon_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_qejiyq.*) as lat_monitoring
  from master_join master_join_ynhqax
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_qejiyq on master_join_ynhqax.target_id = navaids_points_navaidequipmentmonitoring_view_qejiyq.id
  where master_join_ynhqax.source_id = navaids_points.markerbeacon_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_muaxld.*) as lat_availability
  from master_join master_join_kaxiva
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_muaxld on master_join_kaxiva.target_id = navaids_points_navaidoperationalstatus_view_muaxld.id
  where master_join_kaxiva.source_id = navaids_points.markerbeacon_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_owmkqh.*) AS annotation
  from master_join master_join_yiwyuv
  join notes.note_view notes_note_view_owmkqh on master_join_yiwyuv.target_id = notes_note_view_owmkqh.id
  where master_join_yiwyuv.source_id = navaids_points.markerbeacon_ts.id
) as lat_annotation on TRUE
where navaids_points.markerbeacon.feature_status = 'APPROVED'
  and navaids_points.markerbeacon_ts.feature_status = 'APPROVED'
order by markerbeacon.identifier, markerbeacon_ts.sequence_number, markerbeacon_ts.correction_number DESC;
create index on navaids_points.markerbeacon_view (id);
-- MarkingBuoyTimeSliceType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists airport_heliport.markingbuoy_view cascade;
create materialized view airport_heliport.markingbuoy_view as
select distinct on (markingbuoy.identifier,markingbuoy_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.markingbuoy.id,
    airport_heliport.markingbuoy_ts.id as ts_id,
    airport_heliport.markingbuoy_tsp.id as tsp_id,
    airport_heliport.markingbuoy.identifier,
    airport_heliport.markingbuoy_ts.interpretation,
    airport_heliport.markingbuoy_ts.sequence_number,
    airport_heliport.markingbuoy_ts.correction_number,
    airport_heliport.markingbuoy_ts.valid_time_begin,
    airport_heliport.markingbuoy_ts.valid_time_end,
    airport_heliport.markingbuoy_ts.feature_lifetime_begin,
    airport_heliport.markingbuoy_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.markingbuoy_ts.type_value as varchar), '(' || airport_heliport.markingbuoy_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.markingbuoy_ts.colour_value as varchar), '(' || airport_heliport.markingbuoy_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport_seaplanelandingarea_pt_etujdy.title as varchar), '(' || airport_heliport_seaplanelandingarea_pt_etujdy.nilreason[1] || ')') AS theseaplanelandingarea,
    airport_heliport_seaplanelandingarea_pt_etujdy.href AS theseaplanelandingarea_href,
    geometry_elevatedpoint_view_npbcsq.geom AS location_geom,
    geometry_elevatedpoint_view_npbcsq.longitude AS location_longitude,
    geometry_elevatedpoint_view_npbcsq.latitude AS location_latitude,
    geometry_elevatedpoint_view_npbcsq.elevation AS location_elevation,
    geometry_elevatedpoint_view_npbcsq.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_npbcsq.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_npbcsq.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_npbcsq.horizontalAccuracy AS location_horizontalaccuracy,
    lat_annotation.annotation as annotation
from airport_heliport.markingbuoy 
inner join master_join mj2 on airport_heliport.markingbuoy.id = mj2.source_id
inner join airport_heliport.markingbuoy_tsp on mj2.target_id = airport_heliport.markingbuoy_tsp.id
inner join airport_heliport.markingbuoy_ts on airport_heliport.markingbuoy_tsp.markingbuoytimeslice_id = airport_heliport.markingbuoy_ts.id
left join airport_heliport.seaplanelandingarea_pt airport_heliport_seaplanelandingarea_pt_etujdy on airport_heliport.markingbuoy_ts.theseaplanelandingarea_id = airport_heliport_seaplanelandingarea_pt_etujdy.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_npbcsq on airport_heliport.markingbuoy_ts.location_id = geometry_elevatedpoint_view_npbcsq.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ptwxxv.*) AS annotation
  from master_join master_join_bpmiip
  join notes.note_view notes_note_view_ptwxxv on master_join_bpmiip.target_id = notes_note_view_ptwxxv.id
  where master_join_bpmiip.source_id = airport_heliport.markingbuoy_ts.id
) as lat_annotation on TRUE
where airport_heliport.markingbuoy.feature_status = 'APPROVED'
  and airport_heliport.markingbuoy_ts.feature_status = 'APPROVED'
order by markingbuoy.identifier, markingbuoy_ts.sequence_number, markingbuoy_ts.correction_number DESC;
create index on airport_heliport.markingbuoy_view (id);
-- MissedApproachLegTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.aircraftcharacteristic_view', 'navaids_points.terminalsegmentpoint_view', 'procedure.approachcondition_view', 'geometry.curve_view', 'procedure.holdinguse_view']
drop materialized view if exists procedure.missedapproachleg_view cascade;
create materialized view procedure.missedapproachleg_view as
select distinct on (missedapproachleg.identifier,missedapproachleg_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.missedapproachleg.id,
    procedure.missedapproachleg_ts.id as ts_id,
    procedure.missedapproachleg_tsp.id as tsp_id,
    procedure.missedapproachleg.identifier,
    procedure.missedapproachleg_ts.interpretation,
    procedure.missedapproachleg_ts.sequence_number,
    procedure.missedapproachleg_ts.correction_number,
    procedure.missedapproachleg_ts.valid_time_begin,
    procedure.missedapproachleg_ts.valid_time_end,
    procedure.missedapproachleg_ts.feature_lifetime_begin,
    procedure.missedapproachleg_ts.feature_lifetime_end,
    coalesce(cast(procedure.missedapproachleg_ts.endconditiondesignator_value as varchar), '(' || procedure.missedapproachleg_ts.endconditiondesignator_nilreason || ')') as endconditiondesignator,
    coalesce(cast(procedure.missedapproachleg_ts.legpath_value as varchar), '(' || procedure.missedapproachleg_ts.legpath_nilreason || ')') as legpath,
    coalesce(cast(procedure.missedapproachleg_ts.legtypearinc_value as varchar), '(' || procedure.missedapproachleg_ts.legtypearinc_nilreason || ')') as legtypearinc,
    coalesce(cast(procedure.missedapproachleg_ts.course_value as varchar), '(' || procedure.missedapproachleg_ts.course_nilreason || ')') as course,
    coalesce(cast(procedure.missedapproachleg_ts.coursetype_value as varchar), '(' || procedure.missedapproachleg_ts.coursetype_nilreason || ')') as coursetype,
    coalesce(cast(procedure.missedapproachleg_ts.coursedirection_value as varchar), '(' || procedure.missedapproachleg_ts.coursedirection_nilreason || ')') as coursedirection,
    coalesce(cast(procedure.missedapproachleg_ts.turndirection_value as varchar), '(' || procedure.missedapproachleg_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(procedure.missedapproachleg_ts.speedreference_value as varchar), '(' || procedure.missedapproachleg_ts.speedreference_nilreason || ')') as speedreference,
    coalesce(cast(procedure.missedapproachleg_ts.speedinterpretation_value as varchar), '(' || procedure.missedapproachleg_ts.speedinterpretation_nilreason || ')') as speedinterpretation,
    coalesce(cast(procedure.missedapproachleg_ts.bankangle_value as varchar), '(' || procedure.missedapproachleg_ts.bankangle_nilreason || ')') as bankangle,
    coalesce(cast(procedure.missedapproachleg_ts.procedureturnrequired_value as varchar), '(' || procedure.missedapproachleg_ts.procedureturnrequired_nilreason || ')') as procedureturnrequired,
    coalesce(cast(procedure.missedapproachleg_ts.upperlimitreference_value as varchar), '(' || procedure.missedapproachleg_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(procedure.missedapproachleg_ts.lowerlimitreference_value as varchar), '(' || procedure.missedapproachleg_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(procedure.missedapproachleg_ts.altitudeinterpretation_value as varchar), '(' || procedure.missedapproachleg_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(procedure.missedapproachleg_ts.altitudeoverridereference_value as varchar), '(' || procedure.missedapproachleg_ts.altitudeoverridereference_nilreason || ')') as altitudeoverridereference,
    coalesce(cast(procedure.missedapproachleg_ts.verticalangle_value as varchar), '(' || procedure.missedapproachleg_ts.verticalangle_nilreason || ')') as verticalangle,
    coalesce(cast(procedure.missedapproachleg_ts.type_value as varchar), '(' || procedure.missedapproachleg_ts.type_nilreason || ')') as type,
    coalesce(cast(procedure.missedapproachleg_ts.thresholdaftermapt_value as varchar), '(' || procedure.missedapproachleg_ts.thresholdaftermapt_nilreason || ')') as thresholdaftermapt,
    coalesce(cast(procedure.missedapproachleg_ts.requirednavigationperformance_value as varchar), '(' || procedure.missedapproachleg_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(procedure.missedapproachleg_ts.speedlimit_value as varchar) || ' ' || procedure.missedapproachleg_ts.speedlimit_uom, '(' || procedure.missedapproachleg_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(procedure.missedapproachleg_ts.length_value as varchar) || ' ' || procedure.missedapproachleg_ts.length_uom, '(' || procedure.missedapproachleg_ts.length_nilreason || ')') as length,
    coalesce(cast(procedure.missedapproachleg_ts.duration_value as varchar) || ' ' || procedure.missedapproachleg_ts.duration_uom, '(' || procedure.missedapproachleg_ts.duration_nilreason || ')') as duration,
    coalesce(cast(procedure.missedapproachleg_ts.upperlimitaltitude_value as varchar) || ' ' || procedure.missedapproachleg_ts.upperlimitaltitude_uom, '(' || procedure.missedapproachleg_ts.upperlimitaltitude_nilreason || ')') as upperlimitaltitude,
    coalesce(cast(procedure.missedapproachleg_ts.lowerlimitaltitude_value as varchar) || ' ' || procedure.missedapproachleg_ts.lowerlimitaltitude_uom, '(' || procedure.missedapproachleg_ts.lowerlimitaltitude_nilreason || ')') as lowerlimitaltitude,
    coalesce(cast(procedure.missedapproachleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.missedapproachleg_ts.altitudeoverrideatc_uom, '(' || procedure.missedapproachleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc,
    coalesce(cast(procedure.missedapproachleg_ts.heightmapt_value as varchar) || ' ' || procedure.missedapproachleg_ts.heightmapt_uom, '(' || procedure.missedapproachleg_ts.heightmapt_nilreason || ')') as heightmapt,
    to_jsonb(navaids_points_terminalsegmentpoint_view_dnzzgs.*) AS startpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_ihshoo.*) AS endpoint,
    to_jsonb(navaids_points_terminalsegmentpoint_view_pazvgo.*) AS arccentre,
    geometry_curve_view_agilde.geom AS trajectory_geom,
    geometry_curve_view_agilde.horizontalAccuracy as trajectory_horizontalaccuracy,
    coalesce(cast(navaids_points_angleindication_pt_eqnfei.title as varchar), '(' || navaids_points_angleindication_pt_eqnfei.nilreason[1] || ')') AS angle,
    navaids_points_angleindication_pt_eqnfei.href AS angle_href,
    coalesce(cast(navaids_points_distanceindication_pt_ltoiwn.title as varchar), '(' || navaids_points_distanceindication_pt_ltoiwn.nilreason[1] || ')') AS distance,
    navaids_points_distanceindication_pt_ltoiwn.href AS distance_href,
    to_jsonb(procedure_holdinguse_view_bndlfi.*) AS holding,
    coalesce(cast(procedure_instrumentapproachprocedure_pt_mmpmab.title as varchar), '(' || procedure_instrumentapproachprocedure_pt_mmpmab.nilreason[1] || ')') AS approach,
    procedure_instrumentapproachprocedure_pt_mmpmab.href AS approach_href,
    lat_aircraftcategory.lat_aircraftcategory as aircraftcategory,
    lat_designsurface.lat_designsurface as designsurface,
    lat_annotation.annotation as annotation,
    lat_condition.lat_condition as condition
from procedure.missedapproachleg 
inner join master_join mj2 on procedure.missedapproachleg.id = mj2.source_id
inner join procedure.missedapproachleg_tsp on mj2.target_id = procedure.missedapproachleg_tsp.id
inner join procedure.missedapproachleg_ts on procedure.missedapproachleg_tsp.missedapproachlegtimeslice_id = procedure.missedapproachleg_ts.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_dnzzgs on procedure.missedapproachleg_ts.startpoint_id = navaids_points_terminalsegmentpoint_view_dnzzgs.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_ihshoo on procedure.missedapproachleg_ts.endpoint_id = navaids_points_terminalsegmentpoint_view_ihshoo.id
left join geometry.curve_view geometry_curve_view_agilde on procedure.missedapproachleg_ts.trajectory_id = geometry_curve_view_agilde.id
left join navaids_points.terminalsegmentpoint_view navaids_points_terminalsegmentpoint_view_pazvgo on procedure.missedapproachleg_ts.arccentre_id = navaids_points_terminalsegmentpoint_view_pazvgo.id
left join navaids_points.angleindication_pt navaids_points_angleindication_pt_eqnfei on procedure.missedapproachleg_ts.angle_id = navaids_points_angleindication_pt_eqnfei.id
left join navaids_points.distanceindication_pt navaids_points_distanceindication_pt_ltoiwn on procedure.missedapproachleg_ts.distance_id = navaids_points_distanceindication_pt_ltoiwn.id
left join procedure.holdinguse_view procedure_holdinguse_view_bndlfi on procedure.missedapproachleg_ts.holding_id = procedure_holdinguse_view_bndlfi.id
left join procedure.instrumentapproachprocedure_pt procedure_instrumentapproachprocedure_pt_mmpmab on procedure.missedapproachleg_ts.approach_id = procedure_instrumentapproachprocedure_pt_mmpmab.id
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_odeebk.*) as lat_aircraftcategory
  from master_join master_join_jrnxkb
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_odeebk on master_join_jrnxkb.target_id = shared_aircraftcharacteristic_view_odeebk.id
  where master_join_jrnxkb.source_id = procedure.missedapproachleg_ts.id
) as lat_aircraftcategory on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_obstacleassessmentarea_view_ivraxb.*) as lat_designsurface
  from master_join master_join_lrrqma
  join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_ivraxb on master_join_lrrqma.target_id = shared_obstacleassessmentarea_view_ivraxb.id
  where master_join_lrrqma.source_id = procedure.missedapproachleg_ts.id
) as lat_designsurface on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_vjleay.*) AS annotation
  from master_join master_join_qkbybi
  join notes.note_view notes_note_view_vjleay on master_join_qkbybi.target_id = notes_note_view_vjleay.id
  where master_join_qkbybi.source_id = procedure.missedapproachleg_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_approachcondition_view_ofgwry.*) as lat_condition
  from master_join master_join_gvuwwu
  join procedure.approachcondition_view procedure_approachcondition_view_ofgwry on master_join_gvuwwu.target_id = procedure_approachcondition_view_ofgwry.id
  where master_join_gvuwwu.source_id = procedure.missedapproachleg_ts.id
) as lat_condition on TRUE
where procedure.missedapproachleg.feature_status = 'APPROVED'
  and procedure.missedapproachleg_ts.feature_status = 'APPROVED'
order by missedapproachleg.identifier, missedapproachleg_ts.sequence_number, missedapproachleg_ts.correction_number DESC;
create index on procedure.missedapproachleg_view (id);
-- NavaidTimeSliceType
-- ['navaids_points.navaidoperationalstatus_view', 'navaids_points.navaidcomponent_view', 'notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists navaids_points.navaid_view cascade;
create materialized view navaids_points.navaid_view as
select distinct on (navaid.identifier,navaid_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.navaid.id,
    navaids_points.navaid_ts.id as ts_id,
    navaids_points.navaid_tsp.id as tsp_id,
    navaids_points.navaid.identifier,
    navaids_points.navaid_ts.interpretation,
    navaids_points.navaid_ts.sequence_number,
    navaids_points.navaid_ts.correction_number,
    navaids_points.navaid_ts.valid_time_begin,
    navaids_points.navaid_ts.valid_time_end,
    navaids_points.navaid_ts.feature_lifetime_begin,
    navaids_points.navaid_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.navaid_ts.type_value as varchar), '(' || navaids_points.navaid_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.navaid_ts.designator_value as varchar), '(' || navaids_points.navaid_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.navaid_ts.name_value as varchar), '(' || navaids_points.navaid_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.navaid_ts.flightchecked_value as varchar), '(' || navaids_points.navaid_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.navaid_ts.purpose_value as varchar), '(' || navaids_points.navaid_ts.purpose_nilreason || ')') as purpose,
    coalesce(cast(navaids_points.navaid_ts.signalperformance_value as varchar), '(' || navaids_points.navaid_ts.signalperformance_nilreason || ')') as signalperformance,
    coalesce(cast(navaids_points.navaid_ts.coursequality_value as varchar), '(' || navaids_points.navaid_ts.coursequality_nilreason || ')') as coursequality,
    coalesce(cast(navaids_points.navaid_ts.integritylevel_value as varchar), '(' || navaids_points.navaid_ts.integritylevel_nilreason || ')') as integritylevel,
    geometry_elevatedpoint_view_niyobr.geom AS location_geom,
    geometry_elevatedpoint_view_niyobr.longitude AS location_longitude,
    geometry_elevatedpoint_view_niyobr.latitude AS location_latitude,
    geometry_elevatedpoint_view_niyobr.elevation AS location_elevation,
    geometry_elevatedpoint_view_niyobr.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_niyobr.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_niyobr.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_niyobr.horizontalAccuracy AS location_horizontalaccuracy,
    lat_touchdownliftoff.lat_touchdownliftoff as touchdownliftoff,
    lat_navaidequipment.lat_navaidequipment as navaidequipment,
    lat_runwaydirection.lat_runwaydirection as runwaydirection,
    lat_servedairport.lat_servedairport as servedairport,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.navaid 
inner join master_join mj2 on navaids_points.navaid.id = mj2.source_id
inner join navaids_points.navaid_tsp on mj2.target_id = navaids_points.navaid_tsp.id
inner join navaids_points.navaid_ts on navaids_points.navaid_tsp.navaidtimeslice_id = navaids_points.navaid_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_niyobr on navaids_points.navaid_ts.location_id = geometry_elevatedpoint_view_niyobr.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_touchdownliftoff_pt_evvmch.id,
      'title', coalesce(cast(airport_heliport_touchdownliftoff_pt_evvmch.title AS varchar), '(' || airport_heliport_touchdownliftoff_pt_evvmch.nilreason[1] || ')'),
      'href', airport_heliport_touchdownliftoff_pt_evvmch.href
  )) as lat_touchdownliftoff  from master_join master_join_jxtmnp
  join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_evvmch on master_join_jxtmnp.target_id = airport_heliport_touchdownliftoff_pt_evvmch.id
  where master_join_jxtmnp.source_id = navaids_points.navaid_ts.id
) as lat_touchdownliftoff on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidcomponent_view_ksmrag.*) as lat_navaidequipment
  from master_join master_join_fqafgo
  join navaids_points.navaidcomponent_view navaids_points_navaidcomponent_view_ksmrag on master_join_fqafgo.target_id = navaids_points_navaidcomponent_view_ksmrag.id
  where master_join_fqafgo.source_id = navaids_points.navaid_ts.id
) as lat_navaidequipment on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runwaydirection_pt_kycoow.id,
      'title', coalesce(cast(airport_heliport_runwaydirection_pt_kycoow.title AS varchar), '(' || airport_heliport_runwaydirection_pt_kycoow.nilreason[1] || ')'),
      'href', airport_heliport_runwaydirection_pt_kycoow.href
  )) as lat_runwaydirection  from master_join master_join_vxerog
  join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_kycoow on master_join_vxerog.target_id = airport_heliport_runwaydirection_pt_kycoow.id
  where master_join_vxerog.source_id = navaids_points.navaid_ts.id
) as lat_runwaydirection on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_ycsfob.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_ycsfob.title AS varchar), '(' || airport_heliport_airportheliport_pt_ycsfob.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_ycsfob.href
  )) as lat_servedairport  from master_join master_join_qghcyl
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_ycsfob on master_join_qghcyl.target_id = airport_heliport_airportheliport_pt_ycsfob.id
  where master_join_qghcyl.source_id = navaids_points.navaid_ts.id
) as lat_servedairport on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_otevlh.*) as lat_availability
  from master_join master_join_ruvthi
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_otevlh on master_join_ruvthi.target_id = navaids_points_navaidoperationalstatus_view_otevlh.id
  where master_join_ruvthi.source_id = navaids_points.navaid_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ccqyfr.*) AS annotation
  from master_join master_join_rqjdzv
  join notes.note_view notes_note_view_ccqyfr on master_join_rqjdzv.target_id = notes_note_view_ccqyfr.id
  where master_join_rqjdzv.source_id = navaids_points.navaid_ts.id
) as lat_annotation on TRUE
where navaids_points.navaid.feature_status = 'APPROVED'
  and navaids_points.navaid_ts.feature_status = 'APPROVED'
order by navaid.identifier, navaid_ts.sequence_number, navaid_ts.correction_number DESC;
create index on navaids_points.navaid_view (id);
-- NavigationAreaRestrictionTimeSliceType
-- ['shared.obstacleassessmentarea_view', 'notes.note_view', 'shared.circlesector_view']
drop materialized view if exists procedure.navigationarearestriction_view cascade;
create materialized view procedure.navigationarearestriction_view as
select distinct on (navigationarearestriction.identifier,navigationarearestriction_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.navigationarearestriction.id,
    procedure.navigationarearestriction_ts.id as ts_id,
    procedure.navigationarearestriction_tsp.id as tsp_id,
    procedure.navigationarearestriction.identifier,
    procedure.navigationarearestriction_ts.interpretation,
    procedure.navigationarearestriction_ts.sequence_number,
    procedure.navigationarearestriction_ts.correction_number,
    procedure.navigationarearestriction_ts.valid_time_begin,
    procedure.navigationarearestriction_ts.valid_time_end,
    procedure.navigationarearestriction_ts.feature_lifetime_begin,
    procedure.navigationarearestriction_ts.feature_lifetime_end,
    coalesce(cast(procedure.navigationarearestriction_ts.type_value as varchar), '(' || procedure.navigationarearestriction_ts.type_nilreason || ')') as type,
    to_jsonb(shared_obstacleassessmentarea_view_tmybxu.*) AS designsurface,
    to_jsonb(shared_circlesector_view_rvbtgy.*) AS sectordefinition,
    lat_annotation.annotation as annotation
from procedure.navigationarearestriction 
inner join master_join mj2 on procedure.navigationarearestriction.id = mj2.source_id
inner join procedure.navigationarearestriction_tsp on mj2.target_id = procedure.navigationarearestriction_tsp.id
inner join procedure.navigationarearestriction_ts on procedure.navigationarearestriction_tsp.navigationarearestrictiontimeslice_id = procedure.navigationarearestriction_ts.id
left join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_tmybxu on procedure.navigationarearestriction_ts.designsurface_id = shared_obstacleassessmentarea_view_tmybxu.id
left join shared.circlesector_view shared_circlesector_view_rvbtgy on procedure.navigationarearestriction_ts.sectordefinition_id = shared_circlesector_view_rvbtgy.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_swiapu.*) AS annotation
  from master_join master_join_yaizwc
  join notes.note_view notes_note_view_swiapu on master_join_yaizwc.target_id = notes_note_view_swiapu.id
  where master_join_yaizwc.source_id = procedure.navigationarearestriction_ts.id
) as lat_annotation on TRUE
where procedure.navigationarearestriction.feature_status = 'APPROVED'
  and procedure.navigationarearestriction_ts.feature_status = 'APPROVED'
order by navigationarearestriction.identifier, navigationarearestriction_ts.sequence_number, navigationarearestriction_ts.correction_number DESC;
create index on procedure.navigationarearestriction_view (id);
-- NavigationAreaTimeSliceType
-- ['procedure.navigationareasector_view', 'notes.note_view', 'geometry.point_view']
drop materialized view if exists procedure.navigationarea_view cascade;
create materialized view procedure.navigationarea_view as
select distinct on (navigationarea.identifier,navigationarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.navigationarea.id,
    procedure.navigationarea_ts.id as ts_id,
    procedure.navigationarea_tsp.id as tsp_id,
    procedure.navigationarea.identifier,
    procedure.navigationarea_ts.interpretation,
    procedure.navigationarea_ts.sequence_number,
    procedure.navigationarea_ts.correction_number,
    procedure.navigationarea_ts.valid_time_begin,
    procedure.navigationarea_ts.valid_time_end,
    procedure.navigationarea_ts.feature_lifetime_begin,
    procedure.navigationarea_ts.feature_lifetime_end,
    coalesce(cast(procedure.navigationarea_ts.navigationareatype_value as varchar), '(' || procedure.navigationarea_ts.navigationareatype_nilreason || ')') as navigationareatype,
    coalesce(cast(procedure.navigationarea_ts.minimumceiling_value as varchar) || ' ' || procedure.navigationarea_ts.minimumceiling_uom, '(' || procedure.navigationarea_ts.minimumceiling_nilreason || ')') as minimumceiling,
    coalesce(cast(procedure.navigationarea_ts.minimumvisibility_value as varchar) || ' ' || procedure.navigationarea_ts.minimumvisibility_uom, '(' || procedure.navigationarea_ts.minimumvisibility_nilreason || ')') as minimumvisibility,
    coalesce(cast(procedure_standardinstrumentdeparture_pt_sqwbav.title as varchar), '(' || procedure_standardinstrumentdeparture_pt_sqwbav.nilreason[1] || ')') AS departure,
    procedure_standardinstrumentdeparture_pt_sqwbav.href AS departure_href,
    coalesce(cast(navaids_points_designatedpoint_pt_hpbbxi.title as varchar), '(' || navaids_points_designatedpoint_pt_hpbbxi.nilreason[1] || ')') AS centrepointfixdesignatedpoint,
    navaids_points_designatedpoint_pt_hpbbxi.href AS centrepointfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_gylqne.title as varchar), '(' || navaids_points_navaid_pt_gylqne.nilreason[1] || ')') AS centrepointnavaidsystem,
    navaids_points_navaid_pt_gylqne.href AS centrepointnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_gagrhf.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_gagrhf.nilreason[1] || ')') AS centrepointaimingpoint,
    airport_heliport_touchdownliftoff_pt_gagrhf.href AS centrepointaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_wcnigl.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_wcnigl.nilreason[1] || ')') AS centrepointrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_wcnigl.href AS centrepointrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_hxhnps.title as varchar), '(' || airport_heliport_airportheliport_pt_hxhnps.nilreason[1] || ')') AS centrepointairportreferencepoint,
    airport_heliport_airportheliport_pt_hxhnps.href AS centrepointairportreferencepoint_href,
    geometry_point_view_jptytt.geom AS centrepointposition_geom,
    geometry_point_view_jptytt.longitude AS centrepointposition_longitude,
    geometry_point_view_jptytt.latitude AS centrepointposition_latitude,
    geometry_point_view_jptytt.horizontalAccuracy AS centrepointposition_horizontalaccuracy,
    lat_sector.lat_sector as sector,
    lat_annotation.annotation as annotation
from procedure.navigationarea 
inner join master_join mj2 on procedure.navigationarea.id = mj2.source_id
inner join procedure.navigationarea_tsp on mj2.target_id = procedure.navigationarea_tsp.id
inner join procedure.navigationarea_ts on procedure.navigationarea_tsp.navigationareatimeslice_id = procedure.navigationarea_ts.id
left join procedure.standardinstrumentdeparture_pt procedure_standardinstrumentdeparture_pt_sqwbav on procedure.navigationarea_ts.departure_id = procedure_standardinstrumentdeparture_pt_sqwbav.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_hpbbxi on procedure.navigationarea_ts.centrepoint_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_hpbbxi.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_gylqne on procedure.navigationarea_ts.centrepoint_navaidsystem_id = navaids_points_navaid_pt_gylqne.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_gagrhf on procedure.navigationarea_ts.centrepoint_aimingpoint_id = airport_heliport_touchdownliftoff_pt_gagrhf.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_wcnigl on procedure.navigationarea_ts.centrepoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_wcnigl.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_hxhnps on procedure.navigationarea_ts.centrepoint_airportreferencepoint_id = airport_heliport_airportheliport_pt_hxhnps.id
left join geometry.point_view geometry_point_view_jptytt on procedure.navigationarea_ts.centrepoint_position_id = geometry_point_view_jptytt.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_navigationareasector_view_bbmajx.*) as lat_sector
  from master_join master_join_bvocuv
  join procedure.navigationareasector_view procedure_navigationareasector_view_bbmajx on master_join_bvocuv.target_id = procedure_navigationareasector_view_bbmajx.id
  where master_join_bvocuv.source_id = procedure.navigationarea_ts.id
) as lat_sector on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_iqpfaz.*) AS annotation
  from master_join master_join_szpldo
  join notes.note_view notes_note_view_iqpfaz on master_join_szpldo.target_id = notes_note_view_iqpfaz.id
  where master_join_szpldo.source_id = procedure.navigationarea_ts.id
) as lat_annotation on TRUE
where procedure.navigationarea.feature_status = 'APPROVED'
  and procedure.navigationarea_ts.feature_status = 'APPROVED'
order by navigationarea.identifier, navigationarea_ts.sequence_number, navigationarea_ts.correction_number DESC;
create index on procedure.navigationarea_view (id);
-- NDBTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.ndb_view cascade;
create materialized view navaids_points.ndb_view as
select distinct on (ndb.identifier,ndb_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.ndb.id,
    navaids_points.ndb_ts.id as ts_id,
    navaids_points.ndb_tsp.id as tsp_id,
    navaids_points.ndb.identifier,
    navaids_points.ndb_ts.interpretation,
    navaids_points.ndb_ts.sequence_number,
    navaids_points.ndb_ts.correction_number,
    navaids_points.ndb_ts.valid_time_begin,
    navaids_points.ndb_ts.valid_time_end,
    navaids_points.ndb_ts.feature_lifetime_begin,
    navaids_points.ndb_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.ndb_ts.designator_value as varchar), '(' || navaids_points.ndb_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.ndb_ts.name_value as varchar), '(' || navaids_points.ndb_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.ndb_ts.emissionclass_value as varchar), '(' || navaids_points.ndb_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.ndb_ts.mobile_value as varchar), '(' || navaids_points.ndb_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.ndb_ts.magneticvariation_value as varchar), '(' || navaids_points.ndb_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.ndb_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.ndb_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.ndb_ts.datemagneticvariation_value as varchar), '(' || navaids_points.ndb_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.ndb_ts.flightchecked_value as varchar), '(' || navaids_points.ndb_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.ndb_ts.class_value as varchar), '(' || navaids_points.ndb_ts.class_nilreason || ')') as class,
    coalesce(cast(navaids_points.ndb_ts.emissionband_value as varchar), '(' || navaids_points.ndb_ts.emissionband_nilreason || ')') as emissionband,
    coalesce(cast(navaids_points.ndb_ts.frequency_value as varchar) || ' ' || navaids_points.ndb_ts.frequency_uom, '(' || navaids_points.ndb_ts.frequency_nilreason || ')') as frequency,
    geometry_elevatedpoint_view_mphpnu.geom AS location_geom,
    geometry_elevatedpoint_view_mphpnu.longitude AS location_longitude,
    geometry_elevatedpoint_view_mphpnu.latitude AS location_latitude,
    geometry_elevatedpoint_view_mphpnu.elevation AS location_elevation,
    geometry_elevatedpoint_view_mphpnu.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_mphpnu.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_mphpnu.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_mphpnu.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.ndb 
inner join master_join mj2 on navaids_points.ndb.id = mj2.source_id
inner join navaids_points.ndb_tsp on mj2.target_id = navaids_points.ndb_tsp.id
inner join navaids_points.ndb_ts on navaids_points.ndb_tsp.ndbtimeslice_id = navaids_points.ndb_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_mphpnu on navaids_points.ndb_ts.location_id = geometry_elevatedpoint_view_mphpnu.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_jagrjd.*) as lat_authority
  from master_join master_join_onkici
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_jagrjd on master_join_onkici.target_id = navaids_points_authorityfornavaidequipment_view_jagrjd.id
  where master_join_onkici.source_id = navaids_points.ndb_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_vpoain.*) as lat_monitoring
  from master_join master_join_kknaib
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_vpoain on master_join_kknaib.target_id = navaids_points_navaidequipmentmonitoring_view_vpoain.id
  where master_join_kknaib.source_id = navaids_points.ndb_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_fblfbg.*) as lat_availability
  from master_join master_join_tifwnt
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_fblfbg on master_join_tifwnt.target_id = navaids_points_navaidoperationalstatus_view_fblfbg.id
  where master_join_tifwnt.source_id = navaids_points.ndb_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_oomlux.*) AS annotation
  from master_join master_join_rglptu
  join notes.note_view notes_note_view_oomlux on master_join_rglptu.target_id = notes_note_view_oomlux.id
  where master_join_rglptu.source_id = navaids_points.ndb_ts.id
) as lat_annotation on TRUE
where navaids_points.ndb.feature_status = 'APPROVED'
  and navaids_points.ndb_ts.feature_status = 'APPROVED'
order by ndb.identifier, ndb_ts.sequence_number, ndb_ts.correction_number DESC;
create index on navaids_points.ndb_view (id);
-- NonMovementAreaTimeSliceType
-- ['geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.nonmovementarea_view cascade;
create materialized view airport_heliport.nonmovementarea_view as
select distinct on (nonmovementarea.identifier,nonmovementarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.nonmovementarea.id,
    airport_heliport.nonmovementarea_ts.id as ts_id,
    airport_heliport.nonmovementarea_tsp.id as tsp_id,
    airport_heliport.nonmovementarea.identifier,
    airport_heliport.nonmovementarea_ts.interpretation,
    airport_heliport.nonmovementarea_ts.sequence_number,
    airport_heliport.nonmovementarea_ts.correction_number,
    airport_heliport.nonmovementarea_ts.valid_time_begin,
    airport_heliport.nonmovementarea_ts.valid_time_end,
    airport_heliport.nonmovementarea_ts.feature_lifetime_begin,
    airport_heliport.nonmovementarea_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport_airportheliport_pt_ranqye.title as varchar), '(' || airport_heliport_airportheliport_pt_ranqye.nilreason[1] || ')') AS associatedairportheliport,
    airport_heliport_airportheliport_pt_ranqye.href AS associatedairportheliport_href,
    geometry_elevatedsurface_view_rtsfar.geom AS extent_geom,
    geometry_elevatedsurface_view_rtsfar.elevation AS extent_elevation,
    geometry_elevatedsurface_view_rtsfar.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_rtsfar.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_rtsfar.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_rtsfar.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_annotation.annotation as annotation
from airport_heliport.nonmovementarea 
inner join master_join mj2 on airport_heliport.nonmovementarea.id = mj2.source_id
inner join airport_heliport.nonmovementarea_tsp on mj2.target_id = airport_heliport.nonmovementarea_tsp.id
inner join airport_heliport.nonmovementarea_ts on airport_heliport.nonmovementarea_tsp.nonmovementareatimeslice_id = airport_heliport.nonmovementarea_ts.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_ranqye on airport_heliport.nonmovementarea_ts.associatedairportheliport_id = airport_heliport_airportheliport_pt_ranqye.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_rtsfar on airport_heliport.nonmovementarea_ts.extent_id = geometry_elevatedsurface_view_rtsfar.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hssjig.*) AS annotation
  from master_join master_join_oxyrhq
  join notes.note_view notes_note_view_hssjig on master_join_oxyrhq.target_id = notes_note_view_hssjig.id
  where master_join_oxyrhq.source_id = airport_heliport.nonmovementarea_ts.id
) as lat_annotation on TRUE
where airport_heliport.nonmovementarea.feature_status = 'APPROVED'
  and airport_heliport.nonmovementarea_ts.feature_status = 'APPROVED'
order by nonmovementarea.identifier, nonmovementarea_ts.sequence_number, nonmovementarea_ts.correction_number DESC;
create index on airport_heliport.nonmovementarea_view (id);
-- ObstacleAreaTimeSliceType
-- ['geometry.surface_view', 'notes.note_view']
drop materialized view if exists obstacles.obstaclearea_view cascade;
create materialized view obstacles.obstaclearea_view as
select distinct on (obstaclearea.identifier,obstaclearea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    obstacles.obstaclearea.id,
    obstacles.obstaclearea_ts.id as ts_id,
    obstacles.obstaclearea_tsp.id as tsp_id,
    obstacles.obstaclearea.identifier,
    obstacles.obstaclearea_ts.interpretation,
    obstacles.obstaclearea_ts.sequence_number,
    obstacles.obstaclearea_ts.correction_number,
    obstacles.obstaclearea_ts.valid_time_begin,
    obstacles.obstaclearea_ts.valid_time_end,
    obstacles.obstaclearea_ts.feature_lifetime_begin,
    obstacles.obstaclearea_ts.feature_lifetime_end,
    coalesce(cast(obstacles.obstaclearea_ts.type_value as varchar), '(' || obstacles.obstaclearea_ts.type_nilreason || ')') as type,
    coalesce(cast(obstacles.obstaclearea_ts.obstructionidsurfacecondition_value as varchar), '(' || obstacles.obstaclearea_ts.obstructionidsurfacecondition_nilreason || ')') as obstructionidsurfacecondition,
    coalesce(cast(airport_heliport_airportheliport_pt_ktyzhl.title as varchar), '(' || airport_heliport_airportheliport_pt_ktyzhl.nilreason[1] || ')') AS referenceownerairport,
    airport_heliport_airportheliport_pt_ktyzhl.href AS referenceownerairport_href,
    coalesce(cast(airport_heliport_runwaydirection_pt_rnseln.title as varchar), '(' || airport_heliport_runwaydirection_pt_rnseln.nilreason[1] || ')') AS referenceownerrunway,
    airport_heliport_runwaydirection_pt_rnseln.href AS referenceownerrunway_href,
    coalesce(cast(organisation_organisationauthority_pt_qryebo.title as varchar), '(' || organisation_organisationauthority_pt_qryebo.nilreason[1] || ')') AS referenceownerorganisation,
    organisation_organisationauthority_pt_qryebo.href AS referenceownerorganisation_href,
    geometry_surface_view_ftnznx.geom AS surfaceextent_geom,
    geometry_surface_view_ftnznx.horizontalAccuracy as surfaceextent_horizontalaccuracy,
    lat_obstacle.lat_obstacle as obstacle,
    lat_annotation.annotation as annotation
from obstacles.obstaclearea 
inner join master_join mj2 on obstacles.obstaclearea.id = mj2.source_id
inner join obstacles.obstaclearea_tsp on mj2.target_id = obstacles.obstaclearea_tsp.id
inner join obstacles.obstaclearea_ts on obstacles.obstaclearea_tsp.obstacleareatimeslice_id = obstacles.obstaclearea_ts.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_ktyzhl on obstacles.obstaclearea_ts.reference_ownerairport_id = airport_heliport_airportheliport_pt_ktyzhl.id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_rnseln on obstacles.obstaclearea_ts.reference_ownerrunway_id = airport_heliport_runwaydirection_pt_rnseln.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_qryebo on obstacles.obstaclearea_ts.reference_ownerorganisation_id = organisation_organisationauthority_pt_qryebo.id
left join geometry.surface_view geometry_surface_view_ftnznx on obstacles.obstaclearea_ts.surfaceextent_id = geometry_surface_view_ftnznx.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', obstacles_verticalstructure_pt_ipaxxg.id,
      'title', coalesce(cast(obstacles_verticalstructure_pt_ipaxxg.title AS varchar), '(' || obstacles_verticalstructure_pt_ipaxxg.nilreason[1] || ')'),
      'href', obstacles_verticalstructure_pt_ipaxxg.href
  )) as lat_obstacle  from master_join master_join_andumq
  join obstacles.verticalstructure_pt obstacles_verticalstructure_pt_ipaxxg on master_join_andumq.target_id = obstacles_verticalstructure_pt_ipaxxg.id
  where master_join_andumq.source_id = obstacles.obstaclearea_ts.id
) as lat_obstacle on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_sjzmez.*) AS annotation
  from master_join master_join_ouwdbx
  join notes.note_view notes_note_view_sjzmez on master_join_ouwdbx.target_id = notes_note_view_sjzmez.id
  where master_join_ouwdbx.source_id = obstacles.obstaclearea_ts.id
) as lat_annotation on TRUE
where obstacles.obstaclearea.feature_status = 'APPROVED'
  and obstacles.obstaclearea_ts.feature_status = 'APPROVED'
order by obstaclearea.identifier, obstaclearea_ts.sequence_number, obstaclearea_ts.correction_number DESC;
create index on obstacles.obstaclearea_view (id);
-- OrganisationAuthorityTimeSliceType
-- ['organisation.organisationauthorityassociation_view', 'notes.note_view', 'shared.contactinformation_view']
drop materialized view if exists organisation.organisationauthority_view cascade;
create materialized view organisation.organisationauthority_view as
select distinct on (organisationauthority.identifier,organisationauthority_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    organisation.organisationauthority.id,
    organisation.organisationauthority_ts.id as ts_id,
    organisation.organisationauthority_tsp.id as tsp_id,
    organisation.organisationauthority.identifier,
    organisation.organisationauthority_ts.interpretation,
    organisation.organisationauthority_ts.sequence_number,
    organisation.organisationauthority_ts.correction_number,
    organisation.organisationauthority_ts.valid_time_begin,
    organisation.organisationauthority_ts.valid_time_end,
    organisation.organisationauthority_ts.feature_lifetime_begin,
    organisation.organisationauthority_ts.feature_lifetime_end,
    coalesce(cast(organisation.organisationauthority_ts.name_value as varchar), '(' || organisation.organisationauthority_ts.name_nilreason || ')') as name,
    coalesce(cast(organisation.organisationauthority_ts.designator_value as varchar), '(' || organisation.organisationauthority_ts.designator_nilreason || ')') as designator,
    coalesce(cast(organisation.organisationauthority_ts.type_value as varchar), '(' || organisation.organisationauthority_ts.type_nilreason || ')') as type,
    coalesce(cast(organisation.organisationauthority_ts.military_value as varchar), '(' || organisation.organisationauthority_ts.military_nilreason || ')') as military,
    lat_relatedorganisationauthority.lat_relatedorganisationauthority as relatedorganisationauthority,
    lat_annotation.annotation as annotation
from organisation.organisationauthority 
inner join master_join mj2 on organisation.organisationauthority.id = mj2.source_id
inner join organisation.organisationauthority_tsp on mj2.target_id = organisation.organisationauthority_tsp.id
inner join organisation.organisationauthority_ts on organisation.organisationauthority_tsp.organisationauthoritytimeslice_id = organisation.organisationauthority_ts.id
left join lateral(
  select
  from master_join master_join_wwjhna
  join shared.contactinformation_view shared_contactinformation_view_juoxth on master_join_wwjhna.target_id = shared_contactinformation_view_juoxth.id
  where master_join_wwjhna.source_id = organisation.organisationauthority_ts.id
) as lat_contact on TRUE
left join lateral(
  select jsonb_agg(DISTINCT organisation_organisationauthorityassociation_view_nynvus.*) as lat_relatedorganisationauthority
  from master_join master_join_swyajy
  join organisation.organisationauthorityassociation_view organisation_organisationauthorityassociation_view_nynvus on master_join_swyajy.target_id = organisation_organisationauthorityassociation_view_nynvus.id
  where master_join_swyajy.source_id = organisation.organisationauthority_ts.id
) as lat_relatedorganisationauthority on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ubavsx.*) AS annotation
  from master_join master_join_kxxges
  join notes.note_view notes_note_view_ubavsx on master_join_kxxges.target_id = notes_note_view_ubavsx.id
  where master_join_kxxges.source_id = organisation.organisationauthority_ts.id
) as lat_annotation on TRUE
where organisation.organisationauthority.feature_status = 'APPROVED'
  and organisation.organisationauthority_ts.feature_status = 'APPROVED'
order by organisationauthority.identifier, organisationauthority_ts.sequence_number, organisationauthority_ts.correction_number DESC;
create index on organisation.organisationauthority_view (id);
-- PassengerLoadingBridgeTimeSliceType
-- ['geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.passengerloadingbridge_view cascade;
create materialized view airport_heliport.passengerloadingbridge_view as
select distinct on (passengerloadingbridge.identifier,passengerloadingbridge_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.passengerloadingbridge.id,
    airport_heliport.passengerloadingbridge_ts.id as ts_id,
    airport_heliport.passengerloadingbridge_tsp.id as tsp_id,
    airport_heliport.passengerloadingbridge.identifier,
    airport_heliport.passengerloadingbridge_ts.interpretation,
    airport_heliport.passengerloadingbridge_ts.sequence_number,
    airport_heliport.passengerloadingbridge_ts.correction_number,
    airport_heliport.passengerloadingbridge_ts.valid_time_begin,
    airport_heliport.passengerloadingbridge_ts.valid_time_end,
    airport_heliport.passengerloadingbridge_ts.feature_lifetime_begin,
    airport_heliport.passengerloadingbridge_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.passengerloadingbridge_ts.type_value as varchar), '(' || airport_heliport.passengerloadingbridge_ts.type_nilreason || ')') as type,
    geometry_elevatedsurface_view_jbjyqe.geom AS extent_geom,
    geometry_elevatedsurface_view_jbjyqe.elevation AS extent_elevation,
    geometry_elevatedsurface_view_jbjyqe.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_jbjyqe.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_jbjyqe.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_jbjyqe.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_associatedstand.lat_associatedstand as associatedstand,
    lat_annotation.annotation as annotation
from airport_heliport.passengerloadingbridge 
inner join master_join mj2 on airport_heliport.passengerloadingbridge.id = mj2.source_id
inner join airport_heliport.passengerloadingbridge_tsp on mj2.target_id = airport_heliport.passengerloadingbridge_tsp.id
inner join airport_heliport.passengerloadingbridge_ts on airport_heliport.passengerloadingbridge_tsp.passengerloadingbridgetimeslice_id = airport_heliport.passengerloadingbridge_ts.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_jbjyqe on airport_heliport.passengerloadingbridge_ts.extent_id = geometry_elevatedsurface_view_jbjyqe.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_aircraftstand_pt_xektje.id,
      'title', coalesce(cast(airport_heliport_aircraftstand_pt_xektje.title AS varchar), '(' || airport_heliport_aircraftstand_pt_xektje.nilreason[1] || ')'),
      'href', airport_heliport_aircraftstand_pt_xektje.href
  )) as lat_associatedstand  from master_join master_join_mglomu
  join airport_heliport.aircraftstand_pt airport_heliport_aircraftstand_pt_xektje on master_join_mglomu.target_id = airport_heliport_aircraftstand_pt_xektje.id
  where master_join_mglomu.source_id = airport_heliport.passengerloadingbridge_ts.id
) as lat_associatedstand on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_cchmwx.*) AS annotation
  from master_join master_join_ahobgu
  join notes.note_view notes_note_view_cchmwx on master_join_ahobgu.target_id = notes_note_view_cchmwx.id
  where master_join_ahobgu.source_id = airport_heliport.passengerloadingbridge_ts.id
) as lat_annotation on TRUE
where airport_heliport.passengerloadingbridge.feature_status = 'APPROVED'
  and airport_heliport.passengerloadingbridge_ts.feature_status = 'APPROVED'
order by passengerloadingbridge.identifier, passengerloadingbridge_ts.sequence_number, passengerloadingbridge_ts.correction_number DESC;
create index on airport_heliport.passengerloadingbridge_view (id);
-- PassengerServiceTimeSliceType
-- ['geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.passengerservice_view cascade;
create materialized view service.passengerservice_view as
select distinct on (passengerservice.identifier,passengerservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.passengerservice.id,
    service.passengerservice_ts.id as ts_id,
    service.passengerservice_tsp.id as tsp_id,
    service.passengerservice.identifier,
    service.passengerservice_ts.interpretation,
    service.passengerservice_ts.sequence_number,
    service.passengerservice_ts.correction_number,
    service.passengerservice_ts.valid_time_begin,
    service.passengerservice_ts.valid_time_end,
    service.passengerservice_ts.feature_lifetime_begin,
    service.passengerservice_ts.feature_lifetime_end,
    coalesce(cast(service.passengerservice_ts.flightoperations_value as varchar), '(' || service.passengerservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.passengerservice_ts.rank_value as varchar), '(' || service.passengerservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.passengerservice_ts.complianticao_value as varchar), '(' || service.passengerservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.passengerservice_ts.name_value as varchar), '(' || service.passengerservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.passengerservice_ts.type_value as varchar), '(' || service.passengerservice_ts.type_nilreason || ')') as type,
    geometry_elevatedpoint_view_rixkkd.geom AS location_geom,
    geometry_elevatedpoint_view_rixkkd.longitude AS location_longitude,
    geometry_elevatedpoint_view_rixkkd.latitude AS location_latitude,
    geometry_elevatedpoint_view_rixkkd.elevation AS location_elevation,
    geometry_elevatedpoint_view_rixkkd.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_rixkkd.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_rixkkd.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_rixkkd.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_erqefi.title as varchar), '(' || organisation_unit_pt_erqefi.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_erqefi.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_airportheliport.lat_airportheliport as airportheliport
from service.passengerservice 
inner join master_join mj2 on service.passengerservice.id = mj2.source_id
inner join service.passengerservice_tsp on mj2.target_id = service.passengerservice_tsp.id
inner join service.passengerservice_ts on service.passengerservice_tsp.passengerservicetimeslice_id = service.passengerservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_rixkkd on service.passengerservice_ts.location_id = geometry_elevatedpoint_view_rixkkd.id
left join organisation.unit_pt organisation_unit_pt_erqefi on service.passengerservice_ts.serviceprovider_id = organisation_unit_pt_erqefi.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_yndnez.*) as lat_callsign
  from master_join master_join_fsdbbs
  join service.callsigndetail_view service_callsigndetail_view_yndnez on master_join_fsdbbs.target_id = service_callsigndetail_view_yndnez.id
  where master_join_fsdbbs.source_id = service.passengerservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_uuyadd.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_uuyadd.title AS varchar), '(' || service_radiocommunicationchannel_pt_uuyadd.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_uuyadd.href
  )) as lat_radiocommunication  from master_join master_join_dbamle
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_uuyadd on master_join_dbamle.target_id = service_radiocommunicationchannel_pt_uuyadd.id
  where master_join_dbamle.source_id = service.passengerservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_uqaxje
  join shared.contactinformation_view shared_contactinformation_view_huuurm on master_join_uqaxje.target_id = shared_contactinformation_view_huuurm.id
  where master_join_uqaxje.source_id = service.passengerservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_vpfniq.*) as lat_availability
  from master_join master_join_xxpart
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_vpfniq on master_join_xxpart.target_id = service_serviceoperationalstatus_view_vpfniq.id
  where master_join_xxpart.source_id = service.passengerservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_alhvpp.*) AS annotation
  from master_join master_join_vyocsl
  join notes.note_view notes_note_view_alhvpp on master_join_vyocsl.target_id = notes_note_view_alhvpp.id
  where master_join_vyocsl.source_id = service.passengerservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_blxcbx.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_blxcbx.title AS varchar), '(' || airport_heliport_airportheliport_pt_blxcbx.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_blxcbx.href
  )) as lat_airportheliport  from master_join master_join_xuxglf
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_blxcbx on master_join_xuxglf.target_id = airport_heliport_airportheliport_pt_blxcbx.id
  where master_join_xuxglf.source_id = service.passengerservice_ts.id
) as lat_airportheliport on TRUE
where service.passengerservice.feature_status = 'APPROVED'
  and service.passengerservice_ts.feature_status = 'APPROVED'
order by passengerservice.identifier, passengerservice_ts.sequence_number, passengerservice_ts.correction_number DESC;
create index on service.passengerservice_view (id);
-- PilotControlledLightingTimeSliceType
-- ['airport_heliport.lightactivation_view', 'notes.note_view']
drop materialized view if exists service.pilotcontrolledlighting_view cascade;
create materialized view service.pilotcontrolledlighting_view as
select distinct on (pilotcontrolledlighting.identifier,pilotcontrolledlighting_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.pilotcontrolledlighting.id,
    service.pilotcontrolledlighting_ts.id as ts_id,
    service.pilotcontrolledlighting_tsp.id as tsp_id,
    service.pilotcontrolledlighting.identifier,
    service.pilotcontrolledlighting_ts.interpretation,
    service.pilotcontrolledlighting_ts.sequence_number,
    service.pilotcontrolledlighting_ts.correction_number,
    service.pilotcontrolledlighting_ts.valid_time_begin,
    service.pilotcontrolledlighting_ts.valid_time_end,
    service.pilotcontrolledlighting_ts.feature_lifetime_begin,
    service.pilotcontrolledlighting_ts.feature_lifetime_end,
    coalesce(cast(service.pilotcontrolledlighting_ts.type_value as varchar), '(' || service.pilotcontrolledlighting_ts.type_nilreason || ')') as type,
    coalesce(cast(service.pilotcontrolledlighting_ts.intensitysteps_value as varchar), '(' || service.pilotcontrolledlighting_ts.intensitysteps_nilreason || ')') as intensitysteps,
    coalesce(cast(service.pilotcontrolledlighting_ts.standbyintensity_value as varchar), '(' || service.pilotcontrolledlighting_ts.standbyintensity_nilreason || ')') as standbyintensity,
    coalesce(cast(service.pilotcontrolledlighting_ts.activationinstruction_value as varchar), '(' || service.pilotcontrolledlighting_ts.activationinstruction_nilreason || ')') as activationinstruction,
    coalesce(cast(service.pilotcontrolledlighting_ts.duration_value as varchar) || ' ' || service.pilotcontrolledlighting_ts.duration_uom, '(' || service.pilotcontrolledlighting_ts.duration_nilreason || ')') as duration,
    coalesce(cast(service.pilotcontrolledlighting_ts.radiofrequency_value as varchar) || ' ' || service.pilotcontrolledlighting_ts.radiofrequency_uom, '(' || service.pilotcontrolledlighting_ts.radiofrequency_nilreason || ')') as radiofrequency,
    lat_controlledlightintensity.lat_controlledlightintensity as controlledlightintensity,
    lat_annotation.annotation as annotation
from service.pilotcontrolledlighting 
inner join master_join mj2 on service.pilotcontrolledlighting.id = mj2.source_id
inner join service.pilotcontrolledlighting_tsp on mj2.target_id = service.pilotcontrolledlighting_tsp.id
inner join service.pilotcontrolledlighting_ts on service.pilotcontrolledlighting_tsp.pilotcontrolledlightingtimeslice_id = service.pilotcontrolledlighting_ts.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_lightactivation_view_prxfgi.*) as lat_controlledlightintensity
  from master_join master_join_kbnzwm
  join airport_heliport.lightactivation_view airport_heliport_lightactivation_view_prxfgi on master_join_kbnzwm.target_id = airport_heliport_lightactivation_view_prxfgi.id
  where master_join_kbnzwm.source_id = service.pilotcontrolledlighting_ts.id
) as lat_controlledlightintensity on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_eqqdfc.*) AS annotation
  from master_join master_join_fuzefn
  join notes.note_view notes_note_view_eqqdfc on master_join_fuzefn.target_id = notes_note_view_eqqdfc.id
  where master_join_fuzefn.source_id = service.pilotcontrolledlighting_ts.id
) as lat_annotation on TRUE
where service.pilotcontrolledlighting.feature_status = 'APPROVED'
  and service.pilotcontrolledlighting_ts.feature_status = 'APPROVED'
order by pilotcontrolledlighting.identifier, pilotcontrolledlighting_ts.sequence_number, pilotcontrolledlighting_ts.correction_number DESC;
create index on service.pilotcontrolledlighting_view (id);
-- PrecisionApproachRadarTimeSliceType
-- ['surveillance.reflector_view', 'notes.note_view', 'geometry.elevatedpoint_view', 'shared.contactinformation_view']
drop materialized view if exists surveillance.precisionapproachradar_view cascade;
create materialized view surveillance.precisionapproachradar_view as
select distinct on (precisionapproachradar.identifier,precisionapproachradar_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    surveillance.precisionapproachradar.id,
    surveillance.precisionapproachradar_ts.id as ts_id,
    surveillance.precisionapproachradar_tsp.id as tsp_id,
    surveillance.precisionapproachradar.identifier,
    surveillance.precisionapproachradar_ts.interpretation,
    surveillance.precisionapproachradar_ts.sequence_number,
    surveillance.precisionapproachradar_ts.correction_number,
    surveillance.precisionapproachradar_ts.valid_time_begin,
    surveillance.precisionapproachradar_ts.valid_time_end,
    surveillance.precisionapproachradar_ts.feature_lifetime_begin,
    surveillance.precisionapproachradar_ts.feature_lifetime_end,
    coalesce(cast(surveillance.precisionapproachradar_ts.name_value as varchar), '(' || surveillance.precisionapproachradar_ts.name_nilreason || ')') as name,
    coalesce(cast(surveillance.precisionapproachradar_ts.serialnumber_value as varchar), '(' || surveillance.precisionapproachradar_ts.serialnumber_nilreason || ')') as serialnumber,
    coalesce(cast(surveillance.precisionapproachradar_ts.dualchannel_value as varchar), '(' || surveillance.precisionapproachradar_ts.dualchannel_nilreason || ')') as dualchannel,
    coalesce(cast(surveillance.precisionapproachradar_ts.movingtargetindicator_value as varchar), '(' || surveillance.precisionapproachradar_ts.movingtargetindicator_nilreason || ')') as movingtargetindicator,
    coalesce(cast(surveillance.precisionapproachradar_ts.standbypower_value as varchar), '(' || surveillance.precisionapproachradar_ts.standbypower_nilreason || ')') as standbypower,
    coalesce(cast(surveillance.precisionapproachradar_ts.digital_value as varchar), '(' || surveillance.precisionapproachradar_ts.digital_nilreason || ')') as digital,
    coalesce(cast(surveillance.precisionapproachradar_ts.militaryuseonly_value as varchar), '(' || surveillance.precisionapproachradar_ts.militaryuseonly_nilreason || ')') as militaryuseonly,
    coalesce(cast(surveillance.precisionapproachradar_ts.specialuseonly_value as varchar), '(' || surveillance.precisionapproachradar_ts.specialuseonly_nilreason || ')') as specialuseonly,
    coalesce(cast(surveillance.precisionapproachradar_ts.specialaircraftonly_value as varchar), '(' || surveillance.precisionapproachradar_ts.specialaircraftonly_nilreason || ')') as specialaircraftonly,
    coalesce(cast(surveillance.precisionapproachradar_ts.magneticvariation_value as varchar), '(' || surveillance.precisionapproachradar_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(surveillance.precisionapproachradar_ts.magneticvariationaccuracy_value as varchar), '(' || surveillance.precisionapproachradar_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(surveillance.precisionapproachradar_ts.datemagneticvariation_value as varchar), '(' || surveillance.precisionapproachradar_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(surveillance.precisionapproachradar_ts.precisionapproachradartype_value as varchar), '(' || surveillance.precisionapproachradar_ts.precisionapproachradartype_nilreason || ')') as precisionapproachradartype,
    coalesce(cast(surveillance.precisionapproachradar_ts.slope_value as varchar), '(' || surveillance.precisionapproachradar_ts.slope_nilreason || ')') as slope,
    coalesce(cast(surveillance.precisionapproachradar_ts.slopeaccuracy_value as varchar), '(' || surveillance.precisionapproachradar_ts.slopeaccuracy_nilreason || ')') as slopeaccuracy,
    coalesce(cast(surveillance.precisionapproachradar_ts.range_value as varchar) || ' ' || surveillance.precisionapproachradar_ts.range_uom, '(' || surveillance.precisionapproachradar_ts.range_nilreason || ')') as range,
    coalesce(cast(surveillance.precisionapproachradar_ts.rangeaccuracy_value as varchar) || ' ' || surveillance.precisionapproachradar_ts.rangeaccuracy_uom, '(' || surveillance.precisionapproachradar_ts.rangeaccuracy_nilreason || ')') as rangeaccuracy,
    geometry_elevatedpoint_view_pljsuk.geom AS location_geom,
    geometry_elevatedpoint_view_pljsuk.longitude AS location_longitude,
    geometry_elevatedpoint_view_pljsuk.latitude AS location_latitude,
    geometry_elevatedpoint_view_pljsuk.elevation AS location_elevation,
    geometry_elevatedpoint_view_pljsuk.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_pljsuk.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_pljsuk.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_pljsuk.horizontalAccuracy AS location_horizontalaccuracy,
    lat_annotation.annotation as annotation,
    lat_reflector.lat_reflector as reflector
from surveillance.precisionapproachradar 
inner join master_join mj2 on surveillance.precisionapproachradar.id = mj2.source_id
inner join surveillance.precisionapproachradar_tsp on mj2.target_id = surveillance.precisionapproachradar_tsp.id
inner join surveillance.precisionapproachradar_ts on surveillance.precisionapproachradar_tsp.precisionapproachradartimeslice_id = surveillance.precisionapproachradar_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_pljsuk on surveillance.precisionapproachradar_ts.location_id = geometry_elevatedpoint_view_pljsuk.id
left join lateral(
  select
  from master_join master_join_fikvbh
  join shared.contactinformation_view shared_contactinformation_view_dbzxkj on master_join_fikvbh.target_id = shared_contactinformation_view_dbzxkj.id
  where master_join_fikvbh.source_id = surveillance.precisionapproachradar_ts.id
) as lat_contact on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_teizcr.*) AS annotation
  from master_join master_join_biapew
  join notes.note_view notes_note_view_teizcr on master_join_biapew.target_id = notes_note_view_teizcr.id
  where master_join_biapew.source_id = surveillance.precisionapproachradar_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT surveillance_reflector_view_dqffqm.*) as lat_reflector
  from master_join master_join_vgjmrz
  join surveillance.reflector_view surveillance_reflector_view_dqffqm on master_join_vgjmrz.target_id = surveillance_reflector_view_dqffqm.id
  where master_join_vgjmrz.source_id = surveillance.precisionapproachradar_ts.id
) as lat_reflector on TRUE
where surveillance.precisionapproachradar.feature_status = 'APPROVED'
  and surveillance.precisionapproachradar_ts.feature_status = 'APPROVED'
order by precisionapproachradar.identifier, precisionapproachradar_ts.sequence_number, precisionapproachradar_ts.correction_number DESC;
create index on surveillance.precisionapproachradar_view (id);
-- PrimarySurveillanceRadarTimeSliceType
-- ['surveillance.surveillancegroundstation_view', 'notes.note_view', 'geometry.elevatedpoint_view', 'shared.contactinformation_view']
drop materialized view if exists surveillance.primarysurveillanceradar_view cascade;
create materialized view surveillance.primarysurveillanceradar_view as
select distinct on (primarysurveillanceradar.identifier,primarysurveillanceradar_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    surveillance.primarysurveillanceradar.id,
    surveillance.primarysurveillanceradar_ts.id as ts_id,
    surveillance.primarysurveillanceradar_tsp.id as tsp_id,
    surveillance.primarysurveillanceradar.identifier,
    surveillance.primarysurveillanceradar_ts.interpretation,
    surveillance.primarysurveillanceradar_ts.sequence_number,
    surveillance.primarysurveillanceradar_ts.correction_number,
    surveillance.primarysurveillanceradar_ts.valid_time_begin,
    surveillance.primarysurveillanceradar_ts.valid_time_end,
    surveillance.primarysurveillanceradar_ts.feature_lifetime_begin,
    surveillance.primarysurveillanceradar_ts.feature_lifetime_end,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.name_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.name_nilreason || ')') as name,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.serialnumber_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.serialnumber_nilreason || ')') as serialnumber,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.dualchannel_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.dualchannel_nilreason || ')') as dualchannel,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.movingtargetindicator_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.movingtargetindicator_nilreason || ')') as movingtargetindicator,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.standbypower_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.standbypower_nilreason || ')') as standbypower,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.digital_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.digital_nilreason || ')') as digital,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.militaryuseonly_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.militaryuseonly_nilreason || ')') as militaryuseonly,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.specialuseonly_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.specialuseonly_nilreason || ')') as specialuseonly,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.specialaircraftonly_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.specialaircraftonly_nilreason || ')') as specialaircraftonly,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.magneticvariation_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.magneticvariationaccuracy_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.datemagneticvariation_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.verticalcoverageazimuth_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.verticalcoverageazimuth_nilreason || ')') as verticalcoverageazimuth,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.antennatiltfixed_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.antennatiltfixed_nilreason || ')') as antennatiltfixed,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.tiltangle_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.tiltangle_nilreason || ')') as tiltangle,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.automatedradarterminalsystem_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.automatedradarterminalsystem_nilreason || ')') as automatedradarterminalsystem,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.type_value as varchar), '(' || surveillance.primarysurveillanceradar_ts.type_nilreason || ')') as type,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.range_value as varchar) || ' ' || surveillance.primarysurveillanceradar_ts.range_uom, '(' || surveillance.primarysurveillanceradar_ts.range_nilreason || ')') as range,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.rangeaccuracy_value as varchar) || ' ' || surveillance.primarysurveillanceradar_ts.rangeaccuracy_uom, '(' || surveillance.primarysurveillanceradar_ts.rangeaccuracy_nilreason || ')') as rangeaccuracy,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.verticalcoveragealtitude_value as varchar) || ' ' || surveillance.primarysurveillanceradar_ts.verticalcoveragealtitude_uom, '(' || surveillance.primarysurveillanceradar_ts.verticalcoveragealtitude_nilreason || ')') as verticalcoveragealtitude,
    coalesce(cast(surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_value as varchar) || ' ' || surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_uom, '(' || surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_nilreason || ')') as verticalcoveragedistance,
    geometry_elevatedpoint_view_ejnbja.geom AS location_geom,
    geometry_elevatedpoint_view_ejnbja.longitude AS location_longitude,
    geometry_elevatedpoint_view_ejnbja.latitude AS location_latitude,
    geometry_elevatedpoint_view_ejnbja.elevation AS location_elevation,
    geometry_elevatedpoint_view_ejnbja.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_ejnbja.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_ejnbja.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_ejnbja.horizontalAccuracy AS location_horizontalaccuracy,
    lat_annotation.annotation as annotation,
    lat_groundstation.lat_groundstation as groundstation
from surveillance.primarysurveillanceradar 
inner join master_join mj2 on surveillance.primarysurveillanceradar.id = mj2.source_id
inner join surveillance.primarysurveillanceradar_tsp on mj2.target_id = surveillance.primarysurveillanceradar_tsp.id
inner join surveillance.primarysurveillanceradar_ts on surveillance.primarysurveillanceradar_tsp.primarysurveillanceradartimeslice_id = surveillance.primarysurveillanceradar_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_ejnbja on surveillance.primarysurveillanceradar_ts.location_id = geometry_elevatedpoint_view_ejnbja.id
left join lateral(
  select
  from master_join master_join_dehcmi
  join shared.contactinformation_view shared_contactinformation_view_cbypqj on master_join_dehcmi.target_id = shared_contactinformation_view_cbypqj.id
  where master_join_dehcmi.source_id = surveillance.primarysurveillanceradar_ts.id
) as lat_contact on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_ahqgvt.*) AS annotation
  from master_join master_join_ddmyod
  join notes.note_view notes_note_view_ahqgvt on master_join_ddmyod.target_id = notes_note_view_ahqgvt.id
  where master_join_ddmyod.source_id = surveillance.primarysurveillanceradar_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT surveillance_surveillancegroundstation_view_esdcdp.*) as lat_groundstation
  from master_join master_join_uwlpfr
  join surveillance.surveillancegroundstation_view surveillance_surveillancegroundstation_view_esdcdp on master_join_uwlpfr.target_id = surveillance_surveillancegroundstation_view_esdcdp.id
  where master_join_uwlpfr.source_id = surveillance.primarysurveillanceradar_ts.id
) as lat_groundstation on TRUE
where surveillance.primarysurveillanceradar.feature_status = 'APPROVED'
  and surveillance.primarysurveillanceradar_ts.feature_status = 'APPROVED'
order by primarysurveillanceradar.identifier, primarysurveillanceradar_ts.sequence_number, primarysurveillanceradar_ts.correction_number DESC;
create index on surveillance.primarysurveillanceradar_view (id);
-- ProcedureDMETimeSliceType
-- ['notes.note_view']
drop materialized view if exists procedure.proceduredme_view cascade;
create materialized view procedure.proceduredme_view as
select distinct on (proceduredme.identifier,proceduredme_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.proceduredme.id,
    procedure.proceduredme_ts.id as ts_id,
    procedure.proceduredme_tsp.id as tsp_id,
    procedure.proceduredme.identifier,
    procedure.proceduredme_ts.interpretation,
    procedure.proceduredme_ts.sequence_number,
    procedure.proceduredme_ts.correction_number,
    procedure.proceduredme_ts.valid_time_begin,
    procedure.proceduredme_ts.valid_time_end,
    procedure.proceduredme_ts.feature_lifetime_begin,
    procedure.proceduredme_ts.feature_lifetime_end,
    coalesce(cast(procedure.proceduredme_ts.criticaldme_value as varchar), '(' || procedure.proceduredme_ts.criticaldme_nilreason || ')') as criticaldme,
    coalesce(cast(procedure.proceduredme_ts.satisfactory_value as varchar), '(' || procedure.proceduredme_ts.satisfactory_nilreason || ')') as satisfactory,
    coalesce(cast(navaids_points_dme_pt_zsavhr.title as varchar), '(' || navaids_points_dme_pt_zsavhr.nilreason[1] || ')') AS dme,
    navaids_points_dme_pt_zsavhr.href AS dme_href,
    lat_annotation.annotation as annotation
from procedure.proceduredme 
inner join master_join mj2 on procedure.proceduredme.id = mj2.source_id
inner join procedure.proceduredme_tsp on mj2.target_id = procedure.proceduredme_tsp.id
inner join procedure.proceduredme_ts on procedure.proceduredme_tsp.proceduredmetimeslice_id = procedure.proceduredme_ts.id
left join navaids_points.dme_pt navaids_points_dme_pt_zsavhr on procedure.proceduredme_ts.dme_id = navaids_points_dme_pt_zsavhr.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pwltdr.*) AS annotation
  from master_join master_join_eimyah
  join notes.note_view notes_note_view_pwltdr on master_join_eimyah.target_id = notes_note_view_pwltdr.id
  where master_join_eimyah.source_id = procedure.proceduredme_ts.id
) as lat_annotation on TRUE
where procedure.proceduredme.feature_status = 'APPROVED'
  and procedure.proceduredme_ts.feature_status = 'APPROVED'
order by proceduredme.identifier, proceduredme_ts.sequence_number, proceduredme_ts.correction_number DESC;
create index on procedure.proceduredme_view (id);
-- RadarSystemTimeSliceType
-- ['notes.note_view', 'surveillance.radarcomponent_view', 'geometry.elevatedpoint_view']
drop materialized view if exists surveillance.radarsystem_view cascade;
create materialized view surveillance.radarsystem_view as
select distinct on (radarsystem.identifier,radarsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    surveillance.radarsystem.id,
    surveillance.radarsystem_ts.id as ts_id,
    surveillance.radarsystem_tsp.id as tsp_id,
    surveillance.radarsystem.identifier,
    surveillance.radarsystem_ts.interpretation,
    surveillance.radarsystem_ts.sequence_number,
    surveillance.radarsystem_ts.correction_number,
    surveillance.radarsystem_ts.valid_time_begin,
    surveillance.radarsystem_ts.valid_time_end,
    surveillance.radarsystem_ts.feature_lifetime_begin,
    surveillance.radarsystem_ts.feature_lifetime_end,
    coalesce(cast(surveillance.radarsystem_ts.type_value as varchar), '(' || surveillance.radarsystem_ts.type_nilreason || ')') as type,
    coalesce(cast(surveillance.radarsystem_ts.model_value as varchar), '(' || surveillance.radarsystem_ts.model_nilreason || ')') as model,
    coalesce(cast(surveillance.radarsystem_ts.generalterrainmonitor_value as varchar), '(' || surveillance.radarsystem_ts.generalterrainmonitor_nilreason || ')') as generalterrainmonitor,
    coalesce(cast(surveillance.radarsystem_ts.broadcastidentifier_value as varchar), '(' || surveillance.radarsystem_ts.broadcastidentifier_nilreason || ')') as broadcastidentifier,
    coalesce(cast(airport_heliport_airportheliport_pt_poflmk.title as varchar), '(' || airport_heliport_airportheliport_pt_poflmk.nilreason[1] || ')') AS airportheliport,
    airport_heliport_airportheliport_pt_poflmk.href AS airportheliport_href,
    geometry_elevatedpoint_view_lxxdzv.geom AS location_geom,
    geometry_elevatedpoint_view_lxxdzv.longitude AS location_longitude,
    geometry_elevatedpoint_view_lxxdzv.latitude AS location_latitude,
    geometry_elevatedpoint_view_lxxdzv.elevation AS location_elevation,
    geometry_elevatedpoint_view_lxxdzv.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_lxxdzv.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_lxxdzv.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_lxxdzv.horizontalAccuracy AS location_horizontalaccuracy,
    lat_radarequipment.lat_radarequipment as radarequipment,
    lat_office.lat_office as office,
    lat_parrunway.lat_parrunway as parrunway,
    lat_annotation.annotation as annotation
from surveillance.radarsystem 
inner join master_join mj2 on surveillance.radarsystem.id = mj2.source_id
inner join surveillance.radarsystem_tsp on mj2.target_id = surveillance.radarsystem_tsp.id
inner join surveillance.radarsystem_ts on surveillance.radarsystem_tsp.radarsystemtimeslice_id = surveillance.radarsystem_ts.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_poflmk on surveillance.radarsystem_ts.airportheliport_id = airport_heliport_airportheliport_pt_poflmk.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_lxxdzv on surveillance.radarsystem_ts.location_id = geometry_elevatedpoint_view_lxxdzv.id
left join lateral(
  select jsonb_agg(DISTINCT surveillance_radarcomponent_view_tjxrfg.*) as lat_radarequipment
  from master_join master_join_cyablt
  join surveillance.radarcomponent_view surveillance_radarcomponent_view_tjxrfg on master_join_cyablt.target_id = surveillance_radarcomponent_view_tjxrfg.id
  where master_join_cyablt.source_id = surveillance.radarsystem_ts.id
) as lat_radarequipment on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_narvpe.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_narvpe.title AS varchar), '(' || organisation_organisationauthority_pt_narvpe.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_narvpe.href
  )) as lat_office  from master_join master_join_imcvko
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_narvpe on master_join_imcvko.target_id = organisation_organisationauthority_pt_narvpe.id
  where master_join_imcvko.source_id = surveillance.radarsystem_ts.id
) as lat_office on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runway_pt_jsxtdi.id,
      'title', coalesce(cast(airport_heliport_runway_pt_jsxtdi.title AS varchar), '(' || airport_heliport_runway_pt_jsxtdi.nilreason[1] || ')'),
      'href', airport_heliport_runway_pt_jsxtdi.href
  )) as lat_parrunway  from master_join master_join_bobcpx
  join airport_heliport.runway_pt airport_heliport_runway_pt_jsxtdi on master_join_bobcpx.target_id = airport_heliport_runway_pt_jsxtdi.id
  where master_join_bobcpx.source_id = surveillance.radarsystem_ts.id
) as lat_parrunway on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hlgefh.*) AS annotation
  from master_join master_join_ofoqiy
  join notes.note_view notes_note_view_hlgefh on master_join_ofoqiy.target_id = notes_note_view_hlgefh.id
  where master_join_ofoqiy.source_id = surveillance.radarsystem_ts.id
) as lat_annotation on TRUE
where surveillance.radarsystem.feature_status = 'APPROVED'
  and surveillance.radarsystem_ts.feature_status = 'APPROVED'
order by radarsystem.identifier, radarsystem_ts.sequence_number, radarsystem_ts.correction_number DESC;
create index on surveillance.radarsystem_view (id);
-- RadioCommunicationChannelTimeSliceType
-- ['service.radiocommunicationoperationalstatus_view', 'notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists service.radiocommunicationchannel_view cascade;
create materialized view service.radiocommunicationchannel_view as
select distinct on (radiocommunicationchannel.identifier,radiocommunicationchannel_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.radiocommunicationchannel.id,
    service.radiocommunicationchannel_ts.id as ts_id,
    service.radiocommunicationchannel_tsp.id as tsp_id,
    service.radiocommunicationchannel.identifier,
    service.radiocommunicationchannel_ts.interpretation,
    service.radiocommunicationchannel_ts.sequence_number,
    service.radiocommunicationchannel_ts.correction_number,
    service.radiocommunicationchannel_ts.valid_time_begin,
    service.radiocommunicationchannel_ts.valid_time_end,
    service.radiocommunicationchannel_ts.feature_lifetime_begin,
    service.radiocommunicationchannel_ts.feature_lifetime_end,
    coalesce(cast(service.radiocommunicationchannel_ts.mode_value as varchar), '(' || service.radiocommunicationchannel_ts.mode_nilreason || ')') as mode,
    coalesce(cast(service.radiocommunicationchannel_ts.rank_value as varchar), '(' || service.radiocommunicationchannel_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.radiocommunicationchannel_ts.channel_value as varchar), '(' || service.radiocommunicationchannel_ts.channel_nilreason || ')') as channel,
    coalesce(cast(service.radiocommunicationchannel_ts.logon_value as varchar), '(' || service.radiocommunicationchannel_ts.logon_nilreason || ')') as logon,
    coalesce(cast(service.radiocommunicationchannel_ts.emissiontype_value as varchar), '(' || service.radiocommunicationchannel_ts.emissiontype_nilreason || ')') as emissiontype,
    coalesce(cast(service.radiocommunicationchannel_ts.selectivecall_value as varchar), '(' || service.radiocommunicationchannel_ts.selectivecall_nilreason || ')') as selectivecall,
    coalesce(cast(service.radiocommunicationchannel_ts.flightchecked_value as varchar), '(' || service.radiocommunicationchannel_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(service.radiocommunicationchannel_ts.trafficdirection_value as varchar), '(' || service.radiocommunicationchannel_ts.trafficdirection_nilreason || ')') as trafficdirection,
    coalesce(cast(service.radiocommunicationchannel_ts.frequencytransmission_value as varchar) || ' ' || service.radiocommunicationchannel_ts.frequencytransmission_uom, '(' || service.radiocommunicationchannel_ts.frequencytransmission_nilreason || ')') as frequencytransmission,
    coalesce(cast(service.radiocommunicationchannel_ts.frequencyreception_value as varchar) || ' ' || service.radiocommunicationchannel_ts.frequencyreception_uom, '(' || service.radiocommunicationchannel_ts.frequencyreception_nilreason || ')') as frequencyreception,
    lat_location.geom as location_geom,
    lat_location.attr as location,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from service.radiocommunicationchannel 
inner join master_join mj2 on service.radiocommunicationchannel.id = mj2.source_id
inner join service.radiocommunicationchannel_tsp on mj2.target_id = service.radiocommunicationchannel_tsp.id
inner join service.radiocommunicationchannel_ts on service.radiocommunicationchannel_tsp.radiocommunicationchanneltimeslice_id = service.radiocommunicationchannel_ts.id
left join lateral(
  select
    ST_Collect(DISTINCT geometry_elevatedpoint_view_hszpwo.geom) AS geom,
    jsonb_agg(DISTINCT jsonb_build_object(
      'id', geometry_elevatedpoint_view_hszpwo.id,
      'longitude', geometry_elevatedpoint_view_hszpwo.longitude,
      'latitude', geometry_elevatedpoint_view_hszpwo.latitude,
      'elevation', geometry_elevatedpoint_view_hszpwo.elevation,
      'geoidUndulation', geometry_elevatedpoint_view_hszpwo.geoidUndulation,
      'verticalDatum', geometry_elevatedpoint_view_hszpwo.verticalDatum,
      'verticalAccuracy', geometry_elevatedpoint_view_hszpwo.verticalAccuracy,
      'horizontalAccuracy', geometry_elevatedpoint_view_hszpwo.horizontalAccuracy
    )) AS attr
  from master_join master_join_ieegzy
  join geometry.elevatedpoint_view geometry_elevatedpoint_view_hszpwo on master_join_ieegzy.target_id = geometry_elevatedpoint_view_hszpwo.id
  where master_join_ieegzy.source_id = service.radiocommunicationchannel_ts.id
) as lat_location on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_radiocommunicationoperationalstatus_view_eqmrwd.*) as lat_availability
  from master_join master_join_vpcwvn
  join service.radiocommunicationoperationalstatus_view service_radiocommunicationoperationalstatus_view_eqmrwd on master_join_vpcwvn.target_id = service_radiocommunicationoperationalstatus_view_eqmrwd.id
  where master_join_vpcwvn.source_id = service.radiocommunicationchannel_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_oxihiq.*) AS annotation
  from master_join master_join_iksdse
  join notes.note_view notes_note_view_oxihiq on master_join_iksdse.target_id = notes_note_view_oxihiq.id
  where master_join_iksdse.source_id = service.radiocommunicationchannel_ts.id
) as lat_annotation on TRUE
where service.radiocommunicationchannel.feature_status = 'APPROVED'
  and service.radiocommunicationchannel_ts.feature_status = 'APPROVED'
order by radiocommunicationchannel.identifier, radiocommunicationchannel_ts.sequence_number, radiocommunicationchannel_ts.correction_number DESC;
create index on service.radiocommunicationchannel_view (id);
-- RadioFrequencyAreaTimeSliceType
-- ['geometry.surface_view', 'shared.circlesector_view', 'notes.note_view']
drop materialized view if exists shared.radiofrequencyarea_view cascade;
create materialized view shared.radiofrequencyarea_view as
select distinct on (radiofrequencyarea.identifier,radiofrequencyarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    shared.radiofrequencyarea.id,
    shared.radiofrequencyarea_ts.id as ts_id,
    shared.radiofrequencyarea_tsp.id as tsp_id,
    shared.radiofrequencyarea.identifier,
    shared.radiofrequencyarea_ts.interpretation,
    shared.radiofrequencyarea_ts.sequence_number,
    shared.radiofrequencyarea_ts.correction_number,
    shared.radiofrequencyarea_ts.valid_time_begin,
    shared.radiofrequencyarea_ts.valid_time_end,
    shared.radiofrequencyarea_ts.feature_lifetime_begin,
    shared.radiofrequencyarea_ts.feature_lifetime_end,
    coalesce(cast(shared.radiofrequencyarea_ts.type_value as varchar), '(' || shared.radiofrequencyarea_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.radiofrequencyarea_ts.anglescallop_value as varchar), '(' || shared.radiofrequencyarea_ts.anglescallop_nilreason || ')') as anglescallop,
    coalesce(cast(shared.radiofrequencyarea_ts.signaltype_value as varchar), '(' || shared.radiofrequencyarea_ts.signaltype_nilreason || ')') as signaltype,
    coalesce(cast(service_radiocommunicationchannel_pt_oxwevw.title as varchar), '(' || service_radiocommunicationchannel_pt_oxwevw.nilreason[1] || ')') AS equipmentfrequency,
    service_radiocommunicationchannel_pt_oxwevw.href AS equipmentfrequency_href,
    coalesce(cast(navaids_points_specialnavigationstation_pt_lhrxij.title as varchar), '(' || navaids_points_specialnavigationstation_pt_lhrxij.nilreason[1] || ')') AS equipmentspecialnavigationstation,
    navaids_points_specialnavigationstation_pt_lhrxij.href AS equipmentspecialnavigationstation_href,
    coalesce(cast(surveillance_precisionapproachradar_pt_anzesw.title as varchar), '(' || surveillance_precisionapproachradar_pt_anzesw.nilreason[1] || ')') AS equipmentprecisionapproachradar,
    surveillance_precisionapproachradar_pt_anzesw.href AS equipmentprecisionapproachradar_href,
    coalesce(cast(surveillance_secondarysurveillanceradar_pt_bqnzbl.title as varchar), '(' || surveillance_secondarysurveillanceradar_pt_bqnzbl.nilreason[1] || ')') AS equipmentradar,
    surveillance_secondarysurveillanceradar_pt_bqnzbl.href AS equipmentradar_href,
    lat_sector.lat_sector as sector,
    lat_annotation.annotation as annotation
from shared.radiofrequencyarea 
inner join master_join mj2 on shared.radiofrequencyarea.id = mj2.source_id
inner join shared.radiofrequencyarea_tsp on mj2.target_id = shared.radiofrequencyarea_tsp.id
inner join shared.radiofrequencyarea_ts on shared.radiofrequencyarea_tsp.radiofrequencyareatimeslice_id = shared.radiofrequencyarea_ts.id
left join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_oxwevw on shared.radiofrequencyarea_ts.equipment_frequency_id = service_radiocommunicationchannel_pt_oxwevw.id
left join navaids_points.specialnavigationstation_pt navaids_points_specialnavigationstation_pt_lhrxij on shared.radiofrequencyarea_ts.equipment_specialnavigationstation_id = navaids_points_specialnavigationstation_pt_lhrxij.id
left join surveillance.precisionapproachradar_pt surveillance_precisionapproachradar_pt_anzesw on shared.radiofrequencyarea_ts.equipment_precisionapproachradar_id = surveillance_precisionapproachradar_pt_anzesw.id
left join surveillance.secondarysurveillanceradar_pt surveillance_secondarysurveillanceradar_pt_bqnzbl on shared.radiofrequencyarea_ts.equipment_radar_id = surveillance_secondarysurveillanceradar_pt_bqnzbl.id
left join lateral(
  select jsonb_agg(DISTINCT shared_circlesector_view_dhrwzq.*) as lat_sector
  from master_join master_join_rceqpi
  join shared.circlesector_view shared_circlesector_view_dhrwzq on master_join_rceqpi.target_id = shared_circlesector_view_dhrwzq.id
  where master_join_rceqpi.source_id = shared.radiofrequencyarea_ts.id
) as lat_sector on TRUE
left join lateral(
  select
  from master_join master_join_itnftz
  join geometry.surface_view geometry_surface_view_ycvwwd on master_join_itnftz.target_id = geometry_surface_view_ycvwwd.id
  where master_join_itnftz.source_id = shared.radiofrequencyarea_ts.id
) as lat_extent on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_oaquvn.*) AS annotation
  from master_join master_join_xhrhhy
  join notes.note_view notes_note_view_oaquvn on master_join_xhrhhy.target_id = notes_note_view_oaquvn.id
  where master_join_xhrhhy.source_id = shared.radiofrequencyarea_ts.id
) as lat_annotation on TRUE
where shared.radiofrequencyarea.feature_status = 'APPROVED'
  and shared.radiofrequencyarea_ts.feature_status = 'APPROVED'
order by radiofrequencyarea.identifier, radiofrequencyarea_ts.sequence_number, radiofrequencyarea_ts.correction_number DESC;
create index on shared.radiofrequencyarea_view (id);
-- RoadTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.road_view cascade;
create materialized view airport_heliport.road_view as
select distinct on (road.identifier,road_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.road.id,
    airport_heliport.road_ts.id as ts_id,
    airport_heliport.road_tsp.id as tsp_id,
    airport_heliport.road.identifier,
    airport_heliport.road_ts.interpretation,
    airport_heliport.road_ts.sequence_number,
    airport_heliport.road_ts.correction_number,
    airport_heliport.road_ts.valid_time_begin,
    airport_heliport.road_ts.valid_time_end,
    airport_heliport.road_ts.feature_lifetime_begin,
    airport_heliport.road_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.road_ts.designator_value as varchar), '(' || airport_heliport.road_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.road_ts.status_value as varchar), '(' || airport_heliport.road_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.road_ts.type_value as varchar), '(' || airport_heliport.road_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.road_ts.abandoned_value as varchar), '(' || airport_heliport.road_ts.abandoned_nilreason || ')') as abandoned,
    coalesce(cast(airport_heliport_airportheliport_pt_llanxy.title as varchar), '(' || airport_heliport_airportheliport_pt_llanxy.nilreason[1] || ')') AS associatedairport,
    airport_heliport_airportheliport_pt_llanxy.href AS associatedairport_href,
    to_jsonb(airport_heliport_surfacecharacteristics_view_vgonud.*) AS surfaceproperties,
    geometry_elevatedsurface_view_gfgzjy.geom AS surfaceextent_geom,
    geometry_elevatedsurface_view_gfgzjy.elevation AS surfaceextent_elevation,
    geometry_elevatedsurface_view_gfgzjy.geoidUndulation AS surfaceextent_geoidundulation,
    geometry_elevatedsurface_view_gfgzjy.verticalDatum AS surfaceextent_verticaldatum,
    geometry_elevatedsurface_view_gfgzjy.verticalAccuracy AS surfaceextent_verticalaccuracy,
    geometry_elevatedsurface_view_gfgzjy.horizontalAccuracy AS surfaceextent_horizontalaccuracy,
    lat_accessiblestand.lat_accessiblestand as accessiblestand,
    lat_annotation.annotation as annotation
from airport_heliport.road 
inner join master_join mj2 on airport_heliport.road.id = mj2.source_id
inner join airport_heliport.road_tsp on mj2.target_id = airport_heliport.road_tsp.id
inner join airport_heliport.road_ts on airport_heliport.road_tsp.roadtimeslice_id = airport_heliport.road_ts.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_llanxy on airport_heliport.road_ts.associatedairport_id = airport_heliport_airportheliport_pt_llanxy.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_vgonud on airport_heliport.road_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_vgonud.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_gfgzjy on airport_heliport.road_ts.surfaceextent_id = geometry_elevatedsurface_view_gfgzjy.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_aircraftstand_pt_rafbqy.id,
      'title', coalesce(cast(airport_heliport_aircraftstand_pt_rafbqy.title AS varchar), '(' || airport_heliport_aircraftstand_pt_rafbqy.nilreason[1] || ')'),
      'href', airport_heliport_aircraftstand_pt_rafbqy.href
  )) as lat_accessiblestand  from master_join master_join_kcqsxs
  join airport_heliport.aircraftstand_pt airport_heliport_aircraftstand_pt_rafbqy on master_join_kcqsxs.target_id = airport_heliport_aircraftstand_pt_rafbqy.id
  where master_join_kcqsxs.source_id = airport_heliport.road_ts.id
) as lat_accessiblestand on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qdqowb.*) AS annotation
  from master_join master_join_uxuitw
  join notes.note_view notes_note_view_qdqowb on master_join_uxuitw.target_id = notes_note_view_qdqowb.id
  where master_join_uxuitw.source_id = airport_heliport.road_ts.id
) as lat_annotation on TRUE
where airport_heliport.road.feature_status = 'APPROVED'
  and airport_heliport.road_ts.feature_status = 'APPROVED'
order by road.identifier, road_ts.sequence_number, road_ts.correction_number DESC;
create index on airport_heliport.road_view (id);
-- RouteDMETimeSliceType
-- ['routes.routeportion_view', 'notes.note_view']
drop materialized view if exists routes.routedme_view cascade;
create materialized view routes.routedme_view as
select distinct on (routedme.identifier,routedme_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    routes.routedme.id,
    routes.routedme_ts.id as ts_id,
    routes.routedme_tsp.id as tsp_id,
    routes.routedme.identifier,
    routes.routedme_ts.interpretation,
    routes.routedme_ts.sequence_number,
    routes.routedme_ts.correction_number,
    routes.routedme_ts.valid_time_begin,
    routes.routedme_ts.valid_time_end,
    routes.routedme_ts.feature_lifetime_begin,
    routes.routedme_ts.feature_lifetime_end,
    coalesce(cast(routes.routedme_ts.criticaldme_value as varchar), '(' || routes.routedme_ts.criticaldme_nilreason || ')') as criticaldme,
    coalesce(cast(routes.routedme_ts.satisfactory_value as varchar), '(' || routes.routedme_ts.satisfactory_nilreason || ')') as satisfactory,
    coalesce(cast(navaids_points_dme_pt_jsafew.title as varchar), '(' || navaids_points_dme_pt_jsafew.nilreason[1] || ')') AS referenceddme,
    navaids_points_dme_pt_jsafew.href AS referenceddme_href,
    to_jsonb(routes_routeportion_view_splckw.*) AS applicablerouteportion,
    lat_annotation.annotation as annotation
from routes.routedme 
inner join master_join mj2 on routes.routedme.id = mj2.source_id
inner join routes.routedme_tsp on mj2.target_id = routes.routedme_tsp.id
inner join routes.routedme_ts on routes.routedme_tsp.routedmetimeslice_id = routes.routedme_ts.id
left join navaids_points.dme_pt navaids_points_dme_pt_jsafew on routes.routedme_ts.referenceddme_id = navaids_points_dme_pt_jsafew.id
left join routes.routeportion_view routes_routeportion_view_splckw on routes.routedme_ts.applicablerouteportion_id = routes_routeportion_view_splckw.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mqgxbz.*) AS annotation
  from master_join master_join_yoojcx
  join notes.note_view notes_note_view_mqgxbz on master_join_yoojcx.target_id = notes_note_view_mqgxbz.id
  where master_join_yoojcx.source_id = routes.routedme_ts.id
) as lat_annotation on TRUE
where routes.routedme.feature_status = 'APPROVED'
  and routes.routedme_ts.feature_status = 'APPROVED'
order by routedme.identifier, routedme_ts.sequence_number, routedme_ts.correction_number DESC;
create index on routes.routedme_view (id);
-- RouteSegmentTimeSliceType
-- ['routes.routeavailability_view', 'shared.obstacleassessmentarea_view', 'notes.note_view', 'geometry.curve_view', 'navaids_points.enroutesegmentpoint_view']
drop materialized view if exists routes.routesegment_view cascade;
create materialized view routes.routesegment_view as
select distinct on (routesegment.identifier,routesegment_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    routes.routesegment.id,
    routes.routesegment_ts.id as ts_id,
    routes.routesegment_tsp.id as tsp_id,
    routes.routesegment.identifier,
    routes.routesegment_ts.interpretation,
    routes.routesegment_ts.sequence_number,
    routes.routesegment_ts.correction_number,
    routes.routesegment_ts.valid_time_begin,
    routes.routesegment_ts.valid_time_end,
    routes.routesegment_ts.feature_lifetime_begin,
    routes.routesegment_ts.feature_lifetime_end,
    coalesce(cast(routes.routesegment_ts.level_value as varchar), '(' || routes.routesegment_ts.level_nilreason || ')') as level,
    coalesce(cast(routes.routesegment_ts.upperlimitreference_value as varchar), '(' || routes.routesegment_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(routes.routesegment_ts.lowerlimitreference_value as varchar), '(' || routes.routesegment_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(routes.routesegment_ts.pathtype_value as varchar), '(' || routes.routesegment_ts.pathtype_nilreason || ')') as pathtype,
    coalesce(cast(routes.routesegment_ts.truetrack_value as varchar), '(' || routes.routesegment_ts.truetrack_nilreason || ')') as truetrack,
    coalesce(cast(routes.routesegment_ts.magnetictrack_value as varchar), '(' || routes.routesegment_ts.magnetictrack_nilreason || ')') as magnetictrack,
    coalesce(cast(routes.routesegment_ts.reversetruetrack_value as varchar), '(' || routes.routesegment_ts.reversetruetrack_nilreason || ')') as reversetruetrack,
    coalesce(cast(routes.routesegment_ts.reversemagnetictrack_value as varchar), '(' || routes.routesegment_ts.reversemagnetictrack_nilreason || ')') as reversemagnetictrack,
    coalesce(cast(routes.routesegment_ts.turndirection_value as varchar), '(' || routes.routesegment_ts.turndirection_nilreason || ')') as turndirection,
    coalesce(cast(routes.routesegment_ts.signalgap_value as varchar), '(' || routes.routesegment_ts.signalgap_nilreason || ')') as signalgap,
    coalesce(cast(routes.routesegment_ts.minimumcrossingatendreference_value as varchar), '(' || routes.routesegment_ts.minimumcrossingatendreference_nilreason || ')') as minimumcrossingatendreference,
    coalesce(cast(routes.routesegment_ts.maximumcrossingatendreference_value as varchar), '(' || routes.routesegment_ts.maximumcrossingatendreference_nilreason || ')') as maximumcrossingatendreference,
    coalesce(cast(routes.routesegment_ts.navigationtype_value as varchar), '(' || routes.routesegment_ts.navigationtype_nilreason || ')') as navigationtype,
    coalesce(cast(routes.routesegment_ts.requirednavigationperformance_value as varchar), '(' || routes.routesegment_ts.requirednavigationperformance_nilreason || ')') as requirednavigationperformance,
    coalesce(cast(routes.routesegment_ts.designatorsuffix_value as varchar), '(' || routes.routesegment_ts.designatorsuffix_nilreason || ')') as designatorsuffix,
    coalesce(cast(routes.routesegment_ts.upperlimit_value as varchar) || ' ' || routes.routesegment_ts.upperlimit_uom, '(' || routes.routesegment_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(routes.routesegment_ts.lowerlimit_value as varchar) || ' ' || routes.routesegment_ts.lowerlimit_uom, '(' || routes.routesegment_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(routes.routesegment_ts.minimumobstacleclearancealtitude_value as varchar) || ' ' || routes.routesegment_ts.minimumobstacleclearancealtitude_uom, '(' || routes.routesegment_ts.minimumobstacleclearancealtitude_nilreason || ')') as minimumobstacleclearancealtitude,
    coalesce(cast(routes.routesegment_ts.length_value as varchar) || ' ' || routes.routesegment_ts.length_uom, '(' || routes.routesegment_ts.length_nilreason || ')') as length,
    coalesce(cast(routes.routesegment_ts.widthleft_value as varchar) || ' ' || routes.routesegment_ts.widthleft_uom, '(' || routes.routesegment_ts.widthleft_nilreason || ')') as widthleft,
    coalesce(cast(routes.routesegment_ts.widthright_value as varchar) || ' ' || routes.routesegment_ts.widthright_uom, '(' || routes.routesegment_ts.widthright_nilreason || ')') as widthright,
    coalesce(cast(routes.routesegment_ts.minimumenroutealtitude_value as varchar) || ' ' || routes.routesegment_ts.minimumenroutealtitude_uom, '(' || routes.routesegment_ts.minimumenroutealtitude_nilreason || ')') as minimumenroutealtitude,
    coalesce(cast(routes.routesegment_ts.minimumcrossingatend_value as varchar) || ' ' || routes.routesegment_ts.minimumcrossingatend_uom, '(' || routes.routesegment_ts.minimumcrossingatend_nilreason || ')') as minimumcrossingatend,
    coalesce(cast(routes.routesegment_ts.maximumcrossingatend_value as varchar) || ' ' || routes.routesegment_ts.maximumcrossingatend_uom, '(' || routes.routesegment_ts.maximumcrossingatend_nilreason || ')') as maximumcrossingatend,
    to_jsonb(navaids_points_enroutesegmentpoint_view_pacajk.*) AS start,
    to_jsonb(navaids_points_enroutesegmentpoint_view_dzmtkn.*) AS end,
    coalesce(cast(routes_route_pt_nzokuz.title as varchar), '(' || routes_route_pt_nzokuz.nilreason[1] || ')') AS routeformed,
    routes_route_pt_nzokuz.href AS routeformed_href,
    to_jsonb(shared_obstacleassessmentarea_view_ocwyyu.*) AS evaluationarea,
    geometry_curve_view_zwoodn.geom AS curveextent_geom,
    geometry_curve_view_zwoodn.horizontalAccuracy as curveextent_horizontalaccuracy,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from routes.routesegment 
inner join master_join mj2 on routes.routesegment.id = mj2.source_id
inner join routes.routesegment_tsp on mj2.target_id = routes.routesegment_tsp.id
inner join routes.routesegment_ts on routes.routesegment_tsp.routesegmenttimeslice_id = routes.routesegment_ts.id
left join navaids_points.enroutesegmentpoint_view navaids_points_enroutesegmentpoint_view_pacajk on routes.routesegment_ts.start_id = navaids_points_enroutesegmentpoint_view_pacajk.id
left join routes.route_pt routes_route_pt_nzokuz on routes.routesegment_ts.routeformed_id = routes_route_pt_nzokuz.id
left join shared.obstacleassessmentarea_view shared_obstacleassessmentarea_view_ocwyyu on routes.routesegment_ts.evaluationarea_id = shared_obstacleassessmentarea_view_ocwyyu.id
left join geometry.curve_view geometry_curve_view_zwoodn on routes.routesegment_ts.curveextent_id = geometry_curve_view_zwoodn.id
left join navaids_points.enroutesegmentpoint_view navaids_points_enroutesegmentpoint_view_dzmtkn on routes.routesegment_ts.end_id = navaids_points_enroutesegmentpoint_view_dzmtkn.id
left join lateral(
  select jsonb_agg(DISTINCT routes_routeavailability_view_mkwpzy.*) as lat_availability
  from master_join master_join_klvwfr
  join routes.routeavailability_view routes_routeavailability_view_mkwpzy on master_join_klvwfr.target_id = routes_routeavailability_view_mkwpzy.id
  where master_join_klvwfr.source_id = routes.routesegment_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_tcljdn.*) AS annotation
  from master_join master_join_nxrfzt
  join notes.note_view notes_note_view_tcljdn on master_join_nxrfzt.target_id = notes_note_view_tcljdn.id
  where master_join_nxrfzt.source_id = routes.routesegment_ts.id
) as lat_annotation on TRUE
where routes.routesegment.feature_status = 'APPROVED'
  and routes.routesegment_ts.feature_status = 'APPROVED'
order by routesegment.identifier, routesegment_ts.sequence_number, routesegment_ts.correction_number DESC;
create index on routes.routesegment_view (id);
-- RouteTimeSliceType
-- ['notes.note_view']
drop materialized view if exists routes.route_view cascade;
create materialized view routes.route_view as
select distinct on (route.identifier,route_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    routes.route.id,
    routes.route_ts.id as ts_id,
    routes.route_tsp.id as tsp_id,
    routes.route.identifier,
    routes.route_ts.interpretation,
    routes.route_ts.sequence_number,
    routes.route_ts.correction_number,
    routes.route_ts.valid_time_begin,
    routes.route_ts.valid_time_end,
    routes.route_ts.feature_lifetime_begin,
    routes.route_ts.feature_lifetime_end,
    coalesce(cast(routes.route_ts.designatorprefix_value as varchar), '(' || routes.route_ts.designatorprefix_nilreason || ')') as designatorprefix,
    coalesce(cast(routes.route_ts.designatorsecondletter_value as varchar), '(' || routes.route_ts.designatorsecondletter_nilreason || ')') as designatorsecondletter,
    coalesce(cast(routes.route_ts.designatornumber_value as varchar), '(' || routes.route_ts.designatornumber_nilreason || ')') as designatornumber,
    coalesce(cast(routes.route_ts.multipleidentifier_value as varchar), '(' || routes.route_ts.multipleidentifier_nilreason || ')') as multipleidentifier,
    coalesce(cast(routes.route_ts.locationdesignator_value as varchar), '(' || routes.route_ts.locationdesignator_nilreason || ')') as locationdesignator,
    coalesce(cast(routes.route_ts.name_value as varchar), '(' || routes.route_ts.name_nilreason || ')') as name,
    coalesce(cast(routes.route_ts.type_value as varchar), '(' || routes.route_ts.type_nilreason || ')') as type,
    coalesce(cast(routes.route_ts.flightrule_value as varchar), '(' || routes.route_ts.flightrule_nilreason || ')') as flightrule,
    coalesce(cast(routes.route_ts.internationaluse_value as varchar), '(' || routes.route_ts.internationaluse_nilreason || ')') as internationaluse,
    coalesce(cast(routes.route_ts.militaryuse_value as varchar), '(' || routes.route_ts.militaryuse_nilreason || ')') as militaryuse,
    coalesce(cast(routes.route_ts.militarytrainingtype_value as varchar), '(' || routes.route_ts.militarytrainingtype_nilreason || ')') as militarytrainingtype,
    coalesce(cast(organisation_organisationauthority_pt_htxest.title as varchar), '(' || organisation_organisationauthority_pt_htxest.nilreason[1] || ')') AS userorganisation,
    organisation_organisationauthority_pt_htxest.href AS userorganisation_href,
    lat_annotation.annotation as annotation
from routes.route 
inner join master_join mj2 on routes.route.id = mj2.source_id
inner join routes.route_tsp on mj2.target_id = routes.route_tsp.id
inner join routes.route_ts on routes.route_tsp.routetimeslice_id = routes.route_ts.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_htxest on routes.route_ts.userorganisation_id = organisation_organisationauthority_pt_htxest.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_kuvqlk.*) AS annotation
  from master_join master_join_mgisjb
  join notes.note_view notes_note_view_kuvqlk on master_join_mgisjb.target_id = notes_note_view_kuvqlk.id
  where master_join_mgisjb.source_id = routes.route_ts.id
) as lat_annotation on TRUE
where routes.route.feature_status = 'APPROVED'
  and routes.route_ts.feature_status = 'APPROVED'
order by route.identifier, route_ts.sequence_number, route_ts.correction_number DESC;
create index on routes.route_view (id);
-- RulesProceduresTimeSliceType
-- ['notes.note_view']
drop materialized view if exists rules_procedures.rulesprocedures_view cascade;
create materialized view rules_procedures.rulesprocedures_view as
select distinct on (rulesprocedures.identifier,rulesprocedures_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    rules_procedures.rulesprocedures.id,
    rules_procedures.rulesprocedures_ts.id as ts_id,
    rules_procedures.rulesprocedures_tsp.id as tsp_id,
    rules_procedures.rulesprocedures.identifier,
    rules_procedures.rulesprocedures_ts.interpretation,
    rules_procedures.rulesprocedures_ts.sequence_number,
    rules_procedures.rulesprocedures_ts.correction_number,
    rules_procedures.rulesprocedures_ts.valid_time_begin,
    rules_procedures.rulesprocedures_ts.valid_time_end,
    rules_procedures.rulesprocedures_ts.feature_lifetime_begin,
    rules_procedures.rulesprocedures_ts.feature_lifetime_end,
    coalesce(cast(rules_procedures.rulesprocedures_ts.category_value as varchar), '(' || rules_procedures.rulesprocedures_ts.category_nilreason || ')') as category,
    coalesce(cast(rules_procedures.rulesprocedures_ts.title_value as varchar), '(' || rules_procedures.rulesprocedures_ts.title_nilreason || ')') as title,
    lat_affectedlocation.lat_affectedlocation as affectedlocation,
    lat_affectedarea.lat_affectedarea as affectedarea,
    lat_annotation.annotation as annotation
from rules_procedures.rulesprocedures 
inner join master_join mj2 on rules_procedures.rulesprocedures.id = mj2.source_id
inner join rules_procedures.rulesprocedures_tsp on mj2.target_id = rules_procedures.rulesprocedures_tsp.id
inner join rules_procedures.rulesprocedures_ts on rules_procedures.rulesprocedures_tsp.rulesprocedurestimeslice_id = rules_procedures.rulesprocedures_ts.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_xhkvsu.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_xhkvsu.title AS varchar), '(' || airport_heliport_airportheliport_pt_xhkvsu.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_xhkvsu.href
  )) as lat_affectedlocation  from master_join master_join_yothrf
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_xhkvsu on master_join_yothrf.target_id = airport_heliport_airportheliport_pt_xhkvsu.id
  where master_join_yothrf.source_id = rules_procedures.rulesprocedures_ts.id
) as lat_affectedlocation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airspace_airspace_pt_xhyhfl.id,
      'title', coalesce(cast(airspace_airspace_pt_xhyhfl.title AS varchar), '(' || airspace_airspace_pt_xhyhfl.nilreason[1] || ')'),
      'href', airspace_airspace_pt_xhyhfl.href
  )) as lat_affectedarea  from master_join master_join_kitrmp
  join airspace.airspace_pt airspace_airspace_pt_xhyhfl on master_join_kitrmp.target_id = airspace_airspace_pt_xhyhfl.id
  where master_join_kitrmp.source_id = rules_procedures.rulesprocedures_ts.id
) as lat_affectedarea on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_lsaiaw.*) AS annotation
  from master_join master_join_pdyipr
  join notes.note_view notes_note_view_lsaiaw on master_join_pdyipr.target_id = notes_note_view_lsaiaw.id
  where master_join_pdyipr.source_id = rules_procedures.rulesprocedures_ts.id
) as lat_annotation on TRUE
where rules_procedures.rulesprocedures.feature_status = 'APPROVED'
  and rules_procedures.rulesprocedures_ts.feature_status = 'APPROVED'
order by rulesprocedures.identifier, rulesprocedures_ts.sequence_number, rulesprocedures_ts.correction_number DESC;
create index on rules_procedures.rulesprocedures_view (id);
-- RunwayBlastPadTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.runwayblastpad_view cascade;
create materialized view airport_heliport.runwayblastpad_view as
select distinct on (runwayblastpad.identifier,runwayblastpad_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwayblastpad.id,
    airport_heliport.runwayblastpad_ts.id as ts_id,
    airport_heliport.runwayblastpad_tsp.id as tsp_id,
    airport_heliport.runwayblastpad.identifier,
    airport_heliport.runwayblastpad_ts.interpretation,
    airport_heliport.runwayblastpad_ts.sequence_number,
    airport_heliport.runwayblastpad_ts.correction_number,
    airport_heliport.runwayblastpad_ts.valid_time_begin,
    airport_heliport.runwayblastpad_ts.valid_time_end,
    airport_heliport.runwayblastpad_ts.feature_lifetime_begin,
    airport_heliport.runwayblastpad_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwayblastpad_ts.status_value as varchar), '(' || airport_heliport.runwayblastpad_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.runwayblastpad_ts.length_value as varchar) || ' ' || airport_heliport.runwayblastpad_ts.length_uom, '(' || airport_heliport.runwayblastpad_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport_runwaydirection_pt_atgntu.title as varchar), '(' || airport_heliport_runwaydirection_pt_atgntu.nilreason[1] || ')') AS usedrunwaydirection,
    airport_heliport_runwaydirection_pt_atgntu.href AS usedrunwaydirection_href,
    geometry_elevatedsurface_view_tueysr.geom AS extent_geom,
    geometry_elevatedsurface_view_tueysr.elevation AS extent_elevation,
    geometry_elevatedsurface_view_tueysr.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_tueysr.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_tueysr.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_tueysr.horizontalAccuracy AS extent_horizontalaccuracy,
    to_jsonb(airport_heliport_surfacecharacteristics_view_romyyh.*) AS surfaceproperties,
    lat_annotation.annotation as annotation
from airport_heliport.runwayblastpad 
inner join master_join mj2 on airport_heliport.runwayblastpad.id = mj2.source_id
inner join airport_heliport.runwayblastpad_tsp on mj2.target_id = airport_heliport.runwayblastpad_tsp.id
inner join airport_heliport.runwayblastpad_ts on airport_heliport.runwayblastpad_tsp.runwayblastpadtimeslice_id = airport_heliport.runwayblastpad_ts.id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_atgntu on airport_heliport.runwayblastpad_ts.usedrunwaydirection_id = airport_heliport_runwaydirection_pt_atgntu.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_tueysr on airport_heliport.runwayblastpad_ts.extent_id = geometry_elevatedsurface_view_tueysr.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_romyyh on airport_heliport.runwayblastpad_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_romyyh.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_smzsua.*) AS annotation
  from master_join master_join_labxio
  join notes.note_view notes_note_view_smzsua on master_join_labxio.target_id = notes_note_view_smzsua.id
  where master_join_labxio.source_id = airport_heliport.runwayblastpad_ts.id
) as lat_annotation on TRUE
where airport_heliport.runwayblastpad.feature_status = 'APPROVED'
  and airport_heliport.runwayblastpad_ts.feature_status = 'APPROVED'
order by runwayblastpad.identifier, runwayblastpad_ts.sequence_number, runwayblastpad_ts.correction_number DESC;
create index on airport_heliport.runwayblastpad_view (id);
-- RunwayCentrelinePointTimeSliceType
-- ['airport_heliport.runwaydeclareddistance_view', 'notes.note_view', 'geometry.elevatedpoint_view', 'airport_heliport.navaidequipmentdistance_view']
drop materialized view if exists airport_heliport.runwaycentrelinepoint_view cascade;
create materialized view airport_heliport.runwaycentrelinepoint_view as
select distinct on (runwaycentrelinepoint.identifier,runwaycentrelinepoint_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwaycentrelinepoint.id,
    airport_heliport.runwaycentrelinepoint_ts.id as ts_id,
    airport_heliport.runwaycentrelinepoint_tsp.id as tsp_id,
    airport_heliport.runwaycentrelinepoint.identifier,
    airport_heliport.runwaycentrelinepoint_ts.interpretation,
    airport_heliport.runwaycentrelinepoint_ts.sequence_number,
    airport_heliport.runwaycentrelinepoint_ts.correction_number,
    airport_heliport.runwaycentrelinepoint_ts.valid_time_begin,
    airport_heliport.runwaycentrelinepoint_ts.valid_time_end,
    airport_heliport.runwaycentrelinepoint_ts.feature_lifetime_begin,
    airport_heliport.runwaycentrelinepoint_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwaycentrelinepoint_ts.role_value as varchar), '(' || airport_heliport.runwaycentrelinepoint_ts.role_nilreason || ')') as role,
    coalesce(cast(airport_heliport.runwaycentrelinepoint_ts.designator_value as varchar), '(' || airport_heliport.runwaycentrelinepoint_ts.designator_nilreason || ')') as designator,
    geometry_elevatedpoint_view_nvstty.geom AS location_geom,
    geometry_elevatedpoint_view_nvstty.longitude AS location_longitude,
    geometry_elevatedpoint_view_nvstty.latitude AS location_latitude,
    geometry_elevatedpoint_view_nvstty.elevation AS location_elevation,
    geometry_elevatedpoint_view_nvstty.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_nvstty.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_nvstty.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_nvstty.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(airport_heliport_runwaydirection_pt_pelsvt.title as varchar), '(' || airport_heliport_runwaydirection_pt_pelsvt.nilreason[1] || ')') AS onrunway,
    airport_heliport_runwaydirection_pt_pelsvt.href AS onrunway_href,
    lat_associateddeclareddistance.lat_associateddeclareddistance as associateddeclareddistance,
    lat_navaidequipment.lat_navaidequipment as navaidequipment,
    lat_annotation.annotation as annotation
from airport_heliport.runwaycentrelinepoint 
inner join master_join mj2 on airport_heliport.runwaycentrelinepoint.id = mj2.source_id
inner join airport_heliport.runwaycentrelinepoint_tsp on mj2.target_id = airport_heliport.runwaycentrelinepoint_tsp.id
inner join airport_heliport.runwaycentrelinepoint_ts on airport_heliport.runwaycentrelinepoint_tsp.runwaycentrelinepointtimeslice_id = airport_heliport.runwaycentrelinepoint_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_nvstty on airport_heliport.runwaycentrelinepoint_ts.location_id = geometry_elevatedpoint_view_nvstty.id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_pelsvt on airport_heliport.runwaycentrelinepoint_ts.onrunway_id = airport_heliport_runwaydirection_pt_pelsvt.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_runwaydeclareddistance_view_mzbmaz.*) as lat_associateddeclareddistance
  from master_join master_join_holflc
  join airport_heliport.runwaydeclareddistance_view airport_heliport_runwaydeclareddistance_view_mzbmaz on master_join_holflc.target_id = airport_heliport_runwaydeclareddistance_view_mzbmaz.id
  where master_join_holflc.source_id = airport_heliport.runwaycentrelinepoint_ts.id
) as lat_associateddeclareddistance on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_navaidequipmentdistance_view_asgcyr.*) as lat_navaidequipment
  from master_join master_join_cmfizq
  join airport_heliport.navaidequipmentdistance_view airport_heliport_navaidequipmentdistance_view_asgcyr on master_join_cmfizq.target_id = airport_heliport_navaidequipmentdistance_view_asgcyr.id
  where master_join_cmfizq.source_id = airport_heliport.runwaycentrelinepoint_ts.id
) as lat_navaidequipment on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xluydk.*) AS annotation
  from master_join master_join_sxedej
  join notes.note_view notes_note_view_xluydk on master_join_sxedej.target_id = notes_note_view_xluydk.id
  where master_join_sxedej.source_id = airport_heliport.runwaycentrelinepoint_ts.id
) as lat_annotation on TRUE
where airport_heliport.runwaycentrelinepoint.feature_status = 'APPROVED'
  and airport_heliport.runwaycentrelinepoint_ts.feature_status = 'APPROVED'
order by runwaycentrelinepoint.identifier, runwaycentrelinepoint_ts.sequence_number, runwaycentrelinepoint_ts.correction_number DESC;
create index on airport_heliport.runwaycentrelinepoint_view (id);
-- RunwayDirectionLightSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.runwaydirectionlightsystem_view cascade;
create materialized view airport_heliport.runwaydirectionlightsystem_view as
select distinct on (runwaydirectionlightsystem.identifier,runwaydirectionlightsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwaydirectionlightsystem.id,
    airport_heliport.runwaydirectionlightsystem_ts.id as ts_id,
    airport_heliport.runwaydirectionlightsystem_tsp.id as tsp_id,
    airport_heliport.runwaydirectionlightsystem.identifier,
    airport_heliport.runwaydirectionlightsystem_ts.interpretation,
    airport_heliport.runwaydirectionlightsystem_ts.sequence_number,
    airport_heliport.runwaydirectionlightsystem_ts.correction_number,
    airport_heliport.runwaydirectionlightsystem_ts.valid_time_begin,
    airport_heliport.runwaydirectionlightsystem_ts.valid_time_end,
    airport_heliport.runwaydirectionlightsystem_ts.feature_lifetime_begin,
    airport_heliport.runwaydirectionlightsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.colour_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.position_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.position_nilreason || ')') as position,
    coalesce(cast(airport_heliport_runwaydirection_pt_acxpgd.title as varchar), '(' || airport_heliport_runwaydirection_pt_acxpgd.nilreason[1] || ')') AS associatedrunwaydirection,
    airport_heliport_runwaydirection_pt_acxpgd.href AS associatedrunwaydirection_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.runwaydirectionlightsystem 
inner join master_join mj2 on airport_heliport.runwaydirectionlightsystem.id = mj2.source_id
inner join airport_heliport.runwaydirectionlightsystem_tsp on mj2.target_id = airport_heliport.runwaydirectionlightsystem_tsp.id
inner join airport_heliport.runwaydirectionlightsystem_ts on airport_heliport.runwaydirectionlightsystem_tsp.runwaydirectionlightsystemtimeslice_id = airport_heliport.runwaydirectionlightsystem_ts.id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_acxpgd on airport_heliport.runwaydirectionlightsystem_ts.associatedrunwaydirection_id = airport_heliport_runwaydirection_pt_acxpgd.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_zqdskl.*) as lat_element
  from master_join master_join_dbqfoh
  join shared.lightelement_view shared_lightelement_view_zqdskl on master_join_dbqfoh.target_id = shared_lightelement_view_zqdskl.id
  where master_join_dbqfoh.source_id = airport_heliport.runwaydirectionlightsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_xxhqwb.*) as lat_availability
  from master_join master_join_ffwmma
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_xxhqwb on master_join_ffwmma.target_id = airport_heliport_groundlightingavailability_view_xxhqwb.id
  where master_join_ffwmma.source_id = airport_heliport.runwaydirectionlightsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_smzpzp.*) AS annotation
  from master_join master_join_bwhmrn
  join notes.note_view notes_note_view_smzpzp on master_join_bwhmrn.target_id = notes_note_view_smzpzp.id
  where master_join_bwhmrn.source_id = airport_heliport.runwaydirectionlightsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.runwaydirectionlightsystem.feature_status = 'APPROVED'
  and airport_heliport.runwaydirectionlightsystem_ts.feature_status = 'APPROVED'
order by runwaydirectionlightsystem.identifier, runwaydirectionlightsystem_ts.sequence_number, runwaydirectionlightsystem_ts.correction_number DESC;
create index on airport_heliport.runwaydirectionlightsystem_view (id);
-- RunwayDirectionTimeSliceType
-- ['airport_heliport.manoeuvringareaavailability_view', 'notes.note_view']
drop materialized view if exists airport_heliport.runwaydirection_view cascade;
create materialized view airport_heliport.runwaydirection_view as
select distinct on (runwaydirection.identifier,runwaydirection_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwaydirection.id,
    airport_heliport.runwaydirection_ts.id as ts_id,
    airport_heliport.runwaydirection_tsp.id as tsp_id,
    airport_heliport.runwaydirection.identifier,
    airport_heliport.runwaydirection_ts.interpretation,
    airport_heliport.runwaydirection_ts.sequence_number,
    airport_heliport.runwaydirection_ts.correction_number,
    airport_heliport.runwaydirection_ts.valid_time_begin,
    airport_heliport.runwaydirection_ts.valid_time_end,
    airport_heliport.runwaydirection_ts.feature_lifetime_begin,
    airport_heliport.runwaydirection_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwaydirection_ts.designator_value as varchar), '(' || airport_heliport.runwaydirection_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.runwaydirection_ts.truebearing_value as varchar), '(' || airport_heliport.runwaydirection_ts.truebearing_nilreason || ')') as truebearing,
    coalesce(cast(airport_heliport.runwaydirection_ts.truebearingaccuracy_value as varchar), '(' || airport_heliport.runwaydirection_ts.truebearingaccuracy_nilreason || ')') as truebearingaccuracy,
    coalesce(cast(airport_heliport.runwaydirection_ts.magneticbearing_value as varchar), '(' || airport_heliport.runwaydirection_ts.magneticbearing_nilreason || ')') as magneticbearing,
    coalesce(cast(airport_heliport.runwaydirection_ts.patternvfr_value as varchar), '(' || airport_heliport.runwaydirection_ts.patternvfr_nilreason || ')') as patternvfr,
    coalesce(cast(airport_heliport.runwaydirection_ts.slopetdz_value as varchar), '(' || airport_heliport.runwaydirection_ts.slopetdz_nilreason || ')') as slopetdz,
    coalesce(cast(airport_heliport.runwaydirection_ts.approachmarkingtype_value as varchar), '(' || airport_heliport.runwaydirection_ts.approachmarkingtype_nilreason || ')') as approachmarkingtype,
    coalesce(cast(airport_heliport.runwaydirection_ts.approachmarkingcondition_value as varchar), '(' || airport_heliport.runwaydirection_ts.approachmarkingcondition_nilreason || ')') as approachmarkingcondition,
    coalesce(cast(airport_heliport.runwaydirection_ts.classlightingjar_value as varchar), '(' || airport_heliport.runwaydirection_ts.classlightingjar_nilreason || ')') as classlightingjar,
    coalesce(cast(airport_heliport.runwaydirection_ts.precisionapproachguidance_value as varchar), '(' || airport_heliport.runwaydirection_ts.precisionapproachguidance_nilreason || ')') as precisionapproachguidance,
    coalesce(cast(airport_heliport.runwaydirection_ts.elevationtdz_value as varchar) || ' ' || airport_heliport.runwaydirection_ts.elevationtdz_uom, '(' || airport_heliport.runwaydirection_ts.elevationtdz_nilreason || ')') as elevationtdz,
    coalesce(cast(airport_heliport.runwaydirection_ts.elevationtdzaccuracy_value as varchar) || ' ' || airport_heliport.runwaydirection_ts.elevationtdzaccuracy_uom, '(' || airport_heliport.runwaydirection_ts.elevationtdzaccuracy_nilreason || ')') as elevationtdzaccuracy,
    coalesce(cast(airport_heliport_runway_pt_bwjecf.title as varchar), '(' || airport_heliport_runway_pt_bwjecf.nilreason[1] || ')') AS usedrunway,
    airport_heliport_runway_pt_bwjecf.href AS usedrunway_href,
    coalesce(cast(airport_heliport_runwayelement_pt_hbbtpg.title as varchar), '(' || airport_heliport_runwayelement_pt_hbbtpg.nilreason[1] || ')') AS startingelement,
    airport_heliport_runwayelement_pt_hbbtpg.href AS startingelement_href,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.runwaydirection 
inner join master_join mj2 on airport_heliport.runwaydirection.id = mj2.source_id
inner join airport_heliport.runwaydirection_tsp on mj2.target_id = airport_heliport.runwaydirection_tsp.id
inner join airport_heliport.runwaydirection_ts on airport_heliport.runwaydirection_tsp.runwaydirectiontimeslice_id = airport_heliport.runwaydirection_ts.id
left join airport_heliport.runway_pt airport_heliport_runway_pt_bwjecf on airport_heliport.runwaydirection_ts.usedrunway_id = airport_heliport_runway_pt_bwjecf.id
left join airport_heliport.runwayelement_pt airport_heliport_runwayelement_pt_hbbtpg on airport_heliport.runwaydirection_ts.startingelement_id = airport_heliport_runwayelement_pt_hbbtpg.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qfizfo.*) AS annotation
  from master_join master_join_khkzjd
  join notes.note_view notes_note_view_qfizfo on master_join_khkzjd.target_id = notes_note_view_qfizfo.id
  where master_join_khkzjd.source_id = airport_heliport.runwaydirection_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_manoeuvringareaavailability_view_cxdbky.*) as lat_availability
  from master_join master_join_zreiks
  join airport_heliport.manoeuvringareaavailability_view airport_heliport_manoeuvringareaavailability_view_cxdbky on master_join_zreiks.target_id = airport_heliport_manoeuvringareaavailability_view_cxdbky.id
  where master_join_zreiks.source_id = airport_heliport.runwaydirection_ts.id
) as lat_availability on TRUE
where airport_heliport.runwaydirection.feature_status = 'APPROVED'
  and airport_heliport.runwaydirection_ts.feature_status = 'APPROVED'
order by runwaydirection.identifier, runwaydirection_ts.sequence_number, runwaydirection_ts.correction_number DESC;
create index on airport_heliport.runwaydirection_view (id);
-- RunwayElementTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'geometry.elevatedsurface_view', 'airport_heliport.manoeuvringareaavailability_view', 'notes.note_view']
drop materialized view if exists airport_heliport.runwayelement_view cascade;
create materialized view airport_heliport.runwayelement_view as
select distinct on (runwayelement.identifier,runwayelement_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwayelement.id,
    airport_heliport.runwayelement_ts.id as ts_id,
    airport_heliport.runwayelement_tsp.id as tsp_id,
    airport_heliport.runwayelement.identifier,
    airport_heliport.runwayelement_ts.interpretation,
    airport_heliport.runwayelement_ts.sequence_number,
    airport_heliport.runwayelement_ts.correction_number,
    airport_heliport.runwayelement_ts.valid_time_begin,
    airport_heliport.runwayelement_ts.valid_time_end,
    airport_heliport.runwayelement_ts.feature_lifetime_begin,
    airport_heliport.runwayelement_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwayelement_ts.type_value as varchar), '(' || airport_heliport.runwayelement_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.runwayelement_ts.gradeseparation_value as varchar), '(' || airport_heliport.runwayelement_ts.gradeseparation_nilreason || ')') as gradeseparation,
    coalesce(cast(airport_heliport.runwayelement_ts.length_value as varchar) || ' ' || airport_heliport.runwayelement_ts.length_uom, '(' || airport_heliport.runwayelement_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.runwayelement_ts.width_value as varchar) || ' ' || airport_heliport.runwayelement_ts.width_uom, '(' || airport_heliport.runwayelement_ts.width_nilreason || ')') as width,
    to_jsonb(airport_heliport_surfacecharacteristics_view_tpqoey.*) AS surfaceproperties,
    geometry_elevatedsurface_view_ciyxgp.geom AS extent_geom,
    geometry_elevatedsurface_view_ciyxgp.elevation AS extent_elevation,
    geometry_elevatedsurface_view_ciyxgp.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_ciyxgp.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_ciyxgp.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_ciyxgp.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_associatedrunway.lat_associatedrunway as associatedrunway,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.runwayelement 
inner join master_join mj2 on airport_heliport.runwayelement.id = mj2.source_id
inner join airport_heliport.runwayelement_tsp on mj2.target_id = airport_heliport.runwayelement_tsp.id
inner join airport_heliport.runwayelement_ts on airport_heliport.runwayelement_tsp.runwayelementtimeslice_id = airport_heliport.runwayelement_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_tpqoey on airport_heliport.runwayelement_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_tpqoey.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_ciyxgp on airport_heliport.runwayelement_ts.extent_id = geometry_elevatedsurface_view_ciyxgp.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runway_pt_larhzf.id,
      'title', coalesce(cast(airport_heliport_runway_pt_larhzf.title AS varchar), '(' || airport_heliport_runway_pt_larhzf.nilreason[1] || ')'),
      'href', airport_heliport_runway_pt_larhzf.href
  )) as lat_associatedrunway  from master_join master_join_ubbhiz
  join airport_heliport.runway_pt airport_heliport_runway_pt_larhzf on master_join_ubbhiz.target_id = airport_heliport_runway_pt_larhzf.id
  where master_join_ubbhiz.source_id = airport_heliport.runwayelement_ts.id
) as lat_associatedrunway on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_degyay.*) AS annotation
  from master_join master_join_wuifdz
  join notes.note_view notes_note_view_degyay on master_join_wuifdz.target_id = notes_note_view_degyay.id
  where master_join_wuifdz.source_id = airport_heliport.runwayelement_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_manoeuvringareaavailability_view_xebqdz.*) as lat_availability
  from master_join master_join_omotnh
  join airport_heliport.manoeuvringareaavailability_view airport_heliport_manoeuvringareaavailability_view_xebqdz on master_join_omotnh.target_id = airport_heliport_manoeuvringareaavailability_view_xebqdz.id
  where master_join_omotnh.source_id = airport_heliport.runwayelement_ts.id
) as lat_availability on TRUE
where airport_heliport.runwayelement.feature_status = 'APPROVED'
  and airport_heliport.runwayelement_ts.feature_status = 'APPROVED'
order by runwayelement.identifier, runwayelement_ts.sequence_number, runwayelement_ts.correction_number DESC;
create index on airport_heliport.runwayelement_view (id);
-- RunwayMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.runwaymarking_view cascade;
create materialized view airport_heliport.runwaymarking_view as
select distinct on (runwaymarking.identifier,runwaymarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwaymarking.id,
    airport_heliport.runwaymarking_ts.id as ts_id,
    airport_heliport.runwaymarking_tsp.id as tsp_id,
    airport_heliport.runwaymarking.identifier,
    airport_heliport.runwaymarking_ts.interpretation,
    airport_heliport.runwaymarking_ts.sequence_number,
    airport_heliport.runwaymarking_ts.correction_number,
    airport_heliport.runwaymarking_ts.valid_time_begin,
    airport_heliport.runwaymarking_ts.valid_time_end,
    airport_heliport.runwaymarking_ts.feature_lifetime_begin,
    airport_heliport.runwaymarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwaymarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.runwaymarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.runwaymarking_ts.condition_value as varchar), '(' || airport_heliport.runwaymarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.runwaymarking_ts.markinglocation_value as varchar), '(' || airport_heliport.runwaymarking_ts.markinglocation_nilreason || ')') as markinglocation,
    coalesce(cast(airport_heliport_runway_pt_yfrclz.title as varchar), '(' || airport_heliport_runway_pt_yfrclz.nilreason[1] || ')') AS markedrunway,
    airport_heliport_runway_pt_yfrclz.href AS markedrunway_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.runwaymarking 
inner join master_join mj2 on airport_heliport.runwaymarking.id = mj2.source_id
inner join airport_heliport.runwaymarking_tsp on mj2.target_id = airport_heliport.runwaymarking_tsp.id
inner join airport_heliport.runwaymarking_ts on airport_heliport.runwaymarking_tsp.runwaymarkingtimeslice_id = airport_heliport.runwaymarking_ts.id
left join airport_heliport.runway_pt airport_heliport_runway_pt_yfrclz on airport_heliport.runwaymarking_ts.markedrunway_id = airport_heliport_runway_pt_yfrclz.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_jtzotl.*) as lat_element
  from master_join master_join_rzgizi
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_jtzotl on master_join_rzgizi.target_id = airport_heliport_markingelement_view_jtzotl.id
  where master_join_rzgizi.source_id = airport_heliport.runwaymarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_dwvczl.*) AS annotation
  from master_join master_join_cpfstn
  join notes.note_view notes_note_view_dwvczl on master_join_cpfstn.target_id = notes_note_view_dwvczl.id
  where master_join_cpfstn.source_id = airport_heliport.runwaymarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.runwaymarking.feature_status = 'APPROVED'
  and airport_heliport.runwaymarking_ts.feature_status = 'APPROVED'
order by runwaymarking.identifier, runwaymarking_ts.sequence_number, runwaymarking_ts.correction_number DESC;
create index on airport_heliport.runwaymarking_view (id);
-- RunwayProtectAreaLightSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.runwayprotectarealightsystem_view cascade;
create materialized view airport_heliport.runwayprotectarealightsystem_view as
select distinct on (runwayprotectarealightsystem.identifier,runwayprotectarealightsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwayprotectarealightsystem.id,
    airport_heliport.runwayprotectarealightsystem_ts.id as ts_id,
    airport_heliport.runwayprotectarealightsystem_tsp.id as tsp_id,
    airport_heliport.runwayprotectarealightsystem.identifier,
    airport_heliport.runwayprotectarealightsystem_ts.interpretation,
    airport_heliport.runwayprotectarealightsystem_ts.sequence_number,
    airport_heliport.runwayprotectarealightsystem_ts.correction_number,
    airport_heliport.runwayprotectarealightsystem_ts.valid_time_begin,
    airport_heliport.runwayprotectarealightsystem_ts.valid_time_end,
    airport_heliport.runwayprotectarealightsystem_ts.feature_lifetime_begin,
    airport_heliport.runwayprotectarealightsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.colour_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.position_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.position_nilreason || ')') as position,
    coalesce(cast(airport_heliport_runwayprotectarea_pt_uuqfdh.title as varchar), '(' || airport_heliport_runwayprotectarea_pt_uuqfdh.nilreason[1] || ')') AS lightedarea,
    airport_heliport_runwayprotectarea_pt_uuqfdh.href AS lightedarea_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.runwayprotectarealightsystem 
inner join master_join mj2 on airport_heliport.runwayprotectarealightsystem.id = mj2.source_id
inner join airport_heliport.runwayprotectarealightsystem_tsp on mj2.target_id = airport_heliport.runwayprotectarealightsystem_tsp.id
inner join airport_heliport.runwayprotectarealightsystem_ts on airport_heliport.runwayprotectarealightsystem_tsp.runwayprotectarealightsystemtimeslice_id = airport_heliport.runwayprotectarealightsystem_ts.id
left join airport_heliport.runwayprotectarea_pt airport_heliport_runwayprotectarea_pt_uuqfdh on airport_heliport.runwayprotectarealightsystem_ts.lightedarea_id = airport_heliport_runwayprotectarea_pt_uuqfdh.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_ucmwzf.*) as lat_element
  from master_join master_join_yfwraj
  join shared.lightelement_view shared_lightelement_view_ucmwzf on master_join_yfwraj.target_id = shared_lightelement_view_ucmwzf.id
  where master_join_yfwraj.source_id = airport_heliport.runwayprotectarealightsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_ghedve.*) as lat_availability
  from master_join master_join_thqpit
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_ghedve on master_join_thqpit.target_id = airport_heliport_groundlightingavailability_view_ghedve.id
  where master_join_thqpit.source_id = airport_heliport.runwayprotectarealightsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_uauucf.*) AS annotation
  from master_join master_join_galfno
  join notes.note_view notes_note_view_uauucf on master_join_galfno.target_id = notes_note_view_uauucf.id
  where master_join_galfno.source_id = airport_heliport.runwayprotectarealightsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.runwayprotectarealightsystem.feature_status = 'APPROVED'
  and airport_heliport.runwayprotectarealightsystem_ts.feature_status = 'APPROVED'
order by runwayprotectarealightsystem.identifier, runwayprotectarealightsystem_ts.sequence_number, runwayprotectarealightsystem_ts.correction_number DESC;
create index on airport_heliport.runwayprotectarealightsystem_view (id);
-- RunwayProtectAreaTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.runwayprotectarea_view cascade;
create materialized view airport_heliport.runwayprotectarea_view as
select distinct on (runwayprotectarea.identifier,runwayprotectarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwayprotectarea.id,
    airport_heliport.runwayprotectarea_ts.id as ts_id,
    airport_heliport.runwayprotectarea_tsp.id as tsp_id,
    airport_heliport.runwayprotectarea.identifier,
    airport_heliport.runwayprotectarea_ts.interpretation,
    airport_heliport.runwayprotectarea_ts.sequence_number,
    airport_heliport.runwayprotectarea_ts.correction_number,
    airport_heliport.runwayprotectarea_ts.valid_time_begin,
    airport_heliport.runwayprotectarea_ts.valid_time_end,
    airport_heliport.runwayprotectarea_ts.feature_lifetime_begin,
    airport_heliport.runwayprotectarea_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.lighting_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.lighting_nilreason || ')') as lighting,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.obstaclefree_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.obstaclefree_nilreason || ')') as obstaclefree,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.type_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.status_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.width_value as varchar) || ' ' || airport_heliport.runwayprotectarea_ts.width_uom, '(' || airport_heliport.runwayprotectarea_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.length_value as varchar) || ' ' || airport_heliport.runwayprotectarea_ts.length_uom, '(' || airport_heliport.runwayprotectarea_ts.length_nilreason || ')') as length,
    to_jsonb(airport_heliport_surfacecharacteristics_view_awjvkz.*) AS surfaceproperties,
    geometry_elevatedsurface_view_pleijp.geom AS extent_geom,
    geometry_elevatedsurface_view_pleijp.elevation AS extent_elevation,
    geometry_elevatedsurface_view_pleijp.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_pleijp.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_pleijp.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_pleijp.horizontalAccuracy AS extent_horizontalaccuracy,
    coalesce(cast(airport_heliport_runwaydirection_pt_kmcran.title as varchar), '(' || airport_heliport_runwaydirection_pt_kmcran.nilreason[1] || ')') AS protectedrunwaydirection,
    airport_heliport_runwaydirection_pt_kmcran.href AS protectedrunwaydirection_href,
    lat_annotation.annotation as annotation
from airport_heliport.runwayprotectarea 
inner join master_join mj2 on airport_heliport.runwayprotectarea.id = mj2.source_id
inner join airport_heliport.runwayprotectarea_tsp on mj2.target_id = airport_heliport.runwayprotectarea_tsp.id
inner join airport_heliport.runwayprotectarea_ts on airport_heliport.runwayprotectarea_tsp.runwayprotectareatimeslice_id = airport_heliport.runwayprotectarea_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_awjvkz on airport_heliport.runwayprotectarea_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_awjvkz.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_pleijp on airport_heliport.runwayprotectarea_ts.extent_id = geometry_elevatedsurface_view_pleijp.id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_kmcran on airport_heliport.runwayprotectarea_ts.protectedrunwaydirection_id = airport_heliport_runwaydirection_pt_kmcran.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_thctqi.*) AS annotation
  from master_join master_join_maigko
  join notes.note_view notes_note_view_thctqi on master_join_maigko.target_id = notes_note_view_thctqi.id
  where master_join_maigko.source_id = airport_heliport.runwayprotectarea_ts.id
) as lat_annotation on TRUE
where airport_heliport.runwayprotectarea.feature_status = 'APPROVED'
  and airport_heliport.runwayprotectarea_ts.feature_status = 'APPROVED'
order by runwayprotectarea.identifier, runwayprotectarea_ts.sequence_number, runwayprotectarea_ts.correction_number DESC;
create index on airport_heliport.runwayprotectarea_view (id);
-- RunwayTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'airport_heliport.runwaycontamination_view', 'airport_heliport.runwaysectioncontamination_view', 'notes.note_view']
drop materialized view if exists airport_heliport.runway_view cascade;
create materialized view airport_heliport.runway_view as
select distinct on (runway.identifier,runway_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runway.id,
    airport_heliport.runway_ts.id as ts_id,
    airport_heliport.runway_tsp.id as tsp_id,
    airport_heliport.runway.identifier,
    airport_heliport.runway_ts.interpretation,
    airport_heliport.runway_ts.sequence_number,
    airport_heliport.runway_ts.correction_number,
    airport_heliport.runway_ts.valid_time_begin,
    airport_heliport.runway_ts.valid_time_end,
    airport_heliport.runway_ts.feature_lifetime_begin,
    airport_heliport.runway_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runway_ts.designator_value as varchar), '(' || airport_heliport.runway_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.runway_ts.type_value as varchar), '(' || airport_heliport.runway_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.runway_ts.abandoned_value as varchar), '(' || airport_heliport.runway_ts.abandoned_nilreason || ')') as abandoned,
    coalesce(cast(airport_heliport.runway_ts.nominallength_value as varchar) || ' ' || airport_heliport.runway_ts.nominallength_uom, '(' || airport_heliport.runway_ts.nominallength_nilreason || ')') as nominallength,
    coalesce(cast(airport_heliport.runway_ts.lengthaccuracy_value as varchar) || ' ' || airport_heliport.runway_ts.lengthaccuracy_uom, '(' || airport_heliport.runway_ts.lengthaccuracy_nilreason || ')') as lengthaccuracy,
    coalesce(cast(airport_heliport.runway_ts.nominalwidth_value as varchar) || ' ' || airport_heliport.runway_ts.nominalwidth_uom, '(' || airport_heliport.runway_ts.nominalwidth_nilreason || ')') as nominalwidth,
    coalesce(cast(airport_heliport.runway_ts.widthaccuracy_value as varchar) || ' ' || airport_heliport.runway_ts.widthaccuracy_uom, '(' || airport_heliport.runway_ts.widthaccuracy_nilreason || ')') as widthaccuracy,
    coalesce(cast(airport_heliport.runway_ts.widthshoulder_value as varchar) || ' ' || airport_heliport.runway_ts.widthshoulder_uom, '(' || airport_heliport.runway_ts.widthshoulder_nilreason || ')') as widthshoulder,
    coalesce(cast(airport_heliport.runway_ts.lengthstrip_value as varchar) || ' ' || airport_heliport.runway_ts.lengthstrip_uom, '(' || airport_heliport.runway_ts.lengthstrip_nilreason || ')') as lengthstrip,
    coalesce(cast(airport_heliport.runway_ts.widthstrip_value as varchar) || ' ' || airport_heliport.runway_ts.widthstrip_uom, '(' || airport_heliport.runway_ts.widthstrip_nilreason || ')') as widthstrip,
    coalesce(cast(airport_heliport.runway_ts.lengthoffset_value as varchar) || ' ' || airport_heliport.runway_ts.lengthoffset_uom, '(' || airport_heliport.runway_ts.lengthoffset_nilreason || ')') as lengthoffset,
    coalesce(cast(airport_heliport.runway_ts.widthoffset_value as varchar) || ' ' || airport_heliport.runway_ts.widthoffset_uom, '(' || airport_heliport.runway_ts.widthoffset_nilreason || ')') as widthoffset,
    to_jsonb(airport_heliport_surfacecharacteristics_view_yafhvx.*) AS surfaceproperties,
    coalesce(cast(airport_heliport_airportheliport_pt_cfvxgz.title as varchar), '(' || airport_heliport_airportheliport_pt_cfvxgz.nilreason[1] || ')') AS associatedairportheliport,
    airport_heliport_airportheliport_pt_cfvxgz.href AS associatedairportheliport_href,
    lat_overallcontaminant.lat_overallcontaminant as overallcontaminant,
    lat_annotation.annotation as annotation,
    lat_areacontaminant.lat_areacontaminant as areacontaminant
from airport_heliport.runway 
inner join master_join mj2 on airport_heliport.runway.id = mj2.source_id
inner join airport_heliport.runway_tsp on mj2.target_id = airport_heliport.runway_tsp.id
inner join airport_heliport.runway_ts on airport_heliport.runway_tsp.runwaytimeslice_id = airport_heliport.runway_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_yafhvx on airport_heliport.runway_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_yafhvx.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_cfvxgz on airport_heliport.runway_ts.associatedairportheliport_id = airport_heliport_airportheliport_pt_cfvxgz.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_runwaycontamination_view_mbopcj.*) as lat_overallcontaminant
  from master_join master_join_kyfszk
  join airport_heliport.runwaycontamination_view airport_heliport_runwaycontamination_view_mbopcj on master_join_kyfszk.target_id = airport_heliport_runwaycontamination_view_mbopcj.id
  where master_join_kyfszk.source_id = airport_heliport.runway_ts.id
) as lat_overallcontaminant on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_phhkcp.*) AS annotation
  from master_join master_join_vfaqag
  join notes.note_view notes_note_view_phhkcp on master_join_vfaqag.target_id = notes_note_view_phhkcp.id
  where master_join_vfaqag.source_id = airport_heliport.runway_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_runwaysectioncontamination_view_hzmbub.*) as lat_areacontaminant
  from master_join master_join_lejyil
  join airport_heliport.runwaysectioncontamination_view airport_heliport_runwaysectioncontamination_view_hzmbub on master_join_lejyil.target_id = airport_heliport_runwaysectioncontamination_view_hzmbub.id
  where master_join_lejyil.source_id = airport_heliport.runway_ts.id
) as lat_areacontaminant on TRUE
where airport_heliport.runway.feature_status = 'APPROVED'
  and airport_heliport.runway_ts.feature_status = 'APPROVED'
order by runway.identifier, runway_ts.sequence_number, runway_ts.correction_number DESC;
create index on airport_heliport.runway_view (id);
-- RunwayVisualRangeTimeSliceType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists airport_heliport.runwayvisualrange_view cascade;
create materialized view airport_heliport.runwayvisualrange_view as
select distinct on (runwayvisualrange.identifier,runwayvisualrange_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.runwayvisualrange.id,
    airport_heliport.runwayvisualrange_ts.id as ts_id,
    airport_heliport.runwayvisualrange_tsp.id as tsp_id,
    airport_heliport.runwayvisualrange.identifier,
    airport_heliport.runwayvisualrange_ts.interpretation,
    airport_heliport.runwayvisualrange_ts.sequence_number,
    airport_heliport.runwayvisualrange_ts.correction_number,
    airport_heliport.runwayvisualrange_ts.valid_time_begin,
    airport_heliport.runwayvisualrange_ts.valid_time_end,
    airport_heliport.runwayvisualrange_ts.feature_lifetime_begin,
    airport_heliport.runwayvisualrange_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.runwayvisualrange_ts.readingposition_value as varchar), '(' || airport_heliport.runwayvisualrange_ts.readingposition_nilreason || ')') as readingposition,
    geometry_elevatedpoint_view_abgilb.geom AS location_geom,
    geometry_elevatedpoint_view_abgilb.longitude AS location_longitude,
    geometry_elevatedpoint_view_abgilb.latitude AS location_latitude,
    geometry_elevatedpoint_view_abgilb.elevation AS location_elevation,
    geometry_elevatedpoint_view_abgilb.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_abgilb.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_abgilb.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_abgilb.horizontalAccuracy AS location_horizontalaccuracy,
    lat_associatedrunwaydirection.lat_associatedrunwaydirection as associatedrunwaydirection,
    lat_annotation.annotation as annotation
from airport_heliport.runwayvisualrange 
inner join master_join mj2 on airport_heliport.runwayvisualrange.id = mj2.source_id
inner join airport_heliport.runwayvisualrange_tsp on mj2.target_id = airport_heliport.runwayvisualrange_tsp.id
inner join airport_heliport.runwayvisualrange_ts on airport_heliport.runwayvisualrange_tsp.runwayvisualrangetimeslice_id = airport_heliport.runwayvisualrange_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_abgilb on airport_heliport.runwayvisualrange_ts.location_id = geometry_elevatedpoint_view_abgilb.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runwaydirection_pt_lifdyk.id,
      'title', coalesce(cast(airport_heliport_runwaydirection_pt_lifdyk.title AS varchar), '(' || airport_heliport_runwaydirection_pt_lifdyk.nilreason[1] || ')'),
      'href', airport_heliport_runwaydirection_pt_lifdyk.href
  )) as lat_associatedrunwaydirection  from master_join master_join_wrbzya
  join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_lifdyk on master_join_wrbzya.target_id = airport_heliport_runwaydirection_pt_lifdyk.id
  where master_join_wrbzya.source_id = airport_heliport.runwayvisualrange_ts.id
) as lat_associatedrunwaydirection on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xbekjj.*) AS annotation
  from master_join master_join_zxwnbx
  join notes.note_view notes_note_view_xbekjj on master_join_zxwnbx.target_id = notes_note_view_xbekjj.id
  where master_join_zxwnbx.source_id = airport_heliport.runwayvisualrange_ts.id
) as lat_annotation on TRUE
where airport_heliport.runwayvisualrange.feature_status = 'APPROVED'
  and airport_heliport.runwayvisualrange_ts.feature_status = 'APPROVED'
order by runwayvisualrange.identifier, runwayvisualrange_ts.sequence_number, runwayvisualrange_ts.correction_number DESC;
create index on airport_heliport.runwayvisualrange_view (id);
-- SafeAltitudeAreaTimeSliceType
-- ['procedure.safealtitudeareasector_view', 'notes.note_view', 'geometry.point_view']
drop materialized view if exists procedure.safealtitudearea_view cascade;
create materialized view procedure.safealtitudearea_view as
select distinct on (safealtitudearea.identifier,safealtitudearea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.safealtitudearea.id,
    procedure.safealtitudearea_ts.id as ts_id,
    procedure.safealtitudearea_tsp.id as tsp_id,
    procedure.safealtitudearea.identifier,
    procedure.safealtitudearea_ts.interpretation,
    procedure.safealtitudearea_ts.sequence_number,
    procedure.safealtitudearea_ts.correction_number,
    procedure.safealtitudearea_ts.valid_time_begin,
    procedure.safealtitudearea_ts.valid_time_end,
    procedure.safealtitudearea_ts.feature_lifetime_begin,
    procedure.safealtitudearea_ts.feature_lifetime_end,
    coalesce(cast(procedure.safealtitudearea_ts.safeareatype_value as varchar), '(' || procedure.safealtitudearea_ts.safeareatype_nilreason || ')') as safeareatype,
    coalesce(cast(navaids_points_designatedpoint_pt_odajkk.title as varchar), '(' || navaids_points_designatedpoint_pt_odajkk.nilreason[1] || ')') AS centrepointfixdesignatedpoint,
    navaids_points_designatedpoint_pt_odajkk.href AS centrepointfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_qgfzcr.title as varchar), '(' || navaids_points_navaid_pt_qgfzcr.nilreason[1] || ')') AS centrepointnavaidsystem,
    navaids_points_navaid_pt_qgfzcr.href AS centrepointnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_lyahak.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_lyahak.nilreason[1] || ')') AS centrepointaimingpoint,
    airport_heliport_touchdownliftoff_pt_lyahak.href AS centrepointaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_bdoryc.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_bdoryc.nilreason[1] || ')') AS centrepointrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_bdoryc.href AS centrepointrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_copgim.title as varchar), '(' || airport_heliport_airportheliport_pt_copgim.nilreason[1] || ')') AS centrepointairportreferencepoint,
    airport_heliport_airportheliport_pt_copgim.href AS centrepointairportreferencepoint_href,
    lat_location.lat_location as location,
    geometry_point_view_jvzaoy.geom AS centrepointposition_geom,
    geometry_point_view_jvzaoy.longitude AS centrepointposition_longitude,
    geometry_point_view_jvzaoy.latitude AS centrepointposition_latitude,
    geometry_point_view_jvzaoy.horizontalAccuracy AS centrepointposition_horizontalaccuracy,
    lat_sector.lat_sector as sector,
    lat_annotation.annotation as annotation
from procedure.safealtitudearea 
inner join master_join mj2 on procedure.safealtitudearea.id = mj2.source_id
inner join procedure.safealtitudearea_tsp on mj2.target_id = procedure.safealtitudearea_tsp.id
inner join procedure.safealtitudearea_ts on procedure.safealtitudearea_tsp.safealtitudeareatimeslice_id = procedure.safealtitudearea_ts.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_odajkk on procedure.safealtitudearea_ts.centrepoint_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_odajkk.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_qgfzcr on procedure.safealtitudearea_ts.centrepoint_navaidsystem_id = navaids_points_navaid_pt_qgfzcr.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_lyahak on procedure.safealtitudearea_ts.centrepoint_aimingpoint_id = airport_heliport_touchdownliftoff_pt_lyahak.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_bdoryc on procedure.safealtitudearea_ts.centrepoint_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_bdoryc.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_copgim on procedure.safealtitudearea_ts.centrepoint_airportreferencepoint_id = airport_heliport_airportheliport_pt_copgim.id
left join geometry.point_view geometry_point_view_jvzaoy on procedure.safealtitudearea_ts.centrepoint_position_id = geometry_point_view_jvzaoy.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_safealtitudeareasector_view_vkmray.*) as lat_sector
  from master_join master_join_tnfodt
  join procedure.safealtitudeareasector_view procedure_safealtitudeareasector_view_vkmray on master_join_tnfodt.target_id = procedure_safealtitudeareasector_view_vkmray.id
  where master_join_tnfodt.source_id = procedure.safealtitudearea_ts.id
) as lat_sector on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_rajoyh.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_rajoyh.title AS varchar), '(' || airport_heliport_airportheliport_pt_rajoyh.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_rajoyh.href
  )) as lat_location  from master_join master_join_osgebf
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_rajoyh on master_join_osgebf.target_id = airport_heliport_airportheliport_pt_rajoyh.id
  where master_join_osgebf.source_id = procedure.safealtitudearea_ts.id
) as lat_location on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_azrbpn.*) AS annotation
  from master_join master_join_hpppjj
  join notes.note_view notes_note_view_azrbpn on master_join_hpppjj.target_id = notes_note_view_azrbpn.id
  where master_join_hpppjj.source_id = procedure.safealtitudearea_ts.id
) as lat_annotation on TRUE
where procedure.safealtitudearea.feature_status = 'APPROVED'
  and procedure.safealtitudearea_ts.feature_status = 'APPROVED'
order by safealtitudearea.identifier, safealtitudearea_ts.sequence_number, safealtitudearea_ts.correction_number DESC;
create index on procedure.safealtitudearea_view (id);
-- SDFTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.sdf_view cascade;
create materialized view navaids_points.sdf_view as
select distinct on (sdf.identifier,sdf_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.sdf.id,
    navaids_points.sdf_ts.id as ts_id,
    navaids_points.sdf_tsp.id as tsp_id,
    navaids_points.sdf.identifier,
    navaids_points.sdf_ts.interpretation,
    navaids_points.sdf_ts.sequence_number,
    navaids_points.sdf_ts.correction_number,
    navaids_points.sdf_ts.valid_time_begin,
    navaids_points.sdf_ts.valid_time_end,
    navaids_points.sdf_ts.feature_lifetime_begin,
    navaids_points.sdf_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.sdf_ts.designator_value as varchar), '(' || navaids_points.sdf_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.sdf_ts.name_value as varchar), '(' || navaids_points.sdf_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.sdf_ts.emissionclass_value as varchar), '(' || navaids_points.sdf_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.sdf_ts.mobile_value as varchar), '(' || navaids_points.sdf_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.sdf_ts.magneticvariation_value as varchar), '(' || navaids_points.sdf_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.sdf_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.sdf_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.sdf_ts.datemagneticvariation_value as varchar), '(' || navaids_points.sdf_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.sdf_ts.flightchecked_value as varchar), '(' || navaids_points.sdf_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.sdf_ts.magneticbearing_value as varchar), '(' || navaids_points.sdf_ts.magneticbearing_nilreason || ')') as magneticbearing,
    coalesce(cast(navaids_points.sdf_ts.truebearing_value as varchar), '(' || navaids_points.sdf_ts.truebearing_nilreason || ')') as truebearing,
    coalesce(cast(navaids_points.sdf_ts.frequency_value as varchar) || ' ' || navaids_points.sdf_ts.frequency_uom, '(' || navaids_points.sdf_ts.frequency_nilreason || ')') as frequency,
    geometry_elevatedpoint_view_laipae.geom AS location_geom,
    geometry_elevatedpoint_view_laipae.longitude AS location_longitude,
    geometry_elevatedpoint_view_laipae.latitude AS location_latitude,
    geometry_elevatedpoint_view_laipae.elevation AS location_elevation,
    geometry_elevatedpoint_view_laipae.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_laipae.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_laipae.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_laipae.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.sdf 
inner join master_join mj2 on navaids_points.sdf.id = mj2.source_id
inner join navaids_points.sdf_tsp on mj2.target_id = navaids_points.sdf_tsp.id
inner join navaids_points.sdf_ts on navaids_points.sdf_tsp.sdftimeslice_id = navaids_points.sdf_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_laipae on navaids_points.sdf_ts.location_id = geometry_elevatedpoint_view_laipae.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_rquxlz.*) as lat_authority
  from master_join master_join_cjezli
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_rquxlz on master_join_cjezli.target_id = navaids_points_authorityfornavaidequipment_view_rquxlz.id
  where master_join_cjezli.source_id = navaids_points.sdf_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_pcgknb.*) as lat_monitoring
  from master_join master_join_gsobzd
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_pcgknb on master_join_gsobzd.target_id = navaids_points_navaidequipmentmonitoring_view_pcgknb.id
  where master_join_gsobzd.source_id = navaids_points.sdf_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_azieud.*) as lat_availability
  from master_join master_join_mljozt
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_azieud on master_join_mljozt.target_id = navaids_points_navaidoperationalstatus_view_azieud.id
  where master_join_mljozt.source_id = navaids_points.sdf_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gbglor.*) AS annotation
  from master_join master_join_cvbzaa
  join notes.note_view notes_note_view_gbglor on master_join_cvbzaa.target_id = notes_note_view_gbglor.id
  where master_join_cvbzaa.source_id = navaids_points.sdf_ts.id
) as lat_annotation on TRUE
where navaids_points.sdf.feature_status = 'APPROVED'
  and navaids_points.sdf_ts.feature_status = 'APPROVED'
order by sdf.identifier, sdf_ts.sequence_number, sdf_ts.correction_number DESC;
create index on navaids_points.sdf_view (id);
-- SeaplaneLandingAreaTimeSliceType
-- ['geometry.elevatedsurface_view', 'airport_heliport.manoeuvringareaavailability_view', 'notes.note_view']
drop materialized view if exists airport_heliport.seaplanelandingarea_view cascade;
create materialized view airport_heliport.seaplanelandingarea_view as
select distinct on (seaplanelandingarea.identifier,seaplanelandingarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.seaplanelandingarea.id,
    airport_heliport.seaplanelandingarea_ts.id as ts_id,
    airport_heliport.seaplanelandingarea_tsp.id as tsp_id,
    airport_heliport.seaplanelandingarea.identifier,
    airport_heliport.seaplanelandingarea_ts.interpretation,
    airport_heliport.seaplanelandingarea_ts.sequence_number,
    airport_heliport.seaplanelandingarea_ts.correction_number,
    airport_heliport.seaplanelandingarea_ts.valid_time_begin,
    airport_heliport.seaplanelandingarea_ts.valid_time_end,
    airport_heliport.seaplanelandingarea_ts.feature_lifetime_begin,
    airport_heliport.seaplanelandingarea_ts.feature_lifetime_end,
    geometry_elevatedsurface_view_tsgdoi.geom AS extent_geom,
    geometry_elevatedsurface_view_tsgdoi.elevation AS extent_elevation,
    geometry_elevatedsurface_view_tsgdoi.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_tsgdoi.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_tsgdoi.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_tsgdoi.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_rampsite.lat_rampsite as rampsite,
    lat_docksite.lat_docksite as docksite,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.seaplanelandingarea 
inner join master_join mj2 on airport_heliport.seaplanelandingarea.id = mj2.source_id
inner join airport_heliport.seaplanelandingarea_tsp on mj2.target_id = airport_heliport.seaplanelandingarea_tsp.id
inner join airport_heliport.seaplanelandingarea_ts on airport_heliport.seaplanelandingarea_tsp.seaplanelandingareatimeslice_id = airport_heliport.seaplanelandingarea_ts.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_tsgdoi on airport_heliport.seaplanelandingarea_ts.extent_id = geometry_elevatedsurface_view_tsgdoi.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_seaplanerampsite_pt_ciwcuq.id,
      'title', coalesce(cast(airport_heliport_seaplanerampsite_pt_ciwcuq.title AS varchar), '(' || airport_heliport_seaplanerampsite_pt_ciwcuq.nilreason[1] || ')'),
      'href', airport_heliport_seaplanerampsite_pt_ciwcuq.href
  )) as lat_rampsite  from master_join master_join_lwhwhs
  join airport_heliport.seaplanerampsite_pt airport_heliport_seaplanerampsite_pt_ciwcuq on master_join_lwhwhs.target_id = airport_heliport_seaplanerampsite_pt_ciwcuq.id
  where master_join_lwhwhs.source_id = airport_heliport.seaplanelandingarea_ts.id
) as lat_rampsite on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_floatingdocksite_pt_sdynob.id,
      'title', coalesce(cast(airport_heliport_floatingdocksite_pt_sdynob.title AS varchar), '(' || airport_heliport_floatingdocksite_pt_sdynob.nilreason[1] || ')'),
      'href', airport_heliport_floatingdocksite_pt_sdynob.href
  )) as lat_docksite  from master_join master_join_hqeuss
  join airport_heliport.floatingdocksite_pt airport_heliport_floatingdocksite_pt_sdynob on master_join_hqeuss.target_id = airport_heliport_floatingdocksite_pt_sdynob.id
  where master_join_hqeuss.source_id = airport_heliport.seaplanelandingarea_ts.id
) as lat_docksite on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_fyfcsr.*) AS annotation
  from master_join master_join_bvkgrd
  join notes.note_view notes_note_view_fyfcsr on master_join_bvkgrd.target_id = notes_note_view_fyfcsr.id
  where master_join_bvkgrd.source_id = airport_heliport.seaplanelandingarea_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_manoeuvringareaavailability_view_gquzjj.*) as lat_availability
  from master_join master_join_mwzhjm
  join airport_heliport.manoeuvringareaavailability_view airport_heliport_manoeuvringareaavailability_view_gquzjj on master_join_mwzhjm.target_id = airport_heliport_manoeuvringareaavailability_view_gquzjj.id
  where master_join_mwzhjm.source_id = airport_heliport.seaplanelandingarea_ts.id
) as lat_availability on TRUE
where airport_heliport.seaplanelandingarea.feature_status = 'APPROVED'
  and airport_heliport.seaplanelandingarea_ts.feature_status = 'APPROVED'
order by seaplanelandingarea.identifier, seaplanelandingarea_ts.sequence_number, seaplanelandingarea_ts.correction_number DESC;
create index on airport_heliport.seaplanelandingarea_view (id);
-- SeaplaneRampSiteTimeSliceType
-- ['geometry.elevatedsurface_view', 'geometry.elevatedcurve_view', 'notes.note_view']
drop materialized view if exists airport_heliport.seaplanerampsite_view cascade;
create materialized view airport_heliport.seaplanerampsite_view as
select distinct on (seaplanerampsite.identifier,seaplanerampsite_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.seaplanerampsite.id,
    airport_heliport.seaplanerampsite_ts.id as ts_id,
    airport_heliport.seaplanerampsite_tsp.id as tsp_id,
    airport_heliport.seaplanerampsite.identifier,
    airport_heliport.seaplanerampsite_ts.interpretation,
    airport_heliport.seaplanerampsite_ts.sequence_number,
    airport_heliport.seaplanerampsite_ts.correction_number,
    airport_heliport.seaplanerampsite_ts.valid_time_begin,
    airport_heliport.seaplanerampsite_ts.valid_time_end,
    airport_heliport.seaplanerampsite_ts.feature_lifetime_begin,
    airport_heliport.seaplanerampsite_ts.feature_lifetime_end,
    geometry_elevatedsurface_view_hcvwqt.geom AS extent_geom,
    geometry_elevatedsurface_view_hcvwqt.elevation AS extent_elevation,
    geometry_elevatedsurface_view_hcvwqt.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_hcvwqt.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_hcvwqt.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_hcvwqt.horizontalAccuracy AS extent_horizontalaccuracy,
    geometry_elevatedcurve_view_bkkhlg.geom AS centreline_geom,
    geometry_elevatedcurve_view_bkkhlg.elevation AS centreline_elevation,
    geometry_elevatedcurve_view_bkkhlg.geoidUndulation AS centreline_geoidundulation,
    geometry_elevatedcurve_view_bkkhlg.verticalDatum AS centreline_verticaldatum,
    geometry_elevatedcurve_view_bkkhlg.verticalAccuracy AS centreline_verticalaccuracy,
    geometry_elevatedcurve_view_bkkhlg.horizontalAccuracy AS centreline_horizontalaccuracy,
    lat_annotation.annotation as annotation
from airport_heliport.seaplanerampsite 
inner join master_join mj2 on airport_heliport.seaplanerampsite.id = mj2.source_id
inner join airport_heliport.seaplanerampsite_tsp on mj2.target_id = airport_heliport.seaplanerampsite_tsp.id
inner join airport_heliport.seaplanerampsite_ts on airport_heliport.seaplanerampsite_tsp.seaplanerampsitetimeslice_id = airport_heliport.seaplanerampsite_ts.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_hcvwqt on airport_heliport.seaplanerampsite_ts.extent_id = geometry_elevatedsurface_view_hcvwqt.id
left join geometry.elevatedcurve_view geometry_elevatedcurve_view_bkkhlg on airport_heliport.seaplanerampsite_ts.centreline_id = geometry_elevatedcurve_view_bkkhlg.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_tdcwwq.*) AS annotation
  from master_join master_join_aaysxn
  join notes.note_view notes_note_view_tdcwwq on master_join_aaysxn.target_id = notes_note_view_tdcwwq.id
  where master_join_aaysxn.source_id = airport_heliport.seaplanerampsite_ts.id
) as lat_annotation on TRUE
where airport_heliport.seaplanerampsite.feature_status = 'APPROVED'
  and airport_heliport.seaplanerampsite_ts.feature_status = 'APPROVED'
order by seaplanerampsite.identifier, seaplanerampsite_ts.sequence_number, seaplanerampsite_ts.correction_number DESC;
create index on airport_heliport.seaplanerampsite_view (id);
-- SearchRescueServiceTimeSliceType
-- ['routes.routeportion_view', 'geometry.elevatedpoint_view', 'service.callsigndetail_view', 'notes.note_view', 'shared.contactinformation_view', 'service.serviceoperationalstatus_view']
drop materialized view if exists service.searchrescueservice_view cascade;
create materialized view service.searchrescueservice_view as
select distinct on (searchrescueservice.identifier,searchrescueservice_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    service.searchrescueservice.id,
    service.searchrescueservice_ts.id as ts_id,
    service.searchrescueservice_tsp.id as tsp_id,
    service.searchrescueservice.identifier,
    service.searchrescueservice_ts.interpretation,
    service.searchrescueservice_ts.sequence_number,
    service.searchrescueservice_ts.correction_number,
    service.searchrescueservice_ts.valid_time_begin,
    service.searchrescueservice_ts.valid_time_end,
    service.searchrescueservice_ts.feature_lifetime_begin,
    service.searchrescueservice_ts.feature_lifetime_end,
    coalesce(cast(service.searchrescueservice_ts.flightoperations_value as varchar), '(' || service.searchrescueservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.searchrescueservice_ts.rank_value as varchar), '(' || service.searchrescueservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.searchrescueservice_ts.complianticao_value as varchar), '(' || service.searchrescueservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.searchrescueservice_ts.name_value as varchar), '(' || service.searchrescueservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.searchrescueservice_ts.type_value as varchar), '(' || service.searchrescueservice_ts.type_nilreason || ')') as type,
    geometry_elevatedpoint_view_vlpnmn.geom AS location_geom,
    geometry_elevatedpoint_view_vlpnmn.longitude AS location_longitude,
    geometry_elevatedpoint_view_vlpnmn.latitude AS location_latitude,
    geometry_elevatedpoint_view_vlpnmn.elevation AS location_elevation,
    geometry_elevatedpoint_view_vlpnmn.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_vlpnmn.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_vlpnmn.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_vlpnmn.horizontalAccuracy AS location_horizontalaccuracy,
    coalesce(cast(organisation_unit_pt_tqzyxl.title as varchar), '(' || organisation_unit_pt_tqzyxl.nilreason[1] || ')') AS serviceprovider,
    organisation_unit_pt_tqzyxl.href AS serviceprovider_href,
    lat_callsign.lat_callsign as callsign,
    lat_radiocommunication.lat_radiocommunication as radiocommunication,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation,
    lat_clientairspace.lat_clientairspace as clientairspace,
    lat_clientroute.lat_clientroute as clientroute
from service.searchrescueservice 
inner join master_join mj2 on service.searchrescueservice.id = mj2.source_id
inner join service.searchrescueservice_tsp on mj2.target_id = service.searchrescueservice_tsp.id
inner join service.searchrescueservice_ts on service.searchrescueservice_tsp.searchrescueservicetimeslice_id = service.searchrescueservice_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_vlpnmn on service.searchrescueservice_ts.location_id = geometry_elevatedpoint_view_vlpnmn.id
left join organisation.unit_pt organisation_unit_pt_tqzyxl on service.searchrescueservice_ts.serviceprovider_id = organisation_unit_pt_tqzyxl.id
left join lateral(
  select jsonb_agg(DISTINCT service_callsigndetail_view_uocshc.*) as lat_callsign
  from master_join master_join_ocwhok
  join service.callsigndetail_view service_callsigndetail_view_uocshc on master_join_ocwhok.target_id = service_callsigndetail_view_uocshc.id
  where master_join_ocwhok.source_id = service.searchrescueservice_ts.id
) as lat_callsign on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_radiocommunicationchannel_pt_arghct.id,
      'title', coalesce(cast(service_radiocommunicationchannel_pt_arghct.title AS varchar), '(' || service_radiocommunicationchannel_pt_arghct.nilreason[1] || ')'),
      'href', service_radiocommunicationchannel_pt_arghct.href
  )) as lat_radiocommunication  from master_join master_join_sjwrei
  join service.radiocommunicationchannel_pt service_radiocommunicationchannel_pt_arghct on master_join_sjwrei.target_id = service_radiocommunicationchannel_pt_arghct.id
  where master_join_sjwrei.source_id = service.searchrescueservice_ts.id
) as lat_radiocommunication on TRUE
left join lateral(
  select
  from master_join master_join_dlrint
  join shared.contactinformation_view shared_contactinformation_view_shocul on master_join_dlrint.target_id = shared_contactinformation_view_shocul.id
  where master_join_dlrint.source_id = service.searchrescueservice_ts.id
) as lat_groundcommunication on TRUE
left join lateral(
  select jsonb_agg(DISTINCT service_serviceoperationalstatus_view_yurnkb.*) as lat_availability
  from master_join master_join_zjxfet
  join service.serviceoperationalstatus_view service_serviceoperationalstatus_view_yurnkb on master_join_zjxfet.target_id = service_serviceoperationalstatus_view_yurnkb.id
  where master_join_zjxfet.source_id = service.searchrescueservice_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gejqga.*) AS annotation
  from master_join master_join_zmcoma
  join notes.note_view notes_note_view_gejqga on master_join_zmcoma.target_id = notes_note_view_gejqga.id
  where master_join_zmcoma.source_id = service.searchrescueservice_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airspace_airspace_pt_orkwtd.id,
      'title', coalesce(cast(airspace_airspace_pt_orkwtd.title AS varchar), '(' || airspace_airspace_pt_orkwtd.nilreason[1] || ')'),
      'href', airspace_airspace_pt_orkwtd.href
  )) as lat_clientairspace  from master_join master_join_nybdre
  join airspace.airspace_pt airspace_airspace_pt_orkwtd on master_join_nybdre.target_id = airspace_airspace_pt_orkwtd.id
  where master_join_nybdre.source_id = service.searchrescueservice_ts.id
) as lat_clientairspace on TRUE
left join lateral(
  select jsonb_agg(DISTINCT routes_routeportion_view_poojfe.*) as lat_clientroute
  from master_join master_join_sxwecd
  join routes.routeportion_view routes_routeportion_view_poojfe on master_join_sxwecd.target_id = routes_routeportion_view_poojfe.id
  where master_join_sxwecd.source_id = service.searchrescueservice_ts.id
) as lat_clientroute on TRUE
where service.searchrescueservice.feature_status = 'APPROVED'
  and service.searchrescueservice_ts.feature_status = 'APPROVED'
order by searchrescueservice.identifier, searchrescueservice_ts.sequence_number, searchrescueservice_ts.correction_number DESC;
create index on service.searchrescueservice_view (id);
-- SecondarySurveillanceRadarTimeSliceType
-- ['surveillance.surveillancegroundstation_view', 'notes.note_view', 'geometry.elevatedpoint_view', 'shared.contactinformation_view']
drop materialized view if exists surveillance.secondarysurveillanceradar_view cascade;
create materialized view surveillance.secondarysurveillanceradar_view as
select distinct on (secondarysurveillanceradar.identifier,secondarysurveillanceradar_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    surveillance.secondarysurveillanceradar.id,
    surveillance.secondarysurveillanceradar_ts.id as ts_id,
    surveillance.secondarysurveillanceradar_tsp.id as tsp_id,
    surveillance.secondarysurveillanceradar.identifier,
    surveillance.secondarysurveillanceradar_ts.interpretation,
    surveillance.secondarysurveillanceradar_ts.sequence_number,
    surveillance.secondarysurveillanceradar_ts.correction_number,
    surveillance.secondarysurveillanceradar_ts.valid_time_begin,
    surveillance.secondarysurveillanceradar_ts.valid_time_end,
    surveillance.secondarysurveillanceradar_ts.feature_lifetime_begin,
    surveillance.secondarysurveillanceradar_ts.feature_lifetime_end,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.name_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.name_nilreason || ')') as name,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.serialnumber_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.serialnumber_nilreason || ')') as serialnumber,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.dualchannel_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.dualchannel_nilreason || ')') as dualchannel,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.movingtargetindicator_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.movingtargetindicator_nilreason || ')') as movingtargetindicator,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.standbypower_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.standbypower_nilreason || ')') as standbypower,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.digital_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.digital_nilreason || ')') as digital,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.militaryuseonly_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.militaryuseonly_nilreason || ')') as militaryuseonly,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.specialuseonly_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.specialuseonly_nilreason || ')') as specialuseonly,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.specialaircraftonly_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.specialaircraftonly_nilreason || ')') as specialaircraftonly,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.magneticvariation_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.magneticvariationaccuracy_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.datemagneticvariation_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.verticalcoverageazimuth_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.verticalcoverageazimuth_nilreason || ')') as verticalcoverageazimuth,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.antennatiltfixed_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.antennatiltfixed_nilreason || ')') as antennatiltfixed,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.tiltangle_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.tiltangle_nilreason || ')') as tiltangle,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.automatedradarterminalsystem_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.automatedradarterminalsystem_nilreason || ')') as automatedradarterminalsystem,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.transponder_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.transponder_nilreason || ')') as transponder,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.autonomous_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.autonomous_nilreason || ')') as autonomous,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.monopulse_value as varchar), '(' || surveillance.secondarysurveillanceradar_ts.monopulse_nilreason || ')') as monopulse,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.range_value as varchar) || ' ' || surveillance.secondarysurveillanceradar_ts.range_uom, '(' || surveillance.secondarysurveillanceradar_ts.range_nilreason || ')') as range,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.rangeaccuracy_value as varchar) || ' ' || surveillance.secondarysurveillanceradar_ts.rangeaccuracy_uom, '(' || surveillance.secondarysurveillanceradar_ts.rangeaccuracy_nilreason || ')') as rangeaccuracy,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.verticalcoveragealtitude_value as varchar) || ' ' || surveillance.secondarysurveillanceradar_ts.verticalcoveragealtitude_uom, '(' || surveillance.secondarysurveillanceradar_ts.verticalcoveragealtitude_nilreason || ')') as verticalcoveragealtitude,
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_value as varchar) || ' ' || surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_uom, '(' || surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_nilreason || ')') as verticalcoveragedistance,
    geometry_elevatedpoint_view_sdgszq.geom AS location_geom,
    geometry_elevatedpoint_view_sdgszq.longitude AS location_longitude,
    geometry_elevatedpoint_view_sdgszq.latitude AS location_latitude,
    geometry_elevatedpoint_view_sdgszq.elevation AS location_elevation,
    geometry_elevatedpoint_view_sdgszq.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_sdgszq.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_sdgszq.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_sdgszq.horizontalAccuracy AS location_horizontalaccuracy,
    lat_annotation.annotation as annotation,
    lat_groundstation.lat_groundstation as groundstation
from surveillance.secondarysurveillanceradar 
inner join master_join mj2 on surveillance.secondarysurveillanceradar.id = mj2.source_id
inner join surveillance.secondarysurveillanceradar_tsp on mj2.target_id = surveillance.secondarysurveillanceradar_tsp.id
inner join surveillance.secondarysurveillanceradar_ts on surveillance.secondarysurveillanceradar_tsp.secondarysurveillanceradartimeslice_id = surveillance.secondarysurveillanceradar_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_sdgszq on surveillance.secondarysurveillanceradar_ts.location_id = geometry_elevatedpoint_view_sdgszq.id
left join lateral(
  select
  from master_join master_join_nqrjgz
  join shared.contactinformation_view shared_contactinformation_view_jvqcjb on master_join_nqrjgz.target_id = shared_contactinformation_view_jvqcjb.id
  where master_join_nqrjgz.source_id = surveillance.secondarysurveillanceradar_ts.id
) as lat_contact on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_eikptw.*) AS annotation
  from master_join master_join_psbxkd
  join notes.note_view notes_note_view_eikptw on master_join_psbxkd.target_id = notes_note_view_eikptw.id
  where master_join_psbxkd.source_id = surveillance.secondarysurveillanceradar_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT surveillance_surveillancegroundstation_view_ntxdxu.*) as lat_groundstation
  from master_join master_join_acvglc
  join surveillance.surveillancegroundstation_view surveillance_surveillancegroundstation_view_ntxdxu on master_join_acvglc.target_id = surveillance_surveillancegroundstation_view_ntxdxu.id
  where master_join_acvglc.source_id = surveillance.secondarysurveillanceradar_ts.id
) as lat_groundstation on TRUE
where surveillance.secondarysurveillanceradar.feature_status = 'APPROVED'
  and surveillance.secondarysurveillanceradar_ts.feature_status = 'APPROVED'
order by secondarysurveillanceradar.identifier, secondarysurveillanceradar_ts.sequence_number, secondarysurveillanceradar_ts.correction_number DESC;
create index on surveillance.secondarysurveillanceradar_view (id);
-- SignificantPointInAirspaceTimeSliceType
-- ['notes.note_view', 'geometry.point_view']
drop materialized view if exists navaids_points.significantpointinairspace_view cascade;
create materialized view navaids_points.significantpointinairspace_view as
select distinct on (significantpointinairspace.identifier,significantpointinairspace_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.significantpointinairspace.id,
    navaids_points.significantpointinairspace_ts.id as ts_id,
    navaids_points.significantpointinairspace_tsp.id as tsp_id,
    navaids_points.significantpointinairspace.identifier,
    navaids_points.significantpointinairspace_ts.interpretation,
    navaids_points.significantpointinairspace_ts.sequence_number,
    navaids_points.significantpointinairspace_ts.correction_number,
    navaids_points.significantpointinairspace_ts.valid_time_begin,
    navaids_points.significantpointinairspace_ts.valid_time_end,
    navaids_points.significantpointinairspace_ts.feature_lifetime_begin,
    navaids_points.significantpointinairspace_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.significantpointinairspace_ts.type_value as varchar), '(' || navaids_points.significantpointinairspace_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.significantpointinairspace_ts.relativelocation_value as varchar), '(' || navaids_points.significantpointinairspace_ts.relativelocation_nilreason || ')') as relativelocation,
    coalesce(cast(airspace_airspace_pt_jchmrn.title as varchar), '(' || airspace_airspace_pt_jchmrn.nilreason[1] || ')') AS containingairspace,
    airspace_airspace_pt_jchmrn.href AS containingairspace_href,
    coalesce(cast(navaids_points_designatedpoint_pt_eidxjv.title as varchar), '(' || navaids_points_designatedpoint_pt_eidxjv.nilreason[1] || ')') AS locationfixdesignatedpoint,
    navaids_points_designatedpoint_pt_eidxjv.href AS locationfixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_vzbulc.title as varchar), '(' || navaids_points_navaid_pt_vzbulc.nilreason[1] || ')') AS locationnavaidsystem,
    navaids_points_navaid_pt_vzbulc.href AS locationnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_tozkhz.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_tozkhz.nilreason[1] || ')') AS locationaimingpoint,
    airport_heliport_touchdownliftoff_pt_tozkhz.href AS locationaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_xllgxa.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_xllgxa.nilreason[1] || ')') AS locationrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_xllgxa.href AS locationrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_canxha.title as varchar), '(' || airport_heliport_airportheliport_pt_canxha.nilreason[1] || ')') AS locationairportreferencepoint,
    airport_heliport_airportheliport_pt_canxha.href AS locationairportreferencepoint_href,
    geometry_point_view_yxdiuc.geom AS locationposition_geom,
    geometry_point_view_yxdiuc.longitude AS locationposition_longitude,
    geometry_point_view_yxdiuc.latitude AS locationposition_latitude,
    geometry_point_view_yxdiuc.horizontalAccuracy AS locationposition_horizontalaccuracy,
    lat_annotation.annotation as annotation
from navaids_points.significantpointinairspace 
inner join master_join mj2 on navaids_points.significantpointinairspace.id = mj2.source_id
inner join navaids_points.significantpointinairspace_tsp on mj2.target_id = navaids_points.significantpointinairspace_tsp.id
inner join navaids_points.significantpointinairspace_ts on navaids_points.significantpointinairspace_tsp.significantpointinairspacetimeslice_id = navaids_points.significantpointinairspace_ts.id
left join airspace.airspace_pt airspace_airspace_pt_jchmrn on navaids_points.significantpointinairspace_ts.containingairspace_id = airspace_airspace_pt_jchmrn.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_eidxjv on navaids_points.significantpointinairspace_ts.location_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_eidxjv.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_vzbulc on navaids_points.significantpointinairspace_ts.location_navaidsystem_id = navaids_points_navaid_pt_vzbulc.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_tozkhz on navaids_points.significantpointinairspace_ts.location_aimingpoint_id = airport_heliport_touchdownliftoff_pt_tozkhz.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_xllgxa on navaids_points.significantpointinairspace_ts.location_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_xllgxa.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_canxha on navaids_points.significantpointinairspace_ts.location_airportreferencepoint_id = airport_heliport_airportheliport_pt_canxha.id
left join geometry.point_view geometry_point_view_yxdiuc on navaids_points.significantpointinairspace_ts.location_position_id = geometry_point_view_yxdiuc.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_csgobh.*) AS annotation
  from master_join master_join_xhpzhb
  join notes.note_view notes_note_view_csgobh on master_join_xhpzhb.target_id = notes_note_view_csgobh.id
  where master_join_xhpzhb.source_id = navaids_points.significantpointinairspace_ts.id
) as lat_annotation on TRUE
where navaids_points.significantpointinairspace.feature_status = 'APPROVED'
  and navaids_points.significantpointinairspace_ts.feature_status = 'APPROVED'
order by significantpointinairspace.identifier, significantpointinairspace_ts.sequence_number, significantpointinairspace_ts.correction_number DESC;
create index on navaids_points.significantpointinairspace_view (id);
-- SpecialDateTimeSliceType
-- ['notes.note_view']
drop materialized view if exists shared.specialdate_view cascade;
create materialized view shared.specialdate_view as
select distinct on (specialdate.identifier,specialdate_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    shared.specialdate.id,
    shared.specialdate_ts.id as ts_id,
    shared.specialdate_tsp.id as tsp_id,
    shared.specialdate.identifier,
    shared.specialdate_ts.interpretation,
    shared.specialdate_ts.sequence_number,
    shared.specialdate_ts.correction_number,
    shared.specialdate_ts.valid_time_begin,
    shared.specialdate_ts.valid_time_end,
    shared.specialdate_ts.feature_lifetime_begin,
    shared.specialdate_ts.feature_lifetime_end,
    coalesce(cast(shared.specialdate_ts.type_value as varchar), '(' || shared.specialdate_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.specialdate_ts.dateday_value as varchar), '(' || shared.specialdate_ts.dateday_nilreason || ')') as dateday,
    coalesce(cast(shared.specialdate_ts.dateyear_value as varchar), '(' || shared.specialdate_ts.dateyear_nilreason || ')') as dateyear,
    coalesce(cast(shared.specialdate_ts.name_value as varchar), '(' || shared.specialdate_ts.name_nilreason || ')') as name,
    coalesce(cast(organisation_organisationauthority_pt_veowcd.title as varchar), '(' || organisation_organisationauthority_pt_veowcd.nilreason[1] || ')') AS authority,
    organisation_organisationauthority_pt_veowcd.href AS authority_href,
    lat_annotation.annotation as annotation
from shared.specialdate 
inner join master_join mj2 on shared.specialdate.id = mj2.source_id
inner join shared.specialdate_tsp on mj2.target_id = shared.specialdate_tsp.id
inner join shared.specialdate_ts on shared.specialdate_tsp.specialdatetimeslice_id = shared.specialdate_ts.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_veowcd on shared.specialdate_ts.authority_id = organisation_organisationauthority_pt_veowcd.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_aotbzx.*) AS annotation
  from master_join master_join_gtbzsn
  join notes.note_view notes_note_view_aotbzx on master_join_gtbzsn.target_id = notes_note_view_aotbzx.id
  where master_join_gtbzsn.source_id = shared.specialdate_ts.id
) as lat_annotation on TRUE
where shared.specialdate.feature_status = 'APPROVED'
  and shared.specialdate_ts.feature_status = 'APPROVED'
order by specialdate.identifier, specialdate_ts.sequence_number, specialdate_ts.correction_number DESC;
create index on shared.specialdate_view (id);
-- SpecialNavigationStationTimeSliceType
-- ['navaids_points.authorityforspecialnavigationstation_view', 'navaids_points.specialnavigationstationstatus_view', 'notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists navaids_points.specialnavigationstation_view cascade;
create materialized view navaids_points.specialnavigationstation_view as
select distinct on (specialnavigationstation.identifier,specialnavigationstation_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.specialnavigationstation.id,
    navaids_points.specialnavigationstation_ts.id as ts_id,
    navaids_points.specialnavigationstation_tsp.id as tsp_id,
    navaids_points.specialnavigationstation.identifier,
    navaids_points.specialnavigationstation_ts.interpretation,
    navaids_points.specialnavigationstation_ts.sequence_number,
    navaids_points.specialnavigationstation_ts.correction_number,
    navaids_points.specialnavigationstation_ts.valid_time_begin,
    navaids_points.specialnavigationstation_ts.valid_time_end,
    navaids_points.specialnavigationstation_ts.feature_lifetime_begin,
    navaids_points.specialnavigationstation_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.specialnavigationstation_ts.name_value as varchar), '(' || navaids_points.specialnavigationstation_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.specialnavigationstation_ts.type_value as varchar), '(' || navaids_points.specialnavigationstation_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.specialnavigationstation_ts.emission_value as varchar), '(' || navaids_points.specialnavigationstation_ts.emission_nilreason || ')') as emission,
    coalesce(cast(navaids_points.specialnavigationstation_ts.frequency_value as varchar) || ' ' || navaids_points.specialnavigationstation_ts.frequency_uom, '(' || navaids_points.specialnavigationstation_ts.frequency_nilreason || ')') as frequency,
    coalesce(cast(navaids_points_specialnavigationsystem_pt_rzmnvq.title as varchar), '(' || navaids_points_specialnavigationsystem_pt_rzmnvq.nilreason[1] || ')') AS systemchain,
    navaids_points_specialnavigationsystem_pt_rzmnvq.href AS systemchain_href,
    to_jsonb(navaids_points_authorityforspecialnavigationstation_view_iwlqdc.*) AS responsibleorganisation,
    geometry_elevatedpoint_view_lrsvwz.geom AS position_geom,
    geometry_elevatedpoint_view_lrsvwz.longitude AS position_longitude,
    geometry_elevatedpoint_view_lrsvwz.latitude AS position_latitude,
    geometry_elevatedpoint_view_lrsvwz.elevation AS position_elevation,
    geometry_elevatedpoint_view_lrsvwz.geoidUndulation AS position_geoidundulation,
    geometry_elevatedpoint_view_lrsvwz.verticalDatum AS position_verticaldatum,
    geometry_elevatedpoint_view_lrsvwz.verticalAccuracy AS position_verticalaccuracy,
    geometry_elevatedpoint_view_lrsvwz.horizontalAccuracy AS position_horizontalaccuracy,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.specialnavigationstation 
inner join master_join mj2 on navaids_points.specialnavigationstation.id = mj2.source_id
inner join navaids_points.specialnavigationstation_tsp on mj2.target_id = navaids_points.specialnavigationstation_tsp.id
inner join navaids_points.specialnavigationstation_ts on navaids_points.specialnavigationstation_tsp.specialnavigationstationtimeslice_id = navaids_points.specialnavigationstation_ts.id
left join navaids_points.specialnavigationsystem_pt navaids_points_specialnavigationsystem_pt_rzmnvq on navaids_points.specialnavigationstation_ts.systemchain_id = navaids_points_specialnavigationsystem_pt_rzmnvq.id
left join navaids_points.authorityforspecialnavigationstation_view navaids_points_authorityforspecialnavigationstation_view_iwlqdc on navaids_points.specialnavigationstation_ts.responsibleorganisation_id = navaids_points_authorityforspecialnavigationstation_view_iwlqdc.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_lrsvwz on navaids_points.specialnavigationstation_ts.position_id = geometry_elevatedpoint_view_lrsvwz.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_specialnavigationstationstatus_view_verdzz.*) as lat_availability
  from master_join master_join_xxvaeo
  join navaids_points.specialnavigationstationstatus_view navaids_points_specialnavigationstationstatus_view_verdzz on master_join_xxvaeo.target_id = navaids_points_specialnavigationstationstatus_view_verdzz.id
  where master_join_xxvaeo.source_id = navaids_points.specialnavigationstation_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_fjyhpy.*) AS annotation
  from master_join master_join_vvmbxf
  join notes.note_view notes_note_view_fjyhpy on master_join_vvmbxf.target_id = notes_note_view_fjyhpy.id
  where master_join_vvmbxf.source_id = navaids_points.specialnavigationstation_ts.id
) as lat_annotation on TRUE
where navaids_points.specialnavigationstation.feature_status = 'APPROVED'
  and navaids_points.specialnavigationstation_ts.feature_status = 'APPROVED'
order by specialnavigationstation.identifier, specialnavigationstation_ts.sequence_number, specialnavigationstation_ts.correction_number DESC;
create index on navaids_points.specialnavigationstation_view (id);
-- SpecialNavigationSystemTimeSliceType
-- ['navaids_points.authorityforspecialnavigationsystem_view', 'notes.note_view']
drop materialized view if exists navaids_points.specialnavigationsystem_view cascade;
create materialized view navaids_points.specialnavigationsystem_view as
select distinct on (specialnavigationsystem.identifier,specialnavigationsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.specialnavigationsystem.id,
    navaids_points.specialnavigationsystem_ts.id as ts_id,
    navaids_points.specialnavigationsystem_tsp.id as tsp_id,
    navaids_points.specialnavigationsystem.identifier,
    navaids_points.specialnavigationsystem_ts.interpretation,
    navaids_points.specialnavigationsystem_ts.sequence_number,
    navaids_points.specialnavigationsystem_ts.correction_number,
    navaids_points.specialnavigationsystem_ts.valid_time_begin,
    navaids_points.specialnavigationsystem_ts.valid_time_end,
    navaids_points.specialnavigationsystem_ts.feature_lifetime_begin,
    navaids_points.specialnavigationsystem_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.specialnavigationsystem_ts.type_value as varchar), '(' || navaids_points.specialnavigationsystem_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.specialnavigationsystem_ts.designator_value as varchar), '(' || navaids_points.specialnavigationsystem_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.specialnavigationsystem_ts.name_value as varchar), '(' || navaids_points.specialnavigationsystem_ts.name_nilreason || ')') as name,
    to_jsonb(navaids_points_authorityforspecialnavigationsystem_view_pjdxoq.*) AS responsibleorganisation,
    lat_annotation.annotation as annotation
from navaids_points.specialnavigationsystem 
inner join master_join mj2 on navaids_points.specialnavigationsystem.id = mj2.source_id
inner join navaids_points.specialnavigationsystem_tsp on mj2.target_id = navaids_points.specialnavigationsystem_tsp.id
inner join navaids_points.specialnavigationsystem_ts on navaids_points.specialnavigationsystem_tsp.specialnavigationsystemtimeslice_id = navaids_points.specialnavigationsystem_ts.id
left join navaids_points.authorityforspecialnavigationsystem_view navaids_points_authorityforspecialnavigationsystem_view_pjdxoq on navaids_points.specialnavigationsystem_ts.responsibleorganisation_id = navaids_points_authorityforspecialnavigationsystem_view_pjdxoq.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_vmfrxl.*) AS annotation
  from master_join master_join_xicunt
  join notes.note_view notes_note_view_vmfrxl on master_join_xicunt.target_id = notes_note_view_vmfrxl.id
  where master_join_xicunt.source_id = navaids_points.specialnavigationsystem_ts.id
) as lat_annotation on TRUE
where navaids_points.specialnavigationsystem.feature_status = 'APPROVED'
  and navaids_points.specialnavigationsystem_ts.feature_status = 'APPROVED'
order by specialnavigationsystem.identifier, specialnavigationsystem_ts.sequence_number, specialnavigationsystem_ts.correction_number DESC;
create index on navaids_points.specialnavigationsystem_view (id);
-- StandardInstrumentArrivalTimeSliceType
-- ['notes.note_view', 'procedure.proceduretransition_view', 'shared.aircraftcharacteristic_view', 'procedure.procedureavailability_view', 'procedure.landingtakeoffareacollection_view']
drop materialized view if exists procedure.standardinstrumentarrival_view cascade;
create materialized view procedure.standardinstrumentarrival_view as
select distinct on (standardinstrumentarrival.identifier,standardinstrumentarrival_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.standardinstrumentarrival.id,
    procedure.standardinstrumentarrival_ts.id as ts_id,
    procedure.standardinstrumentarrival_tsp.id as tsp_id,
    procedure.standardinstrumentarrival.identifier,
    procedure.standardinstrumentarrival_ts.interpretation,
    procedure.standardinstrumentarrival_ts.sequence_number,
    procedure.standardinstrumentarrival_ts.correction_number,
    procedure.standardinstrumentarrival_ts.valid_time_begin,
    procedure.standardinstrumentarrival_ts.valid_time_end,
    procedure.standardinstrumentarrival_ts.feature_lifetime_begin,
    procedure.standardinstrumentarrival_ts.feature_lifetime_end,
    coalesce(cast(procedure.standardinstrumentarrival_ts.communicationfailureinstruction_value as varchar), '(' || procedure.standardinstrumentarrival_ts.communicationfailureinstruction_nilreason || ')') as communicationfailureinstruction,
    coalesce(cast(procedure.standardinstrumentarrival_ts.instruction_value as varchar), '(' || procedure.standardinstrumentarrival_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.standardinstrumentarrival_ts.designcriteria_value as varchar), '(' || procedure.standardinstrumentarrival_ts.designcriteria_nilreason || ')') as designcriteria,
    coalesce(cast(procedure.standardinstrumentarrival_ts.codingstandard_value as varchar), '(' || procedure.standardinstrumentarrival_ts.codingstandard_nilreason || ')') as codingstandard,
    coalesce(cast(procedure.standardinstrumentarrival_ts.flightchecked_value as varchar), '(' || procedure.standardinstrumentarrival_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(procedure.standardinstrumentarrival_ts.name_value as varchar), '(' || procedure.standardinstrumentarrival_ts.name_nilreason || ')') as name,
    coalesce(cast(procedure.standardinstrumentarrival_ts.rnav_value as varchar), '(' || procedure.standardinstrumentarrival_ts.rnav_nilreason || ')') as rnav,
    coalesce(cast(procedure.standardinstrumentarrival_ts.designator_value as varchar), '(' || procedure.standardinstrumentarrival_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points_navaid_pt_egikts.title as varchar), '(' || navaids_points_navaid_pt_egikts.nilreason[1] || ')') AS guidancefacilitynavaid,
    navaids_points_navaid_pt_egikts.href AS guidancefacilitynavaid_href,
    coalesce(cast(navaids_points_specialnavigationsystem_pt_micxnu.title as varchar), '(' || navaids_points_specialnavigationsystem_pt_micxnu.nilreason[1] || ')') AS guidancefacilityspecialnavigationsystem,
    navaids_points_specialnavigationsystem_pt_micxnu.href AS guidancefacilityspecialnavigationsystem_href,
    coalesce(cast(surveillance_radarsystem_pt_nttoxb.title as varchar), '(' || surveillance_radarsystem_pt_nttoxb.nilreason[1] || ')') AS guidancefacilityradar,
    surveillance_radarsystem_pt_nttoxb.href AS guidancefacilityradar_href,
    coalesce(cast(procedure_safealtitudearea_pt_avgbry.title as varchar), '(' || procedure_safealtitudearea_pt_avgbry.nilreason[1] || ')') AS safealtitude,
    procedure_safealtitudearea_pt_avgbry.href AS safealtitude_href,
    to_jsonb(procedure_landingtakeoffareacollection_view_xepztp.*) AS arrival,
    lat_availability.lat_availability as availability,
    lat_airportheliport.lat_airportheliport as airportheliport,
    lat_aircraftcharacteristic.lat_aircraftcharacteristic as aircraftcharacteristic,
    lat_flighttransition.lat_flighttransition as flighttransition,
    lat_annotation.annotation as annotation
from procedure.standardinstrumentarrival 
inner join master_join mj2 on procedure.standardinstrumentarrival.id = mj2.source_id
inner join procedure.standardinstrumentarrival_tsp on mj2.target_id = procedure.standardinstrumentarrival_tsp.id
inner join procedure.standardinstrumentarrival_ts on procedure.standardinstrumentarrival_tsp.standardinstrumentarrivaltimeslice_id = procedure.standardinstrumentarrival_ts.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_egikts on procedure.standardinstrumentarrival_ts.guidancefacility_navaid_id = navaids_points_navaid_pt_egikts.id
left join navaids_points.specialnavigationsystem_pt navaids_points_specialnavigationsystem_pt_micxnu on procedure.standardinstrumentarrival_ts.guidancefacility_specialnavigationsystem_id = navaids_points_specialnavigationsystem_pt_micxnu.id
left join surveillance.radarsystem_pt surveillance_radarsystem_pt_nttoxb on procedure.standardinstrumentarrival_ts.guidancefacility_radar_id = surveillance_radarsystem_pt_nttoxb.id
left join procedure.safealtitudearea_pt procedure_safealtitudearea_pt_avgbry on procedure.standardinstrumentarrival_ts.safealtitude_id = procedure_safealtitudearea_pt_avgbry.id
left join procedure.landingtakeoffareacollection_view procedure_landingtakeoffareacollection_view_xepztp on procedure.standardinstrumentarrival_ts.arrival_id = procedure_landingtakeoffareacollection_view_xepztp.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_procedureavailability_view_jidngq.*) as lat_availability
  from master_join master_join_cjvudb
  join procedure.procedureavailability_view procedure_procedureavailability_view_jidngq on master_join_cjvudb.target_id = procedure_procedureavailability_view_jidngq.id
  where master_join_cjvudb.source_id = procedure.standardinstrumentarrival_ts.id
) as lat_availability on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_rhvjtd.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_rhvjtd.title AS varchar), '(' || airport_heliport_airportheliport_pt_rhvjtd.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_rhvjtd.href
  )) as lat_airportheliport  from master_join master_join_ettgvk
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_rhvjtd on master_join_ettgvk.target_id = airport_heliport_airportheliport_pt_rhvjtd.id
  where master_join_ettgvk.source_id = procedure.standardinstrumentarrival_ts.id
) as lat_airportheliport on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_julimn.*) as lat_aircraftcharacteristic
  from master_join master_join_amijwi
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_julimn on master_join_amijwi.target_id = shared_aircraftcharacteristic_view_julimn.id
  where master_join_amijwi.source_id = procedure.standardinstrumentarrival_ts.id
) as lat_aircraftcharacteristic on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_proceduretransition_view_ozzmrh.*) as lat_flighttransition
  from master_join master_join_wrhzhg
  join procedure.proceduretransition_view procedure_proceduretransition_view_ozzmrh on master_join_wrhzhg.target_id = procedure_proceduretransition_view_ozzmrh.id
  where master_join_wrhzhg.source_id = procedure.standardinstrumentarrival_ts.id
) as lat_flighttransition on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wmoqin.*) AS annotation
  from master_join master_join_bawszy
  join notes.note_view notes_note_view_wmoqin on master_join_bawszy.target_id = notes_note_view_wmoqin.id
  where master_join_bawszy.source_id = procedure.standardinstrumentarrival_ts.id
) as lat_annotation on TRUE
where procedure.standardinstrumentarrival.feature_status = 'APPROVED'
  and procedure.standardinstrumentarrival_ts.feature_status = 'APPROVED'
order by standardinstrumentarrival.identifier, standardinstrumentarrival_ts.sequence_number, standardinstrumentarrival_ts.correction_number DESC;
create index on procedure.standardinstrumentarrival_view (id);
-- StandardInstrumentDepartureTimeSliceType
-- ['notes.note_view', 'procedure.proceduretransition_view', 'shared.aircraftcharacteristic_view', 'procedure.procedureavailability_view', 'procedure.landingtakeoffareacollection_view']
drop materialized view if exists procedure.standardinstrumentdeparture_view cascade;
create materialized view procedure.standardinstrumentdeparture_view as
select distinct on (standardinstrumentdeparture.identifier,standardinstrumentdeparture_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.standardinstrumentdeparture.id,
    procedure.standardinstrumentdeparture_ts.id as ts_id,
    procedure.standardinstrumentdeparture_tsp.id as tsp_id,
    procedure.standardinstrumentdeparture.identifier,
    procedure.standardinstrumentdeparture_ts.interpretation,
    procedure.standardinstrumentdeparture_ts.sequence_number,
    procedure.standardinstrumentdeparture_ts.correction_number,
    procedure.standardinstrumentdeparture_ts.valid_time_begin,
    procedure.standardinstrumentdeparture_ts.valid_time_end,
    procedure.standardinstrumentdeparture_ts.feature_lifetime_begin,
    procedure.standardinstrumentdeparture_ts.feature_lifetime_end,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.communicationfailureinstruction_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.communicationfailureinstruction_nilreason || ')') as communicationfailureinstruction,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.instruction_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.designcriteria_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.designcriteria_nilreason || ')') as designcriteria,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.codingstandard_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.codingstandard_nilreason || ')') as codingstandard,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.flightchecked_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.name_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.name_nilreason || ')') as name,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.rnav_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.rnav_nilreason || ')') as rnav,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.designator_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.designator_nilreason || ')') as designator,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.contingencyroute_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.contingencyroute_nilreason || ')') as contingencyroute,
    coalesce(cast(navaids_points_navaid_pt_bbuicp.title as varchar), '(' || navaids_points_navaid_pt_bbuicp.nilreason[1] || ')') AS guidancefacilitynavaid,
    navaids_points_navaid_pt_bbuicp.href AS guidancefacilitynavaid_href,
    coalesce(cast(navaids_points_specialnavigationsystem_pt_wasqws.title as varchar), '(' || navaids_points_specialnavigationsystem_pt_wasqws.nilreason[1] || ')') AS guidancefacilityspecialnavigationsystem,
    navaids_points_specialnavigationsystem_pt_wasqws.href AS guidancefacilityspecialnavigationsystem_href,
    coalesce(cast(surveillance_radarsystem_pt_hyqsiz.title as varchar), '(' || surveillance_radarsystem_pt_hyqsiz.nilreason[1] || ')') AS guidancefacilityradar,
    surveillance_radarsystem_pt_hyqsiz.href AS guidancefacilityradar_href,
    coalesce(cast(procedure_safealtitudearea_pt_lfafob.title as varchar), '(' || procedure_safealtitudearea_pt_lfafob.nilreason[1] || ')') AS safealtitude,
    procedure_safealtitudearea_pt_lfafob.href AS safealtitude_href,
    to_jsonb(procedure_landingtakeoffareacollection_view_nsshrt.*) AS takeoff,
    lat_availability.lat_availability as availability,
    lat_airportheliport.lat_airportheliport as airportheliport,
    lat_aircraftcharacteristic.lat_aircraftcharacteristic as aircraftcharacteristic,
    lat_flighttransition.lat_flighttransition as flighttransition,
    lat_annotation.annotation as annotation
from procedure.standardinstrumentdeparture 
inner join master_join mj2 on procedure.standardinstrumentdeparture.id = mj2.source_id
inner join procedure.standardinstrumentdeparture_tsp on mj2.target_id = procedure.standardinstrumentdeparture_tsp.id
inner join procedure.standardinstrumentdeparture_ts on procedure.standardinstrumentdeparture_tsp.standardinstrumentdeparturetimeslice_id = procedure.standardinstrumentdeparture_ts.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_bbuicp on procedure.standardinstrumentdeparture_ts.guidancefacility_navaid_id = navaids_points_navaid_pt_bbuicp.id
left join navaids_points.specialnavigationsystem_pt navaids_points_specialnavigationsystem_pt_wasqws on procedure.standardinstrumentdeparture_ts.guidancefacility_specialnavigationsystem_id = navaids_points_specialnavigationsystem_pt_wasqws.id
left join surveillance.radarsystem_pt surveillance_radarsystem_pt_hyqsiz on procedure.standardinstrumentdeparture_ts.guidancefacility_radar_id = surveillance_radarsystem_pt_hyqsiz.id
left join procedure.safealtitudearea_pt procedure_safealtitudearea_pt_lfafob on procedure.standardinstrumentdeparture_ts.safealtitude_id = procedure_safealtitudearea_pt_lfafob.id
left join procedure.landingtakeoffareacollection_view procedure_landingtakeoffareacollection_view_nsshrt on procedure.standardinstrumentdeparture_ts.takeoff_id = procedure_landingtakeoffareacollection_view_nsshrt.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_procedureavailability_view_kxpeuu.*) as lat_availability
  from master_join master_join_xomwjo
  join procedure.procedureavailability_view procedure_procedureavailability_view_kxpeuu on master_join_xomwjo.target_id = procedure_procedureavailability_view_kxpeuu.id
  where master_join_xomwjo.source_id = procedure.standardinstrumentdeparture_ts.id
) as lat_availability on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_airportheliport_pt_uforih.id,
      'title', coalesce(cast(airport_heliport_airportheliport_pt_uforih.title AS varchar), '(' || airport_heliport_airportheliport_pt_uforih.nilreason[1] || ')'),
      'href', airport_heliport_airportheliport_pt_uforih.href
  )) as lat_airportheliport  from master_join master_join_rdqyst
  join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_uforih on master_join_rdqyst.target_id = airport_heliport_airportheliport_pt_uforih.id
  where master_join_rdqyst.source_id = procedure.standardinstrumentdeparture_ts.id
) as lat_airportheliport on TRUE
left join lateral(
  select jsonb_agg(DISTINCT shared_aircraftcharacteristic_view_xdgvfy.*) as lat_aircraftcharacteristic
  from master_join master_join_fcklmx
  join shared.aircraftcharacteristic_view shared_aircraftcharacteristic_view_xdgvfy on master_join_fcklmx.target_id = shared_aircraftcharacteristic_view_xdgvfy.id
  where master_join_fcklmx.source_id = procedure.standardinstrumentdeparture_ts.id
) as lat_aircraftcharacteristic on TRUE
left join lateral(
  select jsonb_agg(DISTINCT procedure_proceduretransition_view_rcyodx.*) as lat_flighttransition
  from master_join master_join_zlzfkp
  join procedure.proceduretransition_view procedure_proceduretransition_view_rcyodx on master_join_zlzfkp.target_id = procedure_proceduretransition_view_rcyodx.id
  where master_join_zlzfkp.source_id = procedure.standardinstrumentdeparture_ts.id
) as lat_flighttransition on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_iivflv.*) AS annotation
  from master_join master_join_eqwwax
  join notes.note_view notes_note_view_iivflv on master_join_eqwwax.target_id = notes_note_view_iivflv.id
  where master_join_eqwwax.source_id = procedure.standardinstrumentdeparture_ts.id
) as lat_annotation on TRUE
where procedure.standardinstrumentdeparture.feature_status = 'APPROVED'
  and procedure.standardinstrumentdeparture_ts.feature_status = 'APPROVED'
order by standardinstrumentdeparture.identifier, standardinstrumentdeparture_ts.sequence_number, standardinstrumentdeparture_ts.correction_number DESC;
create index on procedure.standardinstrumentdeparture_view (id);
-- StandardLevelColumnTimeSliceType
-- ['shared.standardlevel_view', 'notes.note_view']
drop materialized view if exists shared.standardlevelcolumn_view cascade;
create materialized view shared.standardlevelcolumn_view as
select distinct on (standardlevelcolumn.identifier,standardlevelcolumn_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    shared.standardlevelcolumn.id,
    shared.standardlevelcolumn_ts.id as ts_id,
    shared.standardlevelcolumn_tsp.id as tsp_id,
    shared.standardlevelcolumn.identifier,
    shared.standardlevelcolumn_ts.interpretation,
    shared.standardlevelcolumn_ts.sequence_number,
    shared.standardlevelcolumn_ts.correction_number,
    shared.standardlevelcolumn_ts.valid_time_begin,
    shared.standardlevelcolumn_ts.valid_time_end,
    shared.standardlevelcolumn_ts.feature_lifetime_begin,
    shared.standardlevelcolumn_ts.feature_lifetime_end,
    coalesce(cast(shared.standardlevelcolumn_ts.series_value as varchar), '(' || shared.standardlevelcolumn_ts.series_nilreason || ')') as series,
    coalesce(cast(shared.standardlevelcolumn_ts.separation_value as varchar), '(' || shared.standardlevelcolumn_ts.separation_nilreason || ')') as separation,
    coalesce(cast(shared_standardleveltable_pt_mxflou.title as varchar), '(' || shared_standardleveltable_pt_mxflou.nilreason[1] || ')') AS leveltable,
    shared_standardleveltable_pt_mxflou.href AS leveltable_href,
    lat_level.lat_level as level,
    lat_annotation.annotation as annotation
from shared.standardlevelcolumn 
inner join master_join mj2 on shared.standardlevelcolumn.id = mj2.source_id
inner join shared.standardlevelcolumn_tsp on mj2.target_id = shared.standardlevelcolumn_tsp.id
inner join shared.standardlevelcolumn_ts on shared.standardlevelcolumn_tsp.standardlevelcolumntimeslice_id = shared.standardlevelcolumn_ts.id
left join shared.standardleveltable_pt shared_standardleveltable_pt_mxflou on shared.standardlevelcolumn_ts.leveltable_id = shared_standardleveltable_pt_mxflou.id
left join lateral(
  select jsonb_agg(DISTINCT shared_standardlevel_view_zljwqj.*) as lat_level
  from master_join master_join_lnoatw
  join shared.standardlevel_view shared_standardlevel_view_zljwqj on master_join_lnoatw.target_id = shared_standardlevel_view_zljwqj.id
  where master_join_lnoatw.source_id = shared.standardlevelcolumn_ts.id
) as lat_level on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_gfvufq.*) AS annotation
  from master_join master_join_etcykf
  join notes.note_view notes_note_view_gfvufq on master_join_etcykf.target_id = notes_note_view_gfvufq.id
  where master_join_etcykf.source_id = shared.standardlevelcolumn_ts.id
) as lat_annotation on TRUE
where shared.standardlevelcolumn.feature_status = 'APPROVED'
  and shared.standardlevelcolumn_ts.feature_status = 'APPROVED'
order by standardlevelcolumn.identifier, standardlevelcolumn_ts.sequence_number, standardlevelcolumn_ts.correction_number DESC;
create index on shared.standardlevelcolumn_view (id);
-- StandardLevelSectorTimeSliceType
-- ['notes.note_view']
drop materialized view if exists shared.standardlevelsector_view cascade;
create materialized view shared.standardlevelsector_view as
select distinct on (standardlevelsector.identifier,standardlevelsector_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    shared.standardlevelsector.id,
    shared.standardlevelsector_ts.id as ts_id,
    shared.standardlevelsector_tsp.id as tsp_id,
    shared.standardlevelsector.identifier,
    shared.standardlevelsector_ts.interpretation,
    shared.standardlevelsector_ts.sequence_number,
    shared.standardlevelsector_ts.correction_number,
    shared.standardlevelsector_ts.valid_time_begin,
    shared.standardlevelsector_ts.valid_time_end,
    shared.standardlevelsector_ts.feature_lifetime_begin,
    shared.standardlevelsector_ts.feature_lifetime_end,
    coalesce(cast(shared.standardlevelsector_ts.flightrule_value as varchar), '(' || shared.standardlevelsector_ts.flightrule_nilreason || ')') as flightrule,
    coalesce(cast(shared.standardlevelsector_ts.fromtrack_value as varchar), '(' || shared.standardlevelsector_ts.fromtrack_nilreason || ')') as fromtrack,
    coalesce(cast(shared.standardlevelsector_ts.totrack_value as varchar), '(' || shared.standardlevelsector_ts.totrack_nilreason || ')') as totrack,
    coalesce(cast(shared.standardlevelsector_ts.angletype_value as varchar), '(' || shared.standardlevelsector_ts.angletype_nilreason || ')') as angletype,
    coalesce(cast(shared_standardlevelcolumn_pt_bqymcc.title as varchar), '(' || shared_standardlevelcolumn_pt_bqymcc.nilreason[1] || ')') AS applicablelevelcolumn,
    shared_standardlevelcolumn_pt_bqymcc.href AS applicablelevelcolumn_href,
    lat_applicableairspace.lat_applicableairspace as applicableairspace,
    lat_annotation.annotation as annotation
from shared.standardlevelsector 
inner join master_join mj2 on shared.standardlevelsector.id = mj2.source_id
inner join shared.standardlevelsector_tsp on mj2.target_id = shared.standardlevelsector_tsp.id
inner join shared.standardlevelsector_ts on shared.standardlevelsector_tsp.standardlevelsectortimeslice_id = shared.standardlevelsector_ts.id
left join shared.standardlevelcolumn_pt shared_standardlevelcolumn_pt_bqymcc on shared.standardlevelsector_ts.applicablelevelcolumn_id = shared_standardlevelcolumn_pt_bqymcc.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airspace_airspace_pt_ykyoza.id,
      'title', coalesce(cast(airspace_airspace_pt_ykyoza.title AS varchar), '(' || airspace_airspace_pt_ykyoza.nilreason[1] || ')'),
      'href', airspace_airspace_pt_ykyoza.href
  )) as lat_applicableairspace  from master_join master_join_vwgsnt
  join airspace.airspace_pt airspace_airspace_pt_ykyoza on master_join_vwgsnt.target_id = airspace_airspace_pt_ykyoza.id
  where master_join_vwgsnt.source_id = shared.standardlevelsector_ts.id
) as lat_applicableairspace on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wqoxki.*) AS annotation
  from master_join master_join_ythclv
  join notes.note_view notes_note_view_wqoxki on master_join_ythclv.target_id = notes_note_view_wqoxki.id
  where master_join_ythclv.source_id = shared.standardlevelsector_ts.id
) as lat_annotation on TRUE
where shared.standardlevelsector.feature_status = 'APPROVED'
  and shared.standardlevelsector_ts.feature_status = 'APPROVED'
order by standardlevelsector.identifier, standardlevelsector_ts.sequence_number, standardlevelsector_ts.correction_number DESC;
create index on shared.standardlevelsector_view (id);
-- StandardLevelTableTimeSliceType
-- ['notes.note_view']
drop materialized view if exists shared.standardleveltable_view cascade;
create materialized view shared.standardleveltable_view as
select distinct on (standardleveltable.identifier,standardleveltable_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    shared.standardleveltable.id,
    shared.standardleveltable_ts.id as ts_id,
    shared.standardleveltable_tsp.id as tsp_id,
    shared.standardleveltable.identifier,
    shared.standardleveltable_ts.interpretation,
    shared.standardleveltable_ts.sequence_number,
    shared.standardleveltable_ts.correction_number,
    shared.standardleveltable_ts.valid_time_begin,
    shared.standardleveltable_ts.valid_time_end,
    shared.standardleveltable_ts.feature_lifetime_begin,
    shared.standardleveltable_ts.feature_lifetime_end,
    coalesce(cast(shared.standardleveltable_ts.name_value as varchar), '(' || shared.standardleveltable_ts.name_nilreason || ')') as name,
    coalesce(cast(shared.standardleveltable_ts.standardicao_value as varchar), '(' || shared.standardleveltable_ts.standardicao_nilreason || ')') as standardicao,
    lat_annotation.annotation as annotation
from shared.standardleveltable 
inner join master_join mj2 on shared.standardleveltable.id = mj2.source_id
inner join shared.standardleveltable_tsp on mj2.target_id = shared.standardleveltable_tsp.id
inner join shared.standardleveltable_ts on shared.standardleveltable_tsp.standardleveltabletimeslice_id = shared.standardleveltable_ts.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_lkaxks.*) AS annotation
  from master_join master_join_iqkigc
  join notes.note_view notes_note_view_lkaxks on master_join_iqkigc.target_id = notes_note_view_lkaxks.id
  where master_join_iqkigc.source_id = shared.standardleveltable_ts.id
) as lat_annotation on TRUE
where shared.standardleveltable.feature_status = 'APPROVED'
  and shared.standardleveltable_ts.feature_status = 'APPROVED'
order by standardleveltable.identifier, standardleveltable_ts.sequence_number, standardleveltable_ts.correction_number DESC;
create index on shared.standardleveltable_view (id);
-- StandMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.standmarking_view cascade;
create materialized view airport_heliport.standmarking_view as
select distinct on (standmarking.identifier,standmarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.standmarking.id,
    airport_heliport.standmarking_ts.id as ts_id,
    airport_heliport.standmarking_tsp.id as tsp_id,
    airport_heliport.standmarking.identifier,
    airport_heliport.standmarking_ts.interpretation,
    airport_heliport.standmarking_ts.sequence_number,
    airport_heliport.standmarking_ts.correction_number,
    airport_heliport.standmarking_ts.valid_time_begin,
    airport_heliport.standmarking_ts.valid_time_end,
    airport_heliport.standmarking_ts.feature_lifetime_begin,
    airport_heliport.standmarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.standmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.standmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.standmarking_ts.condition_value as varchar), '(' || airport_heliport.standmarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport_aircraftstand_pt_unpwda.title as varchar), '(' || airport_heliport_aircraftstand_pt_unpwda.nilreason[1] || ')') AS markedstand,
    airport_heliport_aircraftstand_pt_unpwda.href AS markedstand_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.standmarking 
inner join master_join mj2 on airport_heliport.standmarking.id = mj2.source_id
inner join airport_heliport.standmarking_tsp on mj2.target_id = airport_heliport.standmarking_tsp.id
inner join airport_heliport.standmarking_ts on airport_heliport.standmarking_tsp.standmarkingtimeslice_id = airport_heliport.standmarking_ts.id
left join airport_heliport.aircraftstand_pt airport_heliport_aircraftstand_pt_unpwda on airport_heliport.standmarking_ts.markedstand_id = airport_heliport_aircraftstand_pt_unpwda.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_msnkmu.*) as lat_element
  from master_join master_join_ayfpwe
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_msnkmu on master_join_ayfpwe.target_id = airport_heliport_markingelement_view_msnkmu.id
  where master_join_ayfpwe.source_id = airport_heliport.standmarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_yfnwbx.*) AS annotation
  from master_join master_join_rbqrjh
  join notes.note_view notes_note_view_yfnwbx on master_join_rbqrjh.target_id = notes_note_view_yfnwbx.id
  where master_join_rbqrjh.source_id = airport_heliport.standmarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.standmarking.feature_status = 'APPROVED'
  and airport_heliport.standmarking_ts.feature_status = 'APPROVED'
order by standmarking.identifier, standmarking_ts.sequence_number, standmarking_ts.correction_number DESC;
create index on airport_heliport.standmarking_view (id);
-- SurveyControlPointTimeSliceType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists airport_heliport.surveycontrolpoint_view cascade;
create materialized view airport_heliport.surveycontrolpoint_view as
select distinct on (surveycontrolpoint.identifier,surveycontrolpoint_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.surveycontrolpoint.id,
    airport_heliport.surveycontrolpoint_ts.id as ts_id,
    airport_heliport.surveycontrolpoint_tsp.id as tsp_id,
    airport_heliport.surveycontrolpoint.identifier,
    airport_heliport.surveycontrolpoint_ts.interpretation,
    airport_heliport.surveycontrolpoint_ts.sequence_number,
    airport_heliport.surveycontrolpoint_ts.correction_number,
    airport_heliport.surveycontrolpoint_ts.valid_time_begin,
    airport_heliport.surveycontrolpoint_ts.valid_time_end,
    airport_heliport.surveycontrolpoint_ts.feature_lifetime_begin,
    airport_heliport.surveycontrolpoint_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.surveycontrolpoint_ts.designator_value as varchar), '(' || airport_heliport.surveycontrolpoint_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport_airportheliport_pt_odqjup.title as varchar), '(' || airport_heliport_airportheliport_pt_odqjup.nilreason[1] || ')') AS associatedairportheliport,
    airport_heliport_airportheliport_pt_odqjup.href AS associatedairportheliport_href,
    geometry_elevatedpoint_view_efaufu.geom AS location_geom,
    geometry_elevatedpoint_view_efaufu.longitude AS location_longitude,
    geometry_elevatedpoint_view_efaufu.latitude AS location_latitude,
    geometry_elevatedpoint_view_efaufu.elevation AS location_elevation,
    geometry_elevatedpoint_view_efaufu.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_efaufu.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_efaufu.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_efaufu.horizontalAccuracy AS location_horizontalaccuracy,
    lat_annotation.annotation as annotation
from airport_heliport.surveycontrolpoint 
inner join master_join mj2 on airport_heliport.surveycontrolpoint.id = mj2.source_id
inner join airport_heliport.surveycontrolpoint_tsp on mj2.target_id = airport_heliport.surveycontrolpoint_tsp.id
inner join airport_heliport.surveycontrolpoint_ts on airport_heliport.surveycontrolpoint_tsp.surveycontrolpointtimeslice_id = airport_heliport.surveycontrolpoint_ts.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_odqjup on airport_heliport.surveycontrolpoint_ts.associatedairportheliport_id = airport_heliport_airportheliport_pt_odqjup.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_efaufu on airport_heliport.surveycontrolpoint_ts.location_id = geometry_elevatedpoint_view_efaufu.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_wwhdar.*) AS annotation
  from master_join master_join_asefnz
  join notes.note_view notes_note_view_wwhdar on master_join_asefnz.target_id = notes_note_view_wwhdar.id
  where master_join_asefnz.source_id = airport_heliport.surveycontrolpoint_ts.id
) as lat_annotation on TRUE
where airport_heliport.surveycontrolpoint.feature_status = 'APPROVED'
  and airport_heliport.surveycontrolpoint_ts.feature_status = 'APPROVED'
order by surveycontrolpoint.identifier, surveycontrolpoint_ts.sequence_number, surveycontrolpoint_ts.correction_number DESC;
create index on airport_heliport.surveycontrolpoint_view (id);
-- TACANTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.tacan_view cascade;
create materialized view navaids_points.tacan_view as
select distinct on (tacan.identifier,tacan_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.tacan.id,
    navaids_points.tacan_ts.id as ts_id,
    navaids_points.tacan_tsp.id as tsp_id,
    navaids_points.tacan.identifier,
    navaids_points.tacan_ts.interpretation,
    navaids_points.tacan_ts.sequence_number,
    navaids_points.tacan_ts.correction_number,
    navaids_points.tacan_ts.valid_time_begin,
    navaids_points.tacan_ts.valid_time_end,
    navaids_points.tacan_ts.feature_lifetime_begin,
    navaids_points.tacan_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.tacan_ts.designator_value as varchar), '(' || navaids_points.tacan_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.tacan_ts.name_value as varchar), '(' || navaids_points.tacan_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.tacan_ts.emissionclass_value as varchar), '(' || navaids_points.tacan_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.tacan_ts.mobile_value as varchar), '(' || navaids_points.tacan_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.tacan_ts.magneticvariation_value as varchar), '(' || navaids_points.tacan_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.tacan_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.tacan_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.tacan_ts.datemagneticvariation_value as varchar), '(' || navaids_points.tacan_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.tacan_ts.flightchecked_value as varchar), '(' || navaids_points.tacan_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.tacan_ts.channel_value as varchar), '(' || navaids_points.tacan_ts.channel_nilreason || ')') as channel,
    coalesce(cast(navaids_points.tacan_ts.declination_value as varchar), '(' || navaids_points.tacan_ts.declination_nilreason || ')') as declination,
    geometry_elevatedpoint_view_inszds.geom AS location_geom,
    geometry_elevatedpoint_view_inszds.longitude AS location_longitude,
    geometry_elevatedpoint_view_inszds.latitude AS location_latitude,
    geometry_elevatedpoint_view_inszds.elevation AS location_elevation,
    geometry_elevatedpoint_view_inszds.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_inszds.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_inszds.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_inszds.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.tacan 
inner join master_join mj2 on navaids_points.tacan.id = mj2.source_id
inner join navaids_points.tacan_tsp on mj2.target_id = navaids_points.tacan_tsp.id
inner join navaids_points.tacan_ts on navaids_points.tacan_tsp.tacantimeslice_id = navaids_points.tacan_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_inszds on navaids_points.tacan_ts.location_id = geometry_elevatedpoint_view_inszds.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_uinabq.*) as lat_authority
  from master_join master_join_qzmliu
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_uinabq on master_join_qzmliu.target_id = navaids_points_authorityfornavaidequipment_view_uinabq.id
  where master_join_qzmliu.source_id = navaids_points.tacan_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_udpfyk.*) as lat_monitoring
  from master_join master_join_hypysj
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_udpfyk on master_join_hypysj.target_id = navaids_points_navaidequipmentmonitoring_view_udpfyk.id
  where master_join_hypysj.source_id = navaids_points.tacan_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_wgnvzt.*) as lat_availability
  from master_join master_join_sitzkt
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_wgnvzt on master_join_sitzkt.target_id = navaids_points_navaidoperationalstatus_view_wgnvzt.id
  where master_join_sitzkt.source_id = navaids_points.tacan_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_unbzhh.*) AS annotation
  from master_join master_join_stjvqk
  join notes.note_view notes_note_view_unbzhh on master_join_stjvqk.target_id = notes_note_view_unbzhh.id
  where master_join_stjvqk.source_id = navaids_points.tacan_ts.id
) as lat_annotation on TRUE
where navaids_points.tacan.feature_status = 'APPROVED'
  and navaids_points.tacan_ts.feature_status = 'APPROVED'
order by tacan.identifier, tacan_ts.sequence_number, tacan_ts.correction_number DESC;
create index on navaids_points.tacan_view (id);
-- TaxiHoldingPositionLightSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.taxiholdingpositionlightsystem_view cascade;
create materialized view airport_heliport.taxiholdingpositionlightsystem_view as
select distinct on (taxiholdingpositionlightsystem.identifier,taxiholdingpositionlightsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.taxiholdingpositionlightsystem.id,
    airport_heliport.taxiholdingpositionlightsystem_ts.id as ts_id,
    airport_heliport.taxiholdingpositionlightsystem_tsp.id as tsp_id,
    airport_heliport.taxiholdingpositionlightsystem.identifier,
    airport_heliport.taxiholdingpositionlightsystem_ts.interpretation,
    airport_heliport.taxiholdingpositionlightsystem_ts.sequence_number,
    airport_heliport.taxiholdingpositionlightsystem_ts.correction_number,
    airport_heliport.taxiholdingpositionlightsystem_ts.valid_time_begin,
    airport_heliport.taxiholdingpositionlightsystem_ts.valid_time_end,
    airport_heliport.taxiholdingpositionlightsystem_ts.feature_lifetime_begin,
    airport_heliport.taxiholdingpositionlightsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.colour_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.type_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport_taxiholdingposition_pt_fymzgt.title as varchar), '(' || airport_heliport_taxiholdingposition_pt_fymzgt.nilreason[1] || ')') AS taxiholding,
    airport_heliport_taxiholdingposition_pt_fymzgt.href AS taxiholding_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.taxiholdingpositionlightsystem 
inner join master_join mj2 on airport_heliport.taxiholdingpositionlightsystem.id = mj2.source_id
inner join airport_heliport.taxiholdingpositionlightsystem_tsp on mj2.target_id = airport_heliport.taxiholdingpositionlightsystem_tsp.id
inner join airport_heliport.taxiholdingpositionlightsystem_ts on airport_heliport.taxiholdingpositionlightsystem_tsp.taxiholdingpositionlightsystemtimeslice_id = airport_heliport.taxiholdingpositionlightsystem_ts.id
left join airport_heliport.taxiholdingposition_pt airport_heliport_taxiholdingposition_pt_fymzgt on airport_heliport.taxiholdingpositionlightsystem_ts.taxiholding_id = airport_heliport_taxiholdingposition_pt_fymzgt.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_izotdm.*) as lat_element
  from master_join master_join_qvbqbt
  join shared.lightelement_view shared_lightelement_view_izotdm on master_join_qvbqbt.target_id = shared_lightelement_view_izotdm.id
  where master_join_qvbqbt.source_id = airport_heliport.taxiholdingpositionlightsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_xyylep.*) as lat_availability
  from master_join master_join_qfsasw
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_xyylep on master_join_qfsasw.target_id = airport_heliport_groundlightingavailability_view_xyylep.id
  where master_join_qfsasw.source_id = airport_heliport.taxiholdingpositionlightsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jcrypt.*) AS annotation
  from master_join master_join_qwllas
  join notes.note_view notes_note_view_jcrypt on master_join_qwllas.target_id = notes_note_view_jcrypt.id
  where master_join_qwllas.source_id = airport_heliport.taxiholdingpositionlightsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.taxiholdingpositionlightsystem.feature_status = 'APPROVED'
  and airport_heliport.taxiholdingpositionlightsystem_ts.feature_status = 'APPROVED'
order by taxiholdingpositionlightsystem.identifier, taxiholdingpositionlightsystem_ts.sequence_number, taxiholdingpositionlightsystem_ts.correction_number DESC;
create index on airport_heliport.taxiholdingpositionlightsystem_view (id);
-- TaxiHoldingPositionMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.taxiholdingpositionmarking_view cascade;
create materialized view airport_heliport.taxiholdingpositionmarking_view as
select distinct on (taxiholdingpositionmarking.identifier,taxiholdingpositionmarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.taxiholdingpositionmarking.id,
    airport_heliport.taxiholdingpositionmarking_ts.id as ts_id,
    airport_heliport.taxiholdingpositionmarking_tsp.id as tsp_id,
    airport_heliport.taxiholdingpositionmarking.identifier,
    airport_heliport.taxiholdingpositionmarking_ts.interpretation,
    airport_heliport.taxiholdingpositionmarking_ts.sequence_number,
    airport_heliport.taxiholdingpositionmarking_ts.correction_number,
    airport_heliport.taxiholdingpositionmarking_ts.valid_time_begin,
    airport_heliport.taxiholdingpositionmarking_ts.valid_time_end,
    airport_heliport.taxiholdingpositionmarking_ts.feature_lifetime_begin,
    airport_heliport.taxiholdingpositionmarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.taxiholdingpositionmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.taxiholdingpositionmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.taxiholdingpositionmarking_ts.condition_value as varchar), '(' || airport_heliport.taxiholdingpositionmarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport_taxiholdingposition_pt_sgzvla.title as varchar), '(' || airport_heliport_taxiholdingposition_pt_sgzvla.nilreason[1] || ')') AS markedtaxihold,
    airport_heliport_taxiholdingposition_pt_sgzvla.href AS markedtaxihold_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.taxiholdingpositionmarking 
inner join master_join mj2 on airport_heliport.taxiholdingpositionmarking.id = mj2.source_id
inner join airport_heliport.taxiholdingpositionmarking_tsp on mj2.target_id = airport_heliport.taxiholdingpositionmarking_tsp.id
inner join airport_heliport.taxiholdingpositionmarking_ts on airport_heliport.taxiholdingpositionmarking_tsp.taxiholdingpositionmarkingtimeslice_id = airport_heliport.taxiholdingpositionmarking_ts.id
left join airport_heliport.taxiholdingposition_pt airport_heliport_taxiholdingposition_pt_sgzvla on airport_heliport.taxiholdingpositionmarking_ts.markedtaxihold_id = airport_heliport_taxiholdingposition_pt_sgzvla.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_ftrdtl.*) as lat_element
  from master_join master_join_azpfid
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_ftrdtl on master_join_azpfid.target_id = airport_heliport_markingelement_view_ftrdtl.id
  where master_join_azpfid.source_id = airport_heliport.taxiholdingpositionmarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xbuurt.*) AS annotation
  from master_join master_join_mhpbko
  join notes.note_view notes_note_view_xbuurt on master_join_mhpbko.target_id = notes_note_view_xbuurt.id
  where master_join_mhpbko.source_id = airport_heliport.taxiholdingpositionmarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.taxiholdingpositionmarking.feature_status = 'APPROVED'
  and airport_heliport.taxiholdingpositionmarking_ts.feature_status = 'APPROVED'
order by taxiholdingpositionmarking.identifier, taxiholdingpositionmarking_ts.sequence_number, taxiholdingpositionmarking_ts.correction_number DESC;
create index on airport_heliport.taxiholdingpositionmarking_view (id);
-- TaxiHoldingPositionTimeSliceType
-- ['notes.note_view', 'geometry.elevatedpoint_view']
drop materialized view if exists airport_heliport.taxiholdingposition_view cascade;
create materialized view airport_heliport.taxiholdingposition_view as
select distinct on (taxiholdingposition.identifier,taxiholdingposition_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.taxiholdingposition.id,
    airport_heliport.taxiholdingposition_ts.id as ts_id,
    airport_heliport.taxiholdingposition_tsp.id as tsp_id,
    airport_heliport.taxiholdingposition.identifier,
    airport_heliport.taxiholdingposition_ts.interpretation,
    airport_heliport.taxiholdingposition_ts.sequence_number,
    airport_heliport.taxiholdingposition_ts.correction_number,
    airport_heliport.taxiholdingposition_ts.valid_time_begin,
    airport_heliport.taxiholdingposition_ts.valid_time_end,
    airport_heliport.taxiholdingposition_ts.feature_lifetime_begin,
    airport_heliport.taxiholdingposition_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.taxiholdingposition_ts.landingcategory_value as varchar), '(' || airport_heliport.taxiholdingposition_ts.landingcategory_nilreason || ')') as landingcategory,
    coalesce(cast(airport_heliport.taxiholdingposition_ts.status_value as varchar), '(' || airport_heliport.taxiholdingposition_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport_guidanceline_pt_bqtavd.title as varchar), '(' || airport_heliport_guidanceline_pt_bqtavd.nilreason[1] || ')') AS associatedguidanceline,
    airport_heliport_guidanceline_pt_bqtavd.href AS associatedguidanceline_href,
    geometry_elevatedpoint_view_zyfhin.geom AS location_geom,
    geometry_elevatedpoint_view_zyfhin.longitude AS location_longitude,
    geometry_elevatedpoint_view_zyfhin.latitude AS location_latitude,
    geometry_elevatedpoint_view_zyfhin.elevation AS location_elevation,
    geometry_elevatedpoint_view_zyfhin.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_zyfhin.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_zyfhin.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_zyfhin.horizontalAccuracy AS location_horizontalaccuracy,
    lat_protectedrunway.lat_protectedrunway as protectedrunway,
    lat_annotation.annotation as annotation
from airport_heliport.taxiholdingposition 
inner join master_join mj2 on airport_heliport.taxiholdingposition.id = mj2.source_id
inner join airport_heliport.taxiholdingposition_tsp on mj2.target_id = airport_heliport.taxiholdingposition_tsp.id
inner join airport_heliport.taxiholdingposition_ts on airport_heliport.taxiholdingposition_tsp.taxiholdingpositiontimeslice_id = airport_heliport.taxiholdingposition_ts.id
left join airport_heliport.guidanceline_pt airport_heliport_guidanceline_pt_bqtavd on airport_heliport.taxiholdingposition_ts.associatedguidanceline_id = airport_heliport_guidanceline_pt_bqtavd.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_zyfhin on airport_heliport.taxiholdingposition_ts.location_id = geometry_elevatedpoint_view_zyfhin.id
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', airport_heliport_runway_pt_rmrnkp.id,
      'title', coalesce(cast(airport_heliport_runway_pt_rmrnkp.title AS varchar), '(' || airport_heliport_runway_pt_rmrnkp.nilreason[1] || ')'),
      'href', airport_heliport_runway_pt_rmrnkp.href
  )) as lat_protectedrunway  from master_join master_join_usegxj
  join airport_heliport.runway_pt airport_heliport_runway_pt_rmrnkp on master_join_usegxj.target_id = airport_heliport_runway_pt_rmrnkp.id
  where master_join_usegxj.source_id = airport_heliport.taxiholdingposition_ts.id
) as lat_protectedrunway on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_depjba.*) AS annotation
  from master_join master_join_zifxhv
  join notes.note_view notes_note_view_depjba on master_join_zifxhv.target_id = notes_note_view_depjba.id
  where master_join_zifxhv.source_id = airport_heliport.taxiholdingposition_ts.id
) as lat_annotation on TRUE
where airport_heliport.taxiholdingposition.feature_status = 'APPROVED'
  and airport_heliport.taxiholdingposition_ts.feature_status = 'APPROVED'
order by taxiholdingposition.identifier, taxiholdingposition_ts.sequence_number, taxiholdingposition_ts.correction_number DESC;
create index on airport_heliport.taxiholdingposition_view (id);
-- TaxiwayElementTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'geometry.elevatedsurface_view', 'airport_heliport.manoeuvringareaavailability_view', 'notes.note_view']
drop materialized view if exists airport_heliport.taxiwayelement_view cascade;
create materialized view airport_heliport.taxiwayelement_view as
select distinct on (taxiwayelement.identifier,taxiwayelement_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.taxiwayelement.id,
    airport_heliport.taxiwayelement_ts.id as ts_id,
    airport_heliport.taxiwayelement_tsp.id as tsp_id,
    airport_heliport.taxiwayelement.identifier,
    airport_heliport.taxiwayelement_ts.interpretation,
    airport_heliport.taxiwayelement_ts.sequence_number,
    airport_heliport.taxiwayelement_ts.correction_number,
    airport_heliport.taxiwayelement_ts.valid_time_begin,
    airport_heliport.taxiwayelement_ts.valid_time_end,
    airport_heliport.taxiwayelement_ts.feature_lifetime_begin,
    airport_heliport.taxiwayelement_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.taxiwayelement_ts.type_value as varchar), '(' || airport_heliport.taxiwayelement_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.taxiwayelement_ts.gradeseparation_value as varchar), '(' || airport_heliport.taxiwayelement_ts.gradeseparation_nilreason || ')') as gradeseparation,
    coalesce(cast(airport_heliport.taxiwayelement_ts.length_value as varchar) || ' ' || airport_heliport.taxiwayelement_ts.length_uom, '(' || airport_heliport.taxiwayelement_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.taxiwayelement_ts.width_value as varchar) || ' ' || airport_heliport.taxiwayelement_ts.width_uom, '(' || airport_heliport.taxiwayelement_ts.width_nilreason || ')') as width,
    to_jsonb(airport_heliport_surfacecharacteristics_view_lmdzwd.*) AS surfaceproperties,
    coalesce(cast(airport_heliport_taxiway_pt_jhpkml.title as varchar), '(' || airport_heliport_taxiway_pt_jhpkml.nilreason[1] || ')') AS associatedtaxiway,
    airport_heliport_taxiway_pt_jhpkml.href AS associatedtaxiway_href,
    geometry_elevatedsurface_view_kugkdi.geom AS extent_geom,
    geometry_elevatedsurface_view_kugkdi.elevation AS extent_elevation,
    geometry_elevatedsurface_view_kugkdi.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_kugkdi.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_kugkdi.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_kugkdi.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.taxiwayelement 
inner join master_join mj2 on airport_heliport.taxiwayelement.id = mj2.source_id
inner join airport_heliport.taxiwayelement_tsp on mj2.target_id = airport_heliport.taxiwayelement_tsp.id
inner join airport_heliport.taxiwayelement_ts on airport_heliport.taxiwayelement_tsp.taxiwayelementtimeslice_id = airport_heliport.taxiwayelement_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_lmdzwd on airport_heliport.taxiwayelement_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_lmdzwd.id
left join airport_heliport.taxiway_pt airport_heliport_taxiway_pt_jhpkml on airport_heliport.taxiwayelement_ts.associatedtaxiway_id = airport_heliport_taxiway_pt_jhpkml.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_kugkdi on airport_heliport.taxiwayelement_ts.extent_id = geometry_elevatedsurface_view_kugkdi.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hzjtcf.*) AS annotation
  from master_join master_join_aqyxbb
  join notes.note_view notes_note_view_hzjtcf on master_join_aqyxbb.target_id = notes_note_view_hzjtcf.id
  where master_join_aqyxbb.source_id = airport_heliport.taxiwayelement_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_manoeuvringareaavailability_view_wdidwm.*) as lat_availability
  from master_join master_join_zswqmp
  join airport_heliport.manoeuvringareaavailability_view airport_heliport_manoeuvringareaavailability_view_wdidwm on master_join_zswqmp.target_id = airport_heliport_manoeuvringareaavailability_view_wdidwm.id
  where master_join_zswqmp.source_id = airport_heliport.taxiwayelement_ts.id
) as lat_availability on TRUE
where airport_heliport.taxiwayelement.feature_status = 'APPROVED'
  and airport_heliport.taxiwayelement_ts.feature_status = 'APPROVED'
order by taxiwayelement.identifier, taxiwayelement_ts.sequence_number, taxiwayelement_ts.correction_number DESC;
create index on airport_heliport.taxiwayelement_view (id);
-- TaxiwayLightSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.taxiwaylightsystem_view cascade;
create materialized view airport_heliport.taxiwaylightsystem_view as
select distinct on (taxiwaylightsystem.identifier,taxiwaylightsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.taxiwaylightsystem.id,
    airport_heliport.taxiwaylightsystem_ts.id as ts_id,
    airport_heliport.taxiwaylightsystem_tsp.id as tsp_id,
    airport_heliport.taxiwaylightsystem.identifier,
    airport_heliport.taxiwaylightsystem_ts.interpretation,
    airport_heliport.taxiwaylightsystem_ts.sequence_number,
    airport_heliport.taxiwaylightsystem_ts.correction_number,
    airport_heliport.taxiwaylightsystem_ts.valid_time_begin,
    airport_heliport.taxiwaylightsystem_ts.valid_time_end,
    airport_heliport.taxiwaylightsystem_ts.feature_lifetime_begin,
    airport_heliport.taxiwaylightsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.colour_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.position_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.position_nilreason || ')') as position,
    coalesce(cast(airport_heliport_taxiway_pt_hjmctz.title as varchar), '(' || airport_heliport_taxiway_pt_hjmctz.nilreason[1] || ')') AS lightedtaxiway,
    airport_heliport_taxiway_pt_hjmctz.href AS lightedtaxiway_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.taxiwaylightsystem 
inner join master_join mj2 on airport_heliport.taxiwaylightsystem.id = mj2.source_id
inner join airport_heliport.taxiwaylightsystem_tsp on mj2.target_id = airport_heliport.taxiwaylightsystem_tsp.id
inner join airport_heliport.taxiwaylightsystem_ts on airport_heliport.taxiwaylightsystem_tsp.taxiwaylightsystemtimeslice_id = airport_heliport.taxiwaylightsystem_ts.id
left join airport_heliport.taxiway_pt airport_heliport_taxiway_pt_hjmctz on airport_heliport.taxiwaylightsystem_ts.lightedtaxiway_id = airport_heliport_taxiway_pt_hjmctz.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_bqhhqo.*) as lat_element
  from master_join master_join_gxqneh
  join shared.lightelement_view shared_lightelement_view_bqhhqo on master_join_gxqneh.target_id = shared_lightelement_view_bqhhqo.id
  where master_join_gxqneh.source_id = airport_heliport.taxiwaylightsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_poilyg.*) as lat_availability
  from master_join master_join_viwklm
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_poilyg on master_join_viwklm.target_id = airport_heliport_groundlightingavailability_view_poilyg.id
  where master_join_viwklm.source_id = airport_heliport.taxiwaylightsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_lryrak.*) AS annotation
  from master_join master_join_mepygq
  join notes.note_view notes_note_view_lryrak on master_join_mepygq.target_id = notes_note_view_lryrak.id
  where master_join_mepygq.source_id = airport_heliport.taxiwaylightsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.taxiwaylightsystem.feature_status = 'APPROVED'
  and airport_heliport.taxiwaylightsystem_ts.feature_status = 'APPROVED'
order by taxiwaylightsystem.identifier, taxiwaylightsystem_ts.sequence_number, taxiwaylightsystem_ts.correction_number DESC;
create index on airport_heliport.taxiwaylightsystem_view (id);
-- TaxiwayMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.taxiwaymarking_view cascade;
create materialized view airport_heliport.taxiwaymarking_view as
select distinct on (taxiwaymarking.identifier,taxiwaymarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.taxiwaymarking.id,
    airport_heliport.taxiwaymarking_ts.id as ts_id,
    airport_heliport.taxiwaymarking_tsp.id as tsp_id,
    airport_heliport.taxiwaymarking.identifier,
    airport_heliport.taxiwaymarking_ts.interpretation,
    airport_heliport.taxiwaymarking_ts.sequence_number,
    airport_heliport.taxiwaymarking_ts.correction_number,
    airport_heliport.taxiwaymarking_ts.valid_time_begin,
    airport_heliport.taxiwaymarking_ts.valid_time_end,
    airport_heliport.taxiwaymarking_ts.feature_lifetime_begin,
    airport_heliport.taxiwaymarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.taxiwaymarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.taxiwaymarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.taxiwaymarking_ts.condition_value as varchar), '(' || airport_heliport.taxiwaymarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.taxiwaymarking_ts.markinglocation_value as varchar), '(' || airport_heliport.taxiwaymarking_ts.markinglocation_nilreason || ')') as markinglocation,
    coalesce(cast(airport_heliport_taxiway_pt_dibyte.title as varchar), '(' || airport_heliport_taxiway_pt_dibyte.nilreason[1] || ')') AS markedtaxiway,
    airport_heliport_taxiway_pt_dibyte.href AS markedtaxiway_href,
    coalesce(cast(airport_heliport_taxiwayelement_pt_dkkrxs.title as varchar), '(' || airport_heliport_taxiwayelement_pt_dkkrxs.nilreason[1] || ')') AS markedelement,
    airport_heliport_taxiwayelement_pt_dkkrxs.href AS markedelement_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.taxiwaymarking 
inner join master_join mj2 on airport_heliport.taxiwaymarking.id = mj2.source_id
inner join airport_heliport.taxiwaymarking_tsp on mj2.target_id = airport_heliport.taxiwaymarking_tsp.id
inner join airport_heliport.taxiwaymarking_ts on airport_heliport.taxiwaymarking_tsp.taxiwaymarkingtimeslice_id = airport_heliport.taxiwaymarking_ts.id
left join airport_heliport.taxiway_pt airport_heliport_taxiway_pt_dibyte on airport_heliport.taxiwaymarking_ts.markedtaxiway_id = airport_heliport_taxiway_pt_dibyte.id
left join airport_heliport.taxiwayelement_pt airport_heliport_taxiwayelement_pt_dkkrxs on airport_heliport.taxiwaymarking_ts.markedelement_id = airport_heliport_taxiwayelement_pt_dkkrxs.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_muoyvv.*) as lat_element
  from master_join master_join_vztosr
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_muoyvv on master_join_vztosr.target_id = airport_heliport_markingelement_view_muoyvv.id
  where master_join_vztosr.source_id = airport_heliport.taxiwaymarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_dilrch.*) AS annotation
  from master_join master_join_uovmww
  join notes.note_view notes_note_view_dilrch on master_join_uovmww.target_id = notes_note_view_dilrch.id
  where master_join_uovmww.source_id = airport_heliport.taxiwaymarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.taxiwaymarking.feature_status = 'APPROVED'
  and airport_heliport.taxiwaymarking_ts.feature_status = 'APPROVED'
order by taxiwaymarking.identifier, taxiwaymarking_ts.sequence_number, taxiwaymarking_ts.correction_number DESC;
create index on airport_heliport.taxiwaymarking_view (id);
-- TaxiwayTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'airport_heliport.taxiwaycontamination_view', 'airport_heliport.manoeuvringareaavailability_view', 'notes.note_view']
drop materialized view if exists airport_heliport.taxiway_view cascade;
create materialized view airport_heliport.taxiway_view as
select distinct on (taxiway.identifier,taxiway_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.taxiway.id,
    airport_heliport.taxiway_ts.id as ts_id,
    airport_heliport.taxiway_tsp.id as tsp_id,
    airport_heliport.taxiway.identifier,
    airport_heliport.taxiway_ts.interpretation,
    airport_heliport.taxiway_ts.sequence_number,
    airport_heliport.taxiway_ts.correction_number,
    airport_heliport.taxiway_ts.valid_time_begin,
    airport_heliport.taxiway_ts.valid_time_end,
    airport_heliport.taxiway_ts.feature_lifetime_begin,
    airport_heliport.taxiway_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.taxiway_ts.designator_value as varchar), '(' || airport_heliport.taxiway_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.taxiway_ts.type_value as varchar), '(' || airport_heliport.taxiway_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.taxiway_ts.abandoned_value as varchar), '(' || airport_heliport.taxiway_ts.abandoned_nilreason || ')') as abandoned,
    coalesce(cast(airport_heliport.taxiway_ts.width_value as varchar) || ' ' || airport_heliport.taxiway_ts.width_uom, '(' || airport_heliport.taxiway_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.taxiway_ts.widthshoulder_value as varchar) || ' ' || airport_heliport.taxiway_ts.widthshoulder_uom, '(' || airport_heliport.taxiway_ts.widthshoulder_nilreason || ')') as widthshoulder,
    coalesce(cast(airport_heliport.taxiway_ts.length_value as varchar) || ' ' || airport_heliport.taxiway_ts.length_uom, '(' || airport_heliport.taxiway_ts.length_nilreason || ')') as length,
    to_jsonb(airport_heliport_surfacecharacteristics_view_ynsmsq.*) AS surfaceproperties,
    coalesce(cast(airport_heliport_airportheliport_pt_pwwxxi.title as varchar), '(' || airport_heliport_airportheliport_pt_pwwxxi.nilreason[1] || ')') AS associatedairportheliport,
    airport_heliport_airportheliport_pt_pwwxxi.href AS associatedairportheliport_href,
    lat_contaminant.lat_contaminant as contaminant,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.taxiway 
inner join master_join mj2 on airport_heliport.taxiway.id = mj2.source_id
inner join airport_heliport.taxiway_tsp on mj2.target_id = airport_heliport.taxiway_tsp.id
inner join airport_heliport.taxiway_ts on airport_heliport.taxiway_tsp.taxiwaytimeslice_id = airport_heliport.taxiway_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_ynsmsq on airport_heliport.taxiway_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_ynsmsq.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_pwwxxi on airport_heliport.taxiway_ts.associatedairportheliport_id = airport_heliport_airportheliport_pt_pwwxxi.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_taxiwaycontamination_view_vzkeow.*) as lat_contaminant
  from master_join master_join_kbblvs
  join airport_heliport.taxiwaycontamination_view airport_heliport_taxiwaycontamination_view_vzkeow on master_join_kbblvs.target_id = airport_heliport_taxiwaycontamination_view_vzkeow.id
  where master_join_kbblvs.source_id = airport_heliport.taxiway_ts.id
) as lat_contaminant on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_hnjidb.*) AS annotation
  from master_join master_join_gtxebq
  join notes.note_view notes_note_view_hnjidb on master_join_gtxebq.target_id = notes_note_view_hnjidb.id
  where master_join_gtxebq.source_id = airport_heliport.taxiway_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_manoeuvringareaavailability_view_wkruwt.*) as lat_availability
  from master_join master_join_xnnvov
  join airport_heliport.manoeuvringareaavailability_view airport_heliport_manoeuvringareaavailability_view_wkruwt on master_join_xnnvov.target_id = airport_heliport_manoeuvringareaavailability_view_wkruwt.id
  where master_join_xnnvov.source_id = airport_heliport.taxiway_ts.id
) as lat_availability on TRUE
where airport_heliport.taxiway.feature_status = 'APPROVED'
  and airport_heliport.taxiway_ts.feature_status = 'APPROVED'
order by taxiway.identifier, taxiway_ts.sequence_number, taxiway_ts.correction_number DESC;
create index on airport_heliport.taxiway_view (id);
-- TerminalArrivalAreaTimeSliceType
-- ['procedure.terminalarrivalareasector_view', 'geometry.surface_view', 'notes.note_view', 'geometry.point_view']
drop materialized view if exists procedure.terminalarrivalarea_view cascade;
create materialized view procedure.terminalarrivalarea_view as
select distinct on (terminalarrivalarea.identifier,terminalarrivalarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    procedure.terminalarrivalarea.id,
    procedure.terminalarrivalarea_ts.id as ts_id,
    procedure.terminalarrivalarea_tsp.id as tsp_id,
    procedure.terminalarrivalarea.identifier,
    procedure.terminalarrivalarea_ts.interpretation,
    procedure.terminalarrivalarea_ts.sequence_number,
    procedure.terminalarrivalarea_ts.correction_number,
    procedure.terminalarrivalarea_ts.valid_time_begin,
    procedure.terminalarrivalarea_ts.valid_time_end,
    procedure.terminalarrivalarea_ts.feature_lifetime_begin,
    procedure.terminalarrivalarea_ts.feature_lifetime_end,
    coalesce(cast(procedure.terminalarrivalarea_ts.arrivalareatype_value as varchar), '(' || procedure.terminalarrivalarea_ts.arrivalareatype_nilreason || ')') as arrivalareatype,
    coalesce(cast(procedure.terminalarrivalarea_ts.outerbufferwidth_value as varchar) || ' ' || procedure.terminalarrivalarea_ts.outerbufferwidth_uom, '(' || procedure.terminalarrivalarea_ts.outerbufferwidth_nilreason || ')') as outerbufferwidth,
    coalesce(cast(procedure.terminalarrivalarea_ts.lateralbufferwidth_value as varchar) || ' ' || procedure.terminalarrivalarea_ts.lateralbufferwidth_uom, '(' || procedure.terminalarrivalarea_ts.lateralbufferwidth_nilreason || ')') as lateralbufferwidth,
    coalesce(cast(navaids_points_designatedpoint_pt_wmyxyp.title as varchar), '(' || navaids_points_designatedpoint_pt_wmyxyp.nilreason[1] || ')') AS iffixdesignatedpoint,
    navaids_points_designatedpoint_pt_wmyxyp.href AS iffixdesignatedpoint_href,
    coalesce(cast(navaids_points_designatedpoint_pt_vuexpy.title as varchar), '(' || navaids_points_designatedpoint_pt_vuexpy.nilreason[1] || ')') AS iaffixdesignatedpoint,
    navaids_points_designatedpoint_pt_vuexpy.href AS iaffixdesignatedpoint_href,
    coalesce(cast(navaids_points_navaid_pt_roipfm.title as varchar), '(' || navaids_points_navaid_pt_roipfm.nilreason[1] || ')') AS ifnavaidsystem,
    navaids_points_navaid_pt_roipfm.href AS ifnavaidsystem_href,
    coalesce(cast(navaids_points_navaid_pt_nykvir.title as varchar), '(' || navaids_points_navaid_pt_nykvir.nilreason[1] || ')') AS iafnavaidsystem,
    navaids_points_navaid_pt_nykvir.href AS iafnavaidsystem_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_ynvbpo.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_ynvbpo.nilreason[1] || ')') AS ifaimingpoint,
    airport_heliport_touchdownliftoff_pt_ynvbpo.href AS ifaimingpoint_href,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_ealzby.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_ealzby.nilreason[1] || ')') AS iafaimingpoint,
    airport_heliport_touchdownliftoff_pt_ealzby.href AS iafaimingpoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_qnjzvv.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_qnjzvv.nilreason[1] || ')') AS ifrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_qnjzvv.href AS ifrunwaypoint_href,
    coalesce(cast(airport_heliport_runwaycentrelinepoint_pt_rrrsdb.title as varchar), '(' || airport_heliport_runwaycentrelinepoint_pt_rrrsdb.nilreason[1] || ')') AS iafrunwaypoint,
    airport_heliport_runwaycentrelinepoint_pt_rrrsdb.href AS iafrunwaypoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_czrlzj.title as varchar), '(' || airport_heliport_airportheliport_pt_czrlzj.nilreason[1] || ')') AS ifairportreferencepoint,
    airport_heliport_airportheliport_pt_czrlzj.href AS ifairportreferencepoint_href,
    coalesce(cast(airport_heliport_airportheliport_pt_bdfmgj.title as varchar), '(' || airport_heliport_airportheliport_pt_bdfmgj.nilreason[1] || ')') AS iafairportreferencepoint,
    airport_heliport_airportheliport_pt_bdfmgj.href AS iafairportreferencepoint_href,
    geometry_point_view_efuusa.geom AS ifposition_geom,
    geometry_point_view_efuusa.longitude AS ifposition_longitude,
    geometry_point_view_efuusa.latitude AS ifposition_latitude,
    geometry_point_view_efuusa.horizontalAccuracy AS ifposition_horizontalaccuracy,
    geometry_point_view_jwfrwu.geom AS iafposition_geom,
    geometry_point_view_jwfrwu.longitude AS iafposition_longitude,
    geometry_point_view_jwfrwu.latitude AS iafposition_latitude,
    geometry_point_view_jwfrwu.horizontalAccuracy AS iafposition_horizontalaccuracy,
    geometry_surface_view_lhyenh.geom AS buffer_geom,
    geometry_surface_view_lhyenh.horizontalAccuracy as buffer_horizontalaccuracy,
    coalesce(cast(procedure_instrumentapproachprocedure_pt_nmczlb.title as varchar), '(' || procedure_instrumentapproachprocedure_pt_nmczlb.nilreason[1] || ')') AS approachrnav,
    procedure_instrumentapproachprocedure_pt_nmczlb.href AS approachrnav_href,
    lat_sector.lat_sector as sector,
    lat_annotation.annotation as annotation
from procedure.terminalarrivalarea 
inner join master_join mj2 on procedure.terminalarrivalarea.id = mj2.source_id
inner join procedure.terminalarrivalarea_tsp on mj2.target_id = procedure.terminalarrivalarea_tsp.id
inner join procedure.terminalarrivalarea_ts on procedure.terminalarrivalarea_tsp.terminalarrivalareatimeslice_id = procedure.terminalarrivalarea_ts.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_wmyxyp on procedure.terminalarrivalarea_ts.if_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_wmyxyp.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_roipfm on procedure.terminalarrivalarea_ts.if_navaidsystem_id = navaids_points_navaid_pt_roipfm.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_ynvbpo on procedure.terminalarrivalarea_ts.if_aimingpoint_id = airport_heliport_touchdownliftoff_pt_ynvbpo.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_qnjzvv on procedure.terminalarrivalarea_ts.if_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_qnjzvv.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_czrlzj on procedure.terminalarrivalarea_ts.if_airportreferencepoint_id = airport_heliport_airportheliport_pt_czrlzj.id
left join geometry.point_view geometry_point_view_efuusa on procedure.terminalarrivalarea_ts.if_position_id = geometry_point_view_efuusa.id
left join navaids_points.designatedpoint_pt navaids_points_designatedpoint_pt_vuexpy on procedure.terminalarrivalarea_ts.iaf_fixdesignatedpoint_id = navaids_points_designatedpoint_pt_vuexpy.id
left join navaids_points.navaid_pt navaids_points_navaid_pt_nykvir on procedure.terminalarrivalarea_ts.iaf_navaidsystem_id = navaids_points_navaid_pt_nykvir.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_ealzby on procedure.terminalarrivalarea_ts.iaf_aimingpoint_id = airport_heliport_touchdownliftoff_pt_ealzby.id
left join airport_heliport.runwaycentrelinepoint_pt airport_heliport_runwaycentrelinepoint_pt_rrrsdb on procedure.terminalarrivalarea_ts.iaf_runwaypoint_id = airport_heliport_runwaycentrelinepoint_pt_rrrsdb.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_bdfmgj on procedure.terminalarrivalarea_ts.iaf_airportreferencepoint_id = airport_heliport_airportheliport_pt_bdfmgj.id
left join geometry.point_view geometry_point_view_jwfrwu on procedure.terminalarrivalarea_ts.iaf_position_id = geometry_point_view_jwfrwu.id
left join geometry.surface_view geometry_surface_view_lhyenh on procedure.terminalarrivalarea_ts.buffer_id = geometry_surface_view_lhyenh.id
left join procedure.instrumentapproachprocedure_pt procedure_instrumentapproachprocedure_pt_nmczlb on procedure.terminalarrivalarea_ts.approachrnav_id = procedure_instrumentapproachprocedure_pt_nmczlb.id
left join lateral(
  select jsonb_agg(DISTINCT procedure_terminalarrivalareasector_view_wufank.*) as lat_sector
  from master_join master_join_vykwkk
  join procedure.terminalarrivalareasector_view procedure_terminalarrivalareasector_view_wufank on master_join_vykwkk.target_id = procedure_terminalarrivalareasector_view_wufank.id
  where master_join_vykwkk.source_id = procedure.terminalarrivalarea_ts.id
) as lat_sector on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_yvfbip.*) AS annotation
  from master_join master_join_domryv
  join notes.note_view notes_note_view_yvfbip on master_join_domryv.target_id = notes_note_view_yvfbip.id
  where master_join_domryv.source_id = procedure.terminalarrivalarea_ts.id
) as lat_annotation on TRUE
where procedure.terminalarrivalarea.feature_status = 'APPROVED'
  and procedure.terminalarrivalarea_ts.feature_status = 'APPROVED'
order by terminalarrivalarea.identifier, terminalarrivalarea_ts.sequence_number, terminalarrivalarea_ts.correction_number DESC;
create index on procedure.terminalarrivalarea_view (id);
-- TouchDownLiftOffLightSystemTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.touchdownliftofflightsystem_view cascade;
create materialized view airport_heliport.touchdownliftofflightsystem_view as
select distinct on (touchdownliftofflightsystem.identifier,touchdownliftofflightsystem_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.touchdownliftofflightsystem.id,
    airport_heliport.touchdownliftofflightsystem_ts.id as ts_id,
    airport_heliport.touchdownliftofflightsystem_tsp.id as tsp_id,
    airport_heliport.touchdownliftofflightsystem.identifier,
    airport_heliport.touchdownliftofflightsystem_ts.interpretation,
    airport_heliport.touchdownliftofflightsystem_ts.sequence_number,
    airport_heliport.touchdownliftofflightsystem_ts.correction_number,
    airport_heliport.touchdownliftofflightsystem_ts.valid_time_begin,
    airport_heliport.touchdownliftofflightsystem_ts.valid_time_end,
    airport_heliport.touchdownliftofflightsystem_ts.feature_lifetime_begin,
    airport_heliport.touchdownliftofflightsystem_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.colour_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.position_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.position_nilreason || ')') as position,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_wuunla.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_wuunla.nilreason[1] || ')') AS lightedtouchdownliftoff,
    airport_heliport_touchdownliftoff_pt_wuunla.href AS lightedtouchdownliftoff_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.touchdownliftofflightsystem 
inner join master_join mj2 on airport_heliport.touchdownliftofflightsystem.id = mj2.source_id
inner join airport_heliport.touchdownliftofflightsystem_tsp on mj2.target_id = airport_heliport.touchdownliftofflightsystem_tsp.id
inner join airport_heliport.touchdownliftofflightsystem_ts on airport_heliport.touchdownliftofflightsystem_tsp.touchdownliftofflightsystemtimeslice_id = airport_heliport.touchdownliftofflightsystem_ts.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_wuunla on airport_heliport.touchdownliftofflightsystem_ts.lightedtouchdownliftoff_id = airport_heliport_touchdownliftoff_pt_wuunla.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_ritccz.*) as lat_element
  from master_join master_join_zgrqxn
  join shared.lightelement_view shared_lightelement_view_ritccz on master_join_zgrqxn.target_id = shared_lightelement_view_ritccz.id
  where master_join_zgrqxn.source_id = airport_heliport.touchdownliftofflightsystem_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_pwaujs.*) as lat_availability
  from master_join master_join_guxjba
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_pwaujs on master_join_guxjba.target_id = airport_heliport_groundlightingavailability_view_pwaujs.id
  where master_join_guxjba.source_id = airport_heliport.touchdownliftofflightsystem_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_mjucqy.*) AS annotation
  from master_join master_join_nvbvki
  join notes.note_view notes_note_view_mjucqy on master_join_nvbvki.target_id = notes_note_view_mjucqy.id
  where master_join_nvbvki.source_id = airport_heliport.touchdownliftofflightsystem_ts.id
) as lat_annotation on TRUE
where airport_heliport.touchdownliftofflightsystem.feature_status = 'APPROVED'
  and airport_heliport.touchdownliftofflightsystem_ts.feature_status = 'APPROVED'
order by touchdownliftofflightsystem.identifier, touchdownliftofflightsystem_ts.sequence_number, touchdownliftofflightsystem_ts.correction_number DESC;
create index on airport_heliport.touchdownliftofflightsystem_view (id);
-- TouchDownLiftOffMarkingTimeSliceType
-- ['airport_heliport.markingelement_view', 'notes.note_view']
drop materialized view if exists airport_heliport.touchdownliftoffmarking_view cascade;
create materialized view airport_heliport.touchdownliftoffmarking_view as
select distinct on (touchdownliftoffmarking.identifier,touchdownliftoffmarking_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.touchdownliftoffmarking.id,
    airport_heliport.touchdownliftoffmarking_ts.id as ts_id,
    airport_heliport.touchdownliftoffmarking_tsp.id as tsp_id,
    airport_heliport.touchdownliftoffmarking.identifier,
    airport_heliport.touchdownliftoffmarking_ts.interpretation,
    airport_heliport.touchdownliftoffmarking_ts.sequence_number,
    airport_heliport.touchdownliftoffmarking_ts.correction_number,
    airport_heliport.touchdownliftoffmarking_ts.valid_time_begin,
    airport_heliport.touchdownliftoffmarking_ts.valid_time_end,
    airport_heliport.touchdownliftoffmarking_ts.feature_lifetime_begin,
    airport_heliport.touchdownliftoffmarking_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.touchdownliftoffmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.touchdownliftoffmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.touchdownliftoffmarking_ts.condition_value as varchar), '(' || airport_heliport.touchdownliftoffmarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.touchdownliftoffmarking_ts.markinglocation_value as varchar), '(' || airport_heliport.touchdownliftoffmarking_ts.markinglocation_nilreason || ')') as markinglocation,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_aoajva.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_aoajva.nilreason[1] || ')') AS markedtouchdownliftoff,
    airport_heliport_touchdownliftoff_pt_aoajva.href AS markedtouchdownliftoff_href,
    lat_element.lat_element as element,
    lat_annotation.annotation as annotation
from airport_heliport.touchdownliftoffmarking 
inner join master_join mj2 on airport_heliport.touchdownliftoffmarking.id = mj2.source_id
inner join airport_heliport.touchdownliftoffmarking_tsp on mj2.target_id = airport_heliport.touchdownliftoffmarking_tsp.id
inner join airport_heliport.touchdownliftoffmarking_ts on airport_heliport.touchdownliftoffmarking_tsp.touchdownliftoffmarkingtimeslice_id = airport_heliport.touchdownliftoffmarking_ts.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_aoajva on airport_heliport.touchdownliftoffmarking_ts.markedtouchdownliftoff_id = airport_heliport_touchdownliftoff_pt_aoajva.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_markingelement_view_ncdzrp.*) as lat_element
  from master_join master_join_ewiseg
  join airport_heliport.markingelement_view airport_heliport_markingelement_view_ncdzrp on master_join_ewiseg.target_id = airport_heliport_markingelement_view_ncdzrp.id
  where master_join_ewiseg.source_id = airport_heliport.touchdownliftoffmarking_ts.id
) as lat_element on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_jzwqdg.*) AS annotation
  from master_join master_join_wusrvd
  join notes.note_view notes_note_view_jzwqdg on master_join_wusrvd.target_id = notes_note_view_jzwqdg.id
  where master_join_wusrvd.source_id = airport_heliport.touchdownliftoffmarking_ts.id
) as lat_annotation on TRUE
where airport_heliport.touchdownliftoffmarking.feature_status = 'APPROVED'
  and airport_heliport.touchdownliftoffmarking_ts.feature_status = 'APPROVED'
order by touchdownliftoffmarking.identifier, touchdownliftoffmarking_ts.sequence_number, touchdownliftoffmarking_ts.correction_number DESC;
create index on airport_heliport.touchdownliftoffmarking_view (id);
-- TouchDownLiftOffSafeAreaTimeSliceType
-- ['airport_heliport.surfacecharacteristics_view', 'geometry.elevatedsurface_view', 'notes.note_view']
drop materialized view if exists airport_heliport.touchdownliftoffsafearea_view cascade;
create materialized view airport_heliport.touchdownliftoffsafearea_view as
select distinct on (touchdownliftoffsafearea.identifier,touchdownliftoffsafearea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.touchdownliftoffsafearea.id,
    airport_heliport.touchdownliftoffsafearea_ts.id as ts_id,
    airport_heliport.touchdownliftoffsafearea_tsp.id as tsp_id,
    airport_heliport.touchdownliftoffsafearea.identifier,
    airport_heliport.touchdownliftoffsafearea_ts.interpretation,
    airport_heliport.touchdownliftoffsafearea_ts.sequence_number,
    airport_heliport.touchdownliftoffsafearea_ts.correction_number,
    airport_heliport.touchdownliftoffsafearea_ts.valid_time_begin,
    airport_heliport.touchdownliftoffsafearea_ts.valid_time_end,
    airport_heliport.touchdownliftoffsafearea_ts.feature_lifetime_begin,
    airport_heliport.touchdownliftoffsafearea_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.lighting_value as varchar), '(' || airport_heliport.touchdownliftoffsafearea_ts.lighting_nilreason || ')') as lighting,
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.obstaclefree_value as varchar), '(' || airport_heliport.touchdownliftoffsafearea_ts.obstaclefree_nilreason || ')') as obstaclefree,
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.width_value as varchar) || ' ' || airport_heliport.touchdownliftoffsafearea_ts.width_uom, '(' || airport_heliport.touchdownliftoffsafearea_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.length_value as varchar) || ' ' || airport_heliport.touchdownliftoffsafearea_ts.length_uom, '(' || airport_heliport.touchdownliftoffsafearea_ts.length_nilreason || ')') as length,
    to_jsonb(airport_heliport_surfacecharacteristics_view_apepee.*) AS surfaceproperties,
    geometry_elevatedsurface_view_abuzqc.geom AS extent_geom,
    geometry_elevatedsurface_view_abuzqc.elevation AS extent_elevation,
    geometry_elevatedsurface_view_abuzqc.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_abuzqc.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_abuzqc.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_abuzqc.horizontalAccuracy AS extent_horizontalaccuracy,
    coalesce(cast(airport_heliport_touchdownliftoff_pt_eykprv.title as varchar), '(' || airport_heliport_touchdownliftoff_pt_eykprv.nilreason[1] || ')') AS protectedtouchdownliftoff,
    airport_heliport_touchdownliftoff_pt_eykprv.href AS protectedtouchdownliftoff_href,
    lat_annotation.annotation as annotation
from airport_heliport.touchdownliftoffsafearea 
inner join master_join mj2 on airport_heliport.touchdownliftoffsafearea.id = mj2.source_id
inner join airport_heliport.touchdownliftoffsafearea_tsp on mj2.target_id = airport_heliport.touchdownliftoffsafearea_tsp.id
inner join airport_heliport.touchdownliftoffsafearea_ts on airport_heliport.touchdownliftoffsafearea_tsp.touchdownliftoffsafeareatimeslice_id = airport_heliport.touchdownliftoffsafearea_ts.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_apepee on airport_heliport.touchdownliftoffsafearea_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_apepee.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_abuzqc on airport_heliport.touchdownliftoffsafearea_ts.extent_id = geometry_elevatedsurface_view_abuzqc.id
left join airport_heliport.touchdownliftoff_pt airport_heliport_touchdownliftoff_pt_eykprv on airport_heliport.touchdownliftoffsafearea_ts.protectedtouchdownliftoff_id = airport_heliport_touchdownliftoff_pt_eykprv.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_qjwpif.*) AS annotation
  from master_join master_join_oespck
  join notes.note_view notes_note_view_qjwpif on master_join_oespck.target_id = notes_note_view_qjwpif.id
  where master_join_oespck.source_id = airport_heliport.touchdownliftoffsafearea_ts.id
) as lat_annotation on TRUE
where airport_heliport.touchdownliftoffsafearea.feature_status = 'APPROVED'
  and airport_heliport.touchdownliftoffsafearea_ts.feature_status = 'APPROVED'
order by touchdownliftoffsafearea.identifier, touchdownliftoffsafearea_ts.sequence_number, touchdownliftoffsafearea_ts.correction_number DESC;
create index on airport_heliport.touchdownliftoffsafearea_view (id);
-- TouchDownLiftOffTimeSliceType
-- ['airport_heliport.touchdownliftoffcontamination_view', 'geometry.elevatedsurface_view', 'geometry.elevatedpoint_view', 'notes.note_view', 'airport_heliport.surfacecharacteristics_view', 'airport_heliport.manoeuvringareaavailability_view']
drop materialized view if exists airport_heliport.touchdownliftoff_view cascade;
create materialized view airport_heliport.touchdownliftoff_view as
select distinct on (touchdownliftoff.identifier,touchdownliftoff_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.touchdownliftoff.id,
    airport_heliport.touchdownliftoff_ts.id as ts_id,
    airport_heliport.touchdownliftoff_tsp.id as tsp_id,
    airport_heliport.touchdownliftoff.identifier,
    airport_heliport.touchdownliftoff_ts.interpretation,
    airport_heliport.touchdownliftoff_ts.sequence_number,
    airport_heliport.touchdownliftoff_ts.correction_number,
    airport_heliport.touchdownliftoff_ts.valid_time_begin,
    airport_heliport.touchdownliftoff_ts.valid_time_end,
    airport_heliport.touchdownliftoff_ts.feature_lifetime_begin,
    airport_heliport.touchdownliftoff_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.designator_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.slope_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.slope_nilreason || ')') as slope,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.helicopterclass_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.helicopterclass_nilreason || ')') as helicopterclass,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.abandoned_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.abandoned_nilreason || ')') as abandoned,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.length_value as varchar) || ' ' || airport_heliport.touchdownliftoff_ts.length_uom, '(' || airport_heliport.touchdownliftoff_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.width_value as varchar) || ' ' || airport_heliport.touchdownliftoff_ts.width_uom, '(' || airport_heliport.touchdownliftoff_ts.width_nilreason || ')') as width,
    geometry_elevatedpoint_view_ewdopd.geom AS aimingpoint_geom,
    geometry_elevatedpoint_view_ewdopd.longitude AS aimingpoint_longitude,
    geometry_elevatedpoint_view_ewdopd.latitude AS aimingpoint_latitude,
    geometry_elevatedpoint_view_ewdopd.elevation AS aimingpoint_elevation,
    geometry_elevatedpoint_view_ewdopd.geoidUndulation AS aimingpoint_geoidundulation,
    geometry_elevatedpoint_view_ewdopd.verticalDatum AS aimingpoint_verticaldatum,
    geometry_elevatedpoint_view_ewdopd.verticalAccuracy AS aimingpoint_verticalaccuracy,
    geometry_elevatedpoint_view_ewdopd.horizontalAccuracy AS aimingpoint_horizontalaccuracy,
    geometry_elevatedsurface_view_yuofgn.geom AS extent_geom,
    geometry_elevatedsurface_view_yuofgn.elevation AS extent_elevation,
    geometry_elevatedsurface_view_yuofgn.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_yuofgn.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_yuofgn.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_yuofgn.horizontalAccuracy AS extent_horizontalaccuracy,
    to_jsonb(airport_heliport_surfacecharacteristics_view_axyimc.*) AS surfaceproperties,
    coalesce(cast(airport_heliport_airportheliport_pt_mltdfs.title as varchar), '(' || airport_heliport_airportheliport_pt_mltdfs.nilreason[1] || ')') AS associatedairportheliport,
    airport_heliport_airportheliport_pt_mltdfs.href AS associatedairportheliport_href,
    coalesce(cast(airport_heliport_runway_pt_yebvin.title as varchar), '(' || airport_heliport_runway_pt_yebvin.nilreason[1] || ')') AS approachtakeoffarea,
    airport_heliport_runway_pt_yebvin.href AS approachtakeoffarea_href,
    lat_contaminant.lat_contaminant as contaminant,
    lat_annotation.annotation as annotation,
    lat_availability.lat_availability as availability
from airport_heliport.touchdownliftoff 
inner join master_join mj2 on airport_heliport.touchdownliftoff.id = mj2.source_id
inner join airport_heliport.touchdownliftoff_tsp on mj2.target_id = airport_heliport.touchdownliftoff_tsp.id
inner join airport_heliport.touchdownliftoff_ts on airport_heliport.touchdownliftoff_tsp.touchdownliftofftimeslice_id = airport_heliport.touchdownliftoff_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_ewdopd on airport_heliport.touchdownliftoff_ts.aimingpoint_id = geometry_elevatedpoint_view_ewdopd.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_yuofgn on airport_heliport.touchdownliftoff_ts.extent_id = geometry_elevatedsurface_view_yuofgn.id
left join airport_heliport.surfacecharacteristics_view airport_heliport_surfacecharacteristics_view_axyimc on airport_heliport.touchdownliftoff_ts.surfaceproperties_id = airport_heliport_surfacecharacteristics_view_axyimc.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_mltdfs on airport_heliport.touchdownliftoff_ts.associatedairportheliport_id = airport_heliport_airportheliport_pt_mltdfs.id
left join airport_heliport.runway_pt airport_heliport_runway_pt_yebvin on airport_heliport.touchdownliftoff_ts.approachtakeoffarea_id = airport_heliport_runway_pt_yebvin.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_touchdownliftoffcontamination_view_jcmjhb.*) as lat_contaminant
  from master_join master_join_ecpvdz
  join airport_heliport.touchdownliftoffcontamination_view airport_heliport_touchdownliftoffcontamination_view_jcmjhb on master_join_ecpvdz.target_id = airport_heliport_touchdownliftoffcontamination_view_jcmjhb.id
  where master_join_ecpvdz.source_id = airport_heliport.touchdownliftoff_ts.id
) as lat_contaminant on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_pfbkwy.*) AS annotation
  from master_join master_join_ytfqgc
  join notes.note_view notes_note_view_pfbkwy on master_join_ytfqgc.target_id = notes_note_view_pfbkwy.id
  where master_join_ytfqgc.source_id = airport_heliport.touchdownliftoff_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_manoeuvringareaavailability_view_jtcewm.*) as lat_availability
  from master_join master_join_objaxh
  join airport_heliport.manoeuvringareaavailability_view airport_heliport_manoeuvringareaavailability_view_jtcewm on master_join_objaxh.target_id = airport_heliport_manoeuvringareaavailability_view_jtcewm.id
  where master_join_objaxh.source_id = airport_heliport.touchdownliftoff_ts.id
) as lat_availability on TRUE
where airport_heliport.touchdownliftoff.feature_status = 'APPROVED'
  and airport_heliport.touchdownliftoff_ts.feature_status = 'APPROVED'
order by touchdownliftoff.identifier, touchdownliftoff_ts.sequence_number, touchdownliftoff_ts.correction_number DESC;
create index on airport_heliport.touchdownliftoff_view (id);
-- UnitTimeSliceType
-- ['geometry.elevatedpoint_view', 'notes.note_view', 'shared.contactinformation_view', 'organisation.unitdependency_view', 'organisation.unitavailability_view']
drop materialized view if exists organisation.unit_view cascade;
create materialized view organisation.unit_view as
select distinct on (unit.identifier,unit_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    organisation.unit.id,
    organisation.unit_ts.id as ts_id,
    organisation.unit_tsp.id as tsp_id,
    organisation.unit.identifier,
    organisation.unit_ts.interpretation,
    organisation.unit_ts.sequence_number,
    organisation.unit_ts.correction_number,
    organisation.unit_ts.valid_time_begin,
    organisation.unit_ts.valid_time_end,
    organisation.unit_ts.feature_lifetime_begin,
    organisation.unit_ts.feature_lifetime_end,
    coalesce(cast(organisation.unit_ts.name_value as varchar), '(' || organisation.unit_ts.name_nilreason || ')') as name,
    coalesce(cast(organisation.unit_ts.type_value as varchar), '(' || organisation.unit_ts.type_nilreason || ')') as type,
    coalesce(cast(organisation.unit_ts.complianticao_value as varchar), '(' || organisation.unit_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(organisation.unit_ts.designator_value as varchar), '(' || organisation.unit_ts.designator_nilreason || ')') as designator,
    coalesce(cast(organisation.unit_ts.military_value as varchar), '(' || organisation.unit_ts.military_nilreason || ')') as military,
    geometry_elevatedpoint_view_pflrxi.geom AS position_geom,
    geometry_elevatedpoint_view_pflrxi.longitude AS position_longitude,
    geometry_elevatedpoint_view_pflrxi.latitude AS position_latitude,
    geometry_elevatedpoint_view_pflrxi.elevation AS position_elevation,
    geometry_elevatedpoint_view_pflrxi.geoidUndulation AS position_geoidundulation,
    geometry_elevatedpoint_view_pflrxi.verticalDatum AS position_verticaldatum,
    geometry_elevatedpoint_view_pflrxi.verticalAccuracy AS position_verticalaccuracy,
    geometry_elevatedpoint_view_pflrxi.horizontalAccuracy AS position_horizontalaccuracy,
    coalesce(cast(airport_heliport_airportheliport_pt_busjkf.title as varchar), '(' || airport_heliport_airportheliport_pt_busjkf.nilreason[1] || ')') AS airportlocation,
    airport_heliport_airportheliport_pt_busjkf.href AS airportlocation_href,
    coalesce(cast(organisation_organisationauthority_pt_vjydim.title as varchar), '(' || organisation_organisationauthority_pt_vjydim.nilreason[1] || ')') AS ownerorganisation,
    organisation_organisationauthority_pt_vjydim.href AS ownerorganisation_href,
    lat_relatedunit.lat_relatedunit as relatedunit,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from organisation.unit 
inner join master_join mj2 on organisation.unit.id = mj2.source_id
inner join organisation.unit_tsp on mj2.target_id = organisation.unit_tsp.id
inner join organisation.unit_ts on organisation.unit_tsp.unittimeslice_id = organisation.unit_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_pflrxi on organisation.unit_ts.position_id = geometry_elevatedpoint_view_pflrxi.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_busjkf on organisation.unit_ts.airportlocation_id = airport_heliport_airportheliport_pt_busjkf.id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_vjydim on organisation.unit_ts.ownerorganisation_id = organisation_organisationauthority_pt_vjydim.id
left join lateral(
  select
  from master_join master_join_lzqtnr
  join shared.contactinformation_view shared_contactinformation_view_yeugco on master_join_lzqtnr.target_id = shared_contactinformation_view_yeugco.id
  where master_join_lzqtnr.source_id = organisation.unit_ts.id
) as lat_contact on TRUE
left join lateral(
  select jsonb_agg(DISTINCT organisation_unitdependency_view_rxpbmu.*) as lat_relatedunit
  from master_join master_join_ivahth
  join organisation.unitdependency_view organisation_unitdependency_view_rxpbmu on master_join_ivahth.target_id = organisation_unitdependency_view_rxpbmu.id
  where master_join_ivahth.source_id = organisation.unit_ts.id
) as lat_relatedunit on TRUE
left join lateral(
  select jsonb_agg(DISTINCT organisation_unitavailability_view_lvpuxh.*) as lat_availability
  from master_join master_join_uofekq
  join organisation.unitavailability_view organisation_unitavailability_view_lvpuxh on master_join_uofekq.target_id = organisation_unitavailability_view_lvpuxh.id
  where master_join_uofekq.source_id = organisation.unit_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_nyohpt.*) AS annotation
  from master_join master_join_grvkwo
  join notes.note_view notes_note_view_nyohpt on master_join_grvkwo.target_id = notes_note_view_nyohpt.id
  where master_join_grvkwo.source_id = organisation.unit_ts.id
) as lat_annotation on TRUE
where organisation.unit.feature_status = 'APPROVED'
  and organisation.unit_ts.feature_status = 'APPROVED'
order by unit.identifier, unit_ts.sequence_number, unit_ts.correction_number DESC;
create index on organisation.unit_view (id);
-- UnplannedHoldingTimeSliceType
-- ['notes.note_view']
drop materialized view if exists holding.unplannedholding_view cascade;
create materialized view holding.unplannedholding_view as
select distinct on (unplannedholding.identifier,unplannedholding_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    holding.unplannedholding.id,
    holding.unplannedholding_ts.id as ts_id,
    holding.unplannedholding_tsp.id as tsp_id,
    holding.unplannedholding.identifier,
    holding.unplannedholding_ts.interpretation,
    holding.unplannedholding_ts.sequence_number,
    holding.unplannedholding_ts.correction_number,
    holding.unplannedholding_ts.valid_time_begin,
    holding.unplannedholding_ts.valid_time_end,
    holding.unplannedholding_ts.feature_lifetime_begin,
    holding.unplannedholding_ts.feature_lifetime_end,
    coalesce(cast(holding.unplannedholding_ts.unplannedholding_value as varchar), '(' || holding.unplannedholding_ts.unplannedholding_nilreason || ')') as unplannedholding,
    coalesce(cast(holding.unplannedholding_ts.altitudereference_value as varchar), '(' || holding.unplannedholding_ts.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(holding.unplannedholding_ts.controlledairspace_value as varchar), '(' || holding.unplannedholding_ts.controlledairspace_nilreason || ')') as controlledairspace,
    coalesce(cast(holding.unplannedholding_ts.authorizedaltitude_value as varchar) || ' ' || holding.unplannedholding_ts.authorizedaltitude_uom, '(' || holding.unplannedholding_ts.authorizedaltitude_nilreason || ')') as authorizedaltitude,
    lat_annotation.annotation as annotation
from holding.unplannedholding 
inner join master_join mj2 on holding.unplannedholding.id = mj2.source_id
inner join holding.unplannedholding_tsp on mj2.target_id = holding.unplannedholding_tsp.id
inner join holding.unplannedholding_ts on holding.unplannedholding_tsp.unplannedholdingtimeslice_id = holding.unplannedholding_ts.id
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_xtrmem.*) AS annotation
  from master_join master_join_ewqkjh
  join notes.note_view notes_note_view_xtrmem on master_join_ewqkjh.target_id = notes_note_view_xtrmem.id
  where master_join_ewqkjh.source_id = holding.unplannedholding_ts.id
) as lat_annotation on TRUE
where holding.unplannedholding.feature_status = 'APPROVED'
  and holding.unplannedholding_ts.feature_status = 'APPROVED'
order by unplannedholding.identifier, unplannedholding_ts.sequence_number, unplannedholding_ts.correction_number DESC;
create index on holding.unplannedholding_view (id);
-- VerticalStructureTimeSliceType
-- ['obstacles.verticalstructurepart_view', 'obstacles.verticalstructurelightingstatus_view', 'notes.note_view']
drop materialized view if exists obstacles.verticalstructure_view cascade;
create materialized view obstacles.verticalstructure_view as
select distinct on (verticalstructure.identifier,verticalstructure_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    obstacles.verticalstructure.id,
    obstacles.verticalstructure_ts.id as ts_id,
    obstacles.verticalstructure_tsp.id as tsp_id,
    obstacles.verticalstructure.identifier,
    obstacles.verticalstructure_ts.interpretation,
    obstacles.verticalstructure_ts.sequence_number,
    obstacles.verticalstructure_ts.correction_number,
    obstacles.verticalstructure_ts.valid_time_begin,
    obstacles.verticalstructure_ts.valid_time_end,
    obstacles.verticalstructure_ts.feature_lifetime_begin,
    obstacles.verticalstructure_ts.feature_lifetime_end,
    coalesce(cast(obstacles.verticalstructure_ts.name_value as varchar), '(' || obstacles.verticalstructure_ts.name_nilreason || ')') as name,
    coalesce(cast(obstacles.verticalstructure_ts.type_value as varchar), '(' || obstacles.verticalstructure_ts.type_nilreason || ')') as type,
    coalesce(cast(obstacles.verticalstructure_ts.lighted_value as varchar), '(' || obstacles.verticalstructure_ts.lighted_nilreason || ')') as lighted,
    coalesce(cast(obstacles.verticalstructure_ts.markingicaostandard_value as varchar), '(' || obstacles.verticalstructure_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(obstacles.verticalstructure_ts.group_value as varchar), '(' || obstacles.verticalstructure_ts.group_nilreason || ')') as group,
    coalesce(cast(obstacles.verticalstructure_ts.lightingicaostandard_value as varchar), '(' || obstacles.verticalstructure_ts.lightingicaostandard_nilreason || ')') as lightingicaostandard,
    coalesce(cast(obstacles.verticalstructure_ts.synchronisedlighting_value as varchar), '(' || obstacles.verticalstructure_ts.synchronisedlighting_nilreason || ')') as synchronisedlighting,
    coalesce(cast(obstacles.verticalstructure_ts.length_value as varchar) || ' ' || obstacles.verticalstructure_ts.length_uom, '(' || obstacles.verticalstructure_ts.length_nilreason || ')') as length,
    coalesce(cast(obstacles.verticalstructure_ts.width_value as varchar) || ' ' || obstacles.verticalstructure_ts.width_uom, '(' || obstacles.verticalstructure_ts.width_nilreason || ')') as width,
    coalesce(cast(obstacles.verticalstructure_ts.radius_value as varchar) || ' ' || obstacles.verticalstructure_ts.radius_uom, '(' || obstacles.verticalstructure_ts.radius_nilreason || ')') as radius,
    coalesce(cast(navaids_points_markerbeacon_pt_brnmbq.title as varchar), '(' || navaids_points_markerbeacon_pt_brnmbq.nilreason[1] || ')') AS marker,
    navaids_points_markerbeacon_pt_brnmbq.href AS marker_href,
    lat_part.lat_part as part,
    lat_hostedpassengerservice.lat_hostedpassengerservice as hostedpassengerservice,
    lat_hostedspecialnavstation.lat_hostedspecialnavstation as hostedspecialnavstation,
    lat_hostedunit.lat_hostedunit as hostedunit,
    lat_hostedorganisation.lat_hostedorganisation as hostedorganisation,
    lat_annotation.annotation as annotation,
    lat_lightingavailability.lat_lightingavailability as lightingavailability
from obstacles.verticalstructure 
inner join master_join mj2 on obstacles.verticalstructure.id = mj2.source_id
inner join obstacles.verticalstructure_tsp on mj2.target_id = obstacles.verticalstructure_tsp.id
inner join obstacles.verticalstructure_ts on obstacles.verticalstructure_tsp.verticalstructuretimeslice_id = obstacles.verticalstructure_ts.id
left join navaids_points.markerbeacon_pt navaids_points_markerbeacon_pt_brnmbq on obstacles.verticalstructure_ts.marker_id = navaids_points_markerbeacon_pt_brnmbq.id
left join lateral(
  select jsonb_agg(DISTINCT obstacles_verticalstructurepart_view_emoaqb.*) as lat_part
  from master_join master_join_opydnb
  join obstacles.verticalstructurepart_view obstacles_verticalstructurepart_view_emoaqb on master_join_opydnb.target_id = obstacles_verticalstructurepart_view_emoaqb.id
  where master_join_opydnb.source_id = obstacles.verticalstructure_ts.id
) as lat_part on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', service_passengerservice_pt_qfiefg.id,
      'title', coalesce(cast(service_passengerservice_pt_qfiefg.title AS varchar), '(' || service_passengerservice_pt_qfiefg.nilreason[1] || ')'),
      'href', service_passengerservice_pt_qfiefg.href
  )) as lat_hostedpassengerservice  from master_join master_join_awlafs
  join service.passengerservice_pt service_passengerservice_pt_qfiefg on master_join_awlafs.target_id = service_passengerservice_pt_qfiefg.id
  where master_join_awlafs.source_id = obstacles.verticalstructure_ts.id
) as lat_hostedpassengerservice on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', navaids_points_specialnavigationstation_pt_alqryv.id,
      'title', coalesce(cast(navaids_points_specialnavigationstation_pt_alqryv.title AS varchar), '(' || navaids_points_specialnavigationstation_pt_alqryv.nilreason[1] || ')'),
      'href', navaids_points_specialnavigationstation_pt_alqryv.href
  )) as lat_hostedspecialnavstation  from master_join master_join_jfaqjo
  join navaids_points.specialnavigationstation_pt navaids_points_specialnavigationstation_pt_alqryv on master_join_jfaqjo.target_id = navaids_points_specialnavigationstation_pt_alqryv.id
  where master_join_jfaqjo.source_id = obstacles.verticalstructure_ts.id
) as lat_hostedspecialnavstation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_unit_pt_rohagm.id,
      'title', coalesce(cast(organisation_unit_pt_rohagm.title AS varchar), '(' || organisation_unit_pt_rohagm.nilreason[1] || ')'),
      'href', organisation_unit_pt_rohagm.href
  )) as lat_hostedunit  from master_join master_join_xykgmc
  join organisation.unit_pt organisation_unit_pt_rohagm on master_join_xykgmc.target_id = organisation_unit_pt_rohagm.id
  where master_join_xykgmc.source_id = obstacles.verticalstructure_ts.id
) as lat_hostedunit on TRUE
left join lateral(
  select jsonb_agg(DISTINCT jsonb_build_object(
      'id', organisation_organisationauthority_pt_xdfocp.id,
      'title', coalesce(cast(organisation_organisationauthority_pt_xdfocp.title AS varchar), '(' || organisation_organisationauthority_pt_xdfocp.nilreason[1] || ')'),
      'href', organisation_organisationauthority_pt_xdfocp.href
  )) as lat_hostedorganisation  from master_join master_join_kzjhyl
  join organisation.organisationauthority_pt organisation_organisationauthority_pt_xdfocp on master_join_kzjhyl.target_id = organisation_organisationauthority_pt_xdfocp.id
  where master_join_kzjhyl.source_id = obstacles.verticalstructure_ts.id
) as lat_hostedorganisation on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_tgovor.*) AS annotation
  from master_join master_join_odksfq
  join notes.note_view notes_note_view_tgovor on master_join_odksfq.target_id = notes_note_view_tgovor.id
  where master_join_odksfq.source_id = obstacles.verticalstructure_ts.id
) as lat_annotation on TRUE
left join lateral(
  select jsonb_agg(DISTINCT obstacles_verticalstructurelightingstatus_view_yszatm.*) as lat_lightingavailability
  from master_join master_join_wtaxnr
  join obstacles.verticalstructurelightingstatus_view obstacles_verticalstructurelightingstatus_view_yszatm on master_join_wtaxnr.target_id = obstacles_verticalstructurelightingstatus_view_yszatm.id
  where master_join_wtaxnr.source_id = obstacles.verticalstructure_ts.id
) as lat_lightingavailability on TRUE
where obstacles.verticalstructure.feature_status = 'APPROVED'
  and obstacles.verticalstructure_ts.feature_status = 'APPROVED'
order by verticalstructure.identifier, verticalstructure_ts.sequence_number, verticalstructure_ts.correction_number DESC;
create index on obstacles.verticalstructure_view (id);
-- VisualGlideSlopeIndicatorTimeSliceType
-- ['airport_heliport.groundlightingavailability_view', 'notes.note_view', 'shared.lightelement_view']
drop materialized view if exists airport_heliport.visualglideslopeindicator_view cascade;
create materialized view airport_heliport.visualglideslopeindicator_view as
select distinct on (visualglideslopeindicator.identifier,visualglideslopeindicator_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.visualglideslopeindicator.id,
    airport_heliport.visualglideslopeindicator_ts.id as ts_id,
    airport_heliport.visualglideslopeindicator_tsp.id as tsp_id,
    airport_heliport.visualglideslopeindicator.identifier,
    airport_heliport.visualglideslopeindicator_ts.interpretation,
    airport_heliport.visualglideslopeindicator_ts.sequence_number,
    airport_heliport.visualglideslopeindicator_ts.correction_number,
    airport_heliport.visualglideslopeindicator_ts.valid_time_begin,
    airport_heliport.visualglideslopeindicator_ts.valid_time_end,
    airport_heliport.visualglideslopeindicator_ts.feature_lifetime_begin,
    airport_heliport.visualglideslopeindicator_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.emergencylighting_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.intensitylevel_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.colour_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.type_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.position_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.position_nilreason || ')') as position,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.numberbox_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.numberbox_nilreason || ')') as numberbox,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.portable_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.portable_nilreason || ')') as portable,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.slopeangle_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.slopeangle_nilreason || ')') as slopeangle,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_value as varchar) || ' ' || airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_uom, '(' || airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_nilreason || ')') as minimumeyeheightoverthreshold,
    coalesce(cast(airport_heliport_runwaydirection_pt_zbadpx.title as varchar), '(' || airport_heliport_runwaydirection_pt_zbadpx.nilreason[1] || ')') AS runwaydirection,
    airport_heliport_runwaydirection_pt_zbadpx.href AS runwaydirection_href,
    lat_element.lat_element as element,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from airport_heliport.visualglideslopeindicator 
inner join master_join mj2 on airport_heliport.visualglideslopeindicator.id = mj2.source_id
inner join airport_heliport.visualglideslopeindicator_tsp on mj2.target_id = airport_heliport.visualglideslopeindicator_tsp.id
inner join airport_heliport.visualglideslopeindicator_ts on airport_heliport.visualglideslopeindicator_tsp.visualglideslopeindicatortimeslice_id = airport_heliport.visualglideslopeindicator_ts.id
left join airport_heliport.runwaydirection_pt airport_heliport_runwaydirection_pt_zbadpx on airport_heliport.visualglideslopeindicator_ts.runwaydirection_id = airport_heliport_runwaydirection_pt_zbadpx.id
left join lateral(
  select jsonb_agg(DISTINCT shared_lightelement_view_zbcnlt.*) as lat_element
  from master_join master_join_weewty
  join shared.lightelement_view shared_lightelement_view_zbcnlt on master_join_weewty.target_id = shared_lightelement_view_zbcnlt.id
  where master_join_weewty.source_id = airport_heliport.visualglideslopeindicator_ts.id
) as lat_element on TRUE
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_groundlightingavailability_view_eopwzu.*) as lat_availability
  from master_join master_join_wyfovk
  join airport_heliport.groundlightingavailability_view airport_heliport_groundlightingavailability_view_eopwzu on master_join_wyfovk.target_id = airport_heliport_groundlightingavailability_view_eopwzu.id
  where master_join_wyfovk.source_id = airport_heliport.visualglideslopeindicator_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_bivbmr.*) AS annotation
  from master_join master_join_dwdity
  join notes.note_view notes_note_view_bivbmr on master_join_dwdity.target_id = notes_note_view_bivbmr.id
  where master_join_dwdity.source_id = airport_heliport.visualglideslopeindicator_ts.id
) as lat_annotation on TRUE
where airport_heliport.visualglideslopeindicator.feature_status = 'APPROVED'
  and airport_heliport.visualglideslopeindicator_ts.feature_status = 'APPROVED'
order by visualglideslopeindicator.identifier, visualglideslopeindicator_ts.sequence_number, visualglideslopeindicator_ts.correction_number DESC;
create index on airport_heliport.visualglideslopeindicator_view (id);
-- VORTimeSliceType
-- ['geometry.elevatedpoint_view', 'navaids_points.navaidequipmentmonitoring_view', 'notes.note_view', 'navaids_points.navaidoperationalstatus_view', 'navaids_points.authorityfornavaidequipment_view']
drop materialized view if exists navaids_points.vor_view cascade;
create materialized view navaids_points.vor_view as
select distinct on (vor.identifier,vor_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    navaids_points.vor.id,
    navaids_points.vor_ts.id as ts_id,
    navaids_points.vor_tsp.id as tsp_id,
    navaids_points.vor.identifier,
    navaids_points.vor_ts.interpretation,
    navaids_points.vor_ts.sequence_number,
    navaids_points.vor_ts.correction_number,
    navaids_points.vor_ts.valid_time_begin,
    navaids_points.vor_ts.valid_time_end,
    navaids_points.vor_ts.feature_lifetime_begin,
    navaids_points.vor_ts.feature_lifetime_end,
    coalesce(cast(navaids_points.vor_ts.designator_value as varchar), '(' || navaids_points.vor_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.vor_ts.name_value as varchar), '(' || navaids_points.vor_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.vor_ts.emissionclass_value as varchar), '(' || navaids_points.vor_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.vor_ts.mobile_value as varchar), '(' || navaids_points.vor_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.vor_ts.magneticvariation_value as varchar), '(' || navaids_points.vor_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.vor_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.vor_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.vor_ts.datemagneticvariation_value as varchar), '(' || navaids_points.vor_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.vor_ts.flightchecked_value as varchar), '(' || navaids_points.vor_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.vor_ts.type_value as varchar), '(' || navaids_points.vor_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.vor_ts.zerobearingdirection_value as varchar), '(' || navaids_points.vor_ts.zerobearingdirection_nilreason || ')') as zerobearingdirection,
    coalesce(cast(navaids_points.vor_ts.declination_value as varchar), '(' || navaids_points.vor_ts.declination_nilreason || ')') as declination,
    coalesce(cast(navaids_points.vor_ts.frequency_value as varchar) || ' ' || navaids_points.vor_ts.frequency_uom, '(' || navaids_points.vor_ts.frequency_nilreason || ')') as frequency,
    geometry_elevatedpoint_view_gfxdut.geom AS location_geom,
    geometry_elevatedpoint_view_gfxdut.longitude AS location_longitude,
    geometry_elevatedpoint_view_gfxdut.latitude AS location_latitude,
    geometry_elevatedpoint_view_gfxdut.elevation AS location_elevation,
    geometry_elevatedpoint_view_gfxdut.geoidUndulation AS location_geoidundulation,
    geometry_elevatedpoint_view_gfxdut.verticalDatum AS location_verticaldatum,
    geometry_elevatedpoint_view_gfxdut.verticalAccuracy AS location_verticalaccuracy,
    geometry_elevatedpoint_view_gfxdut.horizontalAccuracy AS location_horizontalaccuracy,
    lat_authority.lat_authority as authority,
    lat_monitoring.lat_monitoring as monitoring,
    lat_availability.lat_availability as availability,
    lat_annotation.annotation as annotation
from navaids_points.vor 
inner join master_join mj2 on navaids_points.vor.id = mj2.source_id
inner join navaids_points.vor_tsp on mj2.target_id = navaids_points.vor_tsp.id
inner join navaids_points.vor_ts on navaids_points.vor_tsp.vortimeslice_id = navaids_points.vor_ts.id
left join geometry.elevatedpoint_view geometry_elevatedpoint_view_gfxdut on navaids_points.vor_ts.location_id = geometry_elevatedpoint_view_gfxdut.id
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_authorityfornavaidequipment_view_vellyx.*) as lat_authority
  from master_join master_join_mnxswm
  join navaids_points.authorityfornavaidequipment_view navaids_points_authorityfornavaidequipment_view_vellyx on master_join_mnxswm.target_id = navaids_points_authorityfornavaidequipment_view_vellyx.id
  where master_join_mnxswm.source_id = navaids_points.vor_ts.id
) as lat_authority on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidequipmentmonitoring_view_kyrjhi.*) as lat_monitoring
  from master_join master_join_acshdv
  join navaids_points.navaidequipmentmonitoring_view navaids_points_navaidequipmentmonitoring_view_kyrjhi on master_join_acshdv.target_id = navaids_points_navaidequipmentmonitoring_view_kyrjhi.id
  where master_join_acshdv.source_id = navaids_points.vor_ts.id
) as lat_monitoring on TRUE
left join lateral(
  select jsonb_agg(DISTINCT navaids_points_navaidoperationalstatus_view_mhpmaw.*) as lat_availability
  from master_join master_join_jcnoer
  join navaids_points.navaidoperationalstatus_view navaids_points_navaidoperationalstatus_view_mhpmaw on master_join_jcnoer.target_id = navaids_points_navaidoperationalstatus_view_mhpmaw.id
  where master_join_jcnoer.source_id = navaids_points.vor_ts.id
) as lat_availability on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_nkohwm.*) AS annotation
  from master_join master_join_hzhpgy
  join notes.note_view notes_note_view_nkohwm on master_join_hzhpgy.target_id = notes_note_view_nkohwm.id
  where master_join_hzhpgy.source_id = navaids_points.vor_ts.id
) as lat_annotation on TRUE
where navaids_points.vor.feature_status = 'APPROVED'
  and navaids_points.vor_ts.feature_status = 'APPROVED'
order by vor.identifier, vor_ts.sequence_number, vor_ts.correction_number DESC;
create index on navaids_points.vor_view (id);
-- WorkAreaTimeSliceType
-- ['geometry.elevatedsurface_view', 'airport_heliport.workareaactivity_view', 'notes.note_view']
drop materialized view if exists airport_heliport.workarea_view cascade;
create materialized view airport_heliport.workarea_view as
select distinct on (workarea.identifier,workarea_ts.sequence_number)
    (row_number() OVER ())::integer AS row,
    airport_heliport.workarea.id,
    airport_heliport.workarea_ts.id as ts_id,
    airport_heliport.workarea_tsp.id as tsp_id,
    airport_heliport.workarea.identifier,
    airport_heliport.workarea_ts.interpretation,
    airport_heliport.workarea_ts.sequence_number,
    airport_heliport.workarea_ts.correction_number,
    airport_heliport.workarea_ts.valid_time_begin,
    airport_heliport.workarea_ts.valid_time_end,
    airport_heliport.workarea_ts.feature_lifetime_begin,
    airport_heliport.workarea_ts.feature_lifetime_end,
    coalesce(cast(airport_heliport.workarea_ts.plannedOperational_value as varchar), '(' || airport_heliport.workarea_ts.plannedOperational_nilreason || ')') as plannedOperational,
    coalesce(cast(airport_heliport.workarea_ts.type_value as varchar), '(' || airport_heliport.workarea_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport_airportheliport_pt_gephzm.title as varchar), '(' || airport_heliport_airportheliport_pt_gephzm.nilreason[1] || ')') AS associatedairportheliport,
    airport_heliport_airportheliport_pt_gephzm.href AS associatedairportheliport_href,
    geometry_elevatedsurface_view_kgmsow.geom AS extent_geom,
    geometry_elevatedsurface_view_kgmsow.elevation AS extent_elevation,
    geometry_elevatedsurface_view_kgmsow.geoidUndulation AS extent_geoidundulation,
    geometry_elevatedsurface_view_kgmsow.verticalDatum AS extent_verticaldatum,
    geometry_elevatedsurface_view_kgmsow.verticalAccuracy AS extent_verticalaccuracy,
    geometry_elevatedsurface_view_kgmsow.horizontalAccuracy AS extent_horizontalaccuracy,
    lat_activation.lat_activation as activation,
    lat_annotation.annotation as annotation
from airport_heliport.workarea 
inner join master_join mj2 on airport_heliport.workarea.id = mj2.source_id
inner join airport_heliport.workarea_tsp on mj2.target_id = airport_heliport.workarea_tsp.id
inner join airport_heliport.workarea_ts on airport_heliport.workarea_tsp.workareatimeslice_id = airport_heliport.workarea_ts.id
left join airport_heliport.airportheliport_pt airport_heliport_airportheliport_pt_gephzm on airport_heliport.workarea_ts.associatedairportheliport_id = airport_heliport_airportheliport_pt_gephzm.id
left join geometry.elevatedsurface_view geometry_elevatedsurface_view_kgmsow on airport_heliport.workarea_ts.extent_id = geometry_elevatedsurface_view_kgmsow.id
left join lateral(
  select jsonb_agg(DISTINCT airport_heliport_workareaactivity_view_eknvsv.*) as lat_activation
  from master_join master_join_gpbtjh
  join airport_heliport.workareaactivity_view airport_heliport_workareaactivity_view_eknvsv on master_join_gpbtjh.target_id = airport_heliport_workareaactivity_view_eknvsv.id
  where master_join_gpbtjh.source_id = airport_heliport.workarea_ts.id
) as lat_activation on TRUE
left join lateral(
  select
    jsonb_agg(DISTINCT notes_note_view_zetfrh.*) AS annotation
  from master_join master_join_xmkaff
  join notes.note_view notes_note_view_zetfrh on master_join_xmkaff.target_id = notes_note_view_zetfrh.id
  where master_join_xmkaff.source_id = airport_heliport.workarea_ts.id
) as lat_annotation on TRUE
where airport_heliport.workarea.feature_status = 'APPROVED'
  and airport_heliport.workarea_ts.feature_status = 'APPROVED'
order by workarea.identifier, workarea_ts.sequence_number, workarea_ts.correction_number DESC;
create index on airport_heliport.workarea_view (id);
