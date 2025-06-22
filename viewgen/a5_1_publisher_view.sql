
create or replace view aerial_refuelling.aerialrefuelling_publisher_view as
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
    coalesce(cast(aerial_refuelling.aerialrefuelling_ts.reversedirectionturn_value as varchar), '(' || aerial_refuelling.aerialrefuelling_ts.reversedirectionturn_nilreason || ')') as reversedirectionturn
from aerial_refuelling.aerialrefuelling 
inner join master_join mj2 on aerial_refuelling.aerialrefuelling.id = mj2.source_id
inner join aerial_refuelling.aerialrefuelling_tsp on mj2.target_id = aerial_refuelling.aerialrefuelling_tsp.id
inner join aerial_refuelling.aerialrefuelling_ts on aerial_refuelling.aerialrefuelling_tsp.aerialrefuellingtimeslice_id = aerial_refuelling.aerialrefuelling_ts.id
where aerialrefuelling_ts.feature_status = 'APPROVED'
order by aerialrefuelling.identifier, aerialrefuelling_ts.sequence_number, aerialrefuelling_ts.correction_number DESC;
create or replace view navaids_points.aeronauticalgroundlight_publisher_view as
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
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.name_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.type_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.colour_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.colour_nilreason || ')') as colour,
    coalesce(cast(navaids_points.aeronauticalgroundlight_ts.flashing_value as varchar), '(' || navaids_points.aeronauticalgroundlight_ts.flashing_nilreason || ')') as flashing
from navaids_points.aeronauticalgroundlight 
inner join master_join mj2 on navaids_points.aeronauticalgroundlight.id = mj2.source_id
inner join navaids_points.aeronauticalgroundlight_tsp on mj2.target_id = navaids_points.aeronauticalgroundlight_tsp.id
inner join navaids_points.aeronauticalgroundlight_ts on navaids_points.aeronauticalgroundlight_tsp.aeronauticalgroundlighttimeslice_id = navaids_points.aeronauticalgroundlight_ts.id
where aeronauticalgroundlight_ts.feature_status = 'APPROVED'
order by aeronauticalgroundlight.identifier, aeronauticalgroundlight_ts.sequence_number, aeronauticalgroundlight_ts.correction_number DESC;
create or replace view service.aircraftgroundservice_publisher_view as
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
    coalesce(cast(service.aircraftgroundservice_ts.flightoperations_value as varchar), '(' || service.aircraftgroundservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.aircraftgroundservice_ts.rank_value as varchar), '(' || service.aircraftgroundservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.aircraftgroundservice_ts.complianticao_value as varchar), '(' || service.aircraftgroundservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.aircraftgroundservice_ts.name_value as varchar), '(' || service.aircraftgroundservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.aircraftgroundservice_ts.type_value as varchar), '(' || service.aircraftgroundservice_ts.type_nilreason || ')') as type
from service.aircraftgroundservice 
inner join master_join mj2 on service.aircraftgroundservice.id = mj2.source_id
inner join service.aircraftgroundservice_tsp on mj2.target_id = service.aircraftgroundservice_tsp.id
inner join service.aircraftgroundservice_ts on service.aircraftgroundservice_tsp.aircraftgroundservicetimeslice_id = service.aircraftgroundservice_ts.id
where aircraftgroundservice_ts.feature_status = 'APPROVED'
order by aircraftgroundservice.identifier, aircraftgroundservice_ts.sequence_number, aircraftgroundservice_ts.correction_number DESC;
create or replace view airport_heliport.aircraftstand_publisher_view as
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
    coalesce(cast(airport_heliport.aircraftstand_ts.designator_value as varchar), '(' || airport_heliport.aircraftstand_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.aircraftstand_ts.type_value as varchar), '(' || airport_heliport.aircraftstand_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.aircraftstand_ts.visualdockingsystem_value as varchar), '(' || airport_heliport.aircraftstand_ts.visualdockingsystem_nilreason || ')') as visualdockingsystem
from airport_heliport.aircraftstand 
inner join master_join mj2 on airport_heliport.aircraftstand.id = mj2.source_id
inner join airport_heliport.aircraftstand_tsp on mj2.target_id = airport_heliport.aircraftstand_tsp.id
inner join airport_heliport.aircraftstand_ts on airport_heliport.aircraftstand_tsp.aircraftstandtimeslice_id = airport_heliport.aircraftstand_ts.id
where aircraftstand_ts.feature_status = 'APPROVED'
order by aircraftstand.identifier, aircraftstand_ts.sequence_number, aircraftstand_ts.correction_number DESC;
create or replace view service.airportclearanceservice_publisher_view as
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
    coalesce(cast(service.airportclearanceservice_ts.flightoperations_value as varchar), '(' || service.airportclearanceservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airportclearanceservice_ts.rank_value as varchar), '(' || service.airportclearanceservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airportclearanceservice_ts.complianticao_value as varchar), '(' || service.airportclearanceservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airportclearanceservice_ts.name_value as varchar), '(' || service.airportclearanceservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.airportclearanceservice_ts.snowplan_value as varchar), '(' || service.airportclearanceservice_ts.snowplan_nilreason || ')') as snowplan
from service.airportclearanceservice 
inner join master_join mj2 on service.airportclearanceservice.id = mj2.source_id
inner join service.airportclearanceservice_tsp on mj2.target_id = service.airportclearanceservice_tsp.id
inner join service.airportclearanceservice_ts on service.airportclearanceservice_tsp.airportclearanceservicetimeslice_id = service.airportclearanceservice_ts.id
where airportclearanceservice_ts.feature_status = 'APPROVED'
order by airportclearanceservice.identifier, airportclearanceservice_ts.sequence_number, airportclearanceservice_ts.correction_number DESC;
create or replace view airport_heliport.airportheliportcollocation_publisher_view as
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
    coalesce(cast(airport_heliport.airportheliportcollocation_ts.type_value as varchar), '(' || airport_heliport.airportheliportcollocation_ts.type_nilreason || ')') as type
from airport_heliport.airportheliportcollocation 
inner join master_join mj2 on airport_heliport.airportheliportcollocation.id = mj2.source_id
inner join airport_heliport.airportheliportcollocation_tsp on mj2.target_id = airport_heliport.airportheliportcollocation_tsp.id
inner join airport_heliport.airportheliportcollocation_ts on airport_heliport.airportheliportcollocation_tsp.airportheliportcollocationtimeslice_id = airport_heliport.airportheliportcollocation_ts.id
where airportheliportcollocation_ts.feature_status = 'APPROVED'
order by airportheliportcollocation.identifier, airportheliportcollocation_ts.sequence_number, airportheliportcollocation_ts.correction_number DESC;
create or replace view airport_heliport.airportheliport_publisher_view as
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
    coalesce(cast(airport_heliport.airportheliport_ts.certificationDate_value as varchar), '(' || airport_heliport.airportheliport_ts.certificationDate_nilreason || ')') as certificationDate,
    coalesce(cast(airport_heliport.airportheliport_ts.certificationExpirationDate_value as varchar), '(' || airport_heliport.airportheliport_ts.certificationExpirationDate_nilreason || ')') as certificationExpirationDate,
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
    coalesce(cast(airport_heliport.airportheliport_ts.certificationDate_value as varchar), '(' || airport_heliport.airportheliport_ts.certificationDate_nilreason || ')') as certificationDate,
    coalesce(cast(airport_heliport.airportheliport_ts.certificationExpirationDate_value as varchar), '(' || airport_heliport.airportheliport_ts.certificationExpirationDate_nilreason || ')') as certificationExpirationDate,
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
    coalesce(cast(airport_heliport.airportheliport_ts.lowesttemperature_value as varchar) || ' ' || airport_heliport.airportheliport_ts.lowesttemperature_uom, '(' || airport_heliport.airportheliport_ts.lowesttemperature_nilreason || ')') as lowesttemperature
from airport_heliport.airportheliport 
inner join master_join mj2 on airport_heliport.airportheliport.id = mj2.source_id
inner join airport_heliport.airportheliport_tsp on mj2.target_id = airport_heliport.airportheliport_tsp.id
inner join airport_heliport.airportheliport_ts on airport_heliport.airportheliport_tsp.airportheliporttimeslice_id = airport_heliport.airportheliport_ts.id
where airportheliport_ts.feature_status = 'APPROVED'
order by airportheliport.identifier, airportheliport_ts.sequence_number, airportheliport_ts.correction_number DESC;
create or replace view airport_heliport.airporthotspot_publisher_view as
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
    coalesce(cast(airport_heliport.airporthotspot_ts.designator_value as varchar), '(' || airport_heliport.airporthotspot_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.airporthotspot_ts.instruction_value as varchar), '(' || airport_heliport.airporthotspot_ts.instruction_nilreason || ')') as instruction
from airport_heliport.airporthotspot 
inner join master_join mj2 on airport_heliport.airporthotspot.id = mj2.source_id
inner join airport_heliport.airporthotspot_tsp on mj2.target_id = airport_heliport.airporthotspot_tsp.id
inner join airport_heliport.airporthotspot_ts on airport_heliport.airporthotspot_tsp.airporthotspottimeslice_id = airport_heliport.airporthotspot_ts.id
where airporthotspot_ts.feature_status = 'APPROVED'
order by airporthotspot.identifier, airporthotspot_ts.sequence_number, airporthotspot_ts.correction_number DESC;
create or replace view airport_heliport.airportprotectionareamarking_publisher_view as
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
    coalesce(cast(airport_heliport.airportprotectionareamarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.airportprotectionareamarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.airportprotectionareamarking_ts.condition_value as varchar), '(' || airport_heliport.airportprotectionareamarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.airportprotectionareamarking_ts.markinglocation_value as varchar), '(' || airport_heliport.airportprotectionareamarking_ts.markinglocation_nilreason || ')') as markinglocation
from airport_heliport.airportprotectionareamarking 
inner join master_join mj2 on airport_heliport.airportprotectionareamarking.id = mj2.source_id
inner join airport_heliport.airportprotectionareamarking_tsp on mj2.target_id = airport_heliport.airportprotectionareamarking_tsp.id
inner join airport_heliport.airportprotectionareamarking_ts on airport_heliport.airportprotectionareamarking_tsp.airportprotectionareamarkingtimeslice_id = airport_heliport.airportprotectionareamarking_ts.id
where airportprotectionareamarking_ts.feature_status = 'APPROVED'
order by airportprotectionareamarking.identifier, airportprotectionareamarking_ts.sequence_number, airportprotectionareamarking_ts.correction_number DESC;
create or replace view service.airportsuppliesservice_publisher_view as
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
    coalesce(cast(service.airportsuppliesservice_ts.flightoperations_value as varchar), '(' || service.airportsuppliesservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airportsuppliesservice_ts.rank_value as varchar), '(' || service.airportsuppliesservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airportsuppliesservice_ts.complianticao_value as varchar), '(' || service.airportsuppliesservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airportsuppliesservice_ts.name_value as varchar), '(' || service.airportsuppliesservice_ts.name_nilreason || ')') as name
from service.airportsuppliesservice 
inner join master_join mj2 on service.airportsuppliesservice.id = mj2.source_id
inner join service.airportsuppliesservice_tsp on mj2.target_id = service.airportsuppliesservice_tsp.id
inner join service.airportsuppliesservice_ts on service.airportsuppliesservice_tsp.airportsuppliesservicetimeslice_id = service.airportsuppliesservice_ts.id
where airportsuppliesservice_ts.feature_status = 'APPROVED'
order by airportsuppliesservice.identifier, airportsuppliesservice_ts.sequence_number, airportsuppliesservice_ts.correction_number DESC;
create or replace view routes.airspacebordercrossing_publisher_view as
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
    routes.airspacebordercrossing_ts.feature_lifetime_end
from routes.airspacebordercrossing 
inner join master_join mj2 on routes.airspacebordercrossing.id = mj2.source_id
inner join routes.airspacebordercrossing_tsp on mj2.target_id = routes.airspacebordercrossing_tsp.id
inner join routes.airspacebordercrossing_ts on routes.airspacebordercrossing_tsp.airspacebordercrossingtimeslice_id = routes.airspacebordercrossing_ts.id
where airspacebordercrossing_ts.feature_status = 'APPROVED'
order by airspacebordercrossing.identifier, airspacebordercrossing_ts.sequence_number, airspacebordercrossing_ts.correction_number DESC;
create or replace view airspace.airspace_publisher_view as
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
    coalesce(cast(airspace.airspace_ts.type_value as varchar), '(' || airspace.airspace_ts.type_nilreason || ')') as type,
    coalesce(cast(airspace.airspace_ts.designator_value as varchar), '(' || airspace.airspace_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airspace.airspace_ts.localtype_value as varchar), '(' || airspace.airspace_ts.localtype_nilreason || ')') as localtype,
    coalesce(cast(airspace.airspace_ts.name_value as varchar), '(' || airspace.airspace_ts.name_nilreason || ')') as name,
    coalesce(cast(airspace.airspace_ts.designatoricao_value as varchar), '(' || airspace.airspace_ts.designatoricao_nilreason || ')') as designatoricao,
    coalesce(cast(airspace.airspace_ts.controltype_value as varchar), '(' || airspace.airspace_ts.controltype_nilreason || ')') as controltype,
    coalesce(cast(airspace.airspace_ts.upperlowerseparation_value as varchar) || ' ' || airspace.airspace_ts.upperlowerseparation_uom, '(' || airspace.airspace_ts.upperlowerseparation_nilreason || ')') as upperlowerseparation
from airspace.airspace 
inner join master_join mj2 on airspace.airspace.id = mj2.source_id
inner join airspace.airspace_tsp on mj2.target_id = airspace.airspace_tsp.id
inner join airspace.airspace_ts on airspace.airspace_tsp.airspacetimeslice_id = airspace.airspace_ts.id
where airspace_ts.feature_status = 'APPROVED'
order by airspace.identifier, airspace_ts.sequence_number, airspace_ts.correction_number DESC;
create or replace view service.airtrafficcontrolservice_publisher_view as
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
    coalesce(cast(service.airtrafficcontrolservice_ts.flightoperations_value as varchar), '(' || service.airtrafficcontrolservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airtrafficcontrolservice_ts.rank_value as varchar), '(' || service.airtrafficcontrolservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airtrafficcontrolservice_ts.complianticao_value as varchar), '(' || service.airtrafficcontrolservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airtrafficcontrolservice_ts.name_value as varchar), '(' || service.airtrafficcontrolservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.airtrafficcontrolservice_ts.radarassisted_value as varchar), '(' || service.airtrafficcontrolservice_ts.radarassisted_nilreason || ')') as radarassisted,
    coalesce(cast(service.airtrafficcontrolservice_ts.datalinkenabled_value as varchar), '(' || service.airtrafficcontrolservice_ts.datalinkenabled_nilreason || ')') as datalinkenabled,
    coalesce(cast(service.airtrafficcontrolservice_ts.datalinkchannel_value as varchar), '(' || service.airtrafficcontrolservice_ts.datalinkchannel_nilreason || ')') as datalinkchannel,
    coalesce(cast(service.airtrafficcontrolservice_ts.type_value as varchar), '(' || service.airtrafficcontrolservice_ts.type_nilreason || ')') as type
from service.airtrafficcontrolservice 
inner join master_join mj2 on service.airtrafficcontrolservice.id = mj2.source_id
inner join service.airtrafficcontrolservice_tsp on mj2.target_id = service.airtrafficcontrolservice_tsp.id
inner join service.airtrafficcontrolservice_ts on service.airtrafficcontrolservice_tsp.airtrafficcontrolservicetimeslice_id = service.airtrafficcontrolservice_ts.id
where airtrafficcontrolservice_ts.feature_status = 'APPROVED'
order by airtrafficcontrolservice.identifier, airtrafficcontrolservice_ts.sequence_number, airtrafficcontrolservice_ts.correction_number DESC;
create or replace view service.airtrafficmanagementservice_publisher_view as
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
    coalesce(cast(service.airtrafficmanagementservice_ts.flightoperations_value as varchar), '(' || service.airtrafficmanagementservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.airtrafficmanagementservice_ts.rank_value as varchar), '(' || service.airtrafficmanagementservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.airtrafficmanagementservice_ts.complianticao_value as varchar), '(' || service.airtrafficmanagementservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.airtrafficmanagementservice_ts.name_value as varchar), '(' || service.airtrafficmanagementservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.airtrafficmanagementservice_ts.type_value as varchar), '(' || service.airtrafficmanagementservice_ts.type_nilreason || ')') as type
from service.airtrafficmanagementservice 
inner join master_join mj2 on service.airtrafficmanagementservice.id = mj2.source_id
inner join service.airtrafficmanagementservice_tsp on mj2.target_id = service.airtrafficmanagementservice_tsp.id
inner join service.airtrafficmanagementservice_ts on service.airtrafficmanagementservice_tsp.airtrafficmanagementservicetimeslice_id = service.airtrafficmanagementservice_ts.id
where airtrafficmanagementservice_ts.feature_status = 'APPROVED'
order by airtrafficmanagementservice.identifier, airtrafficmanagementservice_ts.sequence_number, airtrafficmanagementservice_ts.correction_number DESC;
create or replace view airport_heliport.altimetersource_publisher_view as
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
    coalesce(cast(airport_heliport.altimetersource_ts.isremote_value as varchar), '(' || airport_heliport.altimetersource_ts.isremote_nilreason || ')') as isremote,
    coalesce(cast(airport_heliport.altimetersource_ts.isprimary_value as varchar), '(' || airport_heliport.altimetersource_ts.isprimary_nilreason || ')') as isprimary
