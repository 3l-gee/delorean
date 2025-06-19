AerialRefuellingAnchorPropertyType
CREATE OR REPLACE VIEW aerialrefuellinganchorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuellinganchor_pt.id
    ) AS aerialrefuellinganchorpropertytype
FROM

-- AerialRefuellingAnchorType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor_pt
ON aerial_refuelling.aerialrefuellinganchor_pt.aerialrefuellinganchor_id = AerialRefuellingAnchorType.id

;

AerialRefuellingAnchorType
CREATE OR REPLACE VIEW aerialrefuellinganchortype_view AS
SELECT
    jsonb_build_object(
       'outboundcourse_value', aerial_refuelling.aerialrefuellinganchor.outboundcourse_value,
       'outboundcourse_nilreason', aerial_refuelling.aerialrefuellinganchor.outboundcourse_nilreason,
       'outboundcoursetype_value', aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_value,
       'outboundcoursetype_nilreason', aerial_refuelling.aerialrefuellinganchor.outboundcoursetype_nilreason,
       'inboundcourse_value', aerial_refuelling.aerialrefuellinganchor.inboundcourse_value,
       'inboundcourse_nilreason', aerial_refuelling.aerialrefuellinganchor.inboundcourse_nilreason,
       'turndirection_value', aerial_refuelling.aerialrefuellinganchor.turndirection_value,
       'turndirection_nilreason', aerial_refuelling.aerialrefuellinganchor.turndirection_nilreason,
       'refuellingbaselevelreference_value', aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_value,
       'refuellingbaselevelreference_nilreason', aerial_refuelling.aerialrefuellinganchor.refuellingbaselevelreference_nilreason,
       'speedlimit_value', aerial_refuelling.aerialrefuellinganchor.speedlimit_value,
       'speedlimit_uom', aerial_refuelling.aerialrefuellinganchor.speedlimit_uom,
       'speedlimit_nilreason', aerial_refuelling.aerialrefuellinganchor.speedlimit_nilreason,
       'legseparation_value', aerial_refuelling.aerialrefuellinganchor.legseparation_value,
       'legseparation_uom', aerial_refuelling.aerialrefuellinganchor.legseparation_uom,
       'legseparation_nilreason', aerial_refuelling.aerialrefuellinganchor.legseparation_nilreason,
       'leglength_value', aerial_refuelling.aerialrefuellinganchor.leglength_value,
       'leglength_uom', aerial_refuelling.aerialrefuellinganchor.leglength_uom,
       'leglength_nilreason', aerial_refuelling.aerialrefuellinganchor.leglength_nilreason,
       'refuellingbaselevel_value', aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_value,
       'refuellingbaselevel_uom', aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_uom,
       'refuellingbaselevel_nilreason', aerial_refuelling.aerialrefuellinganchor.refuellingbaselevel_nilreason,
       'id', aerial_refuelling.aerialrefuellinganchor.id,
       'identifier', aerial_refuelling.aerialrefuellinganchor.identifier,
       'identifier_code_space', aerial_refuelling.aerialrefuellinganchor.identifier_code_space,
       'xml_id', aerial_refuelling.aerialrefuellinganchor.xml_id
    ) AS aerialrefuellinganchortype
FROM

-- SurfacePropertyType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON aerial_refuelling.aerialrefuellinganchor.extent_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON aerial_refuelling.aerialrefuellinganchor.abstractaerialrefuellinganchorextension_id = AbstractExtensionType.id

-- AirspaceLayerPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellinganchor.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON master_join.target_id = AirspaceLayerPropertyType.id
-- AerialRefuellingPointPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellinganchor.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON master_join.target_id = AerialRefuellingPointPropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellinganchor.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON master_join.target_id = NotePropertyType.id
;

AerialRefuellingPointPropertyType
CREATE OR REPLACE VIEW aerialrefuellingpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuellingpoint_pt.id
    ) AS aerialrefuellingpointpropertytype
FROM

-- AerialRefuellingPointType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint_pt
ON aerial_refuelling.aerialrefuellingpoint_pt.aerialrefuellingpoint_id = AerialRefuellingPointType.id

;

AerialRefuellingPointType
CREATE OR REPLACE VIEW aerialrefuellingpointtype_view AS
SELECT
    jsonb_build_object(
       'reportingatc_value', aerial_refuelling.aerialrefuellingpoint.reportingatc_value,
       'reportingatc_nilreason', aerial_refuelling.aerialrefuellingpoint.reportingatc_nilreason,
       'flyover_value', aerial_refuelling.aerialrefuellingpoint.flyover_value,
       'flyover_nilreason', aerial_refuelling.aerialrefuellingpoint.flyover_nilreason,
       'waypoint_value', aerial_refuelling.aerialrefuellingpoint.waypoint_value,
       'waypoint_nilreason', aerial_refuelling.aerialrefuellingpoint.waypoint_nilreason,
       'radarguidance_value', aerial_refuelling.aerialrefuellingpoint.radarguidance_value,
       'radarguidance_nilreason', aerial_refuelling.aerialrefuellingpoint.radarguidance_nilreason,
       'sequence_value', aerial_refuelling.aerialrefuellingpoint.sequence_value,
       'sequence_nilreason', aerial_refuelling.aerialrefuellingpoint.sequence_nilreason,
       'usagetype_value', aerial_refuelling.aerialrefuellingpoint.usagetype_value,
       'usagetype_nilreason', aerial_refuelling.aerialrefuellingpoint.usagetype_nilreason,
       'id', aerial_refuelling.aerialrefuellingpoint.id,
       'identifier', aerial_refuelling.aerialrefuellingpoint.identifier,
       'identifier_code_space', aerial_refuelling.aerialrefuellingpoint.identifier_code_space,
       'xml_id', aerial_refuelling.aerialrefuellingpoint.xml_id
    ) AS aerialrefuellingpointtype
FROM

-- DesignatedPointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_position_id = PointPropertyType.id
-- RadioFrequencyAreaPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.extendedservicevolume_id = RadioFrequencyAreaPropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.abstractsegmentpointextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.abstractaerialrefuellingpointextension_id = AbstractExtensionType.id

-- PointReferencePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellingpoint.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON master_join.target_id = PointReferencePropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellingpoint.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON master_join.target_id = NotePropertyType.id
;

AerialRefuellingPropertyType
CREATE OR REPLACE VIEW aerialrefuellingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuelling_pt.id,
       'nilReason', aerial_refuelling.aerialrefuelling_pt.nilReason
    ) AS aerialrefuellingpropertytype
FROM


;

AerialRefuellingTimeSlicePropertyType
CREATE OR REPLACE VIEW aerialrefuellingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuelling_tsp.id
    ) AS aerialrefuellingtimeslicepropertytype
FROM

-- AerialRefuellingTimeSliceType
LEFT JOIN aerial_refuelling.aerialrefuelling_tsp
ON aerial_refuelling.aerialrefuelling_tsp.aerialrefuellingtimeslice_id = AerialRefuellingTimeSliceType.id

;

AerialRefuellingTimeSliceType
CREATE OR REPLACE VIEW aerialrefuellingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designatorprefix_value', aerial_refuelling.aerialrefuelling_ts.designatorprefix_value,
       'designatorprefix_nilreason', aerial_refuelling.aerialrefuelling_ts.designatorprefix_nilreason,
       'designatornumber_value', aerial_refuelling.aerialrefuelling_ts.designatornumber_value,
       'designatornumber_nilreason', aerial_refuelling.aerialrefuelling_ts.designatornumber_nilreason,
       'designatorsuffix_value', aerial_refuelling.aerialrefuelling_ts.designatorsuffix_value,
       'designatorsuffix_nilreason', aerial_refuelling.aerialrefuelling_ts.designatorsuffix_nilreason,
       'designatordirection_value', aerial_refuelling.aerialrefuelling_ts.designatordirection_value,
       'designatordirection_nilreason', aerial_refuelling.aerialrefuelling_ts.designatordirection_nilreason,
       'name_value', aerial_refuelling.aerialrefuelling_ts.name_value,
       'name_nilreason', aerial_refuelling.aerialrefuelling_ts.name_nilreason,
       'type_value', aerial_refuelling.aerialrefuelling_ts.type_value,
       'type_nilreason', aerial_refuelling.aerialrefuelling_ts.type_nilreason,
       'radarbeaconsetting_value', aerial_refuelling.aerialrefuelling_ts.radarbeaconsetting_value,
       'radarbeaconsetting_nilreason', aerial_refuelling.aerialrefuelling_ts.radarbeaconsetting_nilreason,
       'xbandradarsetting_value', aerial_refuelling.aerialrefuelling_ts.xbandradarsetting_value,
       'xbandradarsetting_nilreason', aerial_refuelling.aerialrefuelling_ts.xbandradarsetting_nilreason,
       'tankerchannel_value', aerial_refuelling.aerialrefuelling_ts.tankerchannel_value,
       'tankerchannel_nilreason', aerial_refuelling.aerialrefuelling_ts.tankerchannel_nilreason,
       'receiverchannel_value', aerial_refuelling.aerialrefuelling_ts.receiverchannel_value,
       'receiverchannel_nilreason', aerial_refuelling.aerialrefuelling_ts.receiverchannel_nilreason,
       'helicopterroute_value', aerial_refuelling.aerialrefuelling_ts.helicopterroute_value,
       'helicopterroute_nilreason', aerial_refuelling.aerialrefuelling_ts.helicopterroute_nilreason,
       'specialrefuelling_value', aerial_refuelling.aerialrefuelling_ts.specialrefuelling_value,
       'specialrefuelling_nilreason', aerial_refuelling.aerialrefuelling_ts.specialrefuelling_nilreason,
       'bidirectionaluse_value', aerial_refuelling.aerialrefuelling_ts.bidirectionaluse_value,
       'bidirectionaluse_nilreason', aerial_refuelling.aerialrefuelling_ts.bidirectionaluse_nilreason,
       'reversedirectionturn_value', aerial_refuelling.aerialrefuelling_ts.reversedirectionturn_value,
       'reversedirectionturn_nilreason', aerial_refuelling.aerialrefuelling_ts.reversedirectionturn_nilreason,
       'id', aerial_refuelling.aerialrefuelling_ts.id,
       'xml_id', aerial_refuelling.aerialrefuelling_ts.xml_id,
       'interpretation', aerial_refuelling.aerialrefuelling_ts.interpretation,
       'sequence_number', aerial_refuelling.aerialrefuelling_ts.sequence_number,
       'correction_number', aerial_refuelling.aerialrefuelling_ts.correction_number,
       'valid_time_begin', aerial_refuelling.aerialrefuelling_ts.valid_time_begin,
       'valid_time_end', aerial_refuelling.aerialrefuelling_ts.valid_time_end,
       'feature_lifetime_begin', aerial_refuelling.aerialrefuelling_ts.feature_lifetime_begin,
       'feature_lifetime_end', aerial_refuelling.aerialrefuelling_ts.feature_lifetime_end
    ) AS aerialrefuellingtimeslicetype
FROM

-- AerialRefuellingPropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerial_refuelling.aerialrefuelling_ts.oppositetrack_id = AerialRefuellingPropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerial_refuelling.aerialrefuelling_ts.abstractaerialrefuellingextension_id = AbstractExtensionType.id

-- RouteAvailabilityPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuelling_ts.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON master_join.target_id = RouteAvailabilityPropertyType.id
-- AirspacePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuelling_ts.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON master_join.target_id = AirspacePropertyType.id
-- AerialRefuellingTrackPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuelling_ts.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON master_join.target_id = AerialRefuellingTrackPropertyType.id
-- AerialRefuellingAnchorPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuelling_ts.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON master_join.target_id = AerialRefuellingAnchorPropertyType.id
-- AuthorityForAerialRefuellingPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuelling_ts.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON master_join.target_id = AuthorityForAerialRefuellingPropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuelling_ts.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON master_join.target_id = NotePropertyType.id
;

AerialRefuellingTrackPropertyType
CREATE OR REPLACE VIEW aerialrefuellingtrackpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuellingtrack_pt.id
    ) AS aerialrefuellingtrackpropertytype
FROM

-- AerialRefuellingTrackType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack_pt
ON aerial_refuelling.aerialrefuellingtrack_pt.aerialrefuellingtrack_id = AerialRefuellingTrackType.id

;

AerialRefuellingTrackType
CREATE OR REPLACE VIEW aerialrefuellingtracktype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuellingtrack.id,
       'identifier', aerial_refuelling.aerialrefuellingtrack.identifier,
       'identifier_code_space', aerial_refuelling.aerialrefuellingtrack.identifier_code_space,
       'xml_id', aerial_refuelling.aerialrefuellingtrack.xml_id
    ) AS aerialrefuellingtracktype
FROM

-- CurvePropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON aerial_refuelling.aerialrefuellingtrack.extent_id = CurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON aerial_refuelling.aerialrefuellingtrack.abstractaerialrefuellingtrackextension_id = AbstractExtensionType.id

-- AerialRefuellingPointPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellingtrack.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON master_join.target_id = AerialRefuellingPointPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellingtrack.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON master_join.target_id = AirspaceLayerPropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuellingtrack.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON master_join.target_id = NotePropertyType.id
;

AerialRefuellingType
CREATE OR REPLACE VIEW aerialrefuellingtype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuelling.id,
       'identifier', aerial_refuelling.aerialrefuelling.identifier,
       'identifier_code_space', aerial_refuelling.aerialrefuelling.identifier_code_space,
       'xml_id', aerial_refuelling.aerialrefuelling.xml_id
    ) AS aerialrefuellingtype
FROM


-- AerialRefuellingTimeSlicePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.aerialrefuelling.id = master_join.source_id
LEFT JOIN aerial_refuelling.aerialrefuelling
ON master_join.target_id = AerialRefuellingTimeSlicePropertyType.id
;

AeronauticalGroundLightPropertyType
CREATE OR REPLACE VIEW aeronauticalgroundlightpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.aeronauticalgroundlight_pt.id,
       'nilReason', navaids_points.aeronauticalgroundlight_pt.nilReason
    ) AS aeronauticalgroundlightpropertytype
FROM


;

AeronauticalGroundLightTimeSlicePropertyType
CREATE OR REPLACE VIEW aeronauticalgroundlighttimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.aeronauticalgroundlight_tsp.id
    ) AS aeronauticalgroundlighttimeslicepropertytype
FROM

-- AeronauticalGroundLightTimeSliceType
LEFT JOIN navaids_points.aeronauticalgroundlight_tsp
ON navaids_points.aeronauticalgroundlight_tsp.aeronauticalgroundlighttimeslice_id = AeronauticalGroundLightTimeSliceType.id

;

AeronauticalGroundLightTimeSliceType
CREATE OR REPLACE VIEW aeronauticalgroundlighttimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', navaids_points.aeronauticalgroundlight_ts.name_value,
       'name_nilreason', navaids_points.aeronauticalgroundlight_ts.name_nilreason,
       'type_value', navaids_points.aeronauticalgroundlight_ts.type_value,
       'type_nilreason', navaids_points.aeronauticalgroundlight_ts.type_nilreason,
       'colour_value', navaids_points.aeronauticalgroundlight_ts.colour_value,
       'colour_nilreason', navaids_points.aeronauticalgroundlight_ts.colour_nilreason,
       'flashing_value', navaids_points.aeronauticalgroundlight_ts.flashing_value,
       'flashing_nilreason', navaids_points.aeronauticalgroundlight_ts.flashing_nilreason,
       'id', navaids_points.aeronauticalgroundlight_ts.id,
       'xml_id', navaids_points.aeronauticalgroundlight_ts.xml_id,
       'interpretation', navaids_points.aeronauticalgroundlight_ts.interpretation,
       'sequence_number', navaids_points.aeronauticalgroundlight_ts.sequence_number,
       'correction_number', navaids_points.aeronauticalgroundlight_ts.correction_number,
       'valid_time_begin', navaids_points.aeronauticalgroundlight_ts.valid_time_begin,
       'valid_time_end', navaids_points.aeronauticalgroundlight_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.aeronauticalgroundlight_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.aeronauticalgroundlight_ts.feature_lifetime_end
    ) AS aeronauticalgroundlighttimeslicetype
FROM

-- VerticalStructurePropertyType
LEFT JOIN navaids_points.aeronauticalgroundlight_ts
ON navaids_points.aeronauticalgroundlight_ts.structurebeacon_id = VerticalStructurePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.aeronauticalgroundlight_ts
ON navaids_points.aeronauticalgroundlight_ts.aerodromebeacon_id = AirportHeliportPropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN navaids_points.aeronauticalgroundlight_ts
ON navaids_points.aeronauticalgroundlight_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.aeronauticalgroundlight_ts
ON navaids_points.aeronauticalgroundlight_ts.abstractaeronauticalgroundlightextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.aeronauticalgroundlight_ts.id = master_join.source_id
LEFT JOIN navaids_points.aeronauticalgroundlight_ts
ON master_join.target_id = NotePropertyType.id
;

AeronauticalGroundLightType
CREATE OR REPLACE VIEW aeronauticalgroundlighttype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.aeronauticalgroundlight.id,
       'identifier', navaids_points.aeronauticalgroundlight.identifier,
       'identifier_code_space', navaids_points.aeronauticalgroundlight.identifier_code_space,
       'xml_id', navaids_points.aeronauticalgroundlight.xml_id
    ) AS aeronauticalgroundlighttype
FROM


-- AeronauticalGroundLightTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.aeronauticalgroundlight.id = master_join.source_id
LEFT JOIN navaids_points.aeronauticalgroundlight
ON master_join.target_id = AeronauticalGroundLightTimeSlicePropertyType.id
;

AircraftCharacteristicPropertyType
CREATE OR REPLACE VIEW aircraftcharacteristicpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.aircraftcharacteristic_pt.id
    ) AS aircraftcharacteristicpropertytype
FROM

-- AircraftCharacteristicType
LEFT JOIN shared.aircraftcharacteristic_pt
ON shared.aircraftcharacteristic_pt.aircraftcharacteristic_id = AircraftCharacteristicType.id

;

AircraftCharacteristicType
CREATE OR REPLACE VIEW aircraftcharacteristictype_view AS
SELECT
    jsonb_build_object(
       'type_value', shared.aircraftcharacteristic.type_value,
       'type_nilreason', shared.aircraftcharacteristic.type_nilreason,
       'engine_value', shared.aircraftcharacteristic.engine_value,
       'engine_nilreason', shared.aircraftcharacteristic.engine_nilreason,
       'numberengine_value', shared.aircraftcharacteristic.numberengine_value,
       'numberengine_nilreason', shared.aircraftcharacteristic.numberengine_nilreason,
       'typeaircrafticao_value', shared.aircraftcharacteristic.typeaircrafticao_value,
       'typeaircrafticao_nilreason', shared.aircraftcharacteristic.typeaircrafticao_nilreason,
       'aircraftlandingcategory_value', shared.aircraftcharacteristic.aircraftlandingcategory_value,
       'aircraftlandingcategory_nilreason', shared.aircraftcharacteristic.aircraftlandingcategory_nilreason,
       'wingspaninterpretation_value', shared.aircraftcharacteristic.wingspaninterpretation_value,
       'wingspaninterpretation_nilreason', shared.aircraftcharacteristic.wingspaninterpretation_nilreason,
       'classwingspan_value', shared.aircraftcharacteristic.classwingspan_value,
       'classwingspan_nilreason', shared.aircraftcharacteristic.classwingspan_nilreason,
       'weightinterpretation_value', shared.aircraftcharacteristic.weightinterpretation_value,
       'weightinterpretation_nilreason', shared.aircraftcharacteristic.weightinterpretation_nilreason,
       'passengers_value', shared.aircraftcharacteristic.passengers_value,
       'passengers_nilreason', shared.aircraftcharacteristic.passengers_nilreason,
       'passengersinterpretation_value', shared.aircraftcharacteristic.passengersinterpretation_value,
       'passengersinterpretation_nilreason', shared.aircraftcharacteristic.passengersinterpretation_nilreason,
       'speedinterpretation_value', shared.aircraftcharacteristic.speedinterpretation_value,
       'speedinterpretation_nilreason', shared.aircraftcharacteristic.speedinterpretation_nilreason,
       'waketurbulence_value', shared.aircraftcharacteristic.waketurbulence_value,
       'waketurbulence_nilreason', shared.aircraftcharacteristic.waketurbulence_nilreason,
       'navigationequipment_value', shared.aircraftcharacteristic.navigationequipment_value,
       'navigationequipment_nilreason', shared.aircraftcharacteristic.navigationequipment_nilreason,
       'navigationspecification_value', shared.aircraftcharacteristic.navigationspecification_value,
       'navigationspecification_nilreason', shared.aircraftcharacteristic.navigationspecification_nilreason,
       'verticalseparationcapability_value', shared.aircraftcharacteristic.verticalseparationcapability_value,
       'verticalseparationcapability_nilreason', shared.aircraftcharacteristic.verticalseparationcapability_nilreason,
       'anticollisionandseparationequipment_value', shared.aircraftcharacteristic.anticollisionandseparationequipment_value,
       'anticollisionandseparationequipment_nilreason', shared.aircraftcharacteristic.anticollisionandseparationequipment_nilreason,
       'communicationequipment_value', shared.aircraftcharacteristic.communicationequipment_value,
       'communicationequipment_nilreason', shared.aircraftcharacteristic.communicationequipment_nilreason,
       'surveillanceequipment_value', shared.aircraftcharacteristic.surveillanceequipment_value,
       'surveillanceequipment_nilreason', shared.aircraftcharacteristic.surveillanceequipment_nilreason,
       'wingspan_value', shared.aircraftcharacteristic.wingspan_value,
       'wingspan_uom', shared.aircraftcharacteristic.wingspan_uom,
       'wingspan_nilreason', shared.aircraftcharacteristic.wingspan_nilreason,
       'weight_value', shared.aircraftcharacteristic.weight_value,
       'weight_uom', shared.aircraftcharacteristic.weight_uom,
       'weight_nilreason', shared.aircraftcharacteristic.weight_nilreason,
       'speed_value', shared.aircraftcharacteristic.speed_value,
       'speed_uom', shared.aircraftcharacteristic.speed_uom,
       'speed_nilreason', shared.aircraftcharacteristic.speed_nilreason,
       'id', shared.aircraftcharacteristic.id,
       'identifier', shared.aircraftcharacteristic.identifier,
       'identifier_code_space', shared.aircraftcharacteristic.identifier_code_space,
       'xml_id', shared.aircraftcharacteristic.xml_id
    ) AS aircraftcharacteristictype
FROM

-- AbstractExtensionType
LEFT JOIN shared.aircraftcharacteristic
ON shared.aircraftcharacteristic.abstractaircraftcharacteristicextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.aircraftcharacteristic.id = master_join.source_id
LEFT JOIN shared.aircraftcharacteristic
ON master_join.target_id = NotePropertyType.id
;

AircraftGroundServicePropertyType
CREATE OR REPLACE VIEW aircraftgroundservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.aircraftgroundservice_pt.id,
       'nilReason', service.aircraftgroundservice_pt.nilReason
    ) AS aircraftgroundservicepropertytype
FROM


;

AircraftGroundServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW aircraftgroundservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.aircraftgroundservice_tsp.id
    ) AS aircraftgroundservicetimeslicepropertytype
FROM

-- AircraftGroundServiceTimeSliceType
LEFT JOIN service.aircraftgroundservice_tsp
ON service.aircraftgroundservice_tsp.aircraftgroundservicetimeslice_id = AircraftGroundServiceTimeSliceType.id

;

AircraftGroundServiceTimeSliceType
CREATE OR REPLACE VIEW aircraftgroundservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.aircraftgroundservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.aircraftgroundservice_ts.flightoperations_nilreason,
       'rank_value', service.aircraftgroundservice_ts.rank_value,
       'rank_nilreason', service.aircraftgroundservice_ts.rank_nilreason,
       'complianticao_value', service.aircraftgroundservice_ts.complianticao_value,
       'complianticao_nilreason', service.aircraftgroundservice_ts.complianticao_nilreason,
       'name_value', service.aircraftgroundservice_ts.name_value,
       'name_nilreason', service.aircraftgroundservice_ts.name_nilreason,
       'type_value', service.aircraftgroundservice_ts.type_value,
       'type_nilreason', service.aircraftgroundservice_ts.type_nilreason,
       'id', service.aircraftgroundservice_ts.id,
       'xml_id', service.aircraftgroundservice_ts.xml_id,
       'interpretation', service.aircraftgroundservice_ts.interpretation,
       'sequence_number', service.aircraftgroundservice_ts.sequence_number,
       'correction_number', service.aircraftgroundservice_ts.correction_number,
       'valid_time_begin', service.aircraftgroundservice_ts.valid_time_begin,
       'valid_time_end', service.aircraftgroundservice_ts.valid_time_end,
       'feature_lifetime_begin', service.aircraftgroundservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.aircraftgroundservice_ts.feature_lifetime_end
    ) AS aircraftgroundservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.aircraftgroundservice_ts
ON service.aircraftgroundservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.aircraftgroundservice_ts
ON service.aircraftgroundservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.aircraftgroundservice_ts
ON service.aircraftgroundservice_ts.abstractaircraftgroundserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.aircraftgroundservice_ts
ON service.aircraftgroundservice_ts.abstractairportgroundserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.aircraftgroundservice_ts
ON service.aircraftgroundservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.aircraftgroundservice_ts.id = master_join.source_id
LEFT JOIN service.aircraftgroundservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.aircraftgroundservice_ts.id = master_join.source_id
LEFT JOIN service.aircraftgroundservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.aircraftgroundservice_ts.id = master_join.source_id
LEFT JOIN service.aircraftgroundservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.aircraftgroundservice_ts.id = master_join.source_id
LEFT JOIN service.aircraftgroundservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.aircraftgroundservice_ts.id = master_join.source_id
LEFT JOIN service.aircraftgroundservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.master_join
ON service.aircraftgroundservice_ts.id = master_join.source_id
LEFT JOIN service.aircraftgroundservice_ts
ON master_join.target_id = AirportHeliportPropertyType.id
;

AircraftGroundServiceType
CREATE OR REPLACE VIEW aircraftgroundservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.aircraftgroundservice.id,
       'identifier', service.aircraftgroundservice.identifier,
       'identifier_code_space', service.aircraftgroundservice.identifier_code_space,
       'xml_id', service.aircraftgroundservice.xml_id
    ) AS aircraftgroundservicetype
FROM


-- AircraftGroundServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.aircraftgroundservice.id = master_join.source_id
LEFT JOIN service.aircraftgroundservice
ON master_join.target_id = AircraftGroundServiceTimeSlicePropertyType.id
;

AircraftStandContaminationPropertyType
CREATE OR REPLACE VIEW aircraftstandcontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aircraftstandcontamination_pt.id
    ) AS aircraftstandcontaminationpropertytype
FROM

-- AircraftStandContaminationType
LEFT JOIN airport_heliport.aircraftstandcontamination_pt
ON airport_heliport.aircraftstandcontamination_pt.aircraftstandcontamination_id = AircraftStandContaminationType.id

;

AircraftStandContaminationType
CREATE OR REPLACE VIEW aircraftstandcontaminationtype_view AS
SELECT
    jsonb_build_object(
       'observationTime_value', airport_heliport.aircraftstandcontamination.observationTime_value,
       'observationTime_nilreason', airport_heliport.aircraftstandcontamination.observationTime_nilreason,
       'nextObservationTime_value', airport_heliport.aircraftstandcontamination.nextObservationTime_value,
       'nextObservationTime_nilreason', airport_heliport.aircraftstandcontamination.nextObservationTime_nilreason,
       'frictioncoefficient_value', airport_heliport.aircraftstandcontamination.frictioncoefficient_value,
       'frictioncoefficient_nilreason', airport_heliport.aircraftstandcontamination.frictioncoefficient_nilreason,
       'frictionestimation_value', airport_heliport.aircraftstandcontamination.frictionestimation_value,
       'frictionestimation_nilreason', airport_heliport.aircraftstandcontamination.frictionestimation_nilreason,
       'frictiondevice_value', airport_heliport.aircraftstandcontamination.frictiondevice_value,
       'frictiondevice_nilreason', airport_heliport.aircraftstandcontamination.frictiondevice_nilreason,
       'obscuredlights_value', airport_heliport.aircraftstandcontamination.obscuredlights_value,
       'obscuredlights_nilreason', airport_heliport.aircraftstandcontamination.obscuredlights_nilreason,
       'furtherclearancetime_value', airport_heliport.aircraftstandcontamination.furtherclearancetime_value,
       'furtherclearancetime_nilreason', airport_heliport.aircraftstandcontamination.furtherclearancetime_nilreason,
       'furthertotalclearance_value', airport_heliport.aircraftstandcontamination.furthertotalclearance_value,
       'furthertotalclearance_nilreason', airport_heliport.aircraftstandcontamination.furthertotalclearance_nilreason,
       'proportion_value', airport_heliport.aircraftstandcontamination.proportion_value,
       'proportion_nilreason', airport_heliport.aircraftstandcontamination.proportion_nilreason,
       'depth_value', airport_heliport.aircraftstandcontamination.depth_value,
       'depth_uom', airport_heliport.aircraftstandcontamination.depth_uom,
       'depth_nilreason', airport_heliport.aircraftstandcontamination.depth_nilreason,
       'id', airport_heliport.aircraftstandcontamination.id,
       'identifier', airport_heliport.aircraftstandcontamination.identifier,
       'identifier_code_space', airport_heliport.aircraftstandcontamination.identifier_code_space,
       'xml_id', airport_heliport.aircraftstandcontamination.xml_id
    ) AS aircraftstandcontaminationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.aircraftstandcontamination
ON airport_heliport.aircraftstandcontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.aircraftstandcontamination
ON airport_heliport.aircraftstandcontamination.abstractaircraftstandcontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aircraftstandcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.aircraftstandcontamination
ON master_join.target_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aircraftstandcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.aircraftstandcontamination
ON master_join.target_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aircraftstandcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.aircraftstandcontamination
ON master_join.target_id = NotePropertyType.id
;

AircraftStandPropertyType
CREATE OR REPLACE VIEW aircraftstandpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aircraftstand_pt.id,
       'nilReason', airport_heliport.aircraftstand_pt.nilReason
    ) AS aircraftstandpropertytype
FROM


;

AircraftStandTimeSlicePropertyType
CREATE OR REPLACE VIEW aircraftstandtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aircraftstand_tsp.id
    ) AS aircraftstandtimeslicepropertytype
FROM

-- AircraftStandTimeSliceType
LEFT JOIN airport_heliport.aircraftstand_tsp
ON airport_heliport.aircraftstand_tsp.aircraftstandtimeslice_id = AircraftStandTimeSliceType.id

;

AircraftStandTimeSliceType
CREATE OR REPLACE VIEW aircraftstandtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.aircraftstand_ts.designator_value,
       'designator_nilreason', airport_heliport.aircraftstand_ts.designator_nilreason,
       'type_value', airport_heliport.aircraftstand_ts.type_value,
       'type_nilreason', airport_heliport.aircraftstand_ts.type_nilreason,
       'visualdockingsystem_value', airport_heliport.aircraftstand_ts.visualdockingsystem_value,
       'visualdockingsystem_nilreason', airport_heliport.aircraftstand_ts.visualdockingsystem_nilreason,
       'id', airport_heliport.aircraftstand_ts.id,
       'xml_id', airport_heliport.aircraftstand_ts.xml_id,
       'interpretation', airport_heliport.aircraftstand_ts.interpretation,
       'sequence_number', airport_heliport.aircraftstand_ts.sequence_number,
       'correction_number', airport_heliport.aircraftstand_ts.correction_number,
       'valid_time_begin', airport_heliport.aircraftstand_ts.valid_time_begin,
       'valid_time_end', airport_heliport.aircraftstand_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.aircraftstand_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.aircraftstand_ts.feature_lifetime_end
    ) AS aircraftstandtimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.aircraftstand_ts
ON airport_heliport.aircraftstand_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.aircraftstand_ts
ON airport_heliport.aircraftstand_ts.location_id = ElevatedPointPropertyType.id
-- ApronElementPropertyType
LEFT JOIN airport_heliport.aircraftstand_ts
ON airport_heliport.aircraftstand_ts.apronlocation_id = ApronElementPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.aircraftstand_ts
ON airport_heliport.aircraftstand_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.aircraftstand_ts
ON airport_heliport.aircraftstand_ts.abstractaircraftstandextension_id = AbstractExtensionType.id

-- AircraftStandContaminationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aircraftstand_ts.id = master_join.source_id
LEFT JOIN airport_heliport.aircraftstand_ts
ON master_join.target_id = AircraftStandContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aircraftstand_ts.id = master_join.source_id
LEFT JOIN airport_heliport.aircraftstand_ts
ON master_join.target_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aircraftstand_ts.id = master_join.source_id
LEFT JOIN airport_heliport.aircraftstand_ts
ON master_join.target_id = ApronAreaAvailabilityPropertyType.id
;

AircraftStandType
CREATE OR REPLACE VIEW aircraftstandtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aircraftstand.id,
       'identifier', airport_heliport.aircraftstand.identifier,
       'identifier_code_space', airport_heliport.aircraftstand.identifier_code_space,
       'xml_id', airport_heliport.aircraftstand.xml_id
    ) AS aircraftstandtype
FROM


-- AircraftStandTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aircraftstand.id = master_join.source_id
LEFT JOIN airport_heliport.aircraftstand
ON master_join.target_id = AircraftStandTimeSlicePropertyType.id
;

AirportClearanceServicePropertyType
CREATE OR REPLACE VIEW airportclearanceservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airportclearanceservice_pt.id,
       'nilReason', service.airportclearanceservice_pt.nilReason
    ) AS airportclearanceservicepropertytype
FROM


;

AirportClearanceServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW airportclearanceservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airportclearanceservice_tsp.id
    ) AS airportclearanceservicetimeslicepropertytype
FROM

-- AirportClearanceServiceTimeSliceType
LEFT JOIN service.airportclearanceservice_tsp
ON service.airportclearanceservice_tsp.airportclearanceservicetimeslice_id = AirportClearanceServiceTimeSliceType.id

;

AirportClearanceServiceTimeSliceType
CREATE OR REPLACE VIEW airportclearanceservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.airportclearanceservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.airportclearanceservice_ts.flightoperations_nilreason,
       'rank_value', service.airportclearanceservice_ts.rank_value,
       'rank_nilreason', service.airportclearanceservice_ts.rank_nilreason,
       'complianticao_value', service.airportclearanceservice_ts.complianticao_value,
       'complianticao_nilreason', service.airportclearanceservice_ts.complianticao_nilreason,
       'name_value', service.airportclearanceservice_ts.name_value,
       'name_nilreason', service.airportclearanceservice_ts.name_nilreason,
       'snowplan_value', service.airportclearanceservice_ts.snowplan_value,
       'snowplan_nilreason', service.airportclearanceservice_ts.snowplan_nilreason,
       'id', service.airportclearanceservice_ts.id,
       'xml_id', service.airportclearanceservice_ts.xml_id,
       'interpretation', service.airportclearanceservice_ts.interpretation,
       'sequence_number', service.airportclearanceservice_ts.sequence_number,
       'correction_number', service.airportclearanceservice_ts.correction_number,
       'valid_time_begin', service.airportclearanceservice_ts.valid_time_begin,
       'valid_time_end', service.airportclearanceservice_ts.valid_time_end,
       'feature_lifetime_begin', service.airportclearanceservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.airportclearanceservice_ts.feature_lifetime_end
    ) AS airportclearanceservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.airportclearanceservice_ts
ON service.airportclearanceservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.airportclearanceservice_ts
ON service.airportclearanceservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.airportclearanceservice_ts
ON service.airportclearanceservice_ts.abstractairportclearanceserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.airportclearanceservice_ts
ON service.airportclearanceservice_ts.abstractairportgroundserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.airportclearanceservice_ts
ON service.airportclearanceservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.airportclearanceservice_ts.id = master_join.source_id
LEFT JOIN service.airportclearanceservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.airportclearanceservice_ts.id = master_join.source_id
LEFT JOIN service.airportclearanceservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.airportclearanceservice_ts.id = master_join.source_id
LEFT JOIN service.airportclearanceservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.airportclearanceservice_ts.id = master_join.source_id
LEFT JOIN service.airportclearanceservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.airportclearanceservice_ts.id = master_join.source_id
LEFT JOIN service.airportclearanceservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.master_join
ON service.airportclearanceservice_ts.id = master_join.source_id
LEFT JOIN service.airportclearanceservice_ts
ON master_join.target_id = AirportHeliportPropertyType.id
;

AirportClearanceServiceType
CREATE OR REPLACE VIEW airportclearanceservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.airportclearanceservice.id,
       'identifier', service.airportclearanceservice.identifier,
       'identifier_code_space', service.airportclearanceservice.identifier_code_space,
       'xml_id', service.airportclearanceservice.xml_id
    ) AS airportclearanceservicetype
FROM


-- AirportClearanceServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.airportclearanceservice.id = master_join.source_id
LEFT JOIN service.airportclearanceservice
ON master_join.target_id = AirportClearanceServiceTimeSlicePropertyType.id
;

AirportGroundServicePropertyType
CREATE OR REPLACE VIEW airportgroundservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airportgroundservice_pt.id,
       'nilReason', service.airportgroundservice_pt.nilReason
    ) AS airportgroundservicepropertytype
FROM


;

AirportHeliportAvailabilityPropertyType
CREATE OR REPLACE VIEW airportheliportavailabilitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportavailability_pt.id
    ) AS airportheliportavailabilitypropertytype
FROM

-- AirportHeliportAvailabilityType
LEFT JOIN airport_heliport.airportheliportavailability_pt
ON airport_heliport.airportheliportavailability_pt.airportheliportavailability_id = AirportHeliportAvailabilityType.id

;

AirportHeliportAvailabilityType
CREATE OR REPLACE VIEW airportheliportavailabilitytype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', airport_heliport.airportheliportavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.airportheliportavailability.operationalstatus_nilreason,
       'warning_value', airport_heliport.airportheliportavailability.warning_value,
       'warning_nilreason', airport_heliport.airportheliportavailability.warning_nilreason,
       'id', airport_heliport.airportheliportavailability.id,
       'identifier', airport_heliport.airportheliportavailability.identifier,
       'identifier_code_space', airport_heliport.airportheliportavailability.identifier_code_space,
       'xml_id', airport_heliport.airportheliportavailability.xml_id
    ) AS airportheliportavailabilitytype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportavailability
ON airport_heliport.airportheliportavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportavailability
ON airport_heliport.airportheliportavailability.abstractairportheliportavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportavailability.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportavailability
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportavailability.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportavailability
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportavailability.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportavailability
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- AirportHeliportUsagePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportavailability.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportavailability
ON master_join.target_id = AirportHeliportUsagePropertyType.id
;

AirportHeliportCollocationPropertyType
CREATE OR REPLACE VIEW airportheliportcollocationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportcollocation_pt.id,
       'nilReason', airport_heliport.airportheliportcollocation_pt.nilReason
    ) AS airportheliportcollocationpropertytype
FROM


;

AirportHeliportCollocationTimeSlicePropertyType
CREATE OR REPLACE VIEW airportheliportcollocationtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportcollocation_tsp.id
    ) AS airportheliportcollocationtimeslicepropertytype
FROM

-- AirportHeliportCollocationTimeSliceType
LEFT JOIN airport_heliport.airportheliportcollocation_tsp
ON airport_heliport.airportheliportcollocation_tsp.airportheliportcollocationtimeslice_id = AirportHeliportCollocationTimeSliceType.id

;

AirportHeliportCollocationTimeSliceType
CREATE OR REPLACE VIEW airportheliportcollocationtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.airportheliportcollocation_ts.type_value,
       'type_nilreason', airport_heliport.airportheliportcollocation_ts.type_nilreason,
       'id', airport_heliport.airportheliportcollocation_ts.id,
       'xml_id', airport_heliport.airportheliportcollocation_ts.xml_id,
       'interpretation', airport_heliport.airportheliportcollocation_ts.interpretation,
       'sequence_number', airport_heliport.airportheliportcollocation_ts.sequence_number,
       'correction_number', airport_heliport.airportheliportcollocation_ts.correction_number,
       'valid_time_begin', airport_heliport.airportheliportcollocation_ts.valid_time_begin,
       'valid_time_end', airport_heliport.airportheliportcollocation_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.airportheliportcollocation_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.airportheliportcollocation_ts.feature_lifetime_end
    ) AS airportheliportcollocationtimeslicetype
FROM

-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.airportheliportcollocation_ts
ON airport_heliport.airportheliportcollocation_ts.hostairport_id = AirportHeliportPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.airportheliportcollocation_ts
ON airport_heliport.airportheliportcollocation_ts.dependentairport_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportcollocation_ts
ON airport_heliport.airportheliportcollocation_ts.abstractairportheliportcollocationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportcollocation_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportcollocation_ts
ON master_join.target_id = NotePropertyType.id
;

AirportHeliportCollocationType
CREATE OR REPLACE VIEW airportheliportcollocationtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportcollocation.id,
       'identifier', airport_heliport.airportheliportcollocation.identifier,
       'identifier_code_space', airport_heliport.airportheliportcollocation.identifier_code_space,
       'xml_id', airport_heliport.airportheliportcollocation.xml_id
    ) AS airportheliportcollocationtype
FROM


-- AirportHeliportCollocationTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportcollocation.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportcollocation
ON master_join.target_id = AirportHeliportCollocationTimeSlicePropertyType.id
;

AirportHeliportContaminationPropertyType
CREATE OR REPLACE VIEW airportheliportcontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportcontamination_pt.id
    ) AS airportheliportcontaminationpropertytype
FROM

-- AirportHeliportContaminationType
LEFT JOIN airport_heliport.airportheliportcontamination_pt
ON airport_heliport.airportheliportcontamination_pt.airportheliportcontamination_id = AirportHeliportContaminationType.id

;

AirportHeliportContaminationType
CREATE OR REPLACE VIEW airportheliportcontaminationtype_view AS
SELECT
    jsonb_build_object(
       'observationTime_value', airport_heliport.airportheliportcontamination.observationTime_value,
       'observationTime_nilreason', airport_heliport.airportheliportcontamination.observationTime_nilreason,
       'nextObservationTime_value', airport_heliport.airportheliportcontamination.nextObservationTime_value,
       'nextObservationTime_nilreason', airport_heliport.airportheliportcontamination.nextObservationTime_nilreason,
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
       'proportion_value', airport_heliport.airportheliportcontamination.proportion_value,
       'proportion_nilreason', airport_heliport.airportheliportcontamination.proportion_nilreason,
       'depth_value', airport_heliport.airportheliportcontamination.depth_value,
       'depth_uom', airport_heliport.airportheliportcontamination.depth_uom,
       'depth_nilreason', airport_heliport.airportheliportcontamination.depth_nilreason,
       'id', airport_heliport.airportheliportcontamination.id,
       'identifier', airport_heliport.airportheliportcontamination.identifier,
       'identifier_code_space', airport_heliport.airportheliportcontamination.identifier_code_space,
       'xml_id', airport_heliport.airportheliportcontamination.xml_id
    ) AS airportheliportcontaminationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportcontamination
ON airport_heliport.airportheliportcontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportcontamination
ON airport_heliport.airportheliportcontamination.abstractairportheliportcontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportcontamination
ON master_join.target_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportcontamination
ON master_join.target_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportcontamination
ON master_join.target_id = NotePropertyType.id
;

AirportHeliportPropertyType
CREATE OR REPLACE VIEW airportheliportpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliport_pt.id,
       'nilReason', airport_heliport.airportheliport_pt.nilReason
    ) AS airportheliportpropertytype
FROM


;

AirportHeliportProtectionAreaPropertyType
CREATE OR REPLACE VIEW airportheliportprotectionareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportprotectionarea_pt.id,
       'nilReason', airport_heliport.airportheliportprotectionarea_pt.nilReason
    ) AS airportheliportprotectionareapropertytype
FROM


;

AirportHeliportResponsibilityOrganisationPropertyType
CREATE OR REPLACE VIEW airportheliportresponsibilityorganisationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportresponsibilityorganisation_pt.id
    ) AS airportheliportresponsibilityorganisationpropertytype
FROM

-- AirportHeliportResponsibilityOrganisationType
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation_pt
ON airport_heliport.airportheliportresponsibilityorganisation_pt.airportheliportresponsibilityorganisation_id = AirportHeliportResponsibilityOrganisationType.id

;

AirportHeliportResponsibilityOrganisationType
CREATE OR REPLACE VIEW airportheliportresponsibilityorganisationtype_view AS
SELECT
    jsonb_build_object(
       'role_value', airport_heliport.airportheliportresponsibilityorganisation.role_value,
       'role_nilreason', airport_heliport.airportheliportresponsibilityorganisation.role_nilreason,
       'id', airport_heliport.airportheliportresponsibilityorganisation.id,
       'identifier', airport_heliport.airportheliportresponsibilityorganisation.identifier,
       'identifier_code_space', airport_heliport.airportheliportresponsibilityorganisation.identifier_code_space,
       'xml_id', airport_heliport.airportheliportresponsibilityorganisation.xml_id
    ) AS airportheliportresponsibilityorganisationtype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON airport_heliport.airportheliportresponsibilityorganisation.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON airport_heliport.airportheliportresponsibilityorganisation.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON airport_heliport.airportheliportresponsibilityorganisation.abstractairportheliportresponsibilityorganisationextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportresponsibilityorganisation.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportresponsibilityorganisation.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportresponsibilityorganisation.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

AirportHeliportTimeSlicePropertyType
CREATE OR REPLACE VIEW airportheliporttimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliport_tsp.id
    ) AS airportheliporttimeslicepropertytype
FROM

-- AirportHeliportTimeSliceType
LEFT JOIN airport_heliport.airportheliport_tsp
ON airport_heliport.airportheliport_tsp.airportheliporttimeslice_id = AirportHeliportTimeSliceType.id

;

AirportHeliportTimeSliceType
CREATE OR REPLACE VIEW airportheliporttimeslicetype_view AS
SELECT
    jsonb_build_object(
       'certificationDate_value', airport_heliport.airportheliport_ts.certificationDate_value,
       'certificationDate_nilreason', airport_heliport.airportheliport_ts.certificationDate_nilreason,
       'certificationExpirationDate_value', airport_heliport.airportheliport_ts.certificationExpirationDate_value,
       'certificationExpirationDate_nilreason', airport_heliport.airportheliport_ts.certificationExpirationDate_nilreason,
       'designator_value', airport_heliport.airportheliport_ts.designator_value,
       'designator_nilreason', airport_heliport.airportheliport_ts.designator_nilreason,
       'name_value', airport_heliport.airportheliport_ts.name_value,
       'name_nilreason', airport_heliport.airportheliport_ts.name_nilreason,
       'locationindicatoricao_value', airport_heliport.airportheliport_ts.locationindicatoricao_value,
       'locationindicatoricao_nilreason', airport_heliport.airportheliport_ts.locationindicatoricao_nilreason,
       'designatoriata_value', airport_heliport.airportheliport_ts.designatoriata_value,
       'designatoriata_nilreason', airport_heliport.airportheliport_ts.designatoriata_nilreason,
       'type_value', airport_heliport.airportheliport_ts.type_value,
       'type_nilreason', airport_heliport.airportheliport_ts.type_nilreason,
       'certifiedicao_value', airport_heliport.airportheliport_ts.certifiedicao_value,
       'certifiedicao_nilreason', airport_heliport.airportheliport_ts.certifiedicao_nilreason,
       'privateuse_value', airport_heliport.airportheliport_ts.privateuse_value,
       'privateuse_nilreason', airport_heliport.airportheliport_ts.privateuse_nilreason,
       'controltype_value', airport_heliport.airportheliport_ts.controltype_value,
       'controltype_nilreason', airport_heliport.airportheliport_ts.controltype_nilreason,
       'verticaldatum_value', airport_heliport.airportheliport_ts.verticaldatum_value,
       'verticaldatum_nilreason', airport_heliport.airportheliport_ts.verticaldatum_nilreason,
       'magneticvariation_value', airport_heliport.airportheliport_ts.magneticvariation_value,
       'magneticvariation_nilreason', airport_heliport.airportheliport_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', airport_heliport.airportheliport_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', airport_heliport.airportheliport_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', airport_heliport.airportheliport_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', airport_heliport.airportheliport_ts.datemagneticvariation_nilreason,
       'magneticvariationchange_value', airport_heliport.airportheliport_ts.magneticvariationchange_value,
       'magneticvariationchange_nilreason', airport_heliport.airportheliport_ts.magneticvariationchange_nilreason,
       'altimeterchecklocation_value', airport_heliport.airportheliport_ts.altimeterchecklocation_value,
       'altimeterchecklocation_nilreason', airport_heliport.airportheliport_ts.altimeterchecklocation_nilreason,
       'secondarypowersupply_value', airport_heliport.airportheliport_ts.secondarypowersupply_value,
       'secondarypowersupply_nilreason', airport_heliport.airportheliport_ts.secondarypowersupply_nilreason,
       'winddirectionindicator_value', airport_heliport.airportheliport_ts.winddirectionindicator_value,
       'winddirectionindicator_nilreason', airport_heliport.airportheliport_ts.winddirectionindicator_nilreason,
       'landingdirectionindicator_value', airport_heliport.airportheliport_ts.landingdirectionindicator_value,
       'landingdirectionindicator_nilreason', airport_heliport.airportheliport_ts.landingdirectionindicator_nilreason,
       'abandoned_value', airport_heliport.airportheliport_ts.abandoned_value,
       'abandoned_nilreason', airport_heliport.airportheliport_ts.abandoned_nilreason,
       'fieldelevation_value', airport_heliport.airportheliport_ts.fieldelevation_value,
       'fieldelevation_uom', airport_heliport.airportheliport_ts.fieldelevation_uom,
       'fieldelevation_nilreason', airport_heliport.airportheliport_ts.fieldelevation_nilreason,
       'fieldelevationaccuracy_value', airport_heliport.airportheliport_ts.fieldelevationaccuracy_value,
       'fieldelevationaccuracy_uom', airport_heliport.airportheliport_ts.fieldelevationaccuracy_uom,
       'fieldelevationaccuracy_nilreason', airport_heliport.airportheliport_ts.fieldelevationaccuracy_nilreason,
       'referencetemperature_value', airport_heliport.airportheliport_ts.referencetemperature_value,
       'referencetemperature_uom', airport_heliport.airportheliport_ts.referencetemperature_uom,
       'referencetemperature_nilreason', airport_heliport.airportheliport_ts.referencetemperature_nilreason,
       'transitionaltitude_value', airport_heliport.airportheliport_ts.transitionaltitude_value,
       'transitionaltitude_uom', airport_heliport.airportheliport_ts.transitionaltitude_uom,
       'transitionaltitude_nilreason', airport_heliport.airportheliport_ts.transitionaltitude_nilreason,
       'transitionlevel_value', airport_heliport.airportheliport_ts.transitionlevel_value,
       'transitionlevel_uom', airport_heliport.airportheliport_ts.transitionlevel_uom,
       'transitionlevel_nilreason', airport_heliport.airportheliport_ts.transitionlevel_nilreason,
       'lowesttemperature_value', airport_heliport.airportheliport_ts.lowesttemperature_value,
       'lowesttemperature_uom', airport_heliport.airportheliport_ts.lowesttemperature_uom,
       'lowesttemperature_nilreason', airport_heliport.airportheliport_ts.lowesttemperature_nilreason,
       'id', airport_heliport.airportheliport_ts.id,
       'xml_id', airport_heliport.airportheliport_ts.xml_id,
       'interpretation', airport_heliport.airportheliport_ts.interpretation,
       'sequence_number', airport_heliport.airportheliport_ts.sequence_number,
       'correction_number', airport_heliport.airportheliport_ts.correction_number,
       'valid_time_begin', airport_heliport.airportheliport_ts.valid_time_begin,
       'valid_time_end', airport_heliport.airportheliport_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.airportheliport_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.airportheliport_ts.feature_lifetime_end
    ) AS airportheliporttimeslicetype
FROM

-- AirportHeliportResponsibilityOrganisationPropertyType
LEFT JOIN airport_heliport.airportheliport_ts
ON airport_heliport.airportheliport_ts.responsibleorganisation_id = AirportHeliportResponsibilityOrganisationPropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.airportheliport_ts
ON airport_heliport.airportheliport_ts.arp_id = ElevatedPointPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.airportheliport_ts
ON airport_heliport.airportheliport_ts.aviationboundary_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliport_ts
ON airport_heliport.airportheliport_ts.abstractairportheliportextension_id = AbstractExtensionType.id

-- AirportHeliportContaminationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliport_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliport_ts
ON master_join.target_id = AirportHeliportContaminationPropertyType.id
-- CityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliport_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliport_ts
ON master_join.target_id = CityPropertyType.id
-- AltimeterSourcePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliport_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliport_ts
ON master_join.target_id = AltimeterSourcePropertyType.id
-- ContactInformationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliport_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliport_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- AirportHeliportAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliport_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliport_ts
ON master_join.target_id = AirportHeliportAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliport_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliport_ts
ON master_join.target_id = NotePropertyType.id
;

AirportHeliportType
CREATE OR REPLACE VIEW airportheliporttype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliport.id,
       'identifier', airport_heliport.airportheliport.identifier,
       'identifier_code_space', airport_heliport.airportheliport.identifier_code_space,
       'xml_id', airport_heliport.airportheliport.xml_id
    ) AS airportheliporttype
FROM


-- AirportHeliportTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliport.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliport
ON master_join.target_id = AirportHeliportTimeSlicePropertyType.id
;

AirportHeliportUsagePropertyType
CREATE OR REPLACE VIEW airportheliportusagepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportusage_pt.id
    ) AS airportheliportusagepropertytype
FROM

-- AirportHeliportUsageType
LEFT JOIN airport_heliport.airportheliportusage_pt
ON airport_heliport.airportheliportusage_pt.airportheliportusage_id = AirportHeliportUsageType.id

;

AirportHeliportUsageType
CREATE OR REPLACE VIEW airportheliportusagetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.airportheliportusage.type_value,
       'type_nilreason', airport_heliport.airportheliportusage.type_nilreason,
       'operation_value', airport_heliport.airportheliportusage.operation_value,
       'operation_nilreason', airport_heliport.airportheliportusage.operation_nilreason,
       'priorpermission_value', airport_heliport.airportheliportusage.priorpermission_value,
       'priorpermission_uom', airport_heliport.airportheliportusage.priorpermission_uom,
       'priorpermission_nilreason', airport_heliport.airportheliportusage.priorpermission_nilreason,
       'id', airport_heliport.airportheliportusage.id,
       'identifier', airport_heliport.airportheliportusage.identifier,
       'identifier_code_space', airport_heliport.airportheliportusage.identifier_code_space,
       'xml_id', airport_heliport.airportheliportusage.xml_id
    ) AS airportheliportusagetype
FROM

-- ConditionCombinationPropertyType
LEFT JOIN airport_heliport.airportheliportusage
ON airport_heliport.airportheliportusage.selection_id = ConditionCombinationPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportusage
ON airport_heliport.airportheliportusage.abstractusageconditionextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportusage
ON airport_heliport.airportheliportusage.abstractairportheliportusageextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportusage.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportusage
ON master_join.target_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportheliportusage.id = master_join.source_id
LEFT JOIN airport_heliport.airportheliportusage
ON master_join.target_id = NotePropertyType.id
;

AirportHotSpotPropertyType
CREATE OR REPLACE VIEW airporthotspotpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airporthotspot_pt.id,
       'nilReason', airport_heliport.airporthotspot_pt.nilReason
    ) AS airporthotspotpropertytype
FROM


;

AirportHotSpotTimeSlicePropertyType
CREATE OR REPLACE VIEW airporthotspottimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airporthotspot_tsp.id
    ) AS airporthotspottimeslicepropertytype
FROM

-- AirportHotSpotTimeSliceType
LEFT JOIN airport_heliport.airporthotspot_tsp
ON airport_heliport.airporthotspot_tsp.airporthotspottimeslice_id = AirportHotSpotTimeSliceType.id

;

AirportHotSpotTimeSliceType
CREATE OR REPLACE VIEW airporthotspottimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.airporthotspot_ts.designator_value,
       'designator_nilreason', airport_heliport.airporthotspot_ts.designator_nilreason,
       'instruction_value', airport_heliport.airporthotspot_ts.instruction_value,
       'instruction_nilreason', airport_heliport.airporthotspot_ts.instruction_nilreason,
       'id', airport_heliport.airporthotspot_ts.id,
       'xml_id', airport_heliport.airporthotspot_ts.xml_id,
       'interpretation', airport_heliport.airporthotspot_ts.interpretation,
       'sequence_number', airport_heliport.airporthotspot_ts.sequence_number,
       'correction_number', airport_heliport.airporthotspot_ts.correction_number,
       'valid_time_begin', airport_heliport.airporthotspot_ts.valid_time_begin,
       'valid_time_end', airport_heliport.airporthotspot_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.airporthotspot_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.airporthotspot_ts.feature_lifetime_end
    ) AS airporthotspottimeslicetype
FROM

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.airporthotspot_ts
ON airport_heliport.airporthotspot_ts.area_id = ElevatedSurfacePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.airporthotspot_ts
ON airport_heliport.airporthotspot_ts.affectedairport_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airporthotspot_ts
ON airport_heliport.airporthotspot_ts.abstractairporthotspotextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airporthotspot_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airporthotspot_ts
ON master_join.target_id = NotePropertyType.id
;

AirportHotSpotType
CREATE OR REPLACE VIEW airporthotspottype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airporthotspot.id,
       'identifier', airport_heliport.airporthotspot.identifier,
       'identifier_code_space', airport_heliport.airporthotspot.identifier_code_space,
       'xml_id', airport_heliport.airporthotspot.xml_id
    ) AS airporthotspottype
FROM


-- AirportHotSpotTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airporthotspot.id = master_join.source_id
LEFT JOIN airport_heliport.airporthotspot
ON master_join.target_id = AirportHotSpotTimeSlicePropertyType.id
;

AirportProtectionAreaMarkingPropertyType
CREATE OR REPLACE VIEW airportprotectionareamarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportprotectionareamarking_pt.id,
       'nilReason', airport_heliport.airportprotectionareamarking_pt.nilReason
    ) AS airportprotectionareamarkingpropertytype
FROM


;

AirportProtectionAreaMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW airportprotectionareamarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportprotectionareamarking_tsp.id
    ) AS airportprotectionareamarkingtimeslicepropertytype
FROM

-- AirportProtectionAreaMarkingTimeSliceType
LEFT JOIN airport_heliport.airportprotectionareamarking_tsp
ON airport_heliport.airportprotectionareamarking_tsp.airportprotectionareamarkingtimeslice_id = AirportProtectionAreaMarkingTimeSliceType.id

;

AirportProtectionAreaMarkingTimeSliceType
CREATE OR REPLACE VIEW airportprotectionareamarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.airportprotectionareamarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.airportprotectionareamarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.airportprotectionareamarking_ts.condition_value,
       'condition_nilreason', airport_heliport.airportprotectionareamarking_ts.condition_nilreason,
       'markinglocation_value', airport_heliport.airportprotectionareamarking_ts.markinglocation_value,
       'markinglocation_nilreason', airport_heliport.airportprotectionareamarking_ts.markinglocation_nilreason,
       'id', airport_heliport.airportprotectionareamarking_ts.id,
       'xml_id', airport_heliport.airportprotectionareamarking_ts.xml_id,
       'interpretation', airport_heliport.airportprotectionareamarking_ts.interpretation,
       'sequence_number', airport_heliport.airportprotectionareamarking_ts.sequence_number,
       'correction_number', airport_heliport.airportprotectionareamarking_ts.correction_number,
       'valid_time_begin', airport_heliport.airportprotectionareamarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.airportprotectionareamarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.airportprotectionareamarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.airportprotectionareamarking_ts.feature_lifetime_end
    ) AS airportprotectionareamarkingtimeslicetype
FROM

-- AirportHeliportProtectionAreaPropertyType
LEFT JOIN airport_heliport.airportprotectionareamarking_ts
ON airport_heliport.airportprotectionareamarking_ts.markedprotectionarea_id = AirportHeliportProtectionAreaPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportprotectionareamarking_ts
ON airport_heliport.airportprotectionareamarking_ts.abstractairportprotectionareamarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportprotectionareamarking_ts
ON airport_heliport.airportprotectionareamarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportprotectionareamarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportprotectionareamarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportprotectionareamarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.airportprotectionareamarking_ts
ON master_join.target_id = NotePropertyType.id
;

AirportProtectionAreaMarkingType
CREATE OR REPLACE VIEW airportprotectionareamarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportprotectionareamarking.id,
       'identifier', airport_heliport.airportprotectionareamarking.identifier,
       'identifier_code_space', airport_heliport.airportprotectionareamarking.identifier_code_space,
       'xml_id', airport_heliport.airportprotectionareamarking.xml_id
    ) AS airportprotectionareamarkingtype
FROM


-- AirportProtectionAreaMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.airportprotectionareamarking.id = master_join.source_id
LEFT JOIN airport_heliport.airportprotectionareamarking
ON master_join.target_id = AirportProtectionAreaMarkingTimeSlicePropertyType.id
;

AirportSuppliesServicePropertyType
CREATE OR REPLACE VIEW airportsuppliesservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airportsuppliesservice_pt.id,
       'nilReason', service.airportsuppliesservice_pt.nilReason
    ) AS airportsuppliesservicepropertytype
FROM


;

AirportSuppliesServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW airportsuppliesservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airportsuppliesservice_tsp.id
    ) AS airportsuppliesservicetimeslicepropertytype
FROM

-- AirportSuppliesServiceTimeSliceType
LEFT JOIN service.airportsuppliesservice_tsp
ON service.airportsuppliesservice_tsp.airportsuppliesservicetimeslice_id = AirportSuppliesServiceTimeSliceType.id

;

AirportSuppliesServiceTimeSliceType
CREATE OR REPLACE VIEW airportsuppliesservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.airportsuppliesservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.airportsuppliesservice_ts.flightoperations_nilreason,
       'rank_value', service.airportsuppliesservice_ts.rank_value,
       'rank_nilreason', service.airportsuppliesservice_ts.rank_nilreason,
       'complianticao_value', service.airportsuppliesservice_ts.complianticao_value,
       'complianticao_nilreason', service.airportsuppliesservice_ts.complianticao_nilreason,
       'name_value', service.airportsuppliesservice_ts.name_value,
       'name_nilreason', service.airportsuppliesservice_ts.name_nilreason,
       'id', service.airportsuppliesservice_ts.id,
       'xml_id', service.airportsuppliesservice_ts.xml_id,
       'interpretation', service.airportsuppliesservice_ts.interpretation,
       'sequence_number', service.airportsuppliesservice_ts.sequence_number,
       'correction_number', service.airportsuppliesservice_ts.correction_number,
       'valid_time_begin', service.airportsuppliesservice_ts.valid_time_begin,
       'valid_time_end', service.airportsuppliesservice_ts.valid_time_end,
       'feature_lifetime_begin', service.airportsuppliesservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.airportsuppliesservice_ts.feature_lifetime_end
    ) AS airportsuppliesservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.airportsuppliesservice_ts
ON service.airportsuppliesservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.airportsuppliesservice_ts
ON service.airportsuppliesservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.airportsuppliesservice_ts
ON service.airportsuppliesservice_ts.abstractairportsuppliesserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.airportsuppliesservice_ts
ON service.airportsuppliesservice_ts.abstractairportgroundserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.airportsuppliesservice_ts
ON service.airportsuppliesservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- FuelPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = FuelPropertyType.id
-- OilPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = OilPropertyType.id
-- NitrogenPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = NitrogenPropertyType.id
-- OxygenPropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice_ts.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice_ts
ON master_join.target_id = OxygenPropertyType.id
;

AirportSuppliesServiceType
CREATE OR REPLACE VIEW airportsuppliesservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.airportsuppliesservice.id,
       'identifier', service.airportsuppliesservice.identifier,
       'identifier_code_space', service.airportsuppliesservice.identifier_code_space,
       'xml_id', service.airportsuppliesservice.xml_id
    ) AS airportsuppliesservicetype
FROM


-- AirportSuppliesServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.airportsuppliesservice.id = master_join.source_id
LEFT JOIN service.airportsuppliesservice
ON master_join.target_id = AirportSuppliesServiceTimeSlicePropertyType.id
;

AirspaceActivationPropertyType
CREATE OR REPLACE VIEW airspaceactivationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspaceactivation_pt.id
    ) AS airspaceactivationpropertytype
FROM

-- AirspaceActivationType
LEFT JOIN airspace.airspaceactivation_pt
ON airspace.airspaceactivation_pt.airspaceactivation_id = AirspaceActivationType.id

;

AirspaceActivationType
CREATE OR REPLACE VIEW airspaceactivationtype_view AS
SELECT
    jsonb_build_object(
       'activity_value', airspace.airspaceactivation.activity_value,
       'activity_nilreason', airspace.airspaceactivation.activity_nilreason,
       'status_value', airspace.airspaceactivation.status_value,
       'status_nilreason', airspace.airspaceactivation.status_nilreason,
       'id', airspace.airspaceactivation.id,
       'identifier', airspace.airspaceactivation.identifier,
       'identifier_code_space', airspace.airspaceactivation.identifier_code_space,
       'xml_id', airspace.airspaceactivation.xml_id
    ) AS airspaceactivationtype
FROM

-- AbstractExtensionType
LEFT JOIN airspace.airspaceactivation
ON airspace.airspaceactivation.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspaceactivation
ON airspace.airspaceactivation.abstractairspaceactivationextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspaceactivation.id = master_join.source_id
LEFT JOIN airspace.airspaceactivation
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.airspaceactivation.id = master_join.source_id
LEFT JOIN airspace.airspaceactivation
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspaceactivation.id = master_join.source_id
LEFT JOIN airspace.airspaceactivation
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspaceactivation.id = master_join.source_id
LEFT JOIN airspace.airspaceactivation
ON master_join.target_id = AirspaceLayerPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspaceactivation.id = master_join.source_id
LEFT JOIN airspace.airspaceactivation
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspaceactivation.id = master_join.source_id
LEFT JOIN airspace.airspaceactivation
ON master_join.target_id = AircraftCharacteristicPropertyType.id
;

AirspaceBorderCrossingPropertyType
CREATE OR REPLACE VIEW airspacebordercrossingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.airspacebordercrossing_pt.id,
       'nilReason', routes.airspacebordercrossing_pt.nilReason
    ) AS airspacebordercrossingpropertytype
FROM


;

AirspaceBorderCrossingTimeSlicePropertyType
CREATE OR REPLACE VIEW airspacebordercrossingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.airspacebordercrossing_tsp.id
    ) AS airspacebordercrossingtimeslicepropertytype
FROM

-- AirspaceBorderCrossingTimeSliceType
LEFT JOIN routes.airspacebordercrossing_tsp
ON routes.airspacebordercrossing_tsp.airspacebordercrossingtimeslice_id = AirspaceBorderCrossingTimeSliceType.id

;

AirspaceBorderCrossingTimeSliceType
CREATE OR REPLACE VIEW airspacebordercrossingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'id', routes.airspacebordercrossing_ts.id,
       'xml_id', routes.airspacebordercrossing_ts.xml_id,
       'interpretation', routes.airspacebordercrossing_ts.interpretation,
       'sequence_number', routes.airspacebordercrossing_ts.sequence_number,
       'correction_number', routes.airspacebordercrossing_ts.correction_number,
       'valid_time_begin', routes.airspacebordercrossing_ts.valid_time_begin,
       'valid_time_end', routes.airspacebordercrossing_ts.valid_time_end,
       'feature_lifetime_begin', routes.airspacebordercrossing_ts.feature_lifetime_begin,
       'feature_lifetime_end', routes.airspacebordercrossing_ts.feature_lifetime_end
    ) AS airspacebordercrossingtimeslicetype
FROM

-- AirspacePropertyType
LEFT JOIN routes.airspacebordercrossing_ts
ON routes.airspacebordercrossing_ts.exitedairspace_id = AirspacePropertyType.id
-- AirspacePropertyType
LEFT JOIN routes.airspacebordercrossing_ts
ON routes.airspacebordercrossing_ts.enteredairspace_id = AirspacePropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.airspacebordercrossing_ts
ON routes.airspacebordercrossing_ts.abstractairspacebordercrossingextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.airspacebordercrossing_ts.id = master_join.source_id
LEFT JOIN routes.airspacebordercrossing_ts
ON master_join.target_id = NotePropertyType.id
;

AirspaceBorderCrossingType
CREATE OR REPLACE VIEW airspacebordercrossingtype_view AS
SELECT
    jsonb_build_object(
       'id', routes.airspacebordercrossing.id,
       'identifier', routes.airspacebordercrossing.identifier,
       'identifier_code_space', routes.airspacebordercrossing.identifier_code_space,
       'xml_id', routes.airspacebordercrossing.xml_id
    ) AS airspacebordercrossingtype
FROM


-- AirspaceBorderCrossingTimeSlicePropertyType
LEFT JOIN routes.master_join
ON routes.airspacebordercrossing.id = master_join.source_id
LEFT JOIN routes.airspacebordercrossing
ON master_join.target_id = AirspaceBorderCrossingTimeSlicePropertyType.id
;

AirspaceGeometryComponentPropertyType
CREATE OR REPLACE VIEW airspacegeometrycomponentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacegeometrycomponent_pt.id
    ) AS airspacegeometrycomponentpropertytype
FROM

-- AirspaceGeometryComponentType
LEFT JOIN airspace.airspacegeometrycomponent_pt
ON airspace.airspacegeometrycomponent_pt.airspacegeometrycomponent_id = AirspaceGeometryComponentType.id

;

AirspaceGeometryComponentType
CREATE OR REPLACE VIEW airspacegeometrycomponenttype_view AS
SELECT
    jsonb_build_object(
       'operation_value', airspace.airspacegeometrycomponent.operation_value,
       'operation_nilreason', airspace.airspacegeometrycomponent.operation_nilreason,
       'operationsequence_value', airspace.airspacegeometrycomponent.operationsequence_value,
       'operationsequence_nilreason', airspace.airspacegeometrycomponent.operationsequence_nilreason,
       'id', airspace.airspacegeometrycomponent.id,
       'identifier', airspace.airspacegeometrycomponent.identifier,
       'identifier_code_space', airspace.airspacegeometrycomponent.identifier_code_space,
       'xml_id', airspace.airspacegeometrycomponent.xml_id
    ) AS airspacegeometrycomponenttype
FROM

-- AirspaceVolumePropertyType
LEFT JOIN airspace.airspacegeometrycomponent
ON airspace.airspacegeometrycomponent.theairspacevolume_id = AirspaceVolumePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacegeometrycomponent
ON airspace.airspacegeometrycomponent.abstractairspacegeometrycomponentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.airspacegeometrycomponent.id = master_join.source_id
LEFT JOIN airspace.airspacegeometrycomponent
ON master_join.target_id = NotePropertyType.id
;

AirspaceLayerClassPropertyType
CREATE OR REPLACE VIEW airspacelayerclasspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacelayerclass_pt.id
    ) AS airspacelayerclasspropertytype
FROM

-- AirspaceLayerClassType
LEFT JOIN airspace.airspacelayerclass_pt
ON airspace.airspacelayerclass_pt.airspacelayerclass_id = AirspaceLayerClassType.id

;

AirspaceLayerClassType
CREATE OR REPLACE VIEW airspacelayerclasstype_view AS
SELECT
    jsonb_build_object(
       'classification_value', airspace.airspacelayerclass.classification_value,
       'classification_nilreason', airspace.airspacelayerclass.classification_nilreason,
       'id', airspace.airspacelayerclass.id,
       'identifier', airspace.airspacelayerclass.identifier,
       'identifier_code_space', airspace.airspacelayerclass.identifier_code_space,
       'xml_id', airspace.airspacelayerclass.xml_id
    ) AS airspacelayerclasstype
FROM

-- AbstractExtensionType
LEFT JOIN airspace.airspacelayerclass
ON airspace.airspacelayerclass.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacelayerclass
ON airspace.airspacelayerclass.abstractairspacelayerclassextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspacelayerclass.id = master_join.source_id
LEFT JOIN airspace.airspacelayerclass
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.airspacelayerclass.id = master_join.source_id
LEFT JOIN airspace.airspacelayerclass
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspacelayerclass.id = master_join.source_id
LEFT JOIN airspace.airspacelayerclass
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspacelayerclass.id = master_join.source_id
LEFT JOIN airspace.airspacelayerclass
ON master_join.target_id = AirspaceLayerPropertyType.id
;

AirspaceLayerPropertyType
CREATE OR REPLACE VIEW airspacelayerpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.airspacelayer_pt.id
    ) AS airspacelayerpropertytype
FROM

-- AirspaceLayerType
LEFT JOIN shared.airspacelayer_pt
ON shared.airspacelayer_pt.airspacelayer_id = AirspaceLayerType.id

;

AirspaceLayerType
CREATE OR REPLACE VIEW airspacelayertype_view AS
SELECT
    jsonb_build_object(
       'upperlimitreference_value', shared.airspacelayer.upperlimitreference_value,
       'upperlimitreference_nilreason', shared.airspacelayer.upperlimitreference_nilreason,
       'lowerlimitreference_value', shared.airspacelayer.lowerlimitreference_value,
       'lowerlimitreference_nilreason', shared.airspacelayer.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', shared.airspacelayer.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', shared.airspacelayer.altitudeinterpretation_nilreason,
       'upperlimit_value', shared.airspacelayer.upperlimit_value,
       'upperlimit_uom', shared.airspacelayer.upperlimit_uom,
       'upperlimit_nilreason', shared.airspacelayer.upperlimit_nilreason,
       'lowerlimit_value', shared.airspacelayer.lowerlimit_value,
       'lowerlimit_uom', shared.airspacelayer.lowerlimit_uom,
       'lowerlimit_nilreason', shared.airspacelayer.lowerlimit_nilreason,
       'id', shared.airspacelayer.id,
       'identifier', shared.airspacelayer.identifier,
       'identifier_code_space', shared.airspacelayer.identifier_code_space,
       'xml_id', shared.airspacelayer.xml_id
    ) AS airspacelayertype
FROM

-- StandardLevelColumnPropertyType
LEFT JOIN shared.airspacelayer
ON shared.airspacelayer.discretelevelseries_id = StandardLevelColumnPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.airspacelayer
ON shared.airspacelayer.abstractairspacelayerextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.airspacelayer.id = master_join.source_id
LEFT JOIN shared.airspacelayer
ON master_join.target_id = NotePropertyType.id
;

AirspacePropertyType
CREATE OR REPLACE VIEW airspacepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspace_pt.id,
       'nilReason', airspace.airspace_pt.nilReason
    ) AS airspacepropertytype
FROM


;

AirspaceTimeSlicePropertyType
CREATE OR REPLACE VIEW airspacetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspace_tsp.id
    ) AS airspacetimeslicepropertytype
FROM

-- AirspaceTimeSliceType
LEFT JOIN airspace.airspace_tsp
ON airspace.airspace_tsp.airspacetimeslice_id = AirspaceTimeSliceType.id

;

AirspaceTimeSliceType
CREATE OR REPLACE VIEW airspacetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airspace.airspace_ts.type_value,
       'type_nilreason', airspace.airspace_ts.type_nilreason,
       'designator_value', airspace.airspace_ts.designator_value,
       'designator_nilreason', airspace.airspace_ts.designator_nilreason,
       'localtype_value', airspace.airspace_ts.localtype_value,
       'localtype_nilreason', airspace.airspace_ts.localtype_nilreason,
       'name_value', airspace.airspace_ts.name_value,
       'name_nilreason', airspace.airspace_ts.name_nilreason,
       'designatoricao_value', airspace.airspace_ts.designatoricao_value,
       'designatoricao_nilreason', airspace.airspace_ts.designatoricao_nilreason,
       'controltype_value', airspace.airspace_ts.controltype_value,
       'controltype_nilreason', airspace.airspace_ts.controltype_nilreason,
       'upperlowerseparation_value', airspace.airspace_ts.upperlowerseparation_value,
       'upperlowerseparation_uom', airspace.airspace_ts.upperlowerseparation_uom,
       'upperlowerseparation_nilreason', airspace.airspace_ts.upperlowerseparation_nilreason,
       'id', airspace.airspace_ts.id,
       'xml_id', airspace.airspace_ts.xml_id,
       'interpretation', airspace.airspace_ts.interpretation,
       'sequence_number', airspace.airspace_ts.sequence_number,
       'correction_number', airspace.airspace_ts.correction_number,
       'valid_time_begin', airspace.airspace_ts.valid_time_begin,
       'valid_time_end', airspace.airspace_ts.valid_time_end,
       'feature_lifetime_begin', airspace.airspace_ts.feature_lifetime_begin,
       'feature_lifetime_end', airspace.airspace_ts.feature_lifetime_end
    ) AS airspacetimeslicetype
FROM

-- RoutePropertyType
LEFT JOIN airspace.airspace_ts
ON airspace.airspace_ts.protectedroute_id = RoutePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspace_ts
ON airspace.airspace_ts.abstractairspaceextension_id = AbstractExtensionType.id

-- AirspaceLayerClassPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspace_ts.id = master_join.source_id
LEFT JOIN airspace.airspace_ts
ON master_join.target_id = AirspaceLayerClassPropertyType.id
-- AirspaceGeometryComponentPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspace_ts.id = master_join.source_id
LEFT JOIN airspace.airspace_ts
ON master_join.target_id = AirspaceGeometryComponentPropertyType.id
-- AirspaceActivationPropertyType
LEFT JOIN airspace.master_join
ON airspace.airspace_ts.id = master_join.source_id
LEFT JOIN airspace.airspace_ts
ON master_join.target_id = AirspaceActivationPropertyType.id
-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.airspace_ts.id = master_join.source_id
LEFT JOIN airspace.airspace_ts
ON master_join.target_id = NotePropertyType.id
;

AirspaceType
CREATE OR REPLACE VIEW airspacetype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspace.id,
       'identifier', airspace.airspace.identifier,
       'identifier_code_space', airspace.airspace.identifier_code_space,
       'xml_id', airspace.airspace.xml_id
    ) AS airspacetype
FROM


-- AirspaceTimeSlicePropertyType
LEFT JOIN airspace.master_join
ON airspace.airspace.id = master_join.source_id
LEFT JOIN airspace.airspace
ON master_join.target_id = AirspaceTimeSlicePropertyType.id
;

AirspaceVolumeDependencyPropertyType
CREATE OR REPLACE VIEW airspacevolumedependencypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacevolumedependency_pt.id
    ) AS airspacevolumedependencypropertytype
FROM

-- AirspaceVolumeDependencyType
LEFT JOIN airspace.airspacevolumedependency_pt
ON airspace.airspacevolumedependency_pt.airspacevolumedependency_id = AirspaceVolumeDependencyType.id

;

AirspaceVolumeDependencyType
CREATE OR REPLACE VIEW airspacevolumedependencytype_view AS
SELECT
    jsonb_build_object(
       'dependency_value', airspace.airspacevolumedependency.dependency_value,
       'dependency_nilreason', airspace.airspacevolumedependency.dependency_nilreason,
       'id', airspace.airspacevolumedependency.id,
       'identifier', airspace.airspacevolumedependency.identifier,
       'identifier_code_space', airspace.airspacevolumedependency.identifier_code_space,
       'xml_id', airspace.airspacevolumedependency.xml_id
    ) AS airspacevolumedependencytype
FROM

-- AirspacePropertyType
LEFT JOIN airspace.airspacevolumedependency
ON airspace.airspacevolumedependency.theairspace_id = AirspacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacevolumedependency
ON airspace.airspacevolumedependency.abstractairspacevolumedependencyextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.airspacevolumedependency.id = master_join.source_id
LEFT JOIN airspace.airspacevolumedependency
ON master_join.target_id = NotePropertyType.id
;

AirspaceVolumePropertyType
CREATE OR REPLACE VIEW airspacevolumepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacevolume_pt.id
    ) AS airspacevolumepropertytype
FROM

-- AirspaceVolumeType
LEFT JOIN airspace.airspacevolume_pt
ON airspace.airspacevolume_pt.airspacevolume_id = AirspaceVolumeType.id

;

AirspaceVolumeType
CREATE OR REPLACE VIEW airspacevolumetype_view AS
SELECT
    jsonb_build_object(
       'upperlimitreference_value', airspace.airspacevolume.upperlimitreference_value,
       'upperlimitreference_nilreason', airspace.airspacevolume.upperlimitreference_nilreason,
       'maximumlimitreference_value', airspace.airspacevolume.maximumlimitreference_value,
       'maximumlimitreference_nilreason', airspace.airspacevolume.maximumlimitreference_nilreason,
       'lowerlimitreference_value', airspace.airspacevolume.lowerlimitreference_value,
       'lowerlimitreference_nilreason', airspace.airspacevolume.lowerlimitreference_nilreason,
       'minimumlimitreference_value', airspace.airspacevolume.minimumlimitreference_value,
       'minimumlimitreference_nilreason', airspace.airspacevolume.minimumlimitreference_nilreason,
       'upperlimit_value', airspace.airspacevolume.upperlimit_value,
       'upperlimit_uom', airspace.airspacevolume.upperlimit_uom,
       'upperlimit_nilreason', airspace.airspacevolume.upperlimit_nilreason,
       'maximumlimit_value', airspace.airspacevolume.maximumlimit_value,
       'maximumlimit_uom', airspace.airspacevolume.maximumlimit_uom,
       'maximumlimit_nilreason', airspace.airspacevolume.maximumlimit_nilreason,
       'lowerlimit_value', airspace.airspacevolume.lowerlimit_value,
       'lowerlimit_uom', airspace.airspacevolume.lowerlimit_uom,
       'lowerlimit_nilreason', airspace.airspacevolume.lowerlimit_nilreason,
       'minimumlimit_value', airspace.airspacevolume.minimumlimit_value,
       'minimumlimit_uom', airspace.airspacevolume.minimumlimit_uom,
       'minimumlimit_nilreason', airspace.airspacevolume.minimumlimit_nilreason,
       'width_value', airspace.airspacevolume.width_value,
       'width_uom', airspace.airspacevolume.width_uom,
       'width_nilreason', airspace.airspacevolume.width_nilreason,
       'id', airspace.airspacevolume.id,
       'identifier', airspace.airspacevolume.identifier,
       'identifier_code_space', airspace.airspacevolume.identifier_code_space,
       'xml_id', airspace.airspacevolume.xml_id
    ) AS airspacevolumetype
FROM

-- SurfacePropertyType
LEFT JOIN airspace.airspacevolume
ON airspace.airspacevolume.horizontalprojection_id = SurfacePropertyType.id
-- CurvePropertyType
LEFT JOIN airspace.airspacevolume
ON airspace.airspacevolume.centreline_id = CurvePropertyType.id
-- AirspaceVolumeDependencyPropertyType
LEFT JOIN airspace.airspacevolume
ON airspace.airspacevolume.contributorairspace_id = AirspaceVolumeDependencyPropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacevolume
ON airspace.airspacevolume.abstractairspacevolumeextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.airspacevolume.id = master_join.source_id
LEFT JOIN airspace.airspacevolume
ON master_join.target_id = NotePropertyType.id
;

AirTrafficControlServicePropertyType
CREATE OR REPLACE VIEW airtrafficcontrolservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficcontrolservice_pt.id,
       'nilReason', service.airtrafficcontrolservice_pt.nilReason
    ) AS airtrafficcontrolservicepropertytype
FROM


;

AirTrafficControlServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW airtrafficcontrolservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficcontrolservice_tsp.id
    ) AS airtrafficcontrolservicetimeslicepropertytype
FROM

-- AirTrafficControlServiceTimeSliceType
LEFT JOIN service.airtrafficcontrolservice_tsp
ON service.airtrafficcontrolservice_tsp.airtrafficcontrolservicetimeslice_id = AirTrafficControlServiceTimeSliceType.id

;

AirTrafficControlServiceTimeSliceType
CREATE OR REPLACE VIEW airtrafficcontrolservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.airtrafficcontrolservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.airtrafficcontrolservice_ts.flightoperations_nilreason,
       'rank_value', service.airtrafficcontrolservice_ts.rank_value,
       'rank_nilreason', service.airtrafficcontrolservice_ts.rank_nilreason,
       'complianticao_value', service.airtrafficcontrolservice_ts.complianticao_value,
       'complianticao_nilreason', service.airtrafficcontrolservice_ts.complianticao_nilreason,
       'name_value', service.airtrafficcontrolservice_ts.name_value,
       'name_nilreason', service.airtrafficcontrolservice_ts.name_nilreason,
       'radarassisted_value', service.airtrafficcontrolservice_ts.radarassisted_value,
       'radarassisted_nilreason', service.airtrafficcontrolservice_ts.radarassisted_nilreason,
       'datalinkenabled_value', service.airtrafficcontrolservice_ts.datalinkenabled_value,
       'datalinkenabled_nilreason', service.airtrafficcontrolservice_ts.datalinkenabled_nilreason,
       'datalinkchannel_value', service.airtrafficcontrolservice_ts.datalinkchannel_value,
       'datalinkchannel_nilreason', service.airtrafficcontrolservice_ts.datalinkchannel_nilreason,
       'type_value', service.airtrafficcontrolservice_ts.type_value,
       'type_nilreason', service.airtrafficcontrolservice_ts.type_nilreason,
       'id', service.airtrafficcontrolservice_ts.id,
       'xml_id', service.airtrafficcontrolservice_ts.xml_id,
       'interpretation', service.airtrafficcontrolservice_ts.interpretation,
       'sequence_number', service.airtrafficcontrolservice_ts.sequence_number,
       'correction_number', service.airtrafficcontrolservice_ts.correction_number,
       'valid_time_begin', service.airtrafficcontrolservice_ts.valid_time_begin,
       'valid_time_end', service.airtrafficcontrolservice_ts.valid_time_end,
       'feature_lifetime_begin', service.airtrafficcontrolservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.airtrafficcontrolservice_ts.feature_lifetime_end
    ) AS airtrafficcontrolservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.airtrafficcontrolservice_ts
ON service.airtrafficcontrolservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.airtrafficcontrolservice_ts
ON service.airtrafficcontrolservice_ts.serviceprovider_id = UnitPropertyType.id
-- DirectionFinderPropertyType
LEFT JOIN service.airtrafficcontrolservice_ts
ON service.airtrafficcontrolservice_ts.aircraftlocator_id = DirectionFinderPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.airtrafficcontrolservice_ts
ON service.airtrafficcontrolservice_ts.abstractairtrafficcontrolserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.airtrafficcontrolservice_ts
ON service.airtrafficcontrolservice_ts.abstracttrafficseparationserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.airtrafficcontrolservice_ts
ON service.airtrafficcontrolservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- AirspacePropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = AirspacePropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = RoutePortionPropertyType.id
-- ProcedurePropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = ProcedurePropertyType.id
-- HoldingPatternPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = HoldingPatternPropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON master_join.target_id = AerialRefuellingPropertyType.id
;

AirTrafficControlServiceType
CREATE OR REPLACE VIEW airtrafficcontrolservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficcontrolservice.id,
       'identifier', service.airtrafficcontrolservice.identifier,
       'identifier_code_space', service.airtrafficcontrolservice.identifier_code_space,
       'xml_id', service.airtrafficcontrolservice.xml_id
    ) AS airtrafficcontrolservicetype
FROM


-- AirTrafficControlServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.airtrafficcontrolservice.id = master_join.source_id
LEFT JOIN service.airtrafficcontrolservice
ON master_join.target_id = AirTrafficControlServiceTimeSlicePropertyType.id
;

AirTrafficManagementServicePropertyType
CREATE OR REPLACE VIEW airtrafficmanagementservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficmanagementservice_pt.id,
       'nilReason', service.airtrafficmanagementservice_pt.nilReason
    ) AS airtrafficmanagementservicepropertytype
FROM


;

AirTrafficManagementServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW airtrafficmanagementservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficmanagementservice_tsp.id
    ) AS airtrafficmanagementservicetimeslicepropertytype
FROM

-- AirTrafficManagementServiceTimeSliceType
LEFT JOIN service.airtrafficmanagementservice_tsp
ON service.airtrafficmanagementservice_tsp.airtrafficmanagementservicetimeslice_id = AirTrafficManagementServiceTimeSliceType.id

;

AirTrafficManagementServiceTimeSliceType
CREATE OR REPLACE VIEW airtrafficmanagementservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.airtrafficmanagementservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.airtrafficmanagementservice_ts.flightoperations_nilreason,
       'rank_value', service.airtrafficmanagementservice_ts.rank_value,
       'rank_nilreason', service.airtrafficmanagementservice_ts.rank_nilreason,
       'complianticao_value', service.airtrafficmanagementservice_ts.complianticao_value,
       'complianticao_nilreason', service.airtrafficmanagementservice_ts.complianticao_nilreason,
       'name_value', service.airtrafficmanagementservice_ts.name_value,
       'name_nilreason', service.airtrafficmanagementservice_ts.name_nilreason,
       'type_value', service.airtrafficmanagementservice_ts.type_value,
       'type_nilreason', service.airtrafficmanagementservice_ts.type_nilreason,
       'id', service.airtrafficmanagementservice_ts.id,
       'xml_id', service.airtrafficmanagementservice_ts.xml_id,
       'interpretation', service.airtrafficmanagementservice_ts.interpretation,
       'sequence_number', service.airtrafficmanagementservice_ts.sequence_number,
       'correction_number', service.airtrafficmanagementservice_ts.correction_number,
       'valid_time_begin', service.airtrafficmanagementservice_ts.valid_time_begin,
       'valid_time_end', service.airtrafficmanagementservice_ts.valid_time_end,
       'feature_lifetime_begin', service.airtrafficmanagementservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.airtrafficmanagementservice_ts.feature_lifetime_end
    ) AS airtrafficmanagementservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.airtrafficmanagementservice_ts
ON service.airtrafficmanagementservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.airtrafficmanagementservice_ts
ON service.airtrafficmanagementservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.airtrafficmanagementservice_ts
ON service.airtrafficmanagementservice_ts.abstractairtrafficmanagementserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.airtrafficmanagementservice_ts
ON service.airtrafficmanagementservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirspacePropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = AirspacePropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = AerialRefuellingPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice_ts.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON master_join.target_id = RoutePortionPropertyType.id
;

AirTrafficManagementServiceType
CREATE OR REPLACE VIEW airtrafficmanagementservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficmanagementservice.id,
       'identifier', service.airtrafficmanagementservice.identifier,
       'identifier_code_space', service.airtrafficmanagementservice.identifier_code_space,
       'xml_id', service.airtrafficmanagementservice.xml_id
    ) AS airtrafficmanagementservicetype
FROM


-- AirTrafficManagementServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.airtrafficmanagementservice.id = master_join.source_id
LEFT JOIN service.airtrafficmanagementservice
ON master_join.target_id = AirTrafficManagementServiceTimeSlicePropertyType.id
;

AltimeterSourcePropertyType
CREATE OR REPLACE VIEW altimetersourcepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.altimetersource_pt.id,
       'nilReason', airport_heliport.altimetersource_pt.nilReason
    ) AS altimetersourcepropertytype
FROM


;

AltimeterSourceStatusPropertyType
CREATE OR REPLACE VIEW altimetersourcestatuspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.altimetersourcestatus_pt.id
    ) AS altimetersourcestatuspropertytype
FROM

-- AltimeterSourceStatusType
LEFT JOIN airport_heliport.altimetersourcestatus_pt
ON airport_heliport.altimetersourcestatus_pt.altimetersourcestatus_id = AltimeterSourceStatusType.id

;

AltimeterSourceStatusType
CREATE OR REPLACE VIEW altimetersourcestatustype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', airport_heliport.altimetersourcestatus.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.altimetersourcestatus.operationalstatus_nilreason,
       'id', airport_heliport.altimetersourcestatus.id,
       'identifier', airport_heliport.altimetersourcestatus.identifier,
       'identifier_code_space', airport_heliport.altimetersourcestatus.identifier_code_space,
       'xml_id', airport_heliport.altimetersourcestatus.xml_id
    ) AS altimetersourcestatustype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.altimetersourcestatus
ON airport_heliport.altimetersourcestatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.altimetersourcestatus
ON airport_heliport.altimetersourcestatus.abstractaltimetersourcestatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.altimetersourcestatus.id = master_join.source_id
LEFT JOIN airport_heliport.altimetersourcestatus
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.altimetersourcestatus.id = master_join.source_id
LEFT JOIN airport_heliport.altimetersourcestatus
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.altimetersourcestatus.id = master_join.source_id
LEFT JOIN airport_heliport.altimetersourcestatus
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

AltimeterSourceTimeSlicePropertyType
CREATE OR REPLACE VIEW altimetersourcetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.altimetersource_tsp.id
    ) AS altimetersourcetimeslicepropertytype
FROM

-- AltimeterSourceTimeSliceType
LEFT JOIN airport_heliport.altimetersource_tsp
ON airport_heliport.altimetersource_tsp.altimetersourcetimeslice_id = AltimeterSourceTimeSliceType.id

;

AltimeterSourceTimeSliceType
CREATE OR REPLACE VIEW altimetersourcetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'isremote_value', airport_heliport.altimetersource_ts.isremote_value,
       'isremote_nilreason', airport_heliport.altimetersource_ts.isremote_nilreason,
       'isprimary_value', airport_heliport.altimetersource_ts.isprimary_value,
       'isprimary_nilreason', airport_heliport.altimetersource_ts.isprimary_nilreason,
       'id', airport_heliport.altimetersource_ts.id,
       'xml_id', airport_heliport.altimetersource_ts.xml_id,
       'interpretation', airport_heliport.altimetersource_ts.interpretation,
       'sequence_number', airport_heliport.altimetersource_ts.sequence_number,
       'correction_number', airport_heliport.altimetersource_ts.correction_number,
       'valid_time_begin', airport_heliport.altimetersource_ts.valid_time_begin,
       'valid_time_end', airport_heliport.altimetersource_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.altimetersource_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.altimetersource_ts.feature_lifetime_end
    ) AS altimetersourcetimeslicetype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.altimetersource_ts
ON airport_heliport.altimetersource_ts.abstractaltimetersourceextension_id = AbstractExtensionType.id

-- AltimeterSourceStatusPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.altimetersource_ts.id = master_join.source_id
LEFT JOIN airport_heliport.altimetersource_ts
ON master_join.target_id = AltimeterSourceStatusPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.altimetersource_ts.id = master_join.source_id
LEFT JOIN airport_heliport.altimetersource_ts
ON master_join.target_id = NotePropertyType.id
;

AltimeterSourceType
CREATE OR REPLACE VIEW altimetersourcetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.altimetersource.id,
       'identifier', airport_heliport.altimetersource.identifier,
       'identifier_code_space', airport_heliport.altimetersource.identifier_code_space,
       'xml_id', airport_heliport.altimetersource.xml_id
    ) AS altimetersourcetype
FROM


-- AltimeterSourceTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.altimetersource.id = master_join.source_id
LEFT JOIN airport_heliport.altimetersource
ON master_join.target_id = AltimeterSourceTimeSlicePropertyType.id
;

AltitudeAdjustmentPropertyType
CREATE OR REPLACE VIEW altitudeadjustmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.altitudeadjustment_pt.id
    ) AS altitudeadjustmentpropertytype
FROM

-- AltitudeAdjustmentType
LEFT JOIN shared.altitudeadjustment_pt
ON shared.altitudeadjustment_pt.altitudeadjustment_id = AltitudeAdjustmentType.id

;

AltitudeAdjustmentType
CREATE OR REPLACE VIEW altitudeadjustmenttype_view AS
SELECT
    jsonb_build_object(
       'altitudeadjustmenttype_value', shared.altitudeadjustment.altitudeadjustmenttype_value,
       'altitudeadjustmenttype_nilreason', shared.altitudeadjustment.altitudeadjustmenttype_nilreason,
       'primaryalternateminimum_value', shared.altitudeadjustment.primaryalternateminimum_value,
       'primaryalternateminimum_nilreason', shared.altitudeadjustment.primaryalternateminimum_nilreason,
       'localremotecode_value', shared.altitudeadjustment.localremotecode_value,
       'localremotecode_nilreason', shared.altitudeadjustment.localremotecode_nilreason,
       'altitudeadjustment_value', shared.altitudeadjustment.altitudeadjustment_value,
       'altitudeadjustment_uom', shared.altitudeadjustment.altitudeadjustment_uom,
       'altitudeadjustment_nilreason', shared.altitudeadjustment.altitudeadjustment_nilreason,
       'id', shared.altitudeadjustment.id,
       'identifier', shared.altitudeadjustment.identifier,
       'identifier_code_space', shared.altitudeadjustment.identifier_code_space,
       'xml_id', shared.altitudeadjustment.xml_id
    ) AS altitudeadjustmenttype
FROM

-- AbstractExtensionType
LEFT JOIN shared.altitudeadjustment
ON shared.altitudeadjustment.abstractaltitudeadjustmentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.altitudeadjustment.id = master_join.source_id
LEFT JOIN shared.altitudeadjustment
ON master_join.target_id = NotePropertyType.id
;

AngleIndicationPropertyType
CREATE OR REPLACE VIEW angleindicationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.angleindication_pt.id,
       'nilReason', navaids_points.angleindication_pt.nilReason
    ) AS angleindicationpropertytype
FROM


;

AngleIndicationTimeSlicePropertyType
CREATE OR REPLACE VIEW angleindicationtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.angleindication_tsp.id
    ) AS angleindicationtimeslicepropertytype
FROM

-- AngleIndicationTimeSliceType
LEFT JOIN navaids_points.angleindication_tsp
ON navaids_points.angleindication_tsp.angleindicationtimeslice_id = AngleIndicationTimeSliceType.id

;

AngleIndicationTimeSliceType
CREATE OR REPLACE VIEW angleindicationtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'angle_value', navaids_points.angleindication_ts.angle_value,
       'angle_nilreason', navaids_points.angleindication_ts.angle_nilreason,
       'angletype_value', navaids_points.angleindication_ts.angletype_value,
       'angletype_nilreason', navaids_points.angleindication_ts.angletype_nilreason,
       'indicationdirection_value', navaids_points.angleindication_ts.indicationdirection_value,
       'indicationdirection_nilreason', navaids_points.angleindication_ts.indicationdirection_nilreason,
       'trueangle_value', navaids_points.angleindication_ts.trueangle_value,
       'trueangle_nilreason', navaids_points.angleindication_ts.trueangle_nilreason,
       'cardinaldirection_value', navaids_points.angleindication_ts.cardinaldirection_value,
       'cardinaldirection_nilreason', navaids_points.angleindication_ts.cardinaldirection_nilreason,
       'minimumreceptionaltitude_value', navaids_points.angleindication_ts.minimumreceptionaltitude_value,
       'minimumreceptionaltitude_uom', navaids_points.angleindication_ts.minimumreceptionaltitude_uom,
       'minimumreceptionaltitude_nilreason', navaids_points.angleindication_ts.minimumreceptionaltitude_nilreason,
       'id', navaids_points.angleindication_ts.id,
       'xml_id', navaids_points.angleindication_ts.xml_id,
       'interpretation', navaids_points.angleindication_ts.interpretation,
       'sequence_number', navaids_points.angleindication_ts.sequence_number,
       'correction_number', navaids_points.angleindication_ts.correction_number,
       'valid_time_begin', navaids_points.angleindication_ts.valid_time_begin,
       'valid_time_end', navaids_points.angleindication_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.angleindication_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.angleindication_ts.feature_lifetime_end
    ) AS angleindicationtimeslicetype
FROM

-- DesignatedPointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.fix_id = DesignatedPointPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_position_id = PointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.abstractangleindicationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.angleindication_ts.id = master_join.source_id
LEFT JOIN navaids_points.angleindication_ts
ON master_join.target_id = NotePropertyType.id
;

AngleIndicationType
CREATE OR REPLACE VIEW angleindicationtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.angleindication.id,
       'identifier', navaids_points.angleindication.identifier,
       'identifier_code_space', navaids_points.angleindication.identifier_code_space,
       'xml_id', navaids_points.angleindication.xml_id
    ) AS angleindicationtype
FROM


-- AngleIndicationTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.angleindication.id = master_join.source_id
LEFT JOIN navaids_points.angleindication
ON master_join.target_id = AngleIndicationTimeSlicePropertyType.id
;

AngleUsePropertyType
CREATE OR REPLACE VIEW angleusepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.angleuse_pt.id
    ) AS angleusepropertytype
FROM

-- AngleUseType
LEFT JOIN navaids_points.angleuse_pt
ON navaids_points.angleuse_pt.angleuse_id = AngleUseType.id

;

AngleUseType
CREATE OR REPLACE VIEW angleusetype_view AS
SELECT
    jsonb_build_object(
       'alongcourseguidance_value', navaids_points.angleuse.alongcourseguidance_value,
       'alongcourseguidance_nilreason', navaids_points.angleuse.alongcourseguidance_nilreason,
       'id', navaids_points.angleuse.id,
       'identifier', navaids_points.angleuse.identifier,
       'identifier_code_space', navaids_points.angleuse.identifier_code_space,
       'xml_id', navaids_points.angleuse.xml_id
    ) AS angleusetype
FROM

-- AngleIndicationPropertyType
LEFT JOIN navaids_points.angleuse
ON navaids_points.angleuse.theangleindication_id = AngleIndicationPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.angleuse
ON navaids_points.angleuse.abstractangleuseextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.angleuse.id = master_join.source_id
LEFT JOIN navaids_points.angleuse
ON master_join.target_id = NotePropertyType.id
;

ApproachAltitudeTablePropertyType
CREATE OR REPLACE VIEW approachaltitudetablepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachaltitudetable_pt.id
    ) AS approachaltitudetablepropertytype
FROM

-- ApproachAltitudeTableType
LEFT JOIN procedure.approachaltitudetable_pt
ON procedure.approachaltitudetable_pt.approachaltitudetable_id = ApproachAltitudeTableType.id

;

ApproachAltitudeTableType
CREATE OR REPLACE VIEW approachaltitudetabletype_view AS
SELECT
    jsonb_build_object(
       'measurementpoint_value', procedure.approachaltitudetable.measurementpoint_value,
       'measurementpoint_nilreason', procedure.approachaltitudetable.measurementpoint_nilreason,
       'altitudereference_value', procedure.approachaltitudetable.altitudereference_value,
       'altitudereference_nilreason', procedure.approachaltitudetable.altitudereference_nilreason,
       'altitude_value', procedure.approachaltitudetable.altitude_value,
       'altitude_uom', procedure.approachaltitudetable.altitude_uom,
       'altitude_nilreason', procedure.approachaltitudetable.altitude_nilreason,
       'id', procedure.approachaltitudetable.id,
       'identifier', procedure.approachaltitudetable.identifier,
       'identifier_code_space', procedure.approachaltitudetable.identifier_code_space,
       'xml_id', procedure.approachaltitudetable.xml_id
    ) AS approachaltitudetabletype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.approachaltitudetable
ON procedure.approachaltitudetable.abstractapproachaltitudetableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.approachaltitudetable.id = master_join.source_id
LEFT JOIN procedure.approachaltitudetable
ON master_join.target_id = NotePropertyType.id
;

ApproachConditionPropertyType
CREATE OR REPLACE VIEW approachconditionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachcondition_pt.id
    ) AS approachconditionpropertytype
FROM

-- ApproachConditionType
LEFT JOIN procedure.approachcondition_pt
ON procedure.approachcondition_pt.approachcondition_id = ApproachConditionType.id

;

ApproachConditionType
CREATE OR REPLACE VIEW approachconditiontype_view AS
SELECT
    jsonb_build_object(
       'finalapproachpath_value', procedure.approachcondition.finalapproachpath_value,
       'finalapproachpath_nilreason', procedure.approachcondition.finalapproachpath_nilreason,
       'requirednavigationperformance_value', procedure.approachcondition.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', procedure.approachcondition.requirednavigationperformance_nilreason,
       'climbgradient_value', procedure.approachcondition.climbgradient_value,
       'climbgradient_nilreason', procedure.approachcondition.climbgradient_nilreason,
       'id', procedure.approachcondition.id,
       'identifier', procedure.approachcondition.identifier,
       'identifier_code_space', procedure.approachcondition.identifier_code_space,
       'xml_id', procedure.approachcondition.xml_id
    ) AS approachconditiontype
FROM

-- MinimaPropertyType
LEFT JOIN procedure.approachcondition
ON procedure.approachcondition.minimumset_id = MinimaPropertyType.id
-- AltimeterSourcePropertyType
LEFT JOIN procedure.approachcondition
ON procedure.approachcondition.altimeter_id = AltimeterSourcePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.approachcondition
ON procedure.approachcondition.abstractapproachconditionextension_id = AbstractExtensionType.id

-- CirclingRestrictionPropertyType
LEFT JOIN procedure.master_join
ON procedure.approachcondition.id = master_join.source_id
LEFT JOIN procedure.approachcondition
ON master_join.target_id = CirclingRestrictionPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.approachcondition.id = master_join.source_id
LEFT JOIN procedure.approachcondition
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- LandingTakeoffAreaCollectionPropertyType
LEFT JOIN procedure.master_join
ON procedure.approachcondition.id = master_join.source_id
LEFT JOIN procedure.approachcondition
ON master_join.target_id = LandingTakeoffAreaCollectionPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.approachcondition.id = master_join.source_id
LEFT JOIN procedure.approachcondition
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.approachcondition.id = master_join.source_id
LEFT JOIN procedure.approachcondition
ON master_join.target_id = NotePropertyType.id
;

ApproachDistanceTablePropertyType
CREATE OR REPLACE VIEW approachdistancetablepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachdistancetable_pt.id
    ) AS approachdistancetablepropertytype
FROM

-- ApproachDistanceTableType
LEFT JOIN procedure.approachdistancetable_pt
ON procedure.approachdistancetable_pt.approachdistancetable_id = ApproachDistanceTableType.id

;

ApproachDistanceTableType
CREATE OR REPLACE VIEW approachdistancetabletype_view AS
SELECT
    jsonb_build_object(
       'startingmeasurementpoint_value', procedure.approachdistancetable.startingmeasurementpoint_value,
       'startingmeasurementpoint_nilreason', procedure.approachdistancetable.startingmeasurementpoint_nilreason,
       'endingmeasurementpoint_value', procedure.approachdistancetable.endingmeasurementpoint_value,
       'endingmeasurementpoint_nilreason', procedure.approachdistancetable.endingmeasurementpoint_nilreason,
       'valuehat_value', procedure.approachdistancetable.valuehat_value,
       'valuehat_uom', procedure.approachdistancetable.valuehat_uom,
       'valuehat_nilreason', procedure.approachdistancetable.valuehat_nilreason,
       'distance_value', procedure.approachdistancetable.distance_value,
       'distance_uom', procedure.approachdistancetable.distance_uom,
       'distance_nilreason', procedure.approachdistancetable.distance_nilreason,
       'id', procedure.approachdistancetable.id,
       'identifier', procedure.approachdistancetable.identifier,
       'identifier_code_space', procedure.approachdistancetable.identifier_code_space,
       'xml_id', procedure.approachdistancetable.xml_id
    ) AS approachdistancetabletype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.approachdistancetable
ON procedure.approachdistancetable.abstractapproachdistancetableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.approachdistancetable.id = master_join.source_id
LEFT JOIN procedure.approachdistancetable
ON master_join.target_id = NotePropertyType.id
;

ApproachLegPropertyType
CREATE OR REPLACE VIEW approachlegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachleg_pt.id,
       'nilReason', procedure.approachleg_pt.nilReason
    ) AS approachlegpropertytype
FROM


;

ApproachLightingSystemPropertyType
CREATE OR REPLACE VIEW approachlightingsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.approachlightingsystem_pt.id,
       'nilReason', airport_heliport.approachlightingsystem_pt.nilReason
    ) AS approachlightingsystempropertytype
FROM


;

ApproachLightingSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW approachlightingsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.approachlightingsystem_tsp.id
    ) AS approachlightingsystemtimeslicepropertytype
FROM

-- ApproachLightingSystemTimeSliceType
LEFT JOIN airport_heliport.approachlightingsystem_tsp
ON airport_heliport.approachlightingsystem_tsp.approachlightingsystemtimeslice_id = ApproachLightingSystemTimeSliceType.id

;

ApproachLightingSystemTimeSliceType
CREATE OR REPLACE VIEW approachlightingsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.approachlightingsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.approachlightingsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.approachlightingsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.approachlightingsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.approachlightingsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.approachlightingsystem_ts.colour_nilreason,
       'classicao_value', airport_heliport.approachlightingsystem_ts.classicao_value,
       'classicao_nilreason', airport_heliport.approachlightingsystem_ts.classicao_nilreason,
       'type_value', airport_heliport.approachlightingsystem_ts.type_value,
       'type_nilreason', airport_heliport.approachlightingsystem_ts.type_nilreason,
       'sequencedflashing_value', airport_heliport.approachlightingsystem_ts.sequencedflashing_value,
       'sequencedflashing_nilreason', airport_heliport.approachlightingsystem_ts.sequencedflashing_nilreason,
       'alignmentindicator_value', airport_heliport.approachlightingsystem_ts.alignmentindicator_value,
       'alignmentindicator_nilreason', airport_heliport.approachlightingsystem_ts.alignmentindicator_nilreason,
       'length_value', airport_heliport.approachlightingsystem_ts.length_value,
       'length_uom', airport_heliport.approachlightingsystem_ts.length_uom,
       'length_nilreason', airport_heliport.approachlightingsystem_ts.length_nilreason,
       'id', airport_heliport.approachlightingsystem_ts.id,
       'xml_id', airport_heliport.approachlightingsystem_ts.xml_id,
       'interpretation', airport_heliport.approachlightingsystem_ts.interpretation,
       'sequence_number', airport_heliport.approachlightingsystem_ts.sequence_number,
       'correction_number', airport_heliport.approachlightingsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.approachlightingsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.approachlightingsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.approachlightingsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.approachlightingsystem_ts.feature_lifetime_end
    ) AS approachlightingsystemtimeslicetype
FROM

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON airport_heliport.approachlightingsystem_ts.servedrunwaydirection_id = RunwayDirectionPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON airport_heliport.approachlightingsystem_ts.abstractapproachlightingsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON airport_heliport.approachlightingsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.approachlightingsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.approachlightingsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.approachlightingsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON master_join.target_id = NotePropertyType.id
;

ApproachLightingSystemType
CREATE OR REPLACE VIEW approachlightingsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.approachlightingsystem.id,
       'identifier', airport_heliport.approachlightingsystem.identifier,
       'identifier_code_space', airport_heliport.approachlightingsystem.identifier_code_space,
       'xml_id', airport_heliport.approachlightingsystem.xml_id
    ) AS approachlightingsystemtype
FROM


-- ApproachLightingSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.approachlightingsystem.id = master_join.source_id
LEFT JOIN airport_heliport.approachlightingsystem
ON master_join.target_id = ApproachLightingSystemTimeSlicePropertyType.id
;

ApproachTimingTablePropertyType
CREATE OR REPLACE VIEW approachtimingtablepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachtimingtable_pt.id
    ) AS approachtimingtablepropertytype
FROM

-- ApproachTimingTableType
LEFT JOIN procedure.approachtimingtable_pt
ON procedure.approachtimingtable_pt.approachtimingtable_id = ApproachTimingTableType.id

;

ApproachTimingTableType
CREATE OR REPLACE VIEW approachtimingtabletype_view AS
SELECT
    jsonb_build_object(
       'startingmeasurementpoint_value', procedure.approachtimingtable.startingmeasurementpoint_value,
       'startingmeasurementpoint_nilreason', procedure.approachtimingtable.startingmeasurementpoint_nilreason,
       'endingmeasurementpoint_value', procedure.approachtimingtable.endingmeasurementpoint_value,
       'endingmeasurementpoint_nilreason', procedure.approachtimingtable.endingmeasurementpoint_nilreason,
       'time_value', procedure.approachtimingtable.time_value,
       'time_uom', procedure.approachtimingtable.time_uom,
       'time_nilreason', procedure.approachtimingtable.time_nilreason,
       'speed_value', procedure.approachtimingtable.speed_value,
       'speed_uom', procedure.approachtimingtable.speed_uom,
       'speed_nilreason', procedure.approachtimingtable.speed_nilreason,
       'id', procedure.approachtimingtable.id,
       'identifier', procedure.approachtimingtable.identifier,
       'identifier_code_space', procedure.approachtimingtable.identifier_code_space,
       'xml_id', procedure.approachtimingtable.xml_id
    ) AS approachtimingtabletype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.approachtimingtable
ON procedure.approachtimingtable.abstractapproachtimingtableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.approachtimingtable.id = master_join.source_id
LEFT JOIN procedure.approachtimingtable
ON master_join.target_id = NotePropertyType.id
;

ApronAreaAvailabilityPropertyType
CREATE OR REPLACE VIEW apronareaavailabilitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronareaavailability_pt.id
    ) AS apronareaavailabilitypropertytype
FROM

-- ApronAreaAvailabilityType
LEFT JOIN airport_heliport.apronareaavailability_pt
ON airport_heliport.apronareaavailability_pt.apronareaavailability_id = ApronAreaAvailabilityType.id

;

ApronAreaAvailabilityType
CREATE OR REPLACE VIEW apronareaavailabilitytype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', airport_heliport.apronareaavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.apronareaavailability.operationalstatus_nilreason,
       'warning_value', airport_heliport.apronareaavailability.warning_value,
       'warning_nilreason', airport_heliport.apronareaavailability.warning_nilreason,
       'id', airport_heliport.apronareaavailability.id,
       'identifier', airport_heliport.apronareaavailability.identifier,
       'identifier_code_space', airport_heliport.apronareaavailability.identifier_code_space,
       'xml_id', airport_heliport.apronareaavailability.xml_id
    ) AS apronareaavailabilitytype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.apronareaavailability
ON airport_heliport.apronareaavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronareaavailability
ON airport_heliport.apronareaavailability.abstractapronareaavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.apronareaavailability
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.apronareaavailability
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.apronareaavailability
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- ApronAreaUsagePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.apronareaavailability
ON master_join.target_id = ApronAreaUsagePropertyType.id
;

ApronAreaUsagePropertyType
CREATE OR REPLACE VIEW apronareausagepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronareausage_pt.id
    ) AS apronareausagepropertytype
FROM

-- ApronAreaUsageType
LEFT JOIN airport_heliport.apronareausage_pt
ON airport_heliport.apronareausage_pt.apronareausage_id = ApronAreaUsageType.id

;

ApronAreaUsageType
CREATE OR REPLACE VIEW apronareausagetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.apronareausage.type_value,
       'type_nilreason', airport_heliport.apronareausage.type_nilreason,
       'priorpermission_value', airport_heliport.apronareausage.priorpermission_value,
       'priorpermission_uom', airport_heliport.apronareausage.priorpermission_uom,
       'priorpermission_nilreason', airport_heliport.apronareausage.priorpermission_nilreason,
       'id', airport_heliport.apronareausage.id,
       'identifier', airport_heliport.apronareausage.identifier,
       'identifier_code_space', airport_heliport.apronareausage.identifier_code_space,
       'xml_id', airport_heliport.apronareausage.xml_id
    ) AS apronareausagetype
FROM

-- ConditionCombinationPropertyType
LEFT JOIN airport_heliport.apronareausage
ON airport_heliport.apronareausage.selection_id = ConditionCombinationPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronareausage
ON airport_heliport.apronareausage.abstractusageconditionextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronareausage
ON airport_heliport.apronareausage.abstractapronareausageextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronareausage.id = master_join.source_id
LEFT JOIN airport_heliport.apronareausage
ON master_join.target_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronareausage.id = master_join.source_id
LEFT JOIN airport_heliport.apronareausage
ON master_join.target_id = NotePropertyType.id
;

ApronContaminationPropertyType
CREATE OR REPLACE VIEW aproncontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aproncontamination_pt.id
    ) AS aproncontaminationpropertytype
FROM

-- ApronContaminationType
LEFT JOIN airport_heliport.aproncontamination_pt
ON airport_heliport.aproncontamination_pt.aproncontamination_id = ApronContaminationType.id

;

ApronContaminationType
CREATE OR REPLACE VIEW aproncontaminationtype_view AS
SELECT
    jsonb_build_object(
       'observationTime_value', airport_heliport.aproncontamination.observationTime_value,
       'observationTime_nilreason', airport_heliport.aproncontamination.observationTime_nilreason,
       'nextObservationTime_value', airport_heliport.aproncontamination.nextObservationTime_value,
       'nextObservationTime_nilreason', airport_heliport.aproncontamination.nextObservationTime_nilreason,
       'frictioncoefficient_value', airport_heliport.aproncontamination.frictioncoefficient_value,
       'frictioncoefficient_nilreason', airport_heliport.aproncontamination.frictioncoefficient_nilreason,
       'frictionestimation_value', airport_heliport.aproncontamination.frictionestimation_value,
       'frictionestimation_nilreason', airport_heliport.aproncontamination.frictionestimation_nilreason,
       'frictiondevice_value', airport_heliport.aproncontamination.frictiondevice_value,
       'frictiondevice_nilreason', airport_heliport.aproncontamination.frictiondevice_nilreason,
       'obscuredlights_value', airport_heliport.aproncontamination.obscuredlights_value,
       'obscuredlights_nilreason', airport_heliport.aproncontamination.obscuredlights_nilreason,
       'furtherclearancetime_value', airport_heliport.aproncontamination.furtherclearancetime_value,
       'furtherclearancetime_nilreason', airport_heliport.aproncontamination.furtherclearancetime_nilreason,
       'furthertotalclearance_value', airport_heliport.aproncontamination.furthertotalclearance_value,
       'furthertotalclearance_nilreason', airport_heliport.aproncontamination.furthertotalclearance_nilreason,
       'proportion_value', airport_heliport.aproncontamination.proportion_value,
       'proportion_nilreason', airport_heliport.aproncontamination.proportion_nilreason,
       'depth_value', airport_heliport.aproncontamination.depth_value,
       'depth_uom', airport_heliport.aproncontamination.depth_uom,
       'depth_nilreason', airport_heliport.aproncontamination.depth_nilreason,
       'id', airport_heliport.aproncontamination.id,
       'identifier', airport_heliport.aproncontamination.identifier,
       'identifier_code_space', airport_heliport.aproncontamination.identifier_code_space,
       'xml_id', airport_heliport.aproncontamination.xml_id
    ) AS aproncontaminationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.aproncontamination
ON airport_heliport.aproncontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.aproncontamination
ON airport_heliport.aproncontamination.abstractaproncontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aproncontamination.id = master_join.source_id
LEFT JOIN airport_heliport.aproncontamination
ON master_join.target_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aproncontamination.id = master_join.source_id
LEFT JOIN airport_heliport.aproncontamination
ON master_join.target_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.aproncontamination.id = master_join.source_id
LEFT JOIN airport_heliport.aproncontamination
ON master_join.target_id = NotePropertyType.id
;

ApronElementPropertyType
CREATE OR REPLACE VIEW apronelementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronelement_pt.id,
       'nilReason', airport_heliport.apronelement_pt.nilReason
    ) AS apronelementpropertytype
FROM


;

ApronElementTimeSlicePropertyType
CREATE OR REPLACE VIEW apronelementtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronelement_tsp.id
    ) AS apronelementtimeslicepropertytype
FROM

-- ApronElementTimeSliceType
LEFT JOIN airport_heliport.apronelement_tsp
ON airport_heliport.apronelement_tsp.apronelementtimeslice_id = ApronElementTimeSliceType.id

;

ApronElementTimeSliceType
CREATE OR REPLACE VIEW apronelementtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.apronelement_ts.type_value,
       'type_nilreason', airport_heliport.apronelement_ts.type_nilreason,
       'jetwayavailability_value', airport_heliport.apronelement_ts.jetwayavailability_value,
       'jetwayavailability_nilreason', airport_heliport.apronelement_ts.jetwayavailability_nilreason,
       'towingavailability_value', airport_heliport.apronelement_ts.towingavailability_value,
       'towingavailability_nilreason', airport_heliport.apronelement_ts.towingavailability_nilreason,
       'dockingavailability_value', airport_heliport.apronelement_ts.dockingavailability_value,
       'dockingavailability_nilreason', airport_heliport.apronelement_ts.dockingavailability_nilreason,
       'groundpoweravailability_value', airport_heliport.apronelement_ts.groundpoweravailability_value,
       'groundpoweravailability_nilreason', airport_heliport.apronelement_ts.groundpoweravailability_nilreason,
       'length_value', airport_heliport.apronelement_ts.length_value,
       'length_uom', airport_heliport.apronelement_ts.length_uom,
       'length_nilreason', airport_heliport.apronelement_ts.length_nilreason,
       'width_value', airport_heliport.apronelement_ts.width_value,
       'width_uom', airport_heliport.apronelement_ts.width_uom,
       'width_nilreason', airport_heliport.apronelement_ts.width_nilreason,
       'id', airport_heliport.apronelement_ts.id,
       'xml_id', airport_heliport.apronelement_ts.xml_id,
       'interpretation', airport_heliport.apronelement_ts.interpretation,
       'sequence_number', airport_heliport.apronelement_ts.sequence_number,
       'correction_number', airport_heliport.apronelement_ts.correction_number,
       'valid_time_begin', airport_heliport.apronelement_ts.valid_time_begin,
       'valid_time_end', airport_heliport.apronelement_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.apronelement_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.apronelement_ts.feature_lifetime_end
    ) AS apronelementtimeslicetype
FROM

-- ApronPropertyType
LEFT JOIN airport_heliport.apronelement_ts
ON airport_heliport.apronelement_ts.associatedapron_id = ApronPropertyType.id
-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.apronelement_ts
ON airport_heliport.apronelement_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.apronelement_ts
ON airport_heliport.apronelement_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronelement_ts
ON airport_heliport.apronelement_ts.abstractapronelementextension_id = AbstractExtensionType.id

-- AirportSuppliesServicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronelement_ts
ON master_join.target_id = AirportSuppliesServicePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronelement_ts
ON master_join.target_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronelement_ts
ON master_join.target_id = ApronAreaAvailabilityPropertyType.id
;

ApronElementType
CREATE OR REPLACE VIEW apronelementtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronelement.id,
       'identifier', airport_heliport.apronelement.identifier,
       'identifier_code_space', airport_heliport.apronelement.identifier_code_space,
       'xml_id', airport_heliport.apronelement.xml_id
    ) AS apronelementtype
FROM


-- ApronElementTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronelement.id = master_join.source_id
LEFT JOIN airport_heliport.apronelement
ON master_join.target_id = ApronElementTimeSlicePropertyType.id
;

ApronLightSystemPropertyType
CREATE OR REPLACE VIEW apronlightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronlightsystem_pt.id,
       'nilReason', airport_heliport.apronlightsystem_pt.nilReason
    ) AS apronlightsystempropertytype
FROM


;

ApronLightSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW apronlightsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronlightsystem_tsp.id
    ) AS apronlightsystemtimeslicepropertytype
FROM

-- ApronLightSystemTimeSliceType
LEFT JOIN airport_heliport.apronlightsystem_tsp
ON airport_heliport.apronlightsystem_tsp.apronlightsystemtimeslice_id = ApronLightSystemTimeSliceType.id

;

ApronLightSystemTimeSliceType
CREATE OR REPLACE VIEW apronlightsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.apronlightsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.apronlightsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.apronlightsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.apronlightsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.apronlightsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.apronlightsystem_ts.colour_nilreason,
       'position_value', airport_heliport.apronlightsystem_ts.position_value,
       'position_nilreason', airport_heliport.apronlightsystem_ts.position_nilreason,
       'id', airport_heliport.apronlightsystem_ts.id,
       'xml_id', airport_heliport.apronlightsystem_ts.xml_id,
       'interpretation', airport_heliport.apronlightsystem_ts.interpretation,
       'sequence_number', airport_heliport.apronlightsystem_ts.sequence_number,
       'correction_number', airport_heliport.apronlightsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.apronlightsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.apronlightsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.apronlightsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.apronlightsystem_ts.feature_lifetime_end
    ) AS apronlightsystemtimeslicetype
FROM

-- ApronPropertyType
LEFT JOIN airport_heliport.apronlightsystem_ts
ON airport_heliport.apronlightsystem_ts.lightedapron_id = ApronPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronlightsystem_ts
ON airport_heliport.apronlightsystem_ts.abstractapronlightsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronlightsystem_ts
ON airport_heliport.apronlightsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronlightsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronlightsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronlightsystem_ts
ON master_join.target_id = NotePropertyType.id
;

ApronLightSystemType
CREATE OR REPLACE VIEW apronlightsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronlightsystem.id,
       'identifier', airport_heliport.apronlightsystem.identifier,
       'identifier_code_space', airport_heliport.apronlightsystem.identifier_code_space,
       'xml_id', airport_heliport.apronlightsystem.xml_id
    ) AS apronlightsystemtype
FROM


-- ApronLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronlightsystem.id = master_join.source_id
LEFT JOIN airport_heliport.apronlightsystem
ON master_join.target_id = ApronLightSystemTimeSlicePropertyType.id
;

ApronMarkingPropertyType
CREATE OR REPLACE VIEW apronmarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronmarking_pt.id,
       'nilReason', airport_heliport.apronmarking_pt.nilReason
    ) AS apronmarkingpropertytype
FROM


;

ApronMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW apronmarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronmarking_tsp.id
    ) AS apronmarkingtimeslicepropertytype
FROM

-- ApronMarkingTimeSliceType
LEFT JOIN airport_heliport.apronmarking_tsp
ON airport_heliport.apronmarking_tsp.apronmarkingtimeslice_id = ApronMarkingTimeSliceType.id

;

ApronMarkingTimeSliceType
CREATE OR REPLACE VIEW apronmarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.apronmarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.apronmarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.apronmarking_ts.condition_value,
       'condition_nilreason', airport_heliport.apronmarking_ts.condition_nilreason,
       'markinglocation_value', airport_heliport.apronmarking_ts.markinglocation_value,
       'markinglocation_nilreason', airport_heliport.apronmarking_ts.markinglocation_nilreason,
       'id', airport_heliport.apronmarking_ts.id,
       'xml_id', airport_heliport.apronmarking_ts.xml_id,
       'interpretation', airport_heliport.apronmarking_ts.interpretation,
       'sequence_number', airport_heliport.apronmarking_ts.sequence_number,
       'correction_number', airport_heliport.apronmarking_ts.correction_number,
       'valid_time_begin', airport_heliport.apronmarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.apronmarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.apronmarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.apronmarking_ts.feature_lifetime_end
    ) AS apronmarkingtimeslicetype
FROM

-- ApronPropertyType
LEFT JOIN airport_heliport.apronmarking_ts
ON airport_heliport.apronmarking_ts.markedapron_id = ApronPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronmarking_ts
ON airport_heliport.apronmarking_ts.abstractapronmarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronmarking_ts
ON airport_heliport.apronmarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronmarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apronmarking_ts
ON master_join.target_id = NotePropertyType.id
;

ApronMarkingType
CREATE OR REPLACE VIEW apronmarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronmarking.id,
       'identifier', airport_heliport.apronmarking.identifier,
       'identifier_code_space', airport_heliport.apronmarking.identifier_code_space,
       'xml_id', airport_heliport.apronmarking.xml_id
    ) AS apronmarkingtype
FROM


-- ApronMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apronmarking.id = master_join.source_id
LEFT JOIN airport_heliport.apronmarking
ON master_join.target_id = ApronMarkingTimeSlicePropertyType.id
;

ApronPropertyType
CREATE OR REPLACE VIEW apronpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apron_pt.id,
       'nilReason', airport_heliport.apron_pt.nilReason
    ) AS apronpropertytype
FROM


;

ApronTimeSlicePropertyType
CREATE OR REPLACE VIEW aprontimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apron_tsp.id
    ) AS aprontimeslicepropertytype
FROM

-- ApronTimeSliceType
LEFT JOIN airport_heliport.apron_tsp
ON airport_heliport.apron_tsp.aprontimeslice_id = ApronTimeSliceType.id

;

ApronTimeSliceType
CREATE OR REPLACE VIEW aprontimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', airport_heliport.apron_ts.name_value,
       'name_nilreason', airport_heliport.apron_ts.name_nilreason,
       'abandoned_value', airport_heliport.apron_ts.abandoned_value,
       'abandoned_nilreason', airport_heliport.apron_ts.abandoned_nilreason,
       'id', airport_heliport.apron_ts.id,
       'xml_id', airport_heliport.apron_ts.xml_id,
       'interpretation', airport_heliport.apron_ts.interpretation,
       'sequence_number', airport_heliport.apron_ts.sequence_number,
       'correction_number', airport_heliport.apron_ts.correction_number,
       'valid_time_begin', airport_heliport.apron_ts.valid_time_begin,
       'valid_time_end', airport_heliport.apron_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.apron_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.apron_ts.feature_lifetime_end
    ) AS aprontimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.apron_ts
ON airport_heliport.apron_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.apron_ts
ON airport_heliport.apron_ts.associatedairportheliport_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apron_ts
ON airport_heliport.apron_ts.abstractapronextension_id = AbstractExtensionType.id

-- ApronContaminationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apron_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apron_ts
ON master_join.target_id = ApronContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apron_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apron_ts
ON master_join.target_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apron_ts.id = master_join.source_id
LEFT JOIN airport_heliport.apron_ts
ON master_join.target_id = ApronAreaAvailabilityPropertyType.id
;

ApronType
CREATE OR REPLACE VIEW aprontype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apron.id,
       'identifier', airport_heliport.apron.identifier,
       'identifier_code_space', airport_heliport.apron.identifier_code_space,
       'xml_id', airport_heliport.apron.xml_id
    ) AS aprontype
FROM


-- ApronTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.apron.id = master_join.source_id
LEFT JOIN airport_heliport.apron
ON master_join.target_id = ApronTimeSlicePropertyType.id
;

ArrestingGearPropertyType
CREATE OR REPLACE VIEW arrestinggearpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.arrestinggear_pt.id,
       'nilReason', airport_heliport.arrestinggear_pt.nilReason
    ) AS arrestinggearpropertytype
FROM


;

ArrestingGearTimeSlicePropertyType
CREATE OR REPLACE VIEW arrestinggeartimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.arrestinggear_tsp.id
    ) AS arrestinggeartimeslicepropertytype
FROM

-- ArrestingGearTimeSliceType
LEFT JOIN airport_heliport.arrestinggear_tsp
ON airport_heliport.arrestinggear_tsp.arrestinggeartimeslice_id = ArrestingGearTimeSliceType.id

;

ArrestingGearTimeSliceType
CREATE OR REPLACE VIEW arrestinggeartimeslicetype_view AS
SELECT
    jsonb_build_object(
       'status_value', airport_heliport.arrestinggear_ts.status_value,
       'status_nilreason', airport_heliport.arrestinggear_ts.status_nilreason,
       'engagedevice_value', airport_heliport.arrestinggear_ts.engagedevice_value,
       'engagedevice_nilreason', airport_heliport.arrestinggear_ts.engagedevice_nilreason,
       'absorbtype_value', airport_heliport.arrestinggear_ts.absorbtype_value,
       'absorbtype_nilreason', airport_heliport.arrestinggear_ts.absorbtype_nilreason,
       'bidirectional_value', airport_heliport.arrestinggear_ts.bidirectional_value,
       'bidirectional_nilreason', airport_heliport.arrestinggear_ts.bidirectional_nilreason,
       'length_value', airport_heliport.arrestinggear_ts.length_value,
       'length_uom', airport_heliport.arrestinggear_ts.length_uom,
       'length_nilreason', airport_heliport.arrestinggear_ts.length_nilreason,
       'width_value', airport_heliport.arrestinggear_ts.width_value,
       'width_uom', airport_heliport.arrestinggear_ts.width_uom,
       'width_nilreason', airport_heliport.arrestinggear_ts.width_nilreason,
       'location_value', airport_heliport.arrestinggear_ts.location_value,
       'location_uom', airport_heliport.arrestinggear_ts.location_uom,
       'location_nilreason', airport_heliport.arrestinggear_ts.location_nilreason,
       'id', airport_heliport.arrestinggear_ts.id,
       'xml_id', airport_heliport.arrestinggear_ts.xml_id,
       'interpretation', airport_heliport.arrestinggear_ts.interpretation,
       'sequence_number', airport_heliport.arrestinggear_ts.sequence_number,
       'correction_number', airport_heliport.arrestinggear_ts.correction_number,
       'valid_time_begin', airport_heliport.arrestinggear_ts.valid_time_begin,
       'valid_time_end', airport_heliport.arrestinggear_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.arrestinggear_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.arrestinggear_ts.feature_lifetime_end
    ) AS arrestinggeartimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedCurvePropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.extent_curveextent_id = ElevatedCurvePropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.extent_surfaceextent_id = ElevatedSurfacePropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.extent_pointextent_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.abstractarrestinggearextension_id = AbstractExtensionType.id

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.arrestinggear_ts.id = master_join.source_id
LEFT JOIN airport_heliport.arrestinggear_ts
ON master_join.target_id = RunwayDirectionPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.arrestinggear_ts.id = master_join.source_id
LEFT JOIN airport_heliport.arrestinggear_ts
ON master_join.target_id = NotePropertyType.id
;

ArrestingGearType
CREATE OR REPLACE VIEW arrestinggeartype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.arrestinggear.id,
       'identifier', airport_heliport.arrestinggear.identifier,
       'identifier_code_space', airport_heliport.arrestinggear.identifier_code_space,
       'xml_id', airport_heliport.arrestinggear.xml_id
    ) AS arrestinggeartype
FROM


-- ArrestingGearTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.arrestinggear.id = master_join.source_id
LEFT JOIN airport_heliport.arrestinggear
ON master_join.target_id = ArrestingGearTimeSlicePropertyType.id
;

ArrivalFeederLegPropertyType
CREATE OR REPLACE VIEW arrivalfeederlegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalfeederleg_pt.id,
       'nilReason', procedure.arrivalfeederleg_pt.nilReason
    ) AS arrivalfeederlegpropertytype
FROM


;

ArrivalFeederLegTimeSlicePropertyType
CREATE OR REPLACE VIEW arrivalfeederlegtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalfeederleg_tsp.id
    ) AS arrivalfeederlegtimeslicepropertytype
FROM

-- ArrivalFeederLegTimeSliceType
LEFT JOIN procedure.arrivalfeederleg_tsp
ON procedure.arrivalfeederleg_tsp.arrivalfeederlegtimeslice_id = ArrivalFeederLegTimeSliceType.id

;

ArrivalFeederLegTimeSliceType
CREATE OR REPLACE VIEW arrivalfeederlegtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'endconditiondesignator_value', procedure.arrivalfeederleg_ts.endconditiondesignator_value,
       'endconditiondesignator_nilreason', procedure.arrivalfeederleg_ts.endconditiondesignator_nilreason,
       'legpath_value', procedure.arrivalfeederleg_ts.legpath_value,
       'legpath_nilreason', procedure.arrivalfeederleg_ts.legpath_nilreason,
       'legtypearinc_value', procedure.arrivalfeederleg_ts.legtypearinc_value,
       'legtypearinc_nilreason', procedure.arrivalfeederleg_ts.legtypearinc_nilreason,
       'course_value', procedure.arrivalfeederleg_ts.course_value,
       'course_nilreason', procedure.arrivalfeederleg_ts.course_nilreason,
       'coursetype_value', procedure.arrivalfeederleg_ts.coursetype_value,
       'coursetype_nilreason', procedure.arrivalfeederleg_ts.coursetype_nilreason,
       'coursedirection_value', procedure.arrivalfeederleg_ts.coursedirection_value,
       'coursedirection_nilreason', procedure.arrivalfeederleg_ts.coursedirection_nilreason,
       'turndirection_value', procedure.arrivalfeederleg_ts.turndirection_value,
       'turndirection_nilreason', procedure.arrivalfeederleg_ts.turndirection_nilreason,
       'speedreference_value', procedure.arrivalfeederleg_ts.speedreference_value,
       'speedreference_nilreason', procedure.arrivalfeederleg_ts.speedreference_nilreason,
       'speedinterpretation_value', procedure.arrivalfeederleg_ts.speedinterpretation_value,
       'speedinterpretation_nilreason', procedure.arrivalfeederleg_ts.speedinterpretation_nilreason,
       'bankangle_value', procedure.arrivalfeederleg_ts.bankangle_value,
       'bankangle_nilreason', procedure.arrivalfeederleg_ts.bankangle_nilreason,
       'procedureturnrequired_value', procedure.arrivalfeederleg_ts.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.arrivalfeederleg_ts.procedureturnrequired_nilreason,
       'upperlimitreference_value', procedure.arrivalfeederleg_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', procedure.arrivalfeederleg_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', procedure.arrivalfeederleg_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', procedure.arrivalfeederleg_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', procedure.arrivalfeederleg_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', procedure.arrivalfeederleg_ts.altitudeinterpretation_nilreason,
       'altitudeoverridereference_value', procedure.arrivalfeederleg_ts.altitudeoverridereference_value,
       'altitudeoverridereference_nilreason', procedure.arrivalfeederleg_ts.altitudeoverridereference_nilreason,
       'verticalangle_value', procedure.arrivalfeederleg_ts.verticalangle_value,
       'verticalangle_nilreason', procedure.arrivalfeederleg_ts.verticalangle_nilreason,
       'requirednavigationperformance_value', procedure.arrivalfeederleg_ts.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', procedure.arrivalfeederleg_ts.requirednavigationperformance_nilreason,
       'speedlimit_value', procedure.arrivalfeederleg_ts.speedlimit_value,
       'speedlimit_uom', procedure.arrivalfeederleg_ts.speedlimit_uom,
       'speedlimit_nilreason', procedure.arrivalfeederleg_ts.speedlimit_nilreason,
       'length_value', procedure.arrivalfeederleg_ts.length_value,
       'length_uom', procedure.arrivalfeederleg_ts.length_uom,
       'length_nilreason', procedure.arrivalfeederleg_ts.length_nilreason,
       'duration_value', procedure.arrivalfeederleg_ts.duration_value,
       'duration_uom', procedure.arrivalfeederleg_ts.duration_uom,
       'duration_nilreason', procedure.arrivalfeederleg_ts.duration_nilreason,
       'upperlimitaltitude_value', procedure.arrivalfeederleg_ts.upperlimitaltitude_value,
       'upperlimitaltitude_uom', procedure.arrivalfeederleg_ts.upperlimitaltitude_uom,
       'upperlimitaltitude_nilreason', procedure.arrivalfeederleg_ts.upperlimitaltitude_nilreason,
       'lowerlimitaltitude_value', procedure.arrivalfeederleg_ts.lowerlimitaltitude_value,
       'lowerlimitaltitude_uom', procedure.arrivalfeederleg_ts.lowerlimitaltitude_uom,
       'lowerlimitaltitude_nilreason', procedure.arrivalfeederleg_ts.lowerlimitaltitude_nilreason,
       'altitudeoverrideatc_value', procedure.arrivalfeederleg_ts.altitudeoverrideatc_value,
       'altitudeoverrideatc_uom', procedure.arrivalfeederleg_ts.altitudeoverrideatc_uom,
       'altitudeoverrideatc_nilreason', procedure.arrivalfeederleg_ts.altitudeoverrideatc_nilreason,
       'id', procedure.arrivalfeederleg_ts.id,
       'xml_id', procedure.arrivalfeederleg_ts.xml_id,
       'interpretation', procedure.arrivalfeederleg_ts.interpretation,
       'sequence_number', procedure.arrivalfeederleg_ts.sequence_number,
       'correction_number', procedure.arrivalfeederleg_ts.correction_number,
       'valid_time_begin', procedure.arrivalfeederleg_ts.valid_time_begin,
       'valid_time_end', procedure.arrivalfeederleg_ts.valid_time_end,
       'feature_lifetime_begin', procedure.arrivalfeederleg_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.arrivalfeederleg_ts.feature_lifetime_end
    ) AS arrivalfeederlegtimeslicetype
FROM

-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.startpoint_id = TerminalSegmentPointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.endpoint_id = TerminalSegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.trajectory_id = CurvePropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.arccentre_id = TerminalSegmentPointPropertyType.id
-- AngleIndicationPropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.angle_id = AngleIndicationPropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.distance_id = DistanceIndicationPropertyType.id
-- HoldingUsePropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.holding_id = HoldingUsePropertyType.id
-- InstrumentApproachProcedurePropertyType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.approach_id = InstrumentApproachProcedurePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.abstractarrivalfeederlegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.abstractapproachlegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.arrivalfeederleg_ts
ON procedure.arrivalfeederleg_ts.abstractsegmentlegextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalfeederleg_ts.id = master_join.source_id
LEFT JOIN procedure.arrivalfeederleg_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalfeederleg_ts.id = master_join.source_id
LEFT JOIN procedure.arrivalfeederleg_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalfeederleg_ts.id = master_join.source_id
LEFT JOIN procedure.arrivalfeederleg_ts
ON master_join.target_id = NotePropertyType.id
;

ArrivalFeederLegType
CREATE OR REPLACE VIEW arrivalfeederlegtype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalfeederleg.id,
       'identifier', procedure.arrivalfeederleg.identifier,
       'identifier_code_space', procedure.arrivalfeederleg.identifier_code_space,
       'xml_id', procedure.arrivalfeederleg.xml_id
    ) AS arrivalfeederlegtype
FROM


-- ArrivalFeederLegTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalfeederleg.id = master_join.source_id
LEFT JOIN procedure.arrivalfeederleg
ON master_join.target_id = ArrivalFeederLegTimeSlicePropertyType.id
;

ArrivalLegPropertyType
CREATE OR REPLACE VIEW arrivallegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalleg_pt.id,
       'nilReason', procedure.arrivalleg_pt.nilReason
    ) AS arrivallegpropertytype
FROM


;

ArrivalLegTimeSlicePropertyType
CREATE OR REPLACE VIEW arrivallegtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalleg_tsp.id
    ) AS arrivallegtimeslicepropertytype
FROM

-- ArrivalLegTimeSliceType
LEFT JOIN procedure.arrivalleg_tsp
ON procedure.arrivalleg_tsp.arrivallegtimeslice_id = ArrivalLegTimeSliceType.id

;

ArrivalLegTimeSliceType
CREATE OR REPLACE VIEW arrivallegtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'endconditiondesignator_value', procedure.arrivalleg_ts.endconditiondesignator_value,
       'endconditiondesignator_nilreason', procedure.arrivalleg_ts.endconditiondesignator_nilreason,
       'legpath_value', procedure.arrivalleg_ts.legpath_value,
       'legpath_nilreason', procedure.arrivalleg_ts.legpath_nilreason,
       'legtypearinc_value', procedure.arrivalleg_ts.legtypearinc_value,
       'legtypearinc_nilreason', procedure.arrivalleg_ts.legtypearinc_nilreason,
       'course_value', procedure.arrivalleg_ts.course_value,
       'course_nilreason', procedure.arrivalleg_ts.course_nilreason,
       'coursetype_value', procedure.arrivalleg_ts.coursetype_value,
       'coursetype_nilreason', procedure.arrivalleg_ts.coursetype_nilreason,
       'coursedirection_value', procedure.arrivalleg_ts.coursedirection_value,
       'coursedirection_nilreason', procedure.arrivalleg_ts.coursedirection_nilreason,
       'turndirection_value', procedure.arrivalleg_ts.turndirection_value,
       'turndirection_nilreason', procedure.arrivalleg_ts.turndirection_nilreason,
       'speedreference_value', procedure.arrivalleg_ts.speedreference_value,
       'speedreference_nilreason', procedure.arrivalleg_ts.speedreference_nilreason,
       'speedinterpretation_value', procedure.arrivalleg_ts.speedinterpretation_value,
       'speedinterpretation_nilreason', procedure.arrivalleg_ts.speedinterpretation_nilreason,
       'bankangle_value', procedure.arrivalleg_ts.bankangle_value,
       'bankangle_nilreason', procedure.arrivalleg_ts.bankangle_nilreason,
       'procedureturnrequired_value', procedure.arrivalleg_ts.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.arrivalleg_ts.procedureturnrequired_nilreason,
       'upperlimitreference_value', procedure.arrivalleg_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', procedure.arrivalleg_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', procedure.arrivalleg_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', procedure.arrivalleg_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', procedure.arrivalleg_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', procedure.arrivalleg_ts.altitudeinterpretation_nilreason,
       'altitudeoverridereference_value', procedure.arrivalleg_ts.altitudeoverridereference_value,
       'altitudeoverridereference_nilreason', procedure.arrivalleg_ts.altitudeoverridereference_nilreason,
       'verticalangle_value', procedure.arrivalleg_ts.verticalangle_value,
       'verticalangle_nilreason', procedure.arrivalleg_ts.verticalangle_nilreason,
       'requirednavigationperformance_value', procedure.arrivalleg_ts.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', procedure.arrivalleg_ts.requirednavigationperformance_nilreason,
       'speedlimit_value', procedure.arrivalleg_ts.speedlimit_value,
       'speedlimit_uom', procedure.arrivalleg_ts.speedlimit_uom,
       'speedlimit_nilreason', procedure.arrivalleg_ts.speedlimit_nilreason,
       'length_value', procedure.arrivalleg_ts.length_value,
       'length_uom', procedure.arrivalleg_ts.length_uom,
       'length_nilreason', procedure.arrivalleg_ts.length_nilreason,
       'duration_value', procedure.arrivalleg_ts.duration_value,
       'duration_uom', procedure.arrivalleg_ts.duration_uom,
       'duration_nilreason', procedure.arrivalleg_ts.duration_nilreason,
       'upperlimitaltitude_value', procedure.arrivalleg_ts.upperlimitaltitude_value,
       'upperlimitaltitude_uom', procedure.arrivalleg_ts.upperlimitaltitude_uom,
       'upperlimitaltitude_nilreason', procedure.arrivalleg_ts.upperlimitaltitude_nilreason,
       'lowerlimitaltitude_value', procedure.arrivalleg_ts.lowerlimitaltitude_value,
       'lowerlimitaltitude_uom', procedure.arrivalleg_ts.lowerlimitaltitude_uom,
       'lowerlimitaltitude_nilreason', procedure.arrivalleg_ts.lowerlimitaltitude_nilreason,
       'altitudeoverrideatc_value', procedure.arrivalleg_ts.altitudeoverrideatc_value,
       'altitudeoverrideatc_uom', procedure.arrivalleg_ts.altitudeoverrideatc_uom,
       'altitudeoverrideatc_nilreason', procedure.arrivalleg_ts.altitudeoverrideatc_nilreason,
       'id', procedure.arrivalleg_ts.id,
       'xml_id', procedure.arrivalleg_ts.xml_id,
       'interpretation', procedure.arrivalleg_ts.interpretation,
       'sequence_number', procedure.arrivalleg_ts.sequence_number,
       'correction_number', procedure.arrivalleg_ts.correction_number,
       'valid_time_begin', procedure.arrivalleg_ts.valid_time_begin,
       'valid_time_end', procedure.arrivalleg_ts.valid_time_end,
       'feature_lifetime_begin', procedure.arrivalleg_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.arrivalleg_ts.feature_lifetime_end
    ) AS arrivallegtimeslicetype
FROM

-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.startpoint_id = TerminalSegmentPointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.endpoint_id = TerminalSegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.trajectory_id = CurvePropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.arccentre_id = TerminalSegmentPointPropertyType.id
-- AngleIndicationPropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.angle_id = AngleIndicationPropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.distance_id = DistanceIndicationPropertyType.id
-- HoldingUsePropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.holding_id = HoldingUsePropertyType.id
-- StandardInstrumentArrivalPropertyType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.arrival_id = StandardInstrumentArrivalPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.abstractarrivallegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.arrivalleg_ts
ON procedure.arrivalleg_ts.abstractsegmentlegextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalleg_ts.id = master_join.source_id
LEFT JOIN procedure.arrivalleg_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalleg_ts.id = master_join.source_id
LEFT JOIN procedure.arrivalleg_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalleg_ts.id = master_join.source_id
LEFT JOIN procedure.arrivalleg_ts
ON master_join.target_id = NotePropertyType.id
;

ArrivalLegType
CREATE OR REPLACE VIEW arrivallegtype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalleg.id,
       'identifier', procedure.arrivalleg.identifier,
       'identifier_code_space', procedure.arrivalleg.identifier_code_space,
       'xml_id', procedure.arrivalleg.xml_id
    ) AS arrivallegtype
FROM


-- ArrivalLegTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.arrivalleg.id = master_join.source_id
LEFT JOIN procedure.arrivalleg
ON master_join.target_id = ArrivalLegTimeSlicePropertyType.id
;

AuthorityForAerialRefuellingPropertyType
CREATE OR REPLACE VIEW authorityforaerialrefuellingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.authorityforaerialrefuelling_pt.id
    ) AS authorityforaerialrefuellingpropertytype
FROM

-- AuthorityForAerialRefuellingType
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling_pt
ON aerial_refuelling.authorityforaerialrefuelling_pt.authorityforaerialrefuelling_id = AuthorityForAerialRefuellingType.id

;

AuthorityForAerialRefuellingType
CREATE OR REPLACE VIEW authorityforaerialrefuellingtype_view AS
SELECT
    jsonb_build_object(
       'type_value', aerial_refuelling.authorityforaerialrefuelling.type_value,
       'type_nilreason', aerial_refuelling.authorityforaerialrefuelling.type_nilreason,
       'id', aerial_refuelling.authorityforaerialrefuelling.id,
       'identifier', aerial_refuelling.authorityforaerialrefuelling.identifier,
       'identifier_code_space', aerial_refuelling.authorityforaerialrefuelling.identifier_code_space,
       'xml_id', aerial_refuelling.authorityforaerialrefuelling.xml_id
    ) AS authorityforaerialrefuellingtype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling
ON aerial_refuelling.authorityforaerialrefuelling.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling
ON aerial_refuelling.authorityforaerialrefuelling.abstractauthorityforaerialrefuellingextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN aerial_refuelling.master_join
ON aerial_refuelling.authorityforaerialrefuelling.id = master_join.source_id
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling
ON master_join.target_id = NotePropertyType.id
;

AuthorityForAirspacePropertyType
CREATE OR REPLACE VIEW authorityforairspacepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.authorityforairspace_pt.id,
       'nilReason', airspace.authorityforairspace_pt.nilReason
    ) AS authorityforairspacepropertytype
FROM


;

AuthorityForAirspaceTimeSlicePropertyType
CREATE OR REPLACE VIEW authorityforairspacetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.authorityforairspace_tsp.id
    ) AS authorityforairspacetimeslicepropertytype
FROM

-- AuthorityForAirspaceTimeSliceType
LEFT JOIN airspace.authorityforairspace_tsp
ON airspace.authorityforairspace_tsp.authorityforairspacetimeslice_id = AuthorityForAirspaceTimeSliceType.id

;

AuthorityForAirspaceTimeSliceType
CREATE OR REPLACE VIEW authorityforairspacetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airspace.authorityforairspace_ts.type_value,
       'type_nilreason', airspace.authorityforairspace_ts.type_nilreason,
       'id', airspace.authorityforairspace_ts.id,
       'xml_id', airspace.authorityforairspace_ts.xml_id,
       'interpretation', airspace.authorityforairspace_ts.interpretation,
       'sequence_number', airspace.authorityforairspace_ts.sequence_number,
       'correction_number', airspace.authorityforairspace_ts.correction_number,
       'valid_time_begin', airspace.authorityforairspace_ts.valid_time_begin,
       'valid_time_end', airspace.authorityforairspace_ts.valid_time_end,
       'feature_lifetime_begin', airspace.authorityforairspace_ts.feature_lifetime_begin,
       'feature_lifetime_end', airspace.authorityforairspace_ts.feature_lifetime_end
    ) AS authorityforairspacetimeslicetype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN airspace.authorityforairspace_ts
ON airspace.authorityforairspace_ts.responsibleorganisation_id = OrganisationAuthorityPropertyType.id
-- AirspacePropertyType
LEFT JOIN airspace.authorityforairspace_ts
ON airspace.authorityforairspace_ts.assignedairspace_id = AirspacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.authorityforairspace_ts
ON airspace.authorityforairspace_ts.abstractauthorityforairspaceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.authorityforairspace_ts.id = master_join.source_id
LEFT JOIN airspace.authorityforairspace_ts
ON master_join.target_id = NotePropertyType.id
;

AuthorityForAirspaceType
CREATE OR REPLACE VIEW authorityforairspacetype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.authorityforairspace.id,
       'identifier', airspace.authorityforairspace.identifier,
       'identifier_code_space', airspace.authorityforairspace.identifier_code_space,
       'xml_id', airspace.authorityforairspace.xml_id
    ) AS authorityforairspacetype
FROM


-- AuthorityForAirspaceTimeSlicePropertyType
LEFT JOIN airspace.master_join
ON airspace.authorityforairspace.id = master_join.source_id
LEFT JOIN airspace.authorityforairspace
ON master_join.target_id = AuthorityForAirspaceTimeSlicePropertyType.id
;

AuthorityForNavaidEquipmentPropertyType
CREATE OR REPLACE VIEW authorityfornavaidequipmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.authorityfornavaidequipment_pt.id
    ) AS authorityfornavaidequipmentpropertytype
FROM

-- AuthorityForNavaidEquipmentType
LEFT JOIN navaids_points.authorityfornavaidequipment_pt
ON navaids_points.authorityfornavaidequipment_pt.authorityfornavaidequipment_id = AuthorityForNavaidEquipmentType.id

;

AuthorityForNavaidEquipmentType
CREATE OR REPLACE VIEW authorityfornavaidequipmenttype_view AS
SELECT
    jsonb_build_object(
       'type_value', navaids_points.authorityfornavaidequipment.type_value,
       'type_nilreason', navaids_points.authorityfornavaidequipment.type_nilreason,
       'id', navaids_points.authorityfornavaidequipment.id,
       'identifier', navaids_points.authorityfornavaidequipment.identifier,
       'identifier_code_space', navaids_points.authorityfornavaidequipment.identifier_code_space,
       'xml_id', navaids_points.authorityfornavaidequipment.xml_id
    ) AS authorityfornavaidequipmenttype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.authorityfornavaidequipment
ON navaids_points.authorityfornavaidequipment.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.authorityfornavaidequipment
ON navaids_points.authorityfornavaidequipment.abstractauthorityfornavaidequipmentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.authorityfornavaidequipment.id = master_join.source_id
LEFT JOIN navaids_points.authorityfornavaidequipment
ON master_join.target_id = NotePropertyType.id
;

AuthorityForSpecialNavigationStationPropertyType
CREATE OR REPLACE VIEW authorityforspecialnavigationstationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.authorityforspecialnavigationstation_pt.id
    ) AS authorityforspecialnavigationstationpropertytype
FROM

-- AuthorityForSpecialNavigationStationType
LEFT JOIN navaids_points.authorityforspecialnavigationstation_pt
ON navaids_points.authorityforspecialnavigationstation_pt.authorityforspecialnavigationstation_id = AuthorityForSpecialNavigationStationType.id

;

AuthorityForSpecialNavigationStationType
CREATE OR REPLACE VIEW authorityforspecialnavigationstationtype_view AS
SELECT
    jsonb_build_object(
       'type_value', navaids_points.authorityforspecialnavigationstation.type_value,
       'type_nilreason', navaids_points.authorityforspecialnavigationstation.type_nilreason,
       'id', navaids_points.authorityforspecialnavigationstation.id,
       'identifier', navaids_points.authorityforspecialnavigationstation.identifier,
       'identifier_code_space', navaids_points.authorityforspecialnavigationstation.identifier_code_space,
       'xml_id', navaids_points.authorityforspecialnavigationstation.xml_id
    ) AS authorityforspecialnavigationstationtype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.authorityforspecialnavigationstation
ON navaids_points.authorityforspecialnavigationstation.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.authorityforspecialnavigationstation
ON navaids_points.authorityforspecialnavigationstation.abstractauthorityforspecialnavigationstationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.authorityforspecialnavigationstation.id = master_join.source_id
LEFT JOIN navaids_points.authorityforspecialnavigationstation
ON master_join.target_id = NotePropertyType.id
;

AuthorityForSpecialNavigationSystemPropertyType
CREATE OR REPLACE VIEW authorityforspecialnavigationsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.authorityforspecialnavigationsystem_pt.id
    ) AS authorityforspecialnavigationsystempropertytype
FROM

-- AuthorityForSpecialNavigationSystemType
LEFT JOIN navaids_points.authorityforspecialnavigationsystem_pt
ON navaids_points.authorityforspecialnavigationsystem_pt.authorityforspecialnavigationsystem_id = AuthorityForSpecialNavigationSystemType.id

;

AuthorityForSpecialNavigationSystemType
CREATE OR REPLACE VIEW authorityforspecialnavigationsystemtype_view AS
SELECT
    jsonb_build_object(
       'type_value', navaids_points.authorityforspecialnavigationsystem.type_value,
       'type_nilreason', navaids_points.authorityforspecialnavigationsystem.type_nilreason,
       'id', navaids_points.authorityforspecialnavigationsystem.id,
       'identifier', navaids_points.authorityforspecialnavigationsystem.identifier,
       'identifier_code_space', navaids_points.authorityforspecialnavigationsystem.identifier_code_space,
       'xml_id', navaids_points.authorityforspecialnavigationsystem.xml_id
    ) AS authorityforspecialnavigationsystemtype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.authorityforspecialnavigationsystem
ON navaids_points.authorityforspecialnavigationsystem.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.authorityforspecialnavigationsystem
ON navaids_points.authorityforspecialnavigationsystem.abstractauthorityforspecialnavigationsystemextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.authorityforspecialnavigationsystem.id = master_join.source_id
LEFT JOIN navaids_points.authorityforspecialnavigationsystem
ON master_join.target_id = NotePropertyType.id
;

AzimuthPropertyType
CREATE OR REPLACE VIEW azimuthpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.azimuth_pt.id,
       'nilReason', navaids_points.azimuth_pt.nilReason
    ) AS azimuthpropertytype
FROM


;

AzimuthTimeSlicePropertyType
CREATE OR REPLACE VIEW azimuthtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.azimuth_tsp.id
    ) AS azimuthtimeslicepropertytype
FROM

-- AzimuthTimeSliceType
LEFT JOIN navaids_points.azimuth_tsp
ON navaids_points.azimuth_tsp.azimuthtimeslice_id = AzimuthTimeSliceType.id

;

AzimuthTimeSliceType
CREATE OR REPLACE VIEW azimuthtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.azimuth_ts.designator_value,
       'designator_nilreason', navaids_points.azimuth_ts.designator_nilreason,
       'name_value', navaids_points.azimuth_ts.name_value,
       'name_nilreason', navaids_points.azimuth_ts.name_nilreason,
       'emissionclass_value', navaids_points.azimuth_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.azimuth_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.azimuth_ts.mobile_value,
       'mobile_nilreason', navaids_points.azimuth_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.azimuth_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.azimuth_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.azimuth_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.azimuth_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.azimuth_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.azimuth_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.azimuth_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.azimuth_ts.flightchecked_nilreason,
       'type_value', navaids_points.azimuth_ts.type_value,
       'type_nilreason', navaids_points.azimuth_ts.type_nilreason,
       'truebearing_value', navaids_points.azimuth_ts.truebearing_value,
       'truebearing_nilreason', navaids_points.azimuth_ts.truebearing_nilreason,
       'truebearingaccuracy_value', navaids_points.azimuth_ts.truebearingaccuracy_value,
       'truebearingaccuracy_nilreason', navaids_points.azimuth_ts.truebearingaccuracy_nilreason,
       'magneticbearing_value', navaids_points.azimuth_ts.magneticbearing_value,
       'magneticbearing_nilreason', navaids_points.azimuth_ts.magneticbearing_nilreason,
       'angleproportionalleft_value', navaids_points.azimuth_ts.angleproportionalleft_value,
       'angleproportionalleft_nilreason', navaids_points.azimuth_ts.angleproportionalleft_nilreason,
       'angleproportionalright_value', navaids_points.azimuth_ts.angleproportionalright_value,
       'angleproportionalright_nilreason', navaids_points.azimuth_ts.angleproportionalright_nilreason,
       'anglecoverleft_value', navaids_points.azimuth_ts.anglecoverleft_value,
       'anglecoverleft_nilreason', navaids_points.azimuth_ts.anglecoverleft_nilreason,
       'anglecoverright_value', navaids_points.azimuth_ts.anglecoverright_value,
       'anglecoverright_nilreason', navaids_points.azimuth_ts.anglecoverright_nilreason,
       'channel_value', navaids_points.azimuth_ts.channel_value,
       'channel_nilreason', navaids_points.azimuth_ts.channel_nilreason,
       'id', navaids_points.azimuth_ts.id,
       'xml_id', navaids_points.azimuth_ts.xml_id,
       'interpretation', navaids_points.azimuth_ts.interpretation,
       'sequence_number', navaids_points.azimuth_ts.sequence_number,
       'correction_number', navaids_points.azimuth_ts.correction_number,
       'valid_time_begin', navaids_points.azimuth_ts.valid_time_begin,
       'valid_time_end', navaids_points.azimuth_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.azimuth_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.azimuth_ts.feature_lifetime_end
    ) AS azimuthtimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.azimuth_ts
ON navaids_points.azimuth_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.azimuth_ts
ON navaids_points.azimuth_ts.abstractazimuthextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.azimuth_ts
ON navaids_points.azimuth_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.azimuth_ts.id = master_join.source_id
LEFT JOIN navaids_points.azimuth_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.azimuth_ts.id = master_join.source_id
LEFT JOIN navaids_points.azimuth_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.azimuth_ts.id = master_join.source_id
LEFT JOIN navaids_points.azimuth_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.azimuth_ts.id = master_join.source_id
LEFT JOIN navaids_points.azimuth_ts
ON master_join.target_id = NotePropertyType.id
;

AzimuthType
CREATE OR REPLACE VIEW azimuthtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.azimuth.id,
       'identifier', navaids_points.azimuth.identifier,
       'identifier_code_space', navaids_points.azimuth.identifier_code_space,
       'xml_id', navaids_points.azimuth.xml_id
    ) AS azimuthtype
FROM


-- AzimuthTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.azimuth.id = master_join.source_id
LEFT JOIN navaids_points.azimuth
ON master_join.target_id = AzimuthTimeSlicePropertyType.id
;

CallsignDetailPropertyType
CREATE OR REPLACE VIEW callsigndetailpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.callsigndetail_pt.id
    ) AS callsigndetailpropertytype
FROM

-- CallsignDetailType
LEFT JOIN service.callsigndetail_pt
ON service.callsigndetail_pt.callsigndetail_id = CallsignDetailType.id

;

CallsignDetailType
CREATE OR REPLACE VIEW callsigndetailtype_view AS
SELECT
    jsonb_build_object(
       'callsign_value', service.callsigndetail.callsign_value,
       'callsign_nilreason', service.callsigndetail.callsign_nilreason,
       'language_value', service.callsigndetail.language_value,
       'language_nilreason', service.callsigndetail.language_nilreason,
       'id', service.callsigndetail.id,
       'identifier', service.callsigndetail.identifier,
       'identifier_code_space', service.callsigndetail.identifier_code_space,
       'xml_id', service.callsigndetail.xml_id
    ) AS callsigndetailtype
FROM

-- AbstractExtensionType
LEFT JOIN service.callsigndetail
ON service.callsigndetail.abstractcallsigndetailextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.master_join
ON service.callsigndetail.id = master_join.source_id
LEFT JOIN service.callsigndetail
ON master_join.target_id = NotePropertyType.id
;

ChangeOverPointPropertyType
CREATE OR REPLACE VIEW changeoverpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.changeoverpoint_pt.id,
       'nilReason', routes.changeoverpoint_pt.nilReason
    ) AS changeoverpointpropertytype
FROM


;

ChangeOverPointTimeSlicePropertyType
CREATE OR REPLACE VIEW changeoverpointtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.changeoverpoint_tsp.id
    ) AS changeoverpointtimeslicepropertytype
FROM

-- ChangeOverPointTimeSliceType
LEFT JOIN routes.changeoverpoint_tsp
ON routes.changeoverpoint_tsp.changeoverpointtimeslice_id = ChangeOverPointTimeSliceType.id

;

ChangeOverPointTimeSliceType
CREATE OR REPLACE VIEW changeoverpointtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'distance_value', routes.changeoverpoint_ts.distance_value,
       'distance_uom', routes.changeoverpoint_ts.distance_uom,
       'distance_nilreason', routes.changeoverpoint_ts.distance_nilreason,
       'id', routes.changeoverpoint_ts.id,
       'xml_id', routes.changeoverpoint_ts.xml_id,
       'interpretation', routes.changeoverpoint_ts.interpretation,
       'sequence_number', routes.changeoverpoint_ts.sequence_number,
       'correction_number', routes.changeoverpoint_ts.correction_number,
       'valid_time_begin', routes.changeoverpoint_ts.valid_time_begin,
       'valid_time_end', routes.changeoverpoint_ts.valid_time_end,
       'feature_lifetime_begin', routes.changeoverpoint_ts.feature_lifetime_begin,
       'feature_lifetime_end', routes.changeoverpoint_ts.feature_lifetime_end
    ) AS changeoverpointtimeslicetype
FROM

-- DesignatedPointPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_position_id = PointPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.applicablerouteportion_id = RoutePortionPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.abstractchangeoverpointextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.changeoverpoint_ts.id = master_join.source_id
LEFT JOIN routes.changeoverpoint_ts
ON master_join.target_id = NotePropertyType.id
;

ChangeOverPointType
CREATE OR REPLACE VIEW changeoverpointtype_view AS
SELECT
    jsonb_build_object(
       'id', routes.changeoverpoint.id,
       'identifier', routes.changeoverpoint.identifier,
       'identifier_code_space', routes.changeoverpoint.identifier_code_space,
       'xml_id', routes.changeoverpoint.xml_id
    ) AS changeoverpointtype
FROM


-- ChangeOverPointTimeSlicePropertyType
LEFT JOIN routes.master_join
ON routes.changeoverpoint.id = master_join.source_id
LEFT JOIN routes.changeoverpoint
ON master_join.target_id = ChangeOverPointTimeSlicePropertyType.id
;

CheckpointINSPropertyType
CREATE OR REPLACE VIEW checkpointinspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointins_pt.id,
       'nilReason', navaids_points.checkpointins_pt.nilReason
    ) AS checkpointinspropertytype
FROM


;

CheckpointINSTimeSlicePropertyType
CREATE OR REPLACE VIEW checkpointinstimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointins_tsp.id
    ) AS checkpointinstimeslicepropertytype
FROM

-- CheckpointINSTimeSliceType
LEFT JOIN navaids_points.checkpointins_tsp
ON navaids_points.checkpointins_tsp.checkpointinstimeslice_id = CheckpointINSTimeSliceType.id

;

CheckpointINSTimeSliceType
CREATE OR REPLACE VIEW checkpointinstimeslicetype_view AS
SELECT
    jsonb_build_object(
       'category_value', navaids_points.checkpointins_ts.category_value,
       'category_nilreason', navaids_points.checkpointins_ts.category_nilreason,
       'upperlimitreference_value', navaids_points.checkpointins_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', navaids_points.checkpointins_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', navaids_points.checkpointins_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', navaids_points.checkpointins_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', navaids_points.checkpointins_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', navaids_points.checkpointins_ts.altitudeinterpretation_nilreason,
       'angle_value', navaids_points.checkpointins_ts.angle_value,
       'angle_nilreason', navaids_points.checkpointins_ts.angle_nilreason,
       'upperlimit_value', navaids_points.checkpointins_ts.upperlimit_value,
       'upperlimit_uom', navaids_points.checkpointins_ts.upperlimit_uom,
       'upperlimit_nilreason', navaids_points.checkpointins_ts.upperlimit_nilreason,
       'lowerlimit_value', navaids_points.checkpointins_ts.lowerlimit_value,
       'lowerlimit_uom', navaids_points.checkpointins_ts.lowerlimit_uom,
       'lowerlimit_nilreason', navaids_points.checkpointins_ts.lowerlimit_nilreason,
       'distance_value', navaids_points.checkpointins_ts.distance_value,
       'distance_uom', navaids_points.checkpointins_ts.distance_uom,
       'distance_nilreason', navaids_points.checkpointins_ts.distance_nilreason,
       'id', navaids_points.checkpointins_ts.id,
       'xml_id', navaids_points.checkpointins_ts.xml_id,
       'interpretation', navaids_points.checkpointins_ts.interpretation,
       'sequence_number', navaids_points.checkpointins_ts.sequence_number,
       'correction_number', navaids_points.checkpointins_ts.correction_number,
       'valid_time_begin', navaids_points.checkpointins_ts.valid_time_begin,
       'valid_time_end', navaids_points.checkpointins_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.checkpointins_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.checkpointins_ts.feature_lifetime_end
    ) AS checkpointinstimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.checkpointins_ts
ON navaids_points.checkpointins_ts.position_id = ElevatedPointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.checkpointins_ts
ON navaids_points.checkpointins_ts.airportheliport_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.checkpointins_ts
ON navaids_points.checkpointins_ts.abstractcheckpointinsextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.checkpointins_ts
ON navaids_points.checkpointins_ts.abstractnavigationsystemcheckpointextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.checkpointins_ts.id = master_join.source_id
LEFT JOIN navaids_points.checkpointins_ts
ON master_join.target_id = NotePropertyType.id
;

CheckpointINSType
CREATE OR REPLACE VIEW checkpointinstype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointins.id,
       'identifier', navaids_points.checkpointins.identifier,
       'identifier_code_space', navaids_points.checkpointins.identifier_code_space,
       'xml_id', navaids_points.checkpointins.xml_id
    ) AS checkpointinstype
FROM


-- CheckpointINSTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.checkpointins.id = master_join.source_id
LEFT JOIN navaids_points.checkpointins
ON master_join.target_id = CheckpointINSTimeSlicePropertyType.id
;

CheckpointVORPropertyType
CREATE OR REPLACE VIEW checkpointvorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointvor_pt.id,
       'nilReason', navaids_points.checkpointvor_pt.nilReason
    ) AS checkpointvorpropertytype
FROM


;

CheckpointVORTimeSlicePropertyType
CREATE OR REPLACE VIEW checkpointvortimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointvor_tsp.id
    ) AS checkpointvortimeslicepropertytype
FROM

-- CheckpointVORTimeSliceType
LEFT JOIN navaids_points.checkpointvor_tsp
ON navaids_points.checkpointvor_tsp.checkpointvortimeslice_id = CheckpointVORTimeSliceType.id

;

CheckpointVORTimeSliceType
CREATE OR REPLACE VIEW checkpointvortimeslicetype_view AS
SELECT
    jsonb_build_object(
       'category_value', navaids_points.checkpointvor_ts.category_value,
       'category_nilreason', navaids_points.checkpointvor_ts.category_nilreason,
       'upperlimitreference_value', navaids_points.checkpointvor_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', navaids_points.checkpointvor_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', navaids_points.checkpointvor_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', navaids_points.checkpointvor_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', navaids_points.checkpointvor_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', navaids_points.checkpointvor_ts.altitudeinterpretation_nilreason,
       'angle_value', navaids_points.checkpointvor_ts.angle_value,
       'angle_nilreason', navaids_points.checkpointvor_ts.angle_nilreason,
       'upperlimit_value', navaids_points.checkpointvor_ts.upperlimit_value,
       'upperlimit_uom', navaids_points.checkpointvor_ts.upperlimit_uom,
       'upperlimit_nilreason', navaids_points.checkpointvor_ts.upperlimit_nilreason,
       'lowerlimit_value', navaids_points.checkpointvor_ts.lowerlimit_value,
       'lowerlimit_uom', navaids_points.checkpointvor_ts.lowerlimit_uom,
       'lowerlimit_nilreason', navaids_points.checkpointvor_ts.lowerlimit_nilreason,
       'distance_value', navaids_points.checkpointvor_ts.distance_value,
       'distance_uom', navaids_points.checkpointvor_ts.distance_uom,
       'distance_nilreason', navaids_points.checkpointvor_ts.distance_nilreason,
       'id', navaids_points.checkpointvor_ts.id,
       'xml_id', navaids_points.checkpointvor_ts.xml_id,
       'interpretation', navaids_points.checkpointvor_ts.interpretation,
       'sequence_number', navaids_points.checkpointvor_ts.sequence_number,
       'correction_number', navaids_points.checkpointvor_ts.correction_number,
       'valid_time_begin', navaids_points.checkpointvor_ts.valid_time_begin,
       'valid_time_end', navaids_points.checkpointvor_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.checkpointvor_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.checkpointvor_ts.feature_lifetime_end
    ) AS checkpointvortimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.checkpointvor_ts
ON navaids_points.checkpointvor_ts.position_id = ElevatedPointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.checkpointvor_ts
ON navaids_points.checkpointvor_ts.airportheliport_id = AirportHeliportPropertyType.id
-- VORPropertyType
LEFT JOIN navaids_points.checkpointvor_ts
ON navaids_points.checkpointvor_ts.checkpointfacility_id = VORPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.checkpointvor_ts
ON navaids_points.checkpointvor_ts.abstractcheckpointvorextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.checkpointvor_ts
ON navaids_points.checkpointvor_ts.abstractnavigationsystemcheckpointextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.checkpointvor_ts.id = master_join.source_id
LEFT JOIN navaids_points.checkpointvor_ts
ON master_join.target_id = NotePropertyType.id
;

CheckpointVORType
CREATE OR REPLACE VIEW checkpointvortype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointvor.id,
       'identifier', navaids_points.checkpointvor.identifier,
       'identifier_code_space', navaids_points.checkpointvor.identifier_code_space,
       'xml_id', navaids_points.checkpointvor.xml_id
    ) AS checkpointvortype
FROM


-- CheckpointVORTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.checkpointvor.id = master_join.source_id
LEFT JOIN navaids_points.checkpointvor
ON master_join.target_id = CheckpointVORTimeSlicePropertyType.id
;

CircleSectorPropertyType
CREATE OR REPLACE VIEW circlesectorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.circlesector_pt.id
    ) AS circlesectorpropertytype
FROM

-- CircleSectorType
LEFT JOIN shared.circlesector_pt
ON shared.circlesector_pt.circlesector_id = CircleSectorType.id

;

CircleSectorType
CREATE OR REPLACE VIEW circlesectortype_view AS
SELECT
    jsonb_build_object(
       'arcdirection_value', shared.circlesector.arcdirection_value,
       'arcdirection_nilreason', shared.circlesector.arcdirection_nilreason,
       'fromangle_value', shared.circlesector.fromangle_value,
       'fromangle_nilreason', shared.circlesector.fromangle_nilreason,
       'toangle_value', shared.circlesector.toangle_value,
       'toangle_nilreason', shared.circlesector.toangle_nilreason,
       'angletype_value', shared.circlesector.angletype_value,
       'angletype_nilreason', shared.circlesector.angletype_nilreason,
       'angledirectionreference_value', shared.circlesector.angledirectionreference_value,
       'angledirectionreference_nilreason', shared.circlesector.angledirectionreference_nilreason,
       'upperlimitreference_value', shared.circlesector.upperlimitreference_value,
       'upperlimitreference_nilreason', shared.circlesector.upperlimitreference_nilreason,
       'lowerlimitreference_value', shared.circlesector.lowerlimitreference_value,
       'lowerlimitreference_nilreason', shared.circlesector.lowerlimitreference_nilreason,
       'innerdistance_value', shared.circlesector.innerdistance_value,
       'innerdistance_uom', shared.circlesector.innerdistance_uom,
       'innerdistance_nilreason', shared.circlesector.innerdistance_nilreason,
       'outerdistance_value', shared.circlesector.outerdistance_value,
       'outerdistance_uom', shared.circlesector.outerdistance_uom,
       'outerdistance_nilreason', shared.circlesector.outerdistance_nilreason,
       'upperlimit_value', shared.circlesector.upperlimit_value,
       'upperlimit_uom', shared.circlesector.upperlimit_uom,
       'upperlimit_nilreason', shared.circlesector.upperlimit_nilreason,
       'lowerlimit_value', shared.circlesector.lowerlimit_value,
       'lowerlimit_uom', shared.circlesector.lowerlimit_uom,
       'lowerlimit_nilreason', shared.circlesector.lowerlimit_nilreason,
       'id', shared.circlesector.id,
       'identifier', shared.circlesector.identifier,
       'identifier_code_space', shared.circlesector.identifier_code_space,
       'xml_id', shared.circlesector.xml_id
    ) AS circlesectortype
FROM

-- AbstractExtensionType
LEFT JOIN shared.circlesector
ON shared.circlesector.abstractcirclesectorextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.circlesector.id = master_join.source_id
LEFT JOIN shared.circlesector
ON master_join.target_id = NotePropertyType.id
;

CirclingAreaPropertyType
CREATE OR REPLACE VIEW circlingareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', public.circlingarea_pt.id,
       'nilReason', public.circlingarea_pt.nilReason
    ) AS circlingareapropertytype
FROM


;

CirclingAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW circlingareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', public.circlingarea_tsp.id
    ) AS circlingareatimeslicepropertytype
FROM

-- CirclingAreaTimeSliceType
LEFT JOIN public.circlingarea_tsp
ON public.circlingarea_tsp.circlingareatimeslice_id = CirclingAreaTimeSliceType.id

;

CirclingAreaTimeSliceType
CREATE OR REPLACE VIEW circlingareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'id', public.circlingarea_ts.id,
       'xml_id', public.circlingarea_ts.xml_id,
       'interpretation', public.circlingarea_ts.interpretation,
       'sequence_number', public.circlingarea_ts.sequence_number,
       'correction_number', public.circlingarea_ts.correction_number,
       'valid_time_begin', public.circlingarea_ts.valid_time_begin,
       'valid_time_end', public.circlingarea_ts.valid_time_end,
       'feature_lifetime_begin', public.circlingarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', public.circlingarea_ts.feature_lifetime_end
    ) AS circlingareatimeslicetype
FROM

-- SurfacePropertyType
LEFT JOIN public.circlingarea_ts
ON public.circlingarea_ts.extent_id = SurfacePropertyType.id
-- InstrumentApproachProcedurePropertyType
LEFT JOIN public.circlingarea_ts
ON public.circlingarea_ts.approach_id = InstrumentApproachProcedurePropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN public.circlingarea_ts
ON public.circlingarea_ts.aircraftcategory_id = AircraftCharacteristicPropertyType.id
-- AbstractExtensionType
LEFT JOIN public.circlingarea_ts
ON public.circlingarea_ts.abstractcirclingareaextension_id = AbstractExtensionType.id

-- ApproachConditionPropertyType
LEFT JOIN public.master_join
ON public.circlingarea_ts.id = master_join.source_id
LEFT JOIN public.circlingarea_ts
ON master_join.target_id = ApproachConditionPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN public.master_join
ON public.circlingarea_ts.id = master_join.source_id
LEFT JOIN public.circlingarea_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN public.master_join
ON public.circlingarea_ts.id = master_join.source_id
LEFT JOIN public.circlingarea_ts
ON master_join.target_id = NotePropertyType.id
;

CirclingAreaType
CREATE OR REPLACE VIEW circlingareatype_view AS
SELECT
    jsonb_build_object(
       'id', public.circlingarea.id,
       'identifier', public.circlingarea.identifier,
       'identifier_code_space', public.circlingarea.identifier_code_space,
       'xml_id', public.circlingarea.xml_id
    ) AS circlingareatype
FROM


-- CirclingAreaTimeSlicePropertyType
LEFT JOIN public.master_join
ON public.circlingarea.id = master_join.source_id
LEFT JOIN public.circlingarea
ON master_join.target_id = CirclingAreaTimeSlicePropertyType.id
;

CirclingRestrictionPropertyType
CREATE OR REPLACE VIEW circlingrestrictionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.circlingrestriction_pt.id
    ) AS circlingrestrictionpropertytype
FROM

-- CirclingRestrictionType
LEFT JOIN procedure.circlingrestriction_pt
ON procedure.circlingrestriction_pt.circlingrestriction_id = CirclingRestrictionType.id

;

CirclingRestrictionType
CREATE OR REPLACE VIEW circlingrestrictiontype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.circlingrestriction.id,
       'identifier', procedure.circlingrestriction.identifier,
       'identifier_code_space', procedure.circlingrestriction.identifier_code_space,
       'xml_id', procedure.circlingrestriction.xml_id
    ) AS circlingrestrictiontype
FROM

-- CircleSectorPropertyType
LEFT JOIN procedure.circlingrestriction
ON procedure.circlingrestriction.sectordescription_id = CircleSectorPropertyType.id
-- SurfacePropertyType
LEFT JOIN procedure.circlingrestriction
ON procedure.circlingrestriction.restrictionarea_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.circlingrestriction
ON procedure.circlingrestriction.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.circlingrestriction
ON procedure.circlingrestriction.abstractcirclingrestrictionextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN procedure.master_join
ON procedure.circlingrestriction.id = master_join.source_id
LEFT JOIN procedure.circlingrestriction
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.circlingrestriction.id = master_join.source_id
LEFT JOIN procedure.circlingrestriction
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN procedure.master_join
ON procedure.circlingrestriction.id = master_join.source_id
LEFT JOIN procedure.circlingrestriction
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

CityPropertyType
CREATE OR REPLACE VIEW citypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.city_pt.id
    ) AS citypropertytype
FROM

-- CityType
LEFT JOIN airport_heliport.city_pt
ON airport_heliport.city_pt.city_id = CityType.id

;

CityType
CREATE OR REPLACE VIEW citytype_view AS
SELECT
    jsonb_build_object(
       'name_value', airport_heliport.city.name_value,
       'name_nilreason', airport_heliport.city.name_nilreason,
       'id', airport_heliport.city.id,
       'identifier', airport_heliport.city.identifier,
       'identifier_code_space', airport_heliport.city.identifier_code_space,
       'xml_id', airport_heliport.city.xml_id
    ) AS citytype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.city
ON airport_heliport.city.abstractcityextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.city.id = master_join.source_id
LEFT JOIN airport_heliport.city
ON master_join.target_id = NotePropertyType.id
;

ConditionCombinationPropertyType
CREATE OR REPLACE VIEW conditioncombinationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.conditioncombination_pt.id
    ) AS conditioncombinationpropertytype
FROM

-- ConditionCombinationType
LEFT JOIN airport_heliport.conditioncombination_pt
ON airport_heliport.conditioncombination_pt.conditioncombination_id = ConditionCombinationType.id

;

ConditionCombinationType
CREATE OR REPLACE VIEW conditioncombinationtype_view AS
SELECT
    jsonb_build_object(
       'logicaloperator_value', airport_heliport.conditioncombination.logicaloperator_value,
       'logicaloperator_nilreason', airport_heliport.conditioncombination.logicaloperator_nilreason,
       'id', airport_heliport.conditioncombination.id,
       'identifier', airport_heliport.conditioncombination.identifier,
       'identifier_code_space', airport_heliport.conditioncombination.identifier_code_space,
       'xml_id', airport_heliport.conditioncombination.xml_id
    ) AS conditioncombinationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.conditioncombination
ON airport_heliport.conditioncombination.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.conditioncombination
ON airport_heliport.conditioncombination.abstractconditioncombinationextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.conditioncombination.id = master_join.source_id
LEFT JOIN airport_heliport.conditioncombination
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.conditioncombination.id = master_join.source_id
LEFT JOIN airport_heliport.conditioncombination
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.conditioncombination.id = master_join.source_id
LEFT JOIN airport_heliport.conditioncombination
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- MeteorologyPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.conditioncombination.id = master_join.source_id
LEFT JOIN airport_heliport.conditioncombination
ON master_join.target_id = MeteorologyPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.conditioncombination.id = master_join.source_id
LEFT JOIN airport_heliport.conditioncombination
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- FlightCharacteristicPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.conditioncombination.id = master_join.source_id
LEFT JOIN airport_heliport.conditioncombination
ON master_join.target_id = FlightCharacteristicPropertyType.id
-- ConditionCombinationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.conditioncombination.id = master_join.source_id
LEFT JOIN airport_heliport.conditioncombination
ON master_join.target_id = ConditionCombinationPropertyType.id
;

ContactInformationPropertyType
CREATE OR REPLACE VIEW contactinformationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.contactinformation_pt.id
    ) AS contactinformationpropertytype
FROM

-- ContactInformationType
LEFT JOIN shared.contactinformation_pt
ON shared.contactinformation_pt.contactinformation_id = ContactInformationType.id

;

ContactInformationType
CREATE OR REPLACE VIEW contactinformationtype_view AS
SELECT
    jsonb_build_object(
       'name_value', shared.contactinformation.name_value,
       'name_nilreason', shared.contactinformation.name_nilreason,
       'title_value', shared.contactinformation.title_value,
       'title_nilreason', shared.contactinformation.title_nilreason,
       'id', shared.contactinformation.id,
       'identifier', shared.contactinformation.identifier,
       'identifier_code_space', shared.contactinformation.identifier_code_space,
       'xml_id', shared.contactinformation.xml_id
    ) AS contactinformationtype
FROM

-- AbstractExtensionType
LEFT JOIN shared.contactinformation
ON shared.contactinformation.abstractcontactinformationextension_id = AbstractExtensionType.id

-- PostalAddressPropertyType
LEFT JOIN shared.master_join
ON shared.contactinformation.id = master_join.source_id
LEFT JOIN shared.contactinformation
ON master_join.target_id = PostalAddressPropertyType.id
-- OnlineContactPropertyType
LEFT JOIN shared.master_join
ON shared.contactinformation.id = master_join.source_id
LEFT JOIN shared.contactinformation
ON master_join.target_id = OnlineContactPropertyType.id
-- TelephoneContactPropertyType
LEFT JOIN shared.master_join
ON shared.contactinformation.id = master_join.source_id
LEFT JOIN shared.contactinformation
ON master_join.target_id = TelephoneContactPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.contactinformation.id = master_join.source_id
LEFT JOIN shared.contactinformation
ON master_join.target_id = NotePropertyType.id
;

DeicingAreaMarkingPropertyType
CREATE OR REPLACE VIEW deicingareamarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingareamarking_pt.id,
       'nilReason', airport_heliport.deicingareamarking_pt.nilReason
    ) AS deicingareamarkingpropertytype
FROM


;

DeicingAreaMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW deicingareamarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingareamarking_tsp.id
    ) AS deicingareamarkingtimeslicepropertytype
FROM

-- DeicingAreaMarkingTimeSliceType
LEFT JOIN airport_heliport.deicingareamarking_tsp
ON airport_heliport.deicingareamarking_tsp.deicingareamarkingtimeslice_id = DeicingAreaMarkingTimeSliceType.id

;

DeicingAreaMarkingTimeSliceType
CREATE OR REPLACE VIEW deicingareamarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.deicingareamarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.deicingareamarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.deicingareamarking_ts.condition_value,
       'condition_nilreason', airport_heliport.deicingareamarking_ts.condition_nilreason,
       'id', airport_heliport.deicingareamarking_ts.id,
       'xml_id', airport_heliport.deicingareamarking_ts.xml_id,
       'interpretation', airport_heliport.deicingareamarking_ts.interpretation,
       'sequence_number', airport_heliport.deicingareamarking_ts.sequence_number,
       'correction_number', airport_heliport.deicingareamarking_ts.correction_number,
       'valid_time_begin', airport_heliport.deicingareamarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.deicingareamarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.deicingareamarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.deicingareamarking_ts.feature_lifetime_end
    ) AS deicingareamarkingtimeslicetype
FROM

-- DeicingAreaPropertyType
LEFT JOIN airport_heliport.deicingareamarking_ts
ON airport_heliport.deicingareamarking_ts.markeddeicingarea_id = DeicingAreaPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.deicingareamarking_ts
ON airport_heliport.deicingareamarking_ts.abstractdeicingareamarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.deicingareamarking_ts
ON airport_heliport.deicingareamarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.deicingareamarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.deicingareamarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.deicingareamarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.deicingareamarking_ts
ON master_join.target_id = NotePropertyType.id
;

DeicingAreaMarkingType
CREATE OR REPLACE VIEW deicingareamarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingareamarking.id,
       'identifier', airport_heliport.deicingareamarking.identifier,
       'identifier_code_space', airport_heliport.deicingareamarking.identifier_code_space,
       'xml_id', airport_heliport.deicingareamarking.xml_id
    ) AS deicingareamarkingtype
FROM


-- DeicingAreaMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.deicingareamarking.id = master_join.source_id
LEFT JOIN airport_heliport.deicingareamarking
ON master_join.target_id = DeicingAreaMarkingTimeSlicePropertyType.id
;

DeicingAreaPropertyType
CREATE OR REPLACE VIEW deicingareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingarea_pt.id,
       'nilReason', airport_heliport.deicingarea_pt.nilReason
    ) AS deicingareapropertytype
FROM


;

DeicingAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW deicingareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingarea_tsp.id
    ) AS deicingareatimeslicepropertytype
FROM

-- DeicingAreaTimeSliceType
LEFT JOIN airport_heliport.deicingarea_tsp
ON airport_heliport.deicingarea_tsp.deicingareatimeslice_id = DeicingAreaTimeSliceType.id

;

DeicingAreaTimeSliceType
CREATE OR REPLACE VIEW deicingareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingarea_ts.id,
       'xml_id', airport_heliport.deicingarea_ts.xml_id,
       'interpretation', airport_heliport.deicingarea_ts.interpretation,
       'sequence_number', airport_heliport.deicingarea_ts.sequence_number,
       'correction_number', airport_heliport.deicingarea_ts.correction_number,
       'valid_time_begin', airport_heliport.deicingarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.deicingarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.deicingarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.deicingarea_ts.feature_lifetime_end
    ) AS deicingareatimeslicetype
FROM

-- ApronPropertyType
LEFT JOIN airport_heliport.deicingarea_ts
ON airport_heliport.deicingarea_ts.associatedapron_id = ApronPropertyType.id
-- TaxiwayPropertyType
LEFT JOIN airport_heliport.deicingarea_ts
ON airport_heliport.deicingarea_ts.taxiwaylocation_id = TaxiwayPropertyType.id
-- AircraftStandPropertyType
LEFT JOIN airport_heliport.deicingarea_ts
ON airport_heliport.deicingarea_ts.standlocation_id = AircraftStandPropertyType.id
-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.deicingarea_ts
ON airport_heliport.deicingarea_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.deicingarea_ts
ON airport_heliport.deicingarea_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.deicingarea_ts
ON airport_heliport.deicingarea_ts.abstractdeicingareaextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.deicingarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.deicingarea_ts
ON master_join.target_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.deicingarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.deicingarea_ts
ON master_join.target_id = ApronAreaAvailabilityPropertyType.id
;

DeicingAreaType
CREATE OR REPLACE VIEW deicingareatype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingarea.id,
       'identifier', airport_heliport.deicingarea.identifier,
       'identifier_code_space', airport_heliport.deicingarea.identifier_code_space,
       'xml_id', airport_heliport.deicingarea.xml_id
    ) AS deicingareatype
FROM


-- DeicingAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.deicingarea.id = master_join.source_id
LEFT JOIN airport_heliport.deicingarea
ON master_join.target_id = DeicingAreaTimeSlicePropertyType.id
;

DepartureArrivalConditionPropertyType
CREATE OR REPLACE VIEW departurearrivalconditionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.departurearrivalcondition_pt.id
    ) AS departurearrivalconditionpropertytype
FROM

-- DepartureArrivalConditionType
LEFT JOIN procedure.departurearrivalcondition_pt
ON procedure.departurearrivalcondition_pt.departurearrivalcondition_id = DepartureArrivalConditionType.id

;

DepartureArrivalConditionType
CREATE OR REPLACE VIEW departurearrivalconditiontype_view AS
SELECT
    jsonb_build_object(
       'minimumcrossingatendreference_value', procedure.departurearrivalcondition.minimumcrossingatendreference_value,
       'minimumcrossingatendreference_nilreason', procedure.departurearrivalcondition.minimumcrossingatendreference_nilreason,
       'maximumcrossingatendreference_value', procedure.departurearrivalcondition.maximumcrossingatendreference_value,
       'maximumcrossingatendreference_nilreason', procedure.departurearrivalcondition.maximumcrossingatendreference_nilreason,
       'minimumenroutealtitude_value', procedure.departurearrivalcondition.minimumenroutealtitude_value,
       'minimumenroutealtitude_uom', procedure.departurearrivalcondition.minimumenroutealtitude_uom,
       'minimumenroutealtitude_nilreason', procedure.departurearrivalcondition.minimumenroutealtitude_nilreason,
       'minimumcrossingatend_value', procedure.departurearrivalcondition.minimumcrossingatend_value,
       'minimumcrossingatend_uom', procedure.departurearrivalcondition.minimumcrossingatend_uom,
       'minimumcrossingatend_nilreason', procedure.departurearrivalcondition.minimumcrossingatend_nilreason,
       'maximumcrossingatend_value', procedure.departurearrivalcondition.maximumcrossingatend_value,
       'maximumcrossingatend_uom', procedure.departurearrivalcondition.maximumcrossingatend_uom,
       'maximumcrossingatend_nilreason', procedure.departurearrivalcondition.maximumcrossingatend_nilreason,
       'id', procedure.departurearrivalcondition.id,
       'identifier', procedure.departurearrivalcondition.identifier,
       'identifier_code_space', procedure.departurearrivalcondition.identifier_code_space,
       'xml_id', procedure.departurearrivalcondition.xml_id
    ) AS departurearrivalconditiontype
FROM

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.departurearrivalcondition
ON procedure.departurearrivalcondition.engine_id = AircraftCharacteristicPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.departurearrivalcondition
ON procedure.departurearrivalcondition.abstractdeparturearrivalconditionextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.departurearrivalcondition.id = master_join.source_id
LEFT JOIN procedure.departurearrivalcondition
ON master_join.target_id = NotePropertyType.id
;

DepartureLegPropertyType
CREATE OR REPLACE VIEW departurelegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.departureleg_pt.id,
       'nilReason', procedure.departureleg_pt.nilReason
    ) AS departurelegpropertytype
FROM


;

DepartureLegTimeSlicePropertyType
CREATE OR REPLACE VIEW departurelegtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.departureleg_tsp.id
    ) AS departurelegtimeslicepropertytype
FROM

-- DepartureLegTimeSliceType
LEFT JOIN procedure.departureleg_tsp
ON procedure.departureleg_tsp.departurelegtimeslice_id = DepartureLegTimeSliceType.id

;

DepartureLegTimeSliceType
CREATE OR REPLACE VIEW departurelegtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'endconditiondesignator_value', procedure.departureleg_ts.endconditiondesignator_value,
       'endconditiondesignator_nilreason', procedure.departureleg_ts.endconditiondesignator_nilreason,
       'legpath_value', procedure.departureleg_ts.legpath_value,
       'legpath_nilreason', procedure.departureleg_ts.legpath_nilreason,
       'legtypearinc_value', procedure.departureleg_ts.legtypearinc_value,
       'legtypearinc_nilreason', procedure.departureleg_ts.legtypearinc_nilreason,
       'course_value', procedure.departureleg_ts.course_value,
       'course_nilreason', procedure.departureleg_ts.course_nilreason,
       'coursetype_value', procedure.departureleg_ts.coursetype_value,
       'coursetype_nilreason', procedure.departureleg_ts.coursetype_nilreason,
       'coursedirection_value', procedure.departureleg_ts.coursedirection_value,
       'coursedirection_nilreason', procedure.departureleg_ts.coursedirection_nilreason,
       'turndirection_value', procedure.departureleg_ts.turndirection_value,
       'turndirection_nilreason', procedure.departureleg_ts.turndirection_nilreason,
       'speedreference_value', procedure.departureleg_ts.speedreference_value,
       'speedreference_nilreason', procedure.departureleg_ts.speedreference_nilreason,
       'speedinterpretation_value', procedure.departureleg_ts.speedinterpretation_value,
       'speedinterpretation_nilreason', procedure.departureleg_ts.speedinterpretation_nilreason,
       'bankangle_value', procedure.departureleg_ts.bankangle_value,
       'bankangle_nilreason', procedure.departureleg_ts.bankangle_nilreason,
       'procedureturnrequired_value', procedure.departureleg_ts.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.departureleg_ts.procedureturnrequired_nilreason,
       'upperlimitreference_value', procedure.departureleg_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', procedure.departureleg_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', procedure.departureleg_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', procedure.departureleg_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', procedure.departureleg_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', procedure.departureleg_ts.altitudeinterpretation_nilreason,
       'altitudeoverridereference_value', procedure.departureleg_ts.altitudeoverridereference_value,
       'altitudeoverridereference_nilreason', procedure.departureleg_ts.altitudeoverridereference_nilreason,
       'verticalangle_value', procedure.departureleg_ts.verticalangle_value,
       'verticalangle_nilreason', procedure.departureleg_ts.verticalangle_nilreason,
       'requirednavigationperformance_value', procedure.departureleg_ts.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', procedure.departureleg_ts.requirednavigationperformance_nilreason,
       'speedlimit_value', procedure.departureleg_ts.speedlimit_value,
       'speedlimit_uom', procedure.departureleg_ts.speedlimit_uom,
       'speedlimit_nilreason', procedure.departureleg_ts.speedlimit_nilreason,
       'length_value', procedure.departureleg_ts.length_value,
       'length_uom', procedure.departureleg_ts.length_uom,
       'length_nilreason', procedure.departureleg_ts.length_nilreason,
       'duration_value', procedure.departureleg_ts.duration_value,
       'duration_uom', procedure.departureleg_ts.duration_uom,
       'duration_nilreason', procedure.departureleg_ts.duration_nilreason,
       'upperlimitaltitude_value', procedure.departureleg_ts.upperlimitaltitude_value,
       'upperlimitaltitude_uom', procedure.departureleg_ts.upperlimitaltitude_uom,
       'upperlimitaltitude_nilreason', procedure.departureleg_ts.upperlimitaltitude_nilreason,
       'lowerlimitaltitude_value', procedure.departureleg_ts.lowerlimitaltitude_value,
       'lowerlimitaltitude_uom', procedure.departureleg_ts.lowerlimitaltitude_uom,
       'lowerlimitaltitude_nilreason', procedure.departureleg_ts.lowerlimitaltitude_nilreason,
       'altitudeoverrideatc_value', procedure.departureleg_ts.altitudeoverrideatc_value,
       'altitudeoverrideatc_uom', procedure.departureleg_ts.altitudeoverrideatc_uom,
       'altitudeoverrideatc_nilreason', procedure.departureleg_ts.altitudeoverrideatc_nilreason,
       'minimumobstacleclearancealtitude_value', procedure.departureleg_ts.minimumobstacleclearancealtitude_value,
       'minimumobstacleclearancealtitude_uom', procedure.departureleg_ts.minimumobstacleclearancealtitude_uom,
       'minimumobstacleclearancealtitude_nilreason', procedure.departureleg_ts.minimumobstacleclearancealtitude_nilreason,
       'id', procedure.departureleg_ts.id,
       'xml_id', procedure.departureleg_ts.xml_id,
       'interpretation', procedure.departureleg_ts.interpretation,
       'sequence_number', procedure.departureleg_ts.sequence_number,
       'correction_number', procedure.departureleg_ts.correction_number,
       'valid_time_begin', procedure.departureleg_ts.valid_time_begin,
       'valid_time_end', procedure.departureleg_ts.valid_time_end,
       'feature_lifetime_begin', procedure.departureleg_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.departureleg_ts.feature_lifetime_end
    ) AS departurelegtimeslicetype
FROM

-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.startpoint_id = TerminalSegmentPointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.endpoint_id = TerminalSegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.trajectory_id = CurvePropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.arccentre_id = TerminalSegmentPointPropertyType.id
-- AngleIndicationPropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.angle_id = AngleIndicationPropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.distance_id = DistanceIndicationPropertyType.id
-- HoldingUsePropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.holding_id = HoldingUsePropertyType.id
-- StandardInstrumentDeparturePropertyType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.departure_id = StandardInstrumentDeparturePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.abstractdeparturelegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.departureleg_ts
ON procedure.departureleg_ts.abstractsegmentlegextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.departureleg_ts.id = master_join.source_id
LEFT JOIN procedure.departureleg_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.departureleg_ts.id = master_join.source_id
LEFT JOIN procedure.departureleg_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.departureleg_ts.id = master_join.source_id
LEFT JOIN procedure.departureleg_ts
ON master_join.target_id = NotePropertyType.id
-- DepartureArrivalConditionPropertyType
LEFT JOIN procedure.master_join
ON procedure.departureleg_ts.id = master_join.source_id
LEFT JOIN procedure.departureleg_ts
ON master_join.target_id = DepartureArrivalConditionPropertyType.id
;

DepartureLegType
CREATE OR REPLACE VIEW departurelegtype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.departureleg.id,
       'identifier', procedure.departureleg.identifier,
       'identifier_code_space', procedure.departureleg.identifier_code_space,
       'xml_id', procedure.departureleg.xml_id
    ) AS departurelegtype
FROM


-- DepartureLegTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.departureleg.id = master_join.source_id
LEFT JOIN procedure.departureleg
ON master_join.target_id = DepartureLegTimeSlicePropertyType.id
;

DesignatedPointPropertyType
CREATE OR REPLACE VIEW designatedpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.designatedpoint_pt.id,
       'nilReason', navaids_points.designatedpoint_pt.nilReason
    ) AS designatedpointpropertytype
FROM


;

DesignatedPointTimeSlicePropertyType
CREATE OR REPLACE VIEW designatedpointtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.designatedpoint_tsp.id
    ) AS designatedpointtimeslicepropertytype
FROM

-- DesignatedPointTimeSliceType
LEFT JOIN navaids_points.designatedpoint_tsp
ON navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = DesignatedPointTimeSliceType.id

;

DesignatedPointTimeSliceType
CREATE OR REPLACE VIEW designatedpointtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.designatedpoint_ts.designator_value,
       'designator_nilreason', navaids_points.designatedpoint_ts.designator_nilreason,
       'type_value', navaids_points.designatedpoint_ts.type_value,
       'type_nilreason', navaids_points.designatedpoint_ts.type_nilreason,
       'name_value', navaids_points.designatedpoint_ts.name_value,
       'name_nilreason', navaids_points.designatedpoint_ts.name_nilreason,
       'id', navaids_points.designatedpoint_ts.id,
       'xml_id', navaids_points.designatedpoint_ts.xml_id,
       'interpretation', navaids_points.designatedpoint_ts.interpretation,
       'sequence_number', navaids_points.designatedpoint_ts.sequence_number,
       'correction_number', navaids_points.designatedpoint_ts.correction_number,
       'valid_time_begin', navaids_points.designatedpoint_ts.valid_time_begin,
       'valid_time_end', navaids_points.designatedpoint_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.designatedpoint_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.designatedpoint_ts.feature_lifetime_end
    ) AS designatedpointtimeslicetype
FROM

-- PointPropertyType
LEFT JOIN navaids_points.designatedpoint_ts
ON navaids_points.designatedpoint_ts.location_id = PointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.designatedpoint_ts
ON navaids_points.designatedpoint_ts.aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.designatedpoint_ts
ON navaids_points.designatedpoint_ts.airportheliport_id = AirportHeliportPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.designatedpoint_ts
ON navaids_points.designatedpoint_ts.runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.designatedpoint_ts
ON navaids_points.designatedpoint_ts.abstractdesignatedpointextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.designatedpoint_ts.id = master_join.source_id
LEFT JOIN navaids_points.designatedpoint_ts
ON master_join.target_id = NotePropertyType.id
;

DesignatedPointType
CREATE OR REPLACE VIEW designatedpointtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.designatedpoint.id,
       'identifier', navaids_points.designatedpoint.identifier,
       'identifier_code_space', navaids_points.designatedpoint.identifier_code_space,
       'xml_id', navaids_points.designatedpoint.xml_id
    ) AS designatedpointtype
FROM


-- DesignatedPointTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.designatedpoint.id = master_join.source_id
LEFT JOIN navaids_points.designatedpoint
ON master_join.target_id = DesignatedPointTimeSlicePropertyType.id
;

DirectFlightClassPropertyType
CREATE OR REPLACE VIEW directflightclasspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.directflightclass_pt.id
    ) AS directflightclasspropertytype
FROM

-- DirectFlightClassType
LEFT JOIN routes.directflightclass_pt
ON routes.directflightclass_pt.directflightclass_id = DirectFlightClassType.id

;

DirectFlightClassType
CREATE OR REPLACE VIEW directflightclasstype_view AS
SELECT
    jsonb_build_object(
       'exceedlength_value', routes.directflightclass.exceedlength_value,
       'exceedlength_uom', routes.directflightclass.exceedlength_uom,
       'exceedlength_nilreason', routes.directflightclass.exceedlength_nilreason,
       'id', routes.directflightclass.id,
       'identifier', routes.directflightclass.identifier,
       'identifier_code_space', routes.directflightclass.identifier_code_space,
       'xml_id', routes.directflightclass.xml_id
    ) AS directflightclasstype
FROM

-- AbstractExtensionType
LEFT JOIN routes.directflightclass
ON routes.directflightclass.abstractdirectflightextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.directflightclass
ON routes.directflightclass.abstractdirectflightclassextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.directflightclass.id = master_join.source_id
LEFT JOIN routes.directflightclass
ON master_join.target_id = NotePropertyType.id
;

DirectFlightPropertyType
CREATE OR REPLACE VIEW directflightpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.directflight_pt.id
    ) AS directflightpropertytype
FROM


;

DirectFlightSegmentPropertyType
CREATE OR REPLACE VIEW directflightsegmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.directflightsegment_pt.id
    ) AS directflightsegmentpropertytype
FROM

-- DirectFlightSegmentType
LEFT JOIN routes.directflightsegment_pt
ON routes.directflightsegment_pt.directflightsegment_id = DirectFlightSegmentType.id

;

DirectFlightSegmentType
CREATE OR REPLACE VIEW directflightsegmenttype_view AS
SELECT
    jsonb_build_object(
       'id', routes.directflightsegment.id,
       'identifier', routes.directflightsegment.identifier,
       'identifier_code_space', routes.directflightsegment.identifier_code_space,
       'xml_id', routes.directflightsegment.xml_id
    ) AS directflightsegmenttype
FROM

-- DesignatedPointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_position_id = PointPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_position_id = PointPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.abstractdirectflightextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.abstractdirectflightsegmentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.directflightsegment.id = master_join.source_id
LEFT JOIN routes.directflightsegment
ON master_join.target_id = NotePropertyType.id
;

DirectionFinderPropertyType
CREATE OR REPLACE VIEW directionfinderpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.directionfinder_pt.id,
       'nilReason', navaids_points.directionfinder_pt.nilReason
    ) AS directionfinderpropertytype
FROM


;

DirectionFinderTimeSlicePropertyType
CREATE OR REPLACE VIEW directionfindertimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.directionfinder_tsp.id
    ) AS directionfindertimeslicepropertytype
FROM

-- DirectionFinderTimeSliceType
LEFT JOIN navaids_points.directionfinder_tsp
ON navaids_points.directionfinder_tsp.directionfindertimeslice_id = DirectionFinderTimeSliceType.id

;

DirectionFinderTimeSliceType
CREATE OR REPLACE VIEW directionfindertimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.directionfinder_ts.designator_value,
       'designator_nilreason', navaids_points.directionfinder_ts.designator_nilreason,
       'name_value', navaids_points.directionfinder_ts.name_value,
       'name_nilreason', navaids_points.directionfinder_ts.name_nilreason,
       'emissionclass_value', navaids_points.directionfinder_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.directionfinder_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.directionfinder_ts.mobile_value,
       'mobile_nilreason', navaids_points.directionfinder_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.directionfinder_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.directionfinder_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.directionfinder_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.directionfinder_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.directionfinder_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.directionfinder_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.directionfinder_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.directionfinder_ts.flightchecked_nilreason,
       'doppler_value', navaids_points.directionfinder_ts.doppler_value,
       'doppler_nilreason', navaids_points.directionfinder_ts.doppler_nilreason,
       'id', navaids_points.directionfinder_ts.id,
       'xml_id', navaids_points.directionfinder_ts.xml_id,
       'interpretation', navaids_points.directionfinder_ts.interpretation,
       'sequence_number', navaids_points.directionfinder_ts.sequence_number,
       'correction_number', navaids_points.directionfinder_ts.correction_number,
       'valid_time_begin', navaids_points.directionfinder_ts.valid_time_begin,
       'valid_time_end', navaids_points.directionfinder_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.directionfinder_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.directionfinder_ts.feature_lifetime_end
    ) AS directionfindertimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.directionfinder_ts
ON navaids_points.directionfinder_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.directionfinder_ts
ON navaids_points.directionfinder_ts.abstractdirectionfinderextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.directionfinder_ts
ON navaids_points.directionfinder_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.directionfinder_ts.id = master_join.source_id
LEFT JOIN navaids_points.directionfinder_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.directionfinder_ts.id = master_join.source_id
LEFT JOIN navaids_points.directionfinder_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.directionfinder_ts.id = master_join.source_id
LEFT JOIN navaids_points.directionfinder_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.directionfinder_ts.id = master_join.source_id
LEFT JOIN navaids_points.directionfinder_ts
ON master_join.target_id = NotePropertyType.id
-- InformationServicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.directionfinder_ts.id = master_join.source_id
LEFT JOIN navaids_points.directionfinder_ts
ON master_join.target_id = InformationServicePropertyType.id
;

DirectionFinderType
CREATE OR REPLACE VIEW directionfindertype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.directionfinder.id,
       'identifier', navaids_points.directionfinder.identifier,
       'identifier_code_space', navaids_points.directionfinder.identifier_code_space,
       'xml_id', navaids_points.directionfinder.xml_id
    ) AS directionfindertype
FROM


-- DirectionFinderTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.directionfinder.id = master_join.source_id
LEFT JOIN navaids_points.directionfinder
ON master_join.target_id = DirectionFinderTimeSlicePropertyType.id
;

DistanceIndicationPropertyType
CREATE OR REPLACE VIEW distanceindicationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.distanceindication_pt.id,
       'nilReason', navaids_points.distanceindication_pt.nilReason
    ) AS distanceindicationpropertytype
FROM


;

DistanceIndicationTimeSlicePropertyType
CREATE OR REPLACE VIEW distanceindicationtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.distanceindication_tsp.id
    ) AS distanceindicationtimeslicepropertytype
FROM

-- DistanceIndicationTimeSliceType
LEFT JOIN navaids_points.distanceindication_tsp
ON navaids_points.distanceindication_tsp.distanceindicationtimeslice_id = DistanceIndicationTimeSliceType.id

;

DistanceIndicationTimeSliceType
CREATE OR REPLACE VIEW distanceindicationtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', navaids_points.distanceindication_ts.type_value,
       'type_nilreason', navaids_points.distanceindication_ts.type_nilreason,
       'distance_value', navaids_points.distanceindication_ts.distance_value,
       'distance_uom', navaids_points.distanceindication_ts.distance_uom,
       'distance_nilreason', navaids_points.distanceindication_ts.distance_nilreason,
       'minimumreceptionaltitude_value', navaids_points.distanceindication_ts.minimumreceptionaltitude_value,
       'minimumreceptionaltitude_uom', navaids_points.distanceindication_ts.minimumreceptionaltitude_uom,
       'minimumreceptionaltitude_nilreason', navaids_points.distanceindication_ts.minimumreceptionaltitude_nilreason,
       'id', navaids_points.distanceindication_ts.id,
       'xml_id', navaids_points.distanceindication_ts.xml_id,
       'interpretation', navaids_points.distanceindication_ts.interpretation,
       'sequence_number', navaids_points.distanceindication_ts.sequence_number,
       'correction_number', navaids_points.distanceindication_ts.correction_number,
       'valid_time_begin', navaids_points.distanceindication_ts.valid_time_begin,
       'valid_time_end', navaids_points.distanceindication_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.distanceindication_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.distanceindication_ts.feature_lifetime_end
    ) AS distanceindicationtimeslicetype
FROM

-- DesignatedPointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.fix_id = DesignatedPointPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_position_id = PointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.abstractdistanceindicationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.distanceindication_ts.id = master_join.source_id
LEFT JOIN navaids_points.distanceindication_ts
ON master_join.target_id = NotePropertyType.id
;

DistanceIndicationType
CREATE OR REPLACE VIEW distanceindicationtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.distanceindication.id,
       'identifier', navaids_points.distanceindication.identifier,
       'identifier_code_space', navaids_points.distanceindication.identifier_code_space,
       'xml_id', navaids_points.distanceindication.xml_id
    ) AS distanceindicationtype
FROM


-- DistanceIndicationTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.distanceindication.id = master_join.source_id
LEFT JOIN navaids_points.distanceindication
ON master_join.target_id = DistanceIndicationTimeSlicePropertyType.id
;

DMEPropertyType
CREATE OR REPLACE VIEW dmepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.dme_pt.id,
       'nilReason', navaids_points.dme_pt.nilReason
    ) AS dmepropertytype
FROM


;

DMETimeSlicePropertyType
CREATE OR REPLACE VIEW dmetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.dme_tsp.id
    ) AS dmetimeslicepropertytype
FROM

-- DMETimeSliceType
LEFT JOIN navaids_points.dme_tsp
ON navaids_points.dme_tsp.dmetimeslice_id = DMETimeSliceType.id

;

DMETimeSliceType
CREATE OR REPLACE VIEW dmetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.dme_ts.designator_value,
       'designator_nilreason', navaids_points.dme_ts.designator_nilreason,
       'name_value', navaids_points.dme_ts.name_value,
       'name_nilreason', navaids_points.dme_ts.name_nilreason,
       'emissionclass_value', navaids_points.dme_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.dme_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.dme_ts.mobile_value,
       'mobile_nilreason', navaids_points.dme_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.dme_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.dme_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.dme_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.dme_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.dme_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.dme_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.dme_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.dme_ts.flightchecked_nilreason,
       'type_value', navaids_points.dme_ts.type_value,
       'type_nilreason', navaids_points.dme_ts.type_nilreason,
       'channel_value', navaids_points.dme_ts.channel_value,
       'channel_nilreason', navaids_points.dme_ts.channel_nilreason,
       'ghostfrequency_value', navaids_points.dme_ts.ghostfrequency_value,
       'ghostfrequency_uom', navaids_points.dme_ts.ghostfrequency_uom,
       'ghostfrequency_nilreason', navaids_points.dme_ts.ghostfrequency_nilreason,
       'displace_value', navaids_points.dme_ts.displace_value,
       'displace_uom', navaids_points.dme_ts.displace_uom,
       'displace_nilreason', navaids_points.dme_ts.displace_nilreason,
       'id', navaids_points.dme_ts.id,
       'xml_id', navaids_points.dme_ts.xml_id,
       'interpretation', navaids_points.dme_ts.interpretation,
       'sequence_number', navaids_points.dme_ts.sequence_number,
       'correction_number', navaids_points.dme_ts.correction_number,
       'valid_time_begin', navaids_points.dme_ts.valid_time_begin,
       'valid_time_end', navaids_points.dme_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.dme_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.dme_ts.feature_lifetime_end
    ) AS dmetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.dme_ts
ON navaids_points.dme_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.dme_ts
ON navaids_points.dme_ts.abstractdmeextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.dme_ts
ON navaids_points.dme_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.dme_ts.id = master_join.source_id
LEFT JOIN navaids_points.dme_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.dme_ts.id = master_join.source_id
LEFT JOIN navaids_points.dme_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.dme_ts.id = master_join.source_id
LEFT JOIN navaids_points.dme_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.dme_ts.id = master_join.source_id
LEFT JOIN navaids_points.dme_ts
ON master_join.target_id = NotePropertyType.id
;

DMEType
CREATE OR REPLACE VIEW dmetype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.dme.id,
       'identifier', navaids_points.dme.identifier,
       'identifier_code_space', navaids_points.dme.identifier_code_space,
       'xml_id', navaids_points.dme.xml_id
    ) AS dmetype
FROM


-- DMETimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.dme.id = master_join.source_id
LEFT JOIN navaids_points.dme
ON master_join.target_id = DMETimeSlicePropertyType.id
;

ElevatedSurfacePropertyType
CREATE OR REPLACE VIEW elevatedsurfacepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', public.elevated_surface_pt.id
    ) AS elevatedsurfacepropertytype
FROM


;

ElevationPropertyType
CREATE OR REPLACE VIEW elevationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.elevation_pt.id,
       'nilReason', navaids_points.elevation_pt.nilReason
    ) AS elevationpropertytype
FROM


;

ElevationTimeSlicePropertyType
CREATE OR REPLACE VIEW elevationtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.elevation_tsp.id
    ) AS elevationtimeslicepropertytype
FROM

-- ElevationTimeSliceType
LEFT JOIN navaids_points.elevation_tsp
ON navaids_points.elevation_tsp.elevationtimeslice_id = ElevationTimeSliceType.id

;

ElevationTimeSliceType
CREATE OR REPLACE VIEW elevationtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.elevation_ts.designator_value,
       'designator_nilreason', navaids_points.elevation_ts.designator_nilreason,
       'name_value', navaids_points.elevation_ts.name_value,
       'name_nilreason', navaids_points.elevation_ts.name_nilreason,
       'emissionclass_value', navaids_points.elevation_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.elevation_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.elevation_ts.mobile_value,
       'mobile_nilreason', navaids_points.elevation_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.elevation_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.elevation_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.elevation_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.elevation_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.elevation_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.elevation_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.elevation_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.elevation_ts.flightchecked_nilreason,
       'anglenominal_value', navaids_points.elevation_ts.anglenominal_value,
       'anglenominal_nilreason', navaids_points.elevation_ts.anglenominal_nilreason,
       'angleminimum_value', navaids_points.elevation_ts.angleminimum_value,
       'angleminimum_nilreason', navaids_points.elevation_ts.angleminimum_nilreason,
       'anglespan_value', navaids_points.elevation_ts.anglespan_value,
       'anglespan_nilreason', navaids_points.elevation_ts.anglespan_nilreason,
       'angleaccuracy_value', navaids_points.elevation_ts.angleaccuracy_value,
       'angleaccuracy_nilreason', navaids_points.elevation_ts.angleaccuracy_nilreason,
       'id', navaids_points.elevation_ts.id,
       'xml_id', navaids_points.elevation_ts.xml_id,
       'interpretation', navaids_points.elevation_ts.interpretation,
       'sequence_number', navaids_points.elevation_ts.sequence_number,
       'correction_number', navaids_points.elevation_ts.correction_number,
       'valid_time_begin', navaids_points.elevation_ts.valid_time_begin,
       'valid_time_end', navaids_points.elevation_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.elevation_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.elevation_ts.feature_lifetime_end
    ) AS elevationtimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.elevation_ts
ON navaids_points.elevation_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.elevation_ts
ON navaids_points.elevation_ts.abstractelevationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.elevation_ts
ON navaids_points.elevation_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.elevation_ts.id = master_join.source_id
LEFT JOIN navaids_points.elevation_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.elevation_ts.id = master_join.source_id
LEFT JOIN navaids_points.elevation_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.elevation_ts.id = master_join.source_id
LEFT JOIN navaids_points.elevation_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.elevation_ts.id = master_join.source_id
LEFT JOIN navaids_points.elevation_ts
ON master_join.target_id = NotePropertyType.id
;

ElevationType
CREATE OR REPLACE VIEW elevationtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.elevation.id,
       'identifier', navaids_points.elevation.identifier,
       'identifier_code_space', navaids_points.elevation.identifier_code_space,
       'xml_id', navaids_points.elevation.xml_id
    ) AS elevationtype
FROM


-- ElevationTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.elevation.id = master_join.source_id
LEFT JOIN navaids_points.elevation
ON master_join.target_id = ElevationTimeSlicePropertyType.id
;

EnRouteSegmentPointPropertyType
CREATE OR REPLACE VIEW enroutesegmentpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.enroutesegmentpoint_pt.id
    ) AS enroutesegmentpointpropertytype
FROM

-- EnRouteSegmentPointType
LEFT JOIN navaids_points.enroutesegmentpoint_pt
ON navaids_points.enroutesegmentpoint_pt.enroutesegmentpoint_id = EnRouteSegmentPointType.id

;

EnRouteSegmentPointType
CREATE OR REPLACE VIEW enroutesegmentpointtype_view AS
SELECT
    jsonb_build_object(
       'reportingatc_value', navaids_points.enroutesegmentpoint.reportingatc_value,
       'reportingatc_nilreason', navaids_points.enroutesegmentpoint.reportingatc_nilreason,
       'flyover_value', navaids_points.enroutesegmentpoint.flyover_value,
       'flyover_nilreason', navaids_points.enroutesegmentpoint.flyover_nilreason,
       'waypoint_value', navaids_points.enroutesegmentpoint.waypoint_value,
       'waypoint_nilreason', navaids_points.enroutesegmentpoint.waypoint_nilreason,
       'radarguidance_value', navaids_points.enroutesegmentpoint.radarguidance_value,
       'radarguidance_nilreason', navaids_points.enroutesegmentpoint.radarguidance_nilreason,
       'rolefreeflight_value', navaids_points.enroutesegmentpoint.rolefreeflight_value,
       'rolefreeflight_nilreason', navaids_points.enroutesegmentpoint.rolefreeflight_nilreason,
       'rolervsm_value', navaids_points.enroutesegmentpoint.rolervsm_value,
       'rolervsm_nilreason', navaids_points.enroutesegmentpoint.rolervsm_nilreason,
       'rolemilitarytraining_value', navaids_points.enroutesegmentpoint.rolemilitarytraining_value,
       'rolemilitarytraining_nilreason', navaids_points.enroutesegmentpoint.rolemilitarytraining_nilreason,
       'turnradius_value', navaids_points.enroutesegmentpoint.turnradius_value,
       'turnradius_uom', navaids_points.enroutesegmentpoint.turnradius_uom,
       'turnradius_nilreason', navaids_points.enroutesegmentpoint.turnradius_nilreason,
       'id', navaids_points.enroutesegmentpoint.id,
       'identifier', navaids_points.enroutesegmentpoint.identifier,
       'identifier_code_space', navaids_points.enroutesegmentpoint.identifier_code_space,
       'xml_id', navaids_points.enroutesegmentpoint.xml_id
    ) AS enroutesegmentpointtype
FROM

-- DesignatedPointPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_position_id = PointPropertyType.id
-- RadioFrequencyAreaPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.extendedservicevolume_id = RadioFrequencyAreaPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.abstractsegmentpointextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.abstractenroutesegmentpointextension_id = AbstractExtensionType.id

-- PointReferencePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.enroutesegmentpoint.id = master_join.source_id
LEFT JOIN navaids_points.enroutesegmentpoint
ON master_join.target_id = PointReferencePropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.enroutesegmentpoint.id = master_join.source_id
LEFT JOIN navaids_points.enroutesegmentpoint
ON master_join.target_id = NotePropertyType.id
;

EquipmentUnavailableAdjustmentColumnPropertyType
CREATE OR REPLACE VIEW equipmentunavailableadjustmentcolumnpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.equipmentunavailableadjustmentcolumn_pt.id
    ) AS equipmentunavailableadjustmentcolumnpropertytype
FROM

-- EquipmentUnavailableAdjustmentColumnType
LEFT JOIN procedure.equipmentunavailableadjustmentcolumn_pt
ON procedure.equipmentunavailableadjustmentcolumn_pt.equipmentunavailableadjustmentcolumn_id = EquipmentUnavailableAdjustmentColumnType.id

;

EquipmentUnavailableAdjustmentColumnType
CREATE OR REPLACE VIEW equipmentunavailableadjustmentcolumntype_view AS
SELECT
    jsonb_build_object(
       'guidanceequipment_value', procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_value,
       'guidanceequipment_nilreason', procedure.equipmentunavailableadjustmentcolumn.guidanceequipment_nilreason,
       'landingsystemlights_value', procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_value,
       'landingsystemlights_nilreason', procedure.equipmentunavailableadjustmentcolumn.landingsystemlights_nilreason,
       'equipmentrvr_value', procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_value,
       'equipmentrvr_nilreason', procedure.equipmentunavailableadjustmentcolumn.equipmentrvr_nilreason,
       'approachlightinginoperative_value', procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_value,
       'approachlightinginoperative_nilreason', procedure.equipmentunavailableadjustmentcolumn.approachlightinginoperative_nilreason,
       'visibilityadjustment_value', procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_value,
       'visibilityadjustment_uom', procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_uom,
       'visibilityadjustment_nilreason', procedure.equipmentunavailableadjustmentcolumn.visibilityadjustment_nilreason,
       'id', procedure.equipmentunavailableadjustmentcolumn.id,
       'identifier', procedure.equipmentunavailableadjustmentcolumn.identifier,
       'identifier_code_space', procedure.equipmentunavailableadjustmentcolumn.identifier_code_space,
       'xml_id', procedure.equipmentunavailableadjustmentcolumn.xml_id
    ) AS equipmentunavailableadjustmentcolumntype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.equipmentunavailableadjustmentcolumn
ON procedure.equipmentunavailableadjustmentcolumn.abstractequipmentunavailableadjustmentcolumnextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.equipmentunavailableadjustmentcolumn.id = master_join.source_id
LEFT JOIN procedure.equipmentunavailableadjustmentcolumn
ON master_join.target_id = NotePropertyType.id
;

EquipmentUnavailableAdjustmentPropertyType
CREATE OR REPLACE VIEW equipmentunavailableadjustmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.equipmentunavailableadjustment_pt.id
    ) AS equipmentunavailableadjustmentpropertytype
FROM

-- EquipmentUnavailableAdjustmentType
LEFT JOIN procedure.equipmentunavailableadjustment_pt
ON procedure.equipmentunavailableadjustment_pt.equipmentunavailableadjustment_id = EquipmentUnavailableAdjustmentType.id

;

EquipmentUnavailableAdjustmentType
CREATE OR REPLACE VIEW equipmentunavailableadjustmenttype_view AS
SELECT
    jsonb_build_object(
       'type_value', procedure.equipmentunavailableadjustment.type_value,
       'type_nilreason', procedure.equipmentunavailableadjustment.type_nilreason,
       'approachlightinginoperative_value', procedure.equipmentunavailableadjustment.approachlightinginoperative_value,
       'approachlightinginoperative_nilreason', procedure.equipmentunavailableadjustment.approachlightinginoperative_nilreason,
       'id', procedure.equipmentunavailableadjustment.id,
       'identifier', procedure.equipmentunavailableadjustment.identifier,
       'identifier_code_space', procedure.equipmentunavailableadjustment.identifier_code_space,
       'xml_id', procedure.equipmentunavailableadjustment.xml_id
    ) AS equipmentunavailableadjustmenttype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.equipmentunavailableadjustment
ON procedure.equipmentunavailableadjustment.abstractequipmentunavailableadjustmentextension_id = AbstractExtensionType.id

-- EquipmentUnavailableAdjustmentColumnPropertyType
LEFT JOIN procedure.master_join
ON procedure.equipmentunavailableadjustment.id = master_join.source_id
LEFT JOIN procedure.equipmentunavailableadjustment
ON master_join.target_id = EquipmentUnavailableAdjustmentColumnPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.equipmentunavailableadjustment.id = master_join.source_id
LEFT JOIN procedure.equipmentunavailableadjustment
ON master_join.target_id = NotePropertyType.id
;

FASDataBlockPropertyType
CREATE OR REPLACE VIEW fasdatablockpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', public.fasdatablock_pt.id
    ) AS fasdatablockpropertytype
FROM

-- FASDataBlockType
LEFT JOIN public.fasdatablock_pt
ON public.fasdatablock_pt.fasdatablock_id = FASDataBlockType.id

;

FASDataBlockType
CREATE OR REPLACE VIEW fasdatablocktype_view AS
SELECT
    jsonb_build_object(
       'routeindicator', public.fasdatablock.routeindicator,
       'referencepathidentifier', public.fasdatablock.referencepathidentifier,
       'codeicao', public.fasdatablock.codeicao,
       'horizontalalarmlimit_value', public.fasdatablock.horizontalalarmlimit_value,
       'horizontalalarmlimit_nilreason', public.fasdatablock.horizontalalarmlimit_nilreason,
       'verticalalarmlimit_value', public.fasdatablock.verticalalarmlimit_value,
       'verticalalarmlimit_nilreason', public.fasdatablock.verticalalarmlimit_nilreason,
       'crcremainder_value', public.fasdatablock.crcremainder_value,
       'crcremainder_nilreason', public.fasdatablock.crcremainder_nilreason,
       'operationtype_value', public.fasdatablock.operationtype_value,
       'operationtype_nilreason', public.fasdatablock.operationtype_nilreason,
       'serviceprovidersbas_value', public.fasdatablock.serviceprovidersbas_value,
       'serviceprovidersbas_nilreason', public.fasdatablock.serviceprovidersbas_nilreason,
       'approachperformancedesignator_value', public.fasdatablock.approachperformancedesignator_value,
       'approachperformancedesignator_nilreason', public.fasdatablock.approachperformancedesignator_nilreason,
       'referencepathdataselector_value', public.fasdatablock.referencepathdataselector_value,
       'referencepathdataselector_nilreason', public.fasdatablock.referencepathdataselector_nilreason,
       'thresholdcoursewidth_value', public.fasdatablock.thresholdcoursewidth_value,
       'thresholdcoursewidth_uom', public.fasdatablock.thresholdcoursewidth_uom,
       'thresholdcoursewidth_nilreason', public.fasdatablock.thresholdcoursewidth_nilreason,
       'lengthoffset_value', public.fasdatablock.lengthoffset_value,
       'lengthoffset_uom', public.fasdatablock.lengthoffset_uom,
       'lengthoffset_nilreason', public.fasdatablock.lengthoffset_nilreason,
       'id', public.fasdatablock.id,
       'identifier', public.fasdatablock.identifier,
       'identifier_code_space', public.fasdatablock.identifier_code_space,
       'xml_id', public.fasdatablock.xml_id
    ) AS fasdatablocktype
FROM

-- AbstractExtensionType
LEFT JOIN public.fasdatablock
ON public.fasdatablock.abstractfasdatablockextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN public.master_join
ON public.fasdatablock.id = master_join.source_id
LEFT JOIN public.fasdatablock
ON master_join.target_id = NotePropertyType.id
;

FeatureMetadataPropertyType
CREATE OR REPLACE VIEW featuremetadatapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', public.message_metadata_property.id
    ) AS featuremetadatapropertytype
FROM


;

FeatureTimeSliceMetadataPropertyType
CREATE OR REPLACE VIEW featuretimeslicemetadatapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', public.message_metadata_property.id
    ) AS featuretimeslicemetadatapropertytype
FROM


;

FinalLegPropertyType
CREATE OR REPLACE VIEW finallegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.finalleg_pt.id,
       'nilReason', procedure.finalleg_pt.nilReason
    ) AS finallegpropertytype
FROM


;

FinalLegTimeSlicePropertyType
CREATE OR REPLACE VIEW finallegtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.finalleg_tsp.id
    ) AS finallegtimeslicepropertytype
FROM

-- FinalLegTimeSliceType
LEFT JOIN procedure.finalleg_tsp
ON procedure.finalleg_tsp.finallegtimeslice_id = FinalLegTimeSliceType.id

;

FinalLegTimeSliceType
CREATE OR REPLACE VIEW finallegtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'endconditiondesignator_value', procedure.finalleg_ts.endconditiondesignator_value,
       'endconditiondesignator_nilreason', procedure.finalleg_ts.endconditiondesignator_nilreason,
       'legpath_value', procedure.finalleg_ts.legpath_value,
       'legpath_nilreason', procedure.finalleg_ts.legpath_nilreason,
       'legtypearinc_value', procedure.finalleg_ts.legtypearinc_value,
       'legtypearinc_nilreason', procedure.finalleg_ts.legtypearinc_nilreason,
       'course_value', procedure.finalleg_ts.course_value,
       'course_nilreason', procedure.finalleg_ts.course_nilreason,
       'coursetype_value', procedure.finalleg_ts.coursetype_value,
       'coursetype_nilreason', procedure.finalleg_ts.coursetype_nilreason,
       'coursedirection_value', procedure.finalleg_ts.coursedirection_value,
       'coursedirection_nilreason', procedure.finalleg_ts.coursedirection_nilreason,
       'turndirection_value', procedure.finalleg_ts.turndirection_value,
       'turndirection_nilreason', procedure.finalleg_ts.turndirection_nilreason,
       'speedreference_value', procedure.finalleg_ts.speedreference_value,
       'speedreference_nilreason', procedure.finalleg_ts.speedreference_nilreason,
       'speedinterpretation_value', procedure.finalleg_ts.speedinterpretation_value,
       'speedinterpretation_nilreason', procedure.finalleg_ts.speedinterpretation_nilreason,
       'bankangle_value', procedure.finalleg_ts.bankangle_value,
       'bankangle_nilreason', procedure.finalleg_ts.bankangle_nilreason,
       'procedureturnrequired_value', procedure.finalleg_ts.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.finalleg_ts.procedureturnrequired_nilreason,
       'upperlimitreference_value', procedure.finalleg_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', procedure.finalleg_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', procedure.finalleg_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', procedure.finalleg_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', procedure.finalleg_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', procedure.finalleg_ts.altitudeinterpretation_nilreason,
       'altitudeoverridereference_value', procedure.finalleg_ts.altitudeoverridereference_value,
       'altitudeoverridereference_nilreason', procedure.finalleg_ts.altitudeoverridereference_nilreason,
       'verticalangle_value', procedure.finalleg_ts.verticalangle_value,
       'verticalangle_nilreason', procedure.finalleg_ts.verticalangle_nilreason,
       'guidancesystem_value', procedure.finalleg_ts.guidancesystem_value,
       'guidancesystem_nilreason', procedure.finalleg_ts.guidancesystem_nilreason,
       'landingsystemcategory_value', procedure.finalleg_ts.landingsystemcategory_value,
       'landingsystemcategory_nilreason', procedure.finalleg_ts.landingsystemcategory_nilreason,
       'rnpdmeauthorized_value', procedure.finalleg_ts.rnpdmeauthorized_value,
       'rnpdmeauthorized_nilreason', procedure.finalleg_ts.rnpdmeauthorized_nilreason,
       'courseoffsetangle_value', procedure.finalleg_ts.courseoffsetangle_value,
       'courseoffsetangle_nilreason', procedure.finalleg_ts.courseoffsetangle_nilreason,
       'courseoffsetside_value', procedure.finalleg_ts.courseoffsetside_value,
       'courseoffsetside_nilreason', procedure.finalleg_ts.courseoffsetside_nilreason,
       'coursecentrelineintersect_value', procedure.finalleg_ts.coursecentrelineintersect_value,
       'coursecentrelineintersect_nilreason', procedure.finalleg_ts.coursecentrelineintersect_nilreason,
       'speedlimit_value', procedure.finalleg_ts.speedlimit_value,
       'speedlimit_uom', procedure.finalleg_ts.speedlimit_uom,
       'speedlimit_nilreason', procedure.finalleg_ts.speedlimit_nilreason,
       'length_value', procedure.finalleg_ts.length_value,
       'length_uom', procedure.finalleg_ts.length_uom,
       'length_nilreason', procedure.finalleg_ts.length_nilreason,
       'duration_value', procedure.finalleg_ts.duration_value,
       'duration_uom', procedure.finalleg_ts.duration_uom,
       'duration_nilreason', procedure.finalleg_ts.duration_nilreason,
       'upperlimitaltitude_value', procedure.finalleg_ts.upperlimitaltitude_value,
       'upperlimitaltitude_uom', procedure.finalleg_ts.upperlimitaltitude_uom,
       'upperlimitaltitude_nilreason', procedure.finalleg_ts.upperlimitaltitude_nilreason,
       'lowerlimitaltitude_value', procedure.finalleg_ts.lowerlimitaltitude_value,
       'lowerlimitaltitude_uom', procedure.finalleg_ts.lowerlimitaltitude_uom,
       'lowerlimitaltitude_nilreason', procedure.finalleg_ts.lowerlimitaltitude_nilreason,
       'altitudeoverrideatc_value', procedure.finalleg_ts.altitudeoverrideatc_value,
       'altitudeoverrideatc_uom', procedure.finalleg_ts.altitudeoverrideatc_uom,
       'altitudeoverrideatc_nilreason', procedure.finalleg_ts.altitudeoverrideatc_nilreason,
       'minimumbarovnavtemperature_value', procedure.finalleg_ts.minimumbarovnavtemperature_value,
       'minimumbarovnavtemperature_uom', procedure.finalleg_ts.minimumbarovnavtemperature_uom,
       'minimumbarovnavtemperature_nilreason', procedure.finalleg_ts.minimumbarovnavtemperature_nilreason,
       'coursecentrelinedistance_value', procedure.finalleg_ts.coursecentrelinedistance_value,
       'coursecentrelinedistance_uom', procedure.finalleg_ts.coursecentrelinedistance_uom,
       'coursecentrelinedistance_nilreason', procedure.finalleg_ts.coursecentrelinedistance_nilreason,
       'courseoffsetdistance_value', procedure.finalleg_ts.courseoffsetdistance_value,
       'courseoffsetdistance_uom', procedure.finalleg_ts.courseoffsetdistance_uom,
       'courseoffsetdistance_nilreason', procedure.finalleg_ts.courseoffsetdistance_nilreason,
       'id', procedure.finalleg_ts.id,
       'xml_id', procedure.finalleg_ts.xml_id,
       'interpretation', procedure.finalleg_ts.interpretation,
       'sequence_number', procedure.finalleg_ts.sequence_number,
       'correction_number', procedure.finalleg_ts.correction_number,
       'valid_time_begin', procedure.finalleg_ts.valid_time_begin,
       'valid_time_end', procedure.finalleg_ts.valid_time_end,
       'feature_lifetime_begin', procedure.finalleg_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.finalleg_ts.feature_lifetime_end
    ) AS finallegtimeslicetype
FROM

-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.startpoint_id = TerminalSegmentPointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.endpoint_id = TerminalSegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.trajectory_id = CurvePropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.arccentre_id = TerminalSegmentPointPropertyType.id
-- AngleIndicationPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.angle_id = AngleIndicationPropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.distance_id = DistanceIndicationPropertyType.id
-- HoldingUsePropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.holding_id = HoldingUsePropertyType.id
-- InstrumentApproachProcedurePropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.approach_id = InstrumentApproachProcedurePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_position_id = PointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.visualdescentpoint_id = TerminalSegmentPointPropertyType.id
-- FASDataBlockPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.fasdata_id = FASDataBlockPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.abstractfinallegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.abstractapproachlegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.abstractsegmentlegextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.finalleg_ts.id = master_join.source_id
LEFT JOIN procedure.finalleg_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.finalleg_ts.id = master_join.source_id
LEFT JOIN procedure.finalleg_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.finalleg_ts.id = master_join.source_id
LEFT JOIN procedure.finalleg_ts
ON master_join.target_id = NotePropertyType.id
-- ApproachConditionPropertyType
LEFT JOIN procedure.master_join
ON procedure.finalleg_ts.id = master_join.source_id
LEFT JOIN procedure.finalleg_ts
ON master_join.target_id = ApproachConditionPropertyType.id
;

FinalLegType
CREATE OR REPLACE VIEW finallegtype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.finalleg.id,
       'identifier', procedure.finalleg.identifier,
       'identifier_code_space', procedure.finalleg.identifier_code_space,
       'xml_id', procedure.finalleg.xml_id
    ) AS finallegtype
FROM


-- FinalLegTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.finalleg.id = master_join.source_id
LEFT JOIN procedure.finalleg
ON master_join.target_id = FinalLegTimeSlicePropertyType.id
;

FinalProfilePropertyType
CREATE OR REPLACE VIEW finalprofilepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.finalprofile_pt.id
    ) AS finalprofilepropertytype
FROM

-- FinalProfileType
LEFT JOIN procedure.finalprofile_pt
ON procedure.finalprofile_pt.finalprofile_id = FinalProfileType.id

;

FinalProfileType
CREATE OR REPLACE VIEW finalprofiletype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.finalprofile.id,
       'identifier', procedure.finalprofile.identifier,
       'identifier_code_space', procedure.finalprofile.identifier_code_space,
       'xml_id', procedure.finalprofile.xml_id
    ) AS finalprofiletype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.finalprofile
ON procedure.finalprofile.abstractfinalprofileextension_id = AbstractExtensionType.id

-- ApproachAltitudeTablePropertyType
LEFT JOIN procedure.master_join
ON procedure.finalprofile.id = master_join.source_id
LEFT JOIN procedure.finalprofile
ON master_join.target_id = ApproachAltitudeTablePropertyType.id
-- ApproachDistanceTablePropertyType
LEFT JOIN procedure.master_join
ON procedure.finalprofile.id = master_join.source_id
LEFT JOIN procedure.finalprofile
ON master_join.target_id = ApproachDistanceTablePropertyType.id
-- ApproachTimingTablePropertyType
LEFT JOIN procedure.master_join
ON procedure.finalprofile.id = master_join.source_id
LEFT JOIN procedure.finalprofile
ON master_join.target_id = ApproachTimingTablePropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.finalprofile.id = master_join.source_id
LEFT JOIN procedure.finalprofile
ON master_join.target_id = NotePropertyType.id
;

FireFightingServicePropertyType
CREATE OR REPLACE VIEW firefightingservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.firefightingservice_pt.id,
       'nilReason', service.firefightingservice_pt.nilReason
    ) AS firefightingservicepropertytype
FROM


;

FireFightingServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW firefightingservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.firefightingservice_tsp.id
    ) AS firefightingservicetimeslicepropertytype
FROM

-- FireFightingServiceTimeSliceType
LEFT JOIN service.firefightingservice_tsp
ON service.firefightingservice_tsp.firefightingservicetimeslice_id = FireFightingServiceTimeSliceType.id

;

FireFightingServiceTimeSliceType
CREATE OR REPLACE VIEW firefightingservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.firefightingservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.firefightingservice_ts.flightoperations_nilreason,
       'rank_value', service.firefightingservice_ts.rank_value,
       'rank_nilreason', service.firefightingservice_ts.rank_nilreason,
       'complianticao_value', service.firefightingservice_ts.complianticao_value,
       'complianticao_nilreason', service.firefightingservice_ts.complianticao_nilreason,
       'name_value', service.firefightingservice_ts.name_value,
       'name_nilreason', service.firefightingservice_ts.name_nilreason,
       'category_value', service.firefightingservice_ts.category_value,
       'category_nilreason', service.firefightingservice_ts.category_nilreason,
       'standard_value', service.firefightingservice_ts.standard_value,
       'standard_nilreason', service.firefightingservice_ts.standard_nilreason,
       'id', service.firefightingservice_ts.id,
       'xml_id', service.firefightingservice_ts.xml_id,
       'interpretation', service.firefightingservice_ts.interpretation,
       'sequence_number', service.firefightingservice_ts.sequence_number,
       'correction_number', service.firefightingservice_ts.correction_number,
       'valid_time_begin', service.firefightingservice_ts.valid_time_begin,
       'valid_time_end', service.firefightingservice_ts.valid_time_end,
       'feature_lifetime_begin', service.firefightingservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.firefightingservice_ts.feature_lifetime_end
    ) AS firefightingservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.firefightingservice_ts
ON service.firefightingservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.firefightingservice_ts
ON service.firefightingservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.firefightingservice_ts
ON service.firefightingservice_ts.abstractfirefightingserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.firefightingservice_ts
ON service.firefightingservice_ts.abstractairportgroundserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.firefightingservice_ts
ON service.firefightingservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.firefightingservice_ts.id = master_join.source_id
LEFT JOIN service.firefightingservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.firefightingservice_ts.id = master_join.source_id
LEFT JOIN service.firefightingservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.firefightingservice_ts.id = master_join.source_id
LEFT JOIN service.firefightingservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.firefightingservice_ts.id = master_join.source_id
LEFT JOIN service.firefightingservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.firefightingservice_ts.id = master_join.source_id
LEFT JOIN service.firefightingservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.master_join
ON service.firefightingservice_ts.id = master_join.source_id
LEFT JOIN service.firefightingservice_ts
ON master_join.target_id = AirportHeliportPropertyType.id
;

FireFightingServiceType
CREATE OR REPLACE VIEW firefightingservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.firefightingservice.id,
       'identifier', service.firefightingservice.identifier,
       'identifier_code_space', service.firefightingservice.identifier_code_space,
       'xml_id', service.firefightingservice.xml_id
    ) AS firefightingservicetype
FROM


-- FireFightingServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.firefightingservice.id = master_join.source_id
LEFT JOIN service.firefightingservice
ON master_join.target_id = FireFightingServiceTimeSlicePropertyType.id
;

FlightCharacteristicPropertyType
CREATE OR REPLACE VIEW flightcharacteristicpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.flightcharacteristic_pt.id
    ) AS flightcharacteristicpropertytype
FROM

-- FlightCharacteristicType
LEFT JOIN shared.flightcharacteristic_pt
ON shared.flightcharacteristic_pt.flightcharacteristic_id = FlightCharacteristicType.id

;

FlightCharacteristicType
CREATE OR REPLACE VIEW flightcharacteristictype_view AS
SELECT
    jsonb_build_object(
       'type_value', shared.flightcharacteristic.type_value,
       'type_nilreason', shared.flightcharacteristic.type_nilreason,
       'rule_value', shared.flightcharacteristic.rule_value,
       'rule_nilreason', shared.flightcharacteristic.rule_nilreason,
       'status_value', shared.flightcharacteristic.status_value,
       'status_nilreason', shared.flightcharacteristic.status_nilreason,
       'military_value', shared.flightcharacteristic.military_value,
       'military_nilreason', shared.flightcharacteristic.military_nilreason,
       'origin_value', shared.flightcharacteristic.origin_value,
       'origin_nilreason', shared.flightcharacteristic.origin_nilreason,
       'purpose_value', shared.flightcharacteristic.purpose_value,
       'purpose_nilreason', shared.flightcharacteristic.purpose_nilreason,
       'id', shared.flightcharacteristic.id,
       'identifier', shared.flightcharacteristic.identifier,
       'identifier_code_space', shared.flightcharacteristic.identifier_code_space,
       'xml_id', shared.flightcharacteristic.xml_id
    ) AS flightcharacteristictype
FROM

-- AbstractExtensionType
LEFT JOIN shared.flightcharacteristic
ON shared.flightcharacteristic.abstractflightcharacteristicextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.flightcharacteristic.id = master_join.source_id
LEFT JOIN shared.flightcharacteristic
ON master_join.target_id = NotePropertyType.id
;

FlightConditionCircumstancePropertyType
CREATE OR REPLACE VIEW flightconditioncircumstancepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightconditioncircumstance_pt.id
    ) AS flightconditioncircumstancepropertytype
FROM

-- FlightConditionCircumstanceType
LEFT JOIN routes.flightconditioncircumstance_pt
ON routes.flightconditioncircumstance_pt.flightconditioncircumstance_id = FlightConditionCircumstanceType.id

;

FlightConditionCircumstanceType
CREATE OR REPLACE VIEW flightconditioncircumstancetype_view AS
SELECT
    jsonb_build_object(
       'referencelocation_value', routes.flightconditioncircumstance.referencelocation_value,
       'referencelocation_nilreason', routes.flightconditioncircumstance.referencelocation_nilreason,
       'relationwithlocation_value', routes.flightconditioncircumstance.relationwithlocation_value,
       'relationwithlocation_nilreason', routes.flightconditioncircumstance.relationwithlocation_nilreason,
       'id', routes.flightconditioncircumstance.id,
       'identifier', routes.flightconditioncircumstance.identifier,
       'identifier_code_space', routes.flightconditioncircumstance.identifier_code_space,
       'xml_id', routes.flightconditioncircumstance.xml_id
    ) AS flightconditioncircumstancetype
FROM

-- AbstractExtensionType
LEFT JOIN routes.flightconditioncircumstance
ON routes.flightconditioncircumstance.abstractflightconditioncircumstanceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.flightconditioncircumstance.id = master_join.source_id
LEFT JOIN routes.flightconditioncircumstance
ON master_join.target_id = NotePropertyType.id
;

FlightConditionCombinationPropertyType
CREATE OR REPLACE VIEW flightconditioncombinationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightconditioncombination_pt.id
    ) AS flightconditioncombinationpropertytype
FROM

-- FlightConditionCombinationType
LEFT JOIN routes.flightconditioncombination_pt
ON routes.flightconditioncombination_pt.flightconditioncombination_id = FlightConditionCombinationType.id

;

FlightConditionCombinationType
CREATE OR REPLACE VIEW flightconditioncombinationtype_view AS
SELECT
    jsonb_build_object(
       'logicaloperator_value', routes.flightconditioncombination.logicaloperator_value,
       'logicaloperator_nilreason', routes.flightconditioncombination.logicaloperator_nilreason,
       'id', routes.flightconditioncombination.id,
       'identifier', routes.flightconditioncombination.identifier,
       'identifier_code_space', routes.flightconditioncombination.identifier_code_space,
       'xml_id', routes.flightconditioncombination.xml_id
    ) AS flightconditioncombinationtype
FROM

-- AbstractExtensionType
LEFT JOIN routes.flightconditioncombination
ON routes.flightconditioncombination.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.flightconditioncombination
ON routes.flightconditioncombination.abstractflightconditioncombinationextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN routes.master_join
ON routes.flightconditioncombination.id = master_join.source_id
LEFT JOIN routes.flightconditioncombination
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.flightconditioncombination.id = master_join.source_id
LEFT JOIN routes.flightconditioncombination
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN routes.master_join
ON routes.flightconditioncombination.id = master_join.source_id
LEFT JOIN routes.flightconditioncombination
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- FlightConditionElementPropertyType
LEFT JOIN routes.master_join
ON routes.flightconditioncombination.id = master_join.source_id
LEFT JOIN routes.flightconditioncombination
ON master_join.target_id = FlightConditionElementPropertyType.id
;

FlightConditionElementPropertyType
CREATE OR REPLACE VIEW flightconditionelementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightconditionelement_pt.id
    ) AS flightconditionelementpropertytype
FROM

-- FlightConditionElementType
LEFT JOIN routes.flightconditionelement_pt
ON routes.flightconditionelement_pt.flightconditionelement_id = FlightConditionElementType.id

;

FlightConditionElementType
CREATE OR REPLACE VIEW flightconditionelementtype_view AS
SELECT
    jsonb_build_object(
       'index_value', routes.flightconditionelement.index_value,
       'index_nilreason', routes.flightconditionelement.index_nilreason,
       'id', routes.flightconditionelement.id,
       'identifier', routes.flightconditionelement.identifier,
       'identifier_code_space', routes.flightconditionelement.identifier_code_space,
       'xml_id', routes.flightconditionelement.xml_id
    ) AS flightconditionelementtype
FROM

-- AirportHeliportPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_airportheliportcondition_id = AirportHeliportPropertyType.id
-- StandardInstrumentDeparturePropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_standardinstrumentdeparturecondition_id = StandardInstrumentDeparturePropertyType.id
-- RoutePortionPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_routeportioncondition_id = RoutePortionPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_organisationcondition_id = OrganisationAuthorityPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_position_id = PointPropertyType.id
-- DirectFlightPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_directflightcondition_id = DirectFlightPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_aircraft_id = AircraftCharacteristicPropertyType.id
-- AirspaceBorderCrossingPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_bordercrossingcondition_id = AirspaceBorderCrossingPropertyType.id
-- AirspacePropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_airspacecondition_id = AirspacePropertyType.id
-- FlightCharacteristicPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_flight_id = FlightCharacteristicPropertyType.id
-- StandardInstrumentArrivalPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_standardinstrumentarrivalcondition_id = StandardInstrumentArrivalPropertyType.id
-- FlightConditionCombinationPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_operand_id = FlightConditionCombinationPropertyType.id
-- MeteorologyPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_weather_id = MeteorologyPropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_aerialrefuellingcondition_id = AerialRefuellingPropertyType.id
-- FlightConditionCircumstancePropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.operationalcondition_id = FlightConditionCircumstancePropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.abstractflightconditionelementextension_id = AbstractExtensionType.id

-- FlightRestrictionLevelPropertyType
LEFT JOIN routes.master_join
ON routes.flightconditionelement.id = master_join.source_id
LEFT JOIN routes.flightconditionelement
ON master_join.target_id = FlightRestrictionLevelPropertyType.id
-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.flightconditionelement.id = master_join.source_id
LEFT JOIN routes.flightconditionelement
ON master_join.target_id = NotePropertyType.id
;

FlightRestrictionLevelPropertyType
CREATE OR REPLACE VIEW flightrestrictionlevelpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestrictionlevel_pt.id
    ) AS flightrestrictionlevelpropertytype
FROM

-- FlightRestrictionLevelType
LEFT JOIN routes.flightrestrictionlevel_pt
ON routes.flightrestrictionlevel_pt.flightrestrictionlevel_id = FlightRestrictionLevelType.id

;

FlightRestrictionLevelType
CREATE OR REPLACE VIEW flightrestrictionleveltype_view AS
SELECT
    jsonb_build_object(
       'upperlevelreference_value', routes.flightrestrictionlevel.upperlevelreference_value,
       'upperlevelreference_nilreason', routes.flightrestrictionlevel.upperlevelreference_nilreason,
       'lowerlevelreference_value', routes.flightrestrictionlevel.lowerlevelreference_value,
       'lowerlevelreference_nilreason', routes.flightrestrictionlevel.lowerlevelreference_nilreason,
       'upperlevel_value', routes.flightrestrictionlevel.upperlevel_value,
       'upperlevel_uom', routes.flightrestrictionlevel.upperlevel_uom,
       'upperlevel_nilreason', routes.flightrestrictionlevel.upperlevel_nilreason,
       'lowerlevel_value', routes.flightrestrictionlevel.lowerlevel_value,
       'lowerlevel_uom', routes.flightrestrictionlevel.lowerlevel_uom,
       'lowerlevel_nilreason', routes.flightrestrictionlevel.lowerlevel_nilreason,
       'id', routes.flightrestrictionlevel.id,
       'identifier', routes.flightrestrictionlevel.identifier,
       'identifier_code_space', routes.flightrestrictionlevel.identifier_code_space,
       'xml_id', routes.flightrestrictionlevel.xml_id
    ) AS flightrestrictionleveltype
FROM

-- AbstractExtensionType
LEFT JOIN routes.flightrestrictionlevel
ON routes.flightrestrictionlevel.abstractflightrestrictionlevelextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.flightrestrictionlevel.id = master_join.source_id
LEFT JOIN routes.flightrestrictionlevel
ON master_join.target_id = NotePropertyType.id
;

FlightRestrictionPropertyType
CREATE OR REPLACE VIEW flightrestrictionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestriction_pt.id,
       'nilReason', routes.flightrestriction_pt.nilReason
    ) AS flightrestrictionpropertytype
FROM


;

FlightRestrictionRoutePropertyType
CREATE OR REPLACE VIEW flightrestrictionroutepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestrictionroute_pt.id
    ) AS flightrestrictionroutepropertytype
FROM

-- FlightRestrictionRouteType
LEFT JOIN routes.flightrestrictionroute_pt
ON routes.flightrestrictionroute_pt.flightrestrictionroute_id = FlightRestrictionRouteType.id

;

FlightRestrictionRouteType
CREATE OR REPLACE VIEW flightrestrictionroutetype_view AS
SELECT
    jsonb_build_object(
       'priorpermission_value', routes.flightrestrictionroute.priorpermission_value,
       'priorpermission_nilreason', routes.flightrestrictionroute.priorpermission_nilreason,
       'id', routes.flightrestrictionroute.id,
       'identifier', routes.flightrestrictionroute.identifier,
       'identifier_code_space', routes.flightrestrictionroute.identifier_code_space,
       'xml_id', routes.flightrestrictionroute.xml_id
    ) AS flightrestrictionroutetype
FROM

-- AbstractExtensionType
LEFT JOIN routes.flightrestrictionroute
ON routes.flightrestrictionroute.abstractflightrestrictionrouteextension_id = AbstractExtensionType.id

-- FlightRoutingElementPropertyType
LEFT JOIN routes.master_join
ON routes.flightrestrictionroute.id = master_join.source_id
LEFT JOIN routes.flightrestrictionroute
ON master_join.target_id = FlightRoutingElementPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN routes.master_join
ON routes.flightrestrictionroute.id = master_join.source_id
LEFT JOIN routes.flightrestrictionroute
ON master_join.target_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.flightrestrictionroute.id = master_join.source_id
LEFT JOIN routes.flightrestrictionroute
ON master_join.target_id = NotePropertyType.id
;

FlightRestrictionTimeSlicePropertyType
CREATE OR REPLACE VIEW flightrestrictiontimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestriction_tsp.id
    ) AS flightrestrictiontimeslicepropertytype
FROM

-- FlightRestrictionTimeSliceType
LEFT JOIN routes.flightrestriction_tsp
ON routes.flightrestriction_tsp.flightrestrictiontimeslice_id = FlightRestrictionTimeSliceType.id

;

FlightRestrictionTimeSliceType
CREATE OR REPLACE VIEW flightrestrictiontimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', routes.flightrestriction_ts.designator_value,
       'designator_nilreason', routes.flightrestriction_ts.designator_nilreason,
       'type_value', routes.flightrestriction_ts.type_value,
       'type_nilreason', routes.flightrestriction_ts.type_nilreason,
       'instruction_value', routes.flightrestriction_ts.instruction_value,
       'instruction_nilreason', routes.flightrestriction_ts.instruction_nilreason,
       'id', routes.flightrestriction_ts.id,
       'xml_id', routes.flightrestriction_ts.xml_id,
       'interpretation', routes.flightrestriction_ts.interpretation,
       'sequence_number', routes.flightrestriction_ts.sequence_number,
       'correction_number', routes.flightrestriction_ts.correction_number,
       'valid_time_begin', routes.flightrestriction_ts.valid_time_begin,
       'valid_time_end', routes.flightrestriction_ts.valid_time_end,
       'feature_lifetime_begin', routes.flightrestriction_ts.feature_lifetime_begin,
       'feature_lifetime_end', routes.flightrestriction_ts.feature_lifetime_end
    ) AS flightrestrictiontimeslicetype
FROM

-- FlightConditionCombinationPropertyType
LEFT JOIN routes.flightrestriction_ts
ON routes.flightrestriction_ts.flight_id = FlightConditionCombinationPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.flightrestriction_ts
ON routes.flightrestriction_ts.abstractflightrestrictionextension_id = AbstractExtensionType.id

-- FlightRestrictionRoutePropertyType
LEFT JOIN routes.master_join
ON routes.flightrestriction_ts.id = master_join.source_id
LEFT JOIN routes.flightrestriction_ts
ON master_join.target_id = FlightRestrictionRoutePropertyType.id
-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.flightrestriction_ts.id = master_join.source_id
LEFT JOIN routes.flightrestriction_ts
ON master_join.target_id = NotePropertyType.id
;

FlightRestrictionType
CREATE OR REPLACE VIEW flightrestrictiontype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestriction.id,
       'identifier', routes.flightrestriction.identifier,
       'identifier_code_space', routes.flightrestriction.identifier_code_space,
       'xml_id', routes.flightrestriction.xml_id
    ) AS flightrestrictiontype
FROM


-- FlightRestrictionTimeSlicePropertyType
LEFT JOIN routes.master_join
ON routes.flightrestriction.id = master_join.source_id
LEFT JOIN routes.flightrestriction
ON master_join.target_id = FlightRestrictionTimeSlicePropertyType.id
;

FlightRoutingElementPropertyType
CREATE OR REPLACE VIEW flightroutingelementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightroutingelement_pt.id
    ) AS flightroutingelementpropertytype
FROM

-- FlightRoutingElementType
LEFT JOIN routes.flightroutingelement_pt
ON routes.flightroutingelement_pt.flightroutingelement_id = FlightRoutingElementType.id

;

FlightRoutingElementType
CREATE OR REPLACE VIEW flightroutingelementtype_view AS
SELECT
    jsonb_build_object(
       'ordernumber_value', routes.flightroutingelement.ordernumber_value,
       'ordernumber_nilreason', routes.flightroutingelement.ordernumber_nilreason,
       'speedreference_value', routes.flightroutingelement.speedreference_value,
       'speedreference_nilreason', routes.flightroutingelement.speedreference_nilreason,
       'speedcriteria_value', routes.flightroutingelement.speedcriteria_value,
       'speedcriteria_nilreason', routes.flightroutingelement.speedcriteria_nilreason,
       'speed_value', routes.flightroutingelement.speed_value,
       'speed_uom', routes.flightroutingelement.speed_uom,
       'speed_nilreason', routes.flightroutingelement.speed_nilreason,
       'id', routes.flightroutingelement.id,
       'identifier', routes.flightroutingelement.identifier,
       'identifier_code_space', routes.flightroutingelement.identifier_code_space,
       'xml_id', routes.flightroutingelement.xml_id
    ) AS flightroutingelementtype
FROM

-- StandardInstrumentArrivalPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_standardinstrumentarrivalelement_id = StandardInstrumentArrivalPropertyType.id
-- AirspacePropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_airspaceelement_id = AirspacePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_position_id = PointPropertyType.id
-- DirectFlightSegmentPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_directflightelement_id = DirectFlightSegmentPropertyType.id
-- StandardInstrumentDeparturePropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_standardinstrumentdepartureelement_id = StandardInstrumentDeparturePropertyType.id
-- RoutePortionPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_routeportionelement_id = RoutePortionPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_airportheliportelement_id = AirportHeliportPropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_aerialrefuellingelement_id = AerialRefuellingPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.abstractflightroutingelementextension_id = AbstractExtensionType.id

-- FlightRestrictionLevelPropertyType
LEFT JOIN routes.master_join
ON routes.flightroutingelement.id = master_join.source_id
LEFT JOIN routes.flightroutingelement
ON master_join.target_id = FlightRestrictionLevelPropertyType.id
-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.flightroutingelement.id = master_join.source_id
LEFT JOIN routes.flightroutingelement
ON master_join.target_id = NotePropertyType.id
;

FloatingDockSitePropertyType
CREATE OR REPLACE VIEW floatingdocksitepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.floatingdocksite_pt.id,
       'nilReason', airport_heliport.floatingdocksite_pt.nilReason
    ) AS floatingdocksitepropertytype
FROM


;

FloatingDockSiteTimeSlicePropertyType
CREATE OR REPLACE VIEW floatingdocksitetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.floatingdocksite_tsp.id
    ) AS floatingdocksitetimeslicepropertytype
FROM

-- FloatingDockSiteTimeSliceType
LEFT JOIN airport_heliport.floatingdocksite_tsp
ON airport_heliport.floatingdocksite_tsp.floatingdocksitetimeslice_id = FloatingDockSiteTimeSliceType.id

;

FloatingDockSiteTimeSliceType
CREATE OR REPLACE VIEW floatingdocksitetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.floatingdocksite_ts.id,
       'xml_id', airport_heliport.floatingdocksite_ts.xml_id,
       'interpretation', airport_heliport.floatingdocksite_ts.interpretation,
       'sequence_number', airport_heliport.floatingdocksite_ts.sequence_number,
       'correction_number', airport_heliport.floatingdocksite_ts.correction_number,
       'valid_time_begin', airport_heliport.floatingdocksite_ts.valid_time_begin,
       'valid_time_end', airport_heliport.floatingdocksite_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.floatingdocksite_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.floatingdocksite_ts.feature_lifetime_end
    ) AS floatingdocksitetimeslicetype
FROM

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.floatingdocksite_ts
ON airport_heliport.floatingdocksite_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.floatingdocksite_ts
ON airport_heliport.floatingdocksite_ts.abstractfloatingdocksiteextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.floatingdocksite_ts.id = master_join.source_id
LEFT JOIN airport_heliport.floatingdocksite_ts
ON master_join.target_id = NotePropertyType.id
;

FloatingDockSiteType
CREATE OR REPLACE VIEW floatingdocksitetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.floatingdocksite.id,
       'identifier', airport_heliport.floatingdocksite.identifier,
       'identifier_code_space', airport_heliport.floatingdocksite.identifier_code_space,
       'xml_id', airport_heliport.floatingdocksite.xml_id
    ) AS floatingdocksitetype
FROM


-- FloatingDockSiteTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.floatingdocksite.id = master_join.source_id
LEFT JOIN airport_heliport.floatingdocksite
ON master_join.target_id = FloatingDockSiteTimeSlicePropertyType.id
;

FuelPropertyType
CREATE OR REPLACE VIEW fuelpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.fuel_pt.id
    ) AS fuelpropertytype
FROM

-- FuelType
LEFT JOIN service.fuel_pt
ON service.fuel_pt.fuel_id = FuelType.id

;

FuelType
CREATE OR REPLACE VIEW fueltype_view AS
SELECT
    jsonb_build_object(
       'category_value', service.fuel.category_value,
       'category_nilreason', service.fuel.category_nilreason,
       'id', service.fuel.id,
       'identifier', service.fuel.identifier,
       'identifier_code_space', service.fuel.identifier_code_space,
       'xml_id', service.fuel.xml_id
    ) AS fueltype
FROM

-- AbstractExtensionType
LEFT JOIN service.fuel
ON service.fuel.abstractfuelextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.master_join
ON service.fuel.id = master_join.source_id
LEFT JOIN service.fuel
ON master_join.target_id = NotePropertyType.id
;

GeoBorderPropertyType
CREATE OR REPLACE VIEW geoborderpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.geoborder_pt.id,
       'nilReason', airspace.geoborder_pt.nilReason
    ) AS geoborderpropertytype
FROM


;

GeoBorderTimeSlicePropertyType
CREATE OR REPLACE VIEW geobordertimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.geoborder_tsp.id
    ) AS geobordertimeslicepropertytype
FROM

-- GeoBorderTimeSliceType
LEFT JOIN airspace.geoborder_tsp
ON airspace.geoborder_tsp.geobordertimeslice_id = GeoBorderTimeSliceType.id

;

GeoBorderTimeSliceType
CREATE OR REPLACE VIEW geobordertimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', airspace.geoborder_ts.name_value,
       'name_nilreason', airspace.geoborder_ts.name_nilreason,
       'type_value', airspace.geoborder_ts.type_value,
       'type_nilreason', airspace.geoborder_ts.type_nilreason,
       'id', airspace.geoborder_ts.id,
       'xml_id', airspace.geoborder_ts.xml_id,
       'interpretation', airspace.geoborder_ts.interpretation,
       'sequence_number', airspace.geoborder_ts.sequence_number,
       'correction_number', airspace.geoborder_ts.correction_number,
       'valid_time_begin', airspace.geoborder_ts.valid_time_begin,
       'valid_time_end', airspace.geoborder_ts.valid_time_end,
       'feature_lifetime_begin', airspace.geoborder_ts.feature_lifetime_begin,
       'feature_lifetime_end', airspace.geoborder_ts.feature_lifetime_end
    ) AS geobordertimeslicetype
FROM

-- CurvePropertyType
LEFT JOIN airspace.geoborder_ts
ON airspace.geoborder_ts.border_id = CurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.geoborder_ts
ON airspace.geoborder_ts.abstractgeoborderextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.master_join
ON airspace.geoborder_ts.id = master_join.source_id
LEFT JOIN airspace.geoborder_ts
ON master_join.target_id = NotePropertyType.id
;

GeoBorderType
CREATE OR REPLACE VIEW geobordertype_view AS
SELECT
    jsonb_build_object(
       'id', airspace.geoborder.id,
       'identifier', airspace.geoborder.identifier,
       'identifier_code_space', airspace.geoborder.identifier_code_space,
       'xml_id', airspace.geoborder.xml_id
    ) AS geobordertype
FROM


-- GeoBorderTimeSlicePropertyType
LEFT JOIN airspace.master_join
ON airspace.geoborder.id = master_join.source_id
LEFT JOIN airspace.geoborder
ON master_join.target_id = GeoBorderTimeSlicePropertyType.id
;

GlidepathPropertyType
CREATE OR REPLACE VIEW glidepathpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.glidepath_pt.id,
       'nilReason', navaids_points.glidepath_pt.nilReason
    ) AS glidepathpropertytype
FROM


;

GlidepathTimeSlicePropertyType
CREATE OR REPLACE VIEW glidepathtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.glidepath_tsp.id
    ) AS glidepathtimeslicepropertytype
FROM

-- GlidepathTimeSliceType
LEFT JOIN navaids_points.glidepath_tsp
ON navaids_points.glidepath_tsp.glidepathtimeslice_id = GlidepathTimeSliceType.id

;

GlidepathTimeSliceType
CREATE OR REPLACE VIEW glidepathtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.glidepath_ts.designator_value,
       'designator_nilreason', navaids_points.glidepath_ts.designator_nilreason,
       'name_value', navaids_points.glidepath_ts.name_value,
       'name_nilreason', navaids_points.glidepath_ts.name_nilreason,
       'emissionclass_value', navaids_points.glidepath_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.glidepath_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.glidepath_ts.mobile_value,
       'mobile_nilreason', navaids_points.glidepath_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.glidepath_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.glidepath_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.glidepath_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.glidepath_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.glidepath_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.glidepath_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.glidepath_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.glidepath_ts.flightchecked_nilreason,
       'slope_value', navaids_points.glidepath_ts.slope_value,
       'slope_nilreason', navaids_points.glidepath_ts.slope_nilreason,
       'angleaccuracy_value', navaids_points.glidepath_ts.angleaccuracy_value,
       'angleaccuracy_nilreason', navaids_points.glidepath_ts.angleaccuracy_nilreason,
       'frequency_value', navaids_points.glidepath_ts.frequency_value,
       'frequency_uom', navaids_points.glidepath_ts.frequency_uom,
       'frequency_nilreason', navaids_points.glidepath_ts.frequency_nilreason,
       'rdh_value', navaids_points.glidepath_ts.rdh_value,
       'rdh_uom', navaids_points.glidepath_ts.rdh_uom,
       'rdh_nilreason', navaids_points.glidepath_ts.rdh_nilreason,
       'rdhaccuracy_value', navaids_points.glidepath_ts.rdhaccuracy_value,
       'rdhaccuracy_uom', navaids_points.glidepath_ts.rdhaccuracy_uom,
       'rdhaccuracy_nilreason', navaids_points.glidepath_ts.rdhaccuracy_nilreason,
       'id', navaids_points.glidepath_ts.id,
       'xml_id', navaids_points.glidepath_ts.xml_id,
       'interpretation', navaids_points.glidepath_ts.interpretation,
       'sequence_number', navaids_points.glidepath_ts.sequence_number,
       'correction_number', navaids_points.glidepath_ts.correction_number,
       'valid_time_begin', navaids_points.glidepath_ts.valid_time_begin,
       'valid_time_end', navaids_points.glidepath_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.glidepath_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.glidepath_ts.feature_lifetime_end
    ) AS glidepathtimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.glidepath_ts
ON navaids_points.glidepath_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.glidepath_ts
ON navaids_points.glidepath_ts.abstractglidepathextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.glidepath_ts
ON navaids_points.glidepath_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.glidepath_ts.id = master_join.source_id
LEFT JOIN navaids_points.glidepath_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.glidepath_ts.id = master_join.source_id
LEFT JOIN navaids_points.glidepath_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.glidepath_ts.id = master_join.source_id
LEFT JOIN navaids_points.glidepath_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.glidepath_ts.id = master_join.source_id
LEFT JOIN navaids_points.glidepath_ts
ON master_join.target_id = NotePropertyType.id
;

GlidepathType
CREATE OR REPLACE VIEW glidepathtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.glidepath.id,
       'identifier', navaids_points.glidepath.identifier,
       'identifier_code_space', navaids_points.glidepath.identifier_code_space,
       'xml_id', navaids_points.glidepath.xml_id
    ) AS glidepathtype
FROM


-- GlidepathTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.glidepath.id = master_join.source_id
LEFT JOIN navaids_points.glidepath
ON master_join.target_id = GlidepathTimeSlicePropertyType.id
;

GroundLightingAvailabilityPropertyType
CREATE OR REPLACE VIEW groundlightingavailabilitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.groundlightingavailability_pt.id
    ) AS groundlightingavailabilitypropertytype
FROM

-- GroundLightingAvailabilityType
LEFT JOIN airport_heliport.groundlightingavailability_pt
ON airport_heliport.groundlightingavailability_pt.groundlightingavailability_id = GroundLightingAvailabilityType.id

;

GroundLightingAvailabilityType
CREATE OR REPLACE VIEW groundlightingavailabilitytype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', airport_heliport.groundlightingavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.groundlightingavailability.operationalstatus_nilreason,
       'id', airport_heliport.groundlightingavailability.id,
       'identifier', airport_heliport.groundlightingavailability.identifier,
       'identifier_code_space', airport_heliport.groundlightingavailability.identifier_code_space,
       'xml_id', airport_heliport.groundlightingavailability.xml_id
    ) AS groundlightingavailabilitytype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.groundlightingavailability
ON airport_heliport.groundlightingavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.groundlightingavailability
ON airport_heliport.groundlightingavailability.abstractgroundlightingavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.groundlightingavailability.id = master_join.source_id
LEFT JOIN airport_heliport.groundlightingavailability
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.groundlightingavailability.id = master_join.source_id
LEFT JOIN airport_heliport.groundlightingavailability
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.groundlightingavailability.id = master_join.source_id
LEFT JOIN airport_heliport.groundlightingavailability
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

GroundLightSystemPropertyType
CREATE OR REPLACE VIEW groundlightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.groundlightsystem_pt.id,
       'nilReason', airport_heliport.groundlightsystem_pt.nilReason
    ) AS groundlightsystempropertytype
FROM


;

GroundTrafficControlServicePropertyType
CREATE OR REPLACE VIEW groundtrafficcontrolservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.groundtrafficcontrolservice_pt.id,
       'nilReason', service.groundtrafficcontrolservice_pt.nilReason
    ) AS groundtrafficcontrolservicepropertytype
FROM


;

GroundTrafficControlServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW groundtrafficcontrolservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.groundtrafficcontrolservice_tsp.id
    ) AS groundtrafficcontrolservicetimeslicepropertytype
FROM

-- GroundTrafficControlServiceTimeSliceType
LEFT JOIN service.groundtrafficcontrolservice_tsp
ON service.groundtrafficcontrolservice_tsp.groundtrafficcontrolservicetimeslice_id = GroundTrafficControlServiceTimeSliceType.id

;

GroundTrafficControlServiceTimeSliceType
CREATE OR REPLACE VIEW groundtrafficcontrolservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.groundtrafficcontrolservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.groundtrafficcontrolservice_ts.flightoperations_nilreason,
       'rank_value', service.groundtrafficcontrolservice_ts.rank_value,
       'rank_nilreason', service.groundtrafficcontrolservice_ts.rank_nilreason,
       'complianticao_value', service.groundtrafficcontrolservice_ts.complianticao_value,
       'complianticao_nilreason', service.groundtrafficcontrolservice_ts.complianticao_nilreason,
       'name_value', service.groundtrafficcontrolservice_ts.name_value,
       'name_nilreason', service.groundtrafficcontrolservice_ts.name_nilreason,
       'radarassisted_value', service.groundtrafficcontrolservice_ts.radarassisted_value,
       'radarassisted_nilreason', service.groundtrafficcontrolservice_ts.radarassisted_nilreason,
       'datalinkenabled_value', service.groundtrafficcontrolservice_ts.datalinkenabled_value,
       'datalinkenabled_nilreason', service.groundtrafficcontrolservice_ts.datalinkenabled_nilreason,
       'datalinkchannel_value', service.groundtrafficcontrolservice_ts.datalinkchannel_value,
       'datalinkchannel_nilreason', service.groundtrafficcontrolservice_ts.datalinkchannel_nilreason,
       'type_value', service.groundtrafficcontrolservice_ts.type_value,
       'type_nilreason', service.groundtrafficcontrolservice_ts.type_nilreason,
       'id', service.groundtrafficcontrolservice_ts.id,
       'xml_id', service.groundtrafficcontrolservice_ts.xml_id,
       'interpretation', service.groundtrafficcontrolservice_ts.interpretation,
       'sequence_number', service.groundtrafficcontrolservice_ts.sequence_number,
       'correction_number', service.groundtrafficcontrolservice_ts.correction_number,
       'valid_time_begin', service.groundtrafficcontrolservice_ts.valid_time_begin,
       'valid_time_end', service.groundtrafficcontrolservice_ts.valid_time_end,
       'feature_lifetime_begin', service.groundtrafficcontrolservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.groundtrafficcontrolservice_ts.feature_lifetime_end
    ) AS groundtrafficcontrolservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.groundtrafficcontrolservice_ts
ON service.groundtrafficcontrolservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.groundtrafficcontrolservice_ts
ON service.groundtrafficcontrolservice_ts.serviceprovider_id = UnitPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.groundtrafficcontrolservice_ts
ON service.groundtrafficcontrolservice_ts.clientairport_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.groundtrafficcontrolservice_ts
ON service.groundtrafficcontrolservice_ts.abstractgroundtrafficcontrolserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.groundtrafficcontrolservice_ts
ON service.groundtrafficcontrolservice_ts.abstracttrafficseparationserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.groundtrafficcontrolservice_ts
ON service.groundtrafficcontrolservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.groundtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.groundtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.groundtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.groundtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.groundtrafficcontrolservice_ts.id = master_join.source_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON master_join.target_id = NotePropertyType.id
;

GroundTrafficControlServiceType
CREATE OR REPLACE VIEW groundtrafficcontrolservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.groundtrafficcontrolservice.id,
       'identifier', service.groundtrafficcontrolservice.identifier,
       'identifier_code_space', service.groundtrafficcontrolservice.identifier_code_space,
       'xml_id', service.groundtrafficcontrolservice.xml_id
    ) AS groundtrafficcontrolservicetype
FROM


-- GroundTrafficControlServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.groundtrafficcontrolservice.id = master_join.source_id
LEFT JOIN service.groundtrafficcontrolservice
ON master_join.target_id = GroundTrafficControlServiceTimeSlicePropertyType.id
;

GuidanceLineLightSystemPropertyType
CREATE OR REPLACE VIEW guidancelinelightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinelightsystem_pt.id,
       'nilReason', airport_heliport.guidancelinelightsystem_pt.nilReason
    ) AS guidancelinelightsystempropertytype
FROM


;

GuidanceLineLightSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW guidancelinelightsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinelightsystem_tsp.id
    ) AS guidancelinelightsystemtimeslicepropertytype
FROM

-- GuidanceLineLightSystemTimeSliceType
LEFT JOIN airport_heliport.guidancelinelightsystem_tsp
ON airport_heliport.guidancelinelightsystem_tsp.guidancelinelightsystemtimeslice_id = GuidanceLineLightSystemTimeSliceType.id

;

GuidanceLineLightSystemTimeSliceType
CREATE OR REPLACE VIEW guidancelinelightsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.guidancelinelightsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.guidancelinelightsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.guidancelinelightsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.guidancelinelightsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.guidancelinelightsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.guidancelinelightsystem_ts.colour_nilreason,
       'id', airport_heliport.guidancelinelightsystem_ts.id,
       'xml_id', airport_heliport.guidancelinelightsystem_ts.xml_id,
       'interpretation', airport_heliport.guidancelinelightsystem_ts.interpretation,
       'sequence_number', airport_heliport.guidancelinelightsystem_ts.sequence_number,
       'correction_number', airport_heliport.guidancelinelightsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.guidancelinelightsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.guidancelinelightsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.guidancelinelightsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.guidancelinelightsystem_ts.feature_lifetime_end
    ) AS guidancelinelightsystemtimeslicetype
FROM

-- GuidanceLinePropertyType
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON airport_heliport.guidancelinelightsystem_ts.lightedguidanceline_id = GuidanceLinePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON airport_heliport.guidancelinelightsystem_ts.abstractguidancelinelightsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON airport_heliport.guidancelinelightsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidancelinelightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidancelinelightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidancelinelightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON master_join.target_id = NotePropertyType.id
;

GuidanceLineLightSystemType
CREATE OR REPLACE VIEW guidancelinelightsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinelightsystem.id,
       'identifier', airport_heliport.guidancelinelightsystem.identifier,
       'identifier_code_space', airport_heliport.guidancelinelightsystem.identifier_code_space,
       'xml_id', airport_heliport.guidancelinelightsystem.xml_id
    ) AS guidancelinelightsystemtype
FROM


-- GuidanceLineLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidancelinelightsystem.id = master_join.source_id
LEFT JOIN airport_heliport.guidancelinelightsystem
ON master_join.target_id = GuidanceLineLightSystemTimeSlicePropertyType.id
;

GuidanceLineMarkingPropertyType
CREATE OR REPLACE VIEW guidancelinemarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinemarking_pt.id,
       'nilReason', airport_heliport.guidancelinemarking_pt.nilReason
    ) AS guidancelinemarkingpropertytype
FROM


;

GuidanceLineMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW guidancelinemarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinemarking_tsp.id
    ) AS guidancelinemarkingtimeslicepropertytype
FROM

-- GuidanceLineMarkingTimeSliceType
LEFT JOIN airport_heliport.guidancelinemarking_tsp
ON airport_heliport.guidancelinemarking_tsp.guidancelinemarkingtimeslice_id = GuidanceLineMarkingTimeSliceType.id

;

GuidanceLineMarkingTimeSliceType
CREATE OR REPLACE VIEW guidancelinemarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.guidancelinemarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.guidancelinemarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.guidancelinemarking_ts.condition_value,
       'condition_nilreason', airport_heliport.guidancelinemarking_ts.condition_nilreason,
       'id', airport_heliport.guidancelinemarking_ts.id,
       'xml_id', airport_heliport.guidancelinemarking_ts.xml_id,
       'interpretation', airport_heliport.guidancelinemarking_ts.interpretation,
       'sequence_number', airport_heliport.guidancelinemarking_ts.sequence_number,
       'correction_number', airport_heliport.guidancelinemarking_ts.correction_number,
       'valid_time_begin', airport_heliport.guidancelinemarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.guidancelinemarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.guidancelinemarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.guidancelinemarking_ts.feature_lifetime_end
    ) AS guidancelinemarkingtimeslicetype
FROM

-- GuidanceLinePropertyType
LEFT JOIN airport_heliport.guidancelinemarking_ts
ON airport_heliport.guidancelinemarking_ts.markedguidanceline_id = GuidanceLinePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.guidancelinemarking_ts
ON airport_heliport.guidancelinemarking_ts.abstractguidancelinemarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.guidancelinemarking_ts
ON airport_heliport.guidancelinemarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidancelinemarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidancelinemarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidancelinemarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidancelinemarking_ts
ON master_join.target_id = NotePropertyType.id
;

GuidanceLineMarkingType
CREATE OR REPLACE VIEW guidancelinemarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinemarking.id,
       'identifier', airport_heliport.guidancelinemarking.identifier,
       'identifier_code_space', airport_heliport.guidancelinemarking.identifier_code_space,
       'xml_id', airport_heliport.guidancelinemarking.xml_id
    ) AS guidancelinemarkingtype
FROM


-- GuidanceLineMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidancelinemarking.id = master_join.source_id
LEFT JOIN airport_heliport.guidancelinemarking
ON master_join.target_id = GuidanceLineMarkingTimeSlicePropertyType.id
;

GuidanceLinePropertyType
CREATE OR REPLACE VIEW guidancelinepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidanceline_pt.id,
       'nilReason', airport_heliport.guidanceline_pt.nilReason
    ) AS guidancelinepropertytype
FROM


;

GuidanceLineTimeSlicePropertyType
CREATE OR REPLACE VIEW guidancelinetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidanceline_tsp.id
    ) AS guidancelinetimeslicepropertytype
FROM

-- GuidanceLineTimeSliceType
LEFT JOIN airport_heliport.guidanceline_tsp
ON airport_heliport.guidanceline_tsp.guidancelinetimeslice_id = GuidanceLineTimeSliceType.id

;

GuidanceLineTimeSliceType
CREATE OR REPLACE VIEW guidancelinetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.guidanceline_ts.designator_value,
       'designator_nilreason', airport_heliport.guidanceline_ts.designator_nilreason,
       'type_value', airport_heliport.guidanceline_ts.type_value,
       'type_nilreason', airport_heliport.guidanceline_ts.type_nilreason,
       'usagedirection_value', airport_heliport.guidanceline_ts.usagedirection_value,
       'usagedirection_nilreason', airport_heliport.guidanceline_ts.usagedirection_nilreason,
       'maxspeed_value', airport_heliport.guidanceline_ts.maxspeed_value,
       'maxspeed_uom', airport_heliport.guidanceline_ts.maxspeed_uom,
       'maxspeed_nilreason', airport_heliport.guidanceline_ts.maxspeed_nilreason,
       'id', airport_heliport.guidanceline_ts.id,
       'xml_id', airport_heliport.guidanceline_ts.xml_id,
       'interpretation', airport_heliport.guidanceline_ts.interpretation,
       'sequence_number', airport_heliport.guidanceline_ts.sequence_number,
       'correction_number', airport_heliport.guidanceline_ts.correction_number,
       'valid_time_begin', airport_heliport.guidanceline_ts.valid_time_begin,
       'valid_time_end', airport_heliport.guidanceline_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.guidanceline_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.guidanceline_ts.feature_lifetime_end
    ) AS guidancelinetimeslicetype
FROM

-- ElevatedCurvePropertyType
LEFT JOIN airport_heliport.guidanceline_ts
ON airport_heliport.guidanceline_ts.extent_id = ElevatedCurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.guidanceline_ts
ON airport_heliport.guidanceline_ts.abstractguidancelineextension_id = AbstractExtensionType.id

-- TouchDownLiftOffPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidanceline_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidanceline_ts
ON master_join.target_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidanceline_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidanceline_ts
ON master_join.target_id = RunwayCentrelinePointPropertyType.id
-- ApronPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidanceline_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidanceline_ts
ON master_join.target_id = ApronPropertyType.id
-- AircraftStandPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidanceline_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidanceline_ts
ON master_join.target_id = AircraftStandPropertyType.id
-- TaxiwayPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidanceline_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidanceline_ts
ON master_join.target_id = TaxiwayPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidanceline_ts.id = master_join.source_id
LEFT JOIN airport_heliport.guidanceline_ts
ON master_join.target_id = NotePropertyType.id
;

GuidanceLineType
CREATE OR REPLACE VIEW guidancelinetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidanceline.id,
       'identifier', airport_heliport.guidanceline.identifier,
       'identifier_code_space', airport_heliport.guidanceline.identifier_code_space,
       'xml_id', airport_heliport.guidanceline.xml_id
    ) AS guidancelinetype
FROM


-- GuidanceLineTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.guidanceline.id = master_join.source_id
LEFT JOIN airport_heliport.guidanceline
ON master_join.target_id = GuidanceLineTimeSlicePropertyType.id
;

HoldingAssessmentPropertyType
CREATE OR REPLACE VIEW holdingassessmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.holdingassessment_pt.id,
       'nilReason', shared.holdingassessment_pt.nilReason
    ) AS holdingassessmentpropertytype
FROM


;

HoldingAssessmentTimeSlicePropertyType
CREATE OR REPLACE VIEW holdingassessmenttimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.holdingassessment_tsp.id
    ) AS holdingassessmenttimeslicepropertytype
FROM

-- HoldingAssessmentTimeSliceType
LEFT JOIN shared.holdingassessment_tsp
ON shared.holdingassessment_tsp.holdingassessmenttimeslice_id = HoldingAssessmentTimeSliceType.id

;

HoldingAssessmentTimeSliceType
CREATE OR REPLACE VIEW holdingassessmenttimeslicetype_view AS
SELECT
    jsonb_build_object(
       'upperlimitreference_value', shared.holdingassessment_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', shared.holdingassessment_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', shared.holdingassessment_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', shared.holdingassessment_ts.lowerlimitreference_nilreason,
       'patterntemplate_value', shared.holdingassessment_ts.patterntemplate_value,
       'patterntemplate_nilreason', shared.holdingassessment_ts.patterntemplate_nilreason,
       'turbulentair_value', shared.holdingassessment_ts.turbulentair_value,
       'turbulentair_nilreason', shared.holdingassessment_ts.turbulentair_nilreason,
       'upperlimit_value', shared.holdingassessment_ts.upperlimit_value,
       'upperlimit_uom', shared.holdingassessment_ts.upperlimit_uom,
       'upperlimit_nilreason', shared.holdingassessment_ts.upperlimit_nilreason,
       'lowerlimit_value', shared.holdingassessment_ts.lowerlimit_value,
       'lowerlimit_uom', shared.holdingassessment_ts.lowerlimit_uom,
       'lowerlimit_nilreason', shared.holdingassessment_ts.lowerlimit_nilreason,
       'speedlimit_value', shared.holdingassessment_ts.speedlimit_value,
       'speedlimit_uom', shared.holdingassessment_ts.speedlimit_uom,
       'speedlimit_nilreason', shared.holdingassessment_ts.speedlimit_nilreason,
       'leglengthtoward_value', shared.holdingassessment_ts.leglengthtoward_value,
       'leglengthtoward_uom', shared.holdingassessment_ts.leglengthtoward_uom,
       'leglengthtoward_nilreason', shared.holdingassessment_ts.leglengthtoward_nilreason,
       'leglengthaway_value', shared.holdingassessment_ts.leglengthaway_value,
       'leglengthaway_uom', shared.holdingassessment_ts.leglengthaway_uom,
       'leglengthaway_nilreason', shared.holdingassessment_ts.leglengthaway_nilreason,
       'id', shared.holdingassessment_ts.id,
       'xml_id', shared.holdingassessment_ts.xml_id,
       'interpretation', shared.holdingassessment_ts.interpretation,
       'sequence_number', shared.holdingassessment_ts.sequence_number,
       'correction_number', shared.holdingassessment_ts.correction_number,
       'valid_time_begin', shared.holdingassessment_ts.valid_time_begin,
       'valid_time_end', shared.holdingassessment_ts.valid_time_end,
       'feature_lifetime_begin', shared.holdingassessment_ts.feature_lifetime_begin,
       'feature_lifetime_end', shared.holdingassessment_ts.feature_lifetime_end
    ) AS holdingassessmenttimeslicetype
FROM

-- SegmentPointPropertyType
LEFT JOIN shared.holdingassessment_ts
ON shared.holdingassessment_ts.holdingpoint_id = SegmentPointPropertyType.id
-- UnplannedHoldingPropertyType
LEFT JOIN shared.holdingassessment_ts
ON shared.holdingassessment_ts.unplannedholding_id = UnplannedHoldingPropertyType.id
-- HoldingPatternPropertyType
LEFT JOIN shared.holdingassessment_ts
ON shared.holdingassessment_ts.assessedholdingpattern_id = HoldingPatternPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.holdingassessment_ts
ON shared.holdingassessment_ts.abstractholdingassessmentextension_id = AbstractExtensionType.id

-- ObstacleAssessmentAreaPropertyType
LEFT JOIN shared.master_join
ON shared.holdingassessment_ts.id = master_join.source_id
LEFT JOIN shared.holdingassessment_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.holdingassessment_ts.id = master_join.source_id
LEFT JOIN shared.holdingassessment_ts
ON master_join.target_id = NotePropertyType.id
;

HoldingAssessmentType
CREATE OR REPLACE VIEW holdingassessmenttype_view AS
SELECT
    jsonb_build_object(
       'id', shared.holdingassessment.id,
       'identifier', shared.holdingassessment.identifier,
       'identifier_code_space', shared.holdingassessment.identifier_code_space,
       'xml_id', shared.holdingassessment.xml_id
    ) AS holdingassessmenttype
FROM


-- HoldingAssessmentTimeSlicePropertyType
LEFT JOIN shared.master_join
ON shared.holdingassessment.id = master_join.source_id
LEFT JOIN shared.holdingassessment
ON master_join.target_id = HoldingAssessmentTimeSlicePropertyType.id
;

HoldingPatternDistancePropertyType
CREATE OR REPLACE VIEW holdingpatterndistancepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpatterndistance_pt.id
    ) AS holdingpatterndistancepropertytype
FROM

-- HoldingPatternDistanceType
LEFT JOIN holding.holdingpatterndistance_pt
ON holding.holdingpatterndistance_pt.holdingpatterndistance_id = HoldingPatternDistanceType.id

;

HoldingPatternDistanceType
CREATE OR REPLACE VIEW holdingpatterndistancetype_view AS
SELECT
    jsonb_build_object(
       'length_value', holding.holdingpatterndistance.length_value,
       'length_uom', holding.holdingpatterndistance.length_uom,
       'length_nilreason', holding.holdingpatterndistance.length_nilreason,
       'id', holding.holdingpatterndistance.id,
       'identifier', holding.holdingpatterndistance.identifier,
       'identifier_code_space', holding.holdingpatterndistance.identifier_code_space,
       'xml_id', holding.holdingpatterndistance.xml_id
    ) AS holdingpatterndistancetype
FROM

-- AbstractExtensionType
LEFT JOIN holding.holdingpatterndistance
ON holding.holdingpatterndistance.abstractholdingpatterndistanceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN holding.master_join
ON holding.holdingpatterndistance.id = master_join.source_id
LEFT JOIN holding.holdingpatterndistance
ON master_join.target_id = NotePropertyType.id
;

HoldingPatternDurationPropertyType
CREATE OR REPLACE VIEW holdingpatterndurationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpatternduration_pt.id
    ) AS holdingpatterndurationpropertytype
FROM

-- HoldingPatternDurationType
LEFT JOIN holding.holdingpatternduration_pt
ON holding.holdingpatternduration_pt.holdingpatternduration_id = HoldingPatternDurationType.id

;

HoldingPatternDurationType
CREATE OR REPLACE VIEW holdingpatterndurationtype_view AS
SELECT
    jsonb_build_object(
       'duration_value', holding.holdingpatternduration.duration_value,
       'duration_uom', holding.holdingpatternduration.duration_uom,
       'duration_nilreason', holding.holdingpatternduration.duration_nilreason,
       'id', holding.holdingpatternduration.id,
       'identifier', holding.holdingpatternduration.identifier,
       'identifier_code_space', holding.holdingpatternduration.identifier_code_space,
       'xml_id', holding.holdingpatternduration.xml_id
    ) AS holdingpatterndurationtype
FROM

-- AbstractExtensionType
LEFT JOIN holding.holdingpatternduration
ON holding.holdingpatternduration.abstractholdingpatterndurationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN holding.master_join
ON holding.holdingpatternduration.id = master_join.source_id
LEFT JOIN holding.holdingpatternduration
ON master_join.target_id = NotePropertyType.id
;

HoldingPatternPropertyType
CREATE OR REPLACE VIEW holdingpatternpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpattern_pt.id,
       'nilReason', holding.holdingpattern_pt.nilReason
    ) AS holdingpatternpropertytype
FROM


;

HoldingPatternTimeSlicePropertyType
CREATE OR REPLACE VIEW holdingpatterntimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpattern_tsp.id
    ) AS holdingpatterntimeslicepropertytype
FROM

-- HoldingPatternTimeSliceType
LEFT JOIN holding.holdingpattern_tsp
ON holding.holdingpattern_tsp.holdingpatterntimeslice_id = HoldingPatternTimeSliceType.id

;

HoldingPatternTimeSliceType
CREATE OR REPLACE VIEW holdingpatterntimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', holding.holdingpattern_ts.type_value,
       'type_nilreason', holding.holdingpattern_ts.type_nilreason,
       'outboundcourse_value', holding.holdingpattern_ts.outboundcourse_value,
       'outboundcourse_nilreason', holding.holdingpattern_ts.outboundcourse_nilreason,
       'outboundcoursetype_value', holding.holdingpattern_ts.outboundcoursetype_value,
       'outboundcoursetype_nilreason', holding.holdingpattern_ts.outboundcoursetype_nilreason,
       'inboundcourse_value', holding.holdingpattern_ts.inboundcourse_value,
       'inboundcourse_nilreason', holding.holdingpattern_ts.inboundcourse_nilreason,
       'turndirection_value', holding.holdingpattern_ts.turndirection_value,
       'turndirection_nilreason', holding.holdingpattern_ts.turndirection_nilreason,
       'upperlimitreference_value', holding.holdingpattern_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', holding.holdingpattern_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', holding.holdingpattern_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', holding.holdingpattern_ts.lowerlimitreference_nilreason,
       'instruction_value', holding.holdingpattern_ts.instruction_value,
       'instruction_nilreason', holding.holdingpattern_ts.instruction_nilreason,
       'nonstandardholding_value', holding.holdingpattern_ts.nonstandardholding_value,
       'nonstandardholding_nilreason', holding.holdingpattern_ts.nonstandardholding_nilreason,
       'upperlimit_value', holding.holdingpattern_ts.upperlimit_value,
       'upperlimit_uom', holding.holdingpattern_ts.upperlimit_uom,
       'upperlimit_nilreason', holding.holdingpattern_ts.upperlimit_nilreason,
       'lowerlimit_value', holding.holdingpattern_ts.lowerlimit_value,
       'lowerlimit_uom', holding.holdingpattern_ts.lowerlimit_uom,
       'lowerlimit_nilreason', holding.holdingpattern_ts.lowerlimit_nilreason,
       'speedlimit_value', holding.holdingpattern_ts.speedlimit_value,
       'speedlimit_uom', holding.holdingpattern_ts.speedlimit_uom,
       'speedlimit_nilreason', holding.holdingpattern_ts.speedlimit_nilreason,
       'id', holding.holdingpattern_ts.id,
       'xml_id', holding.holdingpattern_ts.xml_id,
       'interpretation', holding.holdingpattern_ts.interpretation,
       'sequence_number', holding.holdingpattern_ts.sequence_number,
       'correction_number', holding.holdingpattern_ts.correction_number,
       'valid_time_begin', holding.holdingpattern_ts.valid_time_begin,
       'valid_time_end', holding.holdingpattern_ts.valid_time_end,
       'feature_lifetime_begin', holding.holdingpattern_ts.feature_lifetime_begin,
       'feature_lifetime_end', holding.holdingpattern_ts.feature_lifetime_end
    ) AS holdingpatterntimeslicetype
FROM

-- HoldingPatternDurationPropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.outboundlegspan_endtime_id = HoldingPatternDurationPropertyType.id
-- HoldingPatternDistancePropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.outboundlegspan_enddistance_id = HoldingPatternDistancePropertyType.id
-- SegmentPointPropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.outboundlegspan_endpoint_id = SegmentPointPropertyType.id
-- SegmentPointPropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.holdingpoint_id = SegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.extent_id = CurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.abstractholdingpatternextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN holding.master_join
ON holding.holdingpattern_ts.id = master_join.source_id
LEFT JOIN holding.holdingpattern_ts
ON master_join.target_id = NotePropertyType.id
;

HoldingPatternType
CREATE OR REPLACE VIEW holdingpatterntype_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpattern.id,
       'identifier', holding.holdingpattern.identifier,
       'identifier_code_space', holding.holdingpattern.identifier_code_space,
       'xml_id', holding.holdingpattern.xml_id
    ) AS holdingpatterntype
FROM


-- HoldingPatternTimeSlicePropertyType
LEFT JOIN holding.master_join
ON holding.holdingpattern.id = master_join.source_id
LEFT JOIN holding.holdingpattern
ON master_join.target_id = HoldingPatternTimeSlicePropertyType.id
;

HoldingUsePropertyType
CREATE OR REPLACE VIEW holdingusepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.holdinguse_pt.id
    ) AS holdingusepropertytype
FROM

-- HoldingUseType
LEFT JOIN procedure.holdinguse_pt
ON procedure.holdinguse_pt.holdinguse_id = HoldingUseType.id

;

HoldingUseType
CREATE OR REPLACE VIEW holdingusetype_view AS
SELECT
    jsonb_build_object(
       'holdinguse_value', procedure.holdinguse.holdinguse_value,
       'holdinguse_nilreason', procedure.holdinguse.holdinguse_nilreason,
       'instruction_value', procedure.holdinguse.instruction_value,
       'instruction_nilreason', procedure.holdinguse.instruction_nilreason,
       'instructionaltitudereference_value', procedure.holdinguse.instructionaltitudereference_value,
       'instructionaltitudereference_nilreason', procedure.holdinguse.instructionaltitudereference_nilreason,
       'instructedaltitude_value', procedure.holdinguse.instructedaltitude_value,
       'instructedaltitude_uom', procedure.holdinguse.instructedaltitude_uom,
       'instructedaltitude_nilreason', procedure.holdinguse.instructedaltitude_nilreason,
       'id', procedure.holdinguse.id,
       'identifier', procedure.holdinguse.identifier,
       'identifier_code_space', procedure.holdinguse.identifier_code_space,
       'xml_id', procedure.holdinguse.xml_id
    ) AS holdingusetype
FROM

-- HoldingPatternPropertyType
LEFT JOIN procedure.holdinguse
ON procedure.holdinguse.theholdingpattern_id = HoldingPatternPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.holdinguse
ON procedure.holdinguse.abstractholdinguseextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.holdinguse.id = master_join.source_id
LEFT JOIN procedure.holdinguse
ON master_join.target_id = NotePropertyType.id
;

InformationServicePropertyType
CREATE OR REPLACE VIEW informationservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.informationservice_pt.id,
       'nilReason', service.informationservice_pt.nilReason
    ) AS informationservicepropertytype
FROM


;

InformationServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW informationservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.informationservice_tsp.id
    ) AS informationservicetimeslicepropertytype
FROM

-- InformationServiceTimeSliceType
LEFT JOIN service.informationservice_tsp
ON service.informationservice_tsp.informationservicetimeslice_id = InformationServiceTimeSliceType.id

;

InformationServiceTimeSliceType
CREATE OR REPLACE VIEW informationservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.informationservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.informationservice_ts.flightoperations_nilreason,
       'rank_value', service.informationservice_ts.rank_value,
       'rank_nilreason', service.informationservice_ts.rank_nilreason,
       'complianticao_value', service.informationservice_ts.complianticao_value,
       'complianticao_nilreason', service.informationservice_ts.complianticao_nilreason,
       'name_value', service.informationservice_ts.name_value,
       'name_nilreason', service.informationservice_ts.name_nilreason,
       'type_value', service.informationservice_ts.type_value,
       'type_nilreason', service.informationservice_ts.type_nilreason,
       'voice_value', service.informationservice_ts.voice_value,
       'voice_nilreason', service.informationservice_ts.voice_nilreason,
       'datalink_value', service.informationservice_ts.datalink_value,
       'datalink_nilreason', service.informationservice_ts.datalink_nilreason,
       'recorded_value', service.informationservice_ts.recorded_value,
       'recorded_nilreason', service.informationservice_ts.recorded_nilreason,
       'id', service.informationservice_ts.id,
       'xml_id', service.informationservice_ts.xml_id,
       'interpretation', service.informationservice_ts.interpretation,
       'sequence_number', service.informationservice_ts.sequence_number,
       'correction_number', service.informationservice_ts.correction_number,
       'valid_time_begin', service.informationservice_ts.valid_time_begin,
       'valid_time_end', service.informationservice_ts.valid_time_end,
       'feature_lifetime_begin', service.informationservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.informationservice_ts.feature_lifetime_end
    ) AS informationservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.informationservice_ts
ON service.informationservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.informationservice_ts
ON service.informationservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.informationservice_ts
ON service.informationservice_ts.abstractinformationserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.informationservice_ts
ON service.informationservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = NotePropertyType.id
-- VORPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = VORPropertyType.id
-- AirspacePropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = AirspacePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = RoutePortionPropertyType.id
-- ProcedurePropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = ProcedurePropertyType.id
-- HoldingPatternPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = HoldingPatternPropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN service.master_join
ON service.informationservice_ts.id = master_join.source_id
LEFT JOIN service.informationservice_ts
ON master_join.target_id = AerialRefuellingPropertyType.id
;

InformationServiceType
CREATE OR REPLACE VIEW informationservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.informationservice.id,
       'identifier', service.informationservice.identifier,
       'identifier_code_space', service.informationservice.identifier_code_space,
       'xml_id', service.informationservice.xml_id
    ) AS informationservicetype
FROM


-- InformationServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.informationservice.id = master_join.source_id
LEFT JOIN service.informationservice
ON master_join.target_id = InformationServiceTimeSlicePropertyType.id
;

InitialLegPropertyType
CREATE OR REPLACE VIEW initiallegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.initialleg_pt.id,
       'nilReason', procedure.initialleg_pt.nilReason
    ) AS initiallegpropertytype
FROM


;

InitialLegTimeSlicePropertyType
CREATE OR REPLACE VIEW initiallegtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.initialleg_tsp.id
    ) AS initiallegtimeslicepropertytype
FROM

-- InitialLegTimeSliceType
LEFT JOIN procedure.initialleg_tsp
ON procedure.initialleg_tsp.initiallegtimeslice_id = InitialLegTimeSliceType.id

;

InitialLegTimeSliceType
CREATE OR REPLACE VIEW initiallegtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'endconditiondesignator_value', procedure.initialleg_ts.endconditiondesignator_value,
       'endconditiondesignator_nilreason', procedure.initialleg_ts.endconditiondesignator_nilreason,
       'legpath_value', procedure.initialleg_ts.legpath_value,
       'legpath_nilreason', procedure.initialleg_ts.legpath_nilreason,
       'legtypearinc_value', procedure.initialleg_ts.legtypearinc_value,
       'legtypearinc_nilreason', procedure.initialleg_ts.legtypearinc_nilreason,
       'course_value', procedure.initialleg_ts.course_value,
       'course_nilreason', procedure.initialleg_ts.course_nilreason,
       'coursetype_value', procedure.initialleg_ts.coursetype_value,
       'coursetype_nilreason', procedure.initialleg_ts.coursetype_nilreason,
       'coursedirection_value', procedure.initialleg_ts.coursedirection_value,
       'coursedirection_nilreason', procedure.initialleg_ts.coursedirection_nilreason,
       'turndirection_value', procedure.initialleg_ts.turndirection_value,
       'turndirection_nilreason', procedure.initialleg_ts.turndirection_nilreason,
       'speedreference_value', procedure.initialleg_ts.speedreference_value,
       'speedreference_nilreason', procedure.initialleg_ts.speedreference_nilreason,
       'speedinterpretation_value', procedure.initialleg_ts.speedinterpretation_value,
       'speedinterpretation_nilreason', procedure.initialleg_ts.speedinterpretation_nilreason,
       'bankangle_value', procedure.initialleg_ts.bankangle_value,
       'bankangle_nilreason', procedure.initialleg_ts.bankangle_nilreason,
       'procedureturnrequired_value', procedure.initialleg_ts.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.initialleg_ts.procedureturnrequired_nilreason,
       'upperlimitreference_value', procedure.initialleg_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', procedure.initialleg_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', procedure.initialleg_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', procedure.initialleg_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', procedure.initialleg_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', procedure.initialleg_ts.altitudeinterpretation_nilreason,
       'altitudeoverridereference_value', procedure.initialleg_ts.altitudeoverridereference_value,
       'altitudeoverridereference_nilreason', procedure.initialleg_ts.altitudeoverridereference_nilreason,
       'verticalangle_value', procedure.initialleg_ts.verticalangle_value,
       'verticalangle_nilreason', procedure.initialleg_ts.verticalangle_nilreason,
       'requirednavigationperformance_value', procedure.initialleg_ts.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', procedure.initialleg_ts.requirednavigationperformance_nilreason,
       'speedlimit_value', procedure.initialleg_ts.speedlimit_value,
       'speedlimit_uom', procedure.initialleg_ts.speedlimit_uom,
       'speedlimit_nilreason', procedure.initialleg_ts.speedlimit_nilreason,
       'length_value', procedure.initialleg_ts.length_value,
       'length_uom', procedure.initialleg_ts.length_uom,
       'length_nilreason', procedure.initialleg_ts.length_nilreason,
       'duration_value', procedure.initialleg_ts.duration_value,
       'duration_uom', procedure.initialleg_ts.duration_uom,
       'duration_nilreason', procedure.initialleg_ts.duration_nilreason,
       'upperlimitaltitude_value', procedure.initialleg_ts.upperlimitaltitude_value,
       'upperlimitaltitude_uom', procedure.initialleg_ts.upperlimitaltitude_uom,
       'upperlimitaltitude_nilreason', procedure.initialleg_ts.upperlimitaltitude_nilreason,
       'lowerlimitaltitude_value', procedure.initialleg_ts.lowerlimitaltitude_value,
       'lowerlimitaltitude_uom', procedure.initialleg_ts.lowerlimitaltitude_uom,
       'lowerlimitaltitude_nilreason', procedure.initialleg_ts.lowerlimitaltitude_nilreason,
       'altitudeoverrideatc_value', procedure.initialleg_ts.altitudeoverrideatc_value,
       'altitudeoverrideatc_uom', procedure.initialleg_ts.altitudeoverrideatc_uom,
       'altitudeoverrideatc_nilreason', procedure.initialleg_ts.altitudeoverrideatc_nilreason,
       'id', procedure.initialleg_ts.id,
       'xml_id', procedure.initialleg_ts.xml_id,
       'interpretation', procedure.initialleg_ts.interpretation,
       'sequence_number', procedure.initialleg_ts.sequence_number,
       'correction_number', procedure.initialleg_ts.correction_number,
       'valid_time_begin', procedure.initialleg_ts.valid_time_begin,
       'valid_time_end', procedure.initialleg_ts.valid_time_end,
       'feature_lifetime_begin', procedure.initialleg_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.initialleg_ts.feature_lifetime_end
    ) AS initiallegtimeslicetype
FROM

-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.startpoint_id = TerminalSegmentPointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.endpoint_id = TerminalSegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.trajectory_id = CurvePropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.arccentre_id = TerminalSegmentPointPropertyType.id
-- AngleIndicationPropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.angle_id = AngleIndicationPropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.distance_id = DistanceIndicationPropertyType.id
-- HoldingUsePropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.holding_id = HoldingUsePropertyType.id
-- InstrumentApproachProcedurePropertyType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.approach_id = InstrumentApproachProcedurePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.abstractinitiallegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.abstractapproachlegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.initialleg_ts
ON procedure.initialleg_ts.abstractsegmentlegextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.initialleg_ts.id = master_join.source_id
LEFT JOIN procedure.initialleg_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.initialleg_ts.id = master_join.source_id
LEFT JOIN procedure.initialleg_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.initialleg_ts.id = master_join.source_id
LEFT JOIN procedure.initialleg_ts
ON master_join.target_id = NotePropertyType.id
;

InitialLegType
CREATE OR REPLACE VIEW initiallegtype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.initialleg.id,
       'identifier', procedure.initialleg.identifier,
       'identifier_code_space', procedure.initialleg.identifier_code_space,
       'xml_id', procedure.initialleg.xml_id
    ) AS initiallegtype
FROM


-- InitialLegTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.initialleg.id = master_join.source_id
LEFT JOIN procedure.initialleg
ON master_join.target_id = InitialLegTimeSlicePropertyType.id
;

InstrumentApproachProcedurePropertyType
CREATE OR REPLACE VIEW instrumentapproachprocedurepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.instrumentapproachprocedure_pt.id,
       'nilReason', procedure.instrumentapproachprocedure_pt.nilReason
    ) AS instrumentapproachprocedurepropertytype
FROM


;

InstrumentApproachProcedureTimeSlicePropertyType
CREATE OR REPLACE VIEW instrumentapproachproceduretimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.instrumentapproachprocedure_tsp.id
    ) AS instrumentapproachproceduretimeslicepropertytype
FROM

-- InstrumentApproachProcedureTimeSliceType
LEFT JOIN procedure.instrumentapproachprocedure_tsp
ON procedure.instrumentapproachprocedure_tsp.instrumentapproachproceduretimeslice_id = InstrumentApproachProcedureTimeSliceType.id

;

InstrumentApproachProcedureTimeSliceType
CREATE OR REPLACE VIEW instrumentapproachproceduretimeslicetype_view AS
SELECT
    jsonb_build_object(
       'communicationfailureinstruction_value', procedure.instrumentapproachprocedure_ts.communicationfailureinstruction_value,
       'communicationfailureinstruction_nilreason', procedure.instrumentapproachprocedure_ts.communicationfailureinstruction_nilreason,
       'instruction_value', procedure.instrumentapproachprocedure_ts.instruction_value,
       'instruction_nilreason', procedure.instrumentapproachprocedure_ts.instruction_nilreason,
       'designcriteria_value', procedure.instrumentapproachprocedure_ts.designcriteria_value,
       'designcriteria_nilreason', procedure.instrumentapproachprocedure_ts.designcriteria_nilreason,
       'codingstandard_value', procedure.instrumentapproachprocedure_ts.codingstandard_value,
       'codingstandard_nilreason', procedure.instrumentapproachprocedure_ts.codingstandard_nilreason,
       'flightchecked_value', procedure.instrumentapproachprocedure_ts.flightchecked_value,
       'flightchecked_nilreason', procedure.instrumentapproachprocedure_ts.flightchecked_nilreason,
       'name_value', procedure.instrumentapproachprocedure_ts.name_value,
       'name_nilreason', procedure.instrumentapproachprocedure_ts.name_nilreason,
       'rnav_value', procedure.instrumentapproachprocedure_ts.rnav_value,
       'rnav_nilreason', procedure.instrumentapproachprocedure_ts.rnav_nilreason,
       'approachprefix_value', procedure.instrumentapproachprocedure_ts.approachprefix_value,
       'approachprefix_nilreason', procedure.instrumentapproachprocedure_ts.approachprefix_nilreason,
       'approachtype_value', procedure.instrumentapproachprocedure_ts.approachtype_value,
       'approachtype_nilreason', procedure.instrumentapproachprocedure_ts.approachtype_nilreason,
       'multipleidentification_value', procedure.instrumentapproachprocedure_ts.multipleidentification_value,
       'multipleidentification_nilreason', procedure.instrumentapproachprocedure_ts.multipleidentification_nilreason,
       'coptertrack_value', procedure.instrumentapproachprocedure_ts.coptertrack_value,
       'coptertrack_nilreason', procedure.instrumentapproachprocedure_ts.coptertrack_nilreason,
       'circlingidentification_value', procedure.instrumentapproachprocedure_ts.circlingidentification_value,
       'circlingidentification_nilreason', procedure.instrumentapproachprocedure_ts.circlingidentification_nilreason,
       'coursereversalinstruction_value', procedure.instrumentapproachprocedure_ts.coursereversalinstruction_value,
       'coursereversalinstruction_nilreason', procedure.instrumentapproachprocedure_ts.coursereversalinstruction_nilreason,
       'additionalequipment_value', procedure.instrumentapproachprocedure_ts.additionalequipment_value,
       'additionalequipment_nilreason', procedure.instrumentapproachprocedure_ts.additionalequipment_nilreason,
       'channelgnss_value', procedure.instrumentapproachprocedure_ts.channelgnss_value,
       'channelgnss_nilreason', procedure.instrumentapproachprocedure_ts.channelgnss_nilreason,
       'waasreliable_value', procedure.instrumentapproachprocedure_ts.waasreliable_value,
       'waasreliable_nilreason', procedure.instrumentapproachprocedure_ts.waasreliable_nilreason,
       'id', procedure.instrumentapproachprocedure_ts.id,
       'xml_id', procedure.instrumentapproachprocedure_ts.xml_id,
       'interpretation', procedure.instrumentapproachprocedure_ts.interpretation,
       'sequence_number', procedure.instrumentapproachprocedure_ts.sequence_number,
       'correction_number', procedure.instrumentapproachprocedure_ts.correction_number,
       'valid_time_begin', procedure.instrumentapproachprocedure_ts.valid_time_begin,
       'valid_time_end', procedure.instrumentapproachprocedure_ts.valid_time_end,
       'feature_lifetime_begin', procedure.instrumentapproachprocedure_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.instrumentapproachprocedure_ts.feature_lifetime_end
    ) AS instrumentapproachproceduretimeslicetype
FROM

-- NavaidPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.guidancefacility_navaid_id = NavaidPropertyType.id
-- SpecialNavigationSystemPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.guidancefacility_specialnavigationsystem_id = SpecialNavigationSystemPropertyType.id
-- RadarSystemPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.guidancefacility_radar_id = RadarSystemPropertyType.id
-- SafeAltitudeAreaPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.safealtitude_id = SafeAltitudeAreaPropertyType.id
-- LandingTakeoffAreaCollectionPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.landing_id = LandingTakeoffAreaCollectionPropertyType.id
-- FinalProfilePropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.finalprofile_id = FinalProfilePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.abstractinstrumentapproachprocedureextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.abstractprocedureextension_id = AbstractExtensionType.id

-- ProcedureAvailabilityPropertyType
LEFT JOIN procedure.master_join
ON procedure.instrumentapproachprocedure_ts.id = master_join.source_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON master_join.target_id = ProcedureAvailabilityPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.master_join
ON procedure.instrumentapproachprocedure_ts.id = master_join.source_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.instrumentapproachprocedure_ts.id = master_join.source_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ProcedureTransitionPropertyType
LEFT JOIN procedure.master_join
ON procedure.instrumentapproachprocedure_ts.id = master_join.source_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON master_join.target_id = ProcedureTransitionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.instrumentapproachprocedure_ts.id = master_join.source_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON master_join.target_id = NotePropertyType.id
-- MissedApproachGroupPropertyType
LEFT JOIN procedure.master_join
ON procedure.instrumentapproachprocedure_ts.id = master_join.source_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON master_join.target_id = MissedApproachGroupPropertyType.id
;

InstrumentApproachProcedureType
CREATE OR REPLACE VIEW instrumentapproachproceduretype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.instrumentapproachprocedure.id,
       'identifier', procedure.instrumentapproachprocedure.identifier,
       'identifier_code_space', procedure.instrumentapproachprocedure.identifier_code_space,
       'xml_id', procedure.instrumentapproachprocedure.xml_id
    ) AS instrumentapproachproceduretype
FROM


-- InstrumentApproachProcedureTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.instrumentapproachprocedure.id = master_join.source_id
LEFT JOIN procedure.instrumentapproachprocedure
ON master_join.target_id = InstrumentApproachProcedureTimeSlicePropertyType.id
;

IntermediateLegPropertyType
CREATE OR REPLACE VIEW intermediatelegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.intermediateleg_pt.id,
       'nilReason', procedure.intermediateleg_pt.nilReason
    ) AS intermediatelegpropertytype
FROM


;

IntermediateLegTimeSlicePropertyType
CREATE OR REPLACE VIEW intermediatelegtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.intermediateleg_tsp.id
    ) AS intermediatelegtimeslicepropertytype
FROM

-- IntermediateLegTimeSliceType
LEFT JOIN procedure.intermediateleg_tsp
ON procedure.intermediateleg_tsp.intermediatelegtimeslice_id = IntermediateLegTimeSliceType.id

;

IntermediateLegTimeSliceType
CREATE OR REPLACE VIEW intermediatelegtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'endconditiondesignator_value', procedure.intermediateleg_ts.endconditiondesignator_value,
       'endconditiondesignator_nilreason', procedure.intermediateleg_ts.endconditiondesignator_nilreason,
       'legpath_value', procedure.intermediateleg_ts.legpath_value,
       'legpath_nilreason', procedure.intermediateleg_ts.legpath_nilreason,
       'legtypearinc_value', procedure.intermediateleg_ts.legtypearinc_value,
       'legtypearinc_nilreason', procedure.intermediateleg_ts.legtypearinc_nilreason,
       'course_value', procedure.intermediateleg_ts.course_value,
       'course_nilreason', procedure.intermediateleg_ts.course_nilreason,
       'coursetype_value', procedure.intermediateleg_ts.coursetype_value,
       'coursetype_nilreason', procedure.intermediateleg_ts.coursetype_nilreason,
       'coursedirection_value', procedure.intermediateleg_ts.coursedirection_value,
       'coursedirection_nilreason', procedure.intermediateleg_ts.coursedirection_nilreason,
       'turndirection_value', procedure.intermediateleg_ts.turndirection_value,
       'turndirection_nilreason', procedure.intermediateleg_ts.turndirection_nilreason,
       'speedreference_value', procedure.intermediateleg_ts.speedreference_value,
       'speedreference_nilreason', procedure.intermediateleg_ts.speedreference_nilreason,
       'speedinterpretation_value', procedure.intermediateleg_ts.speedinterpretation_value,
       'speedinterpretation_nilreason', procedure.intermediateleg_ts.speedinterpretation_nilreason,
       'bankangle_value', procedure.intermediateleg_ts.bankangle_value,
       'bankangle_nilreason', procedure.intermediateleg_ts.bankangle_nilreason,
       'procedureturnrequired_value', procedure.intermediateleg_ts.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.intermediateleg_ts.procedureturnrequired_nilreason,
       'upperlimitreference_value', procedure.intermediateleg_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', procedure.intermediateleg_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', procedure.intermediateleg_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', procedure.intermediateleg_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', procedure.intermediateleg_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', procedure.intermediateleg_ts.altitudeinterpretation_nilreason,
       'altitudeoverridereference_value', procedure.intermediateleg_ts.altitudeoverridereference_value,
       'altitudeoverridereference_nilreason', procedure.intermediateleg_ts.altitudeoverridereference_nilreason,
       'verticalangle_value', procedure.intermediateleg_ts.verticalangle_value,
       'verticalangle_nilreason', procedure.intermediateleg_ts.verticalangle_nilreason,
       'requirednavigationperformance_value', procedure.intermediateleg_ts.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', procedure.intermediateleg_ts.requirednavigationperformance_nilreason,
       'speedlimit_value', procedure.intermediateleg_ts.speedlimit_value,
       'speedlimit_uom', procedure.intermediateleg_ts.speedlimit_uom,
       'speedlimit_nilreason', procedure.intermediateleg_ts.speedlimit_nilreason,
       'length_value', procedure.intermediateleg_ts.length_value,
       'length_uom', procedure.intermediateleg_ts.length_uom,
       'length_nilreason', procedure.intermediateleg_ts.length_nilreason,
       'duration_value', procedure.intermediateleg_ts.duration_value,
       'duration_uom', procedure.intermediateleg_ts.duration_uom,
       'duration_nilreason', procedure.intermediateleg_ts.duration_nilreason,
       'upperlimitaltitude_value', procedure.intermediateleg_ts.upperlimitaltitude_value,
       'upperlimitaltitude_uom', procedure.intermediateleg_ts.upperlimitaltitude_uom,
       'upperlimitaltitude_nilreason', procedure.intermediateleg_ts.upperlimitaltitude_nilreason,
       'lowerlimitaltitude_value', procedure.intermediateleg_ts.lowerlimitaltitude_value,
       'lowerlimitaltitude_uom', procedure.intermediateleg_ts.lowerlimitaltitude_uom,
       'lowerlimitaltitude_nilreason', procedure.intermediateleg_ts.lowerlimitaltitude_nilreason,
       'altitudeoverrideatc_value', procedure.intermediateleg_ts.altitudeoverrideatc_value,
       'altitudeoverrideatc_uom', procedure.intermediateleg_ts.altitudeoverrideatc_uom,
       'altitudeoverrideatc_nilreason', procedure.intermediateleg_ts.altitudeoverrideatc_nilreason,
       'id', procedure.intermediateleg_ts.id,
       'xml_id', procedure.intermediateleg_ts.xml_id,
       'interpretation', procedure.intermediateleg_ts.interpretation,
       'sequence_number', procedure.intermediateleg_ts.sequence_number,
       'correction_number', procedure.intermediateleg_ts.correction_number,
       'valid_time_begin', procedure.intermediateleg_ts.valid_time_begin,
       'valid_time_end', procedure.intermediateleg_ts.valid_time_end,
       'feature_lifetime_begin', procedure.intermediateleg_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.intermediateleg_ts.feature_lifetime_end
    ) AS intermediatelegtimeslicetype
FROM

-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.startpoint_id = TerminalSegmentPointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.endpoint_id = TerminalSegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.trajectory_id = CurvePropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.arccentre_id = TerminalSegmentPointPropertyType.id
-- AngleIndicationPropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.angle_id = AngleIndicationPropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.distance_id = DistanceIndicationPropertyType.id
-- HoldingUsePropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.holding_id = HoldingUsePropertyType.id
-- InstrumentApproachProcedurePropertyType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.approach_id = InstrumentApproachProcedurePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.abstractintermediatelegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.abstractapproachlegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.intermediateleg_ts
ON procedure.intermediateleg_ts.abstractsegmentlegextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.intermediateleg_ts.id = master_join.source_id
LEFT JOIN procedure.intermediateleg_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.intermediateleg_ts.id = master_join.source_id
LEFT JOIN procedure.intermediateleg_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.intermediateleg_ts.id = master_join.source_id
LEFT JOIN procedure.intermediateleg_ts
ON master_join.target_id = NotePropertyType.id
;

IntermediateLegType
CREATE OR REPLACE VIEW intermediatelegtype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.intermediateleg.id,
       'identifier', procedure.intermediateleg.identifier,
       'identifier_code_space', procedure.intermediateleg.identifier_code_space,
       'xml_id', procedure.intermediateleg.xml_id
    ) AS intermediatelegtype
FROM


-- IntermediateLegTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.intermediateleg.id = master_join.source_id
LEFT JOIN procedure.intermediateleg
ON master_join.target_id = IntermediateLegTimeSlicePropertyType.id
;

LandingTakeoffAreaCollectionPropertyType
CREATE OR REPLACE VIEW landingtakeoffareacollectionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.landingtakeoffareacollection_pt.id
    ) AS landingtakeoffareacollectionpropertytype
FROM

-- LandingTakeoffAreaCollectionType
LEFT JOIN procedure.landingtakeoffareacollection_pt
ON procedure.landingtakeoffareacollection_pt.landingtakeoffareacollection_id = LandingTakeoffAreaCollectionType.id

;

LandingTakeoffAreaCollectionType
CREATE OR REPLACE VIEW landingtakeoffareacollectiontype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.landingtakeoffareacollection.id,
       'identifier', procedure.landingtakeoffareacollection.identifier,
       'identifier_code_space', procedure.landingtakeoffareacollection.identifier_code_space,
       'xml_id', procedure.landingtakeoffareacollection.xml_id
    ) AS landingtakeoffareacollectiontype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.landingtakeoffareacollection
ON procedure.landingtakeoffareacollection.abstractlandingtakeoffareacollectionextension_id = AbstractExtensionType.id

-- RunwayDirectionPropertyType
LEFT JOIN procedure.master_join
ON procedure.landingtakeoffareacollection.id = master_join.source_id
LEFT JOIN procedure.landingtakeoffareacollection
ON master_join.target_id = RunwayDirectionPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.master_join
ON procedure.landingtakeoffareacollection.id = master_join.source_id
LEFT JOIN procedure.landingtakeoffareacollection
ON master_join.target_id = TouchDownLiftOffPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.landingtakeoffareacollection.id = master_join.source_id
LEFT JOIN procedure.landingtakeoffareacollection
ON master_join.target_id = NotePropertyType.id
;

LightActivationPropertyType
CREATE OR REPLACE VIEW lightactivationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.lightactivation_pt.id
    ) AS lightactivationpropertytype
FROM

-- LightActivationType
LEFT JOIN airport_heliport.lightactivation_pt
ON airport_heliport.lightactivation_pt.lightactivation_id = LightActivationType.id

;

LightActivationType
CREATE OR REPLACE VIEW lightactivationtype_view AS
SELECT
    jsonb_build_object(
       'clicks_value', airport_heliport.lightactivation.clicks_value,
       'clicks_nilreason', airport_heliport.lightactivation.clicks_nilreason,
       'intensitylevel_value', airport_heliport.lightactivation.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.lightactivation.intensitylevel_nilreason,
       'activation_value', airport_heliport.lightactivation.activation_value,
       'activation_nilreason', airport_heliport.lightactivation.activation_nilreason,
       'id', airport_heliport.lightactivation.id,
       'identifier', airport_heliport.lightactivation.identifier,
       'identifier_code_space', airport_heliport.lightactivation.identifier_code_space,
       'xml_id', airport_heliport.lightactivation.xml_id
    ) AS lightactivationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.lightactivation
ON airport_heliport.lightactivation.abstractlightactivationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.lightactivation.id = master_join.source_id
LEFT JOIN airport_heliport.lightactivation
ON master_join.target_id = NotePropertyType.id
;

LightElementPropertyType
CREATE OR REPLACE VIEW lightelementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.lightelement_pt.id
    ) AS lightelementpropertytype
FROM

-- LightElementType
LEFT JOIN shared.lightelement_pt
ON shared.lightelement_pt.lightelement_id = LightElementType.id

;

LightElementStatusPropertyType
CREATE OR REPLACE VIEW lightelementstatuspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.lightelementstatus_pt.id
    ) AS lightelementstatuspropertytype
FROM

-- LightElementStatusType
LEFT JOIN shared.lightelementstatus_pt
ON shared.lightelementstatus_pt.lightelementstatus_id = LightElementStatusType.id

;

LightElementStatusType
CREATE OR REPLACE VIEW lightelementstatustype_view AS
SELECT
    jsonb_build_object(
       'status_value', shared.lightelementstatus.status_value,
       'status_nilreason', shared.lightelementstatus.status_nilreason,
       'id', shared.lightelementstatus.id,
       'identifier', shared.lightelementstatus.identifier,
       'identifier_code_space', shared.lightelementstatus.identifier_code_space,
       'xml_id', shared.lightelementstatus.xml_id
    ) AS lightelementstatustype
FROM

-- AbstractExtensionType
LEFT JOIN shared.lightelementstatus
ON shared.lightelementstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.lightelementstatus
ON shared.lightelementstatus.abstractlightelementstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.master_join
ON shared.lightelementstatus.id = master_join.source_id
LEFT JOIN shared.lightelementstatus
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.lightelementstatus.id = master_join.source_id
LEFT JOIN shared.lightelementstatus
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.master_join
ON shared.lightelementstatus.id = master_join.source_id
LEFT JOIN shared.lightelementstatus
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

LightElementType
CREATE OR REPLACE VIEW lightelementtype_view AS
SELECT
    jsonb_build_object(
       'colour_value', shared.lightelement.colour_value,
       'colour_nilreason', shared.lightelement.colour_nilreason,
       'intensitylevel_value', shared.lightelement.intensitylevel_value,
       'intensitylevel_nilreason', shared.lightelement.intensitylevel_nilreason,
       'type_value', shared.lightelement.type_value,
       'type_nilreason', shared.lightelement.type_nilreason,
       'intensity_value', shared.lightelement.intensity_value,
       'intensity_uom', shared.lightelement.intensity_uom,
       'intensity_nilreason', shared.lightelement.intensity_nilreason,
       'id', shared.lightelement.id,
       'identifier', shared.lightelement.identifier,
       'identifier_code_space', shared.lightelement.identifier_code_space,
       'xml_id', shared.lightelement.xml_id
    ) AS lightelementtype
FROM

-- ElevatedPointPropertyType
LEFT JOIN shared.lightelement
ON shared.lightelement.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.lightelement
ON shared.lightelement.abstractlightelementextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.lightelement.id = master_join.source_id
LEFT JOIN shared.lightelement
ON master_join.target_id = NotePropertyType.id
-- LightElementStatusPropertyType
LEFT JOIN shared.master_join
ON shared.lightelement.id = master_join.source_id
LEFT JOIN shared.lightelement
ON master_join.target_id = LightElementStatusPropertyType.id
;

LinguisticNotePropertyType
CREATE OR REPLACE VIEW linguisticnotepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', notes.linguisticnote_pt.id
    ) AS linguisticnotepropertytype
FROM

-- LinguisticNoteType
LEFT JOIN notes.linguisticnote_pt
ON notes.linguisticnote_pt.linguisticnote_id = LinguisticNoteType.id

;

LinguisticNoteType
CREATE OR REPLACE VIEW linguisticnotetype_view AS
SELECT
    jsonb_build_object(
       'note_value', notes.linguisticnote.note_value,
       'note_nilreason', notes.linguisticnote.note_nilreason,
       'note_lang', notes.linguisticnote.note_lang,
       'id', notes.linguisticnote.id,
       'identifier', notes.linguisticnote.identifier,
       'identifier_code_space', notes.linguisticnote.identifier_code_space,
       'xml_id', notes.linguisticnote.xml_id
    ) AS linguisticnotetype
FROM

-- AbstractExtensionType
LEFT JOIN notes.linguisticnote
ON notes.linguisticnote.abstractlinguisticnoteextension_id = AbstractExtensionType.id

;

LocalizerPropertyType
CREATE OR REPLACE VIEW localizerpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.localizer_pt.id,
       'nilReason', navaids_points.localizer_pt.nilReason
    ) AS localizerpropertytype
FROM


;

LocalizerTimeSlicePropertyType
CREATE OR REPLACE VIEW localizertimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.localizer_tsp.id
    ) AS localizertimeslicepropertytype
FROM

-- LocalizerTimeSliceType
LEFT JOIN navaids_points.localizer_tsp
ON navaids_points.localizer_tsp.localizertimeslice_id = LocalizerTimeSliceType.id

;

LocalizerTimeSliceType
CREATE OR REPLACE VIEW localizertimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.localizer_ts.designator_value,
       'designator_nilreason', navaids_points.localizer_ts.designator_nilreason,
       'name_value', navaids_points.localizer_ts.name_value,
       'name_nilreason', navaids_points.localizer_ts.name_nilreason,
       'emissionclass_value', navaids_points.localizer_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.localizer_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.localizer_ts.mobile_value,
       'mobile_nilreason', navaids_points.localizer_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.localizer_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.localizer_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.localizer_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.localizer_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.localizer_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.localizer_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.localizer_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.localizer_ts.flightchecked_nilreason,
       'magneticbearing_value', navaids_points.localizer_ts.magneticbearing_value,
       'magneticbearing_nilreason', navaids_points.localizer_ts.magneticbearing_nilreason,
       'magneticbearingaccuracy_value', navaids_points.localizer_ts.magneticbearingaccuracy_value,
       'magneticbearingaccuracy_nilreason', navaids_points.localizer_ts.magneticbearingaccuracy_nilreason,
       'truebearing_value', navaids_points.localizer_ts.truebearing_value,
       'truebearing_nilreason', navaids_points.localizer_ts.truebearing_nilreason,
       'truebearingaccuracy_value', navaids_points.localizer_ts.truebearingaccuracy_value,
       'truebearingaccuracy_nilreason', navaids_points.localizer_ts.truebearingaccuracy_nilreason,
       'declination_value', navaids_points.localizer_ts.declination_value,
       'declination_nilreason', navaids_points.localizer_ts.declination_nilreason,
       'widthcourse_value', navaids_points.localizer_ts.widthcourse_value,
       'widthcourse_nilreason', navaids_points.localizer_ts.widthcourse_nilreason,
       'widthcourseaccuracy_value', navaids_points.localizer_ts.widthcourseaccuracy_value,
       'widthcourseaccuracy_nilreason', navaids_points.localizer_ts.widthcourseaccuracy_nilreason,
       'backcourseusable_value', navaids_points.localizer_ts.backcourseusable_value,
       'backcourseusable_nilreason', navaids_points.localizer_ts.backcourseusable_nilreason,
       'frequency_value', navaids_points.localizer_ts.frequency_value,
       'frequency_uom', navaids_points.localizer_ts.frequency_uom,
       'frequency_nilreason', navaids_points.localizer_ts.frequency_nilreason,
       'id', navaids_points.localizer_ts.id,
       'xml_id', navaids_points.localizer_ts.xml_id,
       'interpretation', navaids_points.localizer_ts.interpretation,
       'sequence_number', navaids_points.localizer_ts.sequence_number,
       'correction_number', navaids_points.localizer_ts.correction_number,
       'valid_time_begin', navaids_points.localizer_ts.valid_time_begin,
       'valid_time_end', navaids_points.localizer_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.localizer_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.localizer_ts.feature_lifetime_end
    ) AS localizertimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.localizer_ts
ON navaids_points.localizer_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.localizer_ts
ON navaids_points.localizer_ts.abstractlocalizerextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.localizer_ts
ON navaids_points.localizer_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.localizer_ts.id = master_join.source_id
LEFT JOIN navaids_points.localizer_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.localizer_ts.id = master_join.source_id
LEFT JOIN navaids_points.localizer_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.localizer_ts.id = master_join.source_id
LEFT JOIN navaids_points.localizer_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.localizer_ts.id = master_join.source_id
LEFT JOIN navaids_points.localizer_ts
ON master_join.target_id = NotePropertyType.id
;

LocalizerType
CREATE OR REPLACE VIEW localizertype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.localizer.id,
       'identifier', navaids_points.localizer.identifier,
       'identifier_code_space', navaids_points.localizer.identifier_code_space,
       'xml_id', navaids_points.localizer.xml_id
    ) AS localizertype
FROM


-- LocalizerTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.localizer.id = master_join.source_id
LEFT JOIN navaids_points.localizer
ON master_join.target_id = LocalizerTimeSlicePropertyType.id
;

ManoeuvringAreaAvailabilityPropertyType
CREATE OR REPLACE VIEW manoeuvringareaavailabilitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.manoeuvringareaavailability_pt.id
    ) AS manoeuvringareaavailabilitypropertytype
FROM

-- ManoeuvringAreaAvailabilityType
LEFT JOIN airport_heliport.manoeuvringareaavailability_pt
ON airport_heliport.manoeuvringareaavailability_pt.manoeuvringareaavailability_id = ManoeuvringAreaAvailabilityType.id

;

ManoeuvringAreaAvailabilityType
CREATE OR REPLACE VIEW manoeuvringareaavailabilitytype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', airport_heliport.manoeuvringareaavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.manoeuvringareaavailability.operationalstatus_nilreason,
       'warning_value', airport_heliport.manoeuvringareaavailability.warning_value,
       'warning_nilreason', airport_heliport.manoeuvringareaavailability.warning_nilreason,
       'id', airport_heliport.manoeuvringareaavailability.id,
       'identifier', airport_heliport.manoeuvringareaavailability.identifier,
       'identifier_code_space', airport_heliport.manoeuvringareaavailability.identifier_code_space,
       'xml_id', airport_heliport.manoeuvringareaavailability.xml_id
    ) AS manoeuvringareaavailabilitytype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON airport_heliport.manoeuvringareaavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON airport_heliport.manoeuvringareaavailability.abstractmanoeuvringareaavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.manoeuvringareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.manoeuvringareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.manoeuvringareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- ManoeuvringAreaUsagePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.manoeuvringareaavailability.id = master_join.source_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON master_join.target_id = ManoeuvringAreaUsagePropertyType.id
;

ManoeuvringAreaUsagePropertyType
CREATE OR REPLACE VIEW manoeuvringareausagepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.manoeuvringareausage_pt.id
    ) AS manoeuvringareausagepropertytype
FROM

-- ManoeuvringAreaUsageType
LEFT JOIN airport_heliport.manoeuvringareausage_pt
ON airport_heliport.manoeuvringareausage_pt.manoeuvringareausage_id = ManoeuvringAreaUsageType.id

;

ManoeuvringAreaUsageType
CREATE OR REPLACE VIEW manoeuvringareausagetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.manoeuvringareausage.type_value,
       'type_nilreason', airport_heliport.manoeuvringareausage.type_nilreason,
       'operation_value', airport_heliport.manoeuvringareausage.operation_value,
       'operation_nilreason', airport_heliport.manoeuvringareausage.operation_nilreason,
       'priorpermission_value', airport_heliport.manoeuvringareausage.priorpermission_value,
       'priorpermission_uom', airport_heliport.manoeuvringareausage.priorpermission_uom,
       'priorpermission_nilreason', airport_heliport.manoeuvringareausage.priorpermission_nilreason,
       'id', airport_heliport.manoeuvringareausage.id,
       'identifier', airport_heliport.manoeuvringareausage.identifier,
       'identifier_code_space', airport_heliport.manoeuvringareausage.identifier_code_space,
       'xml_id', airport_heliport.manoeuvringareausage.xml_id
    ) AS manoeuvringareausagetype
FROM

-- ConditionCombinationPropertyType
LEFT JOIN airport_heliport.manoeuvringareausage
ON airport_heliport.manoeuvringareausage.selection_id = ConditionCombinationPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.manoeuvringareausage
ON airport_heliport.manoeuvringareausage.abstractusageconditionextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.manoeuvringareausage
ON airport_heliport.manoeuvringareausage.abstractmanoeuvringareausageextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.manoeuvringareausage.id = master_join.source_id
LEFT JOIN airport_heliport.manoeuvringareausage
ON master_join.target_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.manoeuvringareausage.id = master_join.source_id
LEFT JOIN airport_heliport.manoeuvringareausage
ON master_join.target_id = NotePropertyType.id
;

MarkerBeaconPropertyType
CREATE OR REPLACE VIEW markerbeaconpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.markerbeacon_pt.id,
       'nilReason', navaids_points.markerbeacon_pt.nilReason
    ) AS markerbeaconpropertytype
FROM


;

MarkerBeaconTimeSlicePropertyType
CREATE OR REPLACE VIEW markerbeacontimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.markerbeacon_tsp.id
    ) AS markerbeacontimeslicepropertytype
FROM

-- MarkerBeaconTimeSliceType
LEFT JOIN navaids_points.markerbeacon_tsp
ON navaids_points.markerbeacon_tsp.markerbeacontimeslice_id = MarkerBeaconTimeSliceType.id

;

MarkerBeaconTimeSliceType
CREATE OR REPLACE VIEW markerbeacontimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.markerbeacon_ts.designator_value,
       'designator_nilreason', navaids_points.markerbeacon_ts.designator_nilreason,
       'name_value', navaids_points.markerbeacon_ts.name_value,
       'name_nilreason', navaids_points.markerbeacon_ts.name_nilreason,
       'emissionclass_value', navaids_points.markerbeacon_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.markerbeacon_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.markerbeacon_ts.mobile_value,
       'mobile_nilreason', navaids_points.markerbeacon_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.markerbeacon_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.markerbeacon_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.markerbeacon_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.markerbeacon_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.markerbeacon_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.markerbeacon_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.markerbeacon_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.markerbeacon_ts.flightchecked_nilreason,
       'class_value', navaids_points.markerbeacon_ts.class_value,
       'class_nilreason', navaids_points.markerbeacon_ts.class_nilreason,
       'axisbearing_value', navaids_points.markerbeacon_ts.axisbearing_value,
       'axisbearing_nilreason', navaids_points.markerbeacon_ts.axisbearing_nilreason,
       'auralmorsecode_value', navaids_points.markerbeacon_ts.auralmorsecode_value,
       'auralmorsecode_nilreason', navaids_points.markerbeacon_ts.auralmorsecode_nilreason,
       'frequency_value', navaids_points.markerbeacon_ts.frequency_value,
       'frequency_uom', navaids_points.markerbeacon_ts.frequency_uom,
       'frequency_nilreason', navaids_points.markerbeacon_ts.frequency_nilreason,
       'id', navaids_points.markerbeacon_ts.id,
       'xml_id', navaids_points.markerbeacon_ts.xml_id,
       'interpretation', navaids_points.markerbeacon_ts.interpretation,
       'sequence_number', navaids_points.markerbeacon_ts.sequence_number,
       'correction_number', navaids_points.markerbeacon_ts.correction_number,
       'valid_time_begin', navaids_points.markerbeacon_ts.valid_time_begin,
       'valid_time_end', navaids_points.markerbeacon_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.markerbeacon_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.markerbeacon_ts.feature_lifetime_end
    ) AS markerbeacontimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.markerbeacon_ts
ON navaids_points.markerbeacon_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.markerbeacon_ts
ON navaids_points.markerbeacon_ts.abstractmarkerbeaconextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.markerbeacon_ts
ON navaids_points.markerbeacon_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.markerbeacon_ts.id = master_join.source_id
LEFT JOIN navaids_points.markerbeacon_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.markerbeacon_ts.id = master_join.source_id
LEFT JOIN navaids_points.markerbeacon_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.markerbeacon_ts.id = master_join.source_id
LEFT JOIN navaids_points.markerbeacon_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.markerbeacon_ts.id = master_join.source_id
LEFT JOIN navaids_points.markerbeacon_ts
ON master_join.target_id = NotePropertyType.id
;

MarkerBeaconType
CREATE OR REPLACE VIEW markerbeacontype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.markerbeacon.id,
       'identifier', navaids_points.markerbeacon.identifier,
       'identifier_code_space', navaids_points.markerbeacon.identifier_code_space,
       'xml_id', navaids_points.markerbeacon.xml_id
    ) AS markerbeacontype
FROM


-- MarkerBeaconTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.markerbeacon.id = master_join.source_id
LEFT JOIN navaids_points.markerbeacon
ON master_join.target_id = MarkerBeaconTimeSlicePropertyType.id
;

MarkingBuoyPropertyType
CREATE OR REPLACE VIEW markingbuoypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.markingbuoy_pt.id,
       'nilReason', airport_heliport.markingbuoy_pt.nilReason
    ) AS markingbuoypropertytype
FROM


;

MarkingBuoyTimeSlicePropertyType
CREATE OR REPLACE VIEW markingbuoytimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.markingbuoy_tsp.id
    ) AS markingbuoytimeslicepropertytype
FROM

-- MarkingBuoyTimeSliceType
LEFT JOIN airport_heliport.markingbuoy_tsp
ON airport_heliport.markingbuoy_tsp.markingbuoytimeslice_id = MarkingBuoyTimeSliceType.id

;

MarkingBuoyTimeSliceType
CREATE OR REPLACE VIEW markingbuoytimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator', airport_heliport.markingbuoy_ts.designator,
       'type_value', airport_heliport.markingbuoy_ts.type_value,
       'type_nilreason', airport_heliport.markingbuoy_ts.type_nilreason,
       'colour_value', airport_heliport.markingbuoy_ts.colour_value,
       'colour_nilreason', airport_heliport.markingbuoy_ts.colour_nilreason,
       'id', airport_heliport.markingbuoy_ts.id,
       'xml_id', airport_heliport.markingbuoy_ts.xml_id,
       'interpretation', airport_heliport.markingbuoy_ts.interpretation,
       'sequence_number', airport_heliport.markingbuoy_ts.sequence_number,
       'correction_number', airport_heliport.markingbuoy_ts.correction_number,
       'valid_time_begin', airport_heliport.markingbuoy_ts.valid_time_begin,
       'valid_time_end', airport_heliport.markingbuoy_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.markingbuoy_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.markingbuoy_ts.feature_lifetime_end
    ) AS markingbuoytimeslicetype
FROM

-- SeaplaneLandingAreaPropertyType
LEFT JOIN airport_heliport.markingbuoy_ts
ON airport_heliport.markingbuoy_ts.theseaplanelandingarea_id = SeaplaneLandingAreaPropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.markingbuoy_ts
ON airport_heliport.markingbuoy_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.markingbuoy_ts
ON airport_heliport.markingbuoy_ts.abstractmarkingbuoyextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.markingbuoy_ts.id = master_join.source_id
LEFT JOIN airport_heliport.markingbuoy_ts
ON master_join.target_id = NotePropertyType.id
;

MarkingBuoyType
CREATE OR REPLACE VIEW markingbuoytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.markingbuoy.id,
       'identifier', airport_heliport.markingbuoy.identifier,
       'identifier_code_space', airport_heliport.markingbuoy.identifier_code_space,
       'xml_id', airport_heliport.markingbuoy.xml_id
    ) AS markingbuoytype
FROM


-- MarkingBuoyTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.markingbuoy.id = master_join.source_id
LEFT JOIN airport_heliport.markingbuoy
ON master_join.target_id = MarkingBuoyTimeSlicePropertyType.id
;

MarkingElementPropertyType
CREATE OR REPLACE VIEW markingelementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.markingelement_pt.id
    ) AS markingelementpropertytype
FROM

-- MarkingElementType
LEFT JOIN airport_heliport.markingelement_pt
ON airport_heliport.markingelement_pt.markingelement_id = MarkingElementType.id

;

MarkingElementType
CREATE OR REPLACE VIEW markingelementtype_view AS
SELECT
    jsonb_build_object(
       'colour_value', airport_heliport.markingelement.colour_value,
       'colour_nilreason', airport_heliport.markingelement.colour_nilreason,
       'style_value', airport_heliport.markingelement.style_value,
       'style_nilreason', airport_heliport.markingelement.style_nilreason,
       'id', airport_heliport.markingelement.id,
       'identifier', airport_heliport.markingelement.identifier,
       'identifier_code_space', airport_heliport.markingelement.identifier_code_space,
       'xml_id', airport_heliport.markingelement.xml_id
    ) AS markingelementtype
FROM

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.extent_surfaceextent_id = ElevatedSurfacePropertyType.id
-- ElevatedCurvePropertyType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.extent_curveextent_id = ElevatedCurvePropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.extent_location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.abstractmarkingelementextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.markingelement.id = master_join.source_id
LEFT JOIN airport_heliport.markingelement
ON master_join.target_id = NotePropertyType.id
;

MarkingPropertyType
CREATE OR REPLACE VIEW markingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.marking_pt.id,
       'nilReason', airport_heliport.marking_pt.nilReason
    ) AS markingpropertytype
FROM


;

MessageMetadataPropertyType
CREATE OR REPLACE VIEW messagemetadatapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', public.message_metadata_property.id
    ) AS messagemetadatapropertytype
FROM


;

MeteorologyPropertyType
CREATE OR REPLACE VIEW meteorologypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.meteorology_pt.id
    ) AS meteorologypropertytype
FROM

-- MeteorologyType
LEFT JOIN shared.meteorology_pt
ON shared.meteorology_pt.meteorology_id = MeteorologyType.id

;

MeteorologyType
CREATE OR REPLACE VIEW meteorologytype_view AS
SELECT
    jsonb_build_object(
       'flightconditions_value', shared.meteorology.flightconditions_value,
       'flightconditions_nilreason', shared.meteorology.flightconditions_nilreason,
       'visibilityinterpretation_value', shared.meteorology.visibilityinterpretation_value,
       'visibilityinterpretation_nilreason', shared.meteorology.visibilityinterpretation_nilreason,
       'runwayvisualrangeinterpretation_value', shared.meteorology.runwayvisualrangeinterpretation_value,
       'runwayvisualrangeinterpretation_nilreason', shared.meteorology.runwayvisualrangeinterpretation_nilreason,
       'visibility_value', shared.meteorology.visibility_value,
       'visibility_uom', shared.meteorology.visibility_uom,
       'visibility_nilreason', shared.meteorology.visibility_nilreason,
       'runwayvisualrange_value', shared.meteorology.runwayvisualrange_value,
       'runwayvisualrange_uom', shared.meteorology.runwayvisualrange_uom,
       'runwayvisualrange_nilreason', shared.meteorology.runwayvisualrange_nilreason,
       'id', shared.meteorology.id,
       'identifier', shared.meteorology.identifier,
       'identifier_code_space', shared.meteorology.identifier_code_space,
       'xml_id', shared.meteorology.xml_id
    ) AS meteorologytype
FROM

-- AbstractExtensionType
LEFT JOIN shared.meteorology
ON shared.meteorology.abstractmeteorologyextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.meteorology.id = master_join.source_id
LEFT JOIN shared.meteorology
ON master_join.target_id = NotePropertyType.id
;

MinimaPropertyType
CREATE OR REPLACE VIEW minimapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.minima_pt.id
    ) AS minimapropertytype
FROM

-- MinimaType
LEFT JOIN procedure.minima_pt
ON procedure.minima_pt.minima_id = MinimaType.id

;

MinimaType
CREATE OR REPLACE VIEW minimatype_view AS
SELECT
    jsonb_build_object(
       'altitudecode_value', procedure.minima.altitudecode_value,
       'altitudecode_nilreason', procedure.minima.altitudecode_nilreason,
       'altitudereference_value', procedure.minima.altitudereference_value,
       'altitudereference_nilreason', procedure.minima.altitudereference_nilreason,
       'heightcode_value', procedure.minima.heightcode_value,
       'heightcode_nilreason', procedure.minima.heightcode_nilreason,
       'heightreference_value', procedure.minima.heightreference_value,
       'heightreference_nilreason', procedure.minima.heightreference_nilreason,
       'mandatoryrvr_value', procedure.minima.mandatoryrvr_value,
       'mandatoryrvr_nilreason', procedure.minima.mandatoryrvr_nilreason,
       'remotealtimeterminima_value', procedure.minima.remotealtimeterminima_value,
       'remotealtimeterminima_nilreason', procedure.minima.remotealtimeterminima_nilreason,
       'altitude_value', procedure.minima.altitude_value,
       'altitude_uom', procedure.minima.altitude_uom,
       'altitude_nilreason', procedure.minima.altitude_nilreason,
       'height_value', procedure.minima.height_value,
       'height_uom', procedure.minima.height_uom,
       'height_nilreason', procedure.minima.height_nilreason,
       'militaryheight_value', procedure.minima.militaryheight_value,
       'militaryheight_uom', procedure.minima.militaryheight_uom,
       'militaryheight_nilreason', procedure.minima.militaryheight_nilreason,
       'radioheight_value', procedure.minima.radioheight_value,
       'radioheight_uom', procedure.minima.radioheight_uom,
       'radioheight_nilreason', procedure.minima.radioheight_nilreason,
       'visibility_value', procedure.minima.visibility_value,
       'visibility_uom', procedure.minima.visibility_uom,
       'visibility_nilreason', procedure.minima.visibility_nilreason,
       'militaryvisibility_value', procedure.minima.militaryvisibility_value,
       'militaryvisibility_uom', procedure.minima.militaryvisibility_uom,
       'militaryvisibility_nilreason', procedure.minima.militaryvisibility_nilreason,
       'id', procedure.minima.id,
       'identifier', procedure.minima.identifier,
       'identifier_code_space', procedure.minima.identifier_code_space,
       'xml_id', procedure.minima.xml_id
    ) AS minimatype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.minima
ON procedure.minima.abstractminimaextension_id = AbstractExtensionType.id

-- EquipmentUnavailableAdjustmentPropertyType
LEFT JOIN procedure.master_join
ON procedure.minima.id = master_join.source_id
LEFT JOIN procedure.minima
ON master_join.target_id = EquipmentUnavailableAdjustmentPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.minima.id = master_join.source_id
LEFT JOIN procedure.minima
ON master_join.target_id = NotePropertyType.id
;

MissedApproachGroupPropertyType
CREATE OR REPLACE VIEW missedapproachgrouppropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.missedapproachgroup_pt.id
    ) AS missedapproachgrouppropertytype
FROM

-- MissedApproachGroupType
LEFT JOIN procedure.missedapproachgroup_pt
ON procedure.missedapproachgroup_pt.missedapproachgroup_id = MissedApproachGroupType.id

;

MissedApproachGroupType
CREATE OR REPLACE VIEW missedapproachgrouptype_view AS
SELECT
    jsonb_build_object(
       'instruction_value', procedure.missedapproachgroup.instruction_value,
       'instruction_nilreason', procedure.missedapproachgroup.instruction_nilreason,
       'alternateclimbinstruction_value', procedure.missedapproachgroup.alternateclimbinstruction_value,
       'alternateclimbinstruction_nilreason', procedure.missedapproachgroup.alternateclimbinstruction_nilreason,
       'alternateclimbaltitude_value', procedure.missedapproachgroup.alternateclimbaltitude_value,
       'alternateclimbaltitude_uom', procedure.missedapproachgroup.alternateclimbaltitude_uom,
       'alternateclimbaltitude_nilreason', procedure.missedapproachgroup.alternateclimbaltitude_nilreason,
       'id', procedure.missedapproachgroup.id,
       'identifier', procedure.missedapproachgroup.identifier,
       'identifier_code_space', procedure.missedapproachgroup.identifier_code_space,
       'xml_id', procedure.missedapproachgroup.xml_id
    ) AS missedapproachgrouptype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.missedapproachgroup
ON procedure.missedapproachgroup.abstractmissedapproachgroupextension_id = AbstractExtensionType.id

-- AltimeterSourcePropertyType
LEFT JOIN procedure.master_join
ON procedure.missedapproachgroup.id = master_join.source_id
LEFT JOIN procedure.missedapproachgroup
ON master_join.target_id = AltimeterSourcePropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.missedapproachgroup.id = master_join.source_id
LEFT JOIN procedure.missedapproachgroup
ON master_join.target_id = NotePropertyType.id
;

MissedApproachLegPropertyType
CREATE OR REPLACE VIEW missedapproachlegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.missedapproachleg_pt.id,
       'nilReason', procedure.missedapproachleg_pt.nilReason
    ) AS missedapproachlegpropertytype
FROM


;

MissedApproachLegTimeSlicePropertyType
CREATE OR REPLACE VIEW missedapproachlegtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.missedapproachleg_tsp.id
    ) AS missedapproachlegtimeslicepropertytype
FROM

-- MissedApproachLegTimeSliceType
LEFT JOIN procedure.missedapproachleg_tsp
ON procedure.missedapproachleg_tsp.missedapproachlegtimeslice_id = MissedApproachLegTimeSliceType.id

;

MissedApproachLegTimeSliceType
CREATE OR REPLACE VIEW missedapproachlegtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'endconditiondesignator_value', procedure.missedapproachleg_ts.endconditiondesignator_value,
       'endconditiondesignator_nilreason', procedure.missedapproachleg_ts.endconditiondesignator_nilreason,
       'legpath_value', procedure.missedapproachleg_ts.legpath_value,
       'legpath_nilreason', procedure.missedapproachleg_ts.legpath_nilreason,
       'legtypearinc_value', procedure.missedapproachleg_ts.legtypearinc_value,
       'legtypearinc_nilreason', procedure.missedapproachleg_ts.legtypearinc_nilreason,
       'course_value', procedure.missedapproachleg_ts.course_value,
       'course_nilreason', procedure.missedapproachleg_ts.course_nilreason,
       'coursetype_value', procedure.missedapproachleg_ts.coursetype_value,
       'coursetype_nilreason', procedure.missedapproachleg_ts.coursetype_nilreason,
       'coursedirection_value', procedure.missedapproachleg_ts.coursedirection_value,
       'coursedirection_nilreason', procedure.missedapproachleg_ts.coursedirection_nilreason,
       'turndirection_value', procedure.missedapproachleg_ts.turndirection_value,
       'turndirection_nilreason', procedure.missedapproachleg_ts.turndirection_nilreason,
       'speedreference_value', procedure.missedapproachleg_ts.speedreference_value,
       'speedreference_nilreason', procedure.missedapproachleg_ts.speedreference_nilreason,
       'speedinterpretation_value', procedure.missedapproachleg_ts.speedinterpretation_value,
       'speedinterpretation_nilreason', procedure.missedapproachleg_ts.speedinterpretation_nilreason,
       'bankangle_value', procedure.missedapproachleg_ts.bankangle_value,
       'bankangle_nilreason', procedure.missedapproachleg_ts.bankangle_nilreason,
       'procedureturnrequired_value', procedure.missedapproachleg_ts.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.missedapproachleg_ts.procedureturnrequired_nilreason,
       'upperlimitreference_value', procedure.missedapproachleg_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', procedure.missedapproachleg_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', procedure.missedapproachleg_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', procedure.missedapproachleg_ts.lowerlimitreference_nilreason,
       'altitudeinterpretation_value', procedure.missedapproachleg_ts.altitudeinterpretation_value,
       'altitudeinterpretation_nilreason', procedure.missedapproachleg_ts.altitudeinterpretation_nilreason,
       'altitudeoverridereference_value', procedure.missedapproachleg_ts.altitudeoverridereference_value,
       'altitudeoverridereference_nilreason', procedure.missedapproachleg_ts.altitudeoverridereference_nilreason,
       'verticalangle_value', procedure.missedapproachleg_ts.verticalangle_value,
       'verticalangle_nilreason', procedure.missedapproachleg_ts.verticalangle_nilreason,
       'type_value', procedure.missedapproachleg_ts.type_value,
       'type_nilreason', procedure.missedapproachleg_ts.type_nilreason,
       'thresholdaftermapt_value', procedure.missedapproachleg_ts.thresholdaftermapt_value,
       'thresholdaftermapt_nilreason', procedure.missedapproachleg_ts.thresholdaftermapt_nilreason,
       'requirednavigationperformance_value', procedure.missedapproachleg_ts.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', procedure.missedapproachleg_ts.requirednavigationperformance_nilreason,
       'speedlimit_value', procedure.missedapproachleg_ts.speedlimit_value,
       'speedlimit_uom', procedure.missedapproachleg_ts.speedlimit_uom,
       'speedlimit_nilreason', procedure.missedapproachleg_ts.speedlimit_nilreason,
       'length_value', procedure.missedapproachleg_ts.length_value,
       'length_uom', procedure.missedapproachleg_ts.length_uom,
       'length_nilreason', procedure.missedapproachleg_ts.length_nilreason,
       'duration_value', procedure.missedapproachleg_ts.duration_value,
       'duration_uom', procedure.missedapproachleg_ts.duration_uom,
       'duration_nilreason', procedure.missedapproachleg_ts.duration_nilreason,
       'upperlimitaltitude_value', procedure.missedapproachleg_ts.upperlimitaltitude_value,
       'upperlimitaltitude_uom', procedure.missedapproachleg_ts.upperlimitaltitude_uom,
       'upperlimitaltitude_nilreason', procedure.missedapproachleg_ts.upperlimitaltitude_nilreason,
       'lowerlimitaltitude_value', procedure.missedapproachleg_ts.lowerlimitaltitude_value,
       'lowerlimitaltitude_uom', procedure.missedapproachleg_ts.lowerlimitaltitude_uom,
       'lowerlimitaltitude_nilreason', procedure.missedapproachleg_ts.lowerlimitaltitude_nilreason,
       'altitudeoverrideatc_value', procedure.missedapproachleg_ts.altitudeoverrideatc_value,
       'altitudeoverrideatc_uom', procedure.missedapproachleg_ts.altitudeoverrideatc_uom,
       'altitudeoverrideatc_nilreason', procedure.missedapproachleg_ts.altitudeoverrideatc_nilreason,
       'heightmapt_value', procedure.missedapproachleg_ts.heightmapt_value,
       'heightmapt_uom', procedure.missedapproachleg_ts.heightmapt_uom,
       'heightmapt_nilreason', procedure.missedapproachleg_ts.heightmapt_nilreason,
       'id', procedure.missedapproachleg_ts.id,
       'xml_id', procedure.missedapproachleg_ts.xml_id,
       'interpretation', procedure.missedapproachleg_ts.interpretation,
       'sequence_number', procedure.missedapproachleg_ts.sequence_number,
       'correction_number', procedure.missedapproachleg_ts.correction_number,
       'valid_time_begin', procedure.missedapproachleg_ts.valid_time_begin,
       'valid_time_end', procedure.missedapproachleg_ts.valid_time_end,
       'feature_lifetime_begin', procedure.missedapproachleg_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.missedapproachleg_ts.feature_lifetime_end
    ) AS missedapproachlegtimeslicetype
FROM

-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.startpoint_id = TerminalSegmentPointPropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.endpoint_id = TerminalSegmentPointPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.trajectory_id = CurvePropertyType.id
-- TerminalSegmentPointPropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.arccentre_id = TerminalSegmentPointPropertyType.id
-- AngleIndicationPropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.angle_id = AngleIndicationPropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.distance_id = DistanceIndicationPropertyType.id
-- HoldingUsePropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.holding_id = HoldingUsePropertyType.id
-- InstrumentApproachProcedurePropertyType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.approach_id = InstrumentApproachProcedurePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.abstractmissedapproachlegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.abstractapproachlegextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.missedapproachleg_ts
ON procedure.missedapproachleg_ts.abstractsegmentlegextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.missedapproachleg_ts.id = master_join.source_id
LEFT JOIN procedure.missedapproachleg_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.master_join
ON procedure.missedapproachleg_ts.id = master_join.source_id
LEFT JOIN procedure.missedapproachleg_ts
ON master_join.target_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.missedapproachleg_ts.id = master_join.source_id
LEFT JOIN procedure.missedapproachleg_ts
ON master_join.target_id = NotePropertyType.id
-- ApproachConditionPropertyType
LEFT JOIN procedure.master_join
ON procedure.missedapproachleg_ts.id = master_join.source_id
LEFT JOIN procedure.missedapproachleg_ts
ON master_join.target_id = ApproachConditionPropertyType.id
;

MissedApproachLegType
CREATE OR REPLACE VIEW missedapproachlegtype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.missedapproachleg.id,
       'identifier', procedure.missedapproachleg.identifier,
       'identifier_code_space', procedure.missedapproachleg.identifier_code_space,
       'xml_id', procedure.missedapproachleg.xml_id
    ) AS missedapproachlegtype
FROM


-- MissedApproachLegTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.missedapproachleg.id = master_join.source_id
LEFT JOIN procedure.missedapproachleg
ON master_join.target_id = MissedApproachLegTimeSlicePropertyType.id
;

NavaidComponentPropertyType
CREATE OR REPLACE VIEW navaidcomponentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidcomponent_pt.id
    ) AS navaidcomponentpropertytype
FROM

-- NavaidComponentType
LEFT JOIN navaids_points.navaidcomponent_pt
ON navaids_points.navaidcomponent_pt.navaidcomponent_id = NavaidComponentType.id

;

NavaidComponentType
CREATE OR REPLACE VIEW navaidcomponenttype_view AS
SELECT
    jsonb_build_object(
       'collocationgroup_value', navaids_points.navaidcomponent.collocationgroup_value,
       'collocationgroup_nilreason', navaids_points.navaidcomponent.collocationgroup_nilreason,
       'markerposition_value', navaids_points.navaidcomponent.markerposition_value,
       'markerposition_nilreason', navaids_points.navaidcomponent.markerposition_nilreason,
       'providesnavigablelocation_value', navaids_points.navaidcomponent.providesnavigablelocation_value,
       'providesnavigablelocation_nilreason', navaids_points.navaidcomponent.providesnavigablelocation_nilreason,
       'id', navaids_points.navaidcomponent.id,
       'identifier', navaids_points.navaidcomponent.identifier,
       'identifier_code_space', navaids_points.navaidcomponent.identifier_code_space,
       'xml_id', navaids_points.navaidcomponent.xml_id
    ) AS navaidcomponenttype
FROM

-- NavaidEquipmentPropertyType
LEFT JOIN navaids_points.navaidcomponent
ON navaids_points.navaidcomponent.thenavaidequipment_id = NavaidEquipmentPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidcomponent
ON navaids_points.navaidcomponent.abstractnavaidcomponentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaidcomponent.id = master_join.source_id
LEFT JOIN navaids_points.navaidcomponent
ON master_join.target_id = NotePropertyType.id
;

NavaidEquipmentDistancePropertyType
CREATE OR REPLACE VIEW navaidequipmentdistancepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.navaidequipmentdistance_pt.id
    ) AS navaidequipmentdistancepropertytype
FROM

-- NavaidEquipmentDistanceType
LEFT JOIN airport_heliport.navaidequipmentdistance_pt
ON airport_heliport.navaidequipmentdistance_pt.navaidequipmentdistance_id = NavaidEquipmentDistanceType.id

;

NavaidEquipmentDistanceType
CREATE OR REPLACE VIEW navaidequipmentdistancetype_view AS
SELECT
    jsonb_build_object(
       'distance_value', airport_heliport.navaidequipmentdistance.distance_value,
       'distance_uom', airport_heliport.navaidequipmentdistance.distance_uom,
       'distance_nilreason', airport_heliport.navaidequipmentdistance.distance_nilreason,
       'distanceaccuracy_value', airport_heliport.navaidequipmentdistance.distanceaccuracy_value,
       'distanceaccuracy_uom', airport_heliport.navaidequipmentdistance.distanceaccuracy_uom,
       'distanceaccuracy_nilreason', airport_heliport.navaidequipmentdistance.distanceaccuracy_nilreason,
       'id', airport_heliport.navaidequipmentdistance.id,
       'identifier', airport_heliport.navaidequipmentdistance.identifier,
       'identifier_code_space', airport_heliport.navaidequipmentdistance.identifier_code_space,
       'xml_id', airport_heliport.navaidequipmentdistance.xml_id
    ) AS navaidequipmentdistancetype
FROM

-- NavaidEquipmentPropertyType
LEFT JOIN airport_heliport.navaidequipmentdistance
ON airport_heliport.navaidequipmentdistance.thenavaidequipment_id = NavaidEquipmentPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.navaidequipmentdistance
ON airport_heliport.navaidequipmentdistance.abstractnavaidequipmentdistanceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.navaidequipmentdistance.id = master_join.source_id
LEFT JOIN airport_heliport.navaidequipmentdistance
ON master_join.target_id = NotePropertyType.id
;

NavaidEquipmentMonitoringPropertyType
CREATE OR REPLACE VIEW navaidequipmentmonitoringpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidequipmentmonitoring_pt.id
    ) AS navaidequipmentmonitoringpropertytype
FROM

-- NavaidEquipmentMonitoringType
LEFT JOIN navaids_points.navaidequipmentmonitoring_pt
ON navaids_points.navaidequipmentmonitoring_pt.navaidequipmentmonitoring_id = NavaidEquipmentMonitoringType.id

;

NavaidEquipmentMonitoringType
CREATE OR REPLACE VIEW navaidequipmentmonitoringtype_view AS
SELECT
    jsonb_build_object(
       'monitored_value', navaids_points.navaidequipmentmonitoring.monitored_value,
       'monitored_nilreason', navaids_points.navaidequipmentmonitoring.monitored_nilreason,
       'id', navaids_points.navaidequipmentmonitoring.id,
       'identifier', navaids_points.navaidequipmentmonitoring.identifier,
       'identifier_code_space', navaids_points.navaidequipmentmonitoring.identifier_code_space,
       'xml_id', navaids_points.navaidequipmentmonitoring.xml_id
    ) AS navaidequipmentmonitoringtype
FROM

-- AbstractExtensionType
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON navaids_points.navaidequipmentmonitoring.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON navaids_points.navaidequipmentmonitoring.abstractnavaidequipmentmonitoringextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaidequipmentmonitoring.id = master_join.source_id
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaidequipmentmonitoring.id = master_join.source_id
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaidequipmentmonitoring.id = master_join.source_id
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

NavaidEquipmentPropertyType
CREATE OR REPLACE VIEW navaidequipmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidequipment_pt.id,
       'nilReason', navaids_points.navaidequipment_pt.nilReason
    ) AS navaidequipmentpropertytype
FROM


;

NavaidOperationalStatusPropertyType
CREATE OR REPLACE VIEW navaidoperationalstatuspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidoperationalstatus_pt.id
    ) AS navaidoperationalstatuspropertytype
FROM

-- NavaidOperationalStatusType
LEFT JOIN navaids_points.navaidoperationalstatus_pt
ON navaids_points.navaidoperationalstatus_pt.navaidoperationalstatus_id = NavaidOperationalStatusType.id

;

NavaidOperationalStatusType
CREATE OR REPLACE VIEW navaidoperationalstatustype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', navaids_points.navaidoperationalstatus.operationalstatus_value,
       'operationalstatus_nilreason', navaids_points.navaidoperationalstatus.operationalstatus_nilreason,
       'signaltype_value', navaids_points.navaidoperationalstatus.signaltype_value,
       'signaltype_nilreason', navaids_points.navaidoperationalstatus.signaltype_nilreason,
       'id', navaids_points.navaidoperationalstatus.id,
       'identifier', navaids_points.navaidoperationalstatus.identifier,
       'identifier_code_space', navaids_points.navaidoperationalstatus.identifier_code_space,
       'xml_id', navaids_points.navaidoperationalstatus.xml_id
    ) AS navaidoperationalstatustype
FROM

-- AbstractExtensionType
LEFT JOIN navaids_points.navaidoperationalstatus
ON navaids_points.navaidoperationalstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidoperationalstatus
ON navaids_points.navaidoperationalstatus.abstractnavaidoperationalstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaidoperationalstatus.id = master_join.source_id
LEFT JOIN navaids_points.navaidoperationalstatus
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaidoperationalstatus.id = master_join.source_id
LEFT JOIN navaids_points.navaidoperationalstatus
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaidoperationalstatus.id = master_join.source_id
LEFT JOIN navaids_points.navaidoperationalstatus
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

NavaidPropertyType
CREATE OR REPLACE VIEW navaidpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaid_pt.id,
       'nilReason', navaids_points.navaid_pt.nilReason
    ) AS navaidpropertytype
FROM


;

NavaidTimeSlicePropertyType
CREATE OR REPLACE VIEW navaidtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaid_tsp.id
    ) AS navaidtimeslicepropertytype
FROM

-- NavaidTimeSliceType
LEFT JOIN navaids_points.navaid_tsp
ON navaids_points.navaid_tsp.navaidtimeslice_id = NavaidTimeSliceType.id

;

NavaidTimeSliceType
CREATE OR REPLACE VIEW navaidtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', navaids_points.navaid_ts.type_value,
       'type_nilreason', navaids_points.navaid_ts.type_nilreason,
       'designator_value', navaids_points.navaid_ts.designator_value,
       'designator_nilreason', navaids_points.navaid_ts.designator_nilreason,
       'name_value', navaids_points.navaid_ts.name_value,
       'name_nilreason', navaids_points.navaid_ts.name_nilreason,
       'flightchecked_value', navaids_points.navaid_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.navaid_ts.flightchecked_nilreason,
       'purpose_value', navaids_points.navaid_ts.purpose_value,
       'purpose_nilreason', navaids_points.navaid_ts.purpose_nilreason,
       'signalperformance_value', navaids_points.navaid_ts.signalperformance_value,
       'signalperformance_nilreason', navaids_points.navaid_ts.signalperformance_nilreason,
       'coursequality_value', navaids_points.navaid_ts.coursequality_value,
       'coursequality_nilreason', navaids_points.navaid_ts.coursequality_nilreason,
       'integritylevel_value', navaids_points.navaid_ts.integritylevel_value,
       'integritylevel_nilreason', navaids_points.navaid_ts.integritylevel_nilreason,
       'id', navaids_points.navaid_ts.id,
       'xml_id', navaids_points.navaid_ts.xml_id,
       'interpretation', navaids_points.navaid_ts.interpretation,
       'sequence_number', navaids_points.navaid_ts.sequence_number,
       'correction_number', navaids_points.navaid_ts.correction_number,
       'valid_time_begin', navaids_points.navaid_ts.valid_time_begin,
       'valid_time_end', navaids_points.navaid_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.navaid_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.navaid_ts.feature_lifetime_end
    ) AS navaidtimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.navaid_ts
ON navaids_points.navaid_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaid_ts
ON navaids_points.navaid_ts.abstractnavaidextension_id = AbstractExtensionType.id

-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaid_ts.id = master_join.source_id
LEFT JOIN navaids_points.navaid_ts
ON master_join.target_id = TouchDownLiftOffPropertyType.id
-- NavaidComponentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaid_ts.id = master_join.source_id
LEFT JOIN navaids_points.navaid_ts
ON master_join.target_id = NavaidComponentPropertyType.id
-- RunwayDirectionPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaid_ts.id = master_join.source_id
LEFT JOIN navaids_points.navaid_ts
ON master_join.target_id = RunwayDirectionPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaid_ts.id = master_join.source_id
LEFT JOIN navaids_points.navaid_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaid_ts.id = master_join.source_id
LEFT JOIN navaids_points.navaid_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaid_ts.id = master_join.source_id
LEFT JOIN navaids_points.navaid_ts
ON master_join.target_id = NotePropertyType.id
;

NavaidType
CREATE OR REPLACE VIEW navaidtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaid.id,
       'identifier', navaids_points.navaid.identifier,
       'identifier_code_space', navaids_points.navaid.identifier_code_space,
       'xml_id', navaids_points.navaid.xml_id
    ) AS navaidtype
FROM


-- NavaidTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.navaid.id = master_join.source_id
LEFT JOIN navaids_points.navaid
ON master_join.target_id = NavaidTimeSlicePropertyType.id
;

NavigationAreaPropertyType
CREATE OR REPLACE VIEW navigationareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarea_pt.id,
       'nilReason', procedure.navigationarea_pt.nilReason
    ) AS navigationareapropertytype
FROM


;

NavigationAreaRestrictionPropertyType
CREATE OR REPLACE VIEW navigationarearestrictionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarearestriction_pt.id,
       'nilReason', procedure.navigationarearestriction_pt.nilReason
    ) AS navigationarearestrictionpropertytype
FROM


;

NavigationAreaRestrictionTimeSlicePropertyType
CREATE OR REPLACE VIEW navigationarearestrictiontimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarearestriction_tsp.id
    ) AS navigationarearestrictiontimeslicepropertytype
FROM

-- NavigationAreaRestrictionTimeSliceType
LEFT JOIN procedure.navigationarearestriction_tsp
ON procedure.navigationarearestriction_tsp.navigationarearestrictiontimeslice_id = NavigationAreaRestrictionTimeSliceType.id

;

NavigationAreaRestrictionTimeSliceType
CREATE OR REPLACE VIEW navigationarearestrictiontimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', procedure.navigationarearestriction_ts.type_value,
       'type_nilreason', procedure.navigationarearestriction_ts.type_nilreason,
       'id', procedure.navigationarearestriction_ts.id,
       'xml_id', procedure.navigationarearestriction_ts.xml_id,
       'interpretation', procedure.navigationarearestriction_ts.interpretation,
       'sequence_number', procedure.navigationarearestriction_ts.sequence_number,
       'correction_number', procedure.navigationarearestriction_ts.correction_number,
       'valid_time_begin', procedure.navigationarearestriction_ts.valid_time_begin,
       'valid_time_end', procedure.navigationarearestriction_ts.valid_time_end,
       'feature_lifetime_begin', procedure.navigationarearestriction_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.navigationarearestriction_ts.feature_lifetime_end
    ) AS navigationarearestrictiontimeslicetype
FROM

-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.navigationarearestriction_ts
ON procedure.navigationarearestriction_ts.designsurface_id = ObstacleAssessmentAreaPropertyType.id
-- CircleSectorPropertyType
LEFT JOIN procedure.navigationarearestriction_ts
ON procedure.navigationarearestriction_ts.sectordefinition_id = CircleSectorPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.navigationarearestriction_ts
ON procedure.navigationarearestriction_ts.abstractnavigationarearestrictionextension_id = AbstractExtensionType.id

-- ProcedurePropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationarearestriction_ts.id = master_join.source_id
LEFT JOIN procedure.navigationarearestriction_ts
ON master_join.target_id = ProcedurePropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationarearestriction_ts.id = master_join.source_id
LEFT JOIN procedure.navigationarearestriction_ts
ON master_join.target_id = NotePropertyType.id
;

NavigationAreaRestrictionType
CREATE OR REPLACE VIEW navigationarearestrictiontype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarearestriction.id,
       'identifier', procedure.navigationarearestriction.identifier,
       'identifier_code_space', procedure.navigationarearestriction.identifier_code_space,
       'xml_id', procedure.navigationarearestriction.xml_id
    ) AS navigationarearestrictiontype
FROM


-- NavigationAreaRestrictionTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationarearestriction.id = master_join.source_id
LEFT JOIN procedure.navigationarearestriction
ON master_join.target_id = NavigationAreaRestrictionTimeSlicePropertyType.id
;

NavigationAreaSectorPropertyType
CREATE OR REPLACE VIEW navigationareasectorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationareasector_pt.id
    ) AS navigationareasectorpropertytype
FROM

-- NavigationAreaSectorType
LEFT JOIN procedure.navigationareasector_pt
ON procedure.navigationareasector_pt.navigationareasector_id = NavigationAreaSectorType.id

;

NavigationAreaSectorType
CREATE OR REPLACE VIEW navigationareasectortype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationareasector.id,
       'identifier', procedure.navigationareasector.identifier,
       'identifier_code_space', procedure.navigationareasector.identifier_code_space,
       'xml_id', procedure.navigationareasector.xml_id
    ) AS navigationareasectortype
FROM

-- CircleSectorPropertyType
LEFT JOIN procedure.navigationareasector
ON procedure.navigationareasector.sectordefinition_id = CircleSectorPropertyType.id
-- SurfacePropertyType
LEFT JOIN procedure.navigationareasector
ON procedure.navigationareasector.extent_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.navigationareasector
ON procedure.navigationareasector.abstractnavigationareasectorextension_id = AbstractExtensionType.id

-- ObstructionPropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationareasector.id = master_join.source_id
LEFT JOIN procedure.navigationareasector
ON master_join.target_id = ObstructionPropertyType.id
-- SectorDesignPropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationareasector.id = master_join.source_id
LEFT JOIN procedure.navigationareasector
ON master_join.target_id = SectorDesignPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationareasector.id = master_join.source_id
LEFT JOIN procedure.navigationareasector
ON master_join.target_id = NotePropertyType.id
;

NavigationAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW navigationareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarea_tsp.id
    ) AS navigationareatimeslicepropertytype
FROM

-- NavigationAreaTimeSliceType
LEFT JOIN procedure.navigationarea_tsp
ON procedure.navigationarea_tsp.navigationareatimeslice_id = NavigationAreaTimeSliceType.id

;

NavigationAreaTimeSliceType
CREATE OR REPLACE VIEW navigationareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'navigationareatype_value', procedure.navigationarea_ts.navigationareatype_value,
       'navigationareatype_nilreason', procedure.navigationarea_ts.navigationareatype_nilreason,
       'minimumceiling_value', procedure.navigationarea_ts.minimumceiling_value,
       'minimumceiling_uom', procedure.navigationarea_ts.minimumceiling_uom,
       'minimumceiling_nilreason', procedure.navigationarea_ts.minimumceiling_nilreason,
       'minimumvisibility_value', procedure.navigationarea_ts.minimumvisibility_value,
       'minimumvisibility_uom', procedure.navigationarea_ts.minimumvisibility_uom,
       'minimumvisibility_nilreason', procedure.navigationarea_ts.minimumvisibility_nilreason,
       'id', procedure.navigationarea_ts.id,
       'xml_id', procedure.navigationarea_ts.xml_id,
       'interpretation', procedure.navigationarea_ts.interpretation,
       'sequence_number', procedure.navigationarea_ts.sequence_number,
       'correction_number', procedure.navigationarea_ts.correction_number,
       'valid_time_begin', procedure.navigationarea_ts.valid_time_begin,
       'valid_time_end', procedure.navigationarea_ts.valid_time_end,
       'feature_lifetime_begin', procedure.navigationarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.navigationarea_ts.feature_lifetime_end
    ) AS navigationareatimeslicetype
FROM

-- StandardInstrumentDeparturePropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.departure_id = StandardInstrumentDeparturePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_position_id = PointPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.abstractnavigationareaextension_id = AbstractExtensionType.id

-- NavigationAreaSectorPropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationarea_ts.id = master_join.source_id
LEFT JOIN procedure.navigationarea_ts
ON master_join.target_id = NavigationAreaSectorPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationarea_ts.id = master_join.source_id
LEFT JOIN procedure.navigationarea_ts
ON master_join.target_id = NotePropertyType.id
;

NavigationAreaType
CREATE OR REPLACE VIEW navigationareatype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarea.id,
       'identifier', procedure.navigationarea.identifier,
       'identifier_code_space', procedure.navigationarea.identifier_code_space,
       'xml_id', procedure.navigationarea.xml_id
    ) AS navigationareatype
FROM


-- NavigationAreaTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.navigationarea.id = master_join.source_id
LEFT JOIN procedure.navigationarea
ON master_join.target_id = NavigationAreaTimeSlicePropertyType.id
;

NavigationSystemCheckpointPropertyType
CREATE OR REPLACE VIEW navigationsystemcheckpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navigationsystemcheckpoint_pt.id,
       'nilReason', navaids_points.navigationsystemcheckpoint_pt.nilReason
    ) AS navigationsystemcheckpointpropertytype
FROM


;

NDBPropertyType
CREATE OR REPLACE VIEW ndbpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.ndb_pt.id,
       'nilReason', navaids_points.ndb_pt.nilReason
    ) AS ndbpropertytype
FROM


;

NDBTimeSlicePropertyType
CREATE OR REPLACE VIEW ndbtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.ndb_tsp.id
    ) AS ndbtimeslicepropertytype
FROM

-- NDBTimeSliceType
LEFT JOIN navaids_points.ndb_tsp
ON navaids_points.ndb_tsp.ndbtimeslice_id = NDBTimeSliceType.id

;

NDBTimeSliceType
CREATE OR REPLACE VIEW ndbtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.ndb_ts.designator_value,
       'designator_nilreason', navaids_points.ndb_ts.designator_nilreason,
       'name_value', navaids_points.ndb_ts.name_value,
       'name_nilreason', navaids_points.ndb_ts.name_nilreason,
       'emissionclass_value', navaids_points.ndb_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.ndb_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.ndb_ts.mobile_value,
       'mobile_nilreason', navaids_points.ndb_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.ndb_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.ndb_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.ndb_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.ndb_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.ndb_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.ndb_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.ndb_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.ndb_ts.flightchecked_nilreason,
       'class_value', navaids_points.ndb_ts.class_value,
       'class_nilreason', navaids_points.ndb_ts.class_nilreason,
       'emissionband_value', navaids_points.ndb_ts.emissionband_value,
       'emissionband_nilreason', navaids_points.ndb_ts.emissionband_nilreason,
       'frequency_value', navaids_points.ndb_ts.frequency_value,
       'frequency_uom', navaids_points.ndb_ts.frequency_uom,
       'frequency_nilreason', navaids_points.ndb_ts.frequency_nilreason,
       'id', navaids_points.ndb_ts.id,
       'xml_id', navaids_points.ndb_ts.xml_id,
       'interpretation', navaids_points.ndb_ts.interpretation,
       'sequence_number', navaids_points.ndb_ts.sequence_number,
       'correction_number', navaids_points.ndb_ts.correction_number,
       'valid_time_begin', navaids_points.ndb_ts.valid_time_begin,
       'valid_time_end', navaids_points.ndb_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.ndb_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.ndb_ts.feature_lifetime_end
    ) AS ndbtimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.ndb_ts
ON navaids_points.ndb_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.ndb_ts
ON navaids_points.ndb_ts.abstractndbextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.ndb_ts
ON navaids_points.ndb_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.ndb_ts.id = master_join.source_id
LEFT JOIN navaids_points.ndb_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.ndb_ts.id = master_join.source_id
LEFT JOIN navaids_points.ndb_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.ndb_ts.id = master_join.source_id
LEFT JOIN navaids_points.ndb_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.ndb_ts.id = master_join.source_id
LEFT JOIN navaids_points.ndb_ts
ON master_join.target_id = NotePropertyType.id
;

NDBType
CREATE OR REPLACE VIEW ndbtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.ndb.id,
       'identifier', navaids_points.ndb.identifier,
       'identifier_code_space', navaids_points.ndb.identifier_code_space,
       'xml_id', navaids_points.ndb.xml_id
    ) AS ndbtype
FROM


-- NDBTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.ndb.id = master_join.source_id
LEFT JOIN navaids_points.ndb
ON master_join.target_id = NDBTimeSlicePropertyType.id
;

NitrogenPropertyType
CREATE OR REPLACE VIEW nitrogenpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.nitrogen_pt.id
    ) AS nitrogenpropertytype
FROM

-- NitrogenType
LEFT JOIN service.nitrogen_pt
ON service.nitrogen_pt.nitrogen_id = NitrogenType.id

;

NitrogenType
CREATE OR REPLACE VIEW nitrogentype_view AS
SELECT
    jsonb_build_object(
       'type_value', service.nitrogen.type_value,
       'type_nilreason', service.nitrogen.type_nilreason,
       'id', service.nitrogen.id,
       'identifier', service.nitrogen.identifier,
       'identifier_code_space', service.nitrogen.identifier_code_space,
       'xml_id', service.nitrogen.xml_id
    ) AS nitrogentype
FROM

-- AbstractExtensionType
LEFT JOIN service.nitrogen
ON service.nitrogen.abstractnitrogenextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.master_join
ON service.nitrogen.id = master_join.source_id
LEFT JOIN service.nitrogen
ON master_join.target_id = NotePropertyType.id
;

NonMovementAreaPropertyType
CREATE OR REPLACE VIEW nonmovementareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.nonmovementarea_pt.id,
       'nilReason', airport_heliport.nonmovementarea_pt.nilReason
    ) AS nonmovementareapropertytype
FROM


;

NonMovementAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW nonmovementareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.nonmovementarea_tsp.id
    ) AS nonmovementareatimeslicepropertytype
FROM

-- NonMovementAreaTimeSliceType
LEFT JOIN airport_heliport.nonmovementarea_tsp
ON airport_heliport.nonmovementarea_tsp.nonmovementareatimeslice_id = NonMovementAreaTimeSliceType.id

;

NonMovementAreaTimeSliceType
CREATE OR REPLACE VIEW nonmovementareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.nonmovementarea_ts.id,
       'xml_id', airport_heliport.nonmovementarea_ts.xml_id,
       'interpretation', airport_heliport.nonmovementarea_ts.interpretation,
       'sequence_number', airport_heliport.nonmovementarea_ts.sequence_number,
       'correction_number', airport_heliport.nonmovementarea_ts.correction_number,
       'valid_time_begin', airport_heliport.nonmovementarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.nonmovementarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.nonmovementarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.nonmovementarea_ts.feature_lifetime_end
    ) AS nonmovementareatimeslicetype
FROM

-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.nonmovementarea_ts
ON airport_heliport.nonmovementarea_ts.associatedairportheliport_id = AirportHeliportPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.nonmovementarea_ts
ON airport_heliport.nonmovementarea_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.nonmovementarea_ts
ON airport_heliport.nonmovementarea_ts.abstractnonmovementareaextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.nonmovementarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.nonmovementarea_ts
ON master_join.target_id = NotePropertyType.id
;

NonMovementAreaType
CREATE OR REPLACE VIEW nonmovementareatype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.nonmovementarea.id,
       'identifier', airport_heliport.nonmovementarea.identifier,
       'identifier_code_space', airport_heliport.nonmovementarea.identifier_code_space,
       'xml_id', airport_heliport.nonmovementarea.xml_id
    ) AS nonmovementareatype
FROM


-- NonMovementAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.nonmovementarea.id = master_join.source_id
LEFT JOIN airport_heliport.nonmovementarea
ON master_join.target_id = NonMovementAreaTimeSlicePropertyType.id
;

NotePropertyType
CREATE OR REPLACE VIEW notepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', notes.note_pt.id
    ) AS notepropertytype
FROM

-- NoteType
LEFT JOIN notes.note_pt
ON notes.note_pt.note_id = NoteType.id

;

NoteType
CREATE OR REPLACE VIEW notetype_view AS
SELECT
    jsonb_build_object(
       'propertyname_value', notes.note.propertyname_value,
       'propertyname_nilreason', notes.note.propertyname_nilreason,
       'purpose_value', notes.note.purpose_value,
       'purpose_nilreason', notes.note.purpose_nilreason,
       'id', notes.note.id,
       'identifier', notes.note.identifier,
       'identifier_code_space', notes.note.identifier_code_space,
       'xml_id', notes.note.xml_id
    ) AS notetype
FROM

-- AbstractExtensionType
LEFT JOIN notes.note
ON notes.note.abstractnoteextension_id = AbstractExtensionType.id

-- LinguisticNotePropertyType
LEFT JOIN notes.master_join
ON notes.note.id = master_join.source_id
LEFT JOIN notes.note
ON master_join.target_id = LinguisticNotePropertyType.id
;

ObstacleAreaPropertyType
CREATE OR REPLACE VIEW obstacleareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.obstaclearea_pt.id,
       'nilReason', obstacles.obstaclearea_pt.nilReason
    ) AS obstacleareapropertytype
FROM


;

ObstacleAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW obstacleareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.obstaclearea_tsp.id
    ) AS obstacleareatimeslicepropertytype
FROM

-- ObstacleAreaTimeSliceType
LEFT JOIN obstacles.obstaclearea_tsp
ON obstacles.obstaclearea_tsp.obstacleareatimeslice_id = ObstacleAreaTimeSliceType.id

;

ObstacleAreaTimeSliceType
CREATE OR REPLACE VIEW obstacleareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', obstacles.obstaclearea_ts.type_value,
       'type_nilreason', obstacles.obstaclearea_ts.type_nilreason,
       'obstructionidsurfacecondition_value', obstacles.obstaclearea_ts.obstructionidsurfacecondition_value,
       'obstructionidsurfacecondition_nilreason', obstacles.obstaclearea_ts.obstructionidsurfacecondition_nilreason,
       'id', obstacles.obstaclearea_ts.id,
       'xml_id', obstacles.obstaclearea_ts.xml_id,
       'interpretation', obstacles.obstaclearea_ts.interpretation,
       'sequence_number', obstacles.obstaclearea_ts.sequence_number,
       'correction_number', obstacles.obstaclearea_ts.correction_number,
       'valid_time_begin', obstacles.obstaclearea_ts.valid_time_begin,
       'valid_time_end', obstacles.obstaclearea_ts.valid_time_end,
       'feature_lifetime_begin', obstacles.obstaclearea_ts.feature_lifetime_begin,
       'feature_lifetime_end', obstacles.obstaclearea_ts.feature_lifetime_end
    ) AS obstacleareatimeslicetype
FROM

-- AirportHeliportPropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.reference_ownerairport_id = AirportHeliportPropertyType.id
-- RunwayDirectionPropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.reference_ownerrunway_id = RunwayDirectionPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.reference_ownerorganisation_id = OrganisationAuthorityPropertyType.id
-- SurfacePropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.surfaceextent_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.abstractobstacleareaextension_id = AbstractExtensionType.id

-- VerticalStructurePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.obstaclearea_ts.id = master_join.source_id
LEFT JOIN obstacles.obstaclearea_ts
ON master_join.target_id = VerticalStructurePropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.obstaclearea_ts.id = master_join.source_id
LEFT JOIN obstacles.obstaclearea_ts
ON master_join.target_id = NotePropertyType.id
;

ObstacleAreaType
CREATE OR REPLACE VIEW obstacleareatype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.obstaclearea.id,
       'identifier', obstacles.obstaclearea.identifier,
       'identifier_code_space', obstacles.obstaclearea.identifier_code_space,
       'xml_id', obstacles.obstaclearea.xml_id
    ) AS obstacleareatype
FROM


-- ObstacleAreaTimeSlicePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.obstaclearea.id = master_join.source_id
LEFT JOIN obstacles.obstaclearea
ON master_join.target_id = ObstacleAreaTimeSlicePropertyType.id
;

ObstacleAssessmentAreaPropertyType
CREATE OR REPLACE VIEW obstacleassessmentareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.obstacleassessmentarea_pt.id
    ) AS obstacleassessmentareapropertytype
FROM

-- ObstacleAssessmentAreaType
LEFT JOIN shared.obstacleassessmentarea_pt
ON shared.obstacleassessmentarea_pt.obstacleassessmentarea_id = ObstacleAssessmentAreaType.id

;

ObstacleAssessmentAreaType
CREATE OR REPLACE VIEW obstacleassessmentareatype_view AS
SELECT
    jsonb_build_object(
       'type_value', shared.obstacleassessmentarea.type_value,
       'type_nilreason', shared.obstacleassessmentarea.type_nilreason,
       'sectionnumber_value', shared.obstacleassessmentarea.sectionnumber_value,
       'sectionnumber_nilreason', shared.obstacleassessmentarea.sectionnumber_nilreason,
       'slope_value', shared.obstacleassessmentarea.slope_value,
       'slope_nilreason', shared.obstacleassessmentarea.slope_nilreason,
       'gradientlowhigh_value', shared.obstacleassessmentarea.gradientlowhigh_value,
       'gradientlowhigh_nilreason', shared.obstacleassessmentarea.gradientlowhigh_nilreason,
       'surfacezone_value', shared.obstacleassessmentarea.surfacezone_value,
       'surfacezone_nilreason', shared.obstacleassessmentarea.surfacezone_nilreason,
       'safetyregulation_value', shared.obstacleassessmentarea.safetyregulation_value,
       'safetyregulation_nilreason', shared.obstacleassessmentarea.safetyregulation_nilreason,
       'assessedaltitude_value', shared.obstacleassessmentarea.assessedaltitude_value,
       'assessedaltitude_uom', shared.obstacleassessmentarea.assessedaltitude_uom,
       'assessedaltitude_nilreason', shared.obstacleassessmentarea.assessedaltitude_nilreason,
       'slopeloweraltitude_value', shared.obstacleassessmentarea.slopeloweraltitude_value,
       'slopeloweraltitude_uom', shared.obstacleassessmentarea.slopeloweraltitude_uom,
       'slopeloweraltitude_nilreason', shared.obstacleassessmentarea.slopeloweraltitude_nilreason,
       'id', shared.obstacleassessmentarea.id,
       'identifier', shared.obstacleassessmentarea.identifier,
       'identifier_code_space', shared.obstacleassessmentarea.identifier_code_space,
       'xml_id', shared.obstacleassessmentarea.xml_id
    ) AS obstacleassessmentareatype
FROM

-- SurfacePropertyType
LEFT JOIN shared.obstacleassessmentarea
ON shared.obstacleassessmentarea.surface_id = SurfacePropertyType.id
-- CurvePropertyType
LEFT JOIN shared.obstacleassessmentarea
ON shared.obstacleassessmentarea.startingcurve_id = CurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.obstacleassessmentarea
ON shared.obstacleassessmentarea.abstractobstacleassessmentareaextension_id = AbstractExtensionType.id

-- AircraftCharacteristicPropertyType
LEFT JOIN shared.master_join
ON shared.obstacleassessmentarea.id = master_join.source_id
LEFT JOIN shared.obstacleassessmentarea
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ObstructionPropertyType
LEFT JOIN shared.master_join
ON shared.obstacleassessmentarea.id = master_join.source_id
LEFT JOIN shared.obstacleassessmentarea
ON master_join.target_id = ObstructionPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.obstacleassessmentarea.id = master_join.source_id
LEFT JOIN shared.obstacleassessmentarea
ON master_join.target_id = NotePropertyType.id
;

ObstaclePlacementPropertyType
CREATE OR REPLACE VIEW obstacleplacementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.obstacleplacement_pt.id
    ) AS obstacleplacementpropertytype
FROM

-- ObstaclePlacementType
LEFT JOIN shared.obstacleplacement_pt
ON shared.obstacleplacement_pt.obstacleplacement_id = ObstaclePlacementType.id

;

ObstaclePlacementType
CREATE OR REPLACE VIEW obstacleplacementtype_view AS
SELECT
    jsonb_build_object(
       'obstaclebearing_value', shared.obstacleplacement.obstaclebearing_value,
       'obstaclebearing_nilreason', shared.obstacleplacement.obstaclebearing_nilreason,
       'pointtype_value', shared.obstacleplacement.pointtype_value,
       'pointtype_nilreason', shared.obstacleplacement.pointtype_nilreason,
       'obstacleplacement_value', shared.obstacleplacement.obstacleplacement_value,
       'obstacleplacement_nilreason', shared.obstacleplacement.obstacleplacement_nilreason,
       'obstacledistance_value', shared.obstacleplacement.obstacledistance_value,
       'obstacledistance_uom', shared.obstacleplacement.obstacledistance_uom,
       'obstacledistance_nilreason', shared.obstacleplacement.obstacledistance_nilreason,
       'id', shared.obstacleplacement.id,
       'identifier', shared.obstacleplacement.identifier,
       'identifier_code_space', shared.obstacleplacement.identifier_code_space,
       'xml_id', shared.obstacleplacement.xml_id
    ) AS obstacleplacementtype
FROM

-- AbstractExtensionType
LEFT JOIN shared.obstacleplacement
ON shared.obstacleplacement.abstractobstacleplacementextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.obstacleplacement.id = master_join.source_id
LEFT JOIN shared.obstacleplacement
ON master_join.target_id = NotePropertyType.id
;

ObstructionPropertyType
CREATE OR REPLACE VIEW obstructionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.obstruction_pt.id
    ) AS obstructionpropertytype
FROM

-- ObstructionType
LEFT JOIN shared.obstruction_pt
ON shared.obstruction_pt.obstruction_id = ObstructionType.id

;

ObstructionType
CREATE OR REPLACE VIEW obstructiontype_view AS
SELECT
    jsonb_build_object(
       'surfacepenetration_value', shared.obstruction.surfacepenetration_value,
       'surfacepenetration_nilreason', shared.obstruction.surfacepenetration_nilreason,
       'slopepenetration_value', shared.obstruction.slopepenetration_value,
       'slopepenetration_nilreason', shared.obstruction.slopepenetration_nilreason,
       'controlling_value', shared.obstruction.controlling_value,
       'controlling_nilreason', shared.obstruction.controlling_nilreason,
       'closein_value', shared.obstruction.closein_value,
       'closein_nilreason', shared.obstruction.closein_nilreason,
       'requiredclearance_value', shared.obstruction.requiredclearance_value,
       'requiredclearance_uom', shared.obstruction.requiredclearance_uom,
       'requiredclearance_nilreason', shared.obstruction.requiredclearance_nilreason,
       'minimumaltitude_value', shared.obstruction.minimumaltitude_value,
       'minimumaltitude_uom', shared.obstruction.minimumaltitude_uom,
       'minimumaltitude_nilreason', shared.obstruction.minimumaltitude_nilreason,
       'id', shared.obstruction.id,
       'identifier', shared.obstruction.identifier,
       'identifier_code_space', shared.obstruction.identifier_code_space,
       'xml_id', shared.obstruction.xml_id
    ) AS obstructiontype
FROM

-- VerticalStructurePropertyType
LEFT JOIN shared.obstruction
ON shared.obstruction.theverticalstructure_id = VerticalStructurePropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.obstruction
ON shared.obstruction.abstractobstructionextension_id = AbstractExtensionType.id

-- AltitudeAdjustmentPropertyType
LEFT JOIN shared.master_join
ON shared.obstruction.id = master_join.source_id
LEFT JOIN shared.obstruction
ON master_join.target_id = AltitudeAdjustmentPropertyType.id
-- ObstaclePlacementPropertyType
LEFT JOIN shared.master_join
ON shared.obstruction.id = master_join.source_id
LEFT JOIN shared.obstruction
ON master_join.target_id = ObstaclePlacementPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.obstruction.id = master_join.source_id
LEFT JOIN shared.obstruction
ON master_join.target_id = NotePropertyType.id
;

OilPropertyType
CREATE OR REPLACE VIEW oilpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.oil_pt.id
    ) AS oilpropertytype
FROM

-- OilType
LEFT JOIN service.oil_pt
ON service.oil_pt.oil_id = OilType.id

;

OilType
CREATE OR REPLACE VIEW oiltype_view AS
SELECT
    jsonb_build_object(
       'category_value', service.oil.category_value,
       'category_nilreason', service.oil.category_nilreason,
       'id', service.oil.id,
       'identifier', service.oil.identifier,
       'identifier_code_space', service.oil.identifier_code_space,
       'xml_id', service.oil.xml_id
    ) AS oiltype
FROM

-- AbstractExtensionType
LEFT JOIN service.oil
ON service.oil.abstractoilextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.master_join
ON service.oil.id = master_join.source_id
LEFT JOIN service.oil
ON master_join.target_id = NotePropertyType.id
;

OnlineContactPropertyType
CREATE OR REPLACE VIEW onlinecontactpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.onlinecontact_pt.id
    ) AS onlinecontactpropertytype
FROM

-- OnlineContactType
LEFT JOIN shared.onlinecontact_pt
ON shared.onlinecontact_pt.onlinecontact_id = OnlineContactType.id

;

OnlineContactType
CREATE OR REPLACE VIEW onlinecontacttype_view AS
SELECT
    jsonb_build_object(
       'network_value', shared.onlinecontact.network_value,
       'network_nilreason', shared.onlinecontact.network_nilreason,
       'linkage_value', shared.onlinecontact.linkage_value,
       'linkage_nilreason', shared.onlinecontact.linkage_nilreason,
       'protocol_value', shared.onlinecontact.protocol_value,
       'protocol_nilreason', shared.onlinecontact.protocol_nilreason,
       'email_value', shared.onlinecontact.email_value,
       'email_nilreason', shared.onlinecontact.email_nilreason,
       'id', shared.onlinecontact.id,
       'identifier', shared.onlinecontact.identifier,
       'identifier_code_space', shared.onlinecontact.identifier_code_space,
       'xml_id', shared.onlinecontact.xml_id
    ) AS onlinecontacttype
FROM

-- AbstractExtensionType
LEFT JOIN shared.onlinecontact
ON shared.onlinecontact.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.onlinecontact
ON shared.onlinecontact.abstractonlinecontactextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.master_join
ON shared.onlinecontact.id = master_join.source_id
LEFT JOIN shared.onlinecontact
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.onlinecontact.id = master_join.source_id
LEFT JOIN shared.onlinecontact
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.master_join
ON shared.onlinecontact.id = master_join.source_id
LEFT JOIN shared.onlinecontact
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

OrganisationAuthorityAssociationPropertyType
CREATE OR REPLACE VIEW organisationauthorityassociationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.organisationauthorityassociation_pt.id
    ) AS organisationauthorityassociationpropertytype
FROM

-- OrganisationAuthorityAssociationType
LEFT JOIN organisation.organisationauthorityassociation_pt
ON organisation.organisationauthorityassociation_pt.organisationauthorityassociation_id = OrganisationAuthorityAssociationType.id

;

OrganisationAuthorityAssociationType
CREATE OR REPLACE VIEW organisationauthorityassociationtype_view AS
SELECT
    jsonb_build_object(
       'type_value', organisation.organisationauthorityassociation.type_value,
       'type_nilreason', organisation.organisationauthorityassociation.type_nilreason,
       'id', organisation.organisationauthorityassociation.id,
       'identifier', organisation.organisationauthorityassociation.identifier,
       'identifier_code_space', organisation.organisationauthorityassociation.identifier_code_space,
       'xml_id', organisation.organisationauthorityassociation.xml_id
    ) AS organisationauthorityassociationtype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN organisation.organisationauthorityassociation
ON organisation.organisationauthorityassociation.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN organisation.organisationauthorityassociation
ON organisation.organisationauthorityassociation.abstractorganisationauthorityassociationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN organisation.master_join
ON organisation.organisationauthorityassociation.id = master_join.source_id
LEFT JOIN organisation.organisationauthorityassociation
ON master_join.target_id = NotePropertyType.id
;

OrganisationAuthorityPropertyType
CREATE OR REPLACE VIEW organisationauthoritypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.organisationauthority_pt.id,
       'nilReason', organisation.organisationauthority_pt.nilReason
    ) AS organisationauthoritypropertytype
FROM


;

OrganisationAuthorityTimeSlicePropertyType
CREATE OR REPLACE VIEW organisationauthoritytimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.organisationauthority_tsp.id
    ) AS organisationauthoritytimeslicepropertytype
FROM

-- OrganisationAuthorityTimeSliceType
LEFT JOIN organisation.organisationauthority_tsp
ON organisation.organisationauthority_tsp.organisationauthoritytimeslice_id = OrganisationAuthorityTimeSliceType.id

;

OrganisationAuthorityTimeSliceType
CREATE OR REPLACE VIEW organisationauthoritytimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', organisation.organisationauthority_ts.name_value,
       'name_nilreason', organisation.organisationauthority_ts.name_nilreason,
       'designator_value', organisation.organisationauthority_ts.designator_value,
       'designator_nilreason', organisation.organisationauthority_ts.designator_nilreason,
       'type_value', organisation.organisationauthority_ts.type_value,
       'type_nilreason', organisation.organisationauthority_ts.type_nilreason,
       'military_value', organisation.organisationauthority_ts.military_value,
       'military_nilreason', organisation.organisationauthority_ts.military_nilreason,
       'id', organisation.organisationauthority_ts.id,
       'xml_id', organisation.organisationauthority_ts.xml_id,
       'interpretation', organisation.organisationauthority_ts.interpretation,
       'sequence_number', organisation.organisationauthority_ts.sequence_number,
       'correction_number', organisation.organisationauthority_ts.correction_number,
       'valid_time_begin', organisation.organisationauthority_ts.valid_time_begin,
       'valid_time_end', organisation.organisationauthority_ts.valid_time_end,
       'feature_lifetime_begin', organisation.organisationauthority_ts.feature_lifetime_begin,
       'feature_lifetime_end', organisation.organisationauthority_ts.feature_lifetime_end
    ) AS organisationauthoritytimeslicetype
FROM

-- AbstractExtensionType
LEFT JOIN organisation.organisationauthority_ts
ON organisation.organisationauthority_ts.abstractorganisationauthorityextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN organisation.master_join
ON organisation.organisationauthority_ts.id = master_join.source_id
LEFT JOIN organisation.organisationauthority_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- OrganisationAuthorityAssociationPropertyType
LEFT JOIN organisation.master_join
ON organisation.organisationauthority_ts.id = master_join.source_id
LEFT JOIN organisation.organisationauthority_ts
ON master_join.target_id = OrganisationAuthorityAssociationPropertyType.id
-- NotePropertyType
LEFT JOIN organisation.master_join
ON organisation.organisationauthority_ts.id = master_join.source_id
LEFT JOIN organisation.organisationauthority_ts
ON master_join.target_id = NotePropertyType.id
;

OrganisationAuthorityType
CREATE OR REPLACE VIEW organisationauthoritytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.organisationauthority.id,
       'identifier', organisation.organisationauthority.identifier,
       'identifier_code_space', organisation.organisationauthority.identifier_code_space,
       'xml_id', organisation.organisationauthority.xml_id
    ) AS organisationauthoritytype
FROM


-- OrganisationAuthorityTimeSlicePropertyType
LEFT JOIN organisation.master_join
ON organisation.organisationauthority.id = master_join.source_id
LEFT JOIN organisation.organisationauthority
ON master_join.target_id = OrganisationAuthorityTimeSlicePropertyType.id
;

OxygenPropertyType
CREATE OR REPLACE VIEW oxygenpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.oxygen_pt.id
    ) AS oxygenpropertytype
FROM

-- OxygenType
LEFT JOIN service.oxygen_pt
ON service.oxygen_pt.oxygen_id = OxygenType.id

;

OxygenType
CREATE OR REPLACE VIEW oxygentype_view AS
SELECT
    jsonb_build_object(
       'type_value', service.oxygen.type_value,
       'type_nilreason', service.oxygen.type_nilreason,
       'id', service.oxygen.id,
       'identifier', service.oxygen.identifier,
       'identifier_code_space', service.oxygen.identifier_code_space,
       'xml_id', service.oxygen.xml_id
    ) AS oxygentype
FROM

-- AbstractExtensionType
LEFT JOIN service.oxygen
ON service.oxygen.abstractoxygenextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.master_join
ON service.oxygen.id = master_join.source_id
LEFT JOIN service.oxygen
ON master_join.target_id = NotePropertyType.id
;

PassengerLoadingBridgePropertyType
CREATE OR REPLACE VIEW passengerloadingbridgepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.passengerloadingbridge_pt.id,
       'nilReason', airport_heliport.passengerloadingbridge_pt.nilReason
    ) AS passengerloadingbridgepropertytype
FROM


;

PassengerLoadingBridgeTimeSlicePropertyType
CREATE OR REPLACE VIEW passengerloadingbridgetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.passengerloadingbridge_tsp.id
    ) AS passengerloadingbridgetimeslicepropertytype
FROM

-- PassengerLoadingBridgeTimeSliceType
LEFT JOIN airport_heliport.passengerloadingbridge_tsp
ON airport_heliport.passengerloadingbridge_tsp.passengerloadingbridgetimeslice_id = PassengerLoadingBridgeTimeSliceType.id

;

PassengerLoadingBridgeTimeSliceType
CREATE OR REPLACE VIEW passengerloadingbridgetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.passengerloadingbridge_ts.type_value,
       'type_nilreason', airport_heliport.passengerloadingbridge_ts.type_nilreason,
       'id', airport_heliport.passengerloadingbridge_ts.id,
       'xml_id', airport_heliport.passengerloadingbridge_ts.xml_id,
       'interpretation', airport_heliport.passengerloadingbridge_ts.interpretation,
       'sequence_number', airport_heliport.passengerloadingbridge_ts.sequence_number,
       'correction_number', airport_heliport.passengerloadingbridge_ts.correction_number,
       'valid_time_begin', airport_heliport.passengerloadingbridge_ts.valid_time_begin,
       'valid_time_end', airport_heliport.passengerloadingbridge_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.passengerloadingbridge_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.passengerloadingbridge_ts.feature_lifetime_end
    ) AS passengerloadingbridgetimeslicetype
FROM

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON airport_heliport.passengerloadingbridge_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON airport_heliport.passengerloadingbridge_ts.abstractpassengerloadingbridgeextension_id = AbstractExtensionType.id

-- AircraftStandPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.passengerloadingbridge_ts.id = master_join.source_id
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON master_join.target_id = AircraftStandPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.passengerloadingbridge_ts.id = master_join.source_id
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON master_join.target_id = NotePropertyType.id
;

PassengerLoadingBridgeType
CREATE OR REPLACE VIEW passengerloadingbridgetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.passengerloadingbridge.id,
       'identifier', airport_heliport.passengerloadingbridge.identifier,
       'identifier_code_space', airport_heliport.passengerloadingbridge.identifier_code_space,
       'xml_id', airport_heliport.passengerloadingbridge.xml_id
    ) AS passengerloadingbridgetype
FROM


-- PassengerLoadingBridgeTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.passengerloadingbridge.id = master_join.source_id
LEFT JOIN airport_heliport.passengerloadingbridge
ON master_join.target_id = PassengerLoadingBridgeTimeSlicePropertyType.id
;

PassengerServicePropertyType
CREATE OR REPLACE VIEW passengerservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.passengerservice_pt.id,
       'nilReason', service.passengerservice_pt.nilReason
    ) AS passengerservicepropertytype
FROM


;

PassengerServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW passengerservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.passengerservice_tsp.id
    ) AS passengerservicetimeslicepropertytype
FROM

-- PassengerServiceTimeSliceType
LEFT JOIN service.passengerservice_tsp
ON service.passengerservice_tsp.passengerservicetimeslice_id = PassengerServiceTimeSliceType.id

;

PassengerServiceTimeSliceType
CREATE OR REPLACE VIEW passengerservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.passengerservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.passengerservice_ts.flightoperations_nilreason,
       'rank_value', service.passengerservice_ts.rank_value,
       'rank_nilreason', service.passengerservice_ts.rank_nilreason,
       'complianticao_value', service.passengerservice_ts.complianticao_value,
       'complianticao_nilreason', service.passengerservice_ts.complianticao_nilreason,
       'name_value', service.passengerservice_ts.name_value,
       'name_nilreason', service.passengerservice_ts.name_nilreason,
       'type_value', service.passengerservice_ts.type_value,
       'type_nilreason', service.passengerservice_ts.type_nilreason,
       'id', service.passengerservice_ts.id,
       'xml_id', service.passengerservice_ts.xml_id,
       'interpretation', service.passengerservice_ts.interpretation,
       'sequence_number', service.passengerservice_ts.sequence_number,
       'correction_number', service.passengerservice_ts.correction_number,
       'valid_time_begin', service.passengerservice_ts.valid_time_begin,
       'valid_time_end', service.passengerservice_ts.valid_time_end,
       'feature_lifetime_begin', service.passengerservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.passengerservice_ts.feature_lifetime_end
    ) AS passengerservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.passengerservice_ts
ON service.passengerservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.passengerservice_ts
ON service.passengerservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.passengerservice_ts
ON service.passengerservice_ts.abstractpassengerserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.passengerservice_ts
ON service.passengerservice_ts.abstractairportgroundserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.passengerservice_ts
ON service.passengerservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.passengerservice_ts.id = master_join.source_id
LEFT JOIN service.passengerservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.passengerservice_ts.id = master_join.source_id
LEFT JOIN service.passengerservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.passengerservice_ts.id = master_join.source_id
LEFT JOIN service.passengerservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.passengerservice_ts.id = master_join.source_id
LEFT JOIN service.passengerservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.passengerservice_ts.id = master_join.source_id
LEFT JOIN service.passengerservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.master_join
ON service.passengerservice_ts.id = master_join.source_id
LEFT JOIN service.passengerservice_ts
ON master_join.target_id = AirportHeliportPropertyType.id
;

PassengerServiceType
CREATE OR REPLACE VIEW passengerservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.passengerservice.id,
       'identifier', service.passengerservice.identifier,
       'identifier_code_space', service.passengerservice.identifier_code_space,
       'xml_id', service.passengerservice.xml_id
    ) AS passengerservicetype
FROM


-- PassengerServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.passengerservice.id = master_join.source_id
LEFT JOIN service.passengerservice
ON master_join.target_id = PassengerServiceTimeSlicePropertyType.id
;

PilotControlledLightingPropertyType
CREATE OR REPLACE VIEW pilotcontrolledlightingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.pilotcontrolledlighting_pt.id,
       'nilReason', service.pilotcontrolledlighting_pt.nilReason
    ) AS pilotcontrolledlightingpropertytype
FROM


;

PilotControlledLightingTimeSlicePropertyType
CREATE OR REPLACE VIEW pilotcontrolledlightingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.pilotcontrolledlighting_tsp.id
    ) AS pilotcontrolledlightingtimeslicepropertytype
FROM

-- PilotControlledLightingTimeSliceType
LEFT JOIN service.pilotcontrolledlighting_tsp
ON service.pilotcontrolledlighting_tsp.pilotcontrolledlightingtimeslice_id = PilotControlledLightingTimeSliceType.id

;

PilotControlledLightingTimeSliceType
CREATE OR REPLACE VIEW pilotcontrolledlightingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', service.pilotcontrolledlighting_ts.type_value,
       'type_nilreason', service.pilotcontrolledlighting_ts.type_nilreason,
       'intensitysteps_value', service.pilotcontrolledlighting_ts.intensitysteps_value,
       'intensitysteps_nilreason', service.pilotcontrolledlighting_ts.intensitysteps_nilreason,
       'standbyintensity_value', service.pilotcontrolledlighting_ts.standbyintensity_value,
       'standbyintensity_nilreason', service.pilotcontrolledlighting_ts.standbyintensity_nilreason,
       'activationinstruction_value', service.pilotcontrolledlighting_ts.activationinstruction_value,
       'activationinstruction_nilreason', service.pilotcontrolledlighting_ts.activationinstruction_nilreason,
       'duration_value', service.pilotcontrolledlighting_ts.duration_value,
       'duration_uom', service.pilotcontrolledlighting_ts.duration_uom,
       'duration_nilreason', service.pilotcontrolledlighting_ts.duration_nilreason,
       'radiofrequency_value', service.pilotcontrolledlighting_ts.radiofrequency_value,
       'radiofrequency_uom', service.pilotcontrolledlighting_ts.radiofrequency_uom,
       'radiofrequency_nilreason', service.pilotcontrolledlighting_ts.radiofrequency_nilreason,
       'id', service.pilotcontrolledlighting_ts.id,
       'xml_id', service.pilotcontrolledlighting_ts.xml_id,
       'interpretation', service.pilotcontrolledlighting_ts.interpretation,
       'sequence_number', service.pilotcontrolledlighting_ts.sequence_number,
       'correction_number', service.pilotcontrolledlighting_ts.correction_number,
       'valid_time_begin', service.pilotcontrolledlighting_ts.valid_time_begin,
       'valid_time_end', service.pilotcontrolledlighting_ts.valid_time_end,
       'feature_lifetime_begin', service.pilotcontrolledlighting_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.pilotcontrolledlighting_ts.feature_lifetime_end
    ) AS pilotcontrolledlightingtimeslicetype
FROM

-- AbstractExtensionType
LEFT JOIN service.pilotcontrolledlighting_ts
ON service.pilotcontrolledlighting_ts.abstractpilotcontrolledlightingextension_id = AbstractExtensionType.id

-- LightActivationPropertyType
LEFT JOIN service.master_join
ON service.pilotcontrolledlighting_ts.id = master_join.source_id
LEFT JOIN service.pilotcontrolledlighting_ts
ON master_join.target_id = LightActivationPropertyType.id
-- GroundLightSystemPropertyType
LEFT JOIN service.master_join
ON service.pilotcontrolledlighting_ts.id = master_join.source_id
LEFT JOIN service.pilotcontrolledlighting_ts
ON master_join.target_id = GroundLightSystemPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.pilotcontrolledlighting_ts.id = master_join.source_id
LEFT JOIN service.pilotcontrolledlighting_ts
ON master_join.target_id = NotePropertyType.id
;

PilotControlledLightingType
CREATE OR REPLACE VIEW pilotcontrolledlightingtype_view AS
SELECT
    jsonb_build_object(
       'id', service.pilotcontrolledlighting.id,
       'identifier', service.pilotcontrolledlighting.identifier,
       'identifier_code_space', service.pilotcontrolledlighting.identifier_code_space,
       'xml_id', service.pilotcontrolledlighting.xml_id
    ) AS pilotcontrolledlightingtype
FROM


-- PilotControlledLightingTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.pilotcontrolledlighting.id = master_join.source_id
LEFT JOIN service.pilotcontrolledlighting
ON master_join.target_id = PilotControlledLightingTimeSlicePropertyType.id
;

PointReferencePropertyType
CREATE OR REPLACE VIEW pointreferencepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.pointreference_pt.id
    ) AS pointreferencepropertytype
FROM

-- PointReferenceType
LEFT JOIN navaids_points.pointreference_pt
ON navaids_points.pointreference_pt.pointreference_id = PointReferenceType.id

;

PointReferenceType
CREATE OR REPLACE VIEW pointreferencetype_view AS
SELECT
    jsonb_build_object(
       'role_value', navaids_points.pointreference.role_value,
       'role_nilreason', navaids_points.pointreference.role_nilreason,
       'priorfixtolerance_value', navaids_points.pointreference.priorfixtolerance_value,
       'priorfixtolerance_uom', navaids_points.pointreference.priorfixtolerance_uom,
       'priorfixtolerance_nilreason', navaids_points.pointreference.priorfixtolerance_nilreason,
       'postfixtolerance_value', navaids_points.pointreference.postfixtolerance_value,
       'postfixtolerance_uom', navaids_points.pointreference.postfixtolerance_uom,
       'postfixtolerance_nilreason', navaids_points.pointreference.postfixtolerance_nilreason,
       'id', navaids_points.pointreference.id,
       'identifier', navaids_points.pointreference.identifier,
       'identifier_code_space', navaids_points.pointreference.identifier_code_space,
       'xml_id', navaids_points.pointreference.xml_id
    ) AS pointreferencetype
FROM

-- DesignatedPointPropertyType
LEFT JOIN navaids_points.pointreference
ON navaids_points.pointreference.point_id = DesignatedPointPropertyType.id
-- SurfacePropertyType
LEFT JOIN navaids_points.pointreference
ON navaids_points.pointreference.fixtolerancearea_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.pointreference
ON navaids_points.pointreference.abstractpointreferenceextension_id = AbstractExtensionType.id

-- AngleUsePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.pointreference.id = master_join.source_id
LEFT JOIN navaids_points.pointreference
ON master_join.target_id = AngleUsePropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.pointreference.id = master_join.source_id
LEFT JOIN navaids_points.pointreference
ON master_join.target_id = DistanceIndicationPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.pointreference.id = master_join.source_id
LEFT JOIN navaids_points.pointreference
ON master_join.target_id = NotePropertyType.id
;

PostalAddressPropertyType
CREATE OR REPLACE VIEW postaladdresspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.postaladdress_pt.id
    ) AS postaladdresspropertytype
FROM

-- PostalAddressType
LEFT JOIN shared.postaladdress_pt
ON shared.postaladdress_pt.postaladdress_id = PostalAddressType.id

;

PostalAddressType
CREATE OR REPLACE VIEW postaladdresstype_view AS
SELECT
    jsonb_build_object(
       'deliverypoint_value', shared.postaladdress.deliverypoint_value,
       'deliverypoint_nilreason', shared.postaladdress.deliverypoint_nilreason,
       'city_value', shared.postaladdress.city_value,
       'city_nilreason', shared.postaladdress.city_nilreason,
       'administrativearea_value', shared.postaladdress.administrativearea_value,
       'administrativearea_nilreason', shared.postaladdress.administrativearea_nilreason,
       'postalcode_value', shared.postaladdress.postalcode_value,
       'postalcode_nilreason', shared.postaladdress.postalcode_nilreason,
       'country_value', shared.postaladdress.country_value,
       'country_nilreason', shared.postaladdress.country_nilreason,
       'id', shared.postaladdress.id,
       'identifier', shared.postaladdress.identifier,
       'identifier_code_space', shared.postaladdress.identifier_code_space,
       'xml_id', shared.postaladdress.xml_id
    ) AS postaladdresstype
FROM

-- AbstractExtensionType
LEFT JOIN shared.postaladdress
ON shared.postaladdress.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.postaladdress
ON shared.postaladdress.abstractpostaladdressextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.master_join
ON shared.postaladdress.id = master_join.source_id
LEFT JOIN shared.postaladdress
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.postaladdress.id = master_join.source_id
LEFT JOIN shared.postaladdress
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.master_join
ON shared.postaladdress.id = master_join.source_id
LEFT JOIN shared.postaladdress
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

PrecisionApproachRadarPropertyType
CREATE OR REPLACE VIEW precisionapproachradarpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.precisionapproachradar_pt.id,
       'nilReason', surveillance.precisionapproachradar_pt.nilReason
    ) AS precisionapproachradarpropertytype
FROM


;

PrecisionApproachRadarTimeSlicePropertyType
CREATE OR REPLACE VIEW precisionapproachradartimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.precisionapproachradar_tsp.id
    ) AS precisionapproachradartimeslicepropertytype
FROM

-- PrecisionApproachRadarTimeSliceType
LEFT JOIN surveillance.precisionapproachradar_tsp
ON surveillance.precisionapproachradar_tsp.precisionapproachradartimeslice_id = PrecisionApproachRadarTimeSliceType.id

;

PrecisionApproachRadarTimeSliceType
CREATE OR REPLACE VIEW precisionapproachradartimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', surveillance.precisionapproachradar_ts.name_value,
       'name_nilreason', surveillance.precisionapproachradar_ts.name_nilreason,
       'serialnumber_value', surveillance.precisionapproachradar_ts.serialnumber_value,
       'serialnumber_nilreason', surveillance.precisionapproachradar_ts.serialnumber_nilreason,
       'dualchannel_value', surveillance.precisionapproachradar_ts.dualchannel_value,
       'dualchannel_nilreason', surveillance.precisionapproachradar_ts.dualchannel_nilreason,
       'movingtargetindicator_value', surveillance.precisionapproachradar_ts.movingtargetindicator_value,
       'movingtargetindicator_nilreason', surveillance.precisionapproachradar_ts.movingtargetindicator_nilreason,
       'standbypower_value', surveillance.precisionapproachradar_ts.standbypower_value,
       'standbypower_nilreason', surveillance.precisionapproachradar_ts.standbypower_nilreason,
       'digital_value', surveillance.precisionapproachradar_ts.digital_value,
       'digital_nilreason', surveillance.precisionapproachradar_ts.digital_nilreason,
       'militaryuseonly_value', surveillance.precisionapproachradar_ts.militaryuseonly_value,
       'militaryuseonly_nilreason', surveillance.precisionapproachradar_ts.militaryuseonly_nilreason,
       'specialuseonly_value', surveillance.precisionapproachradar_ts.specialuseonly_value,
       'specialuseonly_nilreason', surveillance.precisionapproachradar_ts.specialuseonly_nilreason,
       'specialaircraftonly_value', surveillance.precisionapproachradar_ts.specialaircraftonly_value,
       'specialaircraftonly_nilreason', surveillance.precisionapproachradar_ts.specialaircraftonly_nilreason,
       'magneticvariation_value', surveillance.precisionapproachradar_ts.magneticvariation_value,
       'magneticvariation_nilreason', surveillance.precisionapproachradar_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', surveillance.precisionapproachradar_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', surveillance.precisionapproachradar_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', surveillance.precisionapproachradar_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', surveillance.precisionapproachradar_ts.datemagneticvariation_nilreason,
       'precisionapproachradartype_value', surveillance.precisionapproachradar_ts.precisionapproachradartype_value,
       'precisionapproachradartype_nilreason', surveillance.precisionapproachradar_ts.precisionapproachradartype_nilreason,
       'slope_value', surveillance.precisionapproachradar_ts.slope_value,
       'slope_nilreason', surveillance.precisionapproachradar_ts.slope_nilreason,
       'slopeaccuracy_value', surveillance.precisionapproachradar_ts.slopeaccuracy_value,
       'slopeaccuracy_nilreason', surveillance.precisionapproachradar_ts.slopeaccuracy_nilreason,
       'range_value', surveillance.precisionapproachradar_ts.range_value,
       'range_uom', surveillance.precisionapproachradar_ts.range_uom,
       'range_nilreason', surveillance.precisionapproachradar_ts.range_nilreason,
       'rangeaccuracy_value', surveillance.precisionapproachradar_ts.rangeaccuracy_value,
       'rangeaccuracy_uom', surveillance.precisionapproachradar_ts.rangeaccuracy_uom,
       'rangeaccuracy_nilreason', surveillance.precisionapproachradar_ts.rangeaccuracy_nilreason,
       'id', surveillance.precisionapproachradar_ts.id,
       'xml_id', surveillance.precisionapproachradar_ts.xml_id,
       'interpretation', surveillance.precisionapproachradar_ts.interpretation,
       'sequence_number', surveillance.precisionapproachradar_ts.sequence_number,
       'correction_number', surveillance.precisionapproachradar_ts.correction_number,
       'valid_time_begin', surveillance.precisionapproachradar_ts.valid_time_begin,
       'valid_time_end', surveillance.precisionapproachradar_ts.valid_time_end,
       'feature_lifetime_begin', surveillance.precisionapproachradar_ts.feature_lifetime_begin,
       'feature_lifetime_end', surveillance.precisionapproachradar_ts.feature_lifetime_end
    ) AS precisionapproachradartimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN surveillance.precisionapproachradar_ts
ON surveillance.precisionapproachradar_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.precisionapproachradar_ts
ON surveillance.precisionapproachradar_ts.abstractprecisionapproachradarextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN surveillance.precisionapproachradar_ts
ON surveillance.precisionapproachradar_ts.abstractradarequipmentextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.precisionapproachradar_ts.id = master_join.source_id
LEFT JOIN surveillance.precisionapproachradar_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.precisionapproachradar_ts.id = master_join.source_id
LEFT JOIN surveillance.precisionapproachradar_ts
ON master_join.target_id = NotePropertyType.id
-- ReflectorPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.precisionapproachradar_ts.id = master_join.source_id
LEFT JOIN surveillance.precisionapproachradar_ts
ON master_join.target_id = ReflectorPropertyType.id
;

PrecisionApproachRadarType
CREATE OR REPLACE VIEW precisionapproachradartype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.precisionapproachradar.id,
       'identifier', surveillance.precisionapproachradar.identifier,
       'identifier_code_space', surveillance.precisionapproachradar.identifier_code_space,
       'xml_id', surveillance.precisionapproachradar.xml_id
    ) AS precisionapproachradartype
FROM


-- PrecisionApproachRadarTimeSlicePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.precisionapproachradar.id = master_join.source_id
LEFT JOIN surveillance.precisionapproachradar
ON master_join.target_id = PrecisionApproachRadarTimeSlicePropertyType.id
;

PrimarySurveillanceRadarPropertyType
CREATE OR REPLACE VIEW primarysurveillanceradarpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.primarysurveillanceradar_pt.id,
       'nilReason', surveillance.primarysurveillanceradar_pt.nilReason
    ) AS primarysurveillanceradarpropertytype
FROM


;

PrimarySurveillanceRadarTimeSlicePropertyType
CREATE OR REPLACE VIEW primarysurveillanceradartimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.primarysurveillanceradar_tsp.id
    ) AS primarysurveillanceradartimeslicepropertytype
FROM

-- PrimarySurveillanceRadarTimeSliceType
LEFT JOIN surveillance.primarysurveillanceradar_tsp
ON surveillance.primarysurveillanceradar_tsp.primarysurveillanceradartimeslice_id = PrimarySurveillanceRadarTimeSliceType.id

;

PrimarySurveillanceRadarTimeSliceType
CREATE OR REPLACE VIEW primarysurveillanceradartimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', surveillance.primarysurveillanceradar_ts.name_value,
       'name_nilreason', surveillance.primarysurveillanceradar_ts.name_nilreason,
       'serialnumber_value', surveillance.primarysurveillanceradar_ts.serialnumber_value,
       'serialnumber_nilreason', surveillance.primarysurveillanceradar_ts.serialnumber_nilreason,
       'dualchannel_value', surveillance.primarysurveillanceradar_ts.dualchannel_value,
       'dualchannel_nilreason', surveillance.primarysurveillanceradar_ts.dualchannel_nilreason,
       'movingtargetindicator_value', surveillance.primarysurveillanceradar_ts.movingtargetindicator_value,
       'movingtargetindicator_nilreason', surveillance.primarysurveillanceradar_ts.movingtargetindicator_nilreason,
       'standbypower_value', surveillance.primarysurveillanceradar_ts.standbypower_value,
       'standbypower_nilreason', surveillance.primarysurveillanceradar_ts.standbypower_nilreason,
       'digital_value', surveillance.primarysurveillanceradar_ts.digital_value,
       'digital_nilreason', surveillance.primarysurveillanceradar_ts.digital_nilreason,
       'militaryuseonly_value', surveillance.primarysurveillanceradar_ts.militaryuseonly_value,
       'militaryuseonly_nilreason', surveillance.primarysurveillanceradar_ts.militaryuseonly_nilreason,
       'specialuseonly_value', surveillance.primarysurveillanceradar_ts.specialuseonly_value,
       'specialuseonly_nilreason', surveillance.primarysurveillanceradar_ts.specialuseonly_nilreason,
       'specialaircraftonly_value', surveillance.primarysurveillanceradar_ts.specialaircraftonly_value,
       'specialaircraftonly_nilreason', surveillance.primarysurveillanceradar_ts.specialaircraftonly_nilreason,
       'magneticvariation_value', surveillance.primarysurveillanceradar_ts.magneticvariation_value,
       'magneticvariation_nilreason', surveillance.primarysurveillanceradar_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', surveillance.primarysurveillanceradar_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', surveillance.primarysurveillanceradar_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', surveillance.primarysurveillanceradar_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', surveillance.primarysurveillanceradar_ts.datemagneticvariation_nilreason,
       'verticalcoverageazimuth_value', surveillance.primarysurveillanceradar_ts.verticalcoverageazimuth_value,
       'verticalcoverageazimuth_nilreason', surveillance.primarysurveillanceradar_ts.verticalcoverageazimuth_nilreason,
       'antennatiltfixed_value', surveillance.primarysurveillanceradar_ts.antennatiltfixed_value,
       'antennatiltfixed_nilreason', surveillance.primarysurveillanceradar_ts.antennatiltfixed_nilreason,
       'tiltangle_value', surveillance.primarysurveillanceradar_ts.tiltangle_value,
       'tiltangle_nilreason', surveillance.primarysurveillanceradar_ts.tiltangle_nilreason,
       'automatedradarterminalsystem_value', surveillance.primarysurveillanceradar_ts.automatedradarterminalsystem_value,
       'automatedradarterminalsystem_nilreason', surveillance.primarysurveillanceradar_ts.automatedradarterminalsystem_nilreason,
       'type_value', surveillance.primarysurveillanceradar_ts.type_value,
       'type_nilreason', surveillance.primarysurveillanceradar_ts.type_nilreason,
       'range_value', surveillance.primarysurveillanceradar_ts.range_value,
       'range_uom', surveillance.primarysurveillanceradar_ts.range_uom,
       'range_nilreason', surveillance.primarysurveillanceradar_ts.range_nilreason,
       'rangeaccuracy_value', surveillance.primarysurveillanceradar_ts.rangeaccuracy_value,
       'rangeaccuracy_uom', surveillance.primarysurveillanceradar_ts.rangeaccuracy_uom,
       'rangeaccuracy_nilreason', surveillance.primarysurveillanceradar_ts.rangeaccuracy_nilreason,
       'verticalcoveragealtitude_value', surveillance.primarysurveillanceradar_ts.verticalcoveragealtitude_value,
       'verticalcoveragealtitude_uom', surveillance.primarysurveillanceradar_ts.verticalcoveragealtitude_uom,
       'verticalcoveragealtitude_nilreason', surveillance.primarysurveillanceradar_ts.verticalcoveragealtitude_nilreason,
       'verticalcoveragedistance_value', surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_value,
       'verticalcoveragedistance_uom', surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_uom,
       'verticalcoveragedistance_nilreason', surveillance.primarysurveillanceradar_ts.verticalcoveragedistance_nilreason,
       'id', surveillance.primarysurveillanceradar_ts.id,
       'xml_id', surveillance.primarysurveillanceradar_ts.xml_id,
       'interpretation', surveillance.primarysurveillanceradar_ts.interpretation,
       'sequence_number', surveillance.primarysurveillanceradar_ts.sequence_number,
       'correction_number', surveillance.primarysurveillanceradar_ts.correction_number,
       'valid_time_begin', surveillance.primarysurveillanceradar_ts.valid_time_begin,
       'valid_time_end', surveillance.primarysurveillanceradar_ts.valid_time_end,
       'feature_lifetime_begin', surveillance.primarysurveillanceradar_ts.feature_lifetime_begin,
       'feature_lifetime_end', surveillance.primarysurveillanceradar_ts.feature_lifetime_end
    ) AS primarysurveillanceradartimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON surveillance.primarysurveillanceradar_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON surveillance.primarysurveillanceradar_ts.abstractprimarysurveillanceradarextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON surveillance.primarysurveillanceradar_ts.abstractsurveillanceradarextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON surveillance.primarysurveillanceradar_ts.abstractradarequipmentextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.primarysurveillanceradar_ts.id = master_join.source_id
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.primarysurveillanceradar_ts.id = master_join.source_id
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON master_join.target_id = NotePropertyType.id
-- SurveillanceGroundStationPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.primarysurveillanceradar_ts.id = master_join.source_id
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON master_join.target_id = SurveillanceGroundStationPropertyType.id
;

PrimarySurveillanceRadarType
CREATE OR REPLACE VIEW primarysurveillanceradartype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.primarysurveillanceradar.id,
       'identifier', surveillance.primarysurveillanceradar.identifier,
       'identifier_code_space', surveillance.primarysurveillanceradar.identifier_code_space,
       'xml_id', surveillance.primarysurveillanceradar.xml_id
    ) AS primarysurveillanceradartype
FROM


-- PrimarySurveillanceRadarTimeSlicePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.primarysurveillanceradar.id = master_join.source_id
LEFT JOIN surveillance.primarysurveillanceradar
ON master_join.target_id = PrimarySurveillanceRadarTimeSlicePropertyType.id
;

ProcedureAvailabilityPropertyType
CREATE OR REPLACE VIEW procedureavailabilitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.procedureavailability_pt.id
    ) AS procedureavailabilitypropertytype
FROM

-- ProcedureAvailabilityType
LEFT JOIN procedure.procedureavailability_pt
ON procedure.procedureavailability_pt.procedureavailability_id = ProcedureAvailabilityType.id

;

ProcedureAvailabilityType
CREATE OR REPLACE VIEW procedureavailabilitytype_view AS
SELECT
    jsonb_build_object(
       'status_value', procedure.procedureavailability.status_value,
       'status_nilreason', procedure.procedureavailability.status_nilreason,
       'id', procedure.procedureavailability.id,
       'identifier', procedure.procedureavailability.identifier,
       'identifier_code_space', procedure.procedureavailability.identifier_code_space,
       'xml_id', procedure.procedureavailability.xml_id
    ) AS procedureavailabilitytype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.procedureavailability
ON procedure.procedureavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.procedureavailability
ON procedure.procedureavailability.abstractprocedureavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN procedure.master_join
ON procedure.procedureavailability.id = master_join.source_id
LEFT JOIN procedure.procedureavailability
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.procedureavailability.id = master_join.source_id
LEFT JOIN procedure.procedureavailability
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN procedure.master_join
ON procedure.procedureavailability.id = master_join.source_id
LEFT JOIN procedure.procedureavailability
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

ProcedureDMEPropertyType
CREATE OR REPLACE VIEW proceduredmepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduredme_pt.id,
       'nilReason', procedure.proceduredme_pt.nilReason
    ) AS proceduredmepropertytype
FROM


;

ProcedureDMETimeSlicePropertyType
CREATE OR REPLACE VIEW proceduredmetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduredme_tsp.id
    ) AS proceduredmetimeslicepropertytype
FROM

-- ProcedureDMETimeSliceType
LEFT JOIN procedure.proceduredme_tsp
ON procedure.proceduredme_tsp.proceduredmetimeslice_id = ProcedureDMETimeSliceType.id

;

ProcedureDMETimeSliceType
CREATE OR REPLACE VIEW proceduredmetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'criticaldme_value', procedure.proceduredme_ts.criticaldme_value,
       'criticaldme_nilreason', procedure.proceduredme_ts.criticaldme_nilreason,
       'satisfactory_value', procedure.proceduredme_ts.satisfactory_value,
       'satisfactory_nilreason', procedure.proceduredme_ts.satisfactory_nilreason,
       'id', procedure.proceduredme_ts.id,
       'xml_id', procedure.proceduredme_ts.xml_id,
       'interpretation', procedure.proceduredme_ts.interpretation,
       'sequence_number', procedure.proceduredme_ts.sequence_number,
       'correction_number', procedure.proceduredme_ts.correction_number,
       'valid_time_begin', procedure.proceduredme_ts.valid_time_begin,
       'valid_time_end', procedure.proceduredme_ts.valid_time_end,
       'feature_lifetime_begin', procedure.proceduredme_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.proceduredme_ts.feature_lifetime_end
    ) AS proceduredmetimeslicetype
FROM

-- DMEPropertyType
LEFT JOIN procedure.proceduredme_ts
ON procedure.proceduredme_ts.dme_id = DMEPropertyType.id
-- SegmentLegPropertyType
LEFT JOIN procedure.proceduredme_ts
ON procedure.proceduredme_ts.segmentleg_id = SegmentLegPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.proceduredme_ts
ON procedure.proceduredme_ts.abstractproceduredmeextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.proceduredme_ts.id = master_join.source_id
LEFT JOIN procedure.proceduredme_ts
ON master_join.target_id = NotePropertyType.id
;

ProcedureDMEType
CREATE OR REPLACE VIEW proceduredmetype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduredme.id,
       'identifier', procedure.proceduredme.identifier,
       'identifier_code_space', procedure.proceduredme.identifier_code_space,
       'xml_id', procedure.proceduredme.xml_id
    ) AS proceduredmetype
FROM


-- ProcedureDMETimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.proceduredme.id = master_join.source_id
LEFT JOIN procedure.proceduredme
ON master_join.target_id = ProcedureDMETimeSlicePropertyType.id
;

ProcedurePropertyType
CREATE OR REPLACE VIEW procedurepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.procedure_pt.id,
       'nilReason', procedure.procedure_pt.nilReason
    ) AS procedurepropertytype
FROM


;

ProcedureTransitionLegPropertyType
CREATE OR REPLACE VIEW proceduretransitionlegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduretransitionleg_pt.id
    ) AS proceduretransitionlegpropertytype
FROM

-- ProcedureTransitionLegType
LEFT JOIN procedure.proceduretransitionleg_pt
ON procedure.proceduretransitionleg_pt.proceduretransitionleg_id = ProcedureTransitionLegType.id

;

ProcedureTransitionLegType
CREATE OR REPLACE VIEW proceduretransitionlegtype_view AS
SELECT
    jsonb_build_object(
       'seqnumberarinc_value', procedure.proceduretransitionleg.seqnumberarinc_value,
       'seqnumberarinc_nilreason', procedure.proceduretransitionleg.seqnumberarinc_nilreason,
       'id', procedure.proceduretransitionleg.id,
       'identifier', procedure.proceduretransitionleg.identifier,
       'identifier_code_space', procedure.proceduretransitionleg.identifier_code_space,
       'xml_id', procedure.proceduretransitionleg.xml_id
    ) AS proceduretransitionlegtype
FROM

-- SegmentLegPropertyType
LEFT JOIN procedure.proceduretransitionleg
ON procedure.proceduretransitionleg.thesegmentleg_id = SegmentLegPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.proceduretransitionleg
ON procedure.proceduretransitionleg.abstractproceduretransitionlegextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.proceduretransitionleg.id = master_join.source_id
LEFT JOIN procedure.proceduretransitionleg
ON master_join.target_id = NotePropertyType.id
;

ProcedureTransitionPropertyType
CREATE OR REPLACE VIEW proceduretransitionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduretransition_pt.id
    ) AS proceduretransitionpropertytype
FROM

-- ProcedureTransitionType
LEFT JOIN procedure.proceduretransition_pt
ON procedure.proceduretransition_pt.proceduretransition_id = ProcedureTransitionType.id

;

ProcedureTransitionType
CREATE OR REPLACE VIEW proceduretransitiontype_view AS
SELECT
    jsonb_build_object(
       'transitionid_value', procedure.proceduretransition.transitionid_value,
       'transitionid_nilreason', procedure.proceduretransition.transitionid_nilreason,
       'type_value', procedure.proceduretransition.type_value,
       'type_nilreason', procedure.proceduretransition.type_nilreason,
       'instruction_value', procedure.proceduretransition.instruction_value,
       'instruction_nilreason', procedure.proceduretransition.instruction_nilreason,
       'vectorheading_value', procedure.proceduretransition.vectorheading_value,
       'vectorheading_nilreason', procedure.proceduretransition.vectorheading_nilreason,
       'id', procedure.proceduretransition.id,
       'identifier', procedure.proceduretransition.identifier,
       'identifier_code_space', procedure.proceduretransition.identifier_code_space,
       'xml_id', procedure.proceduretransition.xml_id
    ) AS proceduretransitiontype
FROM

-- LandingTakeoffAreaCollectionPropertyType
LEFT JOIN procedure.proceduretransition
ON procedure.proceduretransition.departurerunwaytransition_id = LandingTakeoffAreaCollectionPropertyType.id
-- CurvePropertyType
LEFT JOIN procedure.proceduretransition
ON procedure.proceduretransition.trajectory_id = CurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.proceduretransition
ON procedure.proceduretransition.abstractproceduretransitionextension_id = AbstractExtensionType.id

-- ProcedureTransitionLegPropertyType
LEFT JOIN procedure.master_join
ON procedure.proceduretransition.id = master_join.source_id
LEFT JOIN procedure.proceduretransition
ON master_join.target_id = ProcedureTransitionLegPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.proceduretransition.id = master_join.source_id
LEFT JOIN procedure.proceduretransition
ON master_join.target_id = NotePropertyType.id
;

PropertiesWithSchedulePropertyType
CREATE OR REPLACE VIEW propertieswithschedulepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.propertieswithschedule_pt.id
    ) AS propertieswithschedulepropertytype
FROM


;

RadarComponentPropertyType
CREATE OR REPLACE VIEW radarcomponentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarcomponent_pt.id
    ) AS radarcomponentpropertytype
FROM

-- RadarComponentType
LEFT JOIN surveillance.radarcomponent_pt
ON surveillance.radarcomponent_pt.radarcomponent_id = RadarComponentType.id

;

RadarComponentType
CREATE OR REPLACE VIEW radarcomponenttype_view AS
SELECT
    jsonb_build_object(
       'collocationgroup_value', surveillance.radarcomponent.collocationgroup_value,
       'collocationgroup_nilreason', surveillance.radarcomponent.collocationgroup_nilreason,
       'id', surveillance.radarcomponent.id,
       'identifier', surveillance.radarcomponent.identifier,
       'identifier_code_space', surveillance.radarcomponent.identifier_code_space,
       'xml_id', surveillance.radarcomponent.xml_id
    ) AS radarcomponenttype
FROM

-- RadarEquipmentPropertyType
LEFT JOIN surveillance.radarcomponent
ON surveillance.radarcomponent.theradarequipment_id = RadarEquipmentPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.radarcomponent
ON surveillance.radarcomponent.abstractradarcomponentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.radarcomponent.id = master_join.source_id
LEFT JOIN surveillance.radarcomponent
ON master_join.target_id = NotePropertyType.id
;

RadarEquipmentPropertyType
CREATE OR REPLACE VIEW radarequipmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarequipment_pt.id,
       'nilReason', surveillance.radarequipment_pt.nilReason
    ) AS radarequipmentpropertytype
FROM


;

RadarSystemPropertyType
CREATE OR REPLACE VIEW radarsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarsystem_pt.id,
       'nilReason', surveillance.radarsystem_pt.nilReason
    ) AS radarsystempropertytype
FROM


;

RadarSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW radarsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarsystem_tsp.id
    ) AS radarsystemtimeslicepropertytype
FROM

-- RadarSystemTimeSliceType
LEFT JOIN surveillance.radarsystem_tsp
ON surveillance.radarsystem_tsp.radarsystemtimeslice_id = RadarSystemTimeSliceType.id

;

RadarSystemTimeSliceType
CREATE OR REPLACE VIEW radarsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', surveillance.radarsystem_ts.type_value,
       'type_nilreason', surveillance.radarsystem_ts.type_nilreason,
       'model_value', surveillance.radarsystem_ts.model_value,
       'model_nilreason', surveillance.radarsystem_ts.model_nilreason,
       'generalterrainmonitor_value', surveillance.radarsystem_ts.generalterrainmonitor_value,
       'generalterrainmonitor_nilreason', surveillance.radarsystem_ts.generalterrainmonitor_nilreason,
       'broadcastidentifier_value', surveillance.radarsystem_ts.broadcastidentifier_value,
       'broadcastidentifier_nilreason', surveillance.radarsystem_ts.broadcastidentifier_nilreason,
       'id', surveillance.radarsystem_ts.id,
       'xml_id', surveillance.radarsystem_ts.xml_id,
       'interpretation', surveillance.radarsystem_ts.interpretation,
       'sequence_number', surveillance.radarsystem_ts.sequence_number,
       'correction_number', surveillance.radarsystem_ts.correction_number,
       'valid_time_begin', surveillance.radarsystem_ts.valid_time_begin,
       'valid_time_end', surveillance.radarsystem_ts.valid_time_end,
       'feature_lifetime_begin', surveillance.radarsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', surveillance.radarsystem_ts.feature_lifetime_end
    ) AS radarsystemtimeslicetype
FROM

-- AirportHeliportPropertyType
LEFT JOIN surveillance.radarsystem_ts
ON surveillance.radarsystem_ts.airportheliport_id = AirportHeliportPropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN surveillance.radarsystem_ts
ON surveillance.radarsystem_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.radarsystem_ts
ON surveillance.radarsystem_ts.abstractradarsystemextension_id = AbstractExtensionType.id

-- RadarComponentPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.radarsystem_ts.id = master_join.source_id
LEFT JOIN surveillance.radarsystem_ts
ON master_join.target_id = RadarComponentPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.radarsystem_ts.id = master_join.source_id
LEFT JOIN surveillance.radarsystem_ts
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- RunwayPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.radarsystem_ts.id = master_join.source_id
LEFT JOIN surveillance.radarsystem_ts
ON master_join.target_id = RunwayPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.radarsystem_ts.id = master_join.source_id
LEFT JOIN surveillance.radarsystem_ts
ON master_join.target_id = NotePropertyType.id
;

RadarSystemType
CREATE OR REPLACE VIEW radarsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarsystem.id,
       'identifier', surveillance.radarsystem.identifier,
       'identifier_code_space', surveillance.radarsystem.identifier_code_space,
       'xml_id', surveillance.radarsystem.xml_id
    ) AS radarsystemtype
FROM


-- RadarSystemTimeSlicePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.radarsystem.id = master_join.source_id
LEFT JOIN surveillance.radarsystem
ON master_join.target_id = RadarSystemTimeSlicePropertyType.id
;

RadioCommunicationChannelPropertyType
CREATE OR REPLACE VIEW radiocommunicationchannelpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.radiocommunicationchannel_pt.id,
       'nilReason', service.radiocommunicationchannel_pt.nilReason
    ) AS radiocommunicationchannelpropertytype
FROM


;

RadioCommunicationChannelTimeSlicePropertyType
CREATE OR REPLACE VIEW radiocommunicationchanneltimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.radiocommunicationchannel_tsp.id
    ) AS radiocommunicationchanneltimeslicepropertytype
FROM

-- RadioCommunicationChannelTimeSliceType
LEFT JOIN service.radiocommunicationchannel_tsp
ON service.radiocommunicationchannel_tsp.radiocommunicationchanneltimeslice_id = RadioCommunicationChannelTimeSliceType.id

;

RadioCommunicationChannelTimeSliceType
CREATE OR REPLACE VIEW radiocommunicationchanneltimeslicetype_view AS
SELECT
    jsonb_build_object(
       'mode_value', service.radiocommunicationchannel_ts.mode_value,
       'mode_nilreason', service.radiocommunicationchannel_ts.mode_nilreason,
       'rank_value', service.radiocommunicationchannel_ts.rank_value,
       'rank_nilreason', service.radiocommunicationchannel_ts.rank_nilreason,
       'channel_value', service.radiocommunicationchannel_ts.channel_value,
       'channel_nilreason', service.radiocommunicationchannel_ts.channel_nilreason,
       'logon_value', service.radiocommunicationchannel_ts.logon_value,
       'logon_nilreason', service.radiocommunicationchannel_ts.logon_nilreason,
       'emissiontype_value', service.radiocommunicationchannel_ts.emissiontype_value,
       'emissiontype_nilreason', service.radiocommunicationchannel_ts.emissiontype_nilreason,
       'selectivecall_value', service.radiocommunicationchannel_ts.selectivecall_value,
       'selectivecall_nilreason', service.radiocommunicationchannel_ts.selectivecall_nilreason,
       'flightchecked_value', service.radiocommunicationchannel_ts.flightchecked_value,
       'flightchecked_nilreason', service.radiocommunicationchannel_ts.flightchecked_nilreason,
       'trafficdirection_value', service.radiocommunicationchannel_ts.trafficdirection_value,
       'trafficdirection_nilreason', service.radiocommunicationchannel_ts.trafficdirection_nilreason,
       'frequencytransmission_value', service.radiocommunicationchannel_ts.frequencytransmission_value,
       'frequencytransmission_uom', service.radiocommunicationchannel_ts.frequencytransmission_uom,
       'frequencytransmission_nilreason', service.radiocommunicationchannel_ts.frequencytransmission_nilreason,
       'frequencyreception_value', service.radiocommunicationchannel_ts.frequencyreception_value,
       'frequencyreception_uom', service.radiocommunicationchannel_ts.frequencyreception_uom,
       'frequencyreception_nilreason', service.radiocommunicationchannel_ts.frequencyreception_nilreason,
       'id', service.radiocommunicationchannel_ts.id,
       'xml_id', service.radiocommunicationchannel_ts.xml_id,
       'interpretation', service.radiocommunicationchannel_ts.interpretation,
       'sequence_number', service.radiocommunicationchannel_ts.sequence_number,
       'correction_number', service.radiocommunicationchannel_ts.correction_number,
       'valid_time_begin', service.radiocommunicationchannel_ts.valid_time_begin,
       'valid_time_end', service.radiocommunicationchannel_ts.valid_time_end,
       'feature_lifetime_begin', service.radiocommunicationchannel_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.radiocommunicationchannel_ts.feature_lifetime_end
    ) AS radiocommunicationchanneltimeslicetype
FROM

-- AbstractExtensionType
LEFT JOIN service.radiocommunicationchannel_ts
ON service.radiocommunicationchannel_ts.abstractradiocommunicationchannelextension_id = AbstractExtensionType.id

-- ElevatedPointPropertyType
LEFT JOIN service.master_join
ON service.radiocommunicationchannel_ts.id = master_join.source_id
LEFT JOIN service.radiocommunicationchannel_ts
ON master_join.target_id = ElevatedPointPropertyType.id
-- RadioCommunicationOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.radiocommunicationchannel_ts.id = master_join.source_id
LEFT JOIN service.radiocommunicationchannel_ts
ON master_join.target_id = RadioCommunicationOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.radiocommunicationchannel_ts.id = master_join.source_id
LEFT JOIN service.radiocommunicationchannel_ts
ON master_join.target_id = NotePropertyType.id
;

RadioCommunicationChannelType
CREATE OR REPLACE VIEW radiocommunicationchanneltype_view AS
SELECT
    jsonb_build_object(
       'id', service.radiocommunicationchannel.id,
       'identifier', service.radiocommunicationchannel.identifier,
       'identifier_code_space', service.radiocommunicationchannel.identifier_code_space,
       'xml_id', service.radiocommunicationchannel.xml_id
    ) AS radiocommunicationchanneltype
FROM


-- RadioCommunicationChannelTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.radiocommunicationchannel.id = master_join.source_id
LEFT JOIN service.radiocommunicationchannel
ON master_join.target_id = RadioCommunicationChannelTimeSlicePropertyType.id
;

RadioCommunicationOperationalStatusPropertyType
CREATE OR REPLACE VIEW radiocommunicationoperationalstatuspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.radiocommunicationoperationalstatus_pt.id
    ) AS radiocommunicationoperationalstatuspropertytype
FROM

-- RadioCommunicationOperationalStatusType
LEFT JOIN service.radiocommunicationoperationalstatus_pt
ON service.radiocommunicationoperationalstatus_pt.radiocommunicationoperationalstatus_id = RadioCommunicationOperationalStatusType.id

;

RadioCommunicationOperationalStatusType
CREATE OR REPLACE VIEW radiocommunicationoperationalstatustype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', service.radiocommunicationoperationalstatus.operationalstatus_value,
       'operationalstatus_nilreason', service.radiocommunicationoperationalstatus.operationalstatus_nilreason,
       'id', service.radiocommunicationoperationalstatus.id,
       'identifier', service.radiocommunicationoperationalstatus.identifier,
       'identifier_code_space', service.radiocommunicationoperationalstatus.identifier_code_space,
       'xml_id', service.radiocommunicationoperationalstatus.xml_id
    ) AS radiocommunicationoperationalstatustype
FROM

-- AbstractExtensionType
LEFT JOIN service.radiocommunicationoperationalstatus
ON service.radiocommunicationoperationalstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.radiocommunicationoperationalstatus
ON service.radiocommunicationoperationalstatus.abstractradiocommunicationoperationalstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN service.master_join
ON service.radiocommunicationoperationalstatus.id = master_join.source_id
LEFT JOIN service.radiocommunicationoperationalstatus
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.radiocommunicationoperationalstatus.id = master_join.source_id
LEFT JOIN service.radiocommunicationoperationalstatus
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN service.master_join
ON service.radiocommunicationoperationalstatus.id = master_join.source_id
LEFT JOIN service.radiocommunicationoperationalstatus
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

RadioFrequencyAreaPropertyType
CREATE OR REPLACE VIEW radiofrequencyareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.radiofrequencyarea_pt.id,
       'nilReason', shared.radiofrequencyarea_pt.nilReason
    ) AS radiofrequencyareapropertytype
FROM


;

RadioFrequencyAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW radiofrequencyareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.radiofrequencyarea_tsp.id
    ) AS radiofrequencyareatimeslicepropertytype
FROM

-- RadioFrequencyAreaTimeSliceType
LEFT JOIN shared.radiofrequencyarea_tsp
ON shared.radiofrequencyarea_tsp.radiofrequencyareatimeslice_id = RadioFrequencyAreaTimeSliceType.id

;

RadioFrequencyAreaTimeSliceType
CREATE OR REPLACE VIEW radiofrequencyareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', shared.radiofrequencyarea_ts.type_value,
       'type_nilreason', shared.radiofrequencyarea_ts.type_nilreason,
       'anglescallop_value', shared.radiofrequencyarea_ts.anglescallop_value,
       'anglescallop_nilreason', shared.radiofrequencyarea_ts.anglescallop_nilreason,
       'signaltype_value', shared.radiofrequencyarea_ts.signaltype_value,
       'signaltype_nilreason', shared.radiofrequencyarea_ts.signaltype_nilreason,
       'id', shared.radiofrequencyarea_ts.id,
       'xml_id', shared.radiofrequencyarea_ts.xml_id,
       'interpretation', shared.radiofrequencyarea_ts.interpretation,
       'sequence_number', shared.radiofrequencyarea_ts.sequence_number,
       'correction_number', shared.radiofrequencyarea_ts.correction_number,
       'valid_time_begin', shared.radiofrequencyarea_ts.valid_time_begin,
       'valid_time_end', shared.radiofrequencyarea_ts.valid_time_end,
       'feature_lifetime_begin', shared.radiofrequencyarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', shared.radiofrequencyarea_ts.feature_lifetime_end
    ) AS radiofrequencyareatimeslicetype
FROM

-- NavaidEquipmentPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_navaidequipment_id = NavaidEquipmentPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_frequency_id = RadioCommunicationChannelPropertyType.id
-- SpecialNavigationStationPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_specialnavigationstation_id = SpecialNavigationStationPropertyType.id
-- PrecisionApproachRadarPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_precisionapproachradar_id = PrecisionApproachRadarPropertyType.id
-- SecondarySurveillanceRadarPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_radar_id = SecondarySurveillanceRadarPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.abstractradiofrequencyareaextension_id = AbstractExtensionType.id

-- CircleSectorPropertyType
LEFT JOIN shared.master_join
ON shared.radiofrequencyarea_ts.id = master_join.source_id
LEFT JOIN shared.radiofrequencyarea_ts
ON master_join.target_id = CircleSectorPropertyType.id
-- SurfacePropertyType
LEFT JOIN shared.master_join
ON shared.radiofrequencyarea_ts.id = master_join.source_id
LEFT JOIN shared.radiofrequencyarea_ts
ON master_join.target_id = SurfacePropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.radiofrequencyarea_ts.id = master_join.source_id
LEFT JOIN shared.radiofrequencyarea_ts
ON master_join.target_id = NotePropertyType.id
;

RadioFrequencyAreaType
CREATE OR REPLACE VIEW radiofrequencyareatype_view AS
SELECT
    jsonb_build_object(
       'id', shared.radiofrequencyarea.id,
       'identifier', shared.radiofrequencyarea.identifier,
       'identifier_code_space', shared.radiofrequencyarea.identifier_code_space,
       'xml_id', shared.radiofrequencyarea.xml_id
    ) AS radiofrequencyareatype
FROM


-- RadioFrequencyAreaTimeSlicePropertyType
LEFT JOIN shared.master_join
ON shared.radiofrequencyarea.id = master_join.source_id
LEFT JOIN shared.radiofrequencyarea
ON master_join.target_id = RadioFrequencyAreaTimeSlicePropertyType.id
;

ReflectorPropertyType
CREATE OR REPLACE VIEW reflectorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.reflector_pt.id
    ) AS reflectorpropertytype
FROM

-- ReflectorType
LEFT JOIN surveillance.reflector_pt
ON surveillance.reflector_pt.reflector_id = ReflectorType.id

;

ReflectorType
CREATE OR REPLACE VIEW reflectortype_view AS
SELECT
    jsonb_build_object(
       'type_value', surveillance.reflector.type_value,
       'type_nilreason', surveillance.reflector.type_nilreason,
       'id', surveillance.reflector.id,
       'identifier', surveillance.reflector.identifier,
       'identifier_code_space', surveillance.reflector.identifier_code_space,
       'xml_id', surveillance.reflector.xml_id
    ) AS reflectortype
FROM

-- ElevatedPointPropertyType
LEFT JOIN surveillance.reflector
ON surveillance.reflector.touchdownreflector_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.reflector
ON surveillance.reflector.abstractreflectorextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.reflector.id = master_join.source_id
LEFT JOIN surveillance.reflector
ON master_join.target_id = NotePropertyType.id
;

RidgePropertyType
CREATE OR REPLACE VIEW ridgepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.ridge_pt.id
    ) AS ridgepropertytype
FROM

-- RidgeType
LEFT JOIN airport_heliport.ridge_pt
ON airport_heliport.ridge_pt.ridge_id = RidgeType.id

;

RidgeType
CREATE OR REPLACE VIEW ridgetype_view AS
SELECT
    jsonb_build_object(
       'side_value', airport_heliport.ridge.side_value,
       'side_nilreason', airport_heliport.ridge.side_nilreason,
       'distance_value', airport_heliport.ridge.distance_value,
       'distance_uom', airport_heliport.ridge.distance_uom,
       'distance_nilreason', airport_heliport.ridge.distance_nilreason,
       'depth_value', airport_heliport.ridge.depth_value,
       'depth_uom', airport_heliport.ridge.depth_uom,
       'depth_nilreason', airport_heliport.ridge.depth_nilreason,
       'id', airport_heliport.ridge.id,
       'identifier', airport_heliport.ridge.identifier,
       'identifier_code_space', airport_heliport.ridge.identifier_code_space,
       'xml_id', airport_heliport.ridge.xml_id
    ) AS ridgetype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.ridge
ON airport_heliport.ridge.abstractridgeextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.ridge.id = master_join.source_id
LEFT JOIN airport_heliport.ridge
ON master_join.target_id = NotePropertyType.id
;

RoadPropertyType
CREATE OR REPLACE VIEW roadpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.road_pt.id,
       'nilReason', airport_heliport.road_pt.nilReason
    ) AS roadpropertytype
FROM


;

RoadTimeSlicePropertyType
CREATE OR REPLACE VIEW roadtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.road_tsp.id
    ) AS roadtimeslicepropertytype
FROM

-- RoadTimeSliceType
LEFT JOIN airport_heliport.road_tsp
ON airport_heliport.road_tsp.roadtimeslice_id = RoadTimeSliceType.id

;

RoadTimeSliceType
CREATE OR REPLACE VIEW roadtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.road_ts.designator_value,
       'designator_nilreason', airport_heliport.road_ts.designator_nilreason,
       'status_value', airport_heliport.road_ts.status_value,
       'status_nilreason', airport_heliport.road_ts.status_nilreason,
       'type_value', airport_heliport.road_ts.type_value,
       'type_nilreason', airport_heliport.road_ts.type_nilreason,
       'abandoned_value', airport_heliport.road_ts.abandoned_value,
       'abandoned_nilreason', airport_heliport.road_ts.abandoned_nilreason,
       'id', airport_heliport.road_ts.id,
       'xml_id', airport_heliport.road_ts.xml_id,
       'interpretation', airport_heliport.road_ts.interpretation,
       'sequence_number', airport_heliport.road_ts.sequence_number,
       'correction_number', airport_heliport.road_ts.correction_number,
       'valid_time_begin', airport_heliport.road_ts.valid_time_begin,
       'valid_time_end', airport_heliport.road_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.road_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.road_ts.feature_lifetime_end
    ) AS roadtimeslicetype
FROM

-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.road_ts
ON airport_heliport.road_ts.associatedairport_id = AirportHeliportPropertyType.id
-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.road_ts
ON airport_heliport.road_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.road_ts
ON airport_heliport.road_ts.surfaceextent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.road_ts
ON airport_heliport.road_ts.abstractroadextension_id = AbstractExtensionType.id

-- AircraftStandPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.road_ts.id = master_join.source_id
LEFT JOIN airport_heliport.road_ts
ON master_join.target_id = AircraftStandPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.road_ts.id = master_join.source_id
LEFT JOIN airport_heliport.road_ts
ON master_join.target_id = NotePropertyType.id
;

RoadType
CREATE OR REPLACE VIEW roadtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.road.id,
       'identifier', airport_heliport.road.identifier,
       'identifier_code_space', airport_heliport.road.identifier_code_space,
       'xml_id', airport_heliport.road.xml_id
    ) AS roadtype
FROM


-- RoadTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.road.id = master_join.source_id
LEFT JOIN airport_heliport.road
ON master_join.target_id = RoadTimeSlicePropertyType.id
;

RouteAvailabilityPropertyType
CREATE OR REPLACE VIEW routeavailabilitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routeavailability_pt.id
    ) AS routeavailabilitypropertytype
FROM

-- RouteAvailabilityType
LEFT JOIN routes.routeavailability_pt
ON routes.routeavailability_pt.routeavailability_id = RouteAvailabilityType.id

;

RouteAvailabilityType
CREATE OR REPLACE VIEW routeavailabilitytype_view AS
SELECT
    jsonb_build_object(
       'direction_value', routes.routeavailability.direction_value,
       'direction_nilreason', routes.routeavailability.direction_nilreason,
       'cardinaldirection_value', routes.routeavailability.cardinaldirection_value,
       'cardinaldirection_nilreason', routes.routeavailability.cardinaldirection_nilreason,
       'status_value', routes.routeavailability.status_value,
       'status_nilreason', routes.routeavailability.status_nilreason,
       'id', routes.routeavailability.id,
       'identifier', routes.routeavailability.identifier,
       'identifier_code_space', routes.routeavailability.identifier_code_space,
       'xml_id', routes.routeavailability.xml_id
    ) AS routeavailabilitytype
FROM

-- AbstractExtensionType
LEFT JOIN routes.routeavailability
ON routes.routeavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.routeavailability
ON routes.routeavailability.abstractrouteavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN routes.master_join
ON routes.routeavailability.id = master_join.source_id
LEFT JOIN routes.routeavailability
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.routeavailability.id = master_join.source_id
LEFT JOIN routes.routeavailability
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN routes.master_join
ON routes.routeavailability.id = master_join.source_id
LEFT JOIN routes.routeavailability
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN routes.master_join
ON routes.routeavailability.id = master_join.source_id
LEFT JOIN routes.routeavailability
ON master_join.target_id = AirspaceLayerPropertyType.id
;

RouteDMEPropertyType
CREATE OR REPLACE VIEW routedmepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routedme_pt.id,
       'nilReason', routes.routedme_pt.nilReason
    ) AS routedmepropertytype
FROM


;

RouteDMETimeSlicePropertyType
CREATE OR REPLACE VIEW routedmetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routedme_tsp.id
    ) AS routedmetimeslicepropertytype
FROM

-- RouteDMETimeSliceType
LEFT JOIN routes.routedme_tsp
ON routes.routedme_tsp.routedmetimeslice_id = RouteDMETimeSliceType.id

;

RouteDMETimeSliceType
CREATE OR REPLACE VIEW routedmetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'criticaldme_value', routes.routedme_ts.criticaldme_value,
       'criticaldme_nilreason', routes.routedme_ts.criticaldme_nilreason,
       'satisfactory_value', routes.routedme_ts.satisfactory_value,
       'satisfactory_nilreason', routes.routedme_ts.satisfactory_nilreason,
       'id', routes.routedme_ts.id,
       'xml_id', routes.routedme_ts.xml_id,
       'interpretation', routes.routedme_ts.interpretation,
       'sequence_number', routes.routedme_ts.sequence_number,
       'correction_number', routes.routedme_ts.correction_number,
       'valid_time_begin', routes.routedme_ts.valid_time_begin,
       'valid_time_end', routes.routedme_ts.valid_time_end,
       'feature_lifetime_begin', routes.routedme_ts.feature_lifetime_begin,
       'feature_lifetime_end', routes.routedme_ts.feature_lifetime_end
    ) AS routedmetimeslicetype
FROM

-- DMEPropertyType
LEFT JOIN routes.routedme_ts
ON routes.routedme_ts.referenceddme_id = DMEPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN routes.routedme_ts
ON routes.routedme_ts.applicablerouteportion_id = RoutePortionPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.routedme_ts
ON routes.routedme_ts.abstractroutedmeextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.routedme_ts.id = master_join.source_id
LEFT JOIN routes.routedme_ts
ON master_join.target_id = NotePropertyType.id
;

RouteDMEType
CREATE OR REPLACE VIEW routedmetype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routedme.id,
       'identifier', routes.routedme.identifier,
       'identifier_code_space', routes.routedme.identifier_code_space,
       'xml_id', routes.routedme.xml_id
    ) AS routedmetype
FROM


-- RouteDMETimeSlicePropertyType
LEFT JOIN routes.master_join
ON routes.routedme.id = master_join.source_id
LEFT JOIN routes.routedme
ON master_join.target_id = RouteDMETimeSlicePropertyType.id
;

RoutePortionPropertyType
CREATE OR REPLACE VIEW routeportionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routeportion_pt.id
    ) AS routeportionpropertytype
FROM

-- RoutePortionType
LEFT JOIN routes.routeportion_pt
ON routes.routeportion_pt.routeportion_id = RoutePortionType.id

;

RoutePortionType
CREATE OR REPLACE VIEW routeportiontype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routeportion.id,
       'identifier', routes.routeportion.identifier,
       'identifier_code_space', routes.routeportion.identifier_code_space,
       'xml_id', routes.routeportion.xml_id
    ) AS routeportiontype
FROM

-- DesignatedPointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_position_id = PointPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_position_id = PointPropertyType.id
-- RoutePropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.referencedroute_id = RoutePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_position_id = PointPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.routeportion
ON routes.routeportion.abstractrouteportionextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.routeportion.id = master_join.source_id
LEFT JOIN routes.routeportion
ON master_join.target_id = NotePropertyType.id
;

RoutePropertyType
CREATE OR REPLACE VIEW routepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.route_pt.id,
       'nilReason', routes.route_pt.nilReason
    ) AS routepropertytype
FROM


;

RouteSegmentPropertyType
CREATE OR REPLACE VIEW routesegmentpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routesegment_pt.id,
       'nilReason', routes.routesegment_pt.nilReason
    ) AS routesegmentpropertytype
FROM


;

RouteSegmentTimeSlicePropertyType
CREATE OR REPLACE VIEW routesegmenttimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routesegment_tsp.id
    ) AS routesegmenttimeslicepropertytype
FROM

-- RouteSegmentTimeSliceType
LEFT JOIN routes.routesegment_tsp
ON routes.routesegment_tsp.routesegmenttimeslice_id = RouteSegmentTimeSliceType.id

;

RouteSegmentTimeSliceType
CREATE OR REPLACE VIEW routesegmenttimeslicetype_view AS
SELECT
    jsonb_build_object(
       'level_value', routes.routesegment_ts.level_value,
       'level_nilreason', routes.routesegment_ts.level_nilreason,
       'upperlimitreference_value', routes.routesegment_ts.upperlimitreference_value,
       'upperlimitreference_nilreason', routes.routesegment_ts.upperlimitreference_nilreason,
       'lowerlimitreference_value', routes.routesegment_ts.lowerlimitreference_value,
       'lowerlimitreference_nilreason', routes.routesegment_ts.lowerlimitreference_nilreason,
       'pathtype_value', routes.routesegment_ts.pathtype_value,
       'pathtype_nilreason', routes.routesegment_ts.pathtype_nilreason,
       'truetrack_value', routes.routesegment_ts.truetrack_value,
       'truetrack_nilreason', routes.routesegment_ts.truetrack_nilreason,
       'magnetictrack_value', routes.routesegment_ts.magnetictrack_value,
       'magnetictrack_nilreason', routes.routesegment_ts.magnetictrack_nilreason,
       'reversetruetrack_value', routes.routesegment_ts.reversetruetrack_value,
       'reversetruetrack_nilreason', routes.routesegment_ts.reversetruetrack_nilreason,
       'reversemagnetictrack_value', routes.routesegment_ts.reversemagnetictrack_value,
       'reversemagnetictrack_nilreason', routes.routesegment_ts.reversemagnetictrack_nilreason,
       'turndirection_value', routes.routesegment_ts.turndirection_value,
       'turndirection_nilreason', routes.routesegment_ts.turndirection_nilreason,
       'signalgap_value', routes.routesegment_ts.signalgap_value,
       'signalgap_nilreason', routes.routesegment_ts.signalgap_nilreason,
       'minimumcrossingatendreference_value', routes.routesegment_ts.minimumcrossingatendreference_value,
       'minimumcrossingatendreference_nilreason', routes.routesegment_ts.minimumcrossingatendreference_nilreason,
       'maximumcrossingatendreference_value', routes.routesegment_ts.maximumcrossingatendreference_value,
       'maximumcrossingatendreference_nilreason', routes.routesegment_ts.maximumcrossingatendreference_nilreason,
       'navigationtype_value', routes.routesegment_ts.navigationtype_value,
       'navigationtype_nilreason', routes.routesegment_ts.navigationtype_nilreason,
       'requirednavigationperformance_value', routes.routesegment_ts.requirednavigationperformance_value,
       'requirednavigationperformance_nilreason', routes.routesegment_ts.requirednavigationperformance_nilreason,
       'designatorsuffix_value', routes.routesegment_ts.designatorsuffix_value,
       'designatorsuffix_nilreason', routes.routesegment_ts.designatorsuffix_nilreason,
       'upperlimit_value', routes.routesegment_ts.upperlimit_value,
       'upperlimit_uom', routes.routesegment_ts.upperlimit_uom,
       'upperlimit_nilreason', routes.routesegment_ts.upperlimit_nilreason,
       'lowerlimit_value', routes.routesegment_ts.lowerlimit_value,
       'lowerlimit_uom', routes.routesegment_ts.lowerlimit_uom,
       'lowerlimit_nilreason', routes.routesegment_ts.lowerlimit_nilreason,
       'minimumobstacleclearancealtitude_value', routes.routesegment_ts.minimumobstacleclearancealtitude_value,
       'minimumobstacleclearancealtitude_uom', routes.routesegment_ts.minimumobstacleclearancealtitude_uom,
       'minimumobstacleclearancealtitude_nilreason', routes.routesegment_ts.minimumobstacleclearancealtitude_nilreason,
       'length_value', routes.routesegment_ts.length_value,
       'length_uom', routes.routesegment_ts.length_uom,
       'length_nilreason', routes.routesegment_ts.length_nilreason,
       'widthleft_value', routes.routesegment_ts.widthleft_value,
       'widthleft_uom', routes.routesegment_ts.widthleft_uom,
       'widthleft_nilreason', routes.routesegment_ts.widthleft_nilreason,
       'widthright_value', routes.routesegment_ts.widthright_value,
       'widthright_uom', routes.routesegment_ts.widthright_uom,
       'widthright_nilreason', routes.routesegment_ts.widthright_nilreason,
       'minimumenroutealtitude_value', routes.routesegment_ts.minimumenroutealtitude_value,
       'minimumenroutealtitude_uom', routes.routesegment_ts.minimumenroutealtitude_uom,
       'minimumenroutealtitude_nilreason', routes.routesegment_ts.minimumenroutealtitude_nilreason,
       'minimumcrossingatend_value', routes.routesegment_ts.minimumcrossingatend_value,
       'minimumcrossingatend_uom', routes.routesegment_ts.minimumcrossingatend_uom,
       'minimumcrossingatend_nilreason', routes.routesegment_ts.minimumcrossingatend_nilreason,
       'maximumcrossingatend_value', routes.routesegment_ts.maximumcrossingatend_value,
       'maximumcrossingatend_uom', routes.routesegment_ts.maximumcrossingatend_uom,
       'maximumcrossingatend_nilreason', routes.routesegment_ts.maximumcrossingatend_nilreason,
       'id', routes.routesegment_ts.id,
       'xml_id', routes.routesegment_ts.xml_id,
       'interpretation', routes.routesegment_ts.interpretation,
       'sequence_number', routes.routesegment_ts.sequence_number,
       'correction_number', routes.routesegment_ts.correction_number,
       'valid_time_begin', routes.routesegment_ts.valid_time_begin,
       'valid_time_end', routes.routesegment_ts.valid_time_end,
       'feature_lifetime_begin', routes.routesegment_ts.feature_lifetime_begin,
       'feature_lifetime_end', routes.routesegment_ts.feature_lifetime_end
    ) AS routesegmenttimeslicetype
FROM

-- EnRouteSegmentPointPropertyType
LEFT JOIN routes.routesegment_ts
ON routes.routesegment_ts.start_id = EnRouteSegmentPointPropertyType.id
-- RoutePropertyType
LEFT JOIN routes.routesegment_ts
ON routes.routesegment_ts.routeformed_id = RoutePropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN routes.routesegment_ts
ON routes.routesegment_ts.evaluationarea_id = ObstacleAssessmentAreaPropertyType.id
-- CurvePropertyType
LEFT JOIN routes.routesegment_ts
ON routes.routesegment_ts.curveextent_id = CurvePropertyType.id
-- EnRouteSegmentPointPropertyType
LEFT JOIN routes.routesegment_ts
ON routes.routesegment_ts.end_id = EnRouteSegmentPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.routesegment_ts
ON routes.routesegment_ts.abstractroutesegmentextension_id = AbstractExtensionType.id

-- RouteAvailabilityPropertyType
LEFT JOIN routes.master_join
ON routes.routesegment_ts.id = master_join.source_id
LEFT JOIN routes.routesegment_ts
ON master_join.target_id = RouteAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.routesegment_ts.id = master_join.source_id
LEFT JOIN routes.routesegment_ts
ON master_join.target_id = NotePropertyType.id
;

RouteSegmentType
CREATE OR REPLACE VIEW routesegmenttype_view AS
SELECT
    jsonb_build_object(
       'id', routes.routesegment.id,
       'identifier', routes.routesegment.identifier,
       'identifier_code_space', routes.routesegment.identifier_code_space,
       'xml_id', routes.routesegment.xml_id
    ) AS routesegmenttype
FROM


-- RouteSegmentTimeSlicePropertyType
LEFT JOIN routes.master_join
ON routes.routesegment.id = master_join.source_id
LEFT JOIN routes.routesegment
ON master_join.target_id = RouteSegmentTimeSlicePropertyType.id
;

RouteTimeSlicePropertyType
CREATE OR REPLACE VIEW routetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', routes.route_tsp.id
    ) AS routetimeslicepropertytype
FROM

-- RouteTimeSliceType
LEFT JOIN routes.route_tsp
ON routes.route_tsp.routetimeslice_id = RouteTimeSliceType.id

;

RouteTimeSliceType
CREATE OR REPLACE VIEW routetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designatorprefix_value', routes.route_ts.designatorprefix_value,
       'designatorprefix_nilreason', routes.route_ts.designatorprefix_nilreason,
       'designatorsecondletter_value', routes.route_ts.designatorsecondletter_value,
       'designatorsecondletter_nilreason', routes.route_ts.designatorsecondletter_nilreason,
       'designatornumber_value', routes.route_ts.designatornumber_value,
       'designatornumber_nilreason', routes.route_ts.designatornumber_nilreason,
       'multipleidentifier_value', routes.route_ts.multipleidentifier_value,
       'multipleidentifier_nilreason', routes.route_ts.multipleidentifier_nilreason,
       'locationdesignator_value', routes.route_ts.locationdesignator_value,
       'locationdesignator_nilreason', routes.route_ts.locationdesignator_nilreason,
       'name_value', routes.route_ts.name_value,
       'name_nilreason', routes.route_ts.name_nilreason,
       'type_value', routes.route_ts.type_value,
       'type_nilreason', routes.route_ts.type_nilreason,
       'flightrule_value', routes.route_ts.flightrule_value,
       'flightrule_nilreason', routes.route_ts.flightrule_nilreason,
       'internationaluse_value', routes.route_ts.internationaluse_value,
       'internationaluse_nilreason', routes.route_ts.internationaluse_nilreason,
       'militaryuse_value', routes.route_ts.militaryuse_value,
       'militaryuse_nilreason', routes.route_ts.militaryuse_nilreason,
       'militarytrainingtype_value', routes.route_ts.militarytrainingtype_value,
       'militarytrainingtype_nilreason', routes.route_ts.militarytrainingtype_nilreason,
       'id', routes.route_ts.id,
       'xml_id', routes.route_ts.xml_id,
       'interpretation', routes.route_ts.interpretation,
       'sequence_number', routes.route_ts.sequence_number,
       'correction_number', routes.route_ts.correction_number,
       'valid_time_begin', routes.route_ts.valid_time_begin,
       'valid_time_end', routes.route_ts.valid_time_end,
       'feature_lifetime_begin', routes.route_ts.feature_lifetime_begin,
       'feature_lifetime_end', routes.route_ts.feature_lifetime_end
    ) AS routetimeslicetype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN routes.route_ts
ON routes.route_ts.userorganisation_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.route_ts
ON routes.route_ts.abstractrouteextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.master_join
ON routes.route_ts.id = master_join.source_id
LEFT JOIN routes.route_ts
ON master_join.target_id = NotePropertyType.id
;

RouteType
CREATE OR REPLACE VIEW routetype_view AS
SELECT
    jsonb_build_object(
       'id', routes.route.id,
       'identifier', routes.route.identifier,
       'identifier_code_space', routes.route.identifier_code_space,
       'xml_id', routes.route.xml_id
    ) AS routetype
FROM


-- RouteTimeSlicePropertyType
LEFT JOIN routes.master_join
ON routes.route.id = master_join.source_id
LEFT JOIN routes.route
ON master_join.target_id = RouteTimeSlicePropertyType.id
;

RulesProceduresPropertyType
CREATE OR REPLACE VIEW rulesprocedurespropertytype_view AS
SELECT
    jsonb_build_object(
       'id', rules_procedures.rulesprocedures_pt.id,
       'nilReason', rules_procedures.rulesprocedures_pt.nilReason
    ) AS rulesprocedurespropertytype
FROM


;

RulesProceduresTimeSlicePropertyType
CREATE OR REPLACE VIEW rulesprocedurestimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', rules_procedures.rulesprocedures_tsp.id
    ) AS rulesprocedurestimeslicepropertytype
FROM

-- RulesProceduresTimeSliceType
LEFT JOIN rules_procedures.rulesprocedures_tsp
ON rules_procedures.rulesprocedures_tsp.rulesprocedurestimeslice_id = RulesProceduresTimeSliceType.id

;

RulesProceduresTimeSliceType
CREATE OR REPLACE VIEW rulesprocedurestimeslicetype_view AS
SELECT
    jsonb_build_object(
       'category_value', rules_procedures.rulesprocedures_ts.category_value,
       'category_nilreason', rules_procedures.rulesprocedures_ts.category_nilreason,
       'title_value', rules_procedures.rulesprocedures_ts.title_value,
       'title_nilreason', rules_procedures.rulesprocedures_ts.title_nilreason,
       'id', rules_procedures.rulesprocedures_ts.id,
       'xml_id', rules_procedures.rulesprocedures_ts.xml_id,
       'interpretation', rules_procedures.rulesprocedures_ts.interpretation,
       'sequence_number', rules_procedures.rulesprocedures_ts.sequence_number,
       'correction_number', rules_procedures.rulesprocedures_ts.correction_number,
       'valid_time_begin', rules_procedures.rulesprocedures_ts.valid_time_begin,
       'valid_time_end', rules_procedures.rulesprocedures_ts.valid_time_end,
       'feature_lifetime_begin', rules_procedures.rulesprocedures_ts.feature_lifetime_begin,
       'feature_lifetime_end', rules_procedures.rulesprocedures_ts.feature_lifetime_end
    ) AS rulesprocedurestimeslicetype
FROM

-- AbstractExtensionType
LEFT JOIN rules_procedures.rulesprocedures_ts
ON rules_procedures.rulesprocedures_ts.abstractrulesproceduresextension_id = AbstractExtensionType.id

-- AirportHeliportPropertyType
LEFT JOIN rules_procedures.master_join
ON rules_procedures.rulesprocedures_ts.id = master_join.source_id
LEFT JOIN rules_procedures.rulesprocedures_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- AirspacePropertyType
LEFT JOIN rules_procedures.master_join
ON rules_procedures.rulesprocedures_ts.id = master_join.source_id
LEFT JOIN rules_procedures.rulesprocedures_ts
ON master_join.target_id = AirspacePropertyType.id
-- NotePropertyType
LEFT JOIN rules_procedures.master_join
ON rules_procedures.rulesprocedures_ts.id = master_join.source_id
LEFT JOIN rules_procedures.rulesprocedures_ts
ON master_join.target_id = NotePropertyType.id
;

RulesProceduresType
CREATE OR REPLACE VIEW rulesprocedurestype_view AS
SELECT
    jsonb_build_object(
       'id', rules_procedures.rulesprocedures.id,
       'identifier', rules_procedures.rulesprocedures.identifier,
       'identifier_code_space', rules_procedures.rulesprocedures.identifier_code_space,
       'xml_id', rules_procedures.rulesprocedures.xml_id
    ) AS rulesprocedurestype
FROM


-- RulesProceduresTimeSlicePropertyType
LEFT JOIN rules_procedures.master_join
ON rules_procedures.rulesprocedures.id = master_join.source_id
LEFT JOIN rules_procedures.rulesprocedures
ON master_join.target_id = RulesProceduresTimeSlicePropertyType.id
;

RunwayBlastPadPropertyType
CREATE OR REPLACE VIEW runwayblastpadpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayblastpad_pt.id,
       'nilReason', airport_heliport.runwayblastpad_pt.nilReason
    ) AS runwayblastpadpropertytype
FROM


;

RunwayBlastPadTimeSlicePropertyType
CREATE OR REPLACE VIEW runwayblastpadtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayblastpad_tsp.id
    ) AS runwayblastpadtimeslicepropertytype
FROM

-- RunwayBlastPadTimeSliceType
LEFT JOIN airport_heliport.runwayblastpad_tsp
ON airport_heliport.runwayblastpad_tsp.runwayblastpadtimeslice_id = RunwayBlastPadTimeSliceType.id

;

RunwayBlastPadTimeSliceType
CREATE OR REPLACE VIEW runwayblastpadtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'status_value', airport_heliport.runwayblastpad_ts.status_value,
       'status_nilreason', airport_heliport.runwayblastpad_ts.status_nilreason,
       'length_value', airport_heliport.runwayblastpad_ts.length_value,
       'length_uom', airport_heliport.runwayblastpad_ts.length_uom,
       'length_nilreason', airport_heliport.runwayblastpad_ts.length_nilreason,
       'id', airport_heliport.runwayblastpad_ts.id,
       'xml_id', airport_heliport.runwayblastpad_ts.xml_id,
       'interpretation', airport_heliport.runwayblastpad_ts.interpretation,
       'sequence_number', airport_heliport.runwayblastpad_ts.sequence_number,
       'correction_number', airport_heliport.runwayblastpad_ts.correction_number,
       'valid_time_begin', airport_heliport.runwayblastpad_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwayblastpad_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwayblastpad_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwayblastpad_ts.feature_lifetime_end
    ) AS runwayblastpadtimeslicetype
FROM

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.runwayblastpad_ts
ON airport_heliport.runwayblastpad_ts.usedrunwaydirection_id = RunwayDirectionPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.runwayblastpad_ts
ON airport_heliport.runwayblastpad_ts.extent_id = ElevatedSurfacePropertyType.id
-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.runwayblastpad_ts
ON airport_heliport.runwayblastpad_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayblastpad_ts
ON airport_heliport.runwayblastpad_ts.abstractrunwayblastpadextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayblastpad_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayblastpad_ts
ON master_join.target_id = NotePropertyType.id
;

RunwayBlastPadType
CREATE OR REPLACE VIEW runwayblastpadtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayblastpad.id,
       'identifier', airport_heliport.runwayblastpad.identifier,
       'identifier_code_space', airport_heliport.runwayblastpad.identifier_code_space,
       'xml_id', airport_heliport.runwayblastpad.xml_id
    ) AS runwayblastpadtype
FROM


-- RunwayBlastPadTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayblastpad.id = master_join.source_id
LEFT JOIN airport_heliport.runwayblastpad
ON master_join.target_id = RunwayBlastPadTimeSlicePropertyType.id
;

RunwayCentrelinePointPropertyType
CREATE OR REPLACE VIEW runwaycentrelinepointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaycentrelinepoint_pt.id,
       'nilReason', airport_heliport.runwaycentrelinepoint_pt.nilReason
    ) AS runwaycentrelinepointpropertytype
FROM


;

RunwayCentrelinePointTimeSlicePropertyType
CREATE OR REPLACE VIEW runwaycentrelinepointtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaycentrelinepoint_tsp.id
    ) AS runwaycentrelinepointtimeslicepropertytype
FROM

-- RunwayCentrelinePointTimeSliceType
LEFT JOIN airport_heliport.runwaycentrelinepoint_tsp
ON airport_heliport.runwaycentrelinepoint_tsp.runwaycentrelinepointtimeslice_id = RunwayCentrelinePointTimeSliceType.id

;

RunwayCentrelinePointTimeSliceType
CREATE OR REPLACE VIEW runwaycentrelinepointtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'role_value', airport_heliport.runwaycentrelinepoint_ts.role_value,
       'role_nilreason', airport_heliport.runwaycentrelinepoint_ts.role_nilreason,
       'designator_value', airport_heliport.runwaycentrelinepoint_ts.designator_value,
       'designator_nilreason', airport_heliport.runwaycentrelinepoint_ts.designator_nilreason,
       'id', airport_heliport.runwaycentrelinepoint_ts.id,
       'xml_id', airport_heliport.runwaycentrelinepoint_ts.xml_id,
       'interpretation', airport_heliport.runwaycentrelinepoint_ts.interpretation,
       'sequence_number', airport_heliport.runwaycentrelinepoint_ts.sequence_number,
       'correction_number', airport_heliport.runwaycentrelinepoint_ts.correction_number,
       'valid_time_begin', airport_heliport.runwaycentrelinepoint_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwaycentrelinepoint_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwaycentrelinepoint_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwaycentrelinepoint_ts.feature_lifetime_end
    ) AS runwaycentrelinepointtimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON airport_heliport.runwaycentrelinepoint_ts.location_id = ElevatedPointPropertyType.id
-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON airport_heliport.runwaycentrelinepoint_ts.onrunway_id = RunwayDirectionPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON airport_heliport.runwaycentrelinepoint_ts.abstractrunwaycentrelinepointextension_id = AbstractExtensionType.id

-- RunwayDeclaredDistancePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaycentrelinepoint_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON master_join.target_id = RunwayDeclaredDistancePropertyType.id
-- NavaidEquipmentDistancePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaycentrelinepoint_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON master_join.target_id = NavaidEquipmentDistancePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaycentrelinepoint_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON master_join.target_id = NotePropertyType.id
;

RunwayCentrelinePointType
CREATE OR REPLACE VIEW runwaycentrelinepointtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaycentrelinepoint.id,
       'identifier', airport_heliport.runwaycentrelinepoint.identifier,
       'identifier_code_space', airport_heliport.runwaycentrelinepoint.identifier_code_space,
       'xml_id', airport_heliport.runwaycentrelinepoint.xml_id
    ) AS runwaycentrelinepointtype
FROM


-- RunwayCentrelinePointTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaycentrelinepoint.id = master_join.source_id
LEFT JOIN airport_heliport.runwaycentrelinepoint
ON master_join.target_id = RunwayCentrelinePointTimeSlicePropertyType.id
;

RunwayContaminationPropertyType
CREATE OR REPLACE VIEW runwaycontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaycontamination_pt.id
    ) AS runwaycontaminationpropertytype
FROM

-- RunwayContaminationType
LEFT JOIN airport_heliport.runwaycontamination_pt
ON airport_heliport.runwaycontamination_pt.runwaycontamination_id = RunwayContaminationType.id

;

RunwayContaminationType
CREATE OR REPLACE VIEW runwaycontaminationtype_view AS
SELECT
    jsonb_build_object(
       'observationTime_value', airport_heliport.runwaycontamination.observationTime_value,
       'observationTime_nilreason', airport_heliport.runwaycontamination.observationTime_nilreason,
       'nextObservationTime_value', airport_heliport.runwaycontamination.nextObservationTime_value,
       'nextObservationTime_nilreason', airport_heliport.runwaycontamination.nextObservationTime_nilreason,
       'frictioncoefficient_value', airport_heliport.runwaycontamination.frictioncoefficient_value,
       'frictioncoefficient_nilreason', airport_heliport.runwaycontamination.frictioncoefficient_nilreason,
       'frictionestimation_value', airport_heliport.runwaycontamination.frictionestimation_value,
       'frictionestimation_nilreason', airport_heliport.runwaycontamination.frictionestimation_nilreason,
       'frictiondevice_value', airport_heliport.runwaycontamination.frictiondevice_value,
       'frictiondevice_nilreason', airport_heliport.runwaycontamination.frictiondevice_nilreason,
       'obscuredlights_value', airport_heliport.runwaycontamination.obscuredlights_value,
       'obscuredlights_nilreason', airport_heliport.runwaycontamination.obscuredlights_nilreason,
       'furtherclearancetime_value', airport_heliport.runwaycontamination.furtherclearancetime_value,
       'furtherclearancetime_nilreason', airport_heliport.runwaycontamination.furtherclearancetime_nilreason,
       'furthertotalclearance_value', airport_heliport.runwaycontamination.furthertotalclearance_value,
       'furthertotalclearance_nilreason', airport_heliport.runwaycontamination.furthertotalclearance_nilreason,
       'proportion_value', airport_heliport.runwaycontamination.proportion_value,
       'proportion_nilreason', airport_heliport.runwaycontamination.proportion_nilreason,
       'clearedside_value', airport_heliport.runwaycontamination.clearedside_value,
       'clearedside_nilreason', airport_heliport.runwaycontamination.clearedside_nilreason,
       'obscuredlightsside_value', airport_heliport.runwaycontamination.obscuredlightsside_value,
       'obscuredlightsside_nilreason', airport_heliport.runwaycontamination.obscuredlightsside_nilreason,
       'taxiwayavailable_value', airport_heliport.runwaycontamination.taxiwayavailable_value,
       'taxiwayavailable_nilreason', airport_heliport.runwaycontamination.taxiwayavailable_nilreason,
       'apronavailable_value', airport_heliport.runwaycontamination.apronavailable_value,
       'apronavailable_nilreason', airport_heliport.runwaycontamination.apronavailable_nilreason,
       'depth_value', airport_heliport.runwaycontamination.depth_value,
       'depth_uom', airport_heliport.runwaycontamination.depth_uom,
       'depth_nilreason', airport_heliport.runwaycontamination.depth_nilreason,
       'clearedlength_value', airport_heliport.runwaycontamination.clearedlength_value,
       'clearedlength_uom', airport_heliport.runwaycontamination.clearedlength_uom,
       'clearedlength_nilreason', airport_heliport.runwaycontamination.clearedlength_nilreason,
       'clearedwidth_value', airport_heliport.runwaycontamination.clearedwidth_value,
       'clearedwidth_uom', airport_heliport.runwaycontamination.clearedwidth_uom,
       'clearedwidth_nilreason', airport_heliport.runwaycontamination.clearedwidth_nilreason,
       'furtherclearancelength_value', airport_heliport.runwaycontamination.furtherclearancelength_value,
       'furtherclearancelength_uom', airport_heliport.runwaycontamination.furtherclearancelength_uom,
       'furtherclearancelength_nilreason', airport_heliport.runwaycontamination.furtherclearancelength_nilreason,
       'furtherclearancewidth_value', airport_heliport.runwaycontamination.furtherclearancewidth_value,
       'furtherclearancewidth_uom', airport_heliport.runwaycontamination.furtherclearancewidth_uom,
       'furtherclearancewidth_nilreason', airport_heliport.runwaycontamination.furtherclearancewidth_nilreason,
       'clearedlengthbegin_value', airport_heliport.runwaycontamination.clearedlengthbegin_value,
       'clearedlengthbegin_uom', airport_heliport.runwaycontamination.clearedlengthbegin_uom,
       'clearedlengthbegin_nilreason', airport_heliport.runwaycontamination.clearedlengthbegin_nilreason,
       'id', airport_heliport.runwaycontamination.id,
       'identifier', airport_heliport.runwaycontamination.identifier,
       'identifier_code_space', airport_heliport.runwaycontamination.identifier_code_space,
       'xml_id', airport_heliport.runwaycontamination.xml_id
    ) AS runwaycontaminationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaycontamination
ON airport_heliport.runwaycontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaycontamination
ON airport_heliport.runwaycontamination.abstractrunwaycontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaycontamination.id = master_join.source_id
LEFT JOIN airport_heliport.runwaycontamination
ON master_join.target_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaycontamination.id = master_join.source_id
LEFT JOIN airport_heliport.runwaycontamination
ON master_join.target_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaycontamination.id = master_join.source_id
LEFT JOIN airport_heliport.runwaycontamination
ON master_join.target_id = NotePropertyType.id
;

RunwayDeclaredDistancePropertyType
CREATE OR REPLACE VIEW runwaydeclareddistancepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydeclareddistance_pt.id
    ) AS runwaydeclareddistancepropertytype
FROM

-- RunwayDeclaredDistanceType
LEFT JOIN airport_heliport.runwaydeclareddistance_pt
ON airport_heliport.runwaydeclareddistance_pt.runwaydeclareddistance_id = RunwayDeclaredDistanceType.id

;

RunwayDeclaredDistanceType
CREATE OR REPLACE VIEW runwaydeclareddistancetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.runwaydeclareddistance.type_value,
       'type_nilreason', airport_heliport.runwaydeclareddistance.type_nilreason,
       'id', airport_heliport.runwaydeclareddistance.id,
       'identifier', airport_heliport.runwaydeclareddistance.identifier,
       'identifier_code_space', airport_heliport.runwaydeclareddistance.identifier_code_space,
       'xml_id', airport_heliport.runwaydeclareddistance.xml_id
    ) AS runwaydeclareddistancetype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydeclareddistance
ON airport_heliport.runwaydeclareddistance.abstractrunwaydeclareddistanceextension_id = AbstractExtensionType.id

-- RunwayDeclaredDistanceValuePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydeclareddistance.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydeclareddistance
ON master_join.target_id = RunwayDeclaredDistanceValuePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydeclareddistance.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydeclareddistance
ON master_join.target_id = NotePropertyType.id
;

RunwayDeclaredDistanceValuePropertyType
CREATE OR REPLACE VIEW runwaydeclareddistancevaluepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydeclareddistancevalue_pt.id
    ) AS runwaydeclareddistancevaluepropertytype
FROM

-- RunwayDeclaredDistanceValueType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue_pt
ON airport_heliport.runwaydeclareddistancevalue_pt.runwaydeclareddistancevalue_id = RunwayDeclaredDistanceValueType.id

;

RunwayDeclaredDistanceValueType
CREATE OR REPLACE VIEW runwaydeclareddistancevaluetype_view AS
SELECT
    jsonb_build_object(
       'distance_value', airport_heliport.runwaydeclareddistancevalue.distance_value,
       'distance_uom', airport_heliport.runwaydeclareddistancevalue.distance_uom,
       'distance_nilreason', airport_heliport.runwaydeclareddistancevalue.distance_nilreason,
       'distanceaccuracy_value', airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_value,
       'distanceaccuracy_uom', airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_uom,
       'distanceaccuracy_nilreason', airport_heliport.runwaydeclareddistancevalue.distanceaccuracy_nilreason,
       'id', airport_heliport.runwaydeclareddistancevalue.id,
       'identifier', airport_heliport.runwaydeclareddistancevalue.identifier,
       'identifier_code_space', airport_heliport.runwaydeclareddistancevalue.identifier_code_space,
       'xml_id', airport_heliport.runwaydeclareddistancevalue.xml_id
    ) AS runwaydeclareddistancevaluetype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON airport_heliport.runwaydeclareddistancevalue.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON airport_heliport.runwaydeclareddistancevalue.abstractrunwaydeclareddistancevalueextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydeclareddistancevalue.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydeclareddistancevalue.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydeclareddistancevalue.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

RunwayDirectionLightSystemPropertyType
CREATE OR REPLACE VIEW runwaydirectionlightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirectionlightsystem_pt.id,
       'nilReason', airport_heliport.runwaydirectionlightsystem_pt.nilReason
    ) AS runwaydirectionlightsystempropertytype
FROM


;

RunwayDirectionLightSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW runwaydirectionlightsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirectionlightsystem_tsp.id
    ) AS runwaydirectionlightsystemtimeslicepropertytype
FROM

-- RunwayDirectionLightSystemTimeSliceType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_tsp
ON airport_heliport.runwaydirectionlightsystem_tsp.runwaydirectionlightsystemtimeslice_id = RunwayDirectionLightSystemTimeSliceType.id

;

RunwayDirectionLightSystemTimeSliceType
CREATE OR REPLACE VIEW runwaydirectionlightsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.runwaydirectionlightsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.runwaydirectionlightsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.runwaydirectionlightsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.runwaydirectionlightsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.runwaydirectionlightsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.runwaydirectionlightsystem_ts.colour_nilreason,
       'position_value', airport_heliport.runwaydirectionlightsystem_ts.position_value,
       'position_nilreason', airport_heliport.runwaydirectionlightsystem_ts.position_nilreason,
       'id', airport_heliport.runwaydirectionlightsystem_ts.id,
       'xml_id', airport_heliport.runwaydirectionlightsystem_ts.xml_id,
       'interpretation', airport_heliport.runwaydirectionlightsystem_ts.interpretation,
       'sequence_number', airport_heliport.runwaydirectionlightsystem_ts.sequence_number,
       'correction_number', airport_heliport.runwaydirectionlightsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.runwaydirectionlightsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwaydirectionlightsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwaydirectionlightsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwaydirectionlightsystem_ts.feature_lifetime_end
    ) AS runwaydirectionlightsystemtimeslicetype
FROM

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON airport_heliport.runwaydirectionlightsystem_ts.associatedrunwaydirection_id = RunwayDirectionPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON airport_heliport.runwaydirectionlightsystem_ts.abstractrunwaydirectionlightsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON airport_heliport.runwaydirectionlightsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydirectionlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydirectionlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydirectionlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON master_join.target_id = NotePropertyType.id
;

RunwayDirectionLightSystemType
CREATE OR REPLACE VIEW runwaydirectionlightsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirectionlightsystem.id,
       'identifier', airport_heliport.runwaydirectionlightsystem.identifier,
       'identifier_code_space', airport_heliport.runwaydirectionlightsystem.identifier_code_space,
       'xml_id', airport_heliport.runwaydirectionlightsystem.xml_id
    ) AS runwaydirectionlightsystemtype
FROM


-- RunwayDirectionLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydirectionlightsystem.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem
ON master_join.target_id = RunwayDirectionLightSystemTimeSlicePropertyType.id
;

RunwayDirectionPropertyType
CREATE OR REPLACE VIEW runwaydirectionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirection_pt.id,
       'nilReason', airport_heliport.runwaydirection_pt.nilReason
    ) AS runwaydirectionpropertytype
FROM


;

RunwayDirectionTimeSlicePropertyType
CREATE OR REPLACE VIEW runwaydirectiontimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirection_tsp.id
    ) AS runwaydirectiontimeslicepropertytype
FROM

-- RunwayDirectionTimeSliceType
LEFT JOIN airport_heliport.runwaydirection_tsp
ON airport_heliport.runwaydirection_tsp.runwaydirectiontimeslice_id = RunwayDirectionTimeSliceType.id

;

RunwayDirectionTimeSliceType
CREATE OR REPLACE VIEW runwaydirectiontimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.runwaydirection_ts.designator_value,
       'designator_nilreason', airport_heliport.runwaydirection_ts.designator_nilreason,
       'truebearing_value', airport_heliport.runwaydirection_ts.truebearing_value,
       'truebearing_nilreason', airport_heliport.runwaydirection_ts.truebearing_nilreason,
       'truebearingaccuracy_value', airport_heliport.runwaydirection_ts.truebearingaccuracy_value,
       'truebearingaccuracy_nilreason', airport_heliport.runwaydirection_ts.truebearingaccuracy_nilreason,
       'magneticbearing_value', airport_heliport.runwaydirection_ts.magneticbearing_value,
       'magneticbearing_nilreason', airport_heliport.runwaydirection_ts.magneticbearing_nilreason,
       'patternvfr_value', airport_heliport.runwaydirection_ts.patternvfr_value,
       'patternvfr_nilreason', airport_heliport.runwaydirection_ts.patternvfr_nilreason,
       'slopetdz_value', airport_heliport.runwaydirection_ts.slopetdz_value,
       'slopetdz_nilreason', airport_heliport.runwaydirection_ts.slopetdz_nilreason,
       'approachmarkingtype_value', airport_heliport.runwaydirection_ts.approachmarkingtype_value,
       'approachmarkingtype_nilreason', airport_heliport.runwaydirection_ts.approachmarkingtype_nilreason,
       'approachmarkingcondition_value', airport_heliport.runwaydirection_ts.approachmarkingcondition_value,
       'approachmarkingcondition_nilreason', airport_heliport.runwaydirection_ts.approachmarkingcondition_nilreason,
       'classlightingjar_value', airport_heliport.runwaydirection_ts.classlightingjar_value,
       'classlightingjar_nilreason', airport_heliport.runwaydirection_ts.classlightingjar_nilreason,
       'precisionapproachguidance_value', airport_heliport.runwaydirection_ts.precisionapproachguidance_value,
       'precisionapproachguidance_nilreason', airport_heliport.runwaydirection_ts.precisionapproachguidance_nilreason,
       'elevationtdz_value', airport_heliport.runwaydirection_ts.elevationtdz_value,
       'elevationtdz_uom', airport_heliport.runwaydirection_ts.elevationtdz_uom,
       'elevationtdz_nilreason', airport_heliport.runwaydirection_ts.elevationtdz_nilreason,
       'elevationtdzaccuracy_value', airport_heliport.runwaydirection_ts.elevationtdzaccuracy_value,
       'elevationtdzaccuracy_uom', airport_heliport.runwaydirection_ts.elevationtdzaccuracy_uom,
       'elevationtdzaccuracy_nilreason', airport_heliport.runwaydirection_ts.elevationtdzaccuracy_nilreason,
       'id', airport_heliport.runwaydirection_ts.id,
       'xml_id', airport_heliport.runwaydirection_ts.xml_id,
       'interpretation', airport_heliport.runwaydirection_ts.interpretation,
       'sequence_number', airport_heliport.runwaydirection_ts.sequence_number,
       'correction_number', airport_heliport.runwaydirection_ts.correction_number,
       'valid_time_begin', airport_heliport.runwaydirection_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwaydirection_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwaydirection_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwaydirection_ts.feature_lifetime_end
    ) AS runwaydirectiontimeslicetype
FROM

-- RunwayPropertyType
LEFT JOIN airport_heliport.runwaydirection_ts
ON airport_heliport.runwaydirection_ts.usedrunway_id = RunwayPropertyType.id
-- RunwayElementPropertyType
LEFT JOIN airport_heliport.runwaydirection_ts
ON airport_heliport.runwaydirection_ts.startingelement_id = RunwayElementPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydirection_ts
ON airport_heliport.runwaydirection_ts.abstractrunwaydirectionextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydirection_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydirection_ts
ON master_join.target_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydirection_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydirection_ts
ON master_join.target_id = ManoeuvringAreaAvailabilityPropertyType.id
;

RunwayDirectionType
CREATE OR REPLACE VIEW runwaydirectiontype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirection.id,
       'identifier', airport_heliport.runwaydirection.identifier,
       'identifier_code_space', airport_heliport.runwaydirection.identifier_code_space,
       'xml_id', airport_heliport.runwaydirection.xml_id
    ) AS runwaydirectiontype
FROM


-- RunwayDirectionTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaydirection.id = master_join.source_id
LEFT JOIN airport_heliport.runwaydirection
ON master_join.target_id = RunwayDirectionTimeSlicePropertyType.id
;

RunwayElementPropertyType
CREATE OR REPLACE VIEW runwayelementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayelement_pt.id,
       'nilReason', airport_heliport.runwayelement_pt.nilReason
    ) AS runwayelementpropertytype
FROM


;

RunwayElementTimeSlicePropertyType
CREATE OR REPLACE VIEW runwayelementtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayelement_tsp.id
    ) AS runwayelementtimeslicepropertytype
FROM

-- RunwayElementTimeSliceType
LEFT JOIN airport_heliport.runwayelement_tsp
ON airport_heliport.runwayelement_tsp.runwayelementtimeslice_id = RunwayElementTimeSliceType.id

;

RunwayElementTimeSliceType
CREATE OR REPLACE VIEW runwayelementtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.runwayelement_ts.type_value,
       'type_nilreason', airport_heliport.runwayelement_ts.type_nilreason,
       'gradeseparation_value', airport_heliport.runwayelement_ts.gradeseparation_value,
       'gradeseparation_nilreason', airport_heliport.runwayelement_ts.gradeseparation_nilreason,
       'length_value', airport_heliport.runwayelement_ts.length_value,
       'length_uom', airport_heliport.runwayelement_ts.length_uom,
       'length_nilreason', airport_heliport.runwayelement_ts.length_nilreason,
       'width_value', airport_heliport.runwayelement_ts.width_value,
       'width_uom', airport_heliport.runwayelement_ts.width_uom,
       'width_nilreason', airport_heliport.runwayelement_ts.width_nilreason,
       'id', airport_heliport.runwayelement_ts.id,
       'xml_id', airport_heliport.runwayelement_ts.xml_id,
       'interpretation', airport_heliport.runwayelement_ts.interpretation,
       'sequence_number', airport_heliport.runwayelement_ts.sequence_number,
       'correction_number', airport_heliport.runwayelement_ts.correction_number,
       'valid_time_begin', airport_heliport.runwayelement_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwayelement_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwayelement_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwayelement_ts.feature_lifetime_end
    ) AS runwayelementtimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.runwayelement_ts
ON airport_heliport.runwayelement_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.runwayelement_ts
ON airport_heliport.runwayelement_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayelement_ts
ON airport_heliport.runwayelement_ts.abstractrunwayelementextension_id = AbstractExtensionType.id

-- RunwayPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayelement_ts
ON master_join.target_id = RunwayPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayelement_ts
ON master_join.target_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayelement_ts
ON master_join.target_id = ManoeuvringAreaAvailabilityPropertyType.id
;

RunwayElementType
CREATE OR REPLACE VIEW runwayelementtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayelement.id,
       'identifier', airport_heliport.runwayelement.identifier,
       'identifier_code_space', airport_heliport.runwayelement.identifier_code_space,
       'xml_id', airport_heliport.runwayelement.xml_id
    ) AS runwayelementtype
FROM


-- RunwayElementTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayelement.id = master_join.source_id
LEFT JOIN airport_heliport.runwayelement
ON master_join.target_id = RunwayElementTimeSlicePropertyType.id
;

RunwayMarkingPropertyType
CREATE OR REPLACE VIEW runwaymarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaymarking_pt.id,
       'nilReason', airport_heliport.runwaymarking_pt.nilReason
    ) AS runwaymarkingpropertytype
FROM


;

RunwayMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW runwaymarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaymarking_tsp.id
    ) AS runwaymarkingtimeslicepropertytype
FROM

-- RunwayMarkingTimeSliceType
LEFT JOIN airport_heliport.runwaymarking_tsp
ON airport_heliport.runwaymarking_tsp.runwaymarkingtimeslice_id = RunwayMarkingTimeSliceType.id

;

RunwayMarkingTimeSliceType
CREATE OR REPLACE VIEW runwaymarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.runwaymarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.runwaymarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.runwaymarking_ts.condition_value,
       'condition_nilreason', airport_heliport.runwaymarking_ts.condition_nilreason,
       'markinglocation_value', airport_heliport.runwaymarking_ts.markinglocation_value,
       'markinglocation_nilreason', airport_heliport.runwaymarking_ts.markinglocation_nilreason,
       'id', airport_heliport.runwaymarking_ts.id,
       'xml_id', airport_heliport.runwaymarking_ts.xml_id,
       'interpretation', airport_heliport.runwaymarking_ts.interpretation,
       'sequence_number', airport_heliport.runwaymarking_ts.sequence_number,
       'correction_number', airport_heliport.runwaymarking_ts.correction_number,
       'valid_time_begin', airport_heliport.runwaymarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwaymarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwaymarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwaymarking_ts.feature_lifetime_end
    ) AS runwaymarkingtimeslicetype
FROM

-- RunwayPropertyType
LEFT JOIN airport_heliport.runwaymarking_ts
ON airport_heliport.runwaymarking_ts.markedrunway_id = RunwayPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaymarking_ts
ON airport_heliport.runwaymarking_ts.abstractrunwaymarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaymarking_ts
ON airport_heliport.runwaymarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaymarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaymarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaymarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwaymarking_ts
ON master_join.target_id = NotePropertyType.id
;

RunwayMarkingType
CREATE OR REPLACE VIEW runwaymarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaymarking.id,
       'identifier', airport_heliport.runwaymarking.identifier,
       'identifier_code_space', airport_heliport.runwaymarking.identifier_code_space,
       'xml_id', airport_heliport.runwaymarking.xml_id
    ) AS runwaymarkingtype
FROM


-- RunwayMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaymarking.id = master_join.source_id
LEFT JOIN airport_heliport.runwaymarking
ON master_join.target_id = RunwayMarkingTimeSlicePropertyType.id
;

RunwayPropertyType
CREATE OR REPLACE VIEW runwaypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runway_pt.id,
       'nilReason', airport_heliport.runway_pt.nilReason
    ) AS runwaypropertytype
FROM


;

RunwayProtectAreaLightSystemPropertyType
CREATE OR REPLACE VIEW runwayprotectarealightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarealightsystem_pt.id,
       'nilReason', airport_heliport.runwayprotectarealightsystem_pt.nilReason
    ) AS runwayprotectarealightsystempropertytype
FROM


;

RunwayProtectAreaLightSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW runwayprotectarealightsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarealightsystem_tsp.id
    ) AS runwayprotectarealightsystemtimeslicepropertytype
FROM

-- RunwayProtectAreaLightSystemTimeSliceType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_tsp
ON airport_heliport.runwayprotectarealightsystem_tsp.runwayprotectarealightsystemtimeslice_id = RunwayProtectAreaLightSystemTimeSliceType.id

;

RunwayProtectAreaLightSystemTimeSliceType
CREATE OR REPLACE VIEW runwayprotectarealightsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.runwayprotectarealightsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.runwayprotectarealightsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.runwayprotectarealightsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.runwayprotectarealightsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.runwayprotectarealightsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.runwayprotectarealightsystem_ts.colour_nilreason,
       'position_value', airport_heliport.runwayprotectarealightsystem_ts.position_value,
       'position_nilreason', airport_heliport.runwayprotectarealightsystem_ts.position_nilreason,
       'id', airport_heliport.runwayprotectarealightsystem_ts.id,
       'xml_id', airport_heliport.runwayprotectarealightsystem_ts.xml_id,
       'interpretation', airport_heliport.runwayprotectarealightsystem_ts.interpretation,
       'sequence_number', airport_heliport.runwayprotectarealightsystem_ts.sequence_number,
       'correction_number', airport_heliport.runwayprotectarealightsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.runwayprotectarealightsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwayprotectarealightsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwayprotectarealightsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwayprotectarealightsystem_ts.feature_lifetime_end
    ) AS runwayprotectarealightsystemtimeslicetype
FROM

-- RunwayProtectAreaPropertyType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON airport_heliport.runwayprotectarealightsystem_ts.lightedarea_id = RunwayProtectAreaPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON airport_heliport.runwayprotectarealightsystem_ts.abstractrunwayprotectarealightsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON airport_heliport.runwayprotectarealightsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayprotectarealightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayprotectarealightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayprotectarealightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON master_join.target_id = NotePropertyType.id
;

RunwayProtectAreaLightSystemType
CREATE OR REPLACE VIEW runwayprotectarealightsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarealightsystem.id,
       'identifier', airport_heliport.runwayprotectarealightsystem.identifier,
       'identifier_code_space', airport_heliport.runwayprotectarealightsystem.identifier_code_space,
       'xml_id', airport_heliport.runwayprotectarealightsystem.xml_id
    ) AS runwayprotectarealightsystemtype
FROM


-- RunwayProtectAreaLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayprotectarealightsystem.id = master_join.source_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem
ON master_join.target_id = RunwayProtectAreaLightSystemTimeSlicePropertyType.id
;

RunwayProtectAreaPropertyType
CREATE OR REPLACE VIEW runwayprotectareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarea_pt.id,
       'nilReason', airport_heliport.runwayprotectarea_pt.nilReason
    ) AS runwayprotectareapropertytype
FROM


;

RunwayProtectAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW runwayprotectareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarea_tsp.id
    ) AS runwayprotectareatimeslicepropertytype
FROM

-- RunwayProtectAreaTimeSliceType
LEFT JOIN airport_heliport.runwayprotectarea_tsp
ON airport_heliport.runwayprotectarea_tsp.runwayprotectareatimeslice_id = RunwayProtectAreaTimeSliceType.id

;

RunwayProtectAreaTimeSliceType
CREATE OR REPLACE VIEW runwayprotectareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'lighting_value', airport_heliport.runwayprotectarea_ts.lighting_value,
       'lighting_nilreason', airport_heliport.runwayprotectarea_ts.lighting_nilreason,
       'obstaclefree_value', airport_heliport.runwayprotectarea_ts.obstaclefree_value,
       'obstaclefree_nilreason', airport_heliport.runwayprotectarea_ts.obstaclefree_nilreason,
       'type_value', airport_heliport.runwayprotectarea_ts.type_value,
       'type_nilreason', airport_heliport.runwayprotectarea_ts.type_nilreason,
       'status_value', airport_heliport.runwayprotectarea_ts.status_value,
       'status_nilreason', airport_heliport.runwayprotectarea_ts.status_nilreason,
       'width_value', airport_heliport.runwayprotectarea_ts.width_value,
       'width_uom', airport_heliport.runwayprotectarea_ts.width_uom,
       'width_nilreason', airport_heliport.runwayprotectarea_ts.width_nilreason,
       'length_value', airport_heliport.runwayprotectarea_ts.length_value,
       'length_uom', airport_heliport.runwayprotectarea_ts.length_uom,
       'length_nilreason', airport_heliport.runwayprotectarea_ts.length_nilreason,
       'id', airport_heliport.runwayprotectarea_ts.id,
       'xml_id', airport_heliport.runwayprotectarea_ts.xml_id,
       'interpretation', airport_heliport.runwayprotectarea_ts.interpretation,
       'sequence_number', airport_heliport.runwayprotectarea_ts.sequence_number,
       'correction_number', airport_heliport.runwayprotectarea_ts.correction_number,
       'valid_time_begin', airport_heliport.runwayprotectarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwayprotectarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwayprotectarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwayprotectarea_ts.feature_lifetime_end
    ) AS runwayprotectareatimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.runwayprotectarea_ts
ON airport_heliport.runwayprotectarea_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.runwayprotectarea_ts
ON airport_heliport.runwayprotectarea_ts.extent_id = ElevatedSurfacePropertyType.id
-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.runwayprotectarea_ts
ON airport_heliport.runwayprotectarea_ts.protectedrunwaydirection_id = RunwayDirectionPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayprotectarea_ts
ON airport_heliport.runwayprotectarea_ts.abstractrunwayprotectareaextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayprotectarea_ts
ON airport_heliport.runwayprotectarea_ts.abstractairportheliportprotectionareaextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayprotectarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayprotectarea_ts
ON master_join.target_id = NotePropertyType.id
;

RunwayProtectAreaType
CREATE OR REPLACE VIEW runwayprotectareatype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarea.id,
       'identifier', airport_heliport.runwayprotectarea.identifier,
       'identifier_code_space', airport_heliport.runwayprotectarea.identifier_code_space,
       'xml_id', airport_heliport.runwayprotectarea.xml_id
    ) AS runwayprotectareatype
FROM


-- RunwayProtectAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayprotectarea.id = master_join.source_id
LEFT JOIN airport_heliport.runwayprotectarea
ON master_join.target_id = RunwayProtectAreaTimeSlicePropertyType.id
;

RunwaySectionContaminationPropertyType
CREATE OR REPLACE VIEW runwaysectioncontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaysectioncontamination_pt.id
    ) AS runwaysectioncontaminationpropertytype
FROM

-- RunwaySectionContaminationType
LEFT JOIN airport_heliport.runwaysectioncontamination_pt
ON airport_heliport.runwaysectioncontamination_pt.runwaysectioncontamination_id = RunwaySectionContaminationType.id

;

RunwaySectionContaminationType
CREATE OR REPLACE VIEW runwaysectioncontaminationtype_view AS
SELECT
    jsonb_build_object(
       'observationTime_value', airport_heliport.runwaysectioncontamination.observationTime_value,
       'observationTime_nilreason', airport_heliport.runwaysectioncontamination.observationTime_nilreason,
       'nextObservationTime_value', airport_heliport.runwaysectioncontamination.nextObservationTime_value,
       'nextObservationTime_nilreason', airport_heliport.runwaysectioncontamination.nextObservationTime_nilreason,
       'frictioncoefficient_value', airport_heliport.runwaysectioncontamination.frictioncoefficient_value,
       'frictioncoefficient_nilreason', airport_heliport.runwaysectioncontamination.frictioncoefficient_nilreason,
       'frictionestimation_value', airport_heliport.runwaysectioncontamination.frictionestimation_value,
       'frictionestimation_nilreason', airport_heliport.runwaysectioncontamination.frictionestimation_nilreason,
       'frictiondevice_value', airport_heliport.runwaysectioncontamination.frictiondevice_value,
       'frictiondevice_nilreason', airport_heliport.runwaysectioncontamination.frictiondevice_nilreason,
       'obscuredlights_value', airport_heliport.runwaysectioncontamination.obscuredlights_value,
       'obscuredlights_nilreason', airport_heliport.runwaysectioncontamination.obscuredlights_nilreason,
       'furtherclearancetime_value', airport_heliport.runwaysectioncontamination.furtherclearancetime_value,
       'furtherclearancetime_nilreason', airport_heliport.runwaysectioncontamination.furtherclearancetime_nilreason,
       'furthertotalclearance_value', airport_heliport.runwaysectioncontamination.furthertotalclearance_value,
       'furthertotalclearance_nilreason', airport_heliport.runwaysectioncontamination.furthertotalclearance_nilreason,
       'proportion_value', airport_heliport.runwaysectioncontamination.proportion_value,
       'proportion_nilreason', airport_heliport.runwaysectioncontamination.proportion_nilreason,
       'section_value', airport_heliport.runwaysectioncontamination.section_value,
       'section_nilreason', airport_heliport.runwaysectioncontamination.section_nilreason,
       'depth_value', airport_heliport.runwaysectioncontamination.depth_value,
       'depth_uom', airport_heliport.runwaysectioncontamination.depth_uom,
       'depth_nilreason', airport_heliport.runwaysectioncontamination.depth_nilreason,
       'id', airport_heliport.runwaysectioncontamination.id,
       'identifier', airport_heliport.runwaysectioncontamination.identifier,
       'identifier_code_space', airport_heliport.runwaysectioncontamination.identifier_code_space,
       'xml_id', airport_heliport.runwaysectioncontamination.xml_id
    ) AS runwaysectioncontaminationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaysectioncontamination
ON airport_heliport.runwaysectioncontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaysectioncontamination
ON airport_heliport.runwaysectioncontamination.abstractrunwaysectioncontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaysectioncontamination.id = master_join.source_id
LEFT JOIN airport_heliport.runwaysectioncontamination
ON master_join.target_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaysectioncontamination.id = master_join.source_id
LEFT JOIN airport_heliport.runwaysectioncontamination
ON master_join.target_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwaysectioncontamination.id = master_join.source_id
LEFT JOIN airport_heliport.runwaysectioncontamination
ON master_join.target_id = NotePropertyType.id
;

RunwayTimeSlicePropertyType
CREATE OR REPLACE VIEW runwaytimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runway_tsp.id
    ) AS runwaytimeslicepropertytype
FROM

-- RunwayTimeSliceType
LEFT JOIN airport_heliport.runway_tsp
ON airport_heliport.runway_tsp.runwaytimeslice_id = RunwayTimeSliceType.id

;

RunwayTimeSliceType
CREATE OR REPLACE VIEW runwaytimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.runway_ts.designator_value,
       'designator_nilreason', airport_heliport.runway_ts.designator_nilreason,
       'type_value', airport_heliport.runway_ts.type_value,
       'type_nilreason', airport_heliport.runway_ts.type_nilreason,
       'abandoned_value', airport_heliport.runway_ts.abandoned_value,
       'abandoned_nilreason', airport_heliport.runway_ts.abandoned_nilreason,
       'nominallength_value', airport_heliport.runway_ts.nominallength_value,
       'nominallength_uom', airport_heliport.runway_ts.nominallength_uom,
       'nominallength_nilreason', airport_heliport.runway_ts.nominallength_nilreason,
       'lengthaccuracy_value', airport_heliport.runway_ts.lengthaccuracy_value,
       'lengthaccuracy_uom', airport_heliport.runway_ts.lengthaccuracy_uom,
       'lengthaccuracy_nilreason', airport_heliport.runway_ts.lengthaccuracy_nilreason,
       'nominalwidth_value', airport_heliport.runway_ts.nominalwidth_value,
       'nominalwidth_uom', airport_heliport.runway_ts.nominalwidth_uom,
       'nominalwidth_nilreason', airport_heliport.runway_ts.nominalwidth_nilreason,
       'widthaccuracy_value', airport_heliport.runway_ts.widthaccuracy_value,
       'widthaccuracy_uom', airport_heliport.runway_ts.widthaccuracy_uom,
       'widthaccuracy_nilreason', airport_heliport.runway_ts.widthaccuracy_nilreason,
       'widthshoulder_value', airport_heliport.runway_ts.widthshoulder_value,
       'widthshoulder_uom', airport_heliport.runway_ts.widthshoulder_uom,
       'widthshoulder_nilreason', airport_heliport.runway_ts.widthshoulder_nilreason,
       'lengthstrip_value', airport_heliport.runway_ts.lengthstrip_value,
       'lengthstrip_uom', airport_heliport.runway_ts.lengthstrip_uom,
       'lengthstrip_nilreason', airport_heliport.runway_ts.lengthstrip_nilreason,
       'widthstrip_value', airport_heliport.runway_ts.widthstrip_value,
       'widthstrip_uom', airport_heliport.runway_ts.widthstrip_uom,
       'widthstrip_nilreason', airport_heliport.runway_ts.widthstrip_nilreason,
       'lengthoffset_value', airport_heliport.runway_ts.lengthoffset_value,
       'lengthoffset_uom', airport_heliport.runway_ts.lengthoffset_uom,
       'lengthoffset_nilreason', airport_heliport.runway_ts.lengthoffset_nilreason,
       'widthoffset_value', airport_heliport.runway_ts.widthoffset_value,
       'widthoffset_uom', airport_heliport.runway_ts.widthoffset_uom,
       'widthoffset_nilreason', airport_heliport.runway_ts.widthoffset_nilreason,
       'id', airport_heliport.runway_ts.id,
       'xml_id', airport_heliport.runway_ts.xml_id,
       'interpretation', airport_heliport.runway_ts.interpretation,
       'sequence_number', airport_heliport.runway_ts.sequence_number,
       'correction_number', airport_heliport.runway_ts.correction_number,
       'valid_time_begin', airport_heliport.runway_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runway_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runway_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runway_ts.feature_lifetime_end
    ) AS runwaytimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.runway_ts
ON airport_heliport.runway_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.runway_ts
ON airport_heliport.runway_ts.associatedairportheliport_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runway_ts
ON airport_heliport.runway_ts.abstractrunwayextension_id = AbstractExtensionType.id

-- RunwayContaminationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runway_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runway_ts
ON master_join.target_id = RunwayContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runway_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runway_ts
ON master_join.target_id = NotePropertyType.id
-- RunwaySectionContaminationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runway_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runway_ts
ON master_join.target_id = RunwaySectionContaminationPropertyType.id
;

RunwayType
CREATE OR REPLACE VIEW runwaytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runway.id,
       'identifier', airport_heliport.runway.identifier,
       'identifier_code_space', airport_heliport.runway.identifier_code_space,
       'xml_id', airport_heliport.runway.xml_id
    ) AS runwaytype
FROM


-- RunwayTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runway.id = master_join.source_id
LEFT JOIN airport_heliport.runway
ON master_join.target_id = RunwayTimeSlicePropertyType.id
;

RunwayVisualRangePropertyType
CREATE OR REPLACE VIEW runwayvisualrangepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayvisualrange_pt.id,
       'nilReason', airport_heliport.runwayvisualrange_pt.nilReason
    ) AS runwayvisualrangepropertytype
FROM


;

RunwayVisualRangeTimeSlicePropertyType
CREATE OR REPLACE VIEW runwayvisualrangetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayvisualrange_tsp.id
    ) AS runwayvisualrangetimeslicepropertytype
FROM

-- RunwayVisualRangeTimeSliceType
LEFT JOIN airport_heliport.runwayvisualrange_tsp
ON airport_heliport.runwayvisualrange_tsp.runwayvisualrangetimeslice_id = RunwayVisualRangeTimeSliceType.id

;

RunwayVisualRangeTimeSliceType
CREATE OR REPLACE VIEW runwayvisualrangetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'readingposition_value', airport_heliport.runwayvisualrange_ts.readingposition_value,
       'readingposition_nilreason', airport_heliport.runwayvisualrange_ts.readingposition_nilreason,
       'id', airport_heliport.runwayvisualrange_ts.id,
       'xml_id', airport_heliport.runwayvisualrange_ts.xml_id,
       'interpretation', airport_heliport.runwayvisualrange_ts.interpretation,
       'sequence_number', airport_heliport.runwayvisualrange_ts.sequence_number,
       'correction_number', airport_heliport.runwayvisualrange_ts.correction_number,
       'valid_time_begin', airport_heliport.runwayvisualrange_ts.valid_time_begin,
       'valid_time_end', airport_heliport.runwayvisualrange_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.runwayvisualrange_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.runwayvisualrange_ts.feature_lifetime_end
    ) AS runwayvisualrangetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON airport_heliport.runwayvisualrange_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON airport_heliport.runwayvisualrange_ts.abstractrunwayvisualrangeextension_id = AbstractExtensionType.id

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayvisualrange_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON master_join.target_id = RunwayDirectionPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayvisualrange_ts.id = master_join.source_id
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON master_join.target_id = NotePropertyType.id
;

RunwayVisualRangeType
CREATE OR REPLACE VIEW runwayvisualrangetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayvisualrange.id,
       'identifier', airport_heliport.runwayvisualrange.identifier,
       'identifier_code_space', airport_heliport.runwayvisualrange.identifier_code_space,
       'xml_id', airport_heliport.runwayvisualrange.xml_id
    ) AS runwayvisualrangetype
FROM


-- RunwayVisualRangeTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.runwayvisualrange.id = master_join.source_id
LEFT JOIN airport_heliport.runwayvisualrange
ON master_join.target_id = RunwayVisualRangeTimeSlicePropertyType.id
;

SafeAltitudeAreaPropertyType
CREATE OR REPLACE VIEW safealtitudeareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.safealtitudearea_pt.id,
       'nilReason', procedure.safealtitudearea_pt.nilReason
    ) AS safealtitudeareapropertytype
FROM


;

SafeAltitudeAreaSectorPropertyType
CREATE OR REPLACE VIEW safealtitudeareasectorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.safealtitudeareasector_pt.id
    ) AS safealtitudeareasectorpropertytype
FROM

-- SafeAltitudeAreaSectorType
LEFT JOIN procedure.safealtitudeareasector_pt
ON procedure.safealtitudeareasector_pt.safealtitudeareasector_id = SafeAltitudeAreaSectorType.id

;

SafeAltitudeAreaSectorType
CREATE OR REPLACE VIEW safealtitudeareasectortype_view AS
SELECT
    jsonb_build_object(
       'bufferwidth_value', procedure.safealtitudeareasector.bufferwidth_value,
       'bufferwidth_uom', procedure.safealtitudeareasector.bufferwidth_uom,
       'bufferwidth_nilreason', procedure.safealtitudeareasector.bufferwidth_nilreason,
       'id', procedure.safealtitudeareasector.id,
       'identifier', procedure.safealtitudeareasector.identifier,
       'identifier_code_space', procedure.safealtitudeareasector.identifier_code_space,
       'xml_id', procedure.safealtitudeareasector.xml_id
    ) AS safealtitudeareasectortype
FROM

-- SurfacePropertyType
LEFT JOIN procedure.safealtitudeareasector
ON procedure.safealtitudeareasector.extent_id = SurfacePropertyType.id
-- CircleSectorPropertyType
LEFT JOIN procedure.safealtitudeareasector
ON procedure.safealtitudeareasector.sectordefinition_id = CircleSectorPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.safealtitudeareasector
ON procedure.safealtitudeareasector.abstractsafealtitudeareasectorextension_id = AbstractExtensionType.id

-- ObstructionPropertyType
LEFT JOIN procedure.master_join
ON procedure.safealtitudeareasector.id = master_join.source_id
LEFT JOIN procedure.safealtitudeareasector
ON master_join.target_id = ObstructionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.safealtitudeareasector.id = master_join.source_id
LEFT JOIN procedure.safealtitudeareasector
ON master_join.target_id = NotePropertyType.id
;

SafeAltitudeAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW safealtitudeareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.safealtitudearea_tsp.id
    ) AS safealtitudeareatimeslicepropertytype
FROM

-- SafeAltitudeAreaTimeSliceType
LEFT JOIN procedure.safealtitudearea_tsp
ON procedure.safealtitudearea_tsp.safealtitudeareatimeslice_id = SafeAltitudeAreaTimeSliceType.id

;

SafeAltitudeAreaTimeSliceType
CREATE OR REPLACE VIEW safealtitudeareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'safeareatype_value', procedure.safealtitudearea_ts.safeareatype_value,
       'safeareatype_nilreason', procedure.safealtitudearea_ts.safeareatype_nilreason,
       'id', procedure.safealtitudearea_ts.id,
       'xml_id', procedure.safealtitudearea_ts.xml_id,
       'interpretation', procedure.safealtitudearea_ts.interpretation,
       'sequence_number', procedure.safealtitudearea_ts.sequence_number,
       'correction_number', procedure.safealtitudearea_ts.correction_number,
       'valid_time_begin', procedure.safealtitudearea_ts.valid_time_begin,
       'valid_time_end', procedure.safealtitudearea_ts.valid_time_end,
       'feature_lifetime_begin', procedure.safealtitudearea_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.safealtitudearea_ts.feature_lifetime_end
    ) AS safealtitudeareatimeslicetype
FROM

-- DesignatedPointPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_position_id = PointPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.abstractsafealtitudeareaextension_id = AbstractExtensionType.id

-- SafeAltitudeAreaSectorPropertyType
LEFT JOIN procedure.master_join
ON procedure.safealtitudearea_ts.id = master_join.source_id
LEFT JOIN procedure.safealtitudearea_ts
ON master_join.target_id = SafeAltitudeAreaSectorPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.master_join
ON procedure.safealtitudearea_ts.id = master_join.source_id
LEFT JOIN procedure.safealtitudearea_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.safealtitudearea_ts.id = master_join.source_id
LEFT JOIN procedure.safealtitudearea_ts
ON master_join.target_id = NotePropertyType.id
;

SafeAltitudeAreaType
CREATE OR REPLACE VIEW safealtitudeareatype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.safealtitudearea.id,
       'identifier', procedure.safealtitudearea.identifier,
       'identifier_code_space', procedure.safealtitudearea.identifier_code_space,
       'xml_id', procedure.safealtitudearea.xml_id
    ) AS safealtitudeareatype
FROM


-- SafeAltitudeAreaTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.safealtitudearea.id = master_join.source_id
LEFT JOIN procedure.safealtitudearea
ON master_join.target_id = SafeAltitudeAreaTimeSlicePropertyType.id
;

SDFPropertyType
CREATE OR REPLACE VIEW sdfpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.sdf_pt.id,
       'nilReason', navaids_points.sdf_pt.nilReason
    ) AS sdfpropertytype
FROM


;

SDFTimeSlicePropertyType
CREATE OR REPLACE VIEW sdftimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.sdf_tsp.id
    ) AS sdftimeslicepropertytype
FROM

-- SDFTimeSliceType
LEFT JOIN navaids_points.sdf_tsp
ON navaids_points.sdf_tsp.sdftimeslice_id = SDFTimeSliceType.id

;

SDFTimeSliceType
CREATE OR REPLACE VIEW sdftimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.sdf_ts.designator_value,
       'designator_nilreason', navaids_points.sdf_ts.designator_nilreason,
       'name_value', navaids_points.sdf_ts.name_value,
       'name_nilreason', navaids_points.sdf_ts.name_nilreason,
       'emissionclass_value', navaids_points.sdf_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.sdf_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.sdf_ts.mobile_value,
       'mobile_nilreason', navaids_points.sdf_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.sdf_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.sdf_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.sdf_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.sdf_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.sdf_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.sdf_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.sdf_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.sdf_ts.flightchecked_nilreason,
       'magneticbearing_value', navaids_points.sdf_ts.magneticbearing_value,
       'magneticbearing_nilreason', navaids_points.sdf_ts.magneticbearing_nilreason,
       'truebearing_value', navaids_points.sdf_ts.truebearing_value,
       'truebearing_nilreason', navaids_points.sdf_ts.truebearing_nilreason,
       'frequency_value', navaids_points.sdf_ts.frequency_value,
       'frequency_uom', navaids_points.sdf_ts.frequency_uom,
       'frequency_nilreason', navaids_points.sdf_ts.frequency_nilreason,
       'id', navaids_points.sdf_ts.id,
       'xml_id', navaids_points.sdf_ts.xml_id,
       'interpretation', navaids_points.sdf_ts.interpretation,
       'sequence_number', navaids_points.sdf_ts.sequence_number,
       'correction_number', navaids_points.sdf_ts.correction_number,
       'valid_time_begin', navaids_points.sdf_ts.valid_time_begin,
       'valid_time_end', navaids_points.sdf_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.sdf_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.sdf_ts.feature_lifetime_end
    ) AS sdftimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.sdf_ts
ON navaids_points.sdf_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.sdf_ts
ON navaids_points.sdf_ts.abstractsdfextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.sdf_ts
ON navaids_points.sdf_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.sdf_ts.id = master_join.source_id
LEFT JOIN navaids_points.sdf_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.sdf_ts.id = master_join.source_id
LEFT JOIN navaids_points.sdf_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.sdf_ts.id = master_join.source_id
LEFT JOIN navaids_points.sdf_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.sdf_ts.id = master_join.source_id
LEFT JOIN navaids_points.sdf_ts
ON master_join.target_id = NotePropertyType.id
;

SDFType
CREATE OR REPLACE VIEW sdftype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.sdf.id,
       'identifier', navaids_points.sdf.identifier,
       'identifier_code_space', navaids_points.sdf.identifier_code_space,
       'xml_id', navaids_points.sdf.xml_id
    ) AS sdftype
FROM


-- SDFTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.sdf.id = master_join.source_id
LEFT JOIN navaids_points.sdf
ON master_join.target_id = SDFTimeSlicePropertyType.id
;

SeaplaneLandingAreaPropertyType
CREATE OR REPLACE VIEW seaplanelandingareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanelandingarea_pt.id,
       'nilReason', airport_heliport.seaplanelandingarea_pt.nilReason
    ) AS seaplanelandingareapropertytype
FROM


;

SeaplaneLandingAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW seaplanelandingareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanelandingarea_tsp.id
    ) AS seaplanelandingareatimeslicepropertytype
FROM

-- SeaplaneLandingAreaTimeSliceType
LEFT JOIN airport_heliport.seaplanelandingarea_tsp
ON airport_heliport.seaplanelandingarea_tsp.seaplanelandingareatimeslice_id = SeaplaneLandingAreaTimeSliceType.id

;

SeaplaneLandingAreaTimeSliceType
CREATE OR REPLACE VIEW seaplanelandingareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanelandingarea_ts.id,
       'xml_id', airport_heliport.seaplanelandingarea_ts.xml_id,
       'interpretation', airport_heliport.seaplanelandingarea_ts.interpretation,
       'sequence_number', airport_heliport.seaplanelandingarea_ts.sequence_number,
       'correction_number', airport_heliport.seaplanelandingarea_ts.correction_number,
       'valid_time_begin', airport_heliport.seaplanelandingarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.seaplanelandingarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.seaplanelandingarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.seaplanelandingarea_ts.feature_lifetime_end
    ) AS seaplanelandingareatimeslicetype
FROM

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON airport_heliport.seaplanelandingarea_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON airport_heliport.seaplanelandingarea_ts.abstractseaplanelandingareaextension_id = AbstractExtensionType.id

-- SeaplaneRampSitePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.seaplanelandingarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON master_join.target_id = SeaplaneRampSitePropertyType.id
-- FloatingDockSitePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.seaplanelandingarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON master_join.target_id = FloatingDockSitePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.seaplanelandingarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON master_join.target_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.seaplanelandingarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON master_join.target_id = ManoeuvringAreaAvailabilityPropertyType.id
;

SeaplaneLandingAreaType
CREATE OR REPLACE VIEW seaplanelandingareatype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanelandingarea.id,
       'identifier', airport_heliport.seaplanelandingarea.identifier,
       'identifier_code_space', airport_heliport.seaplanelandingarea.identifier_code_space,
       'xml_id', airport_heliport.seaplanelandingarea.xml_id
    ) AS seaplanelandingareatype
FROM


-- SeaplaneLandingAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.seaplanelandingarea.id = master_join.source_id
LEFT JOIN airport_heliport.seaplanelandingarea
ON master_join.target_id = SeaplaneLandingAreaTimeSlicePropertyType.id
;

SeaplaneRampSitePropertyType
CREATE OR REPLACE VIEW seaplanerampsitepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanerampsite_pt.id,
       'nilReason', airport_heliport.seaplanerampsite_pt.nilReason
    ) AS seaplanerampsitepropertytype
FROM


;

SeaplaneRampSiteTimeSlicePropertyType
CREATE OR REPLACE VIEW seaplanerampsitetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanerampsite_tsp.id
    ) AS seaplanerampsitetimeslicepropertytype
FROM

-- SeaplaneRampSiteTimeSliceType
LEFT JOIN airport_heliport.seaplanerampsite_tsp
ON airport_heliport.seaplanerampsite_tsp.seaplanerampsitetimeslice_id = SeaplaneRampSiteTimeSliceType.id

;

SeaplaneRampSiteTimeSliceType
CREATE OR REPLACE VIEW seaplanerampsitetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanerampsite_ts.id,
       'xml_id', airport_heliport.seaplanerampsite_ts.xml_id,
       'interpretation', airport_heliport.seaplanerampsite_ts.interpretation,
       'sequence_number', airport_heliport.seaplanerampsite_ts.sequence_number,
       'correction_number', airport_heliport.seaplanerampsite_ts.correction_number,
       'valid_time_begin', airport_heliport.seaplanerampsite_ts.valid_time_begin,
       'valid_time_end', airport_heliport.seaplanerampsite_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.seaplanerampsite_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.seaplanerampsite_ts.feature_lifetime_end
    ) AS seaplanerampsitetimeslicetype
FROM

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.seaplanerampsite_ts
ON airport_heliport.seaplanerampsite_ts.extent_id = ElevatedSurfacePropertyType.id
-- ElevatedCurvePropertyType
LEFT JOIN airport_heliport.seaplanerampsite_ts
ON airport_heliport.seaplanerampsite_ts.centreline_id = ElevatedCurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.seaplanerampsite_ts
ON airport_heliport.seaplanerampsite_ts.abstractseaplanerampsiteextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.seaplanerampsite_ts.id = master_join.source_id
LEFT JOIN airport_heliport.seaplanerampsite_ts
ON master_join.target_id = NotePropertyType.id
;

SeaplaneRampSiteType
CREATE OR REPLACE VIEW seaplanerampsitetype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanerampsite.id,
       'identifier', airport_heliport.seaplanerampsite.identifier,
       'identifier_code_space', airport_heliport.seaplanerampsite.identifier_code_space,
       'xml_id', airport_heliport.seaplanerampsite.xml_id
    ) AS seaplanerampsitetype
FROM


-- SeaplaneRampSiteTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.seaplanerampsite.id = master_join.source_id
LEFT JOIN airport_heliport.seaplanerampsite
ON master_join.target_id = SeaplaneRampSiteTimeSlicePropertyType.id
;

SearchRescueServicePropertyType
CREATE OR REPLACE VIEW searchrescueservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.searchrescueservice_pt.id,
       'nilReason', service.searchrescueservice_pt.nilReason
    ) AS searchrescueservicepropertytype
FROM


;

SearchRescueServiceTimeSlicePropertyType
CREATE OR REPLACE VIEW searchrescueservicetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.searchrescueservice_tsp.id
    ) AS searchrescueservicetimeslicepropertytype
FROM

-- SearchRescueServiceTimeSliceType
LEFT JOIN service.searchrescueservice_tsp
ON service.searchrescueservice_tsp.searchrescueservicetimeslice_id = SearchRescueServiceTimeSliceType.id

;

SearchRescueServiceTimeSliceType
CREATE OR REPLACE VIEW searchrescueservicetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightoperations_value', service.searchrescueservice_ts.flightoperations_value,
       'flightoperations_nilreason', service.searchrescueservice_ts.flightoperations_nilreason,
       'rank_value', service.searchrescueservice_ts.rank_value,
       'rank_nilreason', service.searchrescueservice_ts.rank_nilreason,
       'complianticao_value', service.searchrescueservice_ts.complianticao_value,
       'complianticao_nilreason', service.searchrescueservice_ts.complianticao_nilreason,
       'name_value', service.searchrescueservice_ts.name_value,
       'name_nilreason', service.searchrescueservice_ts.name_nilreason,
       'type_value', service.searchrescueservice_ts.type_value,
       'type_nilreason', service.searchrescueservice_ts.type_nilreason,
       'id', service.searchrescueservice_ts.id,
       'xml_id', service.searchrescueservice_ts.xml_id,
       'interpretation', service.searchrescueservice_ts.interpretation,
       'sequence_number', service.searchrescueservice_ts.sequence_number,
       'correction_number', service.searchrescueservice_ts.correction_number,
       'valid_time_begin', service.searchrescueservice_ts.valid_time_begin,
       'valid_time_end', service.searchrescueservice_ts.valid_time_end,
       'feature_lifetime_begin', service.searchrescueservice_ts.feature_lifetime_begin,
       'feature_lifetime_end', service.searchrescueservice_ts.feature_lifetime_end
    ) AS searchrescueservicetimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN service.searchrescueservice_ts
ON service.searchrescueservice_ts.location_id = ElevatedPointPropertyType.id
-- UnitPropertyType
LEFT JOIN service.searchrescueservice_ts
ON service.searchrescueservice_ts.serviceprovider_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN service.searchrescueservice_ts
ON service.searchrescueservice_ts.abstractsearchrescueserviceextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.searchrescueservice_ts
ON service.searchrescueservice_ts.abstractserviceextension_id = AbstractExtensionType.id

-- CallsignDetailPropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice_ts.id = master_join.source_id
LEFT JOIN service.searchrescueservice_ts
ON master_join.target_id = CallsignDetailPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice_ts.id = master_join.source_id
LEFT JOIN service.searchrescueservice_ts
ON master_join.target_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice_ts.id = master_join.source_id
LEFT JOIN service.searchrescueservice_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice_ts.id = master_join.source_id
LEFT JOIN service.searchrescueservice_ts
ON master_join.target_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice_ts.id = master_join.source_id
LEFT JOIN service.searchrescueservice_ts
ON master_join.target_id = NotePropertyType.id
-- AirspacePropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice_ts.id = master_join.source_id
LEFT JOIN service.searchrescueservice_ts
ON master_join.target_id = AirspacePropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice_ts.id = master_join.source_id
LEFT JOIN service.searchrescueservice_ts
ON master_join.target_id = RoutePortionPropertyType.id
;

SearchRescueServiceType
CREATE OR REPLACE VIEW searchrescueservicetype_view AS
SELECT
    jsonb_build_object(
       'id', service.searchrescueservice.id,
       'identifier', service.searchrescueservice.identifier,
       'identifier_code_space', service.searchrescueservice.identifier_code_space,
       'xml_id', service.searchrescueservice.xml_id
    ) AS searchrescueservicetype
FROM


-- SearchRescueServiceTimeSlicePropertyType
LEFT JOIN service.master_join
ON service.searchrescueservice.id = master_join.source_id
LEFT JOIN service.searchrescueservice
ON master_join.target_id = SearchRescueServiceTimeSlicePropertyType.id
;

SecondarySurveillanceRadarPropertyType
CREATE OR REPLACE VIEW secondarysurveillanceradarpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.secondarysurveillanceradar_pt.id,
       'nilReason', surveillance.secondarysurveillanceradar_pt.nilReason
    ) AS secondarysurveillanceradarpropertytype
FROM


;

SecondarySurveillanceRadarTimeSlicePropertyType
CREATE OR REPLACE VIEW secondarysurveillanceradartimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.secondarysurveillanceradar_tsp.id
    ) AS secondarysurveillanceradartimeslicepropertytype
FROM

-- SecondarySurveillanceRadarTimeSliceType
LEFT JOIN surveillance.secondarysurveillanceradar_tsp
ON surveillance.secondarysurveillanceradar_tsp.secondarysurveillanceradartimeslice_id = SecondarySurveillanceRadarTimeSliceType.id

;

SecondarySurveillanceRadarTimeSliceType
CREATE OR REPLACE VIEW secondarysurveillanceradartimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', surveillance.secondarysurveillanceradar_ts.name_value,
       'name_nilreason', surveillance.secondarysurveillanceradar_ts.name_nilreason,
       'serialnumber_value', surveillance.secondarysurveillanceradar_ts.serialnumber_value,
       'serialnumber_nilreason', surveillance.secondarysurveillanceradar_ts.serialnumber_nilreason,
       'dualchannel_value', surveillance.secondarysurveillanceradar_ts.dualchannel_value,
       'dualchannel_nilreason', surveillance.secondarysurveillanceradar_ts.dualchannel_nilreason,
       'movingtargetindicator_value', surveillance.secondarysurveillanceradar_ts.movingtargetindicator_value,
       'movingtargetindicator_nilreason', surveillance.secondarysurveillanceradar_ts.movingtargetindicator_nilreason,
       'standbypower_value', surveillance.secondarysurveillanceradar_ts.standbypower_value,
       'standbypower_nilreason', surveillance.secondarysurveillanceradar_ts.standbypower_nilreason,
       'digital_value', surveillance.secondarysurveillanceradar_ts.digital_value,
       'digital_nilreason', surveillance.secondarysurveillanceradar_ts.digital_nilreason,
       'militaryuseonly_value', surveillance.secondarysurveillanceradar_ts.militaryuseonly_value,
       'militaryuseonly_nilreason', surveillance.secondarysurveillanceradar_ts.militaryuseonly_nilreason,
       'specialuseonly_value', surveillance.secondarysurveillanceradar_ts.specialuseonly_value,
       'specialuseonly_nilreason', surveillance.secondarysurveillanceradar_ts.specialuseonly_nilreason,
       'specialaircraftonly_value', surveillance.secondarysurveillanceradar_ts.specialaircraftonly_value,
       'specialaircraftonly_nilreason', surveillance.secondarysurveillanceradar_ts.specialaircraftonly_nilreason,
       'magneticvariation_value', surveillance.secondarysurveillanceradar_ts.magneticvariation_value,
       'magneticvariation_nilreason', surveillance.secondarysurveillanceradar_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', surveillance.secondarysurveillanceradar_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', surveillance.secondarysurveillanceradar_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', surveillance.secondarysurveillanceradar_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', surveillance.secondarysurveillanceradar_ts.datemagneticvariation_nilreason,
       'verticalcoverageazimuth_value', surveillance.secondarysurveillanceradar_ts.verticalcoverageazimuth_value,
       'verticalcoverageazimuth_nilreason', surveillance.secondarysurveillanceradar_ts.verticalcoverageazimuth_nilreason,
       'antennatiltfixed_value', surveillance.secondarysurveillanceradar_ts.antennatiltfixed_value,
       'antennatiltfixed_nilreason', surveillance.secondarysurveillanceradar_ts.antennatiltfixed_nilreason,
       'tiltangle_value', surveillance.secondarysurveillanceradar_ts.tiltangle_value,
       'tiltangle_nilreason', surveillance.secondarysurveillanceradar_ts.tiltangle_nilreason,
       'automatedradarterminalsystem_value', surveillance.secondarysurveillanceradar_ts.automatedradarterminalsystem_value,
       'automatedradarterminalsystem_nilreason', surveillance.secondarysurveillanceradar_ts.automatedradarterminalsystem_nilreason,
       'transponder_value', surveillance.secondarysurveillanceradar_ts.transponder_value,
       'transponder_nilreason', surveillance.secondarysurveillanceradar_ts.transponder_nilreason,
       'autonomous_value', surveillance.secondarysurveillanceradar_ts.autonomous_value,
       'autonomous_nilreason', surveillance.secondarysurveillanceradar_ts.autonomous_nilreason,
       'monopulse_value', surveillance.secondarysurveillanceradar_ts.monopulse_value,
       'monopulse_nilreason', surveillance.secondarysurveillanceradar_ts.monopulse_nilreason,
       'range_value', surveillance.secondarysurveillanceradar_ts.range_value,
       'range_uom', surveillance.secondarysurveillanceradar_ts.range_uom,
       'range_nilreason', surveillance.secondarysurveillanceradar_ts.range_nilreason,
       'rangeaccuracy_value', surveillance.secondarysurveillanceradar_ts.rangeaccuracy_value,
       'rangeaccuracy_uom', surveillance.secondarysurveillanceradar_ts.rangeaccuracy_uom,
       'rangeaccuracy_nilreason', surveillance.secondarysurveillanceradar_ts.rangeaccuracy_nilreason,
       'verticalcoveragealtitude_value', surveillance.secondarysurveillanceradar_ts.verticalcoveragealtitude_value,
       'verticalcoveragealtitude_uom', surveillance.secondarysurveillanceradar_ts.verticalcoveragealtitude_uom,
       'verticalcoveragealtitude_nilreason', surveillance.secondarysurveillanceradar_ts.verticalcoveragealtitude_nilreason,
       'verticalcoveragedistance_value', surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_value,
       'verticalcoveragedistance_uom', surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_uom,
       'verticalcoveragedistance_nilreason', surveillance.secondarysurveillanceradar_ts.verticalcoveragedistance_nilreason,
       'id', surveillance.secondarysurveillanceradar_ts.id,
       'xml_id', surveillance.secondarysurveillanceradar_ts.xml_id,
       'interpretation', surveillance.secondarysurveillanceradar_ts.interpretation,
       'sequence_number', surveillance.secondarysurveillanceradar_ts.sequence_number,
       'correction_number', surveillance.secondarysurveillanceradar_ts.correction_number,
       'valid_time_begin', surveillance.secondarysurveillanceradar_ts.valid_time_begin,
       'valid_time_end', surveillance.secondarysurveillanceradar_ts.valid_time_end,
       'feature_lifetime_begin', surveillance.secondarysurveillanceradar_ts.feature_lifetime_begin,
       'feature_lifetime_end', surveillance.secondarysurveillanceradar_ts.feature_lifetime_end
    ) AS secondarysurveillanceradartimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON surveillance.secondarysurveillanceradar_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON surveillance.secondarysurveillanceradar_ts.abstractsecondarysurveillanceradarextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON surveillance.secondarysurveillanceradar_ts.abstractsurveillanceradarextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON surveillance.secondarysurveillanceradar_ts.abstractradarequipmentextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.secondarysurveillanceradar_ts.id = master_join.source_id
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.secondarysurveillanceradar_ts.id = master_join.source_id
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON master_join.target_id = NotePropertyType.id
-- SurveillanceGroundStationPropertyType
LEFT JOIN surveillance.master_join
ON surveillance.secondarysurveillanceradar_ts.id = master_join.source_id
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON master_join.target_id = SurveillanceGroundStationPropertyType.id
;

SecondarySurveillanceRadarType
CREATE OR REPLACE VIEW secondarysurveillanceradartype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.secondarysurveillanceradar.id,
       'identifier', surveillance.secondarysurveillanceradar.identifier,
       'identifier_code_space', surveillance.secondarysurveillanceradar.identifier_code_space,
       'xml_id', surveillance.secondarysurveillanceradar.xml_id
    ) AS secondarysurveillanceradartype
FROM


-- SecondarySurveillanceRadarTimeSlicePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.secondarysurveillanceradar.id = master_join.source_id
LEFT JOIN surveillance.secondarysurveillanceradar
ON master_join.target_id = SecondarySurveillanceRadarTimeSlicePropertyType.id
;

SectorDesignPropertyType
CREATE OR REPLACE VIEW sectordesignpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.sectordesign_pt.id
    ) AS sectordesignpropertytype
FROM

-- SectorDesignType
LEFT JOIN procedure.sectordesign_pt
ON procedure.sectordesign_pt.sectordesign_id = SectorDesignType.id

;

SectorDesignType
CREATE OR REPLACE VIEW sectordesigntype_view AS
SELECT
    jsonb_build_object(
       'turndirection_value', procedure.sectordesign.turndirection_value,
       'turndirection_nilreason', procedure.sectordesign.turndirection_nilreason,
       'designgradient_value', procedure.sectordesign.designgradient_value,
       'designgradient_nilreason', procedure.sectordesign.designgradient_nilreason,
       'turnpermitted_value', procedure.sectordesign.turnpermitted_value,
       'turnpermitted_nilreason', procedure.sectordesign.turnpermitted_nilreason,
       'terminationaltitude_value', procedure.sectordesign.terminationaltitude_value,
       'terminationaltitude_uom', procedure.sectordesign.terminationaltitude_uom,
       'terminationaltitude_nilreason', procedure.sectordesign.terminationaltitude_nilreason,
       'id', procedure.sectordesign.id,
       'identifier', procedure.sectordesign.identifier,
       'identifier_code_space', procedure.sectordesign.identifier_code_space,
       'xml_id', procedure.sectordesign.xml_id
    ) AS sectordesigntype
FROM

-- AbstractExtensionType
LEFT JOIN procedure.sectordesign
ON procedure.sectordesign.abstractsectordesignextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.sectordesign.id = master_join.source_id
LEFT JOIN procedure.sectordesign
ON master_join.target_id = NotePropertyType.id
;

SegmentLegPropertyType
CREATE OR REPLACE VIEW segmentlegpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.segmentleg_pt.id,
       'nilReason', procedure.segmentleg_pt.nilReason
    ) AS segmentlegpropertytype
FROM


;

SegmentPointPropertyType
CREATE OR REPLACE VIEW segmentpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.segmentpoint_pt.id
    ) AS segmentpointpropertytype
FROM


;

ServiceOperationalStatusPropertyType
CREATE OR REPLACE VIEW serviceoperationalstatuspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.serviceoperationalstatus_pt.id
    ) AS serviceoperationalstatuspropertytype
FROM

-- ServiceOperationalStatusType
LEFT JOIN service.serviceoperationalstatus_pt
ON service.serviceoperationalstatus_pt.serviceoperationalstatus_id = ServiceOperationalStatusType.id

;

ServiceOperationalStatusType
CREATE OR REPLACE VIEW serviceoperationalstatustype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', service.serviceoperationalstatus.operationalstatus_value,
       'operationalstatus_nilreason', service.serviceoperationalstatus.operationalstatus_nilreason,
       'id', service.serviceoperationalstatus.id,
       'identifier', service.serviceoperationalstatus.identifier,
       'identifier_code_space', service.serviceoperationalstatus.identifier_code_space,
       'xml_id', service.serviceoperationalstatus.xml_id
    ) AS serviceoperationalstatustype
FROM

-- AbstractExtensionType
LEFT JOIN service.serviceoperationalstatus
ON service.serviceoperationalstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.serviceoperationalstatus
ON service.serviceoperationalstatus.abstractserviceoperationalstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN service.master_join
ON service.serviceoperationalstatus.id = master_join.source_id
LEFT JOIN service.serviceoperationalstatus
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN service.master_join
ON service.serviceoperationalstatus.id = master_join.source_id
LEFT JOIN service.serviceoperationalstatus
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN service.master_join
ON service.serviceoperationalstatus.id = master_join.source_id
LEFT JOIN service.serviceoperationalstatus
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

ServicePropertyType
CREATE OR REPLACE VIEW servicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.service_pt.id,
       'nilReason', service.service_pt.nilReason
    ) AS servicepropertytype
FROM


;

SignificantPointInAirspacePropertyType
CREATE OR REPLACE VIEW significantpointinairspacepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.significantpointinairspace_pt.id,
       'nilReason', navaids_points.significantpointinairspace_pt.nilReason
    ) AS significantpointinairspacepropertytype
FROM


;

SignificantPointInAirspaceTimeSlicePropertyType
CREATE OR REPLACE VIEW significantpointinairspacetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.significantpointinairspace_tsp.id
    ) AS significantpointinairspacetimeslicepropertytype
FROM

-- SignificantPointInAirspaceTimeSliceType
LEFT JOIN navaids_points.significantpointinairspace_tsp
ON navaids_points.significantpointinairspace_tsp.significantpointinairspacetimeslice_id = SignificantPointInAirspaceTimeSliceType.id

;

SignificantPointInAirspaceTimeSliceType
CREATE OR REPLACE VIEW significantpointinairspacetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', navaids_points.significantpointinairspace_ts.type_value,
       'type_nilreason', navaids_points.significantpointinairspace_ts.type_nilreason,
       'relativelocation_value', navaids_points.significantpointinairspace_ts.relativelocation_value,
       'relativelocation_nilreason', navaids_points.significantpointinairspace_ts.relativelocation_nilreason,
       'id', navaids_points.significantpointinairspace_ts.id,
       'xml_id', navaids_points.significantpointinairspace_ts.xml_id,
       'interpretation', navaids_points.significantpointinairspace_ts.interpretation,
       'sequence_number', navaids_points.significantpointinairspace_ts.sequence_number,
       'correction_number', navaids_points.significantpointinairspace_ts.correction_number,
       'valid_time_begin', navaids_points.significantpointinairspace_ts.valid_time_begin,
       'valid_time_end', navaids_points.significantpointinairspace_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.significantpointinairspace_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.significantpointinairspace_ts.feature_lifetime_end
    ) AS significantpointinairspacetimeslicetype
FROM

-- AirspacePropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.containingairspace_id = AirspacePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_position_id = PointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.abstractsignificantpointinairspaceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.significantpointinairspace_ts.id = master_join.source_id
LEFT JOIN navaids_points.significantpointinairspace_ts
ON master_join.target_id = NotePropertyType.id
;

SignificantPointInAirspaceType
CREATE OR REPLACE VIEW significantpointinairspacetype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.significantpointinairspace.id,
       'identifier', navaids_points.significantpointinairspace.identifier,
       'identifier_code_space', navaids_points.significantpointinairspace.identifier_code_space,
       'xml_id', navaids_points.significantpointinairspace.xml_id
    ) AS significantpointinairspacetype
FROM


-- SignificantPointInAirspaceTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.significantpointinairspace.id = master_join.source_id
LEFT JOIN navaids_points.significantpointinairspace
ON master_join.target_id = SignificantPointInAirspaceTimeSlicePropertyType.id
;

SpecialDatePropertyType
CREATE OR REPLACE VIEW specialdatepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.specialdate_pt.id,
       'nilReason', shared.specialdate_pt.nilReason
    ) AS specialdatepropertytype
FROM


;

SpecialDateTimeSlicePropertyType
CREATE OR REPLACE VIEW specialdatetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.specialdate_tsp.id
    ) AS specialdatetimeslicepropertytype
FROM

-- SpecialDateTimeSliceType
LEFT JOIN shared.specialdate_tsp
ON shared.specialdate_tsp.specialdatetimeslice_id = SpecialDateTimeSliceType.id

;

SpecialDateTimeSliceType
CREATE OR REPLACE VIEW specialdatetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', shared.specialdate_ts.type_value,
       'type_nilreason', shared.specialdate_ts.type_nilreason,
       'dateday_value', shared.specialdate_ts.dateday_value,
       'dateday_nilreason', shared.specialdate_ts.dateday_nilreason,
       'dateyear_value', shared.specialdate_ts.dateyear_value,
       'dateyear_nilreason', shared.specialdate_ts.dateyear_nilreason,
       'name_value', shared.specialdate_ts.name_value,
       'name_nilreason', shared.specialdate_ts.name_nilreason,
       'id', shared.specialdate_ts.id,
       'xml_id', shared.specialdate_ts.xml_id,
       'interpretation', shared.specialdate_ts.interpretation,
       'sequence_number', shared.specialdate_ts.sequence_number,
       'correction_number', shared.specialdate_ts.correction_number,
       'valid_time_begin', shared.specialdate_ts.valid_time_begin,
       'valid_time_end', shared.specialdate_ts.valid_time_end,
       'feature_lifetime_begin', shared.specialdate_ts.feature_lifetime_begin,
       'feature_lifetime_end', shared.specialdate_ts.feature_lifetime_end
    ) AS specialdatetimeslicetype
FROM

-- OrganisationAuthorityPropertyType
LEFT JOIN shared.specialdate_ts
ON shared.specialdate_ts.authority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.specialdate_ts
ON shared.specialdate_ts.abstractspecialdateextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.specialdate_ts.id = master_join.source_id
LEFT JOIN shared.specialdate_ts
ON master_join.target_id = NotePropertyType.id
;

SpecialDateType
CREATE OR REPLACE VIEW specialdatetype_view AS
SELECT
    jsonb_build_object(
       'id', shared.specialdate.id,
       'identifier', shared.specialdate.identifier,
       'identifier_code_space', shared.specialdate.identifier_code_space,
       'xml_id', shared.specialdate.xml_id
    ) AS specialdatetype
FROM


-- SpecialDateTimeSlicePropertyType
LEFT JOIN shared.master_join
ON shared.specialdate.id = master_join.source_id
LEFT JOIN shared.specialdate
ON master_join.target_id = SpecialDateTimeSlicePropertyType.id
;

SpecialNavigationStationPropertyType
CREATE OR REPLACE VIEW specialnavigationstationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationstation_pt.id,
       'nilReason', navaids_points.specialnavigationstation_pt.nilReason
    ) AS specialnavigationstationpropertytype
FROM


;

SpecialNavigationStationStatusPropertyType
CREATE OR REPLACE VIEW specialnavigationstationstatuspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationstationstatus_pt.id
    ) AS specialnavigationstationstatuspropertytype
FROM

-- SpecialNavigationStationStatusType
LEFT JOIN navaids_points.specialnavigationstationstatus_pt
ON navaids_points.specialnavigationstationstatus_pt.specialnavigationstationstatus_id = SpecialNavigationStationStatusType.id

;

SpecialNavigationStationStatusType
CREATE OR REPLACE VIEW specialnavigationstationstatustype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', navaids_points.specialnavigationstationstatus.operationalstatus_value,
       'operationalstatus_nilreason', navaids_points.specialnavigationstationstatus.operationalstatus_nilreason,
       'id', navaids_points.specialnavigationstationstatus.id,
       'identifier', navaids_points.specialnavigationstationstatus.identifier,
       'identifier_code_space', navaids_points.specialnavigationstationstatus.identifier_code_space,
       'xml_id', navaids_points.specialnavigationstationstatus.xml_id
    ) AS specialnavigationstationstatustype
FROM

-- AbstractExtensionType
LEFT JOIN navaids_points.specialnavigationstationstatus
ON navaids_points.specialnavigationstationstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.specialnavigationstationstatus
ON navaids_points.specialnavigationstationstatus.abstractspecialnavigationstationstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationstationstatus.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationstationstatus
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationstationstatus.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationstationstatus
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationstationstatus.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationstationstatus
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

SpecialNavigationStationTimeSlicePropertyType
CREATE OR REPLACE VIEW specialnavigationstationtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationstation_tsp.id
    ) AS specialnavigationstationtimeslicepropertytype
FROM

-- SpecialNavigationStationTimeSliceType
LEFT JOIN navaids_points.specialnavigationstation_tsp
ON navaids_points.specialnavigationstation_tsp.specialnavigationstationtimeslice_id = SpecialNavigationStationTimeSliceType.id

;

SpecialNavigationStationTimeSliceType
CREATE OR REPLACE VIEW specialnavigationstationtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', navaids_points.specialnavigationstation_ts.name_value,
       'name_nilreason', navaids_points.specialnavigationstation_ts.name_nilreason,
       'type_value', navaids_points.specialnavigationstation_ts.type_value,
       'type_nilreason', navaids_points.specialnavigationstation_ts.type_nilreason,
       'emission_value', navaids_points.specialnavigationstation_ts.emission_value,
       'emission_nilreason', navaids_points.specialnavigationstation_ts.emission_nilreason,
       'frequency_value', navaids_points.specialnavigationstation_ts.frequency_value,
       'frequency_uom', navaids_points.specialnavigationstation_ts.frequency_uom,
       'frequency_nilreason', navaids_points.specialnavigationstation_ts.frequency_nilreason,
       'id', navaids_points.specialnavigationstation_ts.id,
       'xml_id', navaids_points.specialnavigationstation_ts.xml_id,
       'interpretation', navaids_points.specialnavigationstation_ts.interpretation,
       'sequence_number', navaids_points.specialnavigationstation_ts.sequence_number,
       'correction_number', navaids_points.specialnavigationstation_ts.correction_number,
       'valid_time_begin', navaids_points.specialnavigationstation_ts.valid_time_begin,
       'valid_time_end', navaids_points.specialnavigationstation_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.specialnavigationstation_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.specialnavigationstation_ts.feature_lifetime_end
    ) AS specialnavigationstationtimeslicetype
FROM

-- SpecialNavigationSystemPropertyType
LEFT JOIN navaids_points.specialnavigationstation_ts
ON navaids_points.specialnavigationstation_ts.systemchain_id = SpecialNavigationSystemPropertyType.id
-- AuthorityForSpecialNavigationStationPropertyType
LEFT JOIN navaids_points.specialnavigationstation_ts
ON navaids_points.specialnavigationstation_ts.responsibleorganisation_id = AuthorityForSpecialNavigationStationPropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN navaids_points.specialnavigationstation_ts
ON navaids_points.specialnavigationstation_ts.position_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.specialnavigationstation_ts
ON navaids_points.specialnavigationstation_ts.abstractspecialnavigationstationextension_id = AbstractExtensionType.id

-- SpecialNavigationStationStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationstation_ts.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationstation_ts
ON master_join.target_id = SpecialNavigationStationStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationstation_ts.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationstation_ts
ON master_join.target_id = NotePropertyType.id
;

SpecialNavigationStationType
CREATE OR REPLACE VIEW specialnavigationstationtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationstation.id,
       'identifier', navaids_points.specialnavigationstation.identifier,
       'identifier_code_space', navaids_points.specialnavigationstation.identifier_code_space,
       'xml_id', navaids_points.specialnavigationstation.xml_id
    ) AS specialnavigationstationtype
FROM


-- SpecialNavigationStationTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationstation.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationstation
ON master_join.target_id = SpecialNavigationStationTimeSlicePropertyType.id
;

SpecialNavigationSystemPropertyType
CREATE OR REPLACE VIEW specialnavigationsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationsystem_pt.id,
       'nilReason', navaids_points.specialnavigationsystem_pt.nilReason
    ) AS specialnavigationsystempropertytype
FROM


;

SpecialNavigationSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW specialnavigationsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationsystem_tsp.id
    ) AS specialnavigationsystemtimeslicepropertytype
FROM

-- SpecialNavigationSystemTimeSliceType
LEFT JOIN navaids_points.specialnavigationsystem_tsp
ON navaids_points.specialnavigationsystem_tsp.specialnavigationsystemtimeslice_id = SpecialNavigationSystemTimeSliceType.id

;

SpecialNavigationSystemTimeSliceType
CREATE OR REPLACE VIEW specialnavigationsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', navaids_points.specialnavigationsystem_ts.type_value,
       'type_nilreason', navaids_points.specialnavigationsystem_ts.type_nilreason,
       'designator_value', navaids_points.specialnavigationsystem_ts.designator_value,
       'designator_nilreason', navaids_points.specialnavigationsystem_ts.designator_nilreason,
       'name_value', navaids_points.specialnavigationsystem_ts.name_value,
       'name_nilreason', navaids_points.specialnavigationsystem_ts.name_nilreason,
       'id', navaids_points.specialnavigationsystem_ts.id,
       'xml_id', navaids_points.specialnavigationsystem_ts.xml_id,
       'interpretation', navaids_points.specialnavigationsystem_ts.interpretation,
       'sequence_number', navaids_points.specialnavigationsystem_ts.sequence_number,
       'correction_number', navaids_points.specialnavigationsystem_ts.correction_number,
       'valid_time_begin', navaids_points.specialnavigationsystem_ts.valid_time_begin,
       'valid_time_end', navaids_points.specialnavigationsystem_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.specialnavigationsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.specialnavigationsystem_ts.feature_lifetime_end
    ) AS specialnavigationsystemtimeslicetype
FROM

-- AuthorityForSpecialNavigationSystemPropertyType
LEFT JOIN navaids_points.specialnavigationsystem_ts
ON navaids_points.specialnavigationsystem_ts.responsibleorganisation_id = AuthorityForSpecialNavigationSystemPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.specialnavigationsystem_ts
ON navaids_points.specialnavigationsystem_ts.abstractspecialnavigationsystemextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationsystem_ts.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationsystem_ts
ON master_join.target_id = NotePropertyType.id
;

SpecialNavigationSystemType
CREATE OR REPLACE VIEW specialnavigationsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationsystem.id,
       'identifier', navaids_points.specialnavigationsystem.identifier,
       'identifier_code_space', navaids_points.specialnavigationsystem.identifier_code_space,
       'xml_id', navaids_points.specialnavigationsystem.xml_id
    ) AS specialnavigationsystemtype
FROM


-- SpecialNavigationSystemTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.specialnavigationsystem.id = master_join.source_id
LEFT JOIN navaids_points.specialnavigationsystem
ON master_join.target_id = SpecialNavigationSystemTimeSlicePropertyType.id
;

StandardInstrumentArrivalPropertyType
CREATE OR REPLACE VIEW standardinstrumentarrivalpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentarrival_pt.id,
       'nilReason', procedure.standardinstrumentarrival_pt.nilReason
    ) AS standardinstrumentarrivalpropertytype
FROM


;

StandardInstrumentArrivalTimeSlicePropertyType
CREATE OR REPLACE VIEW standardinstrumentarrivaltimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentarrival_tsp.id
    ) AS standardinstrumentarrivaltimeslicepropertytype
FROM

-- StandardInstrumentArrivalTimeSliceType
LEFT JOIN procedure.standardinstrumentarrival_tsp
ON procedure.standardinstrumentarrival_tsp.standardinstrumentarrivaltimeslice_id = StandardInstrumentArrivalTimeSliceType.id

;

StandardInstrumentArrivalTimeSliceType
CREATE OR REPLACE VIEW standardinstrumentarrivaltimeslicetype_view AS
SELECT
    jsonb_build_object(
       'communicationfailureinstruction_value', procedure.standardinstrumentarrival_ts.communicationfailureinstruction_value,
       'communicationfailureinstruction_nilreason', procedure.standardinstrumentarrival_ts.communicationfailureinstruction_nilreason,
       'instruction_value', procedure.standardinstrumentarrival_ts.instruction_value,
       'instruction_nilreason', procedure.standardinstrumentarrival_ts.instruction_nilreason,
       'designcriteria_value', procedure.standardinstrumentarrival_ts.designcriteria_value,
       'designcriteria_nilreason', procedure.standardinstrumentarrival_ts.designcriteria_nilreason,
       'codingstandard_value', procedure.standardinstrumentarrival_ts.codingstandard_value,
       'codingstandard_nilreason', procedure.standardinstrumentarrival_ts.codingstandard_nilreason,
       'flightchecked_value', procedure.standardinstrumentarrival_ts.flightchecked_value,
       'flightchecked_nilreason', procedure.standardinstrumentarrival_ts.flightchecked_nilreason,
       'name_value', procedure.standardinstrumentarrival_ts.name_value,
       'name_nilreason', procedure.standardinstrumentarrival_ts.name_nilreason,
       'rnav_value', procedure.standardinstrumentarrival_ts.rnav_value,
       'rnav_nilreason', procedure.standardinstrumentarrival_ts.rnav_nilreason,
       'designator_value', procedure.standardinstrumentarrival_ts.designator_value,
       'designator_nilreason', procedure.standardinstrumentarrival_ts.designator_nilreason,
       'id', procedure.standardinstrumentarrival_ts.id,
       'xml_id', procedure.standardinstrumentarrival_ts.xml_id,
       'interpretation', procedure.standardinstrumentarrival_ts.interpretation,
       'sequence_number', procedure.standardinstrumentarrival_ts.sequence_number,
       'correction_number', procedure.standardinstrumentarrival_ts.correction_number,
       'valid_time_begin', procedure.standardinstrumentarrival_ts.valid_time_begin,
       'valid_time_end', procedure.standardinstrumentarrival_ts.valid_time_end,
       'feature_lifetime_begin', procedure.standardinstrumentarrival_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.standardinstrumentarrival_ts.feature_lifetime_end
    ) AS standardinstrumentarrivaltimeslicetype
FROM

-- NavaidPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.guidancefacility_navaid_id = NavaidPropertyType.id
-- SpecialNavigationSystemPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.guidancefacility_specialnavigationsystem_id = SpecialNavigationSystemPropertyType.id
-- RadarSystemPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.guidancefacility_radar_id = RadarSystemPropertyType.id
-- SafeAltitudeAreaPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.safealtitude_id = SafeAltitudeAreaPropertyType.id
-- LandingTakeoffAreaCollectionPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.arrival_id = LandingTakeoffAreaCollectionPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.abstractstandardinstrumentarrivalextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.abstractprocedureextension_id = AbstractExtensionType.id

-- ProcedureAvailabilityPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentarrival_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON master_join.target_id = ProcedureAvailabilityPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentarrival_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentarrival_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ProcedureTransitionPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentarrival_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON master_join.target_id = ProcedureTransitionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentarrival_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON master_join.target_id = NotePropertyType.id
;

StandardInstrumentArrivalType
CREATE OR REPLACE VIEW standardinstrumentarrivaltype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentarrival.id,
       'identifier', procedure.standardinstrumentarrival.identifier,
       'identifier_code_space', procedure.standardinstrumentarrival.identifier_code_space,
       'xml_id', procedure.standardinstrumentarrival.xml_id
    ) AS standardinstrumentarrivaltype
FROM


-- StandardInstrumentArrivalTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentarrival.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentarrival
ON master_join.target_id = StandardInstrumentArrivalTimeSlicePropertyType.id
;

StandardInstrumentDeparturePropertyType
CREATE OR REPLACE VIEW standardinstrumentdeparturepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentdeparture_pt.id,
       'nilReason', procedure.standardinstrumentdeparture_pt.nilReason
    ) AS standardinstrumentdeparturepropertytype
FROM


;

StandardInstrumentDepartureTimeSlicePropertyType
CREATE OR REPLACE VIEW standardinstrumentdeparturetimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentdeparture_tsp.id
    ) AS standardinstrumentdeparturetimeslicepropertytype
FROM

-- StandardInstrumentDepartureTimeSliceType
LEFT JOIN procedure.standardinstrumentdeparture_tsp
ON procedure.standardinstrumentdeparture_tsp.standardinstrumentdeparturetimeslice_id = StandardInstrumentDepartureTimeSliceType.id

;

StandardInstrumentDepartureTimeSliceType
CREATE OR REPLACE VIEW standardinstrumentdeparturetimeslicetype_view AS
SELECT
    jsonb_build_object(
       'communicationfailureinstruction_value', procedure.standardinstrumentdeparture_ts.communicationfailureinstruction_value,
       'communicationfailureinstruction_nilreason', procedure.standardinstrumentdeparture_ts.communicationfailureinstruction_nilreason,
       'instruction_value', procedure.standardinstrumentdeparture_ts.instruction_value,
       'instruction_nilreason', procedure.standardinstrumentdeparture_ts.instruction_nilreason,
       'designcriteria_value', procedure.standardinstrumentdeparture_ts.designcriteria_value,
       'designcriteria_nilreason', procedure.standardinstrumentdeparture_ts.designcriteria_nilreason,
       'codingstandard_value', procedure.standardinstrumentdeparture_ts.codingstandard_value,
       'codingstandard_nilreason', procedure.standardinstrumentdeparture_ts.codingstandard_nilreason,
       'flightchecked_value', procedure.standardinstrumentdeparture_ts.flightchecked_value,
       'flightchecked_nilreason', procedure.standardinstrumentdeparture_ts.flightchecked_nilreason,
       'name_value', procedure.standardinstrumentdeparture_ts.name_value,
       'name_nilreason', procedure.standardinstrumentdeparture_ts.name_nilreason,
       'rnav_value', procedure.standardinstrumentdeparture_ts.rnav_value,
       'rnav_nilreason', procedure.standardinstrumentdeparture_ts.rnav_nilreason,
       'designator_value', procedure.standardinstrumentdeparture_ts.designator_value,
       'designator_nilreason', procedure.standardinstrumentdeparture_ts.designator_nilreason,
       'contingencyroute_value', procedure.standardinstrumentdeparture_ts.contingencyroute_value,
       'contingencyroute_nilreason', procedure.standardinstrumentdeparture_ts.contingencyroute_nilreason,
       'id', procedure.standardinstrumentdeparture_ts.id,
       'xml_id', procedure.standardinstrumentdeparture_ts.xml_id,
       'interpretation', procedure.standardinstrumentdeparture_ts.interpretation,
       'sequence_number', procedure.standardinstrumentdeparture_ts.sequence_number,
       'correction_number', procedure.standardinstrumentdeparture_ts.correction_number,
       'valid_time_begin', procedure.standardinstrumentdeparture_ts.valid_time_begin,
       'valid_time_end', procedure.standardinstrumentdeparture_ts.valid_time_end,
       'feature_lifetime_begin', procedure.standardinstrumentdeparture_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.standardinstrumentdeparture_ts.feature_lifetime_end
    ) AS standardinstrumentdeparturetimeslicetype
FROM

-- NavaidPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.guidancefacility_navaid_id = NavaidPropertyType.id
-- SpecialNavigationSystemPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.guidancefacility_specialnavigationsystem_id = SpecialNavigationSystemPropertyType.id
-- RadarSystemPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.guidancefacility_radar_id = RadarSystemPropertyType.id
-- SafeAltitudeAreaPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.safealtitude_id = SafeAltitudeAreaPropertyType.id
-- LandingTakeoffAreaCollectionPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.takeoff_id = LandingTakeoffAreaCollectionPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.abstractstandardinstrumentdepartureextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.abstractprocedureextension_id = AbstractExtensionType.id

-- ProcedureAvailabilityPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentdeparture_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON master_join.target_id = ProcedureAvailabilityPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentdeparture_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON master_join.target_id = AirportHeliportPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentdeparture_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON master_join.target_id = AircraftCharacteristicPropertyType.id
-- ProcedureTransitionPropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentdeparture_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON master_join.target_id = ProcedureTransitionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentdeparture_ts.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON master_join.target_id = NotePropertyType.id
;

StandardInstrumentDepartureType
CREATE OR REPLACE VIEW standardinstrumentdeparturetype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentdeparture.id,
       'identifier', procedure.standardinstrumentdeparture.identifier,
       'identifier_code_space', procedure.standardinstrumentdeparture.identifier_code_space,
       'xml_id', procedure.standardinstrumentdeparture.xml_id
    ) AS standardinstrumentdeparturetype
FROM


-- StandardInstrumentDepartureTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.standardinstrumentdeparture.id = master_join.source_id
LEFT JOIN procedure.standardinstrumentdeparture
ON master_join.target_id = StandardInstrumentDepartureTimeSlicePropertyType.id
;

StandardLevelColumnPropertyType
CREATE OR REPLACE VIEW standardlevelcolumnpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelcolumn_pt.id,
       'nilReason', shared.standardlevelcolumn_pt.nilReason
    ) AS standardlevelcolumnpropertytype
FROM


;

StandardLevelColumnTimeSlicePropertyType
CREATE OR REPLACE VIEW standardlevelcolumntimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelcolumn_tsp.id
    ) AS standardlevelcolumntimeslicepropertytype
FROM

-- StandardLevelColumnTimeSliceType
LEFT JOIN shared.standardlevelcolumn_tsp
ON shared.standardlevelcolumn_tsp.standardlevelcolumntimeslice_id = StandardLevelColumnTimeSliceType.id

;

StandardLevelColumnTimeSliceType
CREATE OR REPLACE VIEW standardlevelcolumntimeslicetype_view AS
SELECT
    jsonb_build_object(
       'unitofmeasurement', shared.standardlevelcolumn_ts.unitofmeasurement,
       'series_value', shared.standardlevelcolumn_ts.series_value,
       'series_nilreason', shared.standardlevelcolumn_ts.series_nilreason,
       'separation_value', shared.standardlevelcolumn_ts.separation_value,
       'separation_nilreason', shared.standardlevelcolumn_ts.separation_nilreason,
       'id', shared.standardlevelcolumn_ts.id,
       'xml_id', shared.standardlevelcolumn_ts.xml_id,
       'interpretation', shared.standardlevelcolumn_ts.interpretation,
       'sequence_number', shared.standardlevelcolumn_ts.sequence_number,
       'correction_number', shared.standardlevelcolumn_ts.correction_number,
       'valid_time_begin', shared.standardlevelcolumn_ts.valid_time_begin,
       'valid_time_end', shared.standardlevelcolumn_ts.valid_time_end,
       'feature_lifetime_begin', shared.standardlevelcolumn_ts.feature_lifetime_begin,
       'feature_lifetime_end', shared.standardlevelcolumn_ts.feature_lifetime_end
    ) AS standardlevelcolumntimeslicetype
FROM

-- StandardLevelTablePropertyType
LEFT JOIN shared.standardlevelcolumn_ts
ON shared.standardlevelcolumn_ts.leveltable_id = StandardLevelTablePropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.standardlevelcolumn_ts
ON shared.standardlevelcolumn_ts.abstractstandardlevelcolumnextension_id = AbstractExtensionType.id

-- StandardLevelPropertyType
LEFT JOIN shared.master_join
ON shared.standardlevelcolumn_ts.id = master_join.source_id
LEFT JOIN shared.standardlevelcolumn_ts
ON master_join.target_id = StandardLevelPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.standardlevelcolumn_ts.id = master_join.source_id
LEFT JOIN shared.standardlevelcolumn_ts
ON master_join.target_id = NotePropertyType.id
;

StandardLevelColumnType
CREATE OR REPLACE VIEW standardlevelcolumntype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelcolumn.id,
       'identifier', shared.standardlevelcolumn.identifier,
       'identifier_code_space', shared.standardlevelcolumn.identifier_code_space,
       'xml_id', shared.standardlevelcolumn.xml_id
    ) AS standardlevelcolumntype
FROM


-- StandardLevelColumnTimeSlicePropertyType
LEFT JOIN shared.master_join
ON shared.standardlevelcolumn.id = master_join.source_id
LEFT JOIN shared.standardlevelcolumn
ON master_join.target_id = StandardLevelColumnTimeSlicePropertyType.id
;

StandardLevelPropertyType
CREATE OR REPLACE VIEW standardlevelpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevel_pt.id
    ) AS standardlevelpropertytype
FROM

-- StandardLevelType
LEFT JOIN shared.standardlevel_pt
ON shared.standardlevel_pt.standardlevel_id = StandardLevelType.id

;

StandardLevelSectorPropertyType
CREATE OR REPLACE VIEW standardlevelsectorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelsector_pt.id,
       'nilReason', shared.standardlevelsector_pt.nilReason
    ) AS standardlevelsectorpropertytype
FROM


;

StandardLevelSectorTimeSlicePropertyType
CREATE OR REPLACE VIEW standardlevelsectortimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelsector_tsp.id
    ) AS standardlevelsectortimeslicepropertytype
FROM

-- StandardLevelSectorTimeSliceType
LEFT JOIN shared.standardlevelsector_tsp
ON shared.standardlevelsector_tsp.standardlevelsectortimeslice_id = StandardLevelSectorTimeSliceType.id

;

StandardLevelSectorTimeSliceType
CREATE OR REPLACE VIEW standardlevelsectortimeslicetype_view AS
SELECT
    jsonb_build_object(
       'flightrule_value', shared.standardlevelsector_ts.flightrule_value,
       'flightrule_nilreason', shared.standardlevelsector_ts.flightrule_nilreason,
       'fromtrack_value', shared.standardlevelsector_ts.fromtrack_value,
       'fromtrack_nilreason', shared.standardlevelsector_ts.fromtrack_nilreason,
       'totrack_value', shared.standardlevelsector_ts.totrack_value,
       'totrack_nilreason', shared.standardlevelsector_ts.totrack_nilreason,
       'angletype_value', shared.standardlevelsector_ts.angletype_value,
       'angletype_nilreason', shared.standardlevelsector_ts.angletype_nilreason,
       'id', shared.standardlevelsector_ts.id,
       'xml_id', shared.standardlevelsector_ts.xml_id,
       'interpretation', shared.standardlevelsector_ts.interpretation,
       'sequence_number', shared.standardlevelsector_ts.sequence_number,
       'correction_number', shared.standardlevelsector_ts.correction_number,
       'valid_time_begin', shared.standardlevelsector_ts.valid_time_begin,
       'valid_time_end', shared.standardlevelsector_ts.valid_time_end,
       'feature_lifetime_begin', shared.standardlevelsector_ts.feature_lifetime_begin,
       'feature_lifetime_end', shared.standardlevelsector_ts.feature_lifetime_end
    ) AS standardlevelsectortimeslicetype
FROM

-- StandardLevelColumnPropertyType
LEFT JOIN shared.standardlevelsector_ts
ON shared.standardlevelsector_ts.applicablelevelcolumn_id = StandardLevelColumnPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.standardlevelsector_ts
ON shared.standardlevelsector_ts.abstractstandardlevelsectorextension_id = AbstractExtensionType.id

-- AirspacePropertyType
LEFT JOIN shared.master_join
ON shared.standardlevelsector_ts.id = master_join.source_id
LEFT JOIN shared.standardlevelsector_ts
ON master_join.target_id = AirspacePropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.standardlevelsector_ts.id = master_join.source_id
LEFT JOIN shared.standardlevelsector_ts
ON master_join.target_id = NotePropertyType.id
;

StandardLevelSectorType
CREATE OR REPLACE VIEW standardlevelsectortype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelsector.id,
       'identifier', shared.standardlevelsector.identifier,
       'identifier_code_space', shared.standardlevelsector.identifier_code_space,
       'xml_id', shared.standardlevelsector.xml_id
    ) AS standardlevelsectortype
FROM


-- StandardLevelSectorTimeSlicePropertyType
LEFT JOIN shared.master_join
ON shared.standardlevelsector.id = master_join.source_id
LEFT JOIN shared.standardlevelsector
ON master_join.target_id = StandardLevelSectorTimeSlicePropertyType.id
;

StandardLevelTablePropertyType
CREATE OR REPLACE VIEW standardleveltablepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardleveltable_pt.id,
       'nilReason', shared.standardleveltable_pt.nilReason
    ) AS standardleveltablepropertytype
FROM


;

StandardLevelTableTimeSlicePropertyType
CREATE OR REPLACE VIEW standardleveltabletimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardleveltable_tsp.id
    ) AS standardleveltabletimeslicepropertytype
FROM

-- StandardLevelTableTimeSliceType
LEFT JOIN shared.standardleveltable_tsp
ON shared.standardleveltable_tsp.standardleveltabletimeslice_id = StandardLevelTableTimeSliceType.id

;

StandardLevelTableTimeSliceType
CREATE OR REPLACE VIEW standardleveltabletimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', shared.standardleveltable_ts.name_value,
       'name_nilreason', shared.standardleveltable_ts.name_nilreason,
       'standardicao_value', shared.standardleveltable_ts.standardicao_value,
       'standardicao_nilreason', shared.standardleveltable_ts.standardicao_nilreason,
       'id', shared.standardleveltable_ts.id,
       'xml_id', shared.standardleveltable_ts.xml_id,
       'interpretation', shared.standardleveltable_ts.interpretation,
       'sequence_number', shared.standardleveltable_ts.sequence_number,
       'correction_number', shared.standardleveltable_ts.correction_number,
       'valid_time_begin', shared.standardleveltable_ts.valid_time_begin,
       'valid_time_end', shared.standardleveltable_ts.valid_time_end,
       'feature_lifetime_begin', shared.standardleveltable_ts.feature_lifetime_begin,
       'feature_lifetime_end', shared.standardleveltable_ts.feature_lifetime_end
    ) AS standardleveltabletimeslicetype
FROM

-- AbstractExtensionType
LEFT JOIN shared.standardleveltable_ts
ON shared.standardleveltable_ts.abstractstandardleveltableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.standardleveltable_ts.id = master_join.source_id
LEFT JOIN shared.standardleveltable_ts
ON master_join.target_id = NotePropertyType.id
;

StandardLevelTableType
CREATE OR REPLACE VIEW standardleveltabletype_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardleveltable.id,
       'identifier', shared.standardleveltable.identifier,
       'identifier_code_space', shared.standardleveltable.identifier_code_space,
       'xml_id', shared.standardleveltable.xml_id
    ) AS standardleveltabletype
FROM


-- StandardLevelTableTimeSlicePropertyType
LEFT JOIN shared.master_join
ON shared.standardleveltable.id = master_join.source_id
LEFT JOIN shared.standardleveltable
ON master_join.target_id = StandardLevelTableTimeSlicePropertyType.id
;

StandardLevelType
CREATE OR REPLACE VIEW standardleveltype_view AS
SELECT
    jsonb_build_object(
       'verticaldistance_value', shared.standardlevel.verticaldistance_value,
       'verticaldistance_uom', shared.standardlevel.verticaldistance_uom,
       'verticaldistance_nilreason', shared.standardlevel.verticaldistance_nilreason,
       'id', shared.standardlevel.id,
       'identifier', shared.standardlevel.identifier,
       'identifier_code_space', shared.standardlevel.identifier_code_space,
       'xml_id', shared.standardlevel.xml_id
    ) AS standardleveltype
FROM

-- AbstractExtensionType
LEFT JOIN shared.standardlevel
ON shared.standardlevel.abstractstandardlevelextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.standardlevel.id = master_join.source_id
LEFT JOIN shared.standardlevel
ON master_join.target_id = NotePropertyType.id
;

StandMarkingPropertyType
CREATE OR REPLACE VIEW standmarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.standmarking_pt.id,
       'nilReason', airport_heliport.standmarking_pt.nilReason
    ) AS standmarkingpropertytype
FROM


;

StandMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW standmarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.standmarking_tsp.id
    ) AS standmarkingtimeslicepropertytype
FROM

-- StandMarkingTimeSliceType
LEFT JOIN airport_heliport.standmarking_tsp
ON airport_heliport.standmarking_tsp.standmarkingtimeslice_id = StandMarkingTimeSliceType.id

;

StandMarkingTimeSliceType
CREATE OR REPLACE VIEW standmarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.standmarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.standmarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.standmarking_ts.condition_value,
       'condition_nilreason', airport_heliport.standmarking_ts.condition_nilreason,
       'id', airport_heliport.standmarking_ts.id,
       'xml_id', airport_heliport.standmarking_ts.xml_id,
       'interpretation', airport_heliport.standmarking_ts.interpretation,
       'sequence_number', airport_heliport.standmarking_ts.sequence_number,
       'correction_number', airport_heliport.standmarking_ts.correction_number,
       'valid_time_begin', airport_heliport.standmarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.standmarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.standmarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.standmarking_ts.feature_lifetime_end
    ) AS standmarkingtimeslicetype
FROM

-- AircraftStandPropertyType
LEFT JOIN airport_heliport.standmarking_ts
ON airport_heliport.standmarking_ts.markedstand_id = AircraftStandPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.standmarking_ts
ON airport_heliport.standmarking_ts.abstractstandmarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.standmarking_ts
ON airport_heliport.standmarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.standmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.standmarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.standmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.standmarking_ts
ON master_join.target_id = NotePropertyType.id
;

StandMarkingType
CREATE OR REPLACE VIEW standmarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.standmarking.id,
       'identifier', airport_heliport.standmarking.identifier,
       'identifier_code_space', airport_heliport.standmarking.identifier_code_space,
       'xml_id', airport_heliport.standmarking.xml_id
    ) AS standmarkingtype
FROM


-- StandMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.standmarking.id = master_join.source_id
LEFT JOIN airport_heliport.standmarking
ON master_join.target_id = StandMarkingTimeSlicePropertyType.id
;

SurfaceCharacteristicsPropertyType
CREATE OR REPLACE VIEW surfacecharacteristicspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surfacecharacteristics_pt.id
    ) AS surfacecharacteristicspropertytype
FROM

-- SurfaceCharacteristicsType
LEFT JOIN airport_heliport.surfacecharacteristics_pt
ON airport_heliport.surfacecharacteristics_pt.surfacecharacteristics_id = SurfaceCharacteristicsType.id

;

SurfaceCharacteristicsType
CREATE OR REPLACE VIEW surfacecharacteristicstype_view AS
SELECT
    jsonb_build_object(
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
       'tyrepressuresiwl_nilreason', airport_heliport.surfacecharacteristics.tyrepressuresiwl_nilreason,
       'weightauw_value', airport_heliport.surfacecharacteristics.weightauw_value,
       'weightauw_uom', airport_heliport.surfacecharacteristics.weightauw_uom,
       'weightauw_nilreason', airport_heliport.surfacecharacteristics.weightauw_nilreason,
       'id', airport_heliport.surfacecharacteristics.id,
       'identifier', airport_heliport.surfacecharacteristics.identifier,
       'identifier_code_space', airport_heliport.surfacecharacteristics.identifier_code_space,
       'xml_id', airport_heliport.surfacecharacteristics.xml_id
    ) AS surfacecharacteristicstype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.surfacecharacteristics
ON airport_heliport.surfacecharacteristics.abstractsurfacecharacteristicsextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.surfacecharacteristics.id = master_join.source_id
LEFT JOIN airport_heliport.surfacecharacteristics
ON master_join.target_id = NotePropertyType.id
;

SurfaceContaminationLayerPropertyType
CREATE OR REPLACE VIEW surfacecontaminationlayerpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surfacecontaminationlayer_pt.id
    ) AS surfacecontaminationlayerpropertytype
FROM

-- SurfaceContaminationLayerType
LEFT JOIN airport_heliport.surfacecontaminationlayer_pt
ON airport_heliport.surfacecontaminationlayer_pt.surfacecontaminationlayer_id = SurfaceContaminationLayerType.id

;

SurfaceContaminationLayerType
CREATE OR REPLACE VIEW surfacecontaminationlayertype_view AS
SELECT
    jsonb_build_object(
       'layerorder_value', airport_heliport.surfacecontaminationlayer.layerorder_value,
       'layerorder_nilreason', airport_heliport.surfacecontaminationlayer.layerorder_nilreason,
       'type_value', airport_heliport.surfacecontaminationlayer.type_value,
       'type_nilreason', airport_heliport.surfacecontaminationlayer.type_nilreason,
       'id', airport_heliport.surfacecontaminationlayer.id,
       'identifier', airport_heliport.surfacecontaminationlayer.identifier,
       'identifier_code_space', airport_heliport.surfacecontaminationlayer.identifier_code_space,
       'xml_id', airport_heliport.surfacecontaminationlayer.xml_id
    ) AS surfacecontaminationlayertype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.surfacecontaminationlayer
ON airport_heliport.surfacecontaminationlayer.abstractsurfacecontaminationlayerextension_id = AbstractExtensionType.id

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.surfacecontaminationlayer.id = master_join.source_id
LEFT JOIN airport_heliport.surfacecontaminationlayer
ON master_join.target_id = ElevatedSurfacePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.surfacecontaminationlayer.id = master_join.source_id
LEFT JOIN airport_heliport.surfacecontaminationlayer
ON master_join.target_id = NotePropertyType.id
;

SurfaceContaminationPropertyType
CREATE OR REPLACE VIEW surfacecontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surfacecontamination_pt.id
    ) AS surfacecontaminationpropertytype
FROM


;

SurveillanceGroundStationPropertyType
CREATE OR REPLACE VIEW surveillancegroundstationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.surveillancegroundstation_pt.id
    ) AS surveillancegroundstationpropertytype
FROM

-- SurveillanceGroundStationType
LEFT JOIN surveillance.surveillancegroundstation_pt
ON surveillance.surveillancegroundstation_pt.surveillancegroundstation_id = SurveillanceGroundStationType.id

;

SurveillanceGroundStationType
CREATE OR REPLACE VIEW surveillancegroundstationtype_view AS
SELECT
    jsonb_build_object(
       'videomap_value', surveillance.surveillancegroundstation.videomap_value,
       'videomap_nilreason', surveillance.surveillancegroundstation.videomap_nilreason,
       'id', surveillance.surveillancegroundstation.id,
       'identifier', surveillance.surveillancegroundstation.identifier,
       'identifier_code_space', surveillance.surveillancegroundstation.identifier_code_space,
       'xml_id', surveillance.surveillancegroundstation.xml_id
    ) AS surveillancegroundstationtype
FROM

-- UnitPropertyType
LEFT JOIN surveillance.surveillancegroundstation
ON surveillance.surveillancegroundstation.theunit_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.surveillancegroundstation
ON surveillance.surveillancegroundstation.abstractsurveillancegroundstationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN surveillance.master_join
ON surveillance.surveillancegroundstation.id = master_join.source_id
LEFT JOIN surveillance.surveillancegroundstation
ON master_join.target_id = NotePropertyType.id
;

SurveillanceRadarPropertyType
CREATE OR REPLACE VIEW surveillanceradarpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.surveillanceradar_pt.id,
       'nilReason', surveillance.surveillanceradar_pt.nilReason
    ) AS surveillanceradarpropertytype
FROM


;

SurveyControlPointPropertyType
CREATE OR REPLACE VIEW surveycontrolpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surveycontrolpoint_pt.id,
       'nilReason', airport_heliport.surveycontrolpoint_pt.nilReason
    ) AS surveycontrolpointpropertytype
FROM


;

SurveyControlPointTimeSlicePropertyType
CREATE OR REPLACE VIEW surveycontrolpointtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surveycontrolpoint_tsp.id
    ) AS surveycontrolpointtimeslicepropertytype
FROM

-- SurveyControlPointTimeSliceType
LEFT JOIN airport_heliport.surveycontrolpoint_tsp
ON airport_heliport.surveycontrolpoint_tsp.surveycontrolpointtimeslice_id = SurveyControlPointTimeSliceType.id

;

SurveyControlPointTimeSliceType
CREATE OR REPLACE VIEW surveycontrolpointtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.surveycontrolpoint_ts.designator_value,
       'designator_nilreason', airport_heliport.surveycontrolpoint_ts.designator_nilreason,
       'id', airport_heliport.surveycontrolpoint_ts.id,
       'xml_id', airport_heliport.surveycontrolpoint_ts.xml_id,
       'interpretation', airport_heliport.surveycontrolpoint_ts.interpretation,
       'sequence_number', airport_heliport.surveycontrolpoint_ts.sequence_number,
       'correction_number', airport_heliport.surveycontrolpoint_ts.correction_number,
       'valid_time_begin', airport_heliport.surveycontrolpoint_ts.valid_time_begin,
       'valid_time_end', airport_heliport.surveycontrolpoint_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.surveycontrolpoint_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.surveycontrolpoint_ts.feature_lifetime_end
    ) AS surveycontrolpointtimeslicetype
FROM

-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.surveycontrolpoint_ts
ON airport_heliport.surveycontrolpoint_ts.associatedairportheliport_id = AirportHeliportPropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.surveycontrolpoint_ts
ON airport_heliport.surveycontrolpoint_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.surveycontrolpoint_ts
ON airport_heliport.surveycontrolpoint_ts.abstractsurveycontrolpointextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.surveycontrolpoint_ts.id = master_join.source_id
LEFT JOIN airport_heliport.surveycontrolpoint_ts
ON master_join.target_id = NotePropertyType.id
;

SurveyControlPointType
CREATE OR REPLACE VIEW surveycontrolpointtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surveycontrolpoint.id,
       'identifier', airport_heliport.surveycontrolpoint.identifier,
       'identifier_code_space', airport_heliport.surveycontrolpoint.identifier_code_space,
       'xml_id', airport_heliport.surveycontrolpoint.xml_id
    ) AS surveycontrolpointtype
FROM


-- SurveyControlPointTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.surveycontrolpoint.id = master_join.source_id
LEFT JOIN airport_heliport.surveycontrolpoint
ON master_join.target_id = SurveyControlPointTimeSlicePropertyType.id
;

TACANPropertyType
CREATE OR REPLACE VIEW tacanpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.tacan_pt.id,
       'nilReason', navaids_points.tacan_pt.nilReason
    ) AS tacanpropertytype
FROM


;

TACANTimeSlicePropertyType
CREATE OR REPLACE VIEW tacantimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.tacan_tsp.id
    ) AS tacantimeslicepropertytype
FROM

-- TACANTimeSliceType
LEFT JOIN navaids_points.tacan_tsp
ON navaids_points.tacan_tsp.tacantimeslice_id = TACANTimeSliceType.id

;

TACANTimeSliceType
CREATE OR REPLACE VIEW tacantimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.tacan_ts.designator_value,
       'designator_nilreason', navaids_points.tacan_ts.designator_nilreason,
       'name_value', navaids_points.tacan_ts.name_value,
       'name_nilreason', navaids_points.tacan_ts.name_nilreason,
       'emissionclass_value', navaids_points.tacan_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.tacan_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.tacan_ts.mobile_value,
       'mobile_nilreason', navaids_points.tacan_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.tacan_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.tacan_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.tacan_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.tacan_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.tacan_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.tacan_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.tacan_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.tacan_ts.flightchecked_nilreason,
       'channel_value', navaids_points.tacan_ts.channel_value,
       'channel_nilreason', navaids_points.tacan_ts.channel_nilreason,
       'declination_value', navaids_points.tacan_ts.declination_value,
       'declination_nilreason', navaids_points.tacan_ts.declination_nilreason,
       'id', navaids_points.tacan_ts.id,
       'xml_id', navaids_points.tacan_ts.xml_id,
       'interpretation', navaids_points.tacan_ts.interpretation,
       'sequence_number', navaids_points.tacan_ts.sequence_number,
       'correction_number', navaids_points.tacan_ts.correction_number,
       'valid_time_begin', navaids_points.tacan_ts.valid_time_begin,
       'valid_time_end', navaids_points.tacan_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.tacan_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.tacan_ts.feature_lifetime_end
    ) AS tacantimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.tacan_ts
ON navaids_points.tacan_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.tacan_ts
ON navaids_points.tacan_ts.abstracttacanextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.tacan_ts
ON navaids_points.tacan_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.tacan_ts.id = master_join.source_id
LEFT JOIN navaids_points.tacan_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.tacan_ts.id = master_join.source_id
LEFT JOIN navaids_points.tacan_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.tacan_ts.id = master_join.source_id
LEFT JOIN navaids_points.tacan_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.tacan_ts.id = master_join.source_id
LEFT JOIN navaids_points.tacan_ts
ON master_join.target_id = NotePropertyType.id
;

TACANType
CREATE OR REPLACE VIEW tacantype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.tacan.id,
       'identifier', navaids_points.tacan.identifier,
       'identifier_code_space', navaids_points.tacan.identifier_code_space,
       'xml_id', navaids_points.tacan.xml_id
    ) AS tacantype
FROM


-- TACANTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.tacan.id = master_join.source_id
LEFT JOIN navaids_points.tacan
ON master_join.target_id = TACANTimeSlicePropertyType.id
;

TaxiHoldingPositionLightSystemPropertyType
CREATE OR REPLACE VIEW taxiholdingpositionlightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionlightsystem_pt.id,
       'nilReason', airport_heliport.taxiholdingpositionlightsystem_pt.nilReason
    ) AS taxiholdingpositionlightsystempropertytype
FROM


;

TaxiHoldingPositionLightSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW taxiholdingpositionlightsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionlightsystem_tsp.id
    ) AS taxiholdingpositionlightsystemtimeslicepropertytype
FROM

-- TaxiHoldingPositionLightSystemTimeSliceType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_tsp
ON airport_heliport.taxiholdingpositionlightsystem_tsp.taxiholdingpositionlightsystemtimeslice_id = TaxiHoldingPositionLightSystemTimeSliceType.id

;

TaxiHoldingPositionLightSystemTimeSliceType
CREATE OR REPLACE VIEW taxiholdingpositionlightsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.taxiholdingpositionlightsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.taxiholdingpositionlightsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.taxiholdingpositionlightsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.taxiholdingpositionlightsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.taxiholdingpositionlightsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.taxiholdingpositionlightsystem_ts.colour_nilreason,
       'type_value', airport_heliport.taxiholdingpositionlightsystem_ts.type_value,
       'type_nilreason', airport_heliport.taxiholdingpositionlightsystem_ts.type_nilreason,
       'id', airport_heliport.taxiholdingpositionlightsystem_ts.id,
       'xml_id', airport_heliport.taxiholdingpositionlightsystem_ts.xml_id,
       'interpretation', airport_heliport.taxiholdingpositionlightsystem_ts.interpretation,
       'sequence_number', airport_heliport.taxiholdingpositionlightsystem_ts.sequence_number,
       'correction_number', airport_heliport.taxiholdingpositionlightsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.taxiholdingpositionlightsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.taxiholdingpositionlightsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.taxiholdingpositionlightsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.taxiholdingpositionlightsystem_ts.feature_lifetime_end
    ) AS taxiholdingpositionlightsystemtimeslicetype
FROM

-- TaxiHoldingPositionPropertyType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON airport_heliport.taxiholdingpositionlightsystem_ts.taxiholding_id = TaxiHoldingPositionPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON airport_heliport.taxiholdingpositionlightsystem_ts.abstracttaxiholdingpositionlightsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON airport_heliport.taxiholdingpositionlightsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingpositionlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingpositionlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingpositionlightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON master_join.target_id = NotePropertyType.id
;

TaxiHoldingPositionLightSystemType
CREATE OR REPLACE VIEW taxiholdingpositionlightsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionlightsystem.id,
       'identifier', airport_heliport.taxiholdingpositionlightsystem.identifier,
       'identifier_code_space', airport_heliport.taxiholdingpositionlightsystem.identifier_code_space,
       'xml_id', airport_heliport.taxiholdingpositionlightsystem.xml_id
    ) AS taxiholdingpositionlightsystemtype
FROM


-- TaxiHoldingPositionLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingpositionlightsystem.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem
ON master_join.target_id = TaxiHoldingPositionLightSystemTimeSlicePropertyType.id
;

TaxiHoldingPositionMarkingPropertyType
CREATE OR REPLACE VIEW taxiholdingpositionmarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionmarking_pt.id,
       'nilReason', airport_heliport.taxiholdingpositionmarking_pt.nilReason
    ) AS taxiholdingpositionmarkingpropertytype
FROM


;

TaxiHoldingPositionMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW taxiholdingpositionmarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionmarking_tsp.id
    ) AS taxiholdingpositionmarkingtimeslicepropertytype
FROM

-- TaxiHoldingPositionMarkingTimeSliceType
LEFT JOIN airport_heliport.taxiholdingpositionmarking_tsp
ON airport_heliport.taxiholdingpositionmarking_tsp.taxiholdingpositionmarkingtimeslice_id = TaxiHoldingPositionMarkingTimeSliceType.id

;

TaxiHoldingPositionMarkingTimeSliceType
CREATE OR REPLACE VIEW taxiholdingpositionmarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.taxiholdingpositionmarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.taxiholdingpositionmarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.taxiholdingpositionmarking_ts.condition_value,
       'condition_nilreason', airport_heliport.taxiholdingpositionmarking_ts.condition_nilreason,
       'id', airport_heliport.taxiholdingpositionmarking_ts.id,
       'xml_id', airport_heliport.taxiholdingpositionmarking_ts.xml_id,
       'interpretation', airport_heliport.taxiholdingpositionmarking_ts.interpretation,
       'sequence_number', airport_heliport.taxiholdingpositionmarking_ts.sequence_number,
       'correction_number', airport_heliport.taxiholdingpositionmarking_ts.correction_number,
       'valid_time_begin', airport_heliport.taxiholdingpositionmarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.taxiholdingpositionmarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.taxiholdingpositionmarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.taxiholdingpositionmarking_ts.feature_lifetime_end
    ) AS taxiholdingpositionmarkingtimeslicetype
FROM

-- TaxiHoldingPositionPropertyType
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts
ON airport_heliport.taxiholdingpositionmarking_ts.markedtaxihold_id = TaxiHoldingPositionPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts
ON airport_heliport.taxiholdingpositionmarking_ts.abstracttaxiholdingpositionmarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts
ON airport_heliport.taxiholdingpositionmarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingpositionmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingpositionmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts
ON master_join.target_id = NotePropertyType.id
;

TaxiHoldingPositionMarkingType
CREATE OR REPLACE VIEW taxiholdingpositionmarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionmarking.id,
       'identifier', airport_heliport.taxiholdingpositionmarking.identifier,
       'identifier_code_space', airport_heliport.taxiholdingpositionmarking.identifier_code_space,
       'xml_id', airport_heliport.taxiholdingpositionmarking.xml_id
    ) AS taxiholdingpositionmarkingtype
FROM


-- TaxiHoldingPositionMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingpositionmarking.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingpositionmarking
ON master_join.target_id = TaxiHoldingPositionMarkingTimeSlicePropertyType.id
;

TaxiHoldingPositionPropertyType
CREATE OR REPLACE VIEW taxiholdingpositionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingposition_pt.id,
       'nilReason', airport_heliport.taxiholdingposition_pt.nilReason
    ) AS taxiholdingpositionpropertytype
FROM


;

TaxiHoldingPositionTimeSlicePropertyType
CREATE OR REPLACE VIEW taxiholdingpositiontimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingposition_tsp.id
    ) AS taxiholdingpositiontimeslicepropertytype
FROM

-- TaxiHoldingPositionTimeSliceType
LEFT JOIN airport_heliport.taxiholdingposition_tsp
ON airport_heliport.taxiholdingposition_tsp.taxiholdingpositiontimeslice_id = TaxiHoldingPositionTimeSliceType.id

;

TaxiHoldingPositionTimeSliceType
CREATE OR REPLACE VIEW taxiholdingpositiontimeslicetype_view AS
SELECT
    jsonb_build_object(
       'landingcategory_value', airport_heliport.taxiholdingposition_ts.landingcategory_value,
       'landingcategory_nilreason', airport_heliport.taxiholdingposition_ts.landingcategory_nilreason,
       'status_value', airport_heliport.taxiholdingposition_ts.status_value,
       'status_nilreason', airport_heliport.taxiholdingposition_ts.status_nilreason,
       'id', airport_heliport.taxiholdingposition_ts.id,
       'xml_id', airport_heliport.taxiholdingposition_ts.xml_id,
       'interpretation', airport_heliport.taxiholdingposition_ts.interpretation,
       'sequence_number', airport_heliport.taxiholdingposition_ts.sequence_number,
       'correction_number', airport_heliport.taxiholdingposition_ts.correction_number,
       'valid_time_begin', airport_heliport.taxiholdingposition_ts.valid_time_begin,
       'valid_time_end', airport_heliport.taxiholdingposition_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.taxiholdingposition_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.taxiholdingposition_ts.feature_lifetime_end
    ) AS taxiholdingpositiontimeslicetype
FROM

-- GuidanceLinePropertyType
LEFT JOIN airport_heliport.taxiholdingposition_ts
ON airport_heliport.taxiholdingposition_ts.associatedguidanceline_id = GuidanceLinePropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.taxiholdingposition_ts
ON airport_heliport.taxiholdingposition_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiholdingposition_ts
ON airport_heliport.taxiholdingposition_ts.abstracttaxiholdingpositionextension_id = AbstractExtensionType.id

-- RunwayPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingposition_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingposition_ts
ON master_join.target_id = RunwayPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingposition_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingposition_ts
ON master_join.target_id = NotePropertyType.id
;

TaxiHoldingPositionType
CREATE OR REPLACE VIEW taxiholdingpositiontype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingposition.id,
       'identifier', airport_heliport.taxiholdingposition.identifier,
       'identifier_code_space', airport_heliport.taxiholdingposition.identifier_code_space,
       'xml_id', airport_heliport.taxiholdingposition.xml_id
    ) AS taxiholdingpositiontype
FROM


-- TaxiHoldingPositionTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiholdingposition.id = master_join.source_id
LEFT JOIN airport_heliport.taxiholdingposition
ON master_join.target_id = TaxiHoldingPositionTimeSlicePropertyType.id
;

TaxiwayContaminationPropertyType
CREATE OR REPLACE VIEW taxiwaycontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaycontamination_pt.id
    ) AS taxiwaycontaminationpropertytype
FROM

-- TaxiwayContaminationType
LEFT JOIN airport_heliport.taxiwaycontamination_pt
ON airport_heliport.taxiwaycontamination_pt.taxiwaycontamination_id = TaxiwayContaminationType.id

;

TaxiwayContaminationType
CREATE OR REPLACE VIEW taxiwaycontaminationtype_view AS
SELECT
    jsonb_build_object(
       'observationTime_value', airport_heliport.taxiwaycontamination.observationTime_value,
       'observationTime_nilreason', airport_heliport.taxiwaycontamination.observationTime_nilreason,
       'nextObservationTime_value', airport_heliport.taxiwaycontamination.nextObservationTime_value,
       'nextObservationTime_nilreason', airport_heliport.taxiwaycontamination.nextObservationTime_nilreason,
       'frictioncoefficient_value', airport_heliport.taxiwaycontamination.frictioncoefficient_value,
       'frictioncoefficient_nilreason', airport_heliport.taxiwaycontamination.frictioncoefficient_nilreason,
       'frictionestimation_value', airport_heliport.taxiwaycontamination.frictionestimation_value,
       'frictionestimation_nilreason', airport_heliport.taxiwaycontamination.frictionestimation_nilreason,
       'frictiondevice_value', airport_heliport.taxiwaycontamination.frictiondevice_value,
       'frictiondevice_nilreason', airport_heliport.taxiwaycontamination.frictiondevice_nilreason,
       'obscuredlights_value', airport_heliport.taxiwaycontamination.obscuredlights_value,
       'obscuredlights_nilreason', airport_heliport.taxiwaycontamination.obscuredlights_nilreason,
       'furtherclearancetime_value', airport_heliport.taxiwaycontamination.furtherclearancetime_value,
       'furtherclearancetime_nilreason', airport_heliport.taxiwaycontamination.furtherclearancetime_nilreason,
       'furthertotalclearance_value', airport_heliport.taxiwaycontamination.furthertotalclearance_value,
       'furthertotalclearance_nilreason', airport_heliport.taxiwaycontamination.furthertotalclearance_nilreason,
       'proportion_value', airport_heliport.taxiwaycontamination.proportion_value,
       'proportion_nilreason', airport_heliport.taxiwaycontamination.proportion_nilreason,
       'depth_value', airport_heliport.taxiwaycontamination.depth_value,
       'depth_uom', airport_heliport.taxiwaycontamination.depth_uom,
       'depth_nilreason', airport_heliport.taxiwaycontamination.depth_nilreason,
       'clearedwidth_value', airport_heliport.taxiwaycontamination.clearedwidth_value,
       'clearedwidth_uom', airport_heliport.taxiwaycontamination.clearedwidth_uom,
       'clearedwidth_nilreason', airport_heliport.taxiwaycontamination.clearedwidth_nilreason,
       'id', airport_heliport.taxiwaycontamination.id,
       'identifier', airport_heliport.taxiwaycontamination.identifier,
       'identifier_code_space', airport_heliport.taxiwaycontamination.identifier_code_space,
       'xml_id', airport_heliport.taxiwaycontamination.xml_id
    ) AS taxiwaycontaminationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaycontamination
ON airport_heliport.taxiwaycontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaycontamination
ON airport_heliport.taxiwaycontamination.abstracttaxiwaycontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaycontamination.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaycontamination
ON master_join.target_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaycontamination.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaycontamination
ON master_join.target_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaycontamination.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaycontamination
ON master_join.target_id = NotePropertyType.id
;

TaxiwayElementPropertyType
CREATE OR REPLACE VIEW taxiwayelementpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwayelement_pt.id,
       'nilReason', airport_heliport.taxiwayelement_pt.nilReason
    ) AS taxiwayelementpropertytype
FROM


;

TaxiwayElementTimeSlicePropertyType
CREATE OR REPLACE VIEW taxiwayelementtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwayelement_tsp.id
    ) AS taxiwayelementtimeslicepropertytype
FROM

-- TaxiwayElementTimeSliceType
LEFT JOIN airport_heliport.taxiwayelement_tsp
ON airport_heliport.taxiwayelement_tsp.taxiwayelementtimeslice_id = TaxiwayElementTimeSliceType.id

;

TaxiwayElementTimeSliceType
CREATE OR REPLACE VIEW taxiwayelementtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'type_value', airport_heliport.taxiwayelement_ts.type_value,
       'type_nilreason', airport_heliport.taxiwayelement_ts.type_nilreason,
       'gradeseparation_value', airport_heliport.taxiwayelement_ts.gradeseparation_value,
       'gradeseparation_nilreason', airport_heliport.taxiwayelement_ts.gradeseparation_nilreason,
       'length_value', airport_heliport.taxiwayelement_ts.length_value,
       'length_uom', airport_heliport.taxiwayelement_ts.length_uom,
       'length_nilreason', airport_heliport.taxiwayelement_ts.length_nilreason,
       'width_value', airport_heliport.taxiwayelement_ts.width_value,
       'width_uom', airport_heliport.taxiwayelement_ts.width_uom,
       'width_nilreason', airport_heliport.taxiwayelement_ts.width_nilreason,
       'id', airport_heliport.taxiwayelement_ts.id,
       'xml_id', airport_heliport.taxiwayelement_ts.xml_id,
       'interpretation', airport_heliport.taxiwayelement_ts.interpretation,
       'sequence_number', airport_heliport.taxiwayelement_ts.sequence_number,
       'correction_number', airport_heliport.taxiwayelement_ts.correction_number,
       'valid_time_begin', airport_heliport.taxiwayelement_ts.valid_time_begin,
       'valid_time_end', airport_heliport.taxiwayelement_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.taxiwayelement_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.taxiwayelement_ts.feature_lifetime_end
    ) AS taxiwayelementtimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.taxiwayelement_ts
ON airport_heliport.taxiwayelement_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- TaxiwayPropertyType
LEFT JOIN airport_heliport.taxiwayelement_ts
ON airport_heliport.taxiwayelement_ts.associatedtaxiway_id = TaxiwayPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.taxiwayelement_ts
ON airport_heliport.taxiwayelement_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwayelement_ts
ON airport_heliport.taxiwayelement_ts.abstracttaxiwayelementextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwayelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwayelement_ts
ON master_join.target_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwayelement_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwayelement_ts
ON master_join.target_id = ManoeuvringAreaAvailabilityPropertyType.id
;

TaxiwayElementType
CREATE OR REPLACE VIEW taxiwayelementtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwayelement.id,
       'identifier', airport_heliport.taxiwayelement.identifier,
       'identifier_code_space', airport_heliport.taxiwayelement.identifier_code_space,
       'xml_id', airport_heliport.taxiwayelement.xml_id
    ) AS taxiwayelementtype
FROM


-- TaxiwayElementTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwayelement.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwayelement
ON master_join.target_id = TaxiwayElementTimeSlicePropertyType.id
;

TaxiwayLightSystemPropertyType
CREATE OR REPLACE VIEW taxiwaylightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaylightsystem_pt.id,
       'nilReason', airport_heliport.taxiwaylightsystem_pt.nilReason
    ) AS taxiwaylightsystempropertytype
FROM


;

TaxiwayLightSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW taxiwaylightsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaylightsystem_tsp.id
    ) AS taxiwaylightsystemtimeslicepropertytype
FROM

-- TaxiwayLightSystemTimeSliceType
LEFT JOIN airport_heliport.taxiwaylightsystem_tsp
ON airport_heliport.taxiwaylightsystem_tsp.taxiwaylightsystemtimeslice_id = TaxiwayLightSystemTimeSliceType.id

;

TaxiwayLightSystemTimeSliceType
CREATE OR REPLACE VIEW taxiwaylightsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.taxiwaylightsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.taxiwaylightsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.taxiwaylightsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.taxiwaylightsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.taxiwaylightsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.taxiwaylightsystem_ts.colour_nilreason,
       'position_value', airport_heliport.taxiwaylightsystem_ts.position_value,
       'position_nilreason', airport_heliport.taxiwaylightsystem_ts.position_nilreason,
       'id', airport_heliport.taxiwaylightsystem_ts.id,
       'xml_id', airport_heliport.taxiwaylightsystem_ts.xml_id,
       'interpretation', airport_heliport.taxiwaylightsystem_ts.interpretation,
       'sequence_number', airport_heliport.taxiwaylightsystem_ts.sequence_number,
       'correction_number', airport_heliport.taxiwaylightsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.taxiwaylightsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.taxiwaylightsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.taxiwaylightsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.taxiwaylightsystem_ts.feature_lifetime_end
    ) AS taxiwaylightsystemtimeslicetype
FROM

-- TaxiwayPropertyType
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON airport_heliport.taxiwaylightsystem_ts.lightedtaxiway_id = TaxiwayPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON airport_heliport.taxiwaylightsystem_ts.abstracttaxiwaylightsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON airport_heliport.taxiwaylightsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaylightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaylightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaylightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON master_join.target_id = NotePropertyType.id
;

TaxiwayLightSystemType
CREATE OR REPLACE VIEW taxiwaylightsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaylightsystem.id,
       'identifier', airport_heliport.taxiwaylightsystem.identifier,
       'identifier_code_space', airport_heliport.taxiwaylightsystem.identifier_code_space,
       'xml_id', airport_heliport.taxiwaylightsystem.xml_id
    ) AS taxiwaylightsystemtype
FROM


-- TaxiwayLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaylightsystem.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaylightsystem
ON master_join.target_id = TaxiwayLightSystemTimeSlicePropertyType.id
;

TaxiwayMarkingPropertyType
CREATE OR REPLACE VIEW taxiwaymarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaymarking_pt.id,
       'nilReason', airport_heliport.taxiwaymarking_pt.nilReason
    ) AS taxiwaymarkingpropertytype
FROM


;

TaxiwayMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW taxiwaymarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaymarking_tsp.id
    ) AS taxiwaymarkingtimeslicepropertytype
FROM

-- TaxiwayMarkingTimeSliceType
LEFT JOIN airport_heliport.taxiwaymarking_tsp
ON airport_heliport.taxiwaymarking_tsp.taxiwaymarkingtimeslice_id = TaxiwayMarkingTimeSliceType.id

;

TaxiwayMarkingTimeSliceType
CREATE OR REPLACE VIEW taxiwaymarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.taxiwaymarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.taxiwaymarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.taxiwaymarking_ts.condition_value,
       'condition_nilreason', airport_heliport.taxiwaymarking_ts.condition_nilreason,
       'markinglocation_value', airport_heliport.taxiwaymarking_ts.markinglocation_value,
       'markinglocation_nilreason', airport_heliport.taxiwaymarking_ts.markinglocation_nilreason,
       'id', airport_heliport.taxiwaymarking_ts.id,
       'xml_id', airport_heliport.taxiwaymarking_ts.xml_id,
       'interpretation', airport_heliport.taxiwaymarking_ts.interpretation,
       'sequence_number', airport_heliport.taxiwaymarking_ts.sequence_number,
       'correction_number', airport_heliport.taxiwaymarking_ts.correction_number,
       'valid_time_begin', airport_heliport.taxiwaymarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.taxiwaymarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.taxiwaymarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.taxiwaymarking_ts.feature_lifetime_end
    ) AS taxiwaymarkingtimeslicetype
FROM

-- TaxiwayPropertyType
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON airport_heliport.taxiwaymarking_ts.markedtaxiway_id = TaxiwayPropertyType.id
-- TaxiwayElementPropertyType
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON airport_heliport.taxiwaymarking_ts.markedelement_id = TaxiwayElementPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON airport_heliport.taxiwaymarking_ts.abstracttaxiwaymarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON airport_heliport.taxiwaymarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaymarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaymarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON master_join.target_id = NotePropertyType.id
;

TaxiwayMarkingType
CREATE OR REPLACE VIEW taxiwaymarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaymarking.id,
       'identifier', airport_heliport.taxiwaymarking.identifier,
       'identifier_code_space', airport_heliport.taxiwaymarking.identifier_code_space,
       'xml_id', airport_heliport.taxiwaymarking.xml_id
    ) AS taxiwaymarkingtype
FROM


-- TaxiwayMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiwaymarking.id = master_join.source_id
LEFT JOIN airport_heliport.taxiwaymarking
ON master_join.target_id = TaxiwayMarkingTimeSlicePropertyType.id
;

TaxiwayPropertyType
CREATE OR REPLACE VIEW taxiwaypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiway_pt.id,
       'nilReason', airport_heliport.taxiway_pt.nilReason
    ) AS taxiwaypropertytype
FROM


;

TaxiwayTimeSlicePropertyType
CREATE OR REPLACE VIEW taxiwaytimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiway_tsp.id
    ) AS taxiwaytimeslicepropertytype
FROM

-- TaxiwayTimeSliceType
LEFT JOIN airport_heliport.taxiway_tsp
ON airport_heliport.taxiway_tsp.taxiwaytimeslice_id = TaxiwayTimeSliceType.id

;

TaxiwayTimeSliceType
CREATE OR REPLACE VIEW taxiwaytimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.taxiway_ts.designator_value,
       'designator_nilreason', airport_heliport.taxiway_ts.designator_nilreason,
       'type_value', airport_heliport.taxiway_ts.type_value,
       'type_nilreason', airport_heliport.taxiway_ts.type_nilreason,
       'abandoned_value', airport_heliport.taxiway_ts.abandoned_value,
       'abandoned_nilreason', airport_heliport.taxiway_ts.abandoned_nilreason,
       'width_value', airport_heliport.taxiway_ts.width_value,
       'width_uom', airport_heliport.taxiway_ts.width_uom,
       'width_nilreason', airport_heliport.taxiway_ts.width_nilreason,
       'widthshoulder_value', airport_heliport.taxiway_ts.widthshoulder_value,
       'widthshoulder_uom', airport_heliport.taxiway_ts.widthshoulder_uom,
       'widthshoulder_nilreason', airport_heliport.taxiway_ts.widthshoulder_nilreason,
       'length_value', airport_heliport.taxiway_ts.length_value,
       'length_uom', airport_heliport.taxiway_ts.length_uom,
       'length_nilreason', airport_heliport.taxiway_ts.length_nilreason,
       'id', airport_heliport.taxiway_ts.id,
       'xml_id', airport_heliport.taxiway_ts.xml_id,
       'interpretation', airport_heliport.taxiway_ts.interpretation,
       'sequence_number', airport_heliport.taxiway_ts.sequence_number,
       'correction_number', airport_heliport.taxiway_ts.correction_number,
       'valid_time_begin', airport_heliport.taxiway_ts.valid_time_begin,
       'valid_time_end', airport_heliport.taxiway_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.taxiway_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.taxiway_ts.feature_lifetime_end
    ) AS taxiwaytimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.taxiway_ts
ON airport_heliport.taxiway_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.taxiway_ts
ON airport_heliport.taxiway_ts.associatedairportheliport_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiway_ts
ON airport_heliport.taxiway_ts.abstracttaxiwayextension_id = AbstractExtensionType.id

-- TaxiwayContaminationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiway_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiway_ts
ON master_join.target_id = TaxiwayContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiway_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiway_ts
ON master_join.target_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiway_ts.id = master_join.source_id
LEFT JOIN airport_heliport.taxiway_ts
ON master_join.target_id = ManoeuvringAreaAvailabilityPropertyType.id
;

TaxiwayType
CREATE OR REPLACE VIEW taxiwaytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiway.id,
       'identifier', airport_heliport.taxiway.identifier,
       'identifier_code_space', airport_heliport.taxiway.identifier_code_space,
       'xml_id', airport_heliport.taxiway.xml_id
    ) AS taxiwaytype
FROM


-- TaxiwayTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.taxiway.id = master_join.source_id
LEFT JOIN airport_heliport.taxiway
ON master_join.target_id = TaxiwayTimeSlicePropertyType.id
;

TelephoneContactPropertyType
CREATE OR REPLACE VIEW telephonecontactpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.telephonecontact_pt.id
    ) AS telephonecontactpropertytype
FROM

-- TelephoneContactType
LEFT JOIN shared.telephonecontact_pt
ON shared.telephonecontact_pt.telephonecontact_id = TelephoneContactType.id

;

TelephoneContactType
CREATE OR REPLACE VIEW telephonecontacttype_view AS
SELECT
    jsonb_build_object(
       'voice_value', shared.telephonecontact.voice_value,
       'voice_nilreason', shared.telephonecontact.voice_nilreason,
       'facsimile_value', shared.telephonecontact.facsimile_value,
       'facsimile_nilreason', shared.telephonecontact.facsimile_nilreason,
       'id', shared.telephonecontact.id,
       'identifier', shared.telephonecontact.identifier,
       'identifier_code_space', shared.telephonecontact.identifier_code_space,
       'xml_id', shared.telephonecontact.xml_id
    ) AS telephonecontacttype
FROM

-- AbstractExtensionType
LEFT JOIN shared.telephonecontact
ON shared.telephonecontact.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.telephonecontact
ON shared.telephonecontact.abstracttelephonecontactextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.master_join
ON shared.telephonecontact.id = master_join.source_id
LEFT JOIN shared.telephonecontact
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.telephonecontact.id = master_join.source_id
LEFT JOIN shared.telephonecontact
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.master_join
ON shared.telephonecontact.id = master_join.source_id
LEFT JOIN shared.telephonecontact
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

TerminalArrivalAreaPropertyType
CREATE OR REPLACE VIEW terminalarrivalareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.terminalarrivalarea_pt.id,
       'nilReason', procedure.terminalarrivalarea_pt.nilReason
    ) AS terminalarrivalareapropertytype
FROM


;

TerminalArrivalAreaSectorPropertyType
CREATE OR REPLACE VIEW terminalarrivalareasectorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.terminalarrivalareasector_pt.id
    ) AS terminalarrivalareasectorpropertytype
FROM

-- TerminalArrivalAreaSectorType
LEFT JOIN procedure.terminalarrivalareasector_pt
ON procedure.terminalarrivalareasector_pt.terminalarrivalareasector_id = TerminalArrivalAreaSectorType.id

;

TerminalArrivalAreaSectorType
CREATE OR REPLACE VIEW terminalarrivalareasectortype_view AS
SELECT
    jsonb_build_object(
       'flybycode_value', procedure.terminalarrivalareasector.flybycode_value,
       'flybycode_nilreason', procedure.terminalarrivalareasector.flybycode_nilreason,
       'procedureturnrequired_value', procedure.terminalarrivalareasector.procedureturnrequired_value,
       'procedureturnrequired_nilreason', procedure.terminalarrivalareasector.procedureturnrequired_nilreason,
       'altitudedescription_value', procedure.terminalarrivalareasector.altitudedescription_value,
       'altitudedescription_nilreason', procedure.terminalarrivalareasector.altitudedescription_nilreason,
       'id', procedure.terminalarrivalareasector.id,
       'identifier', procedure.terminalarrivalareasector.identifier,
       'identifier_code_space', procedure.terminalarrivalareasector.identifier_code_space,
       'xml_id', procedure.terminalarrivalareasector.xml_id
    ) AS terminalarrivalareasectortype
FROM

-- CircleSectorPropertyType
LEFT JOIN procedure.terminalarrivalareasector
ON procedure.terminalarrivalareasector.sectordefinition_id = CircleSectorPropertyType.id
-- SurfacePropertyType
LEFT JOIN procedure.terminalarrivalareasector
ON procedure.terminalarrivalareasector.extent_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.terminalarrivalareasector
ON procedure.terminalarrivalareasector.abstractterminalarrivalareasectorextension_id = AbstractExtensionType.id

-- ObstructionPropertyType
LEFT JOIN procedure.master_join
ON procedure.terminalarrivalareasector.id = master_join.source_id
LEFT JOIN procedure.terminalarrivalareasector
ON master_join.target_id = ObstructionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.terminalarrivalareasector.id = master_join.source_id
LEFT JOIN procedure.terminalarrivalareasector
ON master_join.target_id = NotePropertyType.id
;

TerminalArrivalAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW terminalarrivalareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.terminalarrivalarea_tsp.id
    ) AS terminalarrivalareatimeslicepropertytype
FROM

-- TerminalArrivalAreaTimeSliceType
LEFT JOIN procedure.terminalarrivalarea_tsp
ON procedure.terminalarrivalarea_tsp.terminalarrivalareatimeslice_id = TerminalArrivalAreaTimeSliceType.id

;

TerminalArrivalAreaTimeSliceType
CREATE OR REPLACE VIEW terminalarrivalareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'arrivalareatype_value', procedure.terminalarrivalarea_ts.arrivalareatype_value,
       'arrivalareatype_nilreason', procedure.terminalarrivalarea_ts.arrivalareatype_nilreason,
       'outerbufferwidth_value', procedure.terminalarrivalarea_ts.outerbufferwidth_value,
       'outerbufferwidth_uom', procedure.terminalarrivalarea_ts.outerbufferwidth_uom,
       'outerbufferwidth_nilreason', procedure.terminalarrivalarea_ts.outerbufferwidth_nilreason,
       'lateralbufferwidth_value', procedure.terminalarrivalarea_ts.lateralbufferwidth_value,
       'lateralbufferwidth_uom', procedure.terminalarrivalarea_ts.lateralbufferwidth_uom,
       'lateralbufferwidth_nilreason', procedure.terminalarrivalarea_ts.lateralbufferwidth_nilreason,
       'id', procedure.terminalarrivalarea_ts.id,
       'xml_id', procedure.terminalarrivalarea_ts.xml_id,
       'interpretation', procedure.terminalarrivalarea_ts.interpretation,
       'sequence_number', procedure.terminalarrivalarea_ts.sequence_number,
       'correction_number', procedure.terminalarrivalarea_ts.correction_number,
       'valid_time_begin', procedure.terminalarrivalarea_ts.valid_time_begin,
       'valid_time_end', procedure.terminalarrivalarea_ts.valid_time_end,
       'feature_lifetime_begin', procedure.terminalarrivalarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', procedure.terminalarrivalarea_ts.feature_lifetime_end
    ) AS terminalarrivalareatimeslicetype
FROM

-- DesignatedPointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_position_id = PointPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_position_id = PointPropertyType.id
-- SurfacePropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.buffer_id = SurfacePropertyType.id
-- InstrumentApproachProcedurePropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.approachrnav_id = InstrumentApproachProcedurePropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.abstractterminalarrivalareaextension_id = AbstractExtensionType.id

-- TerminalArrivalAreaSectorPropertyType
LEFT JOIN procedure.master_join
ON procedure.terminalarrivalarea_ts.id = master_join.source_id
LEFT JOIN procedure.terminalarrivalarea_ts
ON master_join.target_id = TerminalArrivalAreaSectorPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.master_join
ON procedure.terminalarrivalarea_ts.id = master_join.source_id
LEFT JOIN procedure.terminalarrivalarea_ts
ON master_join.target_id = NotePropertyType.id
;

TerminalArrivalAreaType
CREATE OR REPLACE VIEW terminalarrivalareatype_view AS
SELECT
    jsonb_build_object(
       'id', procedure.terminalarrivalarea.id,
       'identifier', procedure.terminalarrivalarea.identifier,
       'identifier_code_space', procedure.terminalarrivalarea.identifier_code_space,
       'xml_id', procedure.terminalarrivalarea.xml_id
    ) AS terminalarrivalareatype
FROM


-- TerminalArrivalAreaTimeSlicePropertyType
LEFT JOIN procedure.master_join
ON procedure.terminalarrivalarea.id = master_join.source_id
LEFT JOIN procedure.terminalarrivalarea
ON master_join.target_id = TerminalArrivalAreaTimeSlicePropertyType.id
;

TerminalSegmentPointPropertyType
CREATE OR REPLACE VIEW terminalsegmentpointpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.terminalsegmentpoint_pt.id
    ) AS terminalsegmentpointpropertytype
FROM

-- TerminalSegmentPointType
LEFT JOIN navaids_points.terminalsegmentpoint_pt
ON navaids_points.terminalsegmentpoint_pt.terminalsegmentpoint_id = TerminalSegmentPointType.id

;

TerminalSegmentPointType
CREATE OR REPLACE VIEW terminalsegmentpointtype_view AS
SELECT
    jsonb_build_object(
       'reportingatc_value', navaids_points.terminalsegmentpoint.reportingatc_value,
       'reportingatc_nilreason', navaids_points.terminalsegmentpoint.reportingatc_nilreason,
       'flyover_value', navaids_points.terminalsegmentpoint.flyover_value,
       'flyover_nilreason', navaids_points.terminalsegmentpoint.flyover_nilreason,
       'waypoint_value', navaids_points.terminalsegmentpoint.waypoint_value,
       'waypoint_nilreason', navaids_points.terminalsegmentpoint.waypoint_nilreason,
       'radarguidance_value', navaids_points.terminalsegmentpoint.radarguidance_value,
       'radarguidance_nilreason', navaids_points.terminalsegmentpoint.radarguidance_nilreason,
       'role_value', navaids_points.terminalsegmentpoint.role_value,
       'role_nilreason', navaids_points.terminalsegmentpoint.role_nilreason,
       'leadradial_value', navaids_points.terminalsegmentpoint.leadradial_value,
       'leadradial_nilreason', navaids_points.terminalsegmentpoint.leadradial_nilreason,
       'indicatorfacf_value', navaids_points.terminalsegmentpoint.indicatorfacf_value,
       'indicatorfacf_nilreason', navaids_points.terminalsegmentpoint.indicatorfacf_nilreason,
       'leaddme_value', navaids_points.terminalsegmentpoint.leaddme_value,
       'leaddme_uom', navaids_points.terminalsegmentpoint.leaddme_uom,
       'leaddme_nilreason', navaids_points.terminalsegmentpoint.leaddme_nilreason,
       'id', navaids_points.terminalsegmentpoint.id,
       'identifier', navaids_points.terminalsegmentpoint.identifier,
       'identifier_code_space', navaids_points.terminalsegmentpoint.identifier_code_space,
       'xml_id', navaids_points.terminalsegmentpoint.xml_id
    ) AS terminalsegmentpointtype
FROM

-- DesignatedPointPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_navaidsystem_id = NavaidPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_position_id = PointPropertyType.id
-- RadioFrequencyAreaPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.extendedservicevolume_id = RadioFrequencyAreaPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.abstractsegmentpointextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.abstractterminalsegmentpointextension_id = AbstractExtensionType.id

-- PointReferencePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.terminalsegmentpoint.id = master_join.source_id
LEFT JOIN navaids_points.terminalsegmentpoint
ON master_join.target_id = PointReferencePropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.terminalsegmentpoint.id = master_join.source_id
LEFT JOIN navaids_points.terminalsegmentpoint
ON master_join.target_id = NotePropertyType.id
;

TimesheetPropertyType
CREATE OR REPLACE VIEW timesheetpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', shared.timesheet_pt.id
    ) AS timesheetpropertytype
FROM

-- TimesheetType
LEFT JOIN shared.timesheet_pt
ON shared.timesheet_pt.timesheet_id = TimesheetType.id

;

TimesheetType
CREATE OR REPLACE VIEW timesheettype_view AS
SELECT
    jsonb_build_object(
       'timereference_value', shared.timesheet.timereference_value,
       'timereference_nilreason', shared.timesheet.timereference_nilreason,
       'startdate_value', shared.timesheet.startdate_value,
       'startdate_nilreason', shared.timesheet.startdate_nilreason,
       'enddate_value', shared.timesheet.enddate_value,
       'enddate_nilreason', shared.timesheet.enddate_nilreason,
       'day_value', shared.timesheet.day_value,
       'day_nilreason', shared.timesheet.day_nilreason,
       'daytil_value', shared.timesheet.daytil_value,
       'daytil_nilreason', shared.timesheet.daytil_nilreason,
       'starttime_value', shared.timesheet.starttime_value,
       'starttime_nilreason', shared.timesheet.starttime_nilreason,
       'startevent_value', shared.timesheet.startevent_value,
       'startevent_nilreason', shared.timesheet.startevent_nilreason,
       'starteventinterpretation_value', shared.timesheet.starteventinterpretation_value,
       'starteventinterpretation_nilreason', shared.timesheet.starteventinterpretation_nilreason,
       'endtime_value', shared.timesheet.endtime_value,
       'endtime_nilreason', shared.timesheet.endtime_nilreason,
       'endevent_value', shared.timesheet.endevent_value,
       'endevent_nilreason', shared.timesheet.endevent_nilreason,
       'endeventinterpretation_value', shared.timesheet.endeventinterpretation_value,
       'endeventinterpretation_nilreason', shared.timesheet.endeventinterpretation_nilreason,
       'daylightsavingadjust_value', shared.timesheet.daylightsavingadjust_value,
       'daylightsavingadjust_nilreason', shared.timesheet.daylightsavingadjust_nilreason,
       'excluded_value', shared.timesheet.excluded_value,
       'excluded_nilreason', shared.timesheet.excluded_nilreason,
       'starttimerelativeevent_value', shared.timesheet.starttimerelativeevent_value,
       'starttimerelativeevent_uom', shared.timesheet.starttimerelativeevent_uom,
       'starttimerelativeevent_nilreason', shared.timesheet.starttimerelativeevent_nilreason,
       'endtimerelativeevent_value', shared.timesheet.endtimerelativeevent_value,
       'endtimerelativeevent_uom', shared.timesheet.endtimerelativeevent_uom,
       'endtimerelativeevent_nilreason', shared.timesheet.endtimerelativeevent_nilreason,
       'id', shared.timesheet.id,
       'identifier', shared.timesheet.identifier,
       'identifier_code_space', shared.timesheet.identifier_code_space,
       'xml_id', shared.timesheet.xml_id
    ) AS timesheettype
FROM

-- AbstractExtensionType
LEFT JOIN shared.timesheet
ON shared.timesheet.abstracttimesheetextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.master_join
ON shared.timesheet.id = master_join.source_id
LEFT JOIN shared.timesheet
ON master_join.target_id = NotePropertyType.id
;

TouchDownLiftOffContaminationPropertyType
CREATE OR REPLACE VIEW touchdownliftoffcontaminationpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffcontamination_pt.id
    ) AS touchdownliftoffcontaminationpropertytype
FROM

-- TouchDownLiftOffContaminationType
LEFT JOIN airport_heliport.touchdownliftoffcontamination_pt
ON airport_heliport.touchdownliftoffcontamination_pt.touchdownliftoffcontamination_id = TouchDownLiftOffContaminationType.id

;

TouchDownLiftOffContaminationType
CREATE OR REPLACE VIEW touchdownliftoffcontaminationtype_view AS
SELECT
    jsonb_build_object(
       'observationTime_value', airport_heliport.touchdownliftoffcontamination.observationTime_value,
       'observationTime_nilreason', airport_heliport.touchdownliftoffcontamination.observationTime_nilreason,
       'nextObservationTime_value', airport_heliport.touchdownliftoffcontamination.nextObservationTime_value,
       'nextObservationTime_nilreason', airport_heliport.touchdownliftoffcontamination.nextObservationTime_nilreason,
       'frictioncoefficient_value', airport_heliport.touchdownliftoffcontamination.frictioncoefficient_value,
       'frictioncoefficient_nilreason', airport_heliport.touchdownliftoffcontamination.frictioncoefficient_nilreason,
       'frictionestimation_value', airport_heliport.touchdownliftoffcontamination.frictionestimation_value,
       'frictionestimation_nilreason', airport_heliport.touchdownliftoffcontamination.frictionestimation_nilreason,
       'frictiondevice_value', airport_heliport.touchdownliftoffcontamination.frictiondevice_value,
       'frictiondevice_nilreason', airport_heliport.touchdownliftoffcontamination.frictiondevice_nilreason,
       'obscuredlights_value', airport_heliport.touchdownliftoffcontamination.obscuredlights_value,
       'obscuredlights_nilreason', airport_heliport.touchdownliftoffcontamination.obscuredlights_nilreason,
       'furtherclearancetime_value', airport_heliport.touchdownliftoffcontamination.furtherclearancetime_value,
       'furtherclearancetime_nilreason', airport_heliport.touchdownliftoffcontamination.furtherclearancetime_nilreason,
       'furthertotalclearance_value', airport_heliport.touchdownliftoffcontamination.furthertotalclearance_value,
       'furthertotalclearance_nilreason', airport_heliport.touchdownliftoffcontamination.furthertotalclearance_nilreason,
       'proportion_value', airport_heliport.touchdownliftoffcontamination.proportion_value,
       'proportion_nilreason', airport_heliport.touchdownliftoffcontamination.proportion_nilreason,
       'depth_value', airport_heliport.touchdownliftoffcontamination.depth_value,
       'depth_uom', airport_heliport.touchdownliftoffcontamination.depth_uom,
       'depth_nilreason', airport_heliport.touchdownliftoffcontamination.depth_nilreason,
       'id', airport_heliport.touchdownliftoffcontamination.id,
       'identifier', airport_heliport.touchdownliftoffcontamination.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoffcontamination.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoffcontamination.xml_id
    ) AS touchdownliftoffcontaminationtype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON airport_heliport.touchdownliftoffcontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON airport_heliport.touchdownliftoffcontamination.abstracttouchdownliftoffcontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON master_join.target_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON master_join.target_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffcontamination.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON master_join.target_id = NotePropertyType.id
;

TouchDownLiftOffLightSystemPropertyType
CREATE OR REPLACE VIEW touchdownliftofflightsystempropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftofflightsystem_pt.id,
       'nilReason', airport_heliport.touchdownliftofflightsystem_pt.nilReason
    ) AS touchdownliftofflightsystempropertytype
FROM


;

TouchDownLiftOffLightSystemTimeSlicePropertyType
CREATE OR REPLACE VIEW touchdownliftofflightsystemtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftofflightsystem_tsp.id
    ) AS touchdownliftofflightsystemtimeslicepropertytype
FROM

-- TouchDownLiftOffLightSystemTimeSliceType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_tsp
ON airport_heliport.touchdownliftofflightsystem_tsp.touchdownliftofflightsystemtimeslice_id = TouchDownLiftOffLightSystemTimeSliceType.id

;

TouchDownLiftOffLightSystemTimeSliceType
CREATE OR REPLACE VIEW touchdownliftofflightsystemtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.touchdownliftofflightsystem_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.touchdownliftofflightsystem_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.touchdownliftofflightsystem_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.touchdownliftofflightsystem_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.touchdownliftofflightsystem_ts.colour_value,
       'colour_nilreason', airport_heliport.touchdownliftofflightsystem_ts.colour_nilreason,
       'position_value', airport_heliport.touchdownliftofflightsystem_ts.position_value,
       'position_nilreason', airport_heliport.touchdownliftofflightsystem_ts.position_nilreason,
       'id', airport_heliport.touchdownliftofflightsystem_ts.id,
       'xml_id', airport_heliport.touchdownliftofflightsystem_ts.xml_id,
       'interpretation', airport_heliport.touchdownliftofflightsystem_ts.interpretation,
       'sequence_number', airport_heliport.touchdownliftofflightsystem_ts.sequence_number,
       'correction_number', airport_heliport.touchdownliftofflightsystem_ts.correction_number,
       'valid_time_begin', airport_heliport.touchdownliftofflightsystem_ts.valid_time_begin,
       'valid_time_end', airport_heliport.touchdownliftofflightsystem_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.touchdownliftofflightsystem_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.touchdownliftofflightsystem_ts.feature_lifetime_end
    ) AS touchdownliftofflightsystemtimeslicetype
FROM

-- TouchDownLiftOffPropertyType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON airport_heliport.touchdownliftofflightsystem_ts.lightedtouchdownliftoff_id = TouchDownLiftOffPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON airport_heliport.touchdownliftofflightsystem_ts.abstracttouchdownliftofflightsystemextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON airport_heliport.touchdownliftofflightsystem_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftofflightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftofflightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftofflightsystem_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON master_join.target_id = NotePropertyType.id
;

TouchDownLiftOffLightSystemType
CREATE OR REPLACE VIEW touchdownliftofflightsystemtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftofflightsystem.id,
       'identifier', airport_heliport.touchdownliftofflightsystem.identifier,
       'identifier_code_space', airport_heliport.touchdownliftofflightsystem.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftofflightsystem.xml_id
    ) AS touchdownliftofflightsystemtype
FROM


-- TouchDownLiftOffLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftofflightsystem.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem
ON master_join.target_id = TouchDownLiftOffLightSystemTimeSlicePropertyType.id
;

TouchDownLiftOffMarkingPropertyType
CREATE OR REPLACE VIEW touchdownliftoffmarkingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffmarking_pt.id,
       'nilReason', airport_heliport.touchdownliftoffmarking_pt.nilReason
    ) AS touchdownliftoffmarkingpropertytype
FROM


;

TouchDownLiftOffMarkingTimeSlicePropertyType
CREATE OR REPLACE VIEW touchdownliftoffmarkingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffmarking_tsp.id
    ) AS touchdownliftoffmarkingtimeslicepropertytype
FROM

-- TouchDownLiftOffMarkingTimeSliceType
LEFT JOIN airport_heliport.touchdownliftoffmarking_tsp
ON airport_heliport.touchdownliftoffmarking_tsp.touchdownliftoffmarkingtimeslice_id = TouchDownLiftOffMarkingTimeSliceType.id

;

TouchDownLiftOffMarkingTimeSliceType
CREATE OR REPLACE VIEW touchdownliftoffmarkingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'markingicaostandard_value', airport_heliport.touchdownliftoffmarking_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', airport_heliport.touchdownliftoffmarking_ts.markingicaostandard_nilreason,
       'condition_value', airport_heliport.touchdownliftoffmarking_ts.condition_value,
       'condition_nilreason', airport_heliport.touchdownliftoffmarking_ts.condition_nilreason,
       'markinglocation_value', airport_heliport.touchdownliftoffmarking_ts.markinglocation_value,
       'markinglocation_nilreason', airport_heliport.touchdownliftoffmarking_ts.markinglocation_nilreason,
       'id', airport_heliport.touchdownliftoffmarking_ts.id,
       'xml_id', airport_heliport.touchdownliftoffmarking_ts.xml_id,
       'interpretation', airport_heliport.touchdownliftoffmarking_ts.interpretation,
       'sequence_number', airport_heliport.touchdownliftoffmarking_ts.sequence_number,
       'correction_number', airport_heliport.touchdownliftoffmarking_ts.correction_number,
       'valid_time_begin', airport_heliport.touchdownliftoffmarking_ts.valid_time_begin,
       'valid_time_end', airport_heliport.touchdownliftoffmarking_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.touchdownliftoffmarking_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.touchdownliftoffmarking_ts.feature_lifetime_end
    ) AS touchdownliftoffmarkingtimeslicetype
FROM

-- TouchDownLiftOffPropertyType
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts
ON airport_heliport.touchdownliftoffmarking_ts.markedtouchdownliftoff_id = TouchDownLiftOffPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts
ON airport_heliport.touchdownliftoffmarking_ts.abstracttouchdownliftoffmarkingextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts
ON airport_heliport.touchdownliftoffmarking_ts.abstractmarkingextension_id = AbstractExtensionType.id

-- MarkingElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts
ON master_join.target_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffmarking_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts
ON master_join.target_id = NotePropertyType.id
;

TouchDownLiftOffMarkingType
CREATE OR REPLACE VIEW touchdownliftoffmarkingtype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffmarking.id,
       'identifier', airport_heliport.touchdownliftoffmarking.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoffmarking.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoffmarking.xml_id
    ) AS touchdownliftoffmarkingtype
FROM


-- TouchDownLiftOffMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffmarking.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffmarking
ON master_join.target_id = TouchDownLiftOffMarkingTimeSlicePropertyType.id
;

TouchDownLiftOffPropertyType
CREATE OR REPLACE VIEW touchdownliftoffpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoff_pt.id,
       'nilReason', airport_heliport.touchdownliftoff_pt.nilReason
    ) AS touchdownliftoffpropertytype
FROM


;

TouchDownLiftOffSafeAreaPropertyType
CREATE OR REPLACE VIEW touchdownliftoffsafeareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffsafearea_pt.id,
       'nilReason', airport_heliport.touchdownliftoffsafearea_pt.nilReason
    ) AS touchdownliftoffsafeareapropertytype
FROM


;

TouchDownLiftOffSafeAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW touchdownliftoffsafeareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffsafearea_tsp.id
    ) AS touchdownliftoffsafeareatimeslicepropertytype
FROM

-- TouchDownLiftOffSafeAreaTimeSliceType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_tsp
ON airport_heliport.touchdownliftoffsafearea_tsp.touchdownliftoffsafeareatimeslice_id = TouchDownLiftOffSafeAreaTimeSliceType.id

;

TouchDownLiftOffSafeAreaTimeSliceType
CREATE OR REPLACE VIEW touchdownliftoffsafeareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'lighting_value', airport_heliport.touchdownliftoffsafearea_ts.lighting_value,
       'lighting_nilreason', airport_heliport.touchdownliftoffsafearea_ts.lighting_nilreason,
       'obstaclefree_value', airport_heliport.touchdownliftoffsafearea_ts.obstaclefree_value,
       'obstaclefree_nilreason', airport_heliport.touchdownliftoffsafearea_ts.obstaclefree_nilreason,
       'width_value', airport_heliport.touchdownliftoffsafearea_ts.width_value,
       'width_uom', airport_heliport.touchdownliftoffsafearea_ts.width_uom,
       'width_nilreason', airport_heliport.touchdownliftoffsafearea_ts.width_nilreason,
       'length_value', airport_heliport.touchdownliftoffsafearea_ts.length_value,
       'length_uom', airport_heliport.touchdownliftoffsafearea_ts.length_uom,
       'length_nilreason', airport_heliport.touchdownliftoffsafearea_ts.length_nilreason,
       'id', airport_heliport.touchdownliftoffsafearea_ts.id,
       'xml_id', airport_heliport.touchdownliftoffsafearea_ts.xml_id,
       'interpretation', airport_heliport.touchdownliftoffsafearea_ts.interpretation,
       'sequence_number', airport_heliport.touchdownliftoffsafearea_ts.sequence_number,
       'correction_number', airport_heliport.touchdownliftoffsafearea_ts.correction_number,
       'valid_time_begin', airport_heliport.touchdownliftoffsafearea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.touchdownliftoffsafearea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.touchdownliftoffsafearea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.touchdownliftoffsafearea_ts.feature_lifetime_end
    ) AS touchdownliftoffsafeareatimeslicetype
FROM

-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts
ON airport_heliport.touchdownliftoffsafearea_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts
ON airport_heliport.touchdownliftoffsafearea_ts.extent_id = ElevatedSurfacePropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts
ON airport_heliport.touchdownliftoffsafearea_ts.protectedtouchdownliftoff_id = TouchDownLiftOffPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts
ON airport_heliport.touchdownliftoffsafearea_ts.abstracttouchdownliftoffsafeareaextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts
ON airport_heliport.touchdownliftoffsafearea_ts.abstractairportheliportprotectionareaextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffsafearea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts
ON master_join.target_id = NotePropertyType.id
;

TouchDownLiftOffSafeAreaType
CREATE OR REPLACE VIEW touchdownliftoffsafeareatype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffsafearea.id,
       'identifier', airport_heliport.touchdownliftoffsafearea.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoffsafearea.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoffsafearea.xml_id
    ) AS touchdownliftoffsafeareatype
FROM


-- TouchDownLiftOffSafeAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoffsafearea.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoffsafearea
ON master_join.target_id = TouchDownLiftOffSafeAreaTimeSlicePropertyType.id
;

TouchDownLiftOffTimeSlicePropertyType
CREATE OR REPLACE VIEW touchdownliftofftimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoff_tsp.id
    ) AS touchdownliftofftimeslicepropertytype
FROM

-- TouchDownLiftOffTimeSliceType
LEFT JOIN airport_heliport.touchdownliftoff_tsp
ON airport_heliport.touchdownliftoff_tsp.touchdownliftofftimeslice_id = TouchDownLiftOffTimeSliceType.id

;

TouchDownLiftOffTimeSliceType
CREATE OR REPLACE VIEW touchdownliftofftimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', airport_heliport.touchdownliftoff_ts.designator_value,
       'designator_nilreason', airport_heliport.touchdownliftoff_ts.designator_nilreason,
       'slope_value', airport_heliport.touchdownliftoff_ts.slope_value,
       'slope_nilreason', airport_heliport.touchdownliftoff_ts.slope_nilreason,
       'helicopterclass_value', airport_heliport.touchdownliftoff_ts.helicopterclass_value,
       'helicopterclass_nilreason', airport_heliport.touchdownliftoff_ts.helicopterclass_nilreason,
       'abandoned_value', airport_heliport.touchdownliftoff_ts.abandoned_value,
       'abandoned_nilreason', airport_heliport.touchdownliftoff_ts.abandoned_nilreason,
       'length_value', airport_heliport.touchdownliftoff_ts.length_value,
       'length_uom', airport_heliport.touchdownliftoff_ts.length_uom,
       'length_nilreason', airport_heliport.touchdownliftoff_ts.length_nilreason,
       'width_value', airport_heliport.touchdownliftoff_ts.width_value,
       'width_uom', airport_heliport.touchdownliftoff_ts.width_uom,
       'width_nilreason', airport_heliport.touchdownliftoff_ts.width_nilreason,
       'id', airport_heliport.touchdownliftoff_ts.id,
       'xml_id', airport_heliport.touchdownliftoff_ts.xml_id,
       'interpretation', airport_heliport.touchdownliftoff_ts.interpretation,
       'sequence_number', airport_heliport.touchdownliftoff_ts.sequence_number,
       'correction_number', airport_heliport.touchdownliftoff_ts.correction_number,
       'valid_time_begin', airport_heliport.touchdownliftoff_ts.valid_time_begin,
       'valid_time_end', airport_heliport.touchdownliftoff_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.touchdownliftoff_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.touchdownliftoff_ts.feature_lifetime_end
    ) AS touchdownliftofftimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON airport_heliport.touchdownliftoff_ts.aimingpoint_id = ElevatedPointPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON airport_heliport.touchdownliftoff_ts.extent_id = ElevatedSurfacePropertyType.id
-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON airport_heliport.touchdownliftoff_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON airport_heliport.touchdownliftoff_ts.associatedairportheliport_id = AirportHeliportPropertyType.id
-- RunwayPropertyType
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON airport_heliport.touchdownliftoff_ts.approachtakeoffarea_id = RunwayPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON airport_heliport.touchdownliftoff_ts.abstracttouchdownliftoffextension_id = AbstractExtensionType.id

-- TouchDownLiftOffContaminationPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoff_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON master_join.target_id = TouchDownLiftOffContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoff_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON master_join.target_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoff_ts.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON master_join.target_id = ManoeuvringAreaAvailabilityPropertyType.id
;

TouchDownLiftOffType
CREATE OR REPLACE VIEW touchdownliftofftype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoff.id,
       'identifier', airport_heliport.touchdownliftoff.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoff.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoff.xml_id
    ) AS touchdownliftofftype
FROM


-- TouchDownLiftOffTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.touchdownliftoff.id = master_join.source_id
LEFT JOIN airport_heliport.touchdownliftoff
ON master_join.target_id = TouchDownLiftOffTimeSlicePropertyType.id
;

TrafficSeparationServicePropertyType
CREATE OR REPLACE VIEW trafficseparationservicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', service.trafficseparationservice_pt.id,
       'nilReason', service.trafficseparationservice_pt.nilReason
    ) AS trafficseparationservicepropertytype
FROM


;

UnitAvailabilityPropertyType
CREATE OR REPLACE VIEW unitavailabilitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unitavailability_pt.id
    ) AS unitavailabilitypropertytype
FROM

-- UnitAvailabilityType
LEFT JOIN organisation.unitavailability_pt
ON organisation.unitavailability_pt.unitavailability_id = UnitAvailabilityType.id

;

UnitAvailabilityType
CREATE OR REPLACE VIEW unitavailabilitytype_view AS
SELECT
    jsonb_build_object(
       'operationalstatus_value', organisation.unitavailability.operationalstatus_value,
       'operationalstatus_nilreason', organisation.unitavailability.operationalstatus_nilreason,
       'id', organisation.unitavailability.id,
       'identifier', organisation.unitavailability.identifier,
       'identifier_code_space', organisation.unitavailability.identifier_code_space,
       'xml_id', organisation.unitavailability.xml_id
    ) AS unitavailabilitytype
FROM

-- AbstractExtensionType
LEFT JOIN organisation.unitavailability
ON organisation.unitavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN organisation.unitavailability
ON organisation.unitavailability.abstractunitavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN organisation.master_join
ON organisation.unitavailability.id = master_join.source_id
LEFT JOIN organisation.unitavailability
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN organisation.master_join
ON organisation.unitavailability.id = master_join.source_id
LEFT JOIN organisation.unitavailability
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN organisation.master_join
ON organisation.unitavailability.id = master_join.source_id
LEFT JOIN organisation.unitavailability
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

UnitDependencyPropertyType
CREATE OR REPLACE VIEW unitdependencypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unitdependency_pt.id
    ) AS unitdependencypropertytype
FROM

-- UnitDependencyType
LEFT JOIN organisation.unitdependency_pt
ON organisation.unitdependency_pt.unitdependency_id = UnitDependencyType.id

;

UnitDependencyType
CREATE OR REPLACE VIEW unitdependencytype_view AS
SELECT
    jsonb_build_object(
       'type_value', organisation.unitdependency.type_value,
       'type_nilreason', organisation.unitdependency.type_nilreason,
       'id', organisation.unitdependency.id,
       'identifier', organisation.unitdependency.identifier,
       'identifier_code_space', organisation.unitdependency.identifier_code_space,
       'xml_id', organisation.unitdependency.xml_id
    ) AS unitdependencytype
FROM

-- UnitPropertyType
LEFT JOIN organisation.unitdependency
ON organisation.unitdependency.theunit_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN organisation.unitdependency
ON organisation.unitdependency.abstractunitdependencyextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN organisation.master_join
ON organisation.unitdependency.id = master_join.source_id
LEFT JOIN organisation.unitdependency
ON master_join.target_id = NotePropertyType.id
;

UnitPropertyType
CREATE OR REPLACE VIEW unitpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unit_pt.id,
       'nilReason', organisation.unit_pt.nilReason
    ) AS unitpropertytype
FROM


;

UnitTimeSlicePropertyType
CREATE OR REPLACE VIEW unittimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unit_tsp.id
    ) AS unittimeslicepropertytype
FROM

-- UnitTimeSliceType
LEFT JOIN organisation.unit_tsp
ON organisation.unit_tsp.unittimeslice_id = UnitTimeSliceType.id

;

UnitTimeSliceType
CREATE OR REPLACE VIEW unittimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', organisation.unit_ts.name_value,
       'name_nilreason', organisation.unit_ts.name_nilreason,
       'type_value', organisation.unit_ts.type_value,
       'type_nilreason', organisation.unit_ts.type_nilreason,
       'complianticao_value', organisation.unit_ts.complianticao_value,
       'complianticao_nilreason', organisation.unit_ts.complianticao_nilreason,
       'designator_value', organisation.unit_ts.designator_value,
       'designator_nilreason', organisation.unit_ts.designator_nilreason,
       'military_value', organisation.unit_ts.military_value,
       'military_nilreason', organisation.unit_ts.military_nilreason,
       'id', organisation.unit_ts.id,
       'xml_id', organisation.unit_ts.xml_id,
       'interpretation', organisation.unit_ts.interpretation,
       'sequence_number', organisation.unit_ts.sequence_number,
       'correction_number', organisation.unit_ts.correction_number,
       'valid_time_begin', organisation.unit_ts.valid_time_begin,
       'valid_time_end', organisation.unit_ts.valid_time_end,
       'feature_lifetime_begin', organisation.unit_ts.feature_lifetime_begin,
       'feature_lifetime_end', organisation.unit_ts.feature_lifetime_end
    ) AS unittimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN organisation.unit_ts
ON organisation.unit_ts.position_id = ElevatedPointPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN organisation.unit_ts
ON organisation.unit_ts.airportlocation_id = AirportHeliportPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN organisation.unit_ts
ON organisation.unit_ts.ownerorganisation_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN organisation.unit_ts
ON organisation.unit_ts.abstractunitextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN organisation.master_join
ON organisation.unit_ts.id = master_join.source_id
LEFT JOIN organisation.unit_ts
ON master_join.target_id = ContactInformationPropertyType.id
-- UnitDependencyPropertyType
LEFT JOIN organisation.master_join
ON organisation.unit_ts.id = master_join.source_id
LEFT JOIN organisation.unit_ts
ON master_join.target_id = UnitDependencyPropertyType.id
-- UnitAvailabilityPropertyType
LEFT JOIN organisation.master_join
ON organisation.unit_ts.id = master_join.source_id
LEFT JOIN organisation.unit_ts
ON master_join.target_id = UnitAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN organisation.master_join
ON organisation.unit_ts.id = master_join.source_id
LEFT JOIN organisation.unit_ts
ON master_join.target_id = NotePropertyType.id
;

UnitType
CREATE OR REPLACE VIEW unittype_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unit.id,
       'identifier', organisation.unit.identifier,
       'identifier_code_space', organisation.unit.identifier_code_space,
       'xml_id', organisation.unit.xml_id
    ) AS unittype
FROM


-- UnitTimeSlicePropertyType
LEFT JOIN organisation.master_join
ON organisation.unit.id = master_join.source_id
LEFT JOIN organisation.unit
ON master_join.target_id = UnitTimeSlicePropertyType.id
;

UnplannedHoldingPropertyType
CREATE OR REPLACE VIEW unplannedholdingpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', holding.unplannedholding_pt.id,
       'nilReason', holding.unplannedholding_pt.nilReason
    ) AS unplannedholdingpropertytype
FROM


;

UnplannedHoldingTimeSlicePropertyType
CREATE OR REPLACE VIEW unplannedholdingtimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', holding.unplannedholding_tsp.id
    ) AS unplannedholdingtimeslicepropertytype
FROM

-- UnplannedHoldingTimeSliceType
LEFT JOIN holding.unplannedholding_tsp
ON holding.unplannedholding_tsp.unplannedholdingtimeslice_id = UnplannedHoldingTimeSliceType.id

;

UnplannedHoldingTimeSliceType
CREATE OR REPLACE VIEW unplannedholdingtimeslicetype_view AS
SELECT
    jsonb_build_object(
       'unplannedholding_value', holding.unplannedholding_ts.unplannedholding_value,
       'unplannedholding_nilreason', holding.unplannedholding_ts.unplannedholding_nilreason,
       'altitudereference_value', holding.unplannedholding_ts.altitudereference_value,
       'altitudereference_nilreason', holding.unplannedholding_ts.altitudereference_nilreason,
       'controlledairspace_value', holding.unplannedholding_ts.controlledairspace_value,
       'controlledairspace_nilreason', holding.unplannedholding_ts.controlledairspace_nilreason,
       'authorizedaltitude_value', holding.unplannedholding_ts.authorizedaltitude_value,
       'authorizedaltitude_uom', holding.unplannedholding_ts.authorizedaltitude_uom,
       'authorizedaltitude_nilreason', holding.unplannedholding_ts.authorizedaltitude_nilreason,
       'id', holding.unplannedholding_ts.id,
       'xml_id', holding.unplannedholding_ts.xml_id,
       'interpretation', holding.unplannedholding_ts.interpretation,
       'sequence_number', holding.unplannedholding_ts.sequence_number,
       'correction_number', holding.unplannedholding_ts.correction_number,
       'valid_time_begin', holding.unplannedholding_ts.valid_time_begin,
       'valid_time_end', holding.unplannedholding_ts.valid_time_end,
       'feature_lifetime_begin', holding.unplannedholding_ts.feature_lifetime_begin,
       'feature_lifetime_end', holding.unplannedholding_ts.feature_lifetime_end
    ) AS unplannedholdingtimeslicetype
FROM

-- SegmentPointPropertyType
LEFT JOIN holding.unplannedholding_ts
ON holding.unplannedholding_ts.holdingpoint_id = SegmentPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN holding.unplannedholding_ts
ON holding.unplannedholding_ts.abstractunplannedholdingextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN holding.master_join
ON holding.unplannedholding_ts.id = master_join.source_id
LEFT JOIN holding.unplannedholding_ts
ON master_join.target_id = NotePropertyType.id
;

UnplannedHoldingType
CREATE OR REPLACE VIEW unplannedholdingtype_view AS
SELECT
    jsonb_build_object(
       'id', holding.unplannedholding.id,
       'identifier', holding.unplannedholding.identifier,
       'identifier_code_space', holding.unplannedholding.identifier_code_space,
       'xml_id', holding.unplannedholding.xml_id
    ) AS unplannedholdingtype
FROM


-- UnplannedHoldingTimeSlicePropertyType
LEFT JOIN holding.master_join
ON holding.unplannedholding.id = master_join.source_id
LEFT JOIN holding.unplannedholding
ON master_join.target_id = UnplannedHoldingTimeSlicePropertyType.id
;

UsageConditionPropertyType
CREATE OR REPLACE VIEW usageconditionpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.usagecondition_pt.id
    ) AS usageconditionpropertytype
FROM


;

VerticalStructureLightingStatusPropertyType
CREATE OR REPLACE VIEW verticalstructurelightingstatuspropertytype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructurelightingstatus_pt.id
    ) AS verticalstructurelightingstatuspropertytype
FROM

-- VerticalStructureLightingStatusType
LEFT JOIN obstacles.verticalstructurelightingstatus_pt
ON obstacles.verticalstructurelightingstatus_pt.verticalstructurelightingstatus_id = VerticalStructureLightingStatusType.id

;

VerticalStructureLightingStatusType
CREATE OR REPLACE VIEW verticalstructurelightingstatustype_view AS
SELECT
    jsonb_build_object(
       'status_value', obstacles.verticalstructurelightingstatus.status_value,
       'status_nilreason', obstacles.verticalstructurelightingstatus.status_nilreason,
       'id', obstacles.verticalstructurelightingstatus.id,
       'identifier', obstacles.verticalstructurelightingstatus.identifier,
       'identifier_code_space', obstacles.verticalstructurelightingstatus.identifier_code_space,
       'xml_id', obstacles.verticalstructurelightingstatus.xml_id
    ) AS verticalstructurelightingstatustype
FROM

-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurelightingstatus
ON obstacles.verticalstructurelightingstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurelightingstatus
ON obstacles.verticalstructurelightingstatus.abstractverticalstructurelightingstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructurelightingstatus.id = master_join.source_id
LEFT JOIN obstacles.verticalstructurelightingstatus
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructurelightingstatus.id = master_join.source_id
LEFT JOIN obstacles.verticalstructurelightingstatus
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructurelightingstatus.id = master_join.source_id
LEFT JOIN obstacles.verticalstructurelightingstatus
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

VerticalStructurePartPropertyType
CREATE OR REPLACE VIEW verticalstructurepartpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructurepart_pt.id
    ) AS verticalstructurepartpropertytype
FROM

-- VerticalStructurePartType
LEFT JOIN obstacles.verticalstructurepart_pt
ON obstacles.verticalstructurepart_pt.verticalstructurepart_id = VerticalStructurePartType.id

;

VerticalStructurePartType
CREATE OR REPLACE VIEW verticalstructureparttype_view AS
SELECT
    jsonb_build_object(
       'type_value', obstacles.verticalstructurepart.type_value,
       'type_nilreason', obstacles.verticalstructurepart.type_nilreason,
       'constructionstatus_value', obstacles.verticalstructurepart.constructionstatus_value,
       'constructionstatus_nilreason', obstacles.verticalstructurepart.constructionstatus_nilreason,
       'markingpattern_value', obstacles.verticalstructurepart.markingpattern_value,
       'markingpattern_nilreason', obstacles.verticalstructurepart.markingpattern_nilreason,
       'markingfirstcolour_value', obstacles.verticalstructurepart.markingfirstcolour_value,
       'markingfirstcolour_nilreason', obstacles.verticalstructurepart.markingfirstcolour_nilreason,
       'markingsecondcolour_value', obstacles.verticalstructurepart.markingsecondcolour_value,
       'markingsecondcolour_nilreason', obstacles.verticalstructurepart.markingsecondcolour_nilreason,
       'mobile_value', obstacles.verticalstructurepart.mobile_value,
       'mobile_nilreason', obstacles.verticalstructurepart.mobile_nilreason,
       'frangible_value', obstacles.verticalstructurepart.frangible_value,
       'frangible_nilreason', obstacles.verticalstructurepart.frangible_nilreason,
       'visiblematerial_value', obstacles.verticalstructurepart.visiblematerial_value,
       'visiblematerial_nilreason', obstacles.verticalstructurepart.visiblematerial_nilreason,
       'designator_value', obstacles.verticalstructurepart.designator_value,
       'designator_nilreason', obstacles.verticalstructurepart.designator_nilreason,
       'verticalextent_value', obstacles.verticalstructurepart.verticalextent_value,
       'verticalextent_uom', obstacles.verticalstructurepart.verticalextent_uom,
       'verticalextent_nilreason', obstacles.verticalstructurepart.verticalextent_nilreason,
       'verticalextentaccuracy_value', obstacles.verticalstructurepart.verticalextentaccuracy_value,
       'verticalextentaccuracy_uom', obstacles.verticalstructurepart.verticalextentaccuracy_uom,
       'verticalextentaccuracy_nilreason', obstacles.verticalstructurepart.verticalextentaccuracy_nilreason,
       'id', obstacles.verticalstructurepart.id,
       'identifier', obstacles.verticalstructurepart.identifier,
       'identifier_code_space', obstacles.verticalstructurepart.identifier_code_space,
       'xml_id', obstacles.verticalstructurepart.xml_id
    ) AS verticalstructureparttype
FROM

-- ElevatedPointPropertyType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.horizontalprojection_location_id = ElevatedPointPropertyType.id
-- ElevatedCurvePropertyType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.horizontalprojection_linearextent_id = ElevatedCurvePropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.horizontalprojection_surfaceextent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.abstractverticalstructurepartextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructurepart.id = master_join.source_id
LEFT JOIN obstacles.verticalstructurepart
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructurepart.id = master_join.source_id
LEFT JOIN obstacles.verticalstructurepart
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructurepart.id = master_join.source_id
LEFT JOIN obstacles.verticalstructurepart
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- LightElementPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructurepart.id = master_join.source_id
LEFT JOIN obstacles.verticalstructurepart
ON master_join.target_id = LightElementPropertyType.id
;

VerticalStructurePropertyType
CREATE OR REPLACE VIEW verticalstructurepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructure_pt.id,
       'nilReason', obstacles.verticalstructure_pt.nilReason
    ) AS verticalstructurepropertytype
FROM


;

VerticalStructureTimeSlicePropertyType
CREATE OR REPLACE VIEW verticalstructuretimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructure_tsp.id
    ) AS verticalstructuretimeslicepropertytype
FROM

-- VerticalStructureTimeSliceType
LEFT JOIN obstacles.verticalstructure_tsp
ON obstacles.verticalstructure_tsp.verticalstructuretimeslice_id = VerticalStructureTimeSliceType.id

;

VerticalStructureTimeSliceType
CREATE OR REPLACE VIEW verticalstructuretimeslicetype_view AS
SELECT
    jsonb_build_object(
       'name_value', obstacles.verticalstructure_ts.name_value,
       'name_nilreason', obstacles.verticalstructure_ts.name_nilreason,
       'type_value', obstacles.verticalstructure_ts.type_value,
       'type_nilreason', obstacles.verticalstructure_ts.type_nilreason,
       'lighted_value', obstacles.verticalstructure_ts.lighted_value,
       'lighted_nilreason', obstacles.verticalstructure_ts.lighted_nilreason,
       'markingicaostandard_value', obstacles.verticalstructure_ts.markingicaostandard_value,
       'markingicaostandard_nilreason', obstacles.verticalstructure_ts.markingicaostandard_nilreason,
       'group_value', obstacles.verticalstructure_ts.group_value,
       'group_nilreason', obstacles.verticalstructure_ts.group_nilreason,
       'lightingicaostandard_value', obstacles.verticalstructure_ts.lightingicaostandard_value,
       'lightingicaostandard_nilreason', obstacles.verticalstructure_ts.lightingicaostandard_nilreason,
       'synchronisedlighting_value', obstacles.verticalstructure_ts.synchronisedlighting_value,
       'synchronisedlighting_nilreason', obstacles.verticalstructure_ts.synchronisedlighting_nilreason,
       'length_value', obstacles.verticalstructure_ts.length_value,
       'length_uom', obstacles.verticalstructure_ts.length_uom,
       'length_nilreason', obstacles.verticalstructure_ts.length_nilreason,
       'width_value', obstacles.verticalstructure_ts.width_value,
       'width_uom', obstacles.verticalstructure_ts.width_uom,
       'width_nilreason', obstacles.verticalstructure_ts.width_nilreason,
       'radius_value', obstacles.verticalstructure_ts.radius_value,
       'radius_uom', obstacles.verticalstructure_ts.radius_uom,
       'radius_nilreason', obstacles.verticalstructure_ts.radius_nilreason,
       'id', obstacles.verticalstructure_ts.id,
       'xml_id', obstacles.verticalstructure_ts.xml_id,
       'interpretation', obstacles.verticalstructure_ts.interpretation,
       'sequence_number', obstacles.verticalstructure_ts.sequence_number,
       'correction_number', obstacles.verticalstructure_ts.correction_number,
       'valid_time_begin', obstacles.verticalstructure_ts.valid_time_begin,
       'valid_time_end', obstacles.verticalstructure_ts.valid_time_end,
       'feature_lifetime_begin', obstacles.verticalstructure_ts.feature_lifetime_begin,
       'feature_lifetime_end', obstacles.verticalstructure_ts.feature_lifetime_end
    ) AS verticalstructuretimeslicetype
FROM

-- MarkerBeaconPropertyType
LEFT JOIN obstacles.verticalstructure_ts
ON obstacles.verticalstructure_ts.marker_id = MarkerBeaconPropertyType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructure_ts
ON obstacles.verticalstructure_ts.abstractverticalstructureextension_id = AbstractExtensionType.id

-- VerticalStructurePartPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = VerticalStructurePartPropertyType.id
-- PassengerServicePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = PassengerServicePropertyType.id
-- GroundLightSystemPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = GroundLightSystemPropertyType.id
-- NavaidEquipmentPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = NavaidEquipmentPropertyType.id
-- SpecialNavigationStationPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = SpecialNavigationStationPropertyType.id
-- UnitPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = UnitPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = OrganisationAuthorityPropertyType.id
-- ServicePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = ServicePropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = NotePropertyType.id
-- VerticalStructureLightingStatusPropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure_ts.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure_ts
ON master_join.target_id = VerticalStructureLightingStatusPropertyType.id
;

VerticalStructureType
CREATE OR REPLACE VIEW verticalstructuretype_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructure.id,
       'identifier', obstacles.verticalstructure.identifier,
       'identifier_code_space', obstacles.verticalstructure.identifier_code_space,
       'xml_id', obstacles.verticalstructure.xml_id
    ) AS verticalstructuretype
FROM


-- VerticalStructureTimeSlicePropertyType
LEFT JOIN obstacles.master_join
ON obstacles.verticalstructure.id = master_join.source_id
LEFT JOIN obstacles.verticalstructure
ON master_join.target_id = VerticalStructureTimeSlicePropertyType.id
;

VisualGlideSlopeIndicatorPropertyType
CREATE OR REPLACE VIEW visualglideslopeindicatorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.visualglideslopeindicator_pt.id,
       'nilReason', airport_heliport.visualglideslopeindicator_pt.nilReason
    ) AS visualglideslopeindicatorpropertytype
FROM


;

VisualGlideSlopeIndicatorTimeSlicePropertyType
CREATE OR REPLACE VIEW visualglideslopeindicatortimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.visualglideslopeindicator_tsp.id
    ) AS visualglideslopeindicatortimeslicepropertytype
FROM

-- VisualGlideSlopeIndicatorTimeSliceType
LEFT JOIN airport_heliport.visualglideslopeindicator_tsp
ON airport_heliport.visualglideslopeindicator_tsp.visualglideslopeindicatortimeslice_id = VisualGlideSlopeIndicatorTimeSliceType.id

;

VisualGlideSlopeIndicatorTimeSliceType
CREATE OR REPLACE VIEW visualglideslopeindicatortimeslicetype_view AS
SELECT
    jsonb_build_object(
       'emergencylighting_value', airport_heliport.visualglideslopeindicator_ts.emergencylighting_value,
       'emergencylighting_nilreason', airport_heliport.visualglideslopeindicator_ts.emergencylighting_nilreason,
       'intensitylevel_value', airport_heliport.visualglideslopeindicator_ts.intensitylevel_value,
       'intensitylevel_nilreason', airport_heliport.visualglideslopeindicator_ts.intensitylevel_nilreason,
       'colour_value', airport_heliport.visualglideslopeindicator_ts.colour_value,
       'colour_nilreason', airport_heliport.visualglideslopeindicator_ts.colour_nilreason,
       'type_value', airport_heliport.visualglideslopeindicator_ts.type_value,
       'type_nilreason', airport_heliport.visualglideslopeindicator_ts.type_nilreason,
       'position_value', airport_heliport.visualglideslopeindicator_ts.position_value,
       'position_nilreason', airport_heliport.visualglideslopeindicator_ts.position_nilreason,
       'numberbox_value', airport_heliport.visualglideslopeindicator_ts.numberbox_value,
       'numberbox_nilreason', airport_heliport.visualglideslopeindicator_ts.numberbox_nilreason,
       'portable_value', airport_heliport.visualglideslopeindicator_ts.portable_value,
       'portable_nilreason', airport_heliport.visualglideslopeindicator_ts.portable_nilreason,
       'slopeangle_value', airport_heliport.visualglideslopeindicator_ts.slopeangle_value,
       'slopeangle_nilreason', airport_heliport.visualglideslopeindicator_ts.slopeangle_nilreason,
       'minimumeyeheightoverthreshold_value', airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_value,
       'minimumeyeheightoverthreshold_uom', airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_uom,
       'minimumeyeheightoverthreshold_nilreason', airport_heliport.visualglideslopeindicator_ts.minimumeyeheightoverthreshold_nilreason,
       'id', airport_heliport.visualglideslopeindicator_ts.id,
       'xml_id', airport_heliport.visualglideslopeindicator_ts.xml_id,
       'interpretation', airport_heliport.visualglideslopeindicator_ts.interpretation,
       'sequence_number', airport_heliport.visualglideslopeindicator_ts.sequence_number,
       'correction_number', airport_heliport.visualglideslopeindicator_ts.correction_number,
       'valid_time_begin', airport_heliport.visualglideslopeindicator_ts.valid_time_begin,
       'valid_time_end', airport_heliport.visualglideslopeindicator_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.visualglideslopeindicator_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.visualglideslopeindicator_ts.feature_lifetime_end
    ) AS visualglideslopeindicatortimeslicetype
FROM

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON airport_heliport.visualglideslopeindicator_ts.runwaydirection_id = RunwayDirectionPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON airport_heliport.visualglideslopeindicator_ts.abstractvisualglideslopeindicatorextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON airport_heliport.visualglideslopeindicator_ts.abstractgroundlightsystemextension_id = AbstractExtensionType.id

-- LightElementPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.visualglideslopeindicator_ts.id = master_join.source_id
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON master_join.target_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.visualglideslopeindicator_ts.id = master_join.source_id
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON master_join.target_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.visualglideslopeindicator_ts.id = master_join.source_id
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON master_join.target_id = NotePropertyType.id
;

VisualGlideSlopeIndicatorType
CREATE OR REPLACE VIEW visualglideslopeindicatortype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.visualglideslopeindicator.id,
       'identifier', airport_heliport.visualglideslopeindicator.identifier,
       'identifier_code_space', airport_heliport.visualglideslopeindicator.identifier_code_space,
       'xml_id', airport_heliport.visualglideslopeindicator.xml_id
    ) AS visualglideslopeindicatortype
FROM


-- VisualGlideSlopeIndicatorTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.visualglideslopeindicator.id = master_join.source_id
LEFT JOIN airport_heliport.visualglideslopeindicator
ON master_join.target_id = VisualGlideSlopeIndicatorTimeSlicePropertyType.id
;

VORPropertyType
CREATE OR REPLACE VIEW vorpropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.vor_pt.id,
       'nilReason', navaids_points.vor_pt.nilReason
    ) AS vorpropertytype
FROM


;

VORTimeSlicePropertyType
CREATE OR REPLACE VIEW vortimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.vor_tsp.id
    ) AS vortimeslicepropertytype
FROM

-- VORTimeSliceType
LEFT JOIN navaids_points.vor_tsp
ON navaids_points.vor_tsp.vortimeslice_id = VORTimeSliceType.id

;

VORTimeSliceType
CREATE OR REPLACE VIEW vortimeslicetype_view AS
SELECT
    jsonb_build_object(
       'designator_value', navaids_points.vor_ts.designator_value,
       'designator_nilreason', navaids_points.vor_ts.designator_nilreason,
       'name_value', navaids_points.vor_ts.name_value,
       'name_nilreason', navaids_points.vor_ts.name_nilreason,
       'emissionclass_value', navaids_points.vor_ts.emissionclass_value,
       'emissionclass_nilreason', navaids_points.vor_ts.emissionclass_nilreason,
       'mobile_value', navaids_points.vor_ts.mobile_value,
       'mobile_nilreason', navaids_points.vor_ts.mobile_nilreason,
       'magneticvariation_value', navaids_points.vor_ts.magneticvariation_value,
       'magneticvariation_nilreason', navaids_points.vor_ts.magneticvariation_nilreason,
       'magneticvariationaccuracy_value', navaids_points.vor_ts.magneticvariationaccuracy_value,
       'magneticvariationaccuracy_nilreason', navaids_points.vor_ts.magneticvariationaccuracy_nilreason,
       'datemagneticvariation_value', navaids_points.vor_ts.datemagneticvariation_value,
       'datemagneticvariation_nilreason', navaids_points.vor_ts.datemagneticvariation_nilreason,
       'flightchecked_value', navaids_points.vor_ts.flightchecked_value,
       'flightchecked_nilreason', navaids_points.vor_ts.flightchecked_nilreason,
       'type_value', navaids_points.vor_ts.type_value,
       'type_nilreason', navaids_points.vor_ts.type_nilreason,
       'zerobearingdirection_value', navaids_points.vor_ts.zerobearingdirection_value,
       'zerobearingdirection_nilreason', navaids_points.vor_ts.zerobearingdirection_nilreason,
       'declination_value', navaids_points.vor_ts.declination_value,
       'declination_nilreason', navaids_points.vor_ts.declination_nilreason,
       'frequency_value', navaids_points.vor_ts.frequency_value,
       'frequency_uom', navaids_points.vor_ts.frequency_uom,
       'frequency_nilreason', navaids_points.vor_ts.frequency_nilreason,
       'id', navaids_points.vor_ts.id,
       'xml_id', navaids_points.vor_ts.xml_id,
       'interpretation', navaids_points.vor_ts.interpretation,
       'sequence_number', navaids_points.vor_ts.sequence_number,
       'correction_number', navaids_points.vor_ts.correction_number,
       'valid_time_begin', navaids_points.vor_ts.valid_time_begin,
       'valid_time_end', navaids_points.vor_ts.valid_time_end,
       'feature_lifetime_begin', navaids_points.vor_ts.feature_lifetime_begin,
       'feature_lifetime_end', navaids_points.vor_ts.feature_lifetime_end
    ) AS vortimeslicetype
FROM

-- ElevatedPointPropertyType
LEFT JOIN navaids_points.vor_ts
ON navaids_points.vor_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.vor_ts
ON navaids_points.vor_ts.abstractvorextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.vor_ts
ON navaids_points.vor_ts.abstractnavaidequipmentextension_id = AbstractExtensionType.id

-- AuthorityForNavaidEquipmentPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.vor_ts.id = master_join.source_id
LEFT JOIN navaids_points.vor_ts
ON master_join.target_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.vor_ts.id = master_join.source_id
LEFT JOIN navaids_points.vor_ts
ON master_join.target_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.vor_ts.id = master_join.source_id
LEFT JOIN navaids_points.vor_ts
ON master_join.target_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.vor_ts.id = master_join.source_id
LEFT JOIN navaids_points.vor_ts
ON master_join.target_id = NotePropertyType.id
;

VORType
CREATE OR REPLACE VIEW vortype_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.vor.id,
       'identifier', navaids_points.vor.identifier,
       'identifier_code_space', navaids_points.vor.identifier_code_space,
       'xml_id', navaids_points.vor.xml_id
    ) AS vortype
FROM


-- VORTimeSlicePropertyType
LEFT JOIN navaids_points.master_join
ON navaids_points.vor.id = master_join.source_id
LEFT JOIN navaids_points.vor
ON master_join.target_id = VORTimeSlicePropertyType.id
;

WorkareaActivityPropertyType
CREATE OR REPLACE VIEW workareaactivitypropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.workareaactivity_pt.id
    ) AS workareaactivitypropertytype
FROM

-- WorkareaActivityType
LEFT JOIN airport_heliport.workareaactivity_pt
ON airport_heliport.workareaactivity_pt.workareaactivity_id = WorkareaActivityType.id

;

WorkareaActivityType
CREATE OR REPLACE VIEW workareaactivitytype_view AS
SELECT
    jsonb_build_object(
       'isactive_value', airport_heliport.workareaactivity.isactive_value,
       'isactive_nilreason', airport_heliport.workareaactivity.isactive_nilreason,
       'id', airport_heliport.workareaactivity.id,
       'identifier', airport_heliport.workareaactivity.identifier,
       'identifier_code_space', airport_heliport.workareaactivity.identifier_code_space,
       'xml_id', airport_heliport.workareaactivity.xml_id
    ) AS workareaactivitytype
FROM

-- AbstractExtensionType
LEFT JOIN airport_heliport.workareaactivity
ON airport_heliport.workareaactivity.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.workareaactivity
ON airport_heliport.workareaactivity.abstractworkareaactivityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.workareaactivity.id = master_join.source_id
LEFT JOIN airport_heliport.workareaactivity
ON master_join.target_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.workareaactivity.id = master_join.source_id
LEFT JOIN airport_heliport.workareaactivity
ON master_join.target_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.workareaactivity.id = master_join.source_id
LEFT JOIN airport_heliport.workareaactivity
ON master_join.target_id = OrganisationAuthorityPropertyType.id
;

WorkAreaPropertyType
CREATE OR REPLACE VIEW workareapropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.workarea_pt.id,
       'nilReason', airport_heliport.workarea_pt.nilReason
    ) AS workareapropertytype
FROM


;

WorkAreaTimeSlicePropertyType
CREATE OR REPLACE VIEW workareatimeslicepropertytype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.workarea_tsp.id
    ) AS workareatimeslicepropertytype
FROM

-- WorkAreaTimeSliceType
LEFT JOIN airport_heliport.workarea_tsp
ON airport_heliport.workarea_tsp.workareatimeslice_id = WorkAreaTimeSliceType.id

;

WorkAreaTimeSliceType
CREATE OR REPLACE VIEW workareatimeslicetype_view AS
SELECT
    jsonb_build_object(
       'plannedOperational_value', airport_heliport.workarea_ts.plannedOperational_value,
       'plannedOperational_nilreason', airport_heliport.workarea_ts.plannedOperational_nilreason,
       'type_value', airport_heliport.workarea_ts.type_value,
       'type_nilreason', airport_heliport.workarea_ts.type_nilreason,
       'id', airport_heliport.workarea_ts.id,
       'xml_id', airport_heliport.workarea_ts.xml_id,
       'interpretation', airport_heliport.workarea_ts.interpretation,
       'sequence_number', airport_heliport.workarea_ts.sequence_number,
       'correction_number', airport_heliport.workarea_ts.correction_number,
       'valid_time_begin', airport_heliport.workarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.workarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.workarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.workarea_ts.feature_lifetime_end
    ) AS workareatimeslicetype
FROM

-- AirportHeliportPropertyType
LEFT JOIN airport_heliport.workarea_ts
ON airport_heliport.workarea_ts.associatedairportheliport_id = AirportHeliportPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.workarea_ts
ON airport_heliport.workarea_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.workarea_ts
ON airport_heliport.workarea_ts.abstractworkareaextension_id = AbstractExtensionType.id

-- WorkareaActivityPropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.workarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.workarea_ts
ON master_join.target_id = WorkareaActivityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.workarea_ts.id = master_join.source_id
LEFT JOIN airport_heliport.workarea_ts
ON master_join.target_id = NotePropertyType.id
;

WorkAreaType
CREATE OR REPLACE VIEW workareatype_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.workarea.id,
       'identifier', airport_heliport.workarea.identifier,
       'identifier_code_space', airport_heliport.workarea.identifier_code_space,
       'xml_id', airport_heliport.workarea.xml_id
    ) AS workareatype
FROM


-- WorkAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.master_join
ON airport_heliport.workarea.id = master_join.source_id
LEFT JOIN airport_heliport.workarea
ON master_join.target_id = WorkAreaTimeSlicePropertyType.id
;