from airport_heliport.altimetersource 
inner join master_join mj2 on airport_heliport.altimetersource.id = mj2.source_id
inner join airport_heliport.altimetersource_tsp on mj2.target_id = airport_heliport.altimetersource_tsp.id
inner join airport_heliport.altimetersource_ts on airport_heliport.altimetersource_tsp.altimetersourcetimeslice_id = airport_heliport.altimetersource_ts.id
where altimetersource_ts.feature_status = 'APPROVED'
order by altimetersource.identifier, altimetersource_ts.sequence_number, altimetersource_ts.correction_number DESC;
create or replace view navaids_points.angleindication_publisher_view as
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
    coalesce(cast(navaids_points.angleindication_ts.angle_value as varchar), '(' || navaids_points.angleindication_ts.angle_nilreason || ')') as angle,
    coalesce(cast(navaids_points.angleindication_ts.angletype_value as varchar), '(' || navaids_points.angleindication_ts.angletype_nilreason || ')') as angletype,
    coalesce(cast(navaids_points.angleindication_ts.indicationdirection_value as varchar), '(' || navaids_points.angleindication_ts.indicationdirection_nilreason || ')') as indicationdirection,
    coalesce(cast(navaids_points.angleindication_ts.trueangle_value as varchar), '(' || navaids_points.angleindication_ts.trueangle_nilreason || ')') as trueangle,
    coalesce(cast(navaids_points.angleindication_ts.cardinaldirection_value as varchar), '(' || navaids_points.angleindication_ts.cardinaldirection_nilreason || ')') as cardinaldirection,
    coalesce(cast(navaids_points.angleindication_ts.minimumreceptionaltitude_value as varchar) || ' ' || navaids_points.angleindication_ts.minimumreceptionaltitude_uom, '(' || navaids_points.angleindication_ts.minimumreceptionaltitude_nilreason || ')') as minimumreceptionaltitude
from navaids_points.angleindication 
inner join master_join mj2 on navaids_points.angleindication.id = mj2.source_id
inner join navaids_points.angleindication_tsp on mj2.target_id = navaids_points.angleindication_tsp.id
inner join navaids_points.angleindication_ts on navaids_points.angleindication_tsp.angleindicationtimeslice_id = navaids_points.angleindication_ts.id
where angleindication_ts.feature_status = 'APPROVED'
order by angleindication.identifier, angleindication_ts.sequence_number, angleindication_ts.correction_number DESC;
create or replace view airport_heliport.approachlightingsystem_publisher_view as
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
    coalesce(cast(airport_heliport.approachlightingsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.colour_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.classicao_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.classicao_nilreason || ')') as classicao,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.type_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.sequencedflashing_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.sequencedflashing_nilreason || ')') as sequencedflashing,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.alignmentindicator_value as varchar), '(' || airport_heliport.approachlightingsystem_ts.alignmentindicator_nilreason || ')') as alignmentindicator,
    coalesce(cast(airport_heliport.approachlightingsystem_ts.length_value as varchar) || ' ' || airport_heliport.approachlightingsystem_ts.length_uom, '(' || airport_heliport.approachlightingsystem_ts.length_nilreason || ')') as length
from airport_heliport.approachlightingsystem 
inner join master_join mj2 on airport_heliport.approachlightingsystem.id = mj2.source_id
inner join airport_heliport.approachlightingsystem_tsp on mj2.target_id = airport_heliport.approachlightingsystem_tsp.id
inner join airport_heliport.approachlightingsystem_ts on airport_heliport.approachlightingsystem_tsp.approachlightingsystemtimeslice_id = airport_heliport.approachlightingsystem_ts.id
where approachlightingsystem_ts.feature_status = 'APPROVED'
order by approachlightingsystem.identifier, approachlightingsystem_ts.sequence_number, approachlightingsystem_ts.correction_number DESC;
create or replace view airport_heliport.apronelement_publisher_view as
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
    coalesce(cast(airport_heliport.apronelement_ts.type_value as varchar), '(' || airport_heliport.apronelement_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.apronelement_ts.jetwayavailability_value as varchar), '(' || airport_heliport.apronelement_ts.jetwayavailability_nilreason || ')') as jetwayavailability,
    coalesce(cast(airport_heliport.apronelement_ts.towingavailability_value as varchar), '(' || airport_heliport.apronelement_ts.towingavailability_nilreason || ')') as towingavailability,
    coalesce(cast(airport_heliport.apronelement_ts.dockingavailability_value as varchar), '(' || airport_heliport.apronelement_ts.dockingavailability_nilreason || ')') as dockingavailability,
    coalesce(cast(airport_heliport.apronelement_ts.groundpoweravailability_value as varchar), '(' || airport_heliport.apronelement_ts.groundpoweravailability_nilreason || ')') as groundpoweravailability,
    coalesce(cast(airport_heliport.apronelement_ts.length_value as varchar) || ' ' || airport_heliport.apronelement_ts.length_uom, '(' || airport_heliport.apronelement_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.apronelement_ts.width_value as varchar) || ' ' || airport_heliport.apronelement_ts.width_uom, '(' || airport_heliport.apronelement_ts.width_nilreason || ')') as width
from airport_heliport.apronelement 
inner join master_join mj2 on airport_heliport.apronelement.id = mj2.source_id
inner join airport_heliport.apronelement_tsp on mj2.target_id = airport_heliport.apronelement_tsp.id
inner join airport_heliport.apronelement_ts on airport_heliport.apronelement_tsp.apronelementtimeslice_id = airport_heliport.apronelement_ts.id
where apronelement_ts.feature_status = 'APPROVED'
order by apronelement.identifier, apronelement_ts.sequence_number, apronelement_ts.correction_number DESC;
create or replace view airport_heliport.apronlightsystem_publisher_view as
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
    coalesce(cast(airport_heliport.apronlightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.apronlightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.apronlightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.apronlightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.apronlightsystem_ts.colour_value as varchar), '(' || airport_heliport.apronlightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.apronlightsystem_ts.position_value as varchar), '(' || airport_heliport.apronlightsystem_ts.position_nilreason || ')') as position
from airport_heliport.apronlightsystem 
inner join master_join mj2 on airport_heliport.apronlightsystem.id = mj2.source_id
inner join airport_heliport.apronlightsystem_tsp on mj2.target_id = airport_heliport.apronlightsystem_tsp.id
inner join airport_heliport.apronlightsystem_ts on airport_heliport.apronlightsystem_tsp.apronlightsystemtimeslice_id = airport_heliport.apronlightsystem_ts.id
where apronlightsystem_ts.feature_status = 'APPROVED'
order by apronlightsystem.identifier, apronlightsystem_ts.sequence_number, apronlightsystem_ts.correction_number DESC;
create or replace view airport_heliport.apronmarking_publisher_view as
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
    coalesce(cast(airport_heliport.apronmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.apronmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.apronmarking_ts.condition_value as varchar), '(' || airport_heliport.apronmarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.apronmarking_ts.markinglocation_value as varchar), '(' || airport_heliport.apronmarking_ts.markinglocation_nilreason || ')') as markinglocation
from airport_heliport.apronmarking 
inner join master_join mj2 on airport_heliport.apronmarking.id = mj2.source_id
inner join airport_heliport.apronmarking_tsp on mj2.target_id = airport_heliport.apronmarking_tsp.id
inner join airport_heliport.apronmarking_ts on airport_heliport.apronmarking_tsp.apronmarkingtimeslice_id = airport_heliport.apronmarking_ts.id
where apronmarking_ts.feature_status = 'APPROVED'
order by apronmarking.identifier, apronmarking_ts.sequence_number, apronmarking_ts.correction_number DESC;
create or replace view airport_heliport.apron_publisher_view as
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
    coalesce(cast(airport_heliport.apron_ts.name_value as varchar), '(' || airport_heliport.apron_ts.name_nilreason || ')') as name,
    coalesce(cast(airport_heliport.apron_ts.abandoned_value as varchar), '(' || airport_heliport.apron_ts.abandoned_nilreason || ')') as abandoned
from airport_heliport.apron 
inner join master_join mj2 on airport_heliport.apron.id = mj2.source_id
inner join airport_heliport.apron_tsp on mj2.target_id = airport_heliport.apron_tsp.id
inner join airport_heliport.apron_ts on airport_heliport.apron_tsp.aprontimeslice_id = airport_heliport.apron_ts.id
where apron_ts.feature_status = 'APPROVED'
order by apron.identifier, apron_ts.sequence_number, apron_ts.correction_number DESC;
create or replace view airport_heliport.arrestinggear_publisher_view as
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
    coalesce(cast(airport_heliport.arrestinggear_ts.status_value as varchar), '(' || airport_heliport.arrestinggear_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.arrestinggear_ts.engagedevice_value as varchar), '(' || airport_heliport.arrestinggear_ts.engagedevice_nilreason || ')') as engagedevice,
    coalesce(cast(airport_heliport.arrestinggear_ts.absorbtype_value as varchar), '(' || airport_heliport.arrestinggear_ts.absorbtype_nilreason || ')') as absorbtype,
    coalesce(cast(airport_heliport.arrestinggear_ts.bidirectional_value as varchar), '(' || airport_heliport.arrestinggear_ts.bidirectional_nilreason || ')') as bidirectional,
    coalesce(cast(airport_heliport.arrestinggear_ts.length_value as varchar) || ' ' || airport_heliport.arrestinggear_ts.length_uom, '(' || airport_heliport.arrestinggear_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.arrestinggear_ts.width_value as varchar) || ' ' || airport_heliport.arrestinggear_ts.width_uom, '(' || airport_heliport.arrestinggear_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.arrestinggear_ts.location_value as varchar) || ' ' || airport_heliport.arrestinggear_ts.location_uom, '(' || airport_heliport.arrestinggear_ts.location_nilreason || ')') as location
from airport_heliport.arrestinggear 
inner join master_join mj2 on airport_heliport.arrestinggear.id = mj2.source_id
inner join airport_heliport.arrestinggear_tsp on mj2.target_id = airport_heliport.arrestinggear_tsp.id
inner join airport_heliport.arrestinggear_ts on airport_heliport.arrestinggear_tsp.arrestinggeartimeslice_id = airport_heliport.arrestinggear_ts.id
where arrestinggear_ts.feature_status = 'APPROVED'
order by arrestinggear.identifier, arrestinggear_ts.sequence_number, arrestinggear_ts.correction_number DESC;
create or replace view procedure.arrivalfeederleg_publisher_view as
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
    coalesce(cast(procedure.arrivalfeederleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.arrivalfeederleg_ts.altitudeoverrideatc_uom, '(' || procedure.arrivalfeederleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc
from procedure.arrivalfeederleg 
inner join master_join mj2 on procedure.arrivalfeederleg.id = mj2.source_id
inner join procedure.arrivalfeederleg_tsp on mj2.target_id = procedure.arrivalfeederleg_tsp.id
inner join procedure.arrivalfeederleg_ts on procedure.arrivalfeederleg_tsp.arrivalfeederlegtimeslice_id = procedure.arrivalfeederleg_ts.id
where arrivalfeederleg_ts.feature_status = 'APPROVED'
order by arrivalfeederleg.identifier, arrivalfeederleg_ts.sequence_number, arrivalfeederleg_ts.correction_number DESC;
create or replace view procedure.arrivalleg_publisher_view as
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
    coalesce(cast(procedure.arrivalleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.arrivalleg_ts.altitudeoverrideatc_uom, '(' || procedure.arrivalleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc
from procedure.arrivalleg 
inner join master_join mj2 on procedure.arrivalleg.id = mj2.source_id
inner join procedure.arrivalleg_tsp on mj2.target_id = procedure.arrivalleg_tsp.id
inner join procedure.arrivalleg_ts on procedure.arrivalleg_tsp.arrivallegtimeslice_id = procedure.arrivalleg_ts.id
where arrivalleg_ts.feature_status = 'APPROVED'
order by arrivalleg.identifier, arrivalleg_ts.sequence_number, arrivalleg_ts.correction_number DESC;
create or replace view airspace.authorityforairspace_publisher_view as
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
    coalesce(cast(airspace.authorityforairspace_ts.type_value as varchar), '(' || airspace.authorityforairspace_ts.type_nilreason || ')') as type
from airspace.authorityforairspace 
inner join master_join mj2 on airspace.authorityforairspace.id = mj2.source_id
inner join airspace.authorityforairspace_tsp on mj2.target_id = airspace.authorityforairspace_tsp.id
inner join airspace.authorityforairspace_ts on airspace.authorityforairspace_tsp.authorityforairspacetimeslice_id = airspace.authorityforairspace_ts.id
where authorityforairspace_ts.feature_status = 'APPROVED'
order by authorityforairspace.identifier, authorityforairspace_ts.sequence_number, authorityforairspace_ts.correction_number DESC;
create or replace view navaids_points.azimuth_publisher_view as
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
    coalesce(cast(navaids_points.azimuth_ts.channel_value as varchar), '(' || navaids_points.azimuth_ts.channel_nilreason || ')') as channel
from navaids_points.azimuth 
inner join master_join mj2 on navaids_points.azimuth.id = mj2.source_id
inner join navaids_points.azimuth_tsp on mj2.target_id = navaids_points.azimuth_tsp.id
inner join navaids_points.azimuth_ts on navaids_points.azimuth_tsp.azimuthtimeslice_id = navaids_points.azimuth_ts.id
where azimuth_ts.feature_status = 'APPROVED'
order by azimuth.identifier, azimuth_ts.sequence_number, azimuth_ts.correction_number DESC;
create or replace view routes.changeoverpoint_publisher_view as
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
    coalesce(cast(routes.changeoverpoint_ts.distance_value as varchar) || ' ' || routes.changeoverpoint_ts.distance_uom, '(' || routes.changeoverpoint_ts.distance_nilreason || ')') as distance
from routes.changeoverpoint 
inner join master_join mj2 on routes.changeoverpoint.id = mj2.source_id
inner join routes.changeoverpoint_tsp on mj2.target_id = routes.changeoverpoint_tsp.id
inner join routes.changeoverpoint_ts on routes.changeoverpoint_tsp.changeoverpointtimeslice_id = routes.changeoverpoint_ts.id
where changeoverpoint_ts.feature_status = 'APPROVED'
order by changeoverpoint.identifier, changeoverpoint_ts.sequence_number, changeoverpoint_ts.correction_number DESC;
create or replace view navaids_points.checkpointins_publisher_view as
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
    coalesce(cast(navaids_points.checkpointins_ts.category_value as varchar), '(' || navaids_points.checkpointins_ts.category_nilreason || ')') as category,
    coalesce(cast(navaids_points.checkpointins_ts.upperlimitreference_value as varchar), '(' || navaids_points.checkpointins_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(navaids_points.checkpointins_ts.lowerlimitreference_value as varchar), '(' || navaids_points.checkpointins_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(navaids_points.checkpointins_ts.altitudeinterpretation_value as varchar), '(' || navaids_points.checkpointins_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(navaids_points.checkpointins_ts.angle_value as varchar), '(' || navaids_points.checkpointins_ts.angle_nilreason || ')') as angle,
    coalesce(cast(navaids_points.checkpointins_ts.upperlimit_value as varchar) || ' ' || navaids_points.checkpointins_ts.upperlimit_uom, '(' || navaids_points.checkpointins_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(navaids_points.checkpointins_ts.lowerlimit_value as varchar) || ' ' || navaids_points.checkpointins_ts.lowerlimit_uom, '(' || navaids_points.checkpointins_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(navaids_points.checkpointins_ts.distance_value as varchar) || ' ' || navaids_points.checkpointins_ts.distance_uom, '(' || navaids_points.checkpointins_ts.distance_nilreason || ')') as distance
from navaids_points.checkpointins 
inner join master_join mj2 on navaids_points.checkpointins.id = mj2.source_id
inner join navaids_points.checkpointins_tsp on mj2.target_id = navaids_points.checkpointins_tsp.id
inner join navaids_points.checkpointins_ts on navaids_points.checkpointins_tsp.checkpointinstimeslice_id = navaids_points.checkpointins_ts.id
where checkpointins_ts.feature_status = 'APPROVED'
order by checkpointins.identifier, checkpointins_ts.sequence_number, checkpointins_ts.correction_number DESC;
create or replace view navaids_points.checkpointvor_publisher_view as
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
    coalesce(cast(navaids_points.checkpointvor_ts.category_value as varchar), '(' || navaids_points.checkpointvor_ts.category_nilreason || ')') as category,
    coalesce(cast(navaids_points.checkpointvor_ts.upperlimitreference_value as varchar), '(' || navaids_points.checkpointvor_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(navaids_points.checkpointvor_ts.lowerlimitreference_value as varchar), '(' || navaids_points.checkpointvor_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(navaids_points.checkpointvor_ts.altitudeinterpretation_value as varchar), '(' || navaids_points.checkpointvor_ts.altitudeinterpretation_nilreason || ')') as altitudeinterpretation,
    coalesce(cast(navaids_points.checkpointvor_ts.angle_value as varchar), '(' || navaids_points.checkpointvor_ts.angle_nilreason || ')') as angle,
    coalesce(cast(navaids_points.checkpointvor_ts.upperlimit_value as varchar) || ' ' || navaids_points.checkpointvor_ts.upperlimit_uom, '(' || navaids_points.checkpointvor_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(navaids_points.checkpointvor_ts.lowerlimit_value as varchar) || ' ' || navaids_points.checkpointvor_ts.lowerlimit_uom, '(' || navaids_points.checkpointvor_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(navaids_points.checkpointvor_ts.distance_value as varchar) || ' ' || navaids_points.checkpointvor_ts.distance_uom, '(' || navaids_points.checkpointvor_ts.distance_nilreason || ')') as distance
from navaids_points.checkpointvor 
inner join master_join mj2 on navaids_points.checkpointvor.id = mj2.source_id
inner join navaids_points.checkpointvor_tsp on mj2.target_id = navaids_points.checkpointvor_tsp.id
inner join navaids_points.checkpointvor_ts on navaids_points.checkpointvor_tsp.checkpointvortimeslice_id = navaids_points.checkpointvor_ts.id
where checkpointvor_ts.feature_status = 'APPROVED'
order by checkpointvor.identifier, checkpointvor_ts.sequence_number, checkpointvor_ts.correction_number DESC;
create or replace view public.circlingarea_publisher_view as
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
    public.circlingarea_ts.feature_lifetime_end
from public.circlingarea 
inner join master_join mj2 on public.circlingarea.id = mj2.source_id
inner join public.circlingarea_tsp on mj2.target_id = public.circlingarea_tsp.id
inner join public.circlingarea_ts on public.circlingarea_tsp.circlingareatimeslice_id = public.circlingarea_ts.id
where circlingarea_ts.feature_status = 'APPROVED'
order by circlingarea.identifier, circlingarea_ts.sequence_number, circlingarea_ts.correction_number DESC;
create or replace view airport_heliport.deicingareamarking_publisher_view as
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
    coalesce(cast(airport_heliport.deicingareamarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.deicingareamarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.deicingareamarking_ts.condition_value as varchar), '(' || airport_heliport.deicingareamarking_ts.condition_nilreason || ')') as condition
from airport_heliport.deicingareamarking 
inner join master_join mj2 on airport_heliport.deicingareamarking.id = mj2.source_id
inner join airport_heliport.deicingareamarking_tsp on mj2.target_id = airport_heliport.deicingareamarking_tsp.id
inner join airport_heliport.deicingareamarking_ts on airport_heliport.deicingareamarking_tsp.deicingareamarkingtimeslice_id = airport_heliport.deicingareamarking_ts.id
where deicingareamarking_ts.feature_status = 'APPROVED'
order by deicingareamarking.identifier, deicingareamarking_ts.sequence_number, deicingareamarking_ts.correction_number DESC;
create or replace view airport_heliport.deicingarea_publisher_view as
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
    airport_heliport.deicingarea_ts.feature_lifetime_end
from airport_heliport.deicingarea 
inner join master_join mj2 on airport_heliport.deicingarea.id = mj2.source_id
inner join airport_heliport.deicingarea_tsp on mj2.target_id = airport_heliport.deicingarea_tsp.id
inner join airport_heliport.deicingarea_ts on airport_heliport.deicingarea_tsp.deicingareatimeslice_id = airport_heliport.deicingarea_ts.id
where deicingarea_ts.feature_status = 'APPROVED'
order by deicingarea.identifier, deicingarea_ts.sequence_number, deicingarea_ts.correction_number DESC;
create or replace view procedure.departureleg_publisher_view as
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
    coalesce(cast(procedure.departureleg_ts.minimumobstacleclearancealtitude_value as varchar) || ' ' || procedure.departureleg_ts.minimumobstacleclearancealtitude_uom, '(' || procedure.departureleg_ts.minimumobstacleclearancealtitude_nilreason || ')') as minimumobstacleclearancealtitude
from procedure.departureleg 
inner join master_join mj2 on procedure.departureleg.id = mj2.source_id
inner join procedure.departureleg_tsp on mj2.target_id = procedure.departureleg_tsp.id
inner join procedure.departureleg_ts on procedure.departureleg_tsp.departurelegtimeslice_id = procedure.departureleg_ts.id
where departureleg_ts.feature_status = 'APPROVED'
order by departureleg.identifier, departureleg_ts.sequence_number, departureleg_ts.correction_number DESC;
create or replace view navaids_points.designatedpoint_publisher_view as
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
    coalesce(cast(navaids_points.designatedpoint_ts.designator_value as varchar), '(' || navaids_points.designatedpoint_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.designatedpoint_ts.type_value as varchar), '(' || navaids_points.designatedpoint_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.designatedpoint_ts.name_value as varchar), '(' || navaids_points.designatedpoint_ts.name_nilreason || ')') as name
from navaids_points.designatedpoint 
inner join master_join mj2 on navaids_points.designatedpoint.id = mj2.source_id
inner join navaids_points.designatedpoint_tsp on mj2.target_id = navaids_points.designatedpoint_tsp.id
inner join navaids_points.designatedpoint_ts on navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = navaids_points.designatedpoint_ts.id
where designatedpoint_ts.feature_status = 'APPROVED'
order by designatedpoint.identifier, designatedpoint_ts.sequence_number, designatedpoint_ts.correction_number DESC;
create or replace view navaids_points.directionfinder_publisher_view as
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
    coalesce(cast(navaids_points.directionfinder_ts.designator_value as varchar), '(' || navaids_points.directionfinder_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.directionfinder_ts.name_value as varchar), '(' || navaids_points.directionfinder_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.directionfinder_ts.emissionclass_value as varchar), '(' || navaids_points.directionfinder_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.directionfinder_ts.mobile_value as varchar), '(' || navaids_points.directionfinder_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.directionfinder_ts.magneticvariation_value as varchar), '(' || navaids_points.directionfinder_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.directionfinder_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.directionfinder_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.directionfinder_ts.datemagneticvariation_value as varchar), '(' || navaids_points.directionfinder_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.directionfinder_ts.flightchecked_value as varchar), '(' || navaids_points.directionfinder_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.directionfinder_ts.doppler_value as varchar), '(' || navaids_points.directionfinder_ts.doppler_nilreason || ')') as doppler
from navaids_points.directionfinder 
inner join master_join mj2 on navaids_points.directionfinder.id = mj2.source_id
inner join navaids_points.directionfinder_tsp on mj2.target_id = navaids_points.directionfinder_tsp.id
inner join navaids_points.directionfinder_ts on navaids_points.directionfinder_tsp.directionfindertimeslice_id = navaids_points.directionfinder_ts.id
where directionfinder_ts.feature_status = 'APPROVED'
order by directionfinder.identifier, directionfinder_ts.sequence_number, directionfinder_ts.correction_number DESC;
create or replace view navaids_points.distanceindication_publisher_view as
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
    coalesce(cast(navaids_points.distanceindication_ts.type_value as varchar), '(' || navaids_points.distanceindication_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.distanceindication_ts.distance_value as varchar) || ' ' || navaids_points.distanceindication_ts.distance_uom, '(' || navaids_points.distanceindication_ts.distance_nilreason || ')') as distance,
    coalesce(cast(navaids_points.distanceindication_ts.minimumreceptionaltitude_value as varchar) || ' ' || navaids_points.distanceindication_ts.minimumreceptionaltitude_uom, '(' || navaids_points.distanceindication_ts.minimumreceptionaltitude_nilreason || ')') as minimumreceptionaltitude
from navaids_points.distanceindication 
inner join master_join mj2 on navaids_points.distanceindication.id = mj2.source_id
inner join navaids_points.distanceindication_tsp on mj2.target_id = navaids_points.distanceindication_tsp.id
inner join navaids_points.distanceindication_ts on navaids_points.distanceindication_tsp.distanceindicationtimeslice_id = navaids_points.distanceindication_ts.id
where distanceindication_ts.feature_status = 'APPROVED'
order by distanceindication.identifier, distanceindication_ts.sequence_number, distanceindication_ts.correction_number DESC;
create or replace view navaids_points.dme_publisher_view as
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
    coalesce(cast(navaids_points.dme_ts.displace_value as varchar) || ' ' || navaids_points.dme_ts.displace_uom, '(' || navaids_points.dme_ts.displace_nilreason || ')') as displace
from navaids_points.dme 
inner join master_join mj2 on navaids_points.dme.id = mj2.source_id
inner join navaids_points.dme_tsp on mj2.target_id = navaids_points.dme_tsp.id
inner join navaids_points.dme_ts on navaids_points.dme_tsp.dmetimeslice_id = navaids_points.dme_ts.id
where dme_ts.feature_status = 'APPROVED'
order by dme.identifier, dme_ts.sequence_number, dme_ts.correction_number DESC;
create or replace view navaids_points.elevation_publisher_view as
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
    coalesce(cast(navaids_points.elevation_ts.angleaccuracy_value as varchar), '(' || navaids_points.elevation_ts.angleaccuracy_nilreason || ')') as angleaccuracy
from navaids_points.elevation 
inner join master_join mj2 on navaids_points.elevation.id = mj2.source_id
inner join navaids_points.elevation_tsp on mj2.target_id = navaids_points.elevation_tsp.id
inner join navaids_points.elevation_ts on navaids_points.elevation_tsp.elevationtimeslice_id = navaids_points.elevation_ts.id
where elevation_ts.feature_status = 'APPROVED'
order by elevation.identifier, elevation_ts.sequence_number, elevation_ts.correction_number DESC;
create or replace view procedure.finalleg_publisher_view as
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
    coalesce(cast(procedure.finalleg_ts.courseoffsetdistance_value as varchar) || ' ' || procedure.finalleg_ts.courseoffsetdistance_uom, '(' || procedure.finalleg_ts.courseoffsetdistance_nilreason || ')') as courseoffsetdistance
from procedure.finalleg 
inner join master_join mj2 on procedure.finalleg.id = mj2.source_id
inner join procedure.finalleg_tsp on mj2.target_id = procedure.finalleg_tsp.id
inner join procedure.finalleg_ts on procedure.finalleg_tsp.finallegtimeslice_id = procedure.finalleg_ts.id
where finalleg_ts.feature_status = 'APPROVED'
order by finalleg.identifier, finalleg_ts.sequence_number, finalleg_ts.correction_number DESC;
create or replace view service.firefightingservice_publisher_view as
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
    coalesce(cast(service.firefightingservice_ts.flightoperations_value as varchar), '(' || service.firefightingservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.firefightingservice_ts.rank_value as varchar), '(' || service.firefightingservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.firefightingservice_ts.complianticao_value as varchar), '(' || service.firefightingservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.firefightingservice_ts.name_value as varchar), '(' || service.firefightingservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.firefightingservice_ts.category_value as varchar), '(' || service.firefightingservice_ts.category_nilreason || ')') as category,
    coalesce(cast(service.firefightingservice_ts.standard_value as varchar), '(' || service.firefightingservice_ts.standard_nilreason || ')') as standard
from service.firefightingservice 
inner join master_join mj2 on service.firefightingservice.id = mj2.source_id
inner join service.firefightingservice_tsp on mj2.target_id = service.firefightingservice_tsp.id
inner join service.firefightingservice_ts on service.firefightingservice_tsp.firefightingservicetimeslice_id = service.firefightingservice_ts.id
where firefightingservice_ts.feature_status = 'APPROVED'
order by firefightingservice.identifier, firefightingservice_ts.sequence_number, firefightingservice_ts.correction_number DESC;
create or replace view routes.flightrestriction_publisher_view as
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
    coalesce(cast(routes.flightrestriction_ts.designator_value as varchar), '(' || routes.flightrestriction_ts.designator_nilreason || ')') as designator,
    coalesce(cast(routes.flightrestriction_ts.type_value as varchar), '(' || routes.flightrestriction_ts.type_nilreason || ')') as type,
    coalesce(cast(routes.flightrestriction_ts.instruction_value as varchar), '(' || routes.flightrestriction_ts.instruction_nilreason || ')') as instruction
from routes.flightrestriction 
inner join master_join mj2 on routes.flightrestriction.id = mj2.source_id
inner join routes.flightrestriction_tsp on mj2.target_id = routes.flightrestriction_tsp.id
inner join routes.flightrestriction_ts on routes.flightrestriction_tsp.flightrestrictiontimeslice_id = routes.flightrestriction_ts.id
where flightrestriction_ts.feature_status = 'APPROVED'
order by flightrestriction.identifier, flightrestriction_ts.sequence_number, flightrestriction_ts.correction_number DESC;
create or replace view airport_heliport.floatingdocksite_publisher_view as
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
    airport_heliport.floatingdocksite_ts.feature_lifetime_end
from airport_heliport.floatingdocksite 
inner join master_join mj2 on airport_heliport.floatingdocksite.id = mj2.source_id
inner join airport_heliport.floatingdocksite_tsp on mj2.target_id = airport_heliport.floatingdocksite_tsp.id
inner join airport_heliport.floatingdocksite_ts on airport_heliport.floatingdocksite_tsp.floatingdocksitetimeslice_id = airport_heliport.floatingdocksite_ts.id
where floatingdocksite_ts.feature_status = 'APPROVED'
order by floatingdocksite.identifier, floatingdocksite_ts.sequence_number, floatingdocksite_ts.correction_number DESC;
create or replace view airspace.geoborder_publisher_view as
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
    coalesce(cast(airspace.geoborder_ts.name_value as varchar), '(' || airspace.geoborder_ts.name_nilreason || ')') as name,
    coalesce(cast(airspace.geoborder_ts.type_value as varchar), '(' || airspace.geoborder_ts.type_nilreason || ')') as type
from airspace.geoborder 
inner join master_join mj2 on airspace.geoborder.id = mj2.source_id
inner join airspace.geoborder_tsp on mj2.target_id = airspace.geoborder_tsp.id
inner join airspace.geoborder_ts on airspace.geoborder_tsp.geobordertimeslice_id = airspace.geoborder_ts.id
where geoborder_ts.feature_status = 'APPROVED'
order by geoborder.identifier, geoborder_ts.sequence_number, geoborder_ts.correction_number DESC;
create or replace view navaids_points.glidepath_publisher_view as
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
    coalesce(cast(navaids_points.glidepath_ts.rdhaccuracy_value as varchar) || ' ' || navaids_points.glidepath_ts.rdhaccuracy_uom, '(' || navaids_points.glidepath_ts.rdhaccuracy_nilreason || ')') as rdhaccuracy
from navaids_points.glidepath 
inner join master_join mj2 on navaids_points.glidepath.id = mj2.source_id
inner join navaids_points.glidepath_tsp on mj2.target_id = navaids_points.glidepath_tsp.id
inner join navaids_points.glidepath_ts on navaids_points.glidepath_tsp.glidepathtimeslice_id = navaids_points.glidepath_ts.id
where glidepath_ts.feature_status = 'APPROVED'
order by glidepath.identifier, glidepath_ts.sequence_number, glidepath_ts.correction_number DESC;
create or replace view service.groundtrafficcontrolservice_publisher_view as
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
    coalesce(cast(service.groundtrafficcontrolservice_ts.flightoperations_value as varchar), '(' || service.groundtrafficcontrolservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.groundtrafficcontrolservice_ts.rank_value as varchar), '(' || service.groundtrafficcontrolservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.groundtrafficcontrolservice_ts.complianticao_value as varchar), '(' || service.groundtrafficcontrolservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.groundtrafficcontrolservice_ts.name_value as varchar), '(' || service.groundtrafficcontrolservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.groundtrafficcontrolservice_ts.radarassisted_value as varchar), '(' || service.groundtrafficcontrolservice_ts.radarassisted_nilreason || ')') as radarassisted,
    coalesce(cast(service.groundtrafficcontrolservice_ts.datalinkenabled_value as varchar), '(' || service.groundtrafficcontrolservice_ts.datalinkenabled_nilreason || ')') as datalinkenabled,
    coalesce(cast(service.groundtrafficcontrolservice_ts.datalinkchannel_value as varchar), '(' || service.groundtrafficcontrolservice_ts.datalinkchannel_nilreason || ')') as datalinkchannel,
    coalesce(cast(service.groundtrafficcontrolservice_ts.type_value as varchar), '(' || service.groundtrafficcontrolservice_ts.type_nilreason || ')') as type
from service.groundtrafficcontrolservice 
inner join master_join mj2 on service.groundtrafficcontrolservice.id = mj2.source_id
inner join service.groundtrafficcontrolservice_tsp on mj2.target_id = service.groundtrafficcontrolservice_tsp.id
inner join service.groundtrafficcontrolservice_ts on service.groundtrafficcontrolservice_tsp.groundtrafficcontrolservicetimeslice_id = service.groundtrafficcontrolservice_ts.id
where groundtrafficcontrolservice_ts.feature_status = 'APPROVED'
order by groundtrafficcontrolservice.identifier, groundtrafficcontrolservice_ts.sequence_number, groundtrafficcontrolservice_ts.correction_number DESC;
create or replace view airport_heliport.guidancelinelightsystem_publisher_view as
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
    coalesce(cast(airport_heliport.guidancelinelightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.guidancelinelightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.guidancelinelightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.guidancelinelightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.guidancelinelightsystem_ts.colour_value as varchar), '(' || airport_heliport.guidancelinelightsystem_ts.colour_nilreason || ')') as colour
from airport_heliport.guidancelinelightsystem 
inner join master_join mj2 on airport_heliport.guidancelinelightsystem.id = mj2.source_id
inner join airport_heliport.guidancelinelightsystem_tsp on mj2.target_id = airport_heliport.guidancelinelightsystem_tsp.id
inner join airport_heliport.guidancelinelightsystem_ts on airport_heliport.guidancelinelightsystem_tsp.guidancelinelightsystemtimeslice_id = airport_heliport.guidancelinelightsystem_ts.id
where guidancelinelightsystem_ts.feature_status = 'APPROVED'
order by guidancelinelightsystem.identifier, guidancelinelightsystem_ts.sequence_number, guidancelinelightsystem_ts.correction_number DESC;
create or replace view airport_heliport.guidancelinemarking_publisher_view as
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
    coalesce(cast(airport_heliport.guidancelinemarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.guidancelinemarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.guidancelinemarking_ts.condition_value as varchar), '(' || airport_heliport.guidancelinemarking_ts.condition_nilreason || ')') as condition
from airport_heliport.guidancelinemarking 
inner join master_join mj2 on airport_heliport.guidancelinemarking.id = mj2.source_id
inner join airport_heliport.guidancelinemarking_tsp on mj2.target_id = airport_heliport.guidancelinemarking_tsp.id
inner join airport_heliport.guidancelinemarking_ts on airport_heliport.guidancelinemarking_tsp.guidancelinemarkingtimeslice_id = airport_heliport.guidancelinemarking_ts.id
where guidancelinemarking_ts.feature_status = 'APPROVED'
order by guidancelinemarking.identifier, guidancelinemarking_ts.sequence_number, guidancelinemarking_ts.correction_number DESC;
create or replace view airport_heliport.guidanceline_publisher_view as
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
    coalesce(cast(airport_heliport.guidanceline_ts.designator_value as varchar), '(' || airport_heliport.guidanceline_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.guidanceline_ts.type_value as varchar), '(' || airport_heliport.guidanceline_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.guidanceline_ts.usagedirection_value as varchar), '(' || airport_heliport.guidanceline_ts.usagedirection_nilreason || ')') as usagedirection,
    coalesce(cast(airport_heliport.guidanceline_ts.maxspeed_value as varchar) || ' ' || airport_heliport.guidanceline_ts.maxspeed_uom, '(' || airport_heliport.guidanceline_ts.maxspeed_nilreason || ')') as maxspeed
from airport_heliport.guidanceline 
inner join master_join mj2 on airport_heliport.guidanceline.id = mj2.source_id
inner join airport_heliport.guidanceline_tsp on mj2.target_id = airport_heliport.guidanceline_tsp.id
inner join airport_heliport.guidanceline_ts on airport_heliport.guidanceline_tsp.guidancelinetimeslice_id = airport_heliport.guidanceline_ts.id
where guidanceline_ts.feature_status = 'APPROVED'
order by guidanceline.identifier, guidanceline_ts.sequence_number, guidanceline_ts.correction_number DESC;
create or replace view shared.holdingassessment_publisher_view as
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
    coalesce(cast(shared.holdingassessment_ts.upperlimitreference_value as varchar), '(' || shared.holdingassessment_ts.upperlimitreference_nilreason || ')') as upperlimitreference,
    coalesce(cast(shared.holdingassessment_ts.lowerlimitreference_value as varchar), '(' || shared.holdingassessment_ts.lowerlimitreference_nilreason || ')') as lowerlimitreference,
    coalesce(cast(shared.holdingassessment_ts.patterntemplate_value as varchar), '(' || shared.holdingassessment_ts.patterntemplate_nilreason || ')') as patterntemplate,
    coalesce(cast(shared.holdingassessment_ts.turbulentair_value as varchar), '(' || shared.holdingassessment_ts.turbulentair_nilreason || ')') as turbulentair,
    coalesce(cast(shared.holdingassessment_ts.upperlimit_value as varchar) || ' ' || shared.holdingassessment_ts.upperlimit_uom, '(' || shared.holdingassessment_ts.upperlimit_nilreason || ')') as upperlimit,
    coalesce(cast(shared.holdingassessment_ts.lowerlimit_value as varchar) || ' ' || shared.holdingassessment_ts.lowerlimit_uom, '(' || shared.holdingassessment_ts.lowerlimit_nilreason || ')') as lowerlimit,
    coalesce(cast(shared.holdingassessment_ts.speedlimit_value as varchar) || ' ' || shared.holdingassessment_ts.speedlimit_uom, '(' || shared.holdingassessment_ts.speedlimit_nilreason || ')') as speedlimit,
    coalesce(cast(shared.holdingassessment_ts.leglengthtoward_value as varchar) || ' ' || shared.holdingassessment_ts.leglengthtoward_uom, '(' || shared.holdingassessment_ts.leglengthtoward_nilreason || ')') as leglengthtoward,
    coalesce(cast(shared.holdingassessment_ts.leglengthaway_value as varchar) || ' ' || shared.holdingassessment_ts.leglengthaway_uom, '(' || shared.holdingassessment_ts.leglengthaway_nilreason || ')') as leglengthaway
from shared.holdingassessment 
inner join master_join mj2 on shared.holdingassessment.id = mj2.source_id
inner join shared.holdingassessment_tsp on mj2.target_id = shared.holdingassessment_tsp.id
inner join shared.holdingassessment_ts on shared.holdingassessment_tsp.holdingassessmenttimeslice_id = shared.holdingassessment_ts.id
where holdingassessment_ts.feature_status = 'APPROVED'
order by holdingassessment.identifier, holdingassessment_ts.sequence_number, holdingassessment_ts.correction_number DESC;
create or replace view holding.holdingpattern_publisher_view as
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
    coalesce(cast(holding.holdingpattern_ts.speedlimit_value as varchar) || ' ' || holding.holdingpattern_ts.speedlimit_uom, '(' || holding.holdingpattern_ts.speedlimit_nilreason || ')') as speedlimit
from holding.holdingpattern 
inner join master_join mj2 on holding.holdingpattern.id = mj2.source_id
inner join holding.holdingpattern_tsp on mj2.target_id = holding.holdingpattern_tsp.id
inner join holding.holdingpattern_ts on holding.holdingpattern_tsp.holdingpatterntimeslice_id = holding.holdingpattern_ts.id
where holdingpattern_ts.feature_status = 'APPROVED'
order by holdingpattern.identifier, holdingpattern_ts.sequence_number, holdingpattern_ts.correction_number DESC;
create or replace view service.informationservice_publisher_view as
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
    coalesce(cast(service.informationservice_ts.flightoperations_value as varchar), '(' || service.informationservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.informationservice_ts.rank_value as varchar), '(' || service.informationservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.informationservice_ts.complianticao_value as varchar), '(' || service.informationservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.informationservice_ts.name_value as varchar), '(' || service.informationservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.informationservice_ts.type_value as varchar), '(' || service.informationservice_ts.type_nilreason || ')') as type,
    coalesce(cast(service.informationservice_ts.voice_value as varchar), '(' || service.informationservice_ts.voice_nilreason || ')') as voice,
    coalesce(cast(service.informationservice_ts.datalink_value as varchar), '(' || service.informationservice_ts.datalink_nilreason || ')') as datalink,
    coalesce(cast(service.informationservice_ts.recorded_value as varchar), '(' || service.informationservice_ts.recorded_nilreason || ')') as recorded
from service.informationservice 
inner join master_join mj2 on service.informationservice.id = mj2.source_id
inner join service.informationservice_tsp on mj2.target_id = service.informationservice_tsp.id
inner join service.informationservice_ts on service.informationservice_tsp.informationservicetimeslice_id = service.informationservice_ts.id
where informationservice_ts.feature_status = 'APPROVED'
order by informationservice.identifier, informationservice_ts.sequence_number, informationservice_ts.correction_number DESC;
create or replace view procedure.initialleg_publisher_view as
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
    coalesce(cast(procedure.initialleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.initialleg_ts.altitudeoverrideatc_uom, '(' || procedure.initialleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc
from procedure.initialleg 
inner join master_join mj2 on procedure.initialleg.id = mj2.source_id
inner join procedure.initialleg_tsp on mj2.target_id = procedure.initialleg_tsp.id
inner join procedure.initialleg_ts on procedure.initialleg_tsp.initiallegtimeslice_id = procedure.initialleg_ts.id
where initialleg_ts.feature_status = 'APPROVED'
order by initialleg.identifier, initialleg_ts.sequence_number, initialleg_ts.correction_number DESC;
create or replace view procedure.instrumentapproachprocedure_publisher_view as
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
    coalesce(cast(procedure.instrumentapproachprocedure_ts.waasreliable_value as varchar), '(' || procedure.instrumentapproachprocedure_ts.waasreliable_nilreason || ')') as waasreliable
from procedure.instrumentapproachprocedure 
inner join master_join mj2 on procedure.instrumentapproachprocedure.id = mj2.source_id
inner join procedure.instrumentapproachprocedure_tsp on mj2.target_id = procedure.instrumentapproachprocedure_tsp.id
inner join procedure.instrumentapproachprocedure_ts on procedure.instrumentapproachprocedure_tsp.instrumentapproachproceduretimeslice_id = procedure.instrumentapproachprocedure_ts.id
where instrumentapproachprocedure_ts.feature_status = 'APPROVED'
order by instrumentapproachprocedure.identifier, instrumentapproachprocedure_ts.sequence_number, instrumentapproachprocedure_ts.correction_number DESC;
create or replace view procedure.intermediateleg_publisher_view as
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
    coalesce(cast(procedure.intermediateleg_ts.altitudeoverrideatc_value as varchar) || ' ' || procedure.intermediateleg_ts.altitudeoverrideatc_uom, '(' || procedure.intermediateleg_ts.altitudeoverrideatc_nilreason || ')') as altitudeoverrideatc
from procedure.intermediateleg 
inner join master_join mj2 on procedure.intermediateleg.id = mj2.source_id
inner join procedure.intermediateleg_tsp on mj2.target_id = procedure.intermediateleg_tsp.id
inner join procedure.intermediateleg_ts on procedure.intermediateleg_tsp.intermediatelegtimeslice_id = procedure.intermediateleg_ts.id
where intermediateleg_ts.feature_status = 'APPROVED'
order by intermediateleg.identifier, intermediateleg_ts.sequence_number, intermediateleg_ts.correction_number DESC;
create or replace view navaids_points.localizer_publisher_view as
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
    coalesce(cast(navaids_points.localizer_ts.frequency_value as varchar) || ' ' || navaids_points.localizer_ts.frequency_uom, '(' || navaids_points.localizer_ts.frequency_nilreason || ')') as frequency
from navaids_points.localizer 
inner join master_join mj2 on navaids_points.localizer.id = mj2.source_id
inner join navaids_points.localizer_tsp on mj2.target_id = navaids_points.localizer_tsp.id
inner join navaids_points.localizer_ts on navaids_points.localizer_tsp.localizertimeslice_id = navaids_points.localizer_ts.id
where localizer_ts.feature_status = 'APPROVED'
order by localizer.identifier, localizer_ts.sequence_number, localizer_ts.correction_number DESC;
create or replace view navaids_points.markerbeacon_publisher_view as
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
    coalesce(cast(navaids_points.markerbeacon_ts.frequency_value as varchar) || ' ' || navaids_points.markerbeacon_ts.frequency_uom, '(' || navaids_points.markerbeacon_ts.frequency_nilreason || ')') as frequency
from navaids_points.markerbeacon 
inner join master_join mj2 on navaids_points.markerbeacon.id = mj2.source_id
inner join navaids_points.markerbeacon_tsp on mj2.target_id = navaids_points.markerbeacon_tsp.id
inner join navaids_points.markerbeacon_ts on navaids_points.markerbeacon_tsp.markerbeacontimeslice_id = navaids_points.markerbeacon_ts.id
where markerbeacon_ts.feature_status = 'APPROVED'
order by markerbeacon.identifier, markerbeacon_ts.sequence_number, markerbeacon_ts.correction_number DESC;
create or replace view airport_heliport.markingbuoy_publisher_view as
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
    coalesce(cast(airport_heliport.markingbuoy_ts.type_value as varchar), '(' || airport_heliport.markingbuoy_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.markingbuoy_ts.colour_value as varchar), '(' || airport_heliport.markingbuoy_ts.colour_nilreason || ')') as colour
from airport_heliport.markingbuoy 
inner join master_join mj2 on airport_heliport.markingbuoy.id = mj2.source_id
inner join airport_heliport.markingbuoy_tsp on mj2.target_id = airport_heliport.markingbuoy_tsp.id
inner join airport_heliport.markingbuoy_ts on airport_heliport.markingbuoy_tsp.markingbuoytimeslice_id = airport_heliport.markingbuoy_ts.id
where markingbuoy_ts.feature_status = 'APPROVED'
order by markingbuoy.identifier, markingbuoy_ts.sequence_number, markingbuoy_ts.correction_number DESC;
create or replace view procedure.missedapproachleg_publisher_view as
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
    coalesce(cast(procedure.missedapproachleg_ts.heightmapt_value as varchar) || ' ' || procedure.missedapproachleg_ts.heightmapt_uom, '(' || procedure.missedapproachleg_ts.heightmapt_nilreason || ')') as heightmapt
from procedure.missedapproachleg 
inner join master_join mj2 on procedure.missedapproachleg.id = mj2.source_id
inner join procedure.missedapproachleg_tsp on mj2.target_id = procedure.missedapproachleg_tsp.id
inner join procedure.missedapproachleg_ts on procedure.missedapproachleg_tsp.missedapproachlegtimeslice_id = procedure.missedapproachleg_ts.id
where missedapproachleg_ts.feature_status = 'APPROVED'
order by missedapproachleg.identifier, missedapproachleg_ts.sequence_number, missedapproachleg_ts.correction_number DESC;
create or replace view navaids_points.navaid_publisher_view as
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
    coalesce(cast(navaids_points.navaid_ts.type_value as varchar), '(' || navaids_points.navaid_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.navaid_ts.designator_value as varchar), '(' || navaids_points.navaid_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.navaid_ts.name_value as varchar), '(' || navaids_points.navaid_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.navaid_ts.flightchecked_value as varchar), '(' || navaids_points.navaid_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.navaid_ts.purpose_value as varchar), '(' || navaids_points.navaid_ts.purpose_nilreason || ')') as purpose,
    coalesce(cast(navaids_points.navaid_ts.signalperformance_value as varchar), '(' || navaids_points.navaid_ts.signalperformance_nilreason || ')') as signalperformance,
    coalesce(cast(navaids_points.navaid_ts.coursequality_value as varchar), '(' || navaids_points.navaid_ts.coursequality_nilreason || ')') as coursequality,
    coalesce(cast(navaids_points.navaid_ts.integritylevel_value as varchar), '(' || navaids_points.navaid_ts.integritylevel_nilreason || ')') as integritylevel
from navaids_points.navaid 
inner join master_join mj2 on navaids_points.navaid.id = mj2.source_id
inner join navaids_points.navaid_tsp on mj2.target_id = navaids_points.navaid_tsp.id
inner join navaids_points.navaid_ts on navaids_points.navaid_tsp.navaidtimeslice_id = navaids_points.navaid_ts.id
where navaid_ts.feature_status = 'APPROVED'
order by navaid.identifier, navaid_ts.sequence_number, navaid_ts.correction_number DESC;
create or replace view procedure.navigationarearestriction_publisher_view as
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
    coalesce(cast(procedure.navigationarearestriction_ts.type_value as varchar), '(' || procedure.navigationarearestriction_ts.type_nilreason || ')') as type
from procedure.navigationarearestriction 
inner join master_join mj2 on procedure.navigationarearestriction.id = mj2.source_id
inner join procedure.navigationarearestriction_tsp on mj2.target_id = procedure.navigationarearestriction_tsp.id
inner join procedure.navigationarearestriction_ts on procedure.navigationarearestriction_tsp.navigationarearestrictiontimeslice_id = procedure.navigationarearestriction_ts.id
where navigationarearestriction_ts.feature_status = 'APPROVED'
order by navigationarearestriction.identifier, navigationarearestriction_ts.sequence_number, navigationarearestriction_ts.correction_number DESC;
create or replace view procedure.navigationarea_publisher_view as
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
    coalesce(cast(procedure.navigationarea_ts.navigationareatype_value as varchar), '(' || procedure.navigationarea_ts.navigationareatype_nilreason || ')') as navigationareatype,
    coalesce(cast(procedure.navigationarea_ts.minimumceiling_value as varchar) || ' ' || procedure.navigationarea_ts.minimumceiling_uom, '(' || procedure.navigationarea_ts.minimumceiling_nilreason || ')') as minimumceiling,
    coalesce(cast(procedure.navigationarea_ts.minimumvisibility_value as varchar) || ' ' || procedure.navigationarea_ts.minimumvisibility_uom, '(' || procedure.navigationarea_ts.minimumvisibility_nilreason || ')') as minimumvisibility
from procedure.navigationarea 
inner join master_join mj2 on procedure.navigationarea.id = mj2.source_id
inner join procedure.navigationarea_tsp on mj2.target_id = procedure.navigationarea_tsp.id
inner join procedure.navigationarea_ts on procedure.navigationarea_tsp.navigationareatimeslice_id = procedure.navigationarea_ts.id
where navigationarea_ts.feature_status = 'APPROVED'
order by navigationarea.identifier, navigationarea_ts.sequence_number, navigationarea_ts.correction_number DESC;
create or replace view navaids_points.ndb_publisher_view as
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
    coalesce(cast(navaids_points.ndb_ts.frequency_value as varchar) || ' ' || navaids_points.ndb_ts.frequency_uom, '(' || navaids_points.ndb_ts.frequency_nilreason || ')') as frequency
from navaids_points.ndb 
inner join master_join mj2 on navaids_points.ndb.id = mj2.source_id
inner join navaids_points.ndb_tsp on mj2.target_id = navaids_points.ndb_tsp.id
inner join navaids_points.ndb_ts on navaids_points.ndb_tsp.ndbtimeslice_id = navaids_points.ndb_ts.id
where ndb_ts.feature_status = 'APPROVED'
order by ndb.identifier, ndb_ts.sequence_number, ndb_ts.correction_number DESC;
create or replace view airport_heliport.nonmovementarea_publisher_view as
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
    airport_heliport.nonmovementarea_ts.feature_lifetime_end
from airport_heliport.nonmovementarea 
inner join master_join mj2 on airport_heliport.nonmovementarea.id = mj2.source_id
inner join airport_heliport.nonmovementarea_tsp on mj2.target_id = airport_heliport.nonmovementarea_tsp.id
inner join airport_heliport.nonmovementarea_ts on airport_heliport.nonmovementarea_tsp.nonmovementareatimeslice_id = airport_heliport.nonmovementarea_ts.id
where nonmovementarea_ts.feature_status = 'APPROVED'
order by nonmovementarea.identifier, nonmovementarea_ts.sequence_number, nonmovementarea_ts.correction_number DESC;
create or replace view obstacles.obstaclearea_publisher_view as
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
    coalesce(cast(obstacles.obstaclearea_ts.type_value as varchar), '(' || obstacles.obstaclearea_ts.type_nilreason || ')') as type,
    coalesce(cast(obstacles.obstaclearea_ts.obstructionidsurfacecondition_value as varchar), '(' || obstacles.obstaclearea_ts.obstructionidsurfacecondition_nilreason || ')') as obstructionidsurfacecondition
from obstacles.obstaclearea 
inner join master_join mj2 on obstacles.obstaclearea.id = mj2.source_id
inner join obstacles.obstaclearea_tsp on mj2.target_id = obstacles.obstaclearea_tsp.id
inner join obstacles.obstaclearea_ts on obstacles.obstaclearea_tsp.obstacleareatimeslice_id = obstacles.obstaclearea_ts.id
where obstaclearea_ts.feature_status = 'APPROVED'
order by obstaclearea.identifier, obstaclearea_ts.sequence_number, obstaclearea_ts.correction_number DESC;
create or replace view organisation.organisationauthority_publisher_view as
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
    coalesce(cast(organisation.organisationauthority_ts.name_value as varchar), '(' || organisation.organisationauthority_ts.name_nilreason || ')') as name,
    coalesce(cast(organisation.organisationauthority_ts.designator_value as varchar), '(' || organisation.organisationauthority_ts.designator_nilreason || ')') as designator,
    coalesce(cast(organisation.organisationauthority_ts.type_value as varchar), '(' || organisation.organisationauthority_ts.type_nilreason || ')') as type,
    coalesce(cast(organisation.organisationauthority_ts.military_value as varchar), '(' || organisation.organisationauthority_ts.military_nilreason || ')') as military
from organisation.organisationauthority 
inner join master_join mj2 on organisation.organisationauthority.id = mj2.source_id
inner join organisation.organisationauthority_tsp on mj2.target_id = organisation.organisationauthority_tsp.id
inner join organisation.organisationauthority_ts on organisation.organisationauthority_tsp.organisationauthoritytimeslice_id = organisation.organisationauthority_ts.id
where organisationauthority_ts.feature_status = 'APPROVED'
order by organisationauthority.identifier, organisationauthority_ts.sequence_number, organisationauthority_ts.correction_number DESC;
create or replace view airport_heliport.passengerloadingbridge_publisher_view as
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
    coalesce(cast(airport_heliport.passengerloadingbridge_ts.type_value as varchar), '(' || airport_heliport.passengerloadingbridge_ts.type_nilreason || ')') as type
from airport_heliport.passengerloadingbridge 
inner join master_join mj2 on airport_heliport.passengerloadingbridge.id = mj2.source_id
inner join airport_heliport.passengerloadingbridge_tsp on mj2.target_id = airport_heliport.passengerloadingbridge_tsp.id
inner join airport_heliport.passengerloadingbridge_ts on airport_heliport.passengerloadingbridge_tsp.passengerloadingbridgetimeslice_id = airport_heliport.passengerloadingbridge_ts.id
where passengerloadingbridge_ts.feature_status = 'APPROVED'
order by passengerloadingbridge.identifier, passengerloadingbridge_ts.sequence_number, passengerloadingbridge_ts.correction_number DESC;
create or replace view service.passengerservice_publisher_view as
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
    coalesce(cast(service.passengerservice_ts.flightoperations_value as varchar), '(' || service.passengerservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.passengerservice_ts.rank_value as varchar), '(' || service.passengerservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.passengerservice_ts.complianticao_value as varchar), '(' || service.passengerservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.passengerservice_ts.name_value as varchar), '(' || service.passengerservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.passengerservice_ts.type_value as varchar), '(' || service.passengerservice_ts.type_nilreason || ')') as type
from service.passengerservice 
inner join master_join mj2 on service.passengerservice.id = mj2.source_id
inner join service.passengerservice_tsp on mj2.target_id = service.passengerservice_tsp.id
inner join service.passengerservice_ts on service.passengerservice_tsp.passengerservicetimeslice_id = service.passengerservice_ts.id
where passengerservice_ts.feature_status = 'APPROVED'
order by passengerservice.identifier, passengerservice_ts.sequence_number, passengerservice_ts.correction_number DESC;
create or replace view service.pilotcontrolledlighting_publisher_view as
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
    coalesce(cast(service.pilotcontrolledlighting_ts.type_value as varchar), '(' || service.pilotcontrolledlighting_ts.type_nilreason || ')') as type,
    coalesce(cast(service.pilotcontrolledlighting_ts.intensitysteps_value as varchar), '(' || service.pilotcontrolledlighting_ts.intensitysteps_nilreason || ')') as intensitysteps,
    coalesce(cast(service.pilotcontrolledlighting_ts.standbyintensity_value as varchar), '(' || service.pilotcontrolledlighting_ts.standbyintensity_nilreason || ')') as standbyintensity,
    coalesce(cast(service.pilotcontrolledlighting_ts.activationinstruction_value as varchar), '(' || service.pilotcontrolledlighting_ts.activationinstruction_nilreason || ')') as activationinstruction,
    coalesce(cast(service.pilotcontrolledlighting_ts.duration_value as varchar) || ' ' || service.pilotcontrolledlighting_ts.duration_uom, '(' || service.pilotcontrolledlighting_ts.duration_nilreason || ')') as duration,
    coalesce(cast(service.pilotcontrolledlighting_ts.radiofrequency_value as varchar) || ' ' || service.pilotcontrolledlighting_ts.radiofrequency_uom, '(' || service.pilotcontrolledlighting_ts.radiofrequency_nilreason || ')') as radiofrequency
from service.pilotcontrolledlighting 
inner join master_join mj2 on service.pilotcontrolledlighting.id = mj2.source_id
inner join service.pilotcontrolledlighting_tsp on mj2.target_id = service.pilotcontrolledlighting_tsp.id
inner join service.pilotcontrolledlighting_ts on service.pilotcontrolledlighting_tsp.pilotcontrolledlightingtimeslice_id = service.pilotcontrolledlighting_ts.id
where pilotcontrolledlighting_ts.feature_status = 'APPROVED'
order by pilotcontrolledlighting.identifier, pilotcontrolledlighting_ts.sequence_number, pilotcontrolledlighting_ts.correction_number DESC;
create or replace view surveillance.precisionapproachradar_publisher_view as
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
    coalesce(cast(surveillance.precisionapproachradar_ts.rangeaccuracy_value as varchar) || ' ' || surveillance.precisionapproachradar_ts.rangeaccuracy_uom, '(' || surveillance.precisionapproachradar_ts.rangeaccuracy_nilreason || ')') as rangeaccuracy
from surveillance.precisionapproachradar 
inner join master_join mj2 on surveillance.precisionapproachradar.id = mj2.source_id
inner join surveillance.precisionapproachradar_tsp on mj2.target_id = surveillance.precisionapproachradar_tsp.id
inner join surveillance.precisionapproachradar_ts on surveillance.precisionapproachradar_tsp.precisionapproachradartimeslice_id = surveillance.precisionapproachradar_ts.id
where precisionapproachradar_ts.feature_status = 'APPROVED'
order by precisionapproachradar.identifier, precisionapproachradar_ts.sequence_number, precisionapproachradar_ts.correction_number DESC;
create or replace view surveillance.primarysurveillanceradar_publisher_view as
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
    coalesce(cast(surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_value as varchar) || ' ' || surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_uom, '(' || surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_nilreason || ')') as verticalcoveragedistance
from surveillance.primarysurveillanceradar 
inner join master_join mj2 on surveillance.primarysurveillanceradar.id = mj2.source_id
inner join surveillance.primarysurveillanceradar_tsp on mj2.target_id = surveillance.primarysurveillanceradar_tsp.id
inner join surveillance.primarysurveillanceradar_ts on surveillance.primarysurveillanceradar_tsp.primarysurveillanceradartimeslice_id = surveillance.primarysurveillanceradar_ts.id
where primarysurveillanceradar_ts.feature_status = 'APPROVED'
order by primarysurveillanceradar.identifier, primarysurveillanceradar_ts.sequence_number, primarysurveillanceradar_ts.correction_number DESC;
create or replace view procedure.proceduredme_publisher_view as
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
    coalesce(cast(procedure.proceduredme_ts.criticaldme_value as varchar), '(' || procedure.proceduredme_ts.criticaldme_nilreason || ')') as criticaldme,
    coalesce(cast(procedure.proceduredme_ts.satisfactory_value as varchar), '(' || procedure.proceduredme_ts.satisfactory_nilreason || ')') as satisfactory
from procedure.proceduredme 
inner join master_join mj2 on procedure.proceduredme.id = mj2.source_id
inner join procedure.proceduredme_tsp on mj2.target_id = procedure.proceduredme_tsp.id
inner join procedure.proceduredme_ts on procedure.proceduredme_tsp.proceduredmetimeslice_id = procedure.proceduredme_ts.id
where proceduredme_ts.feature_status = 'APPROVED'
order by proceduredme.identifier, proceduredme_ts.sequence_number, proceduredme_ts.correction_number DESC;
create or replace view surveillance.radarsystem_publisher_view as
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
    coalesce(cast(surveillance.radarsystem_ts.type_value as varchar), '(' || surveillance.radarsystem_ts.type_nilreason || ')') as type,
    coalesce(cast(surveillance.radarsystem_ts.model_value as varchar), '(' || surveillance.radarsystem_ts.model_nilreason || ')') as model,
    coalesce(cast(surveillance.radarsystem_ts.generalterrainmonitor_value as varchar), '(' || surveillance.radarsystem_ts.generalterrainmonitor_nilreason || ')') as generalterrainmonitor,
    coalesce(cast(surveillance.radarsystem_ts.broadcastidentifier_value as varchar), '(' || surveillance.radarsystem_ts.broadcastidentifier_nilreason || ')') as broadcastidentifier
from surveillance.radarsystem 
inner join master_join mj2 on surveillance.radarsystem.id = mj2.source_id
inner join surveillance.radarsystem_tsp on mj2.target_id = surveillance.radarsystem_tsp.id
inner join surveillance.radarsystem_ts on surveillance.radarsystem_tsp.radarsystemtimeslice_id = surveillance.radarsystem_ts.id
where radarsystem_ts.feature_status = 'APPROVED'
order by radarsystem.identifier, radarsystem_ts.sequence_number, radarsystem_ts.correction_number DESC;
create or replace view service.radiocommunicationchannel_publisher_view as
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
    coalesce(cast(service.radiocommunicationchannel_ts.mode_value as varchar), '(' || service.radiocommunicationchannel_ts.mode_nilreason || ')') as mode,
    coalesce(cast(service.radiocommunicationchannel_ts.rank_value as varchar), '(' || service.radiocommunicationchannel_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.radiocommunicationchannel_ts.channel_value as varchar), '(' || service.radiocommunicationchannel_ts.channel_nilreason || ')') as channel,
    coalesce(cast(service.radiocommunicationchannel_ts.logon_value as varchar), '(' || service.radiocommunicationchannel_ts.logon_nilreason || ')') as logon,
    coalesce(cast(service.radiocommunicationchannel_ts.emissiontype_value as varchar), '(' || service.radiocommunicationchannel_ts.emissiontype_nilreason || ')') as emissiontype,
    coalesce(cast(service.radiocommunicationchannel_ts.selectivecall_value as varchar), '(' || service.radiocommunicationchannel_ts.selectivecall_nilreason || ')') as selectivecall,
    coalesce(cast(service.radiocommunicationchannel_ts.flightchecked_value as varchar), '(' || service.radiocommunicationchannel_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(service.radiocommunicationchannel_ts.trafficdirection_value as varchar), '(' || service.radiocommunicationchannel_ts.trafficdirection_nilreason || ')') as trafficdirection,
    coalesce(cast(service.radiocommunicationchannel_ts.frequencytransmission_value as varchar) || ' ' || service.radiocommunicationchannel_ts.frequencytransmission_uom, '(' || service.radiocommunicationchannel_ts.frequencytransmission_nilreason || ')') as frequencytransmission,
    coalesce(cast(service.radiocommunicationchannel_ts.frequencyreception_value as varchar) || ' ' || service.radiocommunicationchannel_ts.frequencyreception_uom, '(' || service.radiocommunicationchannel_ts.frequencyreception_nilreason || ')') as frequencyreception
from service.radiocommunicationchannel 
inner join master_join mj2 on service.radiocommunicationchannel.id = mj2.source_id
inner join service.radiocommunicationchannel_tsp on mj2.target_id = service.radiocommunicationchannel_tsp.id
inner join service.radiocommunicationchannel_ts on service.radiocommunicationchannel_tsp.radiocommunicationchanneltimeslice_id = service.radiocommunicationchannel_ts.id
where radiocommunicationchannel_ts.feature_status = 'APPROVED'
order by radiocommunicationchannel.identifier, radiocommunicationchannel_ts.sequence_number, radiocommunicationchannel_ts.correction_number DESC;
create or replace view shared.radiofrequencyarea_publisher_view as
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
    coalesce(cast(shared.radiofrequencyarea_ts.type_value as varchar), '(' || shared.radiofrequencyarea_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.radiofrequencyarea_ts.anglescallop_value as varchar), '(' || shared.radiofrequencyarea_ts.anglescallop_nilreason || ')') as anglescallop,
    coalesce(cast(shared.radiofrequencyarea_ts.signaltype_value as varchar), '(' || shared.radiofrequencyarea_ts.signaltype_nilreason || ')') as signaltype
from shared.radiofrequencyarea 
inner join master_join mj2 on shared.radiofrequencyarea.id = mj2.source_id
inner join shared.radiofrequencyarea_tsp on mj2.target_id = shared.radiofrequencyarea_tsp.id
inner join shared.radiofrequencyarea_ts on shared.radiofrequencyarea_tsp.radiofrequencyareatimeslice_id = shared.radiofrequencyarea_ts.id
where radiofrequencyarea_ts.feature_status = 'APPROVED'
order by radiofrequencyarea.identifier, radiofrequencyarea_ts.sequence_number, radiofrequencyarea_ts.correction_number DESC;
create or replace view airport_heliport.road_publisher_view as
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
    coalesce(cast(airport_heliport.road_ts.designator_value as varchar), '(' || airport_heliport.road_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.road_ts.status_value as varchar), '(' || airport_heliport.road_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.road_ts.type_value as varchar), '(' || airport_heliport.road_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.road_ts.abandoned_value as varchar), '(' || airport_heliport.road_ts.abandoned_nilreason || ')') as abandoned
from airport_heliport.road 
inner join master_join mj2 on airport_heliport.road.id = mj2.source_id
inner join airport_heliport.road_tsp on mj2.target_id = airport_heliport.road_tsp.id
inner join airport_heliport.road_ts on airport_heliport.road_tsp.roadtimeslice_id = airport_heliport.road_ts.id
where road_ts.feature_status = 'APPROVED'
order by road.identifier, road_ts.sequence_number, road_ts.correction_number DESC;
create or replace view routes.routedme_publisher_view as
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
    coalesce(cast(routes.routedme_ts.criticaldme_value as varchar), '(' || routes.routedme_ts.criticaldme_nilreason || ')') as criticaldme,
    coalesce(cast(routes.routedme_ts.satisfactory_value as varchar), '(' || routes.routedme_ts.satisfactory_nilreason || ')') as satisfactory
from routes.routedme 
inner join master_join mj2 on routes.routedme.id = mj2.source_id
inner join routes.routedme_tsp on mj2.target_id = routes.routedme_tsp.id
inner join routes.routedme_ts on routes.routedme_tsp.routedmetimeslice_id = routes.routedme_ts.id
where routedme_ts.feature_status = 'APPROVED'
order by routedme.identifier, routedme_ts.sequence_number, routedme_ts.correction_number DESC;
create or replace view routes.routesegment_publisher_view as
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
    coalesce(cast(routes.routesegment_ts.maximumcrossingatend_value as varchar) || ' ' || routes.routesegment_ts.maximumcrossingatend_uom, '(' || routes.routesegment_ts.maximumcrossingatend_nilreason || ')') as maximumcrossingatend
from routes.routesegment 
inner join master_join mj2 on routes.routesegment.id = mj2.source_id
inner join routes.routesegment_tsp on mj2.target_id = routes.routesegment_tsp.id
inner join routes.routesegment_ts on routes.routesegment_tsp.routesegmenttimeslice_id = routes.routesegment_ts.id
where routesegment_ts.feature_status = 'APPROVED'
order by routesegment.identifier, routesegment_ts.sequence_number, routesegment_ts.correction_number DESC;
create or replace view routes.route_publisher_view as
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
    coalesce(cast(routes.route_ts.militarytrainingtype_value as varchar), '(' || routes.route_ts.militarytrainingtype_nilreason || ')') as militarytrainingtype
from routes.route 
inner join master_join mj2 on routes.route.id = mj2.source_id
inner join routes.route_tsp on mj2.target_id = routes.route_tsp.id
inner join routes.route_ts on routes.route_tsp.routetimeslice_id = routes.route_ts.id
where route_ts.feature_status = 'APPROVED'
order by route.identifier, route_ts.sequence_number, route_ts.correction_number DESC;
create or replace view rules_procedures.rulesprocedures_publisher_view as
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
    coalesce(cast(rules_procedures.rulesprocedures_ts.category_value as varchar), '(' || rules_procedures.rulesprocedures_ts.category_nilreason || ')') as category,
    coalesce(cast(rules_procedures.rulesprocedures_ts.title_value as varchar), '(' || rules_procedures.rulesprocedures_ts.title_nilreason || ')') as title
from rules_procedures.rulesprocedures 
inner join master_join mj2 on rules_procedures.rulesprocedures.id = mj2.source_id
inner join rules_procedures.rulesprocedures_tsp on mj2.target_id = rules_procedures.rulesprocedures_tsp.id
inner join rules_procedures.rulesprocedures_ts on rules_procedures.rulesprocedures_tsp.rulesprocedurestimeslice_id = rules_procedures.rulesprocedures_ts.id
where rulesprocedures_ts.feature_status = 'APPROVED'
order by rulesprocedures.identifier, rulesprocedures_ts.sequence_number, rulesprocedures_ts.correction_number DESC;
create or replace view airport_heliport.runwayblastpad_publisher_view as
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
    coalesce(cast(airport_heliport.runwayblastpad_ts.status_value as varchar), '(' || airport_heliport.runwayblastpad_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.runwayblastpad_ts.length_value as varchar) || ' ' || airport_heliport.runwayblastpad_ts.length_uom, '(' || airport_heliport.runwayblastpad_ts.length_nilreason || ')') as length
from airport_heliport.runwayblastpad 
inner join master_join mj2 on airport_heliport.runwayblastpad.id = mj2.source_id
inner join airport_heliport.runwayblastpad_tsp on mj2.target_id = airport_heliport.runwayblastpad_tsp.id
inner join airport_heliport.runwayblastpad_ts on airport_heliport.runwayblastpad_tsp.runwayblastpadtimeslice_id = airport_heliport.runwayblastpad_ts.id
where runwayblastpad_ts.feature_status = 'APPROVED'
order by runwayblastpad.identifier, runwayblastpad_ts.sequence_number, runwayblastpad_ts.correction_number DESC;
create or replace view airport_heliport.runwaycentrelinepoint_publisher_view as
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
    coalesce(cast(airport_heliport.runwaycentrelinepoint_ts.role_value as varchar), '(' || airport_heliport.runwaycentrelinepoint_ts.role_nilreason || ')') as role,
    coalesce(cast(airport_heliport.runwaycentrelinepoint_ts.designator_value as varchar), '(' || airport_heliport.runwaycentrelinepoint_ts.designator_nilreason || ')') as designator
from airport_heliport.runwaycentrelinepoint 
inner join master_join mj2 on airport_heliport.runwaycentrelinepoint.id = mj2.source_id
inner join airport_heliport.runwaycentrelinepoint_tsp on mj2.target_id = airport_heliport.runwaycentrelinepoint_tsp.id
inner join airport_heliport.runwaycentrelinepoint_ts on airport_heliport.runwaycentrelinepoint_tsp.runwaycentrelinepointtimeslice_id = airport_heliport.runwaycentrelinepoint_ts.id
where runwaycentrelinepoint_ts.feature_status = 'APPROVED'
order by runwaycentrelinepoint.identifier, runwaycentrelinepoint_ts.sequence_number, runwaycentrelinepoint_ts.correction_number DESC;
create or replace view airport_heliport.runwaydirectionlightsystem_publisher_view as
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
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.colour_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.runwaydirectionlightsystem_ts.position_value as varchar), '(' || airport_heliport.runwaydirectionlightsystem_ts.position_nilreason || ')') as position
from airport_heliport.runwaydirectionlightsystem 
inner join master_join mj2 on airport_heliport.runwaydirectionlightsystem.id = mj2.source_id
inner join airport_heliport.runwaydirectionlightsystem_tsp on mj2.target_id = airport_heliport.runwaydirectionlightsystem_tsp.id
inner join airport_heliport.runwaydirectionlightsystem_ts on airport_heliport.runwaydirectionlightsystem_tsp.runwaydirectionlightsystemtimeslice_id = airport_heliport.runwaydirectionlightsystem_ts.id
where runwaydirectionlightsystem_ts.feature_status = 'APPROVED'
order by runwaydirectionlightsystem.identifier, runwaydirectionlightsystem_ts.sequence_number, runwaydirectionlightsystem_ts.correction_number DESC;
create or replace view airport_heliport.runwaydirection_publisher_view as
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
    coalesce(cast(airport_heliport.runwaydirection_ts.elevationtdzaccuracy_value as varchar) || ' ' || airport_heliport.runwaydirection_ts.elevationtdzaccuracy_uom, '(' || airport_heliport.runwaydirection_ts.elevationtdzaccuracy_nilreason || ')') as elevationtdzaccuracy
from airport_heliport.runwaydirection 
inner join master_join mj2 on airport_heliport.runwaydirection.id = mj2.source_id
inner join airport_heliport.runwaydirection_tsp on mj2.target_id = airport_heliport.runwaydirection_tsp.id
inner join airport_heliport.runwaydirection_ts on airport_heliport.runwaydirection_tsp.runwaydirectiontimeslice_id = airport_heliport.runwaydirection_ts.id
where runwaydirection_ts.feature_status = 'APPROVED'
order by runwaydirection.identifier, runwaydirection_ts.sequence_number, runwaydirection_ts.correction_number DESC;
create or replace view airport_heliport.runwayelement_publisher_view as
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
    coalesce(cast(airport_heliport.runwayelement_ts.type_value as varchar), '(' || airport_heliport.runwayelement_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.runwayelement_ts.gradeseparation_value as varchar), '(' || airport_heliport.runwayelement_ts.gradeseparation_nilreason || ')') as gradeseparation,
    coalesce(cast(airport_heliport.runwayelement_ts.length_value as varchar) || ' ' || airport_heliport.runwayelement_ts.length_uom, '(' || airport_heliport.runwayelement_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.runwayelement_ts.width_value as varchar) || ' ' || airport_heliport.runwayelement_ts.width_uom, '(' || airport_heliport.runwayelement_ts.width_nilreason || ')') as width
from airport_heliport.runwayelement 
inner join master_join mj2 on airport_heliport.runwayelement.id = mj2.source_id
inner join airport_heliport.runwayelement_tsp on mj2.target_id = airport_heliport.runwayelement_tsp.id
inner join airport_heliport.runwayelement_ts on airport_heliport.runwayelement_tsp.runwayelementtimeslice_id = airport_heliport.runwayelement_ts.id
where runwayelement_ts.feature_status = 'APPROVED'
order by runwayelement.identifier, runwayelement_ts.sequence_number, runwayelement_ts.correction_number DESC;
create or replace view airport_heliport.runwaymarking_publisher_view as
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
    coalesce(cast(airport_heliport.runwaymarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.runwaymarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.runwaymarking_ts.condition_value as varchar), '(' || airport_heliport.runwaymarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.runwaymarking_ts.markinglocation_value as varchar), '(' || airport_heliport.runwaymarking_ts.markinglocation_nilreason || ')') as markinglocation
from airport_heliport.runwaymarking 
inner join master_join mj2 on airport_heliport.runwaymarking.id = mj2.source_id
inner join airport_heliport.runwaymarking_tsp on mj2.target_id = airport_heliport.runwaymarking_tsp.id
inner join airport_heliport.runwaymarking_ts on airport_heliport.runwaymarking_tsp.runwaymarkingtimeslice_id = airport_heliport.runwaymarking_ts.id
where runwaymarking_ts.feature_status = 'APPROVED'
order by runwaymarking.identifier, runwaymarking_ts.sequence_number, runwaymarking_ts.correction_number DESC;
create or replace view airport_heliport.runwayprotectarealightsystem_publisher_view as
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
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.colour_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.runwayprotectarealightsystem_ts.position_value as varchar), '(' || airport_heliport.runwayprotectarealightsystem_ts.position_nilreason || ')') as position
from airport_heliport.runwayprotectarealightsystem 
inner join master_join mj2 on airport_heliport.runwayprotectarealightsystem.id = mj2.source_id
inner join airport_heliport.runwayprotectarealightsystem_tsp on mj2.target_id = airport_heliport.runwayprotectarealightsystem_tsp.id
inner join airport_heliport.runwayprotectarealightsystem_ts on airport_heliport.runwayprotectarealightsystem_tsp.runwayprotectarealightsystemtimeslice_id = airport_heliport.runwayprotectarealightsystem_ts.id
where runwayprotectarealightsystem_ts.feature_status = 'APPROVED'
order by runwayprotectarealightsystem.identifier, runwayprotectarealightsystem_ts.sequence_number, runwayprotectarealightsystem_ts.correction_number DESC;
create or replace view airport_heliport.runwayprotectarea_publisher_view as
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
    coalesce(cast(airport_heliport.runwayprotectarea_ts.lighting_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.lighting_nilreason || ')') as lighting,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.obstaclefree_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.obstaclefree_nilreason || ')') as obstaclefree,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.type_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.status_value as varchar), '(' || airport_heliport.runwayprotectarea_ts.status_nilreason || ')') as status,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.width_value as varchar) || ' ' || airport_heliport.runwayprotectarea_ts.width_uom, '(' || airport_heliport.runwayprotectarea_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.runwayprotectarea_ts.length_value as varchar) || ' ' || airport_heliport.runwayprotectarea_ts.length_uom, '(' || airport_heliport.runwayprotectarea_ts.length_nilreason || ')') as length
from airport_heliport.runwayprotectarea 
inner join master_join mj2 on airport_heliport.runwayprotectarea.id = mj2.source_id
inner join airport_heliport.runwayprotectarea_tsp on mj2.target_id = airport_heliport.runwayprotectarea_tsp.id
inner join airport_heliport.runwayprotectarea_ts on airport_heliport.runwayprotectarea_tsp.runwayprotectareatimeslice_id = airport_heliport.runwayprotectarea_ts.id
where runwayprotectarea_ts.feature_status = 'APPROVED'
order by runwayprotectarea.identifier, runwayprotectarea_ts.sequence_number, runwayprotectarea_ts.correction_number DESC;
create or replace view airport_heliport.runway_publisher_view as
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
    coalesce(cast(airport_heliport.runway_ts.widthoffset_value as varchar) || ' ' || airport_heliport.runway_ts.widthoffset_uom, '(' || airport_heliport.runway_ts.widthoffset_nilreason || ')') as widthoffset
from airport_heliport.runway 
inner join master_join mj2 on airport_heliport.runway.id = mj2.source_id
inner join airport_heliport.runway_tsp on mj2.target_id = airport_heliport.runway_tsp.id
inner join airport_heliport.runway_ts on airport_heliport.runway_tsp.runwaytimeslice_id = airport_heliport.runway_ts.id
where runway_ts.feature_status = 'APPROVED'
order by runway.identifier, runway_ts.sequence_number, runway_ts.correction_number DESC;
create or replace view airport_heliport.runwayvisualrange_publisher_view as
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
    coalesce(cast(airport_heliport.runwayvisualrange_ts.readingposition_value as varchar), '(' || airport_heliport.runwayvisualrange_ts.readingposition_nilreason || ')') as readingposition
from airport_heliport.runwayvisualrange 
inner join master_join mj2 on airport_heliport.runwayvisualrange.id = mj2.source_id
inner join airport_heliport.runwayvisualrange_tsp on mj2.target_id = airport_heliport.runwayvisualrange_tsp.id
inner join airport_heliport.runwayvisualrange_ts on airport_heliport.runwayvisualrange_tsp.runwayvisualrangetimeslice_id = airport_heliport.runwayvisualrange_ts.id
where runwayvisualrange_ts.feature_status = 'APPROVED'
order by runwayvisualrange.identifier, runwayvisualrange_ts.sequence_number, runwayvisualrange_ts.correction_number DESC;
create or replace view procedure.safealtitudearea_publisher_view as
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
    coalesce(cast(procedure.safealtitudearea_ts.safeareatype_value as varchar), '(' || procedure.safealtitudearea_ts.safeareatype_nilreason || ')') as safeareatype
from procedure.safealtitudearea 
inner join master_join mj2 on procedure.safealtitudearea.id = mj2.source_id
inner join procedure.safealtitudearea_tsp on mj2.target_id = procedure.safealtitudearea_tsp.id
inner join procedure.safealtitudearea_ts on procedure.safealtitudearea_tsp.safealtitudeareatimeslice_id = procedure.safealtitudearea_ts.id
where safealtitudearea_ts.feature_status = 'APPROVED'
order by safealtitudearea.identifier, safealtitudearea_ts.sequence_number, safealtitudearea_ts.correction_number DESC;
create or replace view navaids_points.sdf_publisher_view as
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
    coalesce(cast(navaids_points.sdf_ts.frequency_value as varchar) || ' ' || navaids_points.sdf_ts.frequency_uom, '(' || navaids_points.sdf_ts.frequency_nilreason || ')') as frequency
from navaids_points.sdf 
inner join master_join mj2 on navaids_points.sdf.id = mj2.source_id
inner join navaids_points.sdf_tsp on mj2.target_id = navaids_points.sdf_tsp.id
inner join navaids_points.sdf_ts on navaids_points.sdf_tsp.sdftimeslice_id = navaids_points.sdf_ts.id
where sdf_ts.feature_status = 'APPROVED'
order by sdf.identifier, sdf_ts.sequence_number, sdf_ts.correction_number DESC;
create or replace view airport_heliport.seaplanelandingarea_publisher_view as
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
    airport_heliport.seaplanelandingarea_ts.feature_lifetime_end
from airport_heliport.seaplanelandingarea 
inner join master_join mj2 on airport_heliport.seaplanelandingarea.id = mj2.source_id
inner join airport_heliport.seaplanelandingarea_tsp on mj2.target_id = airport_heliport.seaplanelandingarea_tsp.id
inner join airport_heliport.seaplanelandingarea_ts on airport_heliport.seaplanelandingarea_tsp.seaplanelandingareatimeslice_id = airport_heliport.seaplanelandingarea_ts.id
where seaplanelandingarea_ts.feature_status = 'APPROVED'
order by seaplanelandingarea.identifier, seaplanelandingarea_ts.sequence_number, seaplanelandingarea_ts.correction_number DESC;
create or replace view airport_heliport.seaplanerampsite_publisher_view as
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
    airport_heliport.seaplanerampsite_ts.feature_lifetime_end
from airport_heliport.seaplanerampsite 
inner join master_join mj2 on airport_heliport.seaplanerampsite.id = mj2.source_id
inner join airport_heliport.seaplanerampsite_tsp on mj2.target_id = airport_heliport.seaplanerampsite_tsp.id
inner join airport_heliport.seaplanerampsite_ts on airport_heliport.seaplanerampsite_tsp.seaplanerampsitetimeslice_id = airport_heliport.seaplanerampsite_ts.id
where seaplanerampsite_ts.feature_status = 'APPROVED'
order by seaplanerampsite.identifier, seaplanerampsite_ts.sequence_number, seaplanerampsite_ts.correction_number DESC;
create or replace view service.searchrescueservice_publisher_view as
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
    coalesce(cast(service.searchrescueservice_ts.flightoperations_value as varchar), '(' || service.searchrescueservice_ts.flightoperations_nilreason || ')') as flightoperations,
    coalesce(cast(service.searchrescueservice_ts.rank_value as varchar), '(' || service.searchrescueservice_ts.rank_nilreason || ')') as rank,
    coalesce(cast(service.searchrescueservice_ts.complianticao_value as varchar), '(' || service.searchrescueservice_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(service.searchrescueservice_ts.name_value as varchar), '(' || service.searchrescueservice_ts.name_nilreason || ')') as name,
    coalesce(cast(service.searchrescueservice_ts.type_value as varchar), '(' || service.searchrescueservice_ts.type_nilreason || ')') as type
from service.searchrescueservice 
inner join master_join mj2 on service.searchrescueservice.id = mj2.source_id
inner join service.searchrescueservice_tsp on mj2.target_id = service.searchrescueservice_tsp.id
inner join service.searchrescueservice_ts on service.searchrescueservice_tsp.searchrescueservicetimeslice_id = service.searchrescueservice_ts.id
where searchrescueservice_ts.feature_status = 'APPROVED'
order by searchrescueservice.identifier, searchrescueservice_ts.sequence_number, searchrescueservice_ts.correction_number DESC;
create or replace view surveillance.secondarysurveillanceradar_publisher_view as
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
    coalesce(cast(surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_value as varchar) || ' ' || surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_uom, '(' || surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_nilreason || ')') as verticalcoveragedistance
from surveillance.secondarysurveillanceradar 
inner join master_join mj2 on surveillance.secondarysurveillanceradar.id = mj2.source_id
inner join surveillance.secondarysurveillanceradar_tsp on mj2.target_id = surveillance.secondarysurveillanceradar_tsp.id
inner join surveillance.secondarysurveillanceradar_ts on surveillance.secondarysurveillanceradar_tsp.secondarysurveillanceradartimeslice_id = surveillance.secondarysurveillanceradar_ts.id
where secondarysurveillanceradar_ts.feature_status = 'APPROVED'
order by secondarysurveillanceradar.identifier, secondarysurveillanceradar_ts.sequence_number, secondarysurveillanceradar_ts.correction_number DESC;
create or replace view navaids_points.significantpointinairspace_publisher_view as
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
    coalesce(cast(navaids_points.significantpointinairspace_ts.type_value as varchar), '(' || navaids_points.significantpointinairspace_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.significantpointinairspace_ts.relativelocation_value as varchar), '(' || navaids_points.significantpointinairspace_ts.relativelocation_nilreason || ')') as relativelocation
from navaids_points.significantpointinairspace 
inner join master_join mj2 on navaids_points.significantpointinairspace.id = mj2.source_id
inner join navaids_points.significantpointinairspace_tsp on mj2.target_id = navaids_points.significantpointinairspace_tsp.id
inner join navaids_points.significantpointinairspace_ts on navaids_points.significantpointinairspace_tsp.significantpointinairspacetimeslice_id = navaids_points.significantpointinairspace_ts.id
where significantpointinairspace_ts.feature_status = 'APPROVED'
order by significantpointinairspace.identifier, significantpointinairspace_ts.sequence_number, significantpointinairspace_ts.correction_number DESC;
create or replace view shared.specialdate_publisher_view as
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
    coalesce(cast(shared.specialdate_ts.type_value as varchar), '(' || shared.specialdate_ts.type_nilreason || ')') as type,
    coalesce(cast(shared.specialdate_ts.dateday_value as varchar), '(' || shared.specialdate_ts.dateday_nilreason || ')') as dateday,
    coalesce(cast(shared.specialdate_ts.dateyear_value as varchar), '(' || shared.specialdate_ts.dateyear_nilreason || ')') as dateyear,
    coalesce(cast(shared.specialdate_ts.name_value as varchar), '(' || shared.specialdate_ts.name_nilreason || ')') as name
from shared.specialdate 
inner join master_join mj2 on shared.specialdate.id = mj2.source_id
inner join shared.specialdate_tsp on mj2.target_id = shared.specialdate_tsp.id
inner join shared.specialdate_ts on shared.specialdate_tsp.specialdatetimeslice_id = shared.specialdate_ts.id
where specialdate_ts.feature_status = 'APPROVED'
order by specialdate.identifier, specialdate_ts.sequence_number, specialdate_ts.correction_number DESC;
create or replace view navaids_points.specialnavigationstation_publisher_view as
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
    coalesce(cast(navaids_points.specialnavigationstation_ts.name_value as varchar), '(' || navaids_points.specialnavigationstation_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.specialnavigationstation_ts.type_value as varchar), '(' || navaids_points.specialnavigationstation_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.specialnavigationstation_ts.emission_value as varchar), '(' || navaids_points.specialnavigationstation_ts.emission_nilreason || ')') as emission,
    coalesce(cast(navaids_points.specialnavigationstation_ts.frequency_value as varchar) || ' ' || navaids_points.specialnavigationstation_ts.frequency_uom, '(' || navaids_points.specialnavigationstation_ts.frequency_nilreason || ')') as frequency
from navaids_points.specialnavigationstation 
inner join master_join mj2 on navaids_points.specialnavigationstation.id = mj2.source_id
inner join navaids_points.specialnavigationstation_tsp on mj2.target_id = navaids_points.specialnavigationstation_tsp.id
inner join navaids_points.specialnavigationstation_ts on navaids_points.specialnavigationstation_tsp.specialnavigationstationtimeslice_id = navaids_points.specialnavigationstation_ts.id
where specialnavigationstation_ts.feature_status = 'APPROVED'
order by specialnavigationstation.identifier, specialnavigationstation_ts.sequence_number, specialnavigationstation_ts.correction_number DESC;
create or replace view navaids_points.specialnavigationsystem_publisher_view as
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
    coalesce(cast(navaids_points.specialnavigationsystem_ts.type_value as varchar), '(' || navaids_points.specialnavigationsystem_ts.type_nilreason || ')') as type,
    coalesce(cast(navaids_points.specialnavigationsystem_ts.designator_value as varchar), '(' || navaids_points.specialnavigationsystem_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.specialnavigationsystem_ts.name_value as varchar), '(' || navaids_points.specialnavigationsystem_ts.name_nilreason || ')') as name
from navaids_points.specialnavigationsystem 
inner join master_join mj2 on navaids_points.specialnavigationsystem.id = mj2.source_id
inner join navaids_points.specialnavigationsystem_tsp on mj2.target_id = navaids_points.specialnavigationsystem_tsp.id
inner join navaids_points.specialnavigationsystem_ts on navaids_points.specialnavigationsystem_tsp.specialnavigationsystemtimeslice_id = navaids_points.specialnavigationsystem_ts.id
where specialnavigationsystem_ts.feature_status = 'APPROVED'
order by specialnavigationsystem.identifier, specialnavigationsystem_ts.sequence_number, specialnavigationsystem_ts.correction_number DESC;
create or replace view procedure.standardinstrumentarrival_publisher_view as
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
    coalesce(cast(procedure.standardinstrumentarrival_ts.communicationfailureinstruction_value as varchar), '(' || procedure.standardinstrumentarrival_ts.communicationfailureinstruction_nilreason || ')') as communicationfailureinstruction,
    coalesce(cast(procedure.standardinstrumentarrival_ts.instruction_value as varchar), '(' || procedure.standardinstrumentarrival_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.standardinstrumentarrival_ts.designcriteria_value as varchar), '(' || procedure.standardinstrumentarrival_ts.designcriteria_nilreason || ')') as designcriteria,
    coalesce(cast(procedure.standardinstrumentarrival_ts.codingstandard_value as varchar), '(' || procedure.standardinstrumentarrival_ts.codingstandard_nilreason || ')') as codingstandard,
    coalesce(cast(procedure.standardinstrumentarrival_ts.flightchecked_value as varchar), '(' || procedure.standardinstrumentarrival_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(procedure.standardinstrumentarrival_ts.name_value as varchar), '(' || procedure.standardinstrumentarrival_ts.name_nilreason || ')') as name,
    coalesce(cast(procedure.standardinstrumentarrival_ts.rnav_value as varchar), '(' || procedure.standardinstrumentarrival_ts.rnav_nilreason || ')') as rnav,
    coalesce(cast(procedure.standardinstrumentarrival_ts.designator_value as varchar), '(' || procedure.standardinstrumentarrival_ts.designator_nilreason || ')') as designator
from procedure.standardinstrumentarrival 
inner join master_join mj2 on procedure.standardinstrumentarrival.id = mj2.source_id
inner join procedure.standardinstrumentarrival_tsp on mj2.target_id = procedure.standardinstrumentarrival_tsp.id
inner join procedure.standardinstrumentarrival_ts on procedure.standardinstrumentarrival_tsp.standardinstrumentarrivaltimeslice_id = procedure.standardinstrumentarrival_ts.id
where standardinstrumentarrival_ts.feature_status = 'APPROVED'
order by standardinstrumentarrival.identifier, standardinstrumentarrival_ts.sequence_number, standardinstrumentarrival_ts.correction_number DESC;
create or replace view procedure.standardinstrumentdeparture_publisher_view as
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
    coalesce(cast(procedure.standardinstrumentdeparture_ts.communicationfailureinstruction_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.communicationfailureinstruction_nilreason || ')') as communicationfailureinstruction,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.instruction_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.instruction_nilreason || ')') as instruction,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.designcriteria_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.designcriteria_nilreason || ')') as designcriteria,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.codingstandard_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.codingstandard_nilreason || ')') as codingstandard,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.flightchecked_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.name_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.name_nilreason || ')') as name,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.rnav_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.rnav_nilreason || ')') as rnav,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.designator_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.designator_nilreason || ')') as designator,
    coalesce(cast(procedure.standardinstrumentdeparture_ts.contingencyroute_value as varchar), '(' || procedure.standardinstrumentdeparture_ts.contingencyroute_nilreason || ')') as contingencyroute
from procedure.standardinstrumentdeparture 
inner join master_join mj2 on procedure.standardinstrumentdeparture.id = mj2.source_id
inner join procedure.standardinstrumentdeparture_tsp on mj2.target_id = procedure.standardinstrumentdeparture_tsp.id
inner join procedure.standardinstrumentdeparture_ts on procedure.standardinstrumentdeparture_tsp.standardinstrumentdeparturetimeslice_id = procedure.standardinstrumentdeparture_ts.id
where standardinstrumentdeparture_ts.feature_status = 'APPROVED'
order by standardinstrumentdeparture.identifier, standardinstrumentdeparture_ts.sequence_number, standardinstrumentdeparture_ts.correction_number DESC;
create or replace view shared.standardlevelcolumn_publisher_view as
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
    coalesce(cast(shared.standardlevelcolumn_ts.series_value as varchar), '(' || shared.standardlevelcolumn_ts.series_nilreason || ')') as series,
    coalesce(cast(shared.standardlevelcolumn_ts.separation_value as varchar), '(' || shared.standardlevelcolumn_ts.separation_nilreason || ')') as separation
from shared.standardlevelcolumn 
inner join master_join mj2 on shared.standardlevelcolumn.id = mj2.source_id
inner join shared.standardlevelcolumn_tsp on mj2.target_id = shared.standardlevelcolumn_tsp.id
inner join shared.standardlevelcolumn_ts on shared.standardlevelcolumn_tsp.standardlevelcolumntimeslice_id = shared.standardlevelcolumn_ts.id
where standardlevelcolumn_ts.feature_status = 'APPROVED'
order by standardlevelcolumn.identifier, standardlevelcolumn_ts.sequence_number, standardlevelcolumn_ts.correction_number DESC;
create or replace view shared.standardlevelsector_publisher_view as
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
    coalesce(cast(shared.standardlevelsector_ts.flightrule_value as varchar), '(' || shared.standardlevelsector_ts.flightrule_nilreason || ')') as flightrule,
    coalesce(cast(shared.standardlevelsector_ts.fromtrack_value as varchar), '(' || shared.standardlevelsector_ts.fromtrack_nilreason || ')') as fromtrack,
    coalesce(cast(shared.standardlevelsector_ts.totrack_value as varchar), '(' || shared.standardlevelsector_ts.totrack_nilreason || ')') as totrack,
    coalesce(cast(shared.standardlevelsector_ts.angletype_value as varchar), '(' || shared.standardlevelsector_ts.angletype_nilreason || ')') as angletype
from shared.standardlevelsector 
inner join master_join mj2 on shared.standardlevelsector.id = mj2.source_id
inner join shared.standardlevelsector_tsp on mj2.target_id = shared.standardlevelsector_tsp.id
inner join shared.standardlevelsector_ts on shared.standardlevelsector_tsp.standardlevelsectortimeslice_id = shared.standardlevelsector_ts.id
where standardlevelsector_ts.feature_status = 'APPROVED'
order by standardlevelsector.identifier, standardlevelsector_ts.sequence_number, standardlevelsector_ts.correction_number DESC;
create or replace view shared.standardleveltable_publisher_view as
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
    coalesce(cast(shared.standardleveltable_ts.name_value as varchar), '(' || shared.standardleveltable_ts.name_nilreason || ')') as name,
    coalesce(cast(shared.standardleveltable_ts.standardicao_value as varchar), '(' || shared.standardleveltable_ts.standardicao_nilreason || ')') as standardicao
from shared.standardleveltable 
inner join master_join mj2 on shared.standardleveltable.id = mj2.source_id
inner join shared.standardleveltable_tsp on mj2.target_id = shared.standardleveltable_tsp.id
inner join shared.standardleveltable_ts on shared.standardleveltable_tsp.standardleveltabletimeslice_id = shared.standardleveltable_ts.id
where standardleveltable_ts.feature_status = 'APPROVED'
order by standardleveltable.identifier, standardleveltable_ts.sequence_number, standardleveltable_ts.correction_number DESC;
create or replace view airport_heliport.standmarking_publisher_view as
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
    coalesce(cast(airport_heliport.standmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.standmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.standmarking_ts.condition_value as varchar), '(' || airport_heliport.standmarking_ts.condition_nilreason || ')') as condition
from airport_heliport.standmarking 
inner join master_join mj2 on airport_heliport.standmarking.id = mj2.source_id
inner join airport_heliport.standmarking_tsp on mj2.target_id = airport_heliport.standmarking_tsp.id
inner join airport_heliport.standmarking_ts on airport_heliport.standmarking_tsp.standmarkingtimeslice_id = airport_heliport.standmarking_ts.id
where standmarking_ts.feature_status = 'APPROVED'
order by standmarking.identifier, standmarking_ts.sequence_number, standmarking_ts.correction_number DESC;
create or replace view airport_heliport.surveycontrolpoint_publisher_view as
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
    coalesce(cast(airport_heliport.surveycontrolpoint_ts.designator_value as varchar), '(' || airport_heliport.surveycontrolpoint_ts.designator_nilreason || ')') as designator
from airport_heliport.surveycontrolpoint 
inner join master_join mj2 on airport_heliport.surveycontrolpoint.id = mj2.source_id
inner join airport_heliport.surveycontrolpoint_tsp on mj2.target_id = airport_heliport.surveycontrolpoint_tsp.id
inner join airport_heliport.surveycontrolpoint_ts on airport_heliport.surveycontrolpoint_tsp.surveycontrolpointtimeslice_id = airport_heliport.surveycontrolpoint_ts.id
where surveycontrolpoint_ts.feature_status = 'APPROVED'
order by surveycontrolpoint.identifier, surveycontrolpoint_ts.sequence_number, surveycontrolpoint_ts.correction_number DESC;
create or replace view navaids_points.tacan_publisher_view as
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
    coalesce(cast(navaids_points.tacan_ts.designator_value as varchar), '(' || navaids_points.tacan_ts.designator_nilreason || ')') as designator,
    coalesce(cast(navaids_points.tacan_ts.name_value as varchar), '(' || navaids_points.tacan_ts.name_nilreason || ')') as name,
    coalesce(cast(navaids_points.tacan_ts.emissionclass_value as varchar), '(' || navaids_points.tacan_ts.emissionclass_nilreason || ')') as emissionclass,
    coalesce(cast(navaids_points.tacan_ts.mobile_value as varchar), '(' || navaids_points.tacan_ts.mobile_nilreason || ')') as mobile,
    coalesce(cast(navaids_points.tacan_ts.magneticvariation_value as varchar), '(' || navaids_points.tacan_ts.magneticvariation_nilreason || ')') as magneticvariation,
    coalesce(cast(navaids_points.tacan_ts.magneticvariationaccuracy_value as varchar), '(' || navaids_points.tacan_ts.magneticvariationaccuracy_nilreason || ')') as magneticvariationaccuracy,
    coalesce(cast(navaids_points.tacan_ts.datemagneticvariation_value as varchar), '(' || navaids_points.tacan_ts.datemagneticvariation_nilreason || ')') as datemagneticvariation,
    coalesce(cast(navaids_points.tacan_ts.flightchecked_value as varchar), '(' || navaids_points.tacan_ts.flightchecked_nilreason || ')') as flightchecked,
    coalesce(cast(navaids_points.tacan_ts.channel_value as varchar), '(' || navaids_points.tacan_ts.channel_nilreason || ')') as channel,
    coalesce(cast(navaids_points.tacan_ts.declination_value as varchar), '(' || navaids_points.tacan_ts.declination_nilreason || ')') as declination
from navaids_points.tacan 
inner join master_join mj2 on navaids_points.tacan.id = mj2.source_id
inner join navaids_points.tacan_tsp on mj2.target_id = navaids_points.tacan_tsp.id
inner join navaids_points.tacan_ts on navaids_points.tacan_tsp.tacantimeslice_id = navaids_points.tacan_ts.id
where tacan_ts.feature_status = 'APPROVED'
order by tacan.identifier, tacan_ts.sequence_number, tacan_ts.correction_number DESC;
create or replace view airport_heliport.taxiholdingpositionlightsystem_publisher_view as
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
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.colour_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.taxiholdingpositionlightsystem_ts.type_value as varchar), '(' || airport_heliport.taxiholdingpositionlightsystem_ts.type_nilreason || ')') as type
from airport_heliport.taxiholdingpositionlightsystem 
inner join master_join mj2 on airport_heliport.taxiholdingpositionlightsystem.id = mj2.source_id
inner join airport_heliport.taxiholdingpositionlightsystem_tsp on mj2.target_id = airport_heliport.taxiholdingpositionlightsystem_tsp.id
inner join airport_heliport.taxiholdingpositionlightsystem_ts on airport_heliport.taxiholdingpositionlightsystem_tsp.taxiholdingpositionlightsystemtimeslice_id = airport_heliport.taxiholdingpositionlightsystem_ts.id
where taxiholdingpositionlightsystem_ts.feature_status = 'APPROVED'
order by taxiholdingpositionlightsystem.identifier, taxiholdingpositionlightsystem_ts.sequence_number, taxiholdingpositionlightsystem_ts.correction_number DESC;
create or replace view airport_heliport.taxiholdingpositionmarking_publisher_view as
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
    coalesce(cast(airport_heliport.taxiholdingpositionmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.taxiholdingpositionmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.taxiholdingpositionmarking_ts.condition_value as varchar), '(' || airport_heliport.taxiholdingpositionmarking_ts.condition_nilreason || ')') as condition
from airport_heliport.taxiholdingpositionmarking 
inner join master_join mj2 on airport_heliport.taxiholdingpositionmarking.id = mj2.source_id
inner join airport_heliport.taxiholdingpositionmarking_tsp on mj2.target_id = airport_heliport.taxiholdingpositionmarking_tsp.id
inner join airport_heliport.taxiholdingpositionmarking_ts on airport_heliport.taxiholdingpositionmarking_tsp.taxiholdingpositionmarkingtimeslice_id = airport_heliport.taxiholdingpositionmarking_ts.id
where taxiholdingpositionmarking_ts.feature_status = 'APPROVED'
order by taxiholdingpositionmarking.identifier, taxiholdingpositionmarking_ts.sequence_number, taxiholdingpositionmarking_ts.correction_number DESC;
create or replace view airport_heliport.taxiholdingposition_publisher_view as
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
    coalesce(cast(airport_heliport.taxiholdingposition_ts.landingcategory_value as varchar), '(' || airport_heliport.taxiholdingposition_ts.landingcategory_nilreason || ')') as landingcategory,
    coalesce(cast(airport_heliport.taxiholdingposition_ts.status_value as varchar), '(' || airport_heliport.taxiholdingposition_ts.status_nilreason || ')') as status
from airport_heliport.taxiholdingposition 
inner join master_join mj2 on airport_heliport.taxiholdingposition.id = mj2.source_id
inner join airport_heliport.taxiholdingposition_tsp on mj2.target_id = airport_heliport.taxiholdingposition_tsp.id
inner join airport_heliport.taxiholdingposition_ts on airport_heliport.taxiholdingposition_tsp.taxiholdingpositiontimeslice_id = airport_heliport.taxiholdingposition_ts.id
where taxiholdingposition_ts.feature_status = 'APPROVED'
order by taxiholdingposition.identifier, taxiholdingposition_ts.sequence_number, taxiholdingposition_ts.correction_number DESC;
create or replace view airport_heliport.taxiwayelement_publisher_view as
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
    coalesce(cast(airport_heliport.taxiwayelement_ts.type_value as varchar), '(' || airport_heliport.taxiwayelement_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.taxiwayelement_ts.gradeseparation_value as varchar), '(' || airport_heliport.taxiwayelement_ts.gradeseparation_nilreason || ')') as gradeseparation,
    coalesce(cast(airport_heliport.taxiwayelement_ts.length_value as varchar) || ' ' || airport_heliport.taxiwayelement_ts.length_uom, '(' || airport_heliport.taxiwayelement_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.taxiwayelement_ts.width_value as varchar) || ' ' || airport_heliport.taxiwayelement_ts.width_uom, '(' || airport_heliport.taxiwayelement_ts.width_nilreason || ')') as width
from airport_heliport.taxiwayelement 
inner join master_join mj2 on airport_heliport.taxiwayelement.id = mj2.source_id
inner join airport_heliport.taxiwayelement_tsp on mj2.target_id = airport_heliport.taxiwayelement_tsp.id
inner join airport_heliport.taxiwayelement_ts on airport_heliport.taxiwayelement_tsp.taxiwayelementtimeslice_id = airport_heliport.taxiwayelement_ts.id
where taxiwayelement_ts.feature_status = 'APPROVED'
order by taxiwayelement.identifier, taxiwayelement_ts.sequence_number, taxiwayelement_ts.correction_number DESC;
create or replace view airport_heliport.taxiwaylightsystem_publisher_view as
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
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.colour_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.taxiwaylightsystem_ts.position_value as varchar), '(' || airport_heliport.taxiwaylightsystem_ts.position_nilreason || ')') as position
from airport_heliport.taxiwaylightsystem 
inner join master_join mj2 on airport_heliport.taxiwaylightsystem.id = mj2.source_id
inner join airport_heliport.taxiwaylightsystem_tsp on mj2.target_id = airport_heliport.taxiwaylightsystem_tsp.id
inner join airport_heliport.taxiwaylightsystem_ts on airport_heliport.taxiwaylightsystem_tsp.taxiwaylightsystemtimeslice_id = airport_heliport.taxiwaylightsystem_ts.id
where taxiwaylightsystem_ts.feature_status = 'APPROVED'
order by taxiwaylightsystem.identifier, taxiwaylightsystem_ts.sequence_number, taxiwaylightsystem_ts.correction_number DESC;
create or replace view airport_heliport.taxiwaymarking_publisher_view as
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
    coalesce(cast(airport_heliport.taxiwaymarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.taxiwaymarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.taxiwaymarking_ts.condition_value as varchar), '(' || airport_heliport.taxiwaymarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.taxiwaymarking_ts.markinglocation_value as varchar), '(' || airport_heliport.taxiwaymarking_ts.markinglocation_nilreason || ')') as markinglocation
from airport_heliport.taxiwaymarking 
inner join master_join mj2 on airport_heliport.taxiwaymarking.id = mj2.source_id
inner join airport_heliport.taxiwaymarking_tsp on mj2.target_id = airport_heliport.taxiwaymarking_tsp.id
inner join airport_heliport.taxiwaymarking_ts on airport_heliport.taxiwaymarking_tsp.taxiwaymarkingtimeslice_id = airport_heliport.taxiwaymarking_ts.id
where taxiwaymarking_ts.feature_status = 'APPROVED'
order by taxiwaymarking.identifier, taxiwaymarking_ts.sequence_number, taxiwaymarking_ts.correction_number DESC;
create or replace view airport_heliport.taxiway_publisher_view as
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
    coalesce(cast(airport_heliport.taxiway_ts.designator_value as varchar), '(' || airport_heliport.taxiway_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.taxiway_ts.type_value as varchar), '(' || airport_heliport.taxiway_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.taxiway_ts.abandoned_value as varchar), '(' || airport_heliport.taxiway_ts.abandoned_nilreason || ')') as abandoned,
    coalesce(cast(airport_heliport.taxiway_ts.width_value as varchar) || ' ' || airport_heliport.taxiway_ts.width_uom, '(' || airport_heliport.taxiway_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.taxiway_ts.widthshoulder_value as varchar) || ' ' || airport_heliport.taxiway_ts.widthshoulder_uom, '(' || airport_heliport.taxiway_ts.widthshoulder_nilreason || ')') as widthshoulder,
    coalesce(cast(airport_heliport.taxiway_ts.length_value as varchar) || ' ' || airport_heliport.taxiway_ts.length_uom, '(' || airport_heliport.taxiway_ts.length_nilreason || ')') as length
from airport_heliport.taxiway 
inner join master_join mj2 on airport_heliport.taxiway.id = mj2.source_id
inner join airport_heliport.taxiway_tsp on mj2.target_id = airport_heliport.taxiway_tsp.id
inner join airport_heliport.taxiway_ts on airport_heliport.taxiway_tsp.taxiwaytimeslice_id = airport_heliport.taxiway_ts.id
where taxiway_ts.feature_status = 'APPROVED'
order by taxiway.identifier, taxiway_ts.sequence_number, taxiway_ts.correction_number DESC;
create or replace view procedure.terminalarrivalarea_publisher_view as
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
    coalesce(cast(procedure.terminalarrivalarea_ts.arrivalareatype_value as varchar), '(' || procedure.terminalarrivalarea_ts.arrivalareatype_nilreason || ')') as arrivalareatype,
    coalesce(cast(procedure.terminalarrivalarea_ts.outerbufferwidth_value as varchar) || ' ' || procedure.terminalarrivalarea_ts.outerbufferwidth_uom, '(' || procedure.terminalarrivalarea_ts.outerbufferwidth_nilreason || ')') as outerbufferwidth,
    coalesce(cast(procedure.terminalarrivalarea_ts.lateralbufferwidth_value as varchar) || ' ' || procedure.terminalarrivalarea_ts.lateralbufferwidth_uom, '(' || procedure.terminalarrivalarea_ts.lateralbufferwidth_nilreason || ')') as lateralbufferwidth
from procedure.terminalarrivalarea 
inner join master_join mj2 on procedure.terminalarrivalarea.id = mj2.source_id
inner join procedure.terminalarrivalarea_tsp on mj2.target_id = procedure.terminalarrivalarea_tsp.id
inner join procedure.terminalarrivalarea_ts on procedure.terminalarrivalarea_tsp.terminalarrivalareatimeslice_id = procedure.terminalarrivalarea_ts.id
where terminalarrivalarea_ts.feature_status = 'APPROVED'
order by terminalarrivalarea.identifier, terminalarrivalarea_ts.sequence_number, terminalarrivalarea_ts.correction_number DESC;
create or replace view airport_heliport.touchdownliftofflightsystem_publisher_view as
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
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.emergencylighting_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.intensitylevel_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.colour_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.touchdownliftofflightsystem_ts.position_value as varchar), '(' || airport_heliport.touchdownliftofflightsystem_ts.position_nilreason || ')') as position
from airport_heliport.touchdownliftofflightsystem 
inner join master_join mj2 on airport_heliport.touchdownliftofflightsystem.id = mj2.source_id
inner join airport_heliport.touchdownliftofflightsystem_tsp on mj2.target_id = airport_heliport.touchdownliftofflightsystem_tsp.id
inner join airport_heliport.touchdownliftofflightsystem_ts on airport_heliport.touchdownliftofflightsystem_tsp.touchdownliftofflightsystemtimeslice_id = airport_heliport.touchdownliftofflightsystem_ts.id
where touchdownliftofflightsystem_ts.feature_status = 'APPROVED'
order by touchdownliftofflightsystem.identifier, touchdownliftofflightsystem_ts.sequence_number, touchdownliftofflightsystem_ts.correction_number DESC;
create or replace view airport_heliport.touchdownliftoffmarking_publisher_view as
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
    coalesce(cast(airport_heliport.touchdownliftoffmarking_ts.markingicaostandard_value as varchar), '(' || airport_heliport.touchdownliftoffmarking_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(airport_heliport.touchdownliftoffmarking_ts.condition_value as varchar), '(' || airport_heliport.touchdownliftoffmarking_ts.condition_nilreason || ')') as condition,
    coalesce(cast(airport_heliport.touchdownliftoffmarking_ts.markinglocation_value as varchar), '(' || airport_heliport.touchdownliftoffmarking_ts.markinglocation_nilreason || ')') as markinglocation
from airport_heliport.touchdownliftoffmarking 
inner join master_join mj2 on airport_heliport.touchdownliftoffmarking.id = mj2.source_id
inner join airport_heliport.touchdownliftoffmarking_tsp on mj2.target_id = airport_heliport.touchdownliftoffmarking_tsp.id
inner join airport_heliport.touchdownliftoffmarking_ts on airport_heliport.touchdownliftoffmarking_tsp.touchdownliftoffmarkingtimeslice_id = airport_heliport.touchdownliftoffmarking_ts.id
where touchdownliftoffmarking_ts.feature_status = 'APPROVED'
order by touchdownliftoffmarking.identifier, touchdownliftoffmarking_ts.sequence_number, touchdownliftoffmarking_ts.correction_number DESC;
create or replace view airport_heliport.touchdownliftoffsafearea_publisher_view as
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
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.lighting_value as varchar), '(' || airport_heliport.touchdownliftoffsafearea_ts.lighting_nilreason || ')') as lighting,
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.obstaclefree_value as varchar), '(' || airport_heliport.touchdownliftoffsafearea_ts.obstaclefree_nilreason || ')') as obstaclefree,
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.width_value as varchar) || ' ' || airport_heliport.touchdownliftoffsafearea_ts.width_uom, '(' || airport_heliport.touchdownliftoffsafearea_ts.width_nilreason || ')') as width,
    coalesce(cast(airport_heliport.touchdownliftoffsafearea_ts.length_value as varchar) || ' ' || airport_heliport.touchdownliftoffsafearea_ts.length_uom, '(' || airport_heliport.touchdownliftoffsafearea_ts.length_nilreason || ')') as length
from airport_heliport.touchdownliftoffsafearea 
inner join master_join mj2 on airport_heliport.touchdownliftoffsafearea.id = mj2.source_id
inner join airport_heliport.touchdownliftoffsafearea_tsp on mj2.target_id = airport_heliport.touchdownliftoffsafearea_tsp.id
inner join airport_heliport.touchdownliftoffsafearea_ts on airport_heliport.touchdownliftoffsafearea_tsp.touchdownliftoffsafeareatimeslice_id = airport_heliport.touchdownliftoffsafearea_ts.id
where touchdownliftoffsafearea_ts.feature_status = 'APPROVED'
order by touchdownliftoffsafearea.identifier, touchdownliftoffsafearea_ts.sequence_number, touchdownliftoffsafearea_ts.correction_number DESC;
create or replace view airport_heliport.touchdownliftoff_publisher_view as
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
    coalesce(cast(airport_heliport.touchdownliftoff_ts.designator_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.designator_nilreason || ')') as designator,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.slope_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.slope_nilreason || ')') as slope,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.helicopterclass_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.helicopterclass_nilreason || ')') as helicopterclass,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.abandoned_value as varchar), '(' || airport_heliport.touchdownliftoff_ts.abandoned_nilreason || ')') as abandoned,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.length_value as varchar) || ' ' || airport_heliport.touchdownliftoff_ts.length_uom, '(' || airport_heliport.touchdownliftoff_ts.length_nilreason || ')') as length,
    coalesce(cast(airport_heliport.touchdownliftoff_ts.width_value as varchar) || ' ' || airport_heliport.touchdownliftoff_ts.width_uom, '(' || airport_heliport.touchdownliftoff_ts.width_nilreason || ')') as width
from airport_heliport.touchdownliftoff 
inner join master_join mj2 on airport_heliport.touchdownliftoff.id = mj2.source_id
inner join airport_heliport.touchdownliftoff_tsp on mj2.target_id = airport_heliport.touchdownliftoff_tsp.id
inner join airport_heliport.touchdownliftoff_ts on airport_heliport.touchdownliftoff_tsp.touchdownliftofftimeslice_id = airport_heliport.touchdownliftoff_ts.id
where touchdownliftoff_ts.feature_status = 'APPROVED'
order by touchdownliftoff.identifier, touchdownliftoff_ts.sequence_number, touchdownliftoff_ts.correction_number DESC;
create or replace view organisation.unit_publisher_view as
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
    coalesce(cast(organisation.unit_ts.name_value as varchar), '(' || organisation.unit_ts.name_nilreason || ')') as name,
    coalesce(cast(organisation.unit_ts.type_value as varchar), '(' || organisation.unit_ts.type_nilreason || ')') as type,
    coalesce(cast(organisation.unit_ts.complianticao_value as varchar), '(' || organisation.unit_ts.complianticao_nilreason || ')') as complianticao,
    coalesce(cast(organisation.unit_ts.designator_value as varchar), '(' || organisation.unit_ts.designator_nilreason || ')') as designator,
    coalesce(cast(organisation.unit_ts.military_value as varchar), '(' || organisation.unit_ts.military_nilreason || ')') as military
from organisation.unit 
inner join master_join mj2 on organisation.unit.id = mj2.source_id
inner join organisation.unit_tsp on mj2.target_id = organisation.unit_tsp.id
inner join organisation.unit_ts on organisation.unit_tsp.unittimeslice_id = organisation.unit_ts.id
where unit_ts.feature_status = 'APPROVED'
order by unit.identifier, unit_ts.sequence_number, unit_ts.correction_number DESC;
create or replace view holding.unplannedholding_publisher_view as
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
    coalesce(cast(holding.unplannedholding_ts.unplannedholding_value as varchar), '(' || holding.unplannedholding_ts.unplannedholding_nilreason || ')') as unplannedholding,
    coalesce(cast(holding.unplannedholding_ts.altitudereference_value as varchar), '(' || holding.unplannedholding_ts.altitudereference_nilreason || ')') as altitudereference,
    coalesce(cast(holding.unplannedholding_ts.controlledairspace_value as varchar), '(' || holding.unplannedholding_ts.controlledairspace_nilreason || ')') as controlledairspace,
    coalesce(cast(holding.unplannedholding_ts.authorizedaltitude_value as varchar) || ' ' || holding.unplannedholding_ts.authorizedaltitude_uom, '(' || holding.unplannedholding_ts.authorizedaltitude_nilreason || ')') as authorizedaltitude
from holding.unplannedholding 
inner join master_join mj2 on holding.unplannedholding.id = mj2.source_id
inner join holding.unplannedholding_tsp on mj2.target_id = holding.unplannedholding_tsp.id
inner join holding.unplannedholding_ts on holding.unplannedholding_tsp.unplannedholdingtimeslice_id = holding.unplannedholding_ts.id
where unplannedholding_ts.feature_status = 'APPROVED'
order by unplannedholding.identifier, unplannedholding_ts.sequence_number, unplannedholding_ts.correction_number DESC;
create or replace view obstacles.verticalstructure_publisher_view as
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
    coalesce(cast(obstacles.verticalstructure_ts.name_value as varchar), '(' || obstacles.verticalstructure_ts.name_nilreason || ')') as name,
    coalesce(cast(obstacles.verticalstructure_ts.type_value as varchar), '(' || obstacles.verticalstructure_ts.type_nilreason || ')') as type,
    coalesce(cast(obstacles.verticalstructure_ts.lighted_value as varchar), '(' || obstacles.verticalstructure_ts.lighted_nilreason || ')') as lighted,
    coalesce(cast(obstacles.verticalstructure_ts.markingicaostandard_value as varchar), '(' || obstacles.verticalstructure_ts.markingicaostandard_nilreason || ')') as markingicaostandard,
    coalesce(cast(obstacles.verticalstructure_ts.group_value as varchar), '(' || obstacles.verticalstructure_ts.group_nilreason || ')') as group,
    coalesce(cast(obstacles.verticalstructure_ts.lightingicaostandard_value as varchar), '(' || obstacles.verticalstructure_ts.lightingicaostandard_nilreason || ')') as lightingicaostandard,
    coalesce(cast(obstacles.verticalstructure_ts.synchronisedlighting_value as varchar), '(' || obstacles.verticalstructure_ts.synchronisedlighting_nilreason || ')') as synchronisedlighting,
    coalesce(cast(obstacles.verticalstructure_ts.length_value as varchar) || ' ' || obstacles.verticalstructure_ts.length_uom, '(' || obstacles.verticalstructure_ts.length_nilreason || ')') as length,
    coalesce(cast(obstacles.verticalstructure_ts.width_value as varchar) || ' ' || obstacles.verticalstructure_ts.width_uom, '(' || obstacles.verticalstructure_ts.width_nilreason || ')') as width,
    coalesce(cast(obstacles.verticalstructure_ts.radius_value as varchar) || ' ' || obstacles.verticalstructure_ts.radius_uom, '(' || obstacles.verticalstructure_ts.radius_nilreason || ')') as radius
from obstacles.verticalstructure 
inner join master_join mj2 on obstacles.verticalstructure.id = mj2.source_id
inner join obstacles.verticalstructure_tsp on mj2.target_id = obstacles.verticalstructure_tsp.id
inner join obstacles.verticalstructure_ts on obstacles.verticalstructure_tsp.verticalstructuretimeslice_id = obstacles.verticalstructure_ts.id
where verticalstructure_ts.feature_status = 'APPROVED'
order by verticalstructure.identifier, verticalstructure_ts.sequence_number, verticalstructure_ts.correction_number DESC;
create or replace view airport_heliport.visualglideslopeindicator_publisher_view as
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
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.emergencylighting_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.emergencylighting_nilreason || ')') as emergencylighting,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.intensitylevel_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.intensitylevel_nilreason || ')') as intensitylevel,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.colour_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.colour_nilreason || ')') as colour,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.type_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.type_nilreason || ')') as type,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.position_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.position_nilreason || ')') as position,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.numberbox_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.numberbox_nilreason || ')') as numberbox,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.portable_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.portable_nilreason || ')') as portable,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.slopeangle_value as varchar), '(' || airport_heliport.visualglideslopeindicator_ts.slopeangle_nilreason || ')') as slopeangle,
    coalesce(cast(airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_value as varchar) || ' ' || airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_uom, '(' || airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_nilreason || ')') as minimumeyeheightoverthreshold
from airport_heliport.visualglideslopeindicator 
inner join master_join mj2 on airport_heliport.visualglideslopeindicator.id = mj2.source_id
inner join airport_heliport.visualglideslopeindicator_tsp on mj2.target_id = airport_heliport.visualglideslopeindicator_tsp.id
inner join airport_heliport.visualglideslopeindicator_ts on airport_heliport.visualglideslopeindicator_tsp.visualglideslopeindicatortimeslice_id = airport_heliport.visualglideslopeindicator_ts.id
where visualglideslopeindicator_ts.feature_status = 'APPROVED'
order by visualglideslopeindicator.identifier, visualglideslopeindicator_ts.sequence_number, visualglideslopeindicator_ts.correction_number DESC;
create or replace view navaids_points.vor_publisher_view as
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
    coalesce(cast(navaids_points.vor_ts.frequency_value as varchar) || ' ' || navaids_points.vor_ts.frequency_uom, '(' || navaids_points.vor_ts.frequency_nilreason || ')') as frequency
from navaids_points.vor 
inner join master_join mj2 on navaids_points.vor.id = mj2.source_id
inner join navaids_points.vor_tsp on mj2.target_id = navaids_points.vor_tsp.id
inner join navaids_points.vor_ts on navaids_points.vor_tsp.vortimeslice_id = navaids_points.vor_ts.id
where vor_ts.feature_status = 'APPROVED'
order by vor.identifier, vor_ts.sequence_number, vor_ts.correction_number DESC;
create or replace view airport_heliport.workarea_publisher_view as
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
    coalesce(cast(airport_heliport.workarea_ts.plannedOperational_value as varchar), '(' || airport_heliport.workarea_ts.plannedOperational_nilreason || ')') as plannedOperational,
    coalesce(cast(airport_heliport.workarea_ts.type_value as varchar), '(' || airport_heliport.workarea_ts.type_nilreason || ')') as type
from airport_heliport.workarea 
inner join master_join mj2 on airport_heliport.workarea.id = mj2.source_id
inner join airport_heliport.workarea_tsp on mj2.target_id = airport_heliport.workarea_tsp.id
inner join airport_heliport.workarea_ts on airport_heliport.workarea_tsp.workareatimeslice_id = airport_heliport.workarea_ts.id
where workarea_ts.feature_status = 'APPROVED'
order by workarea.identifier, workarea_ts.sequence_number, workarea_ts.correction_number DESC;