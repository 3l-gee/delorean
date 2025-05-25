AerialRefuellingAnchor
CREATE OR REPLACE VIEW aerialrefuellinganchor_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuellinganchor_pt.id,
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
    ) AS aerialrefuellinganchor
FROM

-- AerialRefuellingAnchorType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor_pt
ON aerial_refuelling.aerialrefuellinganchor_pt.aerialrefuellinganchor_id = AerialRefuellingAnchorType.id
-- SurfacePropertyType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON aerial_refuelling.aerialrefuellinganchor.extent_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON aerial_refuelling.aerialrefuellinganchor.abstractaerialrefuellinganchorextension_id = AbstractExtensionType.id

-- AirspaceLayerPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor_verticalextent
ON aerial_refuelling.aerialrefuellinganchor.id = aerialrefuellinganchor_verticalextent.aerialrefuellinganchor_id
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON aerialrefuellinganchor_verticalextent.airspacelayer_pt_id = AirspaceLayerPropertyType.id
-- AerialRefuellingPointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor_point
ON aerial_refuelling.aerialrefuellinganchor.id = aerialrefuellinganchor_point.aerialrefuellinganchor_id
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON aerialrefuellinganchor_point.aerialrefuellingpoint_pt_id = AerialRefuellingPointPropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.aerialrefuellinganchor_annotation
ON aerial_refuelling.aerialrefuellinganchor.id = aerialrefuellinganchor_annotation.aerialrefuellinganchor_id
LEFT JOIN aerial_refuelling.aerialrefuellinganchor
ON aerialrefuellinganchor_annotation.note_pt_id = NotePropertyType.id
;

AerialRefuellingPoint
CREATE OR REPLACE VIEW aerialrefuellingpoint_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuellingpoint_pt.id,
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
    ) AS aerialrefuellingpoint
FROM

-- AerialRefuellingPointType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint_pt
ON aerial_refuelling.aerialrefuellingpoint_pt.aerialrefuellingpoint_id = AerialRefuellingPointType.id
-- DesignatedPointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerial_refuelling.aerialrefuellingpoint.aerialrefuellingpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
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
LEFT JOIN aerial_refuelling.aerialrefuellingpoint_facilitymakeup
ON aerial_refuelling.aerialrefuellingpoint.id = aerialrefuellingpoint_facilitymakeup.aerialrefuellingpoint_id
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerialrefuellingpoint_facilitymakeup.pointreference_pt_id = PointReferencePropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingpoint_annotation
ON aerial_refuelling.aerialrefuellingpoint.id = aerialrefuellingpoint_annotation.aerialrefuellingpoint_id
LEFT JOIN aerial_refuelling.aerialrefuellingpoint
ON aerialrefuellingpoint_annotation.note_pt_id = NotePropertyType.id
;

AerialRefuelling
CREATE OR REPLACE VIEW aerialrefuelling_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuelling_pt.id,
       'nilReason', aerial_refuelling.aerialrefuelling_pt.nilReason,
       'href', aerial_refuelling.aerialrefuelling_pt.href,
       'id', aerial_refuelling.aerialrefuelling_tsp.id,
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
       'feature_lifetime_end', aerial_refuelling.aerialrefuelling_ts.feature_lifetime_end,
       'id', aerial_refuelling.aerialrefuelling.id,
       'identifier', aerial_refuelling.aerialrefuelling.identifier,
       'identifier_code_space', aerial_refuelling.aerialrefuelling.identifier_code_space,
       'xml_id', aerial_refuelling.aerialrefuelling.xml_id
    ) AS aerialrefuelling
FROM

-- AerialRefuellingTimeSliceType
LEFT JOIN aerial_refuelling.aerialrefuelling_tsp
ON aerial_refuelling.aerialrefuelling_tsp.aerialrefuellingtimeslice_id = AerialRefuellingTimeSliceType.id
-- AerialRefuellingPropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerial_refuelling.aerialrefuelling_ts.oppositetrack_id = AerialRefuellingPropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerial_refuelling.aerialrefuelling_ts.abstractaerialrefuellingextension_id = AbstractExtensionType.id

-- RouteAvailabilityPropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts_availability
ON aerial_refuelling.aerialrefuelling_ts.id = aerialrefuelling_ts_availability.aerialrefuelling_ts_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerialrefuelling_ts_availability.routeavailability_pt_id = RouteAvailabilityPropertyType.id
-- AirspacePropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts_protectingairspace
ON aerial_refuelling.aerialrefuelling_ts.id = aerialrefuelling_ts_protectingairspace.aerialrefuelling_ts_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerialrefuelling_ts_protectingairspace.airspace_pt_id = AirspacePropertyType.id
-- AerialRefuellingTrackPropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts_track
ON aerial_refuelling.aerialrefuelling_ts.id = aerialrefuelling_ts_track.aerialrefuelling_ts_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerialrefuelling_ts_track.aerialrefuellingtrack_pt_id = AerialRefuellingTrackPropertyType.id
-- AerialRefuellingAnchorPropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts_anchor
ON aerial_refuelling.aerialrefuelling_ts.id = aerialrefuelling_ts_anchor.aerialrefuelling_ts_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerialrefuelling_ts_anchor.aerialrefuellinganchor_pt_id = AerialRefuellingAnchorPropertyType.id
-- AuthorityForAerialRefuellingPropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts_managingorganisation
ON aerial_refuelling.aerialrefuelling_ts.id = aerialrefuelling_ts_managingorganisation.aerialrefuelling_ts_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerialrefuelling_ts_managingorganisation.authorityforaerialrefuelling_pt_id = AuthorityForAerialRefuellingPropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_ts_annotation
ON aerial_refuelling.aerialrefuelling_ts.id = aerialrefuelling_ts_annotation.aerialrefuelling_ts_id
LEFT JOIN aerial_refuelling.aerialrefuelling_ts
ON aerialrefuelling_ts_annotation.note_pt_id = NotePropertyType.id
-- AerialRefuellingTimeSlicePropertyType
LEFT JOIN aerial_refuelling.aerialrefuelling_timeslice
ON aerial_refuelling.aerialrefuelling.id = aerialrefuelling_timeslice.aerialrefuelling_id
LEFT JOIN aerial_refuelling.aerialrefuelling
ON aerialrefuelling_timeslice.aerialrefuelling_tsp_id = AerialRefuellingTimeSlicePropertyType.id
;

AerialRefuellingTrack
CREATE OR REPLACE VIEW aerialrefuellingtrack_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.aerialrefuellingtrack_pt.id,
       'id', aerial_refuelling.aerialrefuellingtrack.id,
       'identifier', aerial_refuelling.aerialrefuellingtrack.identifier,
       'identifier_code_space', aerial_refuelling.aerialrefuellingtrack.identifier_code_space,
       'xml_id', aerial_refuelling.aerialrefuellingtrack.xml_id
    ) AS aerialrefuellingtrack
FROM

-- AerialRefuellingTrackType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack_pt
ON aerial_refuelling.aerialrefuellingtrack_pt.aerialrefuellingtrack_id = AerialRefuellingTrackType.id
-- CurvePropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON aerial_refuelling.aerialrefuellingtrack.extent_id = CurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON aerial_refuelling.aerialrefuellingtrack.abstractaerialrefuellingtrackextension_id = AbstractExtensionType.id

-- AerialRefuellingPointPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack_point
ON aerial_refuelling.aerialrefuellingtrack.id = aerialrefuellingtrack_point.aerialrefuellingtrack_id
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON aerialrefuellingtrack_point.aerialrefuellingpoint_pt_id = AerialRefuellingPointPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack_verticalextent
ON aerial_refuelling.aerialrefuellingtrack.id = aerialrefuellingtrack_verticalextent.aerialrefuellingtrack_id
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON aerialrefuellingtrack_verticalextent.airspacelayer_pt_id = AirspaceLayerPropertyType.id
-- NotePropertyType
LEFT JOIN aerial_refuelling.aerialrefuellingtrack_annotation
ON aerial_refuelling.aerialrefuellingtrack.id = aerialrefuellingtrack_annotation.aerialrefuellingtrack_id
LEFT JOIN aerial_refuelling.aerialrefuellingtrack
ON aerialrefuellingtrack_annotation.note_pt_id = NotePropertyType.id
;

AeronauticalGroundLight
CREATE OR REPLACE VIEW aeronauticalgroundlight_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.aeronauticalgroundlight_pt.id,
       'nilReason', navaids_points.aeronauticalgroundlight_pt.nilReason,
       'href', navaids_points.aeronauticalgroundlight_pt.href,
       'id', navaids_points.aeronauticalgroundlight_tsp.id,
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
       'feature_lifetime_end', navaids_points.aeronauticalgroundlight_ts.feature_lifetime_end,
       'id', navaids_points.aeronauticalgroundlight.id,
       'identifier', navaids_points.aeronauticalgroundlight.identifier,
       'identifier_code_space', navaids_points.aeronauticalgroundlight.identifier_code_space,
       'xml_id', navaids_points.aeronauticalgroundlight.xml_id
    ) AS aeronauticalgroundlight
FROM

-- AeronauticalGroundLightTimeSliceType
LEFT JOIN navaids_points.aeronauticalgroundlight_tsp
ON navaids_points.aeronauticalgroundlight_tsp.aeronauticalgroundlighttimeslice_id = AeronauticalGroundLightTimeSliceType.id
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
LEFT JOIN navaids_points.aeronauticalgroundlight_ts_annotation
ON navaids_points.aeronauticalgroundlight_ts.id = aeronauticalgroundlight_ts_annotation.aeronauticalgroundlight_ts_id
LEFT JOIN navaids_points.aeronauticalgroundlight_ts
ON aeronauticalgroundlight_ts_annotation.note_pt_id = NotePropertyType.id
-- AeronauticalGroundLightTimeSlicePropertyType
LEFT JOIN navaids_points.aeronauticalgroundlight_timeslice
ON navaids_points.aeronauticalgroundlight.id = aeronauticalgroundlight_timeslice.aeronauticalgroundlight_id
LEFT JOIN navaids_points.aeronauticalgroundlight
ON aeronauticalgroundlight_timeslice.aeronauticalgroundlight_tsp_id = AeronauticalGroundLightTimeSlicePropertyType.id
;

AircraftCharacteristic
CREATE OR REPLACE VIEW aircraftcharacteristic_view AS
SELECT
    jsonb_build_object(
       'id', shared.aircraftcharacteristic_pt.id,
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
    ) AS aircraftcharacteristic
FROM

-- AircraftCharacteristicType
LEFT JOIN shared.aircraftcharacteristic_pt
ON shared.aircraftcharacteristic_pt.aircraftcharacteristic_id = AircraftCharacteristicType.id
-- AbstractExtensionType
LEFT JOIN shared.aircraftcharacteristic
ON shared.aircraftcharacteristic.abstractaircraftcharacteristicextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.aircraftcharacteristic_annotation
ON shared.aircraftcharacteristic.id = aircraftcharacteristic_annotation.aircraftcharacteristic_id
LEFT JOIN shared.aircraftcharacteristic
ON aircraftcharacteristic_annotation.note_pt_id = NotePropertyType.id
;

AircraftGroundService
CREATE OR REPLACE VIEW aircraftgroundservice_view AS
SELECT
    jsonb_build_object(
       'id', service.aircraftgroundservice_pt.id,
       'nilReason', service.aircraftgroundservice_pt.nilReason,
       'href', service.aircraftgroundservice_pt.href,
       'id', service.aircraftgroundservice_tsp.id,
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
       'feature_lifetime_end', service.aircraftgroundservice_ts.feature_lifetime_end,
       'id', service.aircraftgroundservice.id,
       'identifier', service.aircraftgroundservice.identifier,
       'identifier_code_space', service.aircraftgroundservice.identifier_code_space,
       'xml_id', service.aircraftgroundservice.xml_id
    ) AS aircraftgroundservice
FROM

-- AircraftGroundServiceTimeSliceType
LEFT JOIN service.aircraftgroundservice_tsp
ON service.aircraftgroundservice_tsp.aircraftgroundservicetimeslice_id = AircraftGroundServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.aircraftgroundservice_ts_radiocommunication
ON service.aircraftgroundservice_ts.id = aircraftgroundservice_ts_radiocommunication.aircraftgroundservice_ts_id
LEFT JOIN service.aircraftgroundservice_ts
ON aircraftgroundservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.aircraftgroundservice_ts_groundcommunication
ON service.aircraftgroundservice_ts.id = aircraftgroundservice_ts_groundcommunication.aircraftgroundservice_ts_id
LEFT JOIN service.aircraftgroundservice_ts
ON aircraftgroundservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.aircraftgroundservice_ts_availability
ON service.aircraftgroundservice_ts.id = aircraftgroundservice_ts_availability.aircraftgroundservice_ts_id
LEFT JOIN service.aircraftgroundservice_ts
ON aircraftgroundservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.aircraftgroundservice_ts_annotation
ON service.aircraftgroundservice_ts.id = aircraftgroundservice_ts_annotation.aircraftgroundservice_ts_id
LEFT JOIN service.aircraftgroundservice_ts
ON aircraftgroundservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.aircraftgroundservice_ts_airportheliport
ON service.aircraftgroundservice_ts.id = aircraftgroundservice_ts_airportheliport.aircraftgroundservice_ts_id
LEFT JOIN service.aircraftgroundservice_ts
ON aircraftgroundservice_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- AircraftGroundServiceTimeSlicePropertyType
LEFT JOIN service.aircraftgroundservice_timeslice
ON service.aircraftgroundservice.id = aircraftgroundservice_timeslice.aircraftgroundservice_id
LEFT JOIN service.aircraftgroundservice
ON aircraftgroundservice_timeslice.aircraftgroundservice_tsp_id = AircraftGroundServiceTimeSlicePropertyType.id
;

AircraftStandContamination
CREATE OR REPLACE VIEW aircraftstandcontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aircraftstandcontamination_pt.id,
       'observationtime_value', airport_heliport.aircraftstandcontamination.observationtime_value,
       'observationtime_nilreason', airport_heliport.aircraftstandcontamination.observationtime_nilreason,
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
       'nextobservationtime_value', airport_heliport.aircraftstandcontamination.nextobservationtime_value,
       'nextobservationtime_nilreason', airport_heliport.aircraftstandcontamination.nextobservationtime_nilreason,
       'proportion_value', airport_heliport.aircraftstandcontamination.proportion_value,
       'proportion_nilreason', airport_heliport.aircraftstandcontamination.proportion_nilreason,
       'depth_value', airport_heliport.aircraftstandcontamination.depth_value,
       'depth_uom', airport_heliport.aircraftstandcontamination.depth_uom,
       'depth_nilreason', airport_heliport.aircraftstandcontamination.depth_nilreason,
       'id', airport_heliport.aircraftstandcontamination.id,
       'identifier', airport_heliport.aircraftstandcontamination.identifier,
       'identifier_code_space', airport_heliport.aircraftstandcontamination.identifier_code_space,
       'xml_id', airport_heliport.aircraftstandcontamination.xml_id
    ) AS aircraftstandcontamination
FROM

-- AircraftStandContaminationType
LEFT JOIN airport_heliport.aircraftstandcontamination_pt
ON airport_heliport.aircraftstandcontamination_pt.aircraftstandcontamination_id = AircraftStandContaminationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.aircraftstandcontamination
ON airport_heliport.aircraftstandcontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.aircraftstandcontamination
ON airport_heliport.aircraftstandcontamination.abstractaircraftstandcontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.aircraftstandcontamination_criticalridge
ON airport_heliport.aircraftstandcontamination.id = aircraftstandcontamination_criticalridge.aircraftstandcontamination_id
LEFT JOIN airport_heliport.aircraftstandcontamination
ON aircraftstandcontamination_criticalridge.ridge_pt_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.aircraftstandcontamination_layer
ON airport_heliport.aircraftstandcontamination.id = aircraftstandcontamination_layer.aircraftstandcontamination_id
LEFT JOIN airport_heliport.aircraftstandcontamination
ON aircraftstandcontamination_layer.surfacecontaminationlayer_pt_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.aircraftstandcontamination_annotation
ON airport_heliport.aircraftstandcontamination.id = aircraftstandcontamination_annotation.aircraftstandcontamination_id
LEFT JOIN airport_heliport.aircraftstandcontamination
ON aircraftstandcontamination_annotation.note_pt_id = NotePropertyType.id
;

AircraftStand
CREATE OR REPLACE VIEW aircraftstand_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aircraftstand_pt.id,
       'nilReason', airport_heliport.aircraftstand_pt.nilReason,
       'href', airport_heliport.aircraftstand_pt.href,
       'id', airport_heliport.aircraftstand_tsp.id,
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
       'feature_lifetime_end', airport_heliport.aircraftstand_ts.feature_lifetime_end,
       'id', airport_heliport.aircraftstand.id,
       'identifier', airport_heliport.aircraftstand.identifier,
       'identifier_code_space', airport_heliport.aircraftstand.identifier_code_space,
       'xml_id', airport_heliport.aircraftstand.xml_id
    ) AS aircraftstand
FROM

-- AircraftStandTimeSliceType
LEFT JOIN airport_heliport.aircraftstand_tsp
ON airport_heliport.aircraftstand_tsp.aircraftstandtimeslice_id = AircraftStandTimeSliceType.id
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
LEFT JOIN airport_heliport.aircraftstand_ts_contaminant
ON airport_heliport.aircraftstand_ts.id = aircraftstand_ts_contaminant.aircraftstand_ts_id
LEFT JOIN airport_heliport.aircraftstand_ts
ON aircraftstand_ts_contaminant.aircraftstandcontamination_pt_id = AircraftStandContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.aircraftstand_ts_annotation
ON airport_heliport.aircraftstand_ts.id = aircraftstand_ts_annotation.aircraftstand_ts_id
LEFT JOIN airport_heliport.aircraftstand_ts
ON aircraftstand_ts_annotation.note_pt_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.aircraftstand_ts_availability
ON airport_heliport.aircraftstand_ts.id = aircraftstand_ts_availability.aircraftstand_ts_id
LEFT JOIN airport_heliport.aircraftstand_ts
ON aircraftstand_ts_availability.apronareaavailability_pt_id = ApronAreaAvailabilityPropertyType.id
-- AircraftStandTimeSlicePropertyType
LEFT JOIN airport_heliport.aircraftstand_timeslice
ON airport_heliport.aircraftstand.id = aircraftstand_timeslice.aircraftstand_id
LEFT JOIN airport_heliport.aircraftstand
ON aircraftstand_timeslice.aircraftstand_tsp_id = AircraftStandTimeSlicePropertyType.id
;

AirportClearanceService
CREATE OR REPLACE VIEW airportclearanceservice_view AS
SELECT
    jsonb_build_object(
       'id', service.airportclearanceservice_pt.id,
       'nilReason', service.airportclearanceservice_pt.nilReason,
       'href', service.airportclearanceservice_pt.href,
       'id', service.airportclearanceservice_tsp.id,
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
       'feature_lifetime_end', service.airportclearanceservice_ts.feature_lifetime_end,
       'id', service.airportclearanceservice.id,
       'identifier', service.airportclearanceservice.identifier,
       'identifier_code_space', service.airportclearanceservice.identifier_code_space,
       'xml_id', service.airportclearanceservice.xml_id
    ) AS airportclearanceservice
FROM

-- AirportClearanceServiceTimeSliceType
LEFT JOIN service.airportclearanceservice_tsp
ON service.airportclearanceservice_tsp.airportclearanceservicetimeslice_id = AirportClearanceServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.airportclearanceservice_ts_radiocommunication
ON service.airportclearanceservice_ts.id = airportclearanceservice_ts_radiocommunication.airportclearanceservice_ts_id
LEFT JOIN service.airportclearanceservice_ts
ON airportclearanceservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.airportclearanceservice_ts_groundcommunication
ON service.airportclearanceservice_ts.id = airportclearanceservice_ts_groundcommunication.airportclearanceservice_ts_id
LEFT JOIN service.airportclearanceservice_ts
ON airportclearanceservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.airportclearanceservice_ts_availability
ON service.airportclearanceservice_ts.id = airportclearanceservice_ts_availability.airportclearanceservice_ts_id
LEFT JOIN service.airportclearanceservice_ts
ON airportclearanceservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.airportclearanceservice_ts_annotation
ON service.airportclearanceservice_ts.id = airportclearanceservice_ts_annotation.airportclearanceservice_ts_id
LEFT JOIN service.airportclearanceservice_ts
ON airportclearanceservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.airportclearanceservice_ts_airportheliport
ON service.airportclearanceservice_ts.id = airportclearanceservice_ts_airportheliport.airportclearanceservice_ts_id
LEFT JOIN service.airportclearanceservice_ts
ON airportclearanceservice_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- AirportClearanceServiceTimeSlicePropertyType
LEFT JOIN service.airportclearanceservice_timeslice
ON service.airportclearanceservice.id = airportclearanceservice_timeslice.airportclearanceservice_id
LEFT JOIN service.airportclearanceservice
ON airportclearanceservice_timeslice.airportclearanceservice_tsp_id = AirportClearanceServiceTimeSlicePropertyType.id
;

AirportGroundService
CREATE OR REPLACE VIEW airportgroundservice_view AS
SELECT
    jsonb_build_object(
       'id', service.airportgroundservice_pt.id,
       'nilReason', service.airportgroundservice_pt.nilReason,
       'href', service.airportgroundservice_pt.href
    ) AS airportgroundservice
FROM


;

AirportHeliportAvailability
CREATE OR REPLACE VIEW airportheliportavailability_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportavailability_pt.id,
       'operationalstatus_value', airport_heliport.airportheliportavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.airportheliportavailability.operationalstatus_nilreason,
       'warning_value', airport_heliport.airportheliportavailability.warning_value,
       'warning_nilreason', airport_heliport.airportheliportavailability.warning_nilreason,
       'id', airport_heliport.airportheliportavailability.id,
       'identifier', airport_heliport.airportheliportavailability.identifier,
       'identifier_code_space', airport_heliport.airportheliportavailability.identifier_code_space,
       'xml_id', airport_heliport.airportheliportavailability.xml_id
    ) AS airportheliportavailability
FROM

-- AirportHeliportAvailabilityType
LEFT JOIN airport_heliport.airportheliportavailability_pt
ON airport_heliport.airportheliportavailability_pt.airportheliportavailability_id = AirportHeliportAvailabilityType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportavailability
ON airport_heliport.airportheliportavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportavailability
ON airport_heliport.airportheliportavailability.abstractairportheliportavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.airportheliportavailability_timeinterval
ON airport_heliport.airportheliportavailability.id = airportheliportavailability_timeinterval.airportheliportavailability_id
LEFT JOIN airport_heliport.airportheliportavailability
ON airportheliportavailability_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.airportheliportavailability_annotation
ON airport_heliport.airportheliportavailability.id = airportheliportavailability_annotation.airportheliportavailability_id
LEFT JOIN airport_heliport.airportheliportavailability
ON airportheliportavailability_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.airportheliportavailability_specialdateauthority
ON airport_heliport.airportheliportavailability.id = airportheliportavailability_specialdateauthority.airportheliportavailability_id
LEFT JOIN airport_heliport.airportheliportavailability
ON airportheliportavailability_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- AirportHeliportUsagePropertyType
LEFT JOIN airport_heliport.airportheliportavailability_usage
ON airport_heliport.airportheliportavailability.id = airportheliportavailability_usage.airportheliportavailability_id
LEFT JOIN airport_heliport.airportheliportavailability
ON airportheliportavailability_usage.airportheliportusage_pt_id = AirportHeliportUsagePropertyType.id
;

AirportHeliportCollocation
CREATE OR REPLACE VIEW airportheliportcollocation_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportcollocation_pt.id,
       'nilReason', airport_heliport.airportheliportcollocation_pt.nilReason,
       'href', airport_heliport.airportheliportcollocation_pt.href,
       'id', airport_heliport.airportheliportcollocation_tsp.id,
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
       'feature_lifetime_end', airport_heliport.airportheliportcollocation_ts.feature_lifetime_end,
       'id', airport_heliport.airportheliportcollocation.id,
       'identifier', airport_heliport.airportheliportcollocation.identifier,
       'identifier_code_space', airport_heliport.airportheliportcollocation.identifier_code_space,
       'xml_id', airport_heliport.airportheliportcollocation.xml_id
    ) AS airportheliportcollocation
FROM

-- AirportHeliportCollocationTimeSliceType
LEFT JOIN airport_heliport.airportheliportcollocation_tsp
ON airport_heliport.airportheliportcollocation_tsp.airportheliportcollocationtimeslice_id = AirportHeliportCollocationTimeSliceType.id
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
LEFT JOIN airport_heliport.airportheliportcollocation_ts_annotation
ON airport_heliport.airportheliportcollocation_ts.id = airportheliportcollocation_ts_annotation.airportheliportcollocation_ts_id
LEFT JOIN airport_heliport.airportheliportcollocation_ts
ON airportheliportcollocation_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportCollocationTimeSlicePropertyType
LEFT JOIN airport_heliport.airportheliportcollocation_timeslice
ON airport_heliport.airportheliportcollocation.id = airportheliportcollocation_timeslice.airportheliportcollocation_id
LEFT JOIN airport_heliport.airportheliportcollocation
ON airportheliportcollocation_timeslice.airportheliportcollocation_tsp_id = AirportHeliportCollocationTimeSlicePropertyType.id
;

AirportHeliportContamination
CREATE OR REPLACE VIEW airportheliportcontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportcontamination_pt.id,
       'observationtime_value', airport_heliport.airportheliportcontamination.observationtime_value,
       'observationtime_nilreason', airport_heliport.airportheliportcontamination.observationtime_nilreason,
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
       'nextobservationtime_value', airport_heliport.airportheliportcontamination.nextobservationtime_value,
       'nextobservationtime_nilreason', airport_heliport.airportheliportcontamination.nextobservationtime_nilreason,
       'proportion_value', airport_heliport.airportheliportcontamination.proportion_value,
       'proportion_nilreason', airport_heliport.airportheliportcontamination.proportion_nilreason,
       'depth_value', airport_heliport.airportheliportcontamination.depth_value,
       'depth_uom', airport_heliport.airportheliportcontamination.depth_uom,
       'depth_nilreason', airport_heliport.airportheliportcontamination.depth_nilreason,
       'id', airport_heliport.airportheliportcontamination.id,
       'identifier', airport_heliport.airportheliportcontamination.identifier,
       'identifier_code_space', airport_heliport.airportheliportcontamination.identifier_code_space,
       'xml_id', airport_heliport.airportheliportcontamination.xml_id
    ) AS airportheliportcontamination
FROM

-- AirportHeliportContaminationType
LEFT JOIN airport_heliport.airportheliportcontamination_pt
ON airport_heliport.airportheliportcontamination_pt.airportheliportcontamination_id = AirportHeliportContaminationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportcontamination
ON airport_heliport.airportheliportcontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.airportheliportcontamination
ON airport_heliport.airportheliportcontamination.abstractairportheliportcontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.airportheliportcontamination_criticalridge
ON airport_heliport.airportheliportcontamination.id = airportheliportcontamination_criticalridge.airportheliportcontamination_id
LEFT JOIN airport_heliport.airportheliportcontamination
ON airportheliportcontamination_criticalridge.ridge_pt_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.airportheliportcontamination_layer
ON airport_heliport.airportheliportcontamination.id = airportheliportcontamination_layer.airportheliportcontamination_id
LEFT JOIN airport_heliport.airportheliportcontamination
ON airportheliportcontamination_layer.surfacecontaminationlayer_pt_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.airportheliportcontamination_annotation
ON airport_heliport.airportheliportcontamination.id = airportheliportcontamination_annotation.airportheliportcontamination_id
LEFT JOIN airport_heliport.airportheliportcontamination
ON airportheliportcontamination_annotation.note_pt_id = NotePropertyType.id
;

AirportHeliport
CREATE OR REPLACE VIEW airportheliport_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliport_pt.id,
       'nilReason', airport_heliport.airportheliport_pt.nilReason,
       'href', airport_heliport.airportheliport_pt.href,
       'id', airport_heliport.airportheliport_tsp.id,
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
       'certificationdate_value', airport_heliport.airportheliport_ts.certificationdate_value,
       'certificationdate_nilreason', airport_heliport.airportheliport_ts.certificationdate_nilreason,
       'certificationexpirationdate_value', airport_heliport.airportheliport_ts.certificationexpirationdate_value,
       'certificationexpirationdate_nilreason', airport_heliport.airportheliport_ts.certificationexpirationdate_nilreason,
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
       'feature_lifetime_end', airport_heliport.airportheliport_ts.feature_lifetime_end,
       'id', airport_heliport.airportheliport.id,
       'identifier', airport_heliport.airportheliport.identifier,
       'identifier_code_space', airport_heliport.airportheliport.identifier_code_space,
       'xml_id', airport_heliport.airportheliport.xml_id
    ) AS airportheliport
FROM

-- AirportHeliportTimeSliceType
LEFT JOIN airport_heliport.airportheliport_tsp
ON airport_heliport.airportheliport_tsp.airportheliporttimeslice_id = AirportHeliportTimeSliceType.id
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
LEFT JOIN airport_heliport.airportheliport_ts_contaminant
ON airport_heliport.airportheliport_ts.id = airportheliport_ts_contaminant.airportheliport_ts_id
LEFT JOIN airport_heliport.airportheliport_ts
ON airportheliport_ts_contaminant.airportheliportcontamination_pt_id = AirportHeliportContaminationPropertyType.id
-- CityPropertyType
LEFT JOIN airport_heliport.airportheliport_ts_servedcity
ON airport_heliport.airportheliport_ts.id = airportheliport_ts_servedcity.airportheliport_ts_id
LEFT JOIN airport_heliport.airportheliport_ts
ON airportheliport_ts_servedcity.city_pt_id = CityPropertyType.id
-- AltimeterSourcePropertyType
LEFT JOIN airport_heliport.airportheliport_ts_altimetersource
ON airport_heliport.airportheliport_ts.id = airportheliport_ts_altimetersource.airportheliport_ts_id
LEFT JOIN airport_heliport.airportheliport_ts
ON airportheliport_ts_altimetersource.altimetersource_pt_id = AltimeterSourcePropertyType.id
-- ContactInformationPropertyType
LEFT JOIN airport_heliport.airportheliport_ts_contact
ON airport_heliport.airportheliport_ts.id = airportheliport_ts_contact.airportheliport_ts_id
LEFT JOIN airport_heliport.airportheliport_ts
ON airportheliport_ts_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- AirportHeliportAvailabilityPropertyType
LEFT JOIN airport_heliport.airportheliport_ts_availability
ON airport_heliport.airportheliport_ts.id = airportheliport_ts_availability.airportheliport_ts_id
LEFT JOIN airport_heliport.airportheliport_ts
ON airportheliport_ts_availability.airportheliportavailability_pt_id = AirportHeliportAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.airportheliport_ts_annotation
ON airport_heliport.airportheliport_ts.id = airportheliport_ts_annotation.airportheliport_ts_id
LEFT JOIN airport_heliport.airportheliport_ts
ON airportheliport_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportTimeSlicePropertyType
LEFT JOIN airport_heliport.airportheliport_timeslice
ON airport_heliport.airportheliport.id = airportheliport_timeslice.airportheliport_id
LEFT JOIN airport_heliport.airportheliport
ON airportheliport_timeslice.airportheliport_tsp_id = AirportHeliportTimeSlicePropertyType.id
;

AirportHeliportProtectionArea
CREATE OR REPLACE VIEW airportheliportprotectionarea_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportprotectionarea_pt.id,
       'nilReason', airport_heliport.airportheliportprotectionarea_pt.nilReason,
       'href', airport_heliport.airportheliportprotectionarea_pt.href
    ) AS airportheliportprotectionarea
FROM


;

AirportHeliportResponsibilityOrganisation
CREATE OR REPLACE VIEW airportheliportresponsibilityorganisation_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportresponsibilityorganisation_pt.id,
       'role_value', airport_heliport.airportheliportresponsibilityorganisation.role_value,
       'role_nilreason', airport_heliport.airportheliportresponsibilityorganisation.role_nilreason,
       'id', airport_heliport.airportheliportresponsibilityorganisation.id,
       'identifier', airport_heliport.airportheliportresponsibilityorganisation.identifier,
       'identifier_code_space', airport_heliport.airportheliportresponsibilityorganisation.identifier_code_space,
       'xml_id', airport_heliport.airportheliportresponsibilityorganisation.xml_id
    ) AS airportheliportresponsibilityorganisation
FROM

-- AirportHeliportResponsibilityOrganisationType
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation_pt
ON airport_heliport.airportheliportresponsibilityorganisation_pt.airportheliportresponsibilityorganisation_id = AirportHeliportResponsibilityOrganisationType.id
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
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation_timeinterval
ON airport_heliport.airportheliportresponsibilityorganisation.id = airportheliportresponsibilityorganisation_timeinterval.airportheliportresponsibilityorganisation_id
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON airportheliportresponsibilityorganisation_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation_annotation
ON airport_heliport.airportheliportresponsibilityorganisation.id = airportheliportresponsibilityorganisation_annotation.airportheliportresponsibilityorganisation_id
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON airportheliportresponsibilityorganisation_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation_specialdateauthority
ON airport_heliport.airportheliportresponsibilityorganisation.id = airportheliportresponsibilityorganisation_specialdateauthority.airportheliportresponsibilityorganisation_id
LEFT JOIN airport_heliport.airportheliportresponsibilityorganisation
ON airportheliportresponsibilityorganisation_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

AirportHeliportUsage
CREATE OR REPLACE VIEW airportheliportusage_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportheliportusage_pt.id,
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
    ) AS airportheliportusage
FROM

-- AirportHeliportUsageType
LEFT JOIN airport_heliport.airportheliportusage_pt
ON airport_heliport.airportheliportusage_pt.airportheliportusage_id = AirportHeliportUsageType.id
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
LEFT JOIN airport_heliport.airportheliportusage_contact
ON airport_heliport.airportheliportusage.id = airportheliportusage_contact.airportheliportusage_id
LEFT JOIN airport_heliport.airportheliportusage
ON airportheliportusage_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.airportheliportusage_annotation
ON airport_heliport.airportheliportusage.id = airportheliportusage_annotation.airportheliportusage_id
LEFT JOIN airport_heliport.airportheliportusage
ON airportheliportusage_annotation.note_pt_id = NotePropertyType.id
;

AirportHotSpot
CREATE OR REPLACE VIEW airporthotspot_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airporthotspot_pt.id,
       'nilReason', airport_heliport.airporthotspot_pt.nilReason,
       'href', airport_heliport.airporthotspot_pt.href,
       'id', airport_heliport.airporthotspot_tsp.id,
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
       'feature_lifetime_end', airport_heliport.airporthotspot_ts.feature_lifetime_end,
       'id', airport_heliport.airporthotspot.id,
       'identifier', airport_heliport.airporthotspot.identifier,
       'identifier_code_space', airport_heliport.airporthotspot.identifier_code_space,
       'xml_id', airport_heliport.airporthotspot.xml_id
    ) AS airporthotspot
FROM

-- AirportHotSpotTimeSliceType
LEFT JOIN airport_heliport.airporthotspot_tsp
ON airport_heliport.airporthotspot_tsp.airporthotspottimeslice_id = AirportHotSpotTimeSliceType.id
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
LEFT JOIN airport_heliport.airporthotspot_ts_annotation
ON airport_heliport.airporthotspot_ts.id = airporthotspot_ts_annotation.airporthotspot_ts_id
LEFT JOIN airport_heliport.airporthotspot_ts
ON airporthotspot_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHotSpotTimeSlicePropertyType
LEFT JOIN airport_heliport.airporthotspot_timeslice
ON airport_heliport.airporthotspot.id = airporthotspot_timeslice.airporthotspot_id
LEFT JOIN airport_heliport.airporthotspot
ON airporthotspot_timeslice.airporthotspot_tsp_id = AirportHotSpotTimeSlicePropertyType.id
;

AirportProtectionAreaMarking
CREATE OR REPLACE VIEW airportprotectionareamarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.airportprotectionareamarking_pt.id,
       'nilReason', airport_heliport.airportprotectionareamarking_pt.nilReason,
       'href', airport_heliport.airportprotectionareamarking_pt.href,
       'id', airport_heliport.airportprotectionareamarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.airportprotectionareamarking_ts.feature_lifetime_end,
       'id', airport_heliport.airportprotectionareamarking.id,
       'identifier', airport_heliport.airportprotectionareamarking.identifier,
       'identifier_code_space', airport_heliport.airportprotectionareamarking.identifier_code_space,
       'xml_id', airport_heliport.airportprotectionareamarking.xml_id
    ) AS airportprotectionareamarking
FROM

-- AirportProtectionAreaMarkingTimeSliceType
LEFT JOIN airport_heliport.airportprotectionareamarking_tsp
ON airport_heliport.airportprotectionareamarking_tsp.airportprotectionareamarkingtimeslice_id = AirportProtectionAreaMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.airportprotectionareamarking_ts_element
ON airport_heliport.airportprotectionareamarking_ts.id = airportprotectionareamarking_ts_element.airportprotectionareamarking_ts_id
LEFT JOIN airport_heliport.airportprotectionareamarking_ts
ON airportprotectionareamarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.airportprotectionareamarking_ts_annotation
ON airport_heliport.airportprotectionareamarking_ts.id = airportprotectionareamarking_ts_annotation.airportprotectionareamarking_ts_id
LEFT JOIN airport_heliport.airportprotectionareamarking_ts
ON airportprotectionareamarking_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportProtectionAreaMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.airportprotectionareamarking_timeslice
ON airport_heliport.airportprotectionareamarking.id = airportprotectionareamarking_timeslice.airportprotectionareamarking_id
LEFT JOIN airport_heliport.airportprotectionareamarking
ON airportprotectionareamarking_timeslice.airportprotectionareamarking_tsp_id = AirportProtectionAreaMarkingTimeSlicePropertyType.id
;

AirportSuppliesService
CREATE OR REPLACE VIEW airportsuppliesservice_view AS
SELECT
    jsonb_build_object(
       'id', service.airportsuppliesservice_pt.id,
       'nilReason', service.airportsuppliesservice_pt.nilReason,
       'href', service.airportsuppliesservice_pt.href,
       'id', service.airportsuppliesservice_tsp.id,
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
       'feature_lifetime_end', service.airportsuppliesservice_ts.feature_lifetime_end,
       'id', service.airportsuppliesservice.id,
       'identifier', service.airportsuppliesservice.identifier,
       'identifier_code_space', service.airportsuppliesservice.identifier_code_space,
       'xml_id', service.airportsuppliesservice.xml_id
    ) AS airportsuppliesservice
FROM

-- AirportSuppliesServiceTimeSliceType
LEFT JOIN service.airportsuppliesservice_tsp
ON service.airportsuppliesservice_tsp.airportsuppliesservicetimeslice_id = AirportSuppliesServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.airportsuppliesservice_ts_radiocommunication
ON service.airportsuppliesservice_ts.id = airportsuppliesservice_ts_radiocommunication.airportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.airportsuppliesservice_ts_groundcommunication
ON service.airportsuppliesservice_ts.id = airportsuppliesservice_ts_groundcommunication.airportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.airportsuppliesservice_ts_availability
ON service.airportsuppliesservice_ts.id = airportsuppliesservice_ts_availability.airportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.airportsuppliesservice_ts_annotation
ON service.airportsuppliesservice_ts.id = airportsuppliesservice_ts_annotation.airportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.airportsuppliesservice_ts_airportheliport
ON service.airportsuppliesservice_ts.id = airportsuppliesservice_ts_airportheliport.airportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesservice_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- FuelPropertyType
LEFT JOIN service.airportsuppliesairportsuppliesservice_ts_fuelsupply
ON service.airportsuppliesservice_ts.id = airportsuppliesairportsuppliesservice_ts_fuelsupply.airportsuppliesairportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesairportsuppliesservice_ts_fuelsupply.fuel_pt_id = FuelPropertyType.id
-- OilPropertyType
LEFT JOIN service.airportsuppliesairportsuppliesservice_ts_oilsupply
ON service.airportsuppliesservice_ts.id = airportsuppliesairportsuppliesservice_ts_oilsupply.airportsuppliesairportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesairportsuppliesservice_ts_oilsupply.oil_pt_id = OilPropertyType.id
-- NitrogenPropertyType
LEFT JOIN service.airportsuppliesairportsuppliesservice_ts_nitrogensupply
ON service.airportsuppliesservice_ts.id = airportsuppliesairportsuppliesservice_ts_nitrogensupply.airportsuppliesairportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesairportsuppliesservice_ts_nitrogensupply.nitrogen_pt_id = NitrogenPropertyType.id
-- OxygenPropertyType
LEFT JOIN service.airportsuppliesairportsuppliesservice_ts_oxygensupply
ON service.airportsuppliesservice_ts.id = airportsuppliesairportsuppliesservice_ts_oxygensupply.airportsuppliesairportsuppliesservice_ts_id
LEFT JOIN service.airportsuppliesservice_ts
ON airportsuppliesairportsuppliesservice_ts_oxygensupply.oxygen_pt_id = OxygenPropertyType.id
-- AirportSuppliesServiceTimeSlicePropertyType
LEFT JOIN service.airportsuppliesservice_timeslice
ON service.airportsuppliesservice.id = airportsuppliesservice_timeslice.airportsuppliesservice_id
LEFT JOIN service.airportsuppliesservice
ON airportsuppliesservice_timeslice.airportsuppliesservice_tsp_id = AirportSuppliesServiceTimeSlicePropertyType.id
;

AirspaceActivation
CREATE OR REPLACE VIEW airspaceactivation_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspaceactivation_pt.id,
       'activity_value', airspace.airspaceactivation.activity_value,
       'activity_nilreason', airspace.airspaceactivation.activity_nilreason,
       'status_value', airspace.airspaceactivation.status_value,
       'status_nilreason', airspace.airspaceactivation.status_nilreason,
       'id', airspace.airspaceactivation.id,
       'identifier', airspace.airspaceactivation.identifier,
       'identifier_code_space', airspace.airspaceactivation.identifier_code_space,
       'xml_id', airspace.airspaceactivation.xml_id
    ) AS airspaceactivation
FROM

-- AirspaceActivationType
LEFT JOIN airspace.airspaceactivation_pt
ON airspace.airspaceactivation_pt.airspaceactivation_id = AirspaceActivationType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspaceactivation
ON airspace.airspaceactivation.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspaceactivation
ON airspace.airspaceactivation.abstractairspaceactivationextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airspace.airspaceactivation_timeinterval
ON airspace.airspaceactivation.id = airspaceactivation_timeinterval.airspaceactivation_id
LEFT JOIN airspace.airspaceactivation
ON airspaceactivation_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airspace.airspaceactivation_annotation
ON airspace.airspaceactivation.id = airspaceactivation_annotation.airspaceactivation_id
LEFT JOIN airspace.airspaceactivation
ON airspaceactivation_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airspace.airspaceactivation_specialdateauthority
ON airspace.airspaceactivation.id = airspaceactivation_specialdateauthority.airspaceactivation_id
LEFT JOIN airspace.airspaceactivation
ON airspaceactivation_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN airspace.airspaceactivation_levels
ON airspace.airspaceactivation.id = airspaceactivation_levels.airspaceactivation_id
LEFT JOIN airspace.airspaceactivation
ON airspaceactivation_levels.airspacelayer_pt_id = AirspaceLayerPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airspace.airspaceactivation_user
ON airspace.airspaceactivation.id = airspaceactivation_user.airspaceactivation_id
LEFT JOIN airspace.airspaceactivation
ON airspaceactivation_user.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN airspace.airspaceactivation_aircraft
ON airspace.airspaceactivation.id = airspaceactivation_aircraft.airspaceactivation_id
LEFT JOIN airspace.airspaceactivation
ON airspaceactivation_aircraft.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
;

AirspaceBorderCrossing
CREATE OR REPLACE VIEW airspacebordercrossing_view AS
SELECT
    jsonb_build_object(
       'id', routes.airspacebordercrossing_pt.id,
       'nilReason', routes.airspacebordercrossing_pt.nilReason,
       'href', routes.airspacebordercrossing_pt.href,
       'id', routes.airspacebordercrossing_tsp.id,
       'id', routes.airspacebordercrossing_ts.id,
       'xml_id', routes.airspacebordercrossing_ts.xml_id,
       'interpretation', routes.airspacebordercrossing_ts.interpretation,
       'sequence_number', routes.airspacebordercrossing_ts.sequence_number,
       'correction_number', routes.airspacebordercrossing_ts.correction_number,
       'valid_time_begin', routes.airspacebordercrossing_ts.valid_time_begin,
       'valid_time_end', routes.airspacebordercrossing_ts.valid_time_end,
       'feature_lifetime_begin', routes.airspacebordercrossing_ts.feature_lifetime_begin,
       'feature_lifetime_end', routes.airspacebordercrossing_ts.feature_lifetime_end,
       'id', routes.airspacebordercrossing.id,
       'identifier', routes.airspacebordercrossing.identifier,
       'identifier_code_space', routes.airspacebordercrossing.identifier_code_space,
       'xml_id', routes.airspacebordercrossing.xml_id
    ) AS airspacebordercrossing
FROM

-- AirspaceBorderCrossingTimeSliceType
LEFT JOIN routes.airspacebordercrossing_tsp
ON routes.airspacebordercrossing_tsp.airspacebordercrossingtimeslice_id = AirspaceBorderCrossingTimeSliceType.id
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
LEFT JOIN routes.airspacebordercrossing_ts_annotation
ON routes.airspacebordercrossing_ts.id = airspacebordercrossing_ts_annotation.airspacebordercrossing_ts_id
LEFT JOIN routes.airspacebordercrossing_ts
ON airspacebordercrossing_ts_annotation.note_pt_id = NotePropertyType.id
-- AirspaceBorderCrossingTimeSlicePropertyType
LEFT JOIN routes.airspacebordercrossing_timeslice
ON routes.airspacebordercrossing.id = airspacebordercrossing_timeslice.airspacebordercrossing_id
LEFT JOIN routes.airspacebordercrossing
ON airspacebordercrossing_timeslice.airspacebordercrossing_tsp_id = AirspaceBorderCrossingTimeSlicePropertyType.id
;

AirspaceGeometryComponent
CREATE OR REPLACE VIEW airspacegeometrycomponent_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacegeometrycomponent_pt.id,
       'operation_value', airspace.airspacegeometrycomponent.operation_value,
       'operation_nilreason', airspace.airspacegeometrycomponent.operation_nilreason,
       'operationsequence_value', airspace.airspacegeometrycomponent.operationsequence_value,
       'operationsequence_nilreason', airspace.airspacegeometrycomponent.operationsequence_nilreason,
       'id', airspace.airspacegeometrycomponent.id,
       'identifier', airspace.airspacegeometrycomponent.identifier,
       'identifier_code_space', airspace.airspacegeometrycomponent.identifier_code_space,
       'xml_id', airspace.airspacegeometrycomponent.xml_id
    ) AS airspacegeometrycomponent
FROM

-- AirspaceGeometryComponentType
LEFT JOIN airspace.airspacegeometrycomponent_pt
ON airspace.airspacegeometrycomponent_pt.airspacegeometrycomponent_id = AirspaceGeometryComponentType.id
-- AirspaceVolumePropertyType
LEFT JOIN airspace.airspacegeometrycomponent
ON airspace.airspacegeometrycomponent.theairspacevolume_id = AirspaceVolumePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacegeometrycomponent
ON airspace.airspacegeometrycomponent.abstractairspacegeometrycomponentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.airspacegeometrycomponent_annotation
ON airspace.airspacegeometrycomponent.id = airspacegeometrycomponent_annotation.airspacegeometrycomponent_id
LEFT JOIN airspace.airspacegeometrycomponent
ON airspacegeometrycomponent_annotation.note_pt_id = NotePropertyType.id
;

AirspaceLayerClass
CREATE OR REPLACE VIEW airspacelayerclass_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacelayerclass_pt.id,
       'classification_value', airspace.airspacelayerclass.classification_value,
       'classification_nilreason', airspace.airspacelayerclass.classification_nilreason,
       'id', airspace.airspacelayerclass.id,
       'identifier', airspace.airspacelayerclass.identifier,
       'identifier_code_space', airspace.airspacelayerclass.identifier_code_space,
       'xml_id', airspace.airspacelayerclass.xml_id
    ) AS airspacelayerclass
FROM

-- AirspaceLayerClassType
LEFT JOIN airspace.airspacelayerclass_pt
ON airspace.airspacelayerclass_pt.airspacelayerclass_id = AirspaceLayerClassType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacelayerclass
ON airspace.airspacelayerclass.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacelayerclass
ON airspace.airspacelayerclass.abstractairspacelayerclassextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airspace.airspacelayerclass_timeinterval
ON airspace.airspacelayerclass.id = airspacelayerclass_timeinterval.airspacelayerclass_id
LEFT JOIN airspace.airspacelayerclass
ON airspacelayerclass_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airspace.airspacelayerclass_annotation
ON airspace.airspacelayerclass.id = airspacelayerclass_annotation.airspacelayerclass_id
LEFT JOIN airspace.airspacelayerclass
ON airspacelayerclass_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airspace.airspacelayerclass_specialdateauthority
ON airspace.airspacelayerclass.id = airspacelayerclass_specialdateauthority.airspacelayerclass_id
LEFT JOIN airspace.airspacelayerclass
ON airspacelayerclass_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN airspace.airspacelayerclass_associatedlevels
ON airspace.airspacelayerclass.id = airspacelayerclass_associatedlevels.airspacelayerclass_id
LEFT JOIN airspace.airspacelayerclass
ON airspacelayerclass_associatedlevels.airspacelayer_pt_id = AirspaceLayerPropertyType.id
;

AirspaceLayer
CREATE OR REPLACE VIEW airspacelayer_view AS
SELECT
    jsonb_build_object(
       'id', shared.airspacelayer_pt.id,
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
    ) AS airspacelayer
FROM

-- AirspaceLayerType
LEFT JOIN shared.airspacelayer_pt
ON shared.airspacelayer_pt.airspacelayer_id = AirspaceLayerType.id
-- StandardLevelColumnPropertyType
LEFT JOIN shared.airspacelayer
ON shared.airspacelayer.discretelevelseries_id = StandardLevelColumnPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.airspacelayer
ON shared.airspacelayer.abstractairspacelayerextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.airspacelayer_annotation
ON shared.airspacelayer.id = airspacelayer_annotation.airspacelayer_id
LEFT JOIN shared.airspacelayer
ON airspacelayer_annotation.note_pt_id = NotePropertyType.id
;

Airspace
CREATE OR REPLACE VIEW airspace_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspace_pt.id,
       'nilReason', airspace.airspace_pt.nilReason,
       'href', airspace.airspace_pt.href,
       'id', airspace.airspace_tsp.id,
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
       'feature_lifetime_end', airspace.airspace_ts.feature_lifetime_end,
       'id', airspace.airspace.id,
       'identifier', airspace.airspace.identifier,
       'identifier_code_space', airspace.airspace.identifier_code_space,
       'xml_id', airspace.airspace.xml_id
    ) AS airspace
FROM

-- AirspaceTimeSliceType
LEFT JOIN airspace.airspace_tsp
ON airspace.airspace_tsp.airspacetimeslice_id = AirspaceTimeSliceType.id
-- RoutePropertyType
LEFT JOIN airspace.airspace_ts
ON airspace.airspace_ts.protectedroute_id = RoutePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspace_ts
ON airspace.airspace_ts.abstractairspaceextension_id = AbstractExtensionType.id

-- AirspaceLayerClassPropertyType
LEFT JOIN airspace.airspace_ts_class
ON airspace.airspace_ts.id = airspace_ts_class.airspace_ts_id
LEFT JOIN airspace.airspace_ts
ON airspace_ts_class.airspacelayerclass_pt_id = AirspaceLayerClassPropertyType.id
-- AirspaceGeometryComponentPropertyType
LEFT JOIN airspace.airspace_ts_geometrycomponent
ON airspace.airspace_ts.id = airspace_ts_geometrycomponent.airspace_ts_id
LEFT JOIN airspace.airspace_ts
ON airspace_ts_geometrycomponent.airspacegeometrycomponent_pt_id = AirspaceGeometryComponentPropertyType.id
-- AirspaceActivationPropertyType
LEFT JOIN airspace.airspace_ts_activation
ON airspace.airspace_ts.id = airspace_ts_activation.airspace_ts_id
LEFT JOIN airspace.airspace_ts
ON airspace_ts_activation.airspaceactivation_pt_id = AirspaceActivationPropertyType.id
-- NotePropertyType
LEFT JOIN airspace.airspace_ts_annotation
ON airspace.airspace_ts.id = airspace_ts_annotation.airspace_ts_id
LEFT JOIN airspace.airspace_ts
ON airspace_ts_annotation.note_pt_id = NotePropertyType.id
-- AirspaceTimeSlicePropertyType
LEFT JOIN airspace.airspace_timeslice
ON airspace.airspace.id = airspace_timeslice.airspace_id
LEFT JOIN airspace.airspace
ON airspace_timeslice.airspace_tsp_id = AirspaceTimeSlicePropertyType.id
;

AirspaceVolumeDependency
CREATE OR REPLACE VIEW airspacevolumedependency_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacevolumedependency_pt.id,
       'dependency_value', airspace.airspacevolumedependency.dependency_value,
       'dependency_nilreason', airspace.airspacevolumedependency.dependency_nilreason,
       'id', airspace.airspacevolumedependency.id,
       'identifier', airspace.airspacevolumedependency.identifier,
       'identifier_code_space', airspace.airspacevolumedependency.identifier_code_space,
       'xml_id', airspace.airspacevolumedependency.xml_id
    ) AS airspacevolumedependency
FROM

-- AirspaceVolumeDependencyType
LEFT JOIN airspace.airspacevolumedependency_pt
ON airspace.airspacevolumedependency_pt.airspacevolumedependency_id = AirspaceVolumeDependencyType.id
-- AirspacePropertyType
LEFT JOIN airspace.airspacevolumedependency
ON airspace.airspacevolumedependency.theairspace_id = AirspacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.airspacevolumedependency
ON airspace.airspacevolumedependency.abstractairspacevolumedependencyextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.airspacevolumedependency_annotation
ON airspace.airspacevolumedependency.id = airspacevolumedependency_annotation.airspacevolumedependency_id
LEFT JOIN airspace.airspacevolumedependency
ON airspacevolumedependency_annotation.note_pt_id = NotePropertyType.id
;

AirspaceVolume
CREATE OR REPLACE VIEW airspacevolume_view AS
SELECT
    jsonb_build_object(
       'id', airspace.airspacevolume_pt.id,
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
    ) AS airspacevolume
FROM

-- AirspaceVolumeType
LEFT JOIN airspace.airspacevolume_pt
ON airspace.airspacevolume_pt.airspacevolume_id = AirspaceVolumeType.id
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
LEFT JOIN airspace.airspacevolume_annotation
ON airspace.airspacevolume.id = airspacevolume_annotation.airspacevolume_id
LEFT JOIN airspace.airspacevolume
ON airspacevolume_annotation.note_pt_id = NotePropertyType.id
;

AirTrafficControlService
CREATE OR REPLACE VIEW airtrafficcontrolservice_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficcontrolservice_pt.id,
       'nilReason', service.airtrafficcontrolservice_pt.nilReason,
       'href', service.airtrafficcontrolservice_pt.href,
       'id', service.airtrafficcontrolservice_tsp.id,
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
       'feature_lifetime_end', service.airtrafficcontrolservice_ts.feature_lifetime_end,
       'id', service.airtrafficcontrolservice.id,
       'identifier', service.airtrafficcontrolservice.identifier,
       'identifier_code_space', service.airtrafficcontrolservice.identifier_code_space,
       'xml_id', service.airtrafficcontrolservice.xml_id
    ) AS airtrafficcontrolservice
FROM

-- AirTrafficControlServiceTimeSliceType
LEFT JOIN service.airtrafficcontrolservice_tsp
ON service.airtrafficcontrolservice_tsp.airtrafficcontrolservicetimeslice_id = AirTrafficControlServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.airtrafficcontrolservice_ts_radiocommunication
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolservice_ts_radiocommunication.airtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.airtrafficcontrolservice_ts_groundcommunication
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolservice_ts_groundcommunication.airtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.airtrafficcontrolservice_ts_availability
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolservice_ts_availability.airtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.airtrafficcontrolservice_ts_annotation
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolservice_ts_annotation.airtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.airtrafficcontrolairtrafficcontrolservice_ts_clientairport
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolairtrafficcontrolservice_ts_clientairport.airtrafficcontrolairtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolairtrafficcontrolservice_ts_clientairport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- AirspacePropertyType
LEFT JOIN service.airtrafficcontrolairtrafficcontrolservice_ts_clientairspace
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolairtrafficcontrolservice_ts_clientairspace.airtrafficcontrolairtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolairtrafficcontrolservice_ts_clientairspace.airspace_pt_id = AirspacePropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.airtrafficcontrolairtrafficcontrolservice_ts_clientroute
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolairtrafficcontrolservice_ts_clientroute.airtrafficcontrolairtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolairtrafficcontrolservice_ts_clientroute.routeportion_pt_id = RoutePortionPropertyType.id
-- ProcedurePropertyType
LEFT JOIN service.airtrafficcontrolairtrafficcontrolservice_ts_clientprocedure
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolairtrafficcontrolservice_ts_clientprocedure.airtrafficcontrolairtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolairtrafficcontrolservice_ts_clientprocedure.procedure_pt_id = ProcedurePropertyType.id
-- HoldingPatternPropertyType
LEFT JOIN service.airtrafficcontrolairtrafficcontrolservice_ts_clientholding
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolairtrafficcontrolservice_ts_clientholding.airtrafficcontrolairtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolairtrafficcontrolservice_ts_clientholding.holdingpattern_pt_id = HoldingPatternPropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN service.airtrafficcontrolairtrafficcontrolservice_ts_clientaerialrefuelling
ON service.airtrafficcontrolservice_ts.id = airtrafficcontrolairtrafficcontrolservice_ts_clientaerialrefuelling.airtrafficcontrolairtrafficcontrolservice_ts_id
LEFT JOIN service.airtrafficcontrolservice_ts
ON airtrafficcontrolairtrafficcontrolservice_ts_clientaerialrefuelling.aerialrefuelling_pt_id = AerialRefuellingPropertyType.id
-- AirTrafficControlServiceTimeSlicePropertyType
LEFT JOIN service.airtrafficcontrolservice_timeslice
ON service.airtrafficcontrolservice.id = airtrafficcontrolservice_timeslice.airtrafficcontrolservice_id
LEFT JOIN service.airtrafficcontrolservice
ON airtrafficcontrolservice_timeslice.airtrafficcontrolservice_tsp_id = AirTrafficControlServiceTimeSlicePropertyType.id
;

AirTrafficManagementService
CREATE OR REPLACE VIEW airtrafficmanagementservice_view AS
SELECT
    jsonb_build_object(
       'id', service.airtrafficmanagementservice_pt.id,
       'nilReason', service.airtrafficmanagementservice_pt.nilReason,
       'href', service.airtrafficmanagementservice_pt.href,
       'id', service.airtrafficmanagementservice_tsp.id,
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
       'feature_lifetime_end', service.airtrafficmanagementservice_ts.feature_lifetime_end,
       'id', service.airtrafficmanagementservice.id,
       'identifier', service.airtrafficmanagementservice.identifier,
       'identifier_code_space', service.airtrafficmanagementservice.identifier_code_space,
       'xml_id', service.airtrafficmanagementservice.xml_id
    ) AS airtrafficmanagementservice
FROM

-- AirTrafficManagementServiceTimeSliceType
LEFT JOIN service.airtrafficmanagementservice_tsp
ON service.airtrafficmanagementservice_tsp.airtrafficmanagementservicetimeslice_id = AirTrafficManagementServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.airtrafficmanagementservice_ts_radiocommunication
ON service.airtrafficmanagementservice_ts.id = airtrafficmanagementservice_ts_radiocommunication.airtrafficmanagementservice_ts_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON airtrafficmanagementservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.airtrafficmanagementservice_ts_groundcommunication
ON service.airtrafficmanagementservice_ts.id = airtrafficmanagementservice_ts_groundcommunication.airtrafficmanagementservice_ts_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON airtrafficmanagementservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.airtrafficmanagementservice_ts_availability
ON service.airtrafficmanagementservice_ts.id = airtrafficmanagementservice_ts_availability.airtrafficmanagementservice_ts_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON airtrafficmanagementservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.airtrafficmanagementservice_ts_annotation
ON service.airtrafficmanagementservice_ts.id = airtrafficmanagementservice_ts_annotation.airtrafficmanagementservice_ts_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON airtrafficmanagementservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirspacePropertyType
LEFT JOIN service.airtrafficmanagementairtrafficmanagementservice_ts_clientairspace
ON service.airtrafficmanagementservice_ts.id = airtrafficmanagementairtrafficmanagementservice_ts_clientairspace.airtrafficmanagementairtrafficmanagementservice_ts_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON airtrafficmanagementairtrafficmanagementservice_ts_clientairspace.airspace_pt_id = AirspacePropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN service.airtrafficmanagementairtrafficmanagementservice_ts_clientaerialrefuelling
ON service.airtrafficmanagementservice_ts.id = airtrafficmanagementairtrafficmanagementservice_ts_clientaerialrefuelling.airtrafficmanagementairtrafficmanagementservice_ts_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON airtrafficmanagementairtrafficmanagementservice_ts_clientaerialrefuelling.aerialrefuelling_pt_id = AerialRefuellingPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.airtrafficmanagementairtrafficmanagementservice_ts_clientroute
ON service.airtrafficmanagementservice_ts.id = airtrafficmanagementairtrafficmanagementservice_ts_clientroute.airtrafficmanagementairtrafficmanagementservice_ts_id
LEFT JOIN service.airtrafficmanagementservice_ts
ON airtrafficmanagementairtrafficmanagementservice_ts_clientroute.routeportion_pt_id = RoutePortionPropertyType.id
-- AirTrafficManagementServiceTimeSlicePropertyType
LEFT JOIN service.airtrafficmanagementservice_timeslice
ON service.airtrafficmanagementservice.id = airtrafficmanagementservice_timeslice.airtrafficmanagementservice_id
LEFT JOIN service.airtrafficmanagementservice
ON airtrafficmanagementservice_timeslice.airtrafficmanagementservice_tsp_id = AirTrafficManagementServiceTimeSlicePropertyType.id
;

AltimeterSource
CREATE OR REPLACE VIEW altimetersource_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.altimetersource_pt.id,
       'nilReason', airport_heliport.altimetersource_pt.nilReason,
       'href', airport_heliport.altimetersource_pt.href,
       'id', airport_heliport.altimetersource_tsp.id,
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
       'feature_lifetime_end', airport_heliport.altimetersource_ts.feature_lifetime_end,
       'id', airport_heliport.altimetersource.id,
       'identifier', airport_heliport.altimetersource.identifier,
       'identifier_code_space', airport_heliport.altimetersource.identifier_code_space,
       'xml_id', airport_heliport.altimetersource.xml_id
    ) AS altimetersource
FROM

-- AltimeterSourceTimeSliceType
LEFT JOIN airport_heliport.altimetersource_tsp
ON airport_heliport.altimetersource_tsp.altimetersourcetimeslice_id = AltimeterSourceTimeSliceType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.altimetersource_ts
ON airport_heliport.altimetersource_ts.abstractaltimetersourceextension_id = AbstractExtensionType.id

-- AltimeterSourceStatusPropertyType
LEFT JOIN airport_heliport.altimetersource_ts_availability
ON airport_heliport.altimetersource_ts.id = altimetersource_ts_availability.altimetersource_ts_id
LEFT JOIN airport_heliport.altimetersource_ts
ON altimetersource_ts_availability.altimetersourcestatus_pt_id = AltimeterSourceStatusPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.altimetersource_ts_annotation
ON airport_heliport.altimetersource_ts.id = altimetersource_ts_annotation.altimetersource_ts_id
LEFT JOIN airport_heliport.altimetersource_ts
ON altimetersource_ts_annotation.note_pt_id = NotePropertyType.id
-- AltimeterSourceTimeSlicePropertyType
LEFT JOIN airport_heliport.altimetersource_timeslice
ON airport_heliport.altimetersource.id = altimetersource_timeslice.altimetersource_id
LEFT JOIN airport_heliport.altimetersource
ON altimetersource_timeslice.altimetersource_tsp_id = AltimeterSourceTimeSlicePropertyType.id
;

AltimeterSourceStatus
CREATE OR REPLACE VIEW altimetersourcestatus_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.altimetersourcestatus_pt.id,
       'operationalstatus_value', airport_heliport.altimetersourcestatus.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.altimetersourcestatus.operationalstatus_nilreason,
       'id', airport_heliport.altimetersourcestatus.id,
       'identifier', airport_heliport.altimetersourcestatus.identifier,
       'identifier_code_space', airport_heliport.altimetersourcestatus.identifier_code_space,
       'xml_id', airport_heliport.altimetersourcestatus.xml_id
    ) AS altimetersourcestatus
FROM

-- AltimeterSourceStatusType
LEFT JOIN airport_heliport.altimetersourcestatus_pt
ON airport_heliport.altimetersourcestatus_pt.altimetersourcestatus_id = AltimeterSourceStatusType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.altimetersourcestatus
ON airport_heliport.altimetersourcestatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.altimetersourcestatus
ON airport_heliport.altimetersourcestatus.abstractaltimetersourcestatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.altimetersourcestatus_timeinterval
ON airport_heliport.altimetersourcestatus.id = altimetersourcestatus_timeinterval.altimetersourcestatus_id
LEFT JOIN airport_heliport.altimetersourcestatus
ON altimetersourcestatus_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.altimetersourcestatus_annotation
ON airport_heliport.altimetersourcestatus.id = altimetersourcestatus_annotation.altimetersourcestatus_id
LEFT JOIN airport_heliport.altimetersourcestatus
ON altimetersourcestatus_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.altimetersourcestatus_specialdateauthority
ON airport_heliport.altimetersourcestatus.id = altimetersourcestatus_specialdateauthority.altimetersourcestatus_id
LEFT JOIN airport_heliport.altimetersourcestatus
ON altimetersourcestatus_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

AltitudeAdjustment
CREATE OR REPLACE VIEW altitudeadjustment_view AS
SELECT
    jsonb_build_object(
       'id', shared.altitudeadjustment_pt.id,
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
    ) AS altitudeadjustment
FROM

-- AltitudeAdjustmentType
LEFT JOIN shared.altitudeadjustment_pt
ON shared.altitudeadjustment_pt.altitudeadjustment_id = AltitudeAdjustmentType.id
-- AbstractExtensionType
LEFT JOIN shared.altitudeadjustment
ON shared.altitudeadjustment.abstractaltitudeadjustmentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.altitudeadjustment_annotation
ON shared.altitudeadjustment.id = altitudeadjustment_annotation.altitudeadjustment_id
LEFT JOIN shared.altitudeadjustment
ON altitudeadjustment_annotation.note_pt_id = NotePropertyType.id
;

AngleIndication
CREATE OR REPLACE VIEW angleindication_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.angleindication_pt.id,
       'nilReason', navaids_points.angleindication_pt.nilReason,
       'href', navaids_points.angleindication_pt.href,
       'id', navaids_points.angleindication_tsp.id,
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
       'feature_lifetime_end', navaids_points.angleindication_ts.feature_lifetime_end,
       'id', navaids_points.angleindication.id,
       'identifier', navaids_points.angleindication.identifier,
       'identifier_code_space', navaids_points.angleindication.identifier_code_space,
       'xml_id', navaids_points.angleindication.xml_id
    ) AS angleindication
FROM

-- AngleIndicationTimeSliceType
LEFT JOIN navaids_points.angleindication_tsp
ON navaids_points.angleindication_tsp.angleindicationtimeslice_id = AngleIndicationTimeSliceType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.fix_id = DesignatedPointPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.angleindication_ts_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.angleindication_ts
ON navaids_points.angleindication_ts.abstractangleindicationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.angleindication_ts_annotation
ON navaids_points.angleindication_ts.id = angleindication_ts_annotation.angleindication_ts_id
LEFT JOIN navaids_points.angleindication_ts
ON angleindication_ts_annotation.note_pt_id = NotePropertyType.id
-- AngleIndicationTimeSlicePropertyType
LEFT JOIN navaids_points.angleindication_timeslice
ON navaids_points.angleindication.id = angleindication_timeslice.angleindication_id
LEFT JOIN navaids_points.angleindication
ON angleindication_timeslice.angleindication_tsp_id = AngleIndicationTimeSlicePropertyType.id
;

AngleUse
CREATE OR REPLACE VIEW angleuse_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.angleuse_pt.id,
       'alongcourseguidance_value', navaids_points.angleuse.alongcourseguidance_value,
       'alongcourseguidance_nilreason', navaids_points.angleuse.alongcourseguidance_nilreason,
       'id', navaids_points.angleuse.id,
       'identifier', navaids_points.angleuse.identifier,
       'identifier_code_space', navaids_points.angleuse.identifier_code_space,
       'xml_id', navaids_points.angleuse.xml_id
    ) AS angleuse
FROM

-- AngleUseType
LEFT JOIN navaids_points.angleuse_pt
ON navaids_points.angleuse_pt.angleuse_id = AngleUseType.id
-- AngleIndicationPropertyType
LEFT JOIN navaids_points.angleuse
ON navaids_points.angleuse.theangleindication_id = AngleIndicationPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.angleuse
ON navaids_points.angleuse.abstractangleuseextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.angleuse_annotation
ON navaids_points.angleuse.id = angleuse_annotation.angleuse_id
LEFT JOIN navaids_points.angleuse
ON angleuse_annotation.note_pt_id = NotePropertyType.id
;

ApproachAltitudeTable
CREATE OR REPLACE VIEW approachaltitudetable_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachaltitudetable_pt.id,
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
    ) AS approachaltitudetable
FROM

-- ApproachAltitudeTableType
LEFT JOIN procedure.approachaltitudetable_pt
ON procedure.approachaltitudetable_pt.approachaltitudetable_id = ApproachAltitudeTableType.id
-- AbstractExtensionType
LEFT JOIN procedure.approachaltitudetable
ON procedure.approachaltitudetable.abstractapproachaltitudetableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.approachaltitudetable_annotation
ON procedure.approachaltitudetable.id = approachaltitudetable_annotation.approachaltitudetable_id
LEFT JOIN procedure.approachaltitudetable
ON approachaltitudetable_annotation.note_pt_id = NotePropertyType.id
;

ApproachCondition
CREATE OR REPLACE VIEW approachcondition_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachcondition_pt.id,
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
    ) AS approachcondition
FROM

-- ApproachConditionType
LEFT JOIN procedure.approachcondition_pt
ON procedure.approachcondition_pt.approachcondition_id = ApproachConditionType.id
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
LEFT JOIN procedure.approachcondition_circlingrestriction
ON procedure.approachcondition.id = approachcondition_circlingrestriction.approachcondition_id
LEFT JOIN procedure.approachcondition
ON approachcondition_circlingrestriction.circlingrestriction_pt_id = CirclingRestrictionPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.approachcondition_aircraftcategory
ON procedure.approachcondition.id = approachcondition_aircraftcategory.approachcondition_id
LEFT JOIN procedure.approachcondition
ON approachcondition_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- LandingTakeoffAreaCollectionPropertyType
LEFT JOIN procedure.approachcondition_landingarea
ON procedure.approachcondition.id = approachcondition_landingarea.approachcondition_id
LEFT JOIN procedure.approachcondition
ON approachcondition_landingarea.landingtakeoffareacollection_pt_id = LandingTakeoffAreaCollectionPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.approachcondition_designsurface
ON procedure.approachcondition.id = approachcondition_designsurface.approachcondition_id
LEFT JOIN procedure.approachcondition
ON approachcondition_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.approachcondition_annotation
ON procedure.approachcondition.id = approachcondition_annotation.approachcondition_id
LEFT JOIN procedure.approachcondition
ON approachcondition_annotation.note_pt_id = NotePropertyType.id
;

ApproachDistanceTable
CREATE OR REPLACE VIEW approachdistancetable_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachdistancetable_pt.id,
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
    ) AS approachdistancetable
FROM

-- ApproachDistanceTableType
LEFT JOIN procedure.approachdistancetable_pt
ON procedure.approachdistancetable_pt.approachdistancetable_id = ApproachDistanceTableType.id
-- AbstractExtensionType
LEFT JOIN procedure.approachdistancetable
ON procedure.approachdistancetable.abstractapproachdistancetableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.approachdistancetable_annotation
ON procedure.approachdistancetable.id = approachdistancetable_annotation.approachdistancetable_id
LEFT JOIN procedure.approachdistancetable
ON approachdistancetable_annotation.note_pt_id = NotePropertyType.id
;

ApproachLeg
CREATE OR REPLACE VIEW approachleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachleg_pt.id,
       'nilReason', procedure.approachleg_pt.nilReason,
       'href', procedure.approachleg_pt.href
    ) AS approachleg
FROM


;

ApproachLightingSystem
CREATE OR REPLACE VIEW approachlightingsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.approachlightingsystem_pt.id,
       'nilReason', airport_heliport.approachlightingsystem_pt.nilReason,
       'href', airport_heliport.approachlightingsystem_pt.href,
       'id', airport_heliport.approachlightingsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.approachlightingsystem_ts.feature_lifetime_end,
       'id', airport_heliport.approachlightingsystem.id,
       'identifier', airport_heliport.approachlightingsystem.identifier,
       'identifier_code_space', airport_heliport.approachlightingsystem.identifier_code_space,
       'xml_id', airport_heliport.approachlightingsystem.xml_id
    ) AS approachlightingsystem
FROM

-- ApproachLightingSystemTimeSliceType
LEFT JOIN airport_heliport.approachlightingsystem_tsp
ON airport_heliport.approachlightingsystem_tsp.approachlightingsystemtimeslice_id = ApproachLightingSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.approachlightingsystem_ts_element
ON airport_heliport.approachlightingsystem_ts.id = approachlightingsystem_ts_element.approachlightingsystem_ts_id
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON approachlightingsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.approachlightingsystem_ts_availability
ON airport_heliport.approachlightingsystem_ts.id = approachlightingsystem_ts_availability.approachlightingsystem_ts_id
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON approachlightingsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.approachlightingsystem_ts_annotation
ON airport_heliport.approachlightingsystem_ts.id = approachlightingsystem_ts_annotation.approachlightingsystem_ts_id
LEFT JOIN airport_heliport.approachlightingsystem_ts
ON approachlightingsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- ApproachLightingSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.approachlightingsystem_timeslice
ON airport_heliport.approachlightingsystem.id = approachlightingsystem_timeslice.approachlightingsystem_id
LEFT JOIN airport_heliport.approachlightingsystem
ON approachlightingsystem_timeslice.approachlightingsystem_tsp_id = ApproachLightingSystemTimeSlicePropertyType.id
;

ApproachTimingTable
CREATE OR REPLACE VIEW approachtimingtable_view AS
SELECT
    jsonb_build_object(
       'id', procedure.approachtimingtable_pt.id,
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
    ) AS approachtimingtable
FROM

-- ApproachTimingTableType
LEFT JOIN procedure.approachtimingtable_pt
ON procedure.approachtimingtable_pt.approachtimingtable_id = ApproachTimingTableType.id
-- AbstractExtensionType
LEFT JOIN procedure.approachtimingtable
ON procedure.approachtimingtable.abstractapproachtimingtableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.approachtimingtable_annotation
ON procedure.approachtimingtable.id = approachtimingtable_annotation.approachtimingtable_id
LEFT JOIN procedure.approachtimingtable
ON approachtimingtable_annotation.note_pt_id = NotePropertyType.id
;

ApronAreaAvailability
CREATE OR REPLACE VIEW apronareaavailability_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronareaavailability_pt.id,
       'operationalstatus_value', airport_heliport.apronareaavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.apronareaavailability.operationalstatus_nilreason,
       'warning_value', airport_heliport.apronareaavailability.warning_value,
       'warning_nilreason', airport_heliport.apronareaavailability.warning_nilreason,
       'id', airport_heliport.apronareaavailability.id,
       'identifier', airport_heliport.apronareaavailability.identifier,
       'identifier_code_space', airport_heliport.apronareaavailability.identifier_code_space,
       'xml_id', airport_heliport.apronareaavailability.xml_id
    ) AS apronareaavailability
FROM

-- ApronAreaAvailabilityType
LEFT JOIN airport_heliport.apronareaavailability_pt
ON airport_heliport.apronareaavailability_pt.apronareaavailability_id = ApronAreaAvailabilityType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronareaavailability
ON airport_heliport.apronareaavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.apronareaavailability
ON airport_heliport.apronareaavailability.abstractapronareaavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.apronareaavailability_timeinterval
ON airport_heliport.apronareaavailability.id = apronareaavailability_timeinterval.apronareaavailability_id
LEFT JOIN airport_heliport.apronareaavailability
ON apronareaavailability_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.apronareaavailability_annotation
ON airport_heliport.apronareaavailability.id = apronareaavailability_annotation.apronareaavailability_id
LEFT JOIN airport_heliport.apronareaavailability
ON apronareaavailability_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.apronareaavailability_specialdateauthority
ON airport_heliport.apronareaavailability.id = apronareaavailability_specialdateauthority.apronareaavailability_id
LEFT JOIN airport_heliport.apronareaavailability
ON apronareaavailability_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- ApronAreaUsagePropertyType
LEFT JOIN airport_heliport.apronareaavailability_usage
ON airport_heliport.apronareaavailability.id = apronareaavailability_usage.apronareaavailability_id
LEFT JOIN airport_heliport.apronareaavailability
ON apronareaavailability_usage.apronareausage_pt_id = ApronAreaUsagePropertyType.id
;

ApronAreaUsage
CREATE OR REPLACE VIEW apronareausage_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronareausage_pt.id,
       'type_value', airport_heliport.apronareausage.type_value,
       'type_nilreason', airport_heliport.apronareausage.type_nilreason,
       'priorpermission_value', airport_heliport.apronareausage.priorpermission_value,
       'priorpermission_uom', airport_heliport.apronareausage.priorpermission_uom,
       'priorpermission_nilreason', airport_heliport.apronareausage.priorpermission_nilreason,
       'id', airport_heliport.apronareausage.id,
       'identifier', airport_heliport.apronareausage.identifier,
       'identifier_code_space', airport_heliport.apronareausage.identifier_code_space,
       'xml_id', airport_heliport.apronareausage.xml_id
    ) AS apronareausage
FROM

-- ApronAreaUsageType
LEFT JOIN airport_heliport.apronareausage_pt
ON airport_heliport.apronareausage_pt.apronareausage_id = ApronAreaUsageType.id
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
LEFT JOIN airport_heliport.apronareausage_contact
ON airport_heliport.apronareausage.id = apronareausage_contact.apronareausage_id
LEFT JOIN airport_heliport.apronareausage
ON apronareausage_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.apronareausage_annotation
ON airport_heliport.apronareausage.id = apronareausage_annotation.apronareausage_id
LEFT JOIN airport_heliport.apronareausage
ON apronareausage_annotation.note_pt_id = NotePropertyType.id
;

ApronContamination
CREATE OR REPLACE VIEW aproncontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.aproncontamination_pt.id,
       'observationtime_value', airport_heliport.aproncontamination.observationtime_value,
       'observationtime_nilreason', airport_heliport.aproncontamination.observationtime_nilreason,
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
       'nextobservationtime_value', airport_heliport.aproncontamination.nextobservationtime_value,
       'nextobservationtime_nilreason', airport_heliport.aproncontamination.nextobservationtime_nilreason,
       'proportion_value', airport_heliport.aproncontamination.proportion_value,
       'proportion_nilreason', airport_heliport.aproncontamination.proportion_nilreason,
       'depth_value', airport_heliport.aproncontamination.depth_value,
       'depth_uom', airport_heliport.aproncontamination.depth_uom,
       'depth_nilreason', airport_heliport.aproncontamination.depth_nilreason,
       'id', airport_heliport.aproncontamination.id,
       'identifier', airport_heliport.aproncontamination.identifier,
       'identifier_code_space', airport_heliport.aproncontamination.identifier_code_space,
       'xml_id', airport_heliport.aproncontamination.xml_id
    ) AS aproncontamination
FROM

-- ApronContaminationType
LEFT JOIN airport_heliport.aproncontamination_pt
ON airport_heliport.aproncontamination_pt.aproncontamination_id = ApronContaminationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.aproncontamination
ON airport_heliport.aproncontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.aproncontamination
ON airport_heliport.aproncontamination.abstractaproncontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.aproncontamination_criticalridge
ON airport_heliport.aproncontamination.id = aproncontamination_criticalridge.aproncontamination_id
LEFT JOIN airport_heliport.aproncontamination
ON aproncontamination_criticalridge.ridge_pt_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.aproncontamination_layer
ON airport_heliport.aproncontamination.id = aproncontamination_layer.aproncontamination_id
LEFT JOIN airport_heliport.aproncontamination
ON aproncontamination_layer.surfacecontaminationlayer_pt_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.aproncontamination_annotation
ON airport_heliport.aproncontamination.id = aproncontamination_annotation.aproncontamination_id
LEFT JOIN airport_heliport.aproncontamination
ON aproncontamination_annotation.note_pt_id = NotePropertyType.id
;

ApronElement
CREATE OR REPLACE VIEW apronelement_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronelement_pt.id,
       'nilReason', airport_heliport.apronelement_pt.nilReason,
       'href', airport_heliport.apronelement_pt.href,
       'id', airport_heliport.apronelement_tsp.id,
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
       'feature_lifetime_end', airport_heliport.apronelement_ts.feature_lifetime_end,
       'id', airport_heliport.apronelement.id,
       'identifier', airport_heliport.apronelement.identifier,
       'identifier_code_space', airport_heliport.apronelement.identifier_code_space,
       'xml_id', airport_heliport.apronelement.xml_id
    ) AS apronelement
FROM

-- ApronElementTimeSliceType
LEFT JOIN airport_heliport.apronelement_tsp
ON airport_heliport.apronelement_tsp.apronelementtimeslice_id = ApronElementTimeSliceType.id
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
LEFT JOIN airport_heliport.apronelement_ts_supplyservice
ON airport_heliport.apronelement_ts.id = apronelement_ts_supplyservice.apronelement_ts_id
LEFT JOIN airport_heliport.apronelement_ts
ON apronelement_ts_supplyservice.airportsuppliesservice_pt_id = AirportSuppliesServicePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.apronelement_ts_annotation
ON airport_heliport.apronelement_ts.id = apronelement_ts_annotation.apronelement_ts_id
LEFT JOIN airport_heliport.apronelement_ts
ON apronelement_ts_annotation.note_pt_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.apronelement_ts_availability
ON airport_heliport.apronelement_ts.id = apronelement_ts_availability.apronelement_ts_id
LEFT JOIN airport_heliport.apronelement_ts
ON apronelement_ts_availability.apronareaavailability_pt_id = ApronAreaAvailabilityPropertyType.id
-- ApronElementTimeSlicePropertyType
LEFT JOIN airport_heliport.apronelement_timeslice
ON airport_heliport.apronelement.id = apronelement_timeslice.apronelement_id
LEFT JOIN airport_heliport.apronelement
ON apronelement_timeslice.apronelement_tsp_id = ApronElementTimeSlicePropertyType.id
;

ApronLightSystem
CREATE OR REPLACE VIEW apronlightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronlightsystem_pt.id,
       'nilReason', airport_heliport.apronlightsystem_pt.nilReason,
       'href', airport_heliport.apronlightsystem_pt.href,
       'id', airport_heliport.apronlightsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.apronlightsystem_ts.feature_lifetime_end,
       'id', airport_heliport.apronlightsystem.id,
       'identifier', airport_heliport.apronlightsystem.identifier,
       'identifier_code_space', airport_heliport.apronlightsystem.identifier_code_space,
       'xml_id', airport_heliport.apronlightsystem.xml_id
    ) AS apronlightsystem
FROM

-- ApronLightSystemTimeSliceType
LEFT JOIN airport_heliport.apronlightsystem_tsp
ON airport_heliport.apronlightsystem_tsp.apronlightsystemtimeslice_id = ApronLightSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.apronlightsystem_ts_element
ON airport_heliport.apronlightsystem_ts.id = apronlightsystem_ts_element.apronlightsystem_ts_id
LEFT JOIN airport_heliport.apronlightsystem_ts
ON apronlightsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.apronlightsystem_ts_availability
ON airport_heliport.apronlightsystem_ts.id = apronlightsystem_ts_availability.apronlightsystem_ts_id
LEFT JOIN airport_heliport.apronlightsystem_ts
ON apronlightsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.apronlightsystem_ts_annotation
ON airport_heliport.apronlightsystem_ts.id = apronlightsystem_ts_annotation.apronlightsystem_ts_id
LEFT JOIN airport_heliport.apronlightsystem_ts
ON apronlightsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- ApronLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.apronlightsystem_timeslice
ON airport_heliport.apronlightsystem.id = apronlightsystem_timeslice.apronlightsystem_id
LEFT JOIN airport_heliport.apronlightsystem
ON apronlightsystem_timeslice.apronlightsystem_tsp_id = ApronLightSystemTimeSlicePropertyType.id
;

ApronMarking
CREATE OR REPLACE VIEW apronmarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apronmarking_pt.id,
       'nilReason', airport_heliport.apronmarking_pt.nilReason,
       'href', airport_heliport.apronmarking_pt.href,
       'id', airport_heliport.apronmarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.apronmarking_ts.feature_lifetime_end,
       'id', airport_heliport.apronmarking.id,
       'identifier', airport_heliport.apronmarking.identifier,
       'identifier_code_space', airport_heliport.apronmarking.identifier_code_space,
       'xml_id', airport_heliport.apronmarking.xml_id
    ) AS apronmarking
FROM

-- ApronMarkingTimeSliceType
LEFT JOIN airport_heliport.apronmarking_tsp
ON airport_heliport.apronmarking_tsp.apronmarkingtimeslice_id = ApronMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.apronmarking_ts_element
ON airport_heliport.apronmarking_ts.id = apronmarking_ts_element.apronmarking_ts_id
LEFT JOIN airport_heliport.apronmarking_ts
ON apronmarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.apronmarking_ts_annotation
ON airport_heliport.apronmarking_ts.id = apronmarking_ts_annotation.apronmarking_ts_id
LEFT JOIN airport_heliport.apronmarking_ts
ON apronmarking_ts_annotation.note_pt_id = NotePropertyType.id
-- ApronMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.apronmarking_timeslice
ON airport_heliport.apronmarking.id = apronmarking_timeslice.apronmarking_id
LEFT JOIN airport_heliport.apronmarking
ON apronmarking_timeslice.apronmarking_tsp_id = ApronMarkingTimeSlicePropertyType.id
;

Apron
CREATE OR REPLACE VIEW apron_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.apron_pt.id,
       'nilReason', airport_heliport.apron_pt.nilReason,
       'href', airport_heliport.apron_pt.href,
       'id', airport_heliport.apron_tsp.id,
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
       'feature_lifetime_end', airport_heliport.apron_ts.feature_lifetime_end,
       'id', airport_heliport.apron.id,
       'identifier', airport_heliport.apron.identifier,
       'identifier_code_space', airport_heliport.apron.identifier_code_space,
       'xml_id', airport_heliport.apron.xml_id
    ) AS apron
FROM

-- ApronTimeSliceType
LEFT JOIN airport_heliport.apron_tsp
ON airport_heliport.apron_tsp.aprontimeslice_id = ApronTimeSliceType.id
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
LEFT JOIN airport_heliport.apron_ts_contaminant
ON airport_heliport.apron_ts.id = apron_ts_contaminant.apron_ts_id
LEFT JOIN airport_heliport.apron_ts
ON apron_ts_contaminant.aproncontamination_pt_id = ApronContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.apron_ts_annotation
ON airport_heliport.apron_ts.id = apron_ts_annotation.apron_ts_id
LEFT JOIN airport_heliport.apron_ts
ON apron_ts_annotation.note_pt_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.apron_ts_availability
ON airport_heliport.apron_ts.id = apron_ts_availability.apron_ts_id
LEFT JOIN airport_heliport.apron_ts
ON apron_ts_availability.apronareaavailability_pt_id = ApronAreaAvailabilityPropertyType.id
-- ApronTimeSlicePropertyType
LEFT JOIN airport_heliport.apron_timeslice
ON airport_heliport.apron.id = apron_timeslice.apron_id
LEFT JOIN airport_heliport.apron
ON apron_timeslice.apron_tsp_id = ApronTimeSlicePropertyType.id
;

ArrestingGear
CREATE OR REPLACE VIEW arrestinggear_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.arrestinggear_pt.id,
       'nilReason', airport_heliport.arrestinggear_pt.nilReason,
       'href', airport_heliport.arrestinggear_pt.href,
       'id', airport_heliport.arrestinggear_tsp.id,
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
       'feature_lifetime_end', airport_heliport.arrestinggear_ts.feature_lifetime_end,
       'id', airport_heliport.arrestinggear.id,
       'identifier', airport_heliport.arrestinggear.identifier,
       'identifier_code_space', airport_heliport.arrestinggear.identifier_code_space,
       'xml_id', airport_heliport.arrestinggear.xml_id
    ) AS arrestinggear
FROM

-- ArrestingGearTimeSliceType
LEFT JOIN airport_heliport.arrestinggear_tsp
ON airport_heliport.arrestinggear_tsp.arrestinggeartimeslice_id = ArrestingGearTimeSliceType.id
-- SurfaceCharacteristicsPropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.surfaceproperties_id = SurfaceCharacteristicsPropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.extent_surfaceextent_id = ElevatedSurfacePropertyType.id
-- ElevatedCurvePropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.extent_curveextent_id = ElevatedCurvePropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.extent_pointextent_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.arrestinggear_ts
ON airport_heliport.arrestinggear_ts.abstractarrestinggearextension_id = AbstractExtensionType.id

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.arrestinggear_ts_runwaydirection
ON airport_heliport.arrestinggear_ts.id = arrestinggear_ts_runwaydirection.arrestinggear_ts_id
LEFT JOIN airport_heliport.arrestinggear_ts
ON arrestinggear_ts_runwaydirection.runwaydirection_pt_id = RunwayDirectionPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.arrestinggear_ts_annotation
ON airport_heliport.arrestinggear_ts.id = arrestinggear_ts_annotation.arrestinggear_ts_id
LEFT JOIN airport_heliport.arrestinggear_ts
ON arrestinggear_ts_annotation.note_pt_id = NotePropertyType.id
-- ArrestingGearTimeSlicePropertyType
LEFT JOIN airport_heliport.arrestinggear_timeslice
ON airport_heliport.arrestinggear.id = arrestinggear_timeslice.arrestinggear_id
LEFT JOIN airport_heliport.arrestinggear
ON arrestinggear_timeslice.arrestinggear_tsp_id = ArrestingGearTimeSlicePropertyType.id
;

ArrivalFeederLeg
CREATE OR REPLACE VIEW arrivalfeederleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalfeederleg_pt.id,
       'nilReason', procedure.arrivalfeederleg_pt.nilReason,
       'href', procedure.arrivalfeederleg_pt.href,
       'id', procedure.arrivalfeederleg_tsp.id,
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
       'feature_lifetime_end', procedure.arrivalfeederleg_ts.feature_lifetime_end,
       'id', procedure.arrivalfeederleg.id,
       'identifier', procedure.arrivalfeederleg.identifier,
       'identifier_code_space', procedure.arrivalfeederleg.identifier_code_space,
       'xml_id', procedure.arrivalfeederleg.xml_id
    ) AS arrivalfeederleg
FROM

-- ArrivalFeederLegTimeSliceType
LEFT JOIN procedure.arrivalfeederleg_tsp
ON procedure.arrivalfeederleg_tsp.arrivalfeederlegtimeslice_id = ArrivalFeederLegTimeSliceType.id
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
LEFT JOIN procedure.arrivalfeederleg_ts_aircraftcategory
ON procedure.arrivalfeederleg_ts.id = arrivalfeederleg_ts_aircraftcategory.arrivalfeederleg_ts_id
LEFT JOIN procedure.arrivalfeederleg_ts
ON arrivalfeederleg_ts_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.arrivalfeederleg_ts_designsurface
ON procedure.arrivalfeederleg_ts.id = arrivalfeederleg_ts_designsurface.arrivalfeederleg_ts_id
LEFT JOIN procedure.arrivalfeederleg_ts
ON arrivalfeederleg_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.arrivalfeederleg_ts_annotation
ON procedure.arrivalfeederleg_ts.id = arrivalfeederleg_ts_annotation.arrivalfeederleg_ts_id
LEFT JOIN procedure.arrivalfeederleg_ts
ON arrivalfeederleg_ts_annotation.note_pt_id = NotePropertyType.id
-- ArrivalFeederLegTimeSlicePropertyType
LEFT JOIN procedure.arrivalfeederleg_timeslice
ON procedure.arrivalfeederleg.id = arrivalfeederleg_timeslice.arrivalfeederleg_id
LEFT JOIN procedure.arrivalfeederleg
ON arrivalfeederleg_timeslice.arrivalfeederleg_tsp_id = ArrivalFeederLegTimeSlicePropertyType.id
;

ArrivalLeg
CREATE OR REPLACE VIEW arrivalleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.arrivalleg_pt.id,
       'nilReason', procedure.arrivalleg_pt.nilReason,
       'href', procedure.arrivalleg_pt.href,
       'id', procedure.arrivalleg_tsp.id,
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
       'feature_lifetime_end', procedure.arrivalleg_ts.feature_lifetime_end,
       'id', procedure.arrivalleg.id,
       'identifier', procedure.arrivalleg.identifier,
       'identifier_code_space', procedure.arrivalleg.identifier_code_space,
       'xml_id', procedure.arrivalleg.xml_id
    ) AS arrivalleg
FROM

-- ArrivalLegTimeSliceType
LEFT JOIN procedure.arrivalleg_tsp
ON procedure.arrivalleg_tsp.arrivallegtimeslice_id = ArrivalLegTimeSliceType.id
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
LEFT JOIN procedure.arrivalleg_ts_aircraftcategory
ON procedure.arrivalleg_ts.id = arrivalleg_ts_aircraftcategory.arrivalleg_ts_id
LEFT JOIN procedure.arrivalleg_ts
ON arrivalleg_ts_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.arrivalleg_ts_designsurface
ON procedure.arrivalleg_ts.id = arrivalleg_ts_designsurface.arrivalleg_ts_id
LEFT JOIN procedure.arrivalleg_ts
ON arrivalleg_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.arrivalleg_ts_annotation
ON procedure.arrivalleg_ts.id = arrivalleg_ts_annotation.arrivalleg_ts_id
LEFT JOIN procedure.arrivalleg_ts
ON arrivalleg_ts_annotation.note_pt_id = NotePropertyType.id
-- ArrivalLegTimeSlicePropertyType
LEFT JOIN procedure.arrivalleg_timeslice
ON procedure.arrivalleg.id = arrivalleg_timeslice.arrivalleg_id
LEFT JOIN procedure.arrivalleg
ON arrivalleg_timeslice.arrivalleg_tsp_id = ArrivalLegTimeSlicePropertyType.id
;

AuthorityForAerialRefuelling
CREATE OR REPLACE VIEW authorityforaerialrefuelling_view AS
SELECT
    jsonb_build_object(
       'id', aerial_refuelling.authorityforaerialrefuelling_pt.id,
       'type_value', aerial_refuelling.authorityforaerialrefuelling.type_value,
       'type_nilreason', aerial_refuelling.authorityforaerialrefuelling.type_nilreason,
       'id', aerial_refuelling.authorityforaerialrefuelling.id,
       'identifier', aerial_refuelling.authorityforaerialrefuelling.identifier,
       'identifier_code_space', aerial_refuelling.authorityforaerialrefuelling.identifier_code_space,
       'xml_id', aerial_refuelling.authorityforaerialrefuelling.xml_id
    ) AS authorityforaerialrefuelling
FROM

-- AuthorityForAerialRefuellingType
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling_pt
ON aerial_refuelling.authorityforaerialrefuelling_pt.authorityforaerialrefuelling_id = AuthorityForAerialRefuellingType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling
ON aerial_refuelling.authorityforaerialrefuelling.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling
ON aerial_refuelling.authorityforaerialrefuelling.abstractauthorityforaerialrefuellingextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN aerial_refuelling.authorityforauthorityforaerialrefuelling_annotation
ON aerial_refuelling.authorityforaerialrefuelling.id = authorityforauthorityforaerialrefuelling_annotation.authorityforauthorityforaerialrefuelling_id
LEFT JOIN aerial_refuelling.authorityforaerialrefuelling
ON authorityforauthorityforaerialrefuelling_annotation.note_pt_id = NotePropertyType.id
;

AuthorityForAirspace
CREATE OR REPLACE VIEW authorityforairspace_view AS
SELECT
    jsonb_build_object(
       'id', airspace.authorityforairspace_pt.id,
       'nilReason', airspace.authorityforairspace_pt.nilReason,
       'href', airspace.authorityforairspace_pt.href,
       'id', airspace.authorityforairspace_tsp.id,
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
       'feature_lifetime_end', airspace.authorityforairspace_ts.feature_lifetime_end,
       'id', airspace.authorityforairspace.id,
       'identifier', airspace.authorityforairspace.identifier,
       'identifier_code_space', airspace.authorityforairspace.identifier_code_space,
       'xml_id', airspace.authorityforairspace.xml_id
    ) AS authorityforairspace
FROM

-- AuthorityForAirspaceTimeSliceType
LEFT JOIN airspace.authorityforairspace_tsp
ON airspace.authorityforairspace_tsp.authorityforairspacetimeslice_id = AuthorityForAirspaceTimeSliceType.id
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
LEFT JOIN airspace.authorityforauthorityforairspace_ts_annotation
ON airspace.authorityforairspace_ts.id = authorityforauthorityforairspace_ts_annotation.authorityforauthorityforairspace_ts_id
LEFT JOIN airspace.authorityforairspace_ts
ON authorityforauthorityforairspace_ts_annotation.note_pt_id = NotePropertyType.id
-- AuthorityForAirspaceTimeSlicePropertyType
LEFT JOIN airspace.authorityforairspace_timeslice
ON airspace.authorityforairspace.id = authorityforairspace_timeslice.authorityforairspace_id
LEFT JOIN airspace.authorityforairspace
ON authorityforairspace_timeslice.authorityforairspace_tsp_id = AuthorityForAirspaceTimeSlicePropertyType.id
;

AuthorityForNavaidEquipment
CREATE OR REPLACE VIEW authorityfornavaidequipment_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.authorityfornavaidequipment_pt.id,
       'type_value', navaids_points.authorityfornavaidequipment.type_value,
       'type_nilreason', navaids_points.authorityfornavaidequipment.type_nilreason,
       'id', navaids_points.authorityfornavaidequipment.id,
       'identifier', navaids_points.authorityfornavaidequipment.identifier,
       'identifier_code_space', navaids_points.authorityfornavaidequipment.identifier_code_space,
       'xml_id', navaids_points.authorityfornavaidequipment.xml_id
    ) AS authorityfornavaidequipment
FROM

-- AuthorityForNavaidEquipmentType
LEFT JOIN navaids_points.authorityfornavaidequipment_pt
ON navaids_points.authorityfornavaidequipment_pt.authorityfornavaidequipment_id = AuthorityForNavaidEquipmentType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.authorityfornavaidequipment
ON navaids_points.authorityfornavaidequipment.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.authorityfornavaidequipment
ON navaids_points.authorityfornavaidequipment.abstractauthorityfornavaidequipmentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.authorityforauthorityfornavaidequipment_annotation
ON navaids_points.authorityfornavaidequipment.id = authorityforauthorityfornavaidequipment_annotation.authorityforauthorityfornavaidequipment_id
LEFT JOIN navaids_points.authorityfornavaidequipment
ON authorityforauthorityfornavaidequipment_annotation.note_pt_id = NotePropertyType.id
;

AuthorityForSpecialNavigationStation
CREATE OR REPLACE VIEW authorityforspecialnavigationstation_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.authorityforspecialnavigationstation_pt.id,
       'type_value', navaids_points.authorityforspecialnavigationstation.type_value,
       'type_nilreason', navaids_points.authorityforspecialnavigationstation.type_nilreason,
       'id', navaids_points.authorityforspecialnavigationstation.id,
       'identifier', navaids_points.authorityforspecialnavigationstation.identifier,
       'identifier_code_space', navaids_points.authorityforspecialnavigationstation.identifier_code_space,
       'xml_id', navaids_points.authorityforspecialnavigationstation.xml_id
    ) AS authorityforspecialnavigationstation
FROM

-- AuthorityForSpecialNavigationStationType
LEFT JOIN navaids_points.authorityforspecialnavigationstation_pt
ON navaids_points.authorityforspecialnavigationstation_pt.authorityforspecialnavigationstation_id = AuthorityForSpecialNavigationStationType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.authorityforspecialnavigationstation
ON navaids_points.authorityforspecialnavigationstation.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.authorityforspecialnavigationstation
ON navaids_points.authorityforspecialnavigationstation.abstractauthorityforspecialnavigationstationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.authorityforspecialnavigationstation_annotation
ON navaids_points.authorityforspecialnavigationstation.id = authorityforspecialnavigationstation_annotation.authorityforspecialnavigationstation_id
LEFT JOIN navaids_points.authorityforspecialnavigationstation
ON authorityforspecialnavigationstation_annotation.note_pt_id = NotePropertyType.id
;

AuthorityForSpecialNavigationSystem
CREATE OR REPLACE VIEW authorityforspecialnavigationsystem_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.authorityforspecialnavigationsystem_pt.id,
       'type_value', navaids_points.authorityforspecialnavigationsystem.type_value,
       'type_nilreason', navaids_points.authorityforspecialnavigationsystem.type_nilreason,
       'id', navaids_points.authorityforspecialnavigationsystem.id,
       'identifier', navaids_points.authorityforspecialnavigationsystem.identifier,
       'identifier_code_space', navaids_points.authorityforspecialnavigationsystem.identifier_code_space,
       'xml_id', navaids_points.authorityforspecialnavigationsystem.xml_id
    ) AS authorityforspecialnavigationsystem
FROM

-- AuthorityForSpecialNavigationSystemType
LEFT JOIN navaids_points.authorityforspecialnavigationsystem_pt
ON navaids_points.authorityforspecialnavigationsystem_pt.authorityforspecialnavigationsystem_id = AuthorityForSpecialNavigationSystemType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.authorityforspecialnavigationsystem
ON navaids_points.authorityforspecialnavigationsystem.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.authorityforspecialnavigationsystem
ON navaids_points.authorityforspecialnavigationsystem.abstractauthorityforspecialnavigationsystemextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.authorityforspecialnavigationsystem_annotation
ON navaids_points.authorityforspecialnavigationsystem.id = authorityforspecialnavigationsystem_annotation.authorityforspecialnavigationsystem_id
LEFT JOIN navaids_points.authorityforspecialnavigationsystem
ON authorityforspecialnavigationsystem_annotation.note_pt_id = NotePropertyType.id
;

Azimuth
CREATE OR REPLACE VIEW azimuth_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.azimuth_pt.id,
       'nilReason', navaids_points.azimuth_pt.nilReason,
       'href', navaids_points.azimuth_pt.href,
       'id', navaids_points.azimuth_tsp.id,
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
       'feature_lifetime_end', navaids_points.azimuth_ts.feature_lifetime_end,
       'id', navaids_points.azimuth.id,
       'identifier', navaids_points.azimuth.identifier,
       'identifier_code_space', navaids_points.azimuth.identifier_code_space,
       'xml_id', navaids_points.azimuth.xml_id
    ) AS azimuth
FROM

-- AzimuthTimeSliceType
LEFT JOIN navaids_points.azimuth_tsp
ON navaids_points.azimuth_tsp.azimuthtimeslice_id = AzimuthTimeSliceType.id
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
LEFT JOIN navaids_points.azimuth_ts_authority
ON navaids_points.azimuth_ts.id = azimuth_ts_authority.azimuth_ts_id
LEFT JOIN navaids_points.azimuth_ts
ON azimuth_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.azimuth_ts_monitoring
ON navaids_points.azimuth_ts.id = azimuth_ts_monitoring.azimuth_ts_id
LEFT JOIN navaids_points.azimuth_ts
ON azimuth_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.azimuth_ts_availability
ON navaids_points.azimuth_ts.id = azimuth_ts_availability.azimuth_ts_id
LEFT JOIN navaids_points.azimuth_ts
ON azimuth_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.azimuth_ts_annotation
ON navaids_points.azimuth_ts.id = azimuth_ts_annotation.azimuth_ts_id
LEFT JOIN navaids_points.azimuth_ts
ON azimuth_ts_annotation.note_pt_id = NotePropertyType.id
-- AzimuthTimeSlicePropertyType
LEFT JOIN navaids_points.azimuth_timeslice
ON navaids_points.azimuth.id = azimuth_timeslice.azimuth_id
LEFT JOIN navaids_points.azimuth
ON azimuth_timeslice.azimuth_tsp_id = AzimuthTimeSlicePropertyType.id
;

CallsignDetail
CREATE OR REPLACE VIEW callsigndetail_view AS
SELECT
    jsonb_build_object(
       'id', service.callsigndetail_pt.id,
       'callsign_value', service.callsigndetail.callsign_value,
       'callsign_nilreason', service.callsigndetail.callsign_nilreason,
       'language_value', service.callsigndetail.language_value,
       'language_nilreason', service.callsigndetail.language_nilreason,
       'id', service.callsigndetail.id,
       'identifier', service.callsigndetail.identifier,
       'identifier_code_space', service.callsigndetail.identifier_code_space,
       'xml_id', service.callsigndetail.xml_id
    ) AS callsigndetail
FROM

-- CallsignDetailType
LEFT JOIN service.callsigndetail_pt
ON service.callsigndetail_pt.callsigndetail_id = CallsignDetailType.id
-- AbstractExtensionType
LEFT JOIN service.callsigndetail
ON service.callsigndetail.abstractcallsigndetailextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.callsigndetail_annotation
ON service.callsigndetail.id = callsigndetail_annotation.callsigndetail_id
LEFT JOIN service.callsigndetail
ON callsigndetail_annotation.note_pt_id = NotePropertyType.id
;

ChangeOverPoint
CREATE OR REPLACE VIEW changeoverpoint_view AS
SELECT
    jsonb_build_object(
       'id', routes.changeoverpoint_pt.id,
       'nilReason', routes.changeoverpoint_pt.nilReason,
       'href', routes.changeoverpoint_pt.href,
       'id', routes.changeoverpoint_tsp.id,
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
       'feature_lifetime_end', routes.changeoverpoint_ts.feature_lifetime_end,
       'id', routes.changeoverpoint.id,
       'identifier', routes.changeoverpoint.identifier,
       'identifier_code_space', routes.changeoverpoint.identifier_code_space,
       'xml_id', routes.changeoverpoint.xml_id
    ) AS changeoverpoint
FROM

-- ChangeOverPointTimeSliceType
LEFT JOIN routes.changeoverpoint_tsp
ON routes.changeoverpoint_tsp.changeoverpointtimeslice_id = ChangeOverPointTimeSliceType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.location_airportreferencepoint_id = AirportHeliportPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.applicablerouteportion_id = RoutePortionPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.changeoverpoint_ts
ON routes.changeoverpoint_ts.abstractchangeoverpointextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.changeoverpoint_ts_annotation
ON routes.changeoverpoint_ts.id = changeoverpoint_ts_annotation.changeoverpoint_ts_id
LEFT JOIN routes.changeoverpoint_ts
ON changeoverpoint_ts_annotation.note_pt_id = NotePropertyType.id
-- ChangeOverPointTimeSlicePropertyType
LEFT JOIN routes.changeoverpoint_timeslice
ON routes.changeoverpoint.id = changeoverpoint_timeslice.changeoverpoint_id
LEFT JOIN routes.changeoverpoint
ON changeoverpoint_timeslice.changeoverpoint_tsp_id = ChangeOverPointTimeSlicePropertyType.id
;

CheckpointINS
CREATE OR REPLACE VIEW checkpointins_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointins_pt.id,
       'nilReason', navaids_points.checkpointins_pt.nilReason,
       'href', navaids_points.checkpointins_pt.href,
       'id', navaids_points.checkpointins_tsp.id,
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
       'feature_lifetime_end', navaids_points.checkpointins_ts.feature_lifetime_end,
       'id', navaids_points.checkpointins.id,
       'identifier', navaids_points.checkpointins.identifier,
       'identifier_code_space', navaids_points.checkpointins.identifier_code_space,
       'xml_id', navaids_points.checkpointins.xml_id
    ) AS checkpointins
FROM

-- CheckpointINSTimeSliceType
LEFT JOIN navaids_points.checkpointins_tsp
ON navaids_points.checkpointins_tsp.checkpointinstimeslice_id = CheckpointINSTimeSliceType.id
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
LEFT JOIN navaids_points.checkpointins_ts_annotation
ON navaids_points.checkpointins_ts.id = checkpointins_ts_annotation.checkpointins_ts_id
LEFT JOIN navaids_points.checkpointins_ts
ON checkpointins_ts_annotation.note_pt_id = NotePropertyType.id
-- CheckpointINSTimeSlicePropertyType
LEFT JOIN navaids_points.checkpointins_timeslice
ON navaids_points.checkpointins.id = checkpointins_timeslice.checkpointins_id
LEFT JOIN navaids_points.checkpointins
ON checkpointins_timeslice.checkpointins_tsp_id = CheckpointINSTimeSlicePropertyType.id
;

CheckpointVOR
CREATE OR REPLACE VIEW checkpointvor_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.checkpointvor_pt.id,
       'nilReason', navaids_points.checkpointvor_pt.nilReason,
       'href', navaids_points.checkpointvor_pt.href,
       'id', navaids_points.checkpointvor_tsp.id,
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
       'feature_lifetime_end', navaids_points.checkpointvor_ts.feature_lifetime_end,
       'id', navaids_points.checkpointvor.id,
       'identifier', navaids_points.checkpointvor.identifier,
       'identifier_code_space', navaids_points.checkpointvor.identifier_code_space,
       'xml_id', navaids_points.checkpointvor.xml_id
    ) AS checkpointvor
FROM

-- CheckpointVORTimeSliceType
LEFT JOIN navaids_points.checkpointvor_tsp
ON navaids_points.checkpointvor_tsp.checkpointvortimeslice_id = CheckpointVORTimeSliceType.id
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
LEFT JOIN navaids_points.checkpointvor_ts_annotation
ON navaids_points.checkpointvor_ts.id = checkpointvor_ts_annotation.checkpointvor_ts_id
LEFT JOIN navaids_points.checkpointvor_ts
ON checkpointvor_ts_annotation.note_pt_id = NotePropertyType.id
-- CheckpointVORTimeSlicePropertyType
LEFT JOIN navaids_points.checkpointvor_timeslice
ON navaids_points.checkpointvor.id = checkpointvor_timeslice.checkpointvor_id
LEFT JOIN navaids_points.checkpointvor
ON checkpointvor_timeslice.checkpointvor_tsp_id = CheckpointVORTimeSlicePropertyType.id
;

CircleSector
CREATE OR REPLACE VIEW circlesector_view AS
SELECT
    jsonb_build_object(
       'id', shared.circlesector_pt.id,
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
    ) AS circlesector
FROM

-- CircleSectorType
LEFT JOIN shared.circlesector_pt
ON shared.circlesector_pt.circlesector_id = CircleSectorType.id
-- AbstractExtensionType
LEFT JOIN shared.circlesector
ON shared.circlesector.abstractcirclesectorextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.circlesector_annotation
ON shared.circlesector.id = circlesector_annotation.circlesector_id
LEFT JOIN shared.circlesector
ON circlesector_annotation.note_pt_id = NotePropertyType.id
;

CirclingArea
CREATE OR REPLACE VIEW circlingarea_view AS
SELECT
    jsonb_build_object(
       'id', public.circlingarea_pt.id,
       'nilReason', public.circlingarea_pt.nilReason,
       'href', public.circlingarea_pt.href,
       'id', public.circlingarea_tsp.id,
       'id', public.circlingarea_ts.id,
       'xml_id', public.circlingarea_ts.xml_id,
       'interpretation', public.circlingarea_ts.interpretation,
       'sequence_number', public.circlingarea_ts.sequence_number,
       'correction_number', public.circlingarea_ts.correction_number,
       'valid_time_begin', public.circlingarea_ts.valid_time_begin,
       'valid_time_end', public.circlingarea_ts.valid_time_end,
       'feature_lifetime_begin', public.circlingarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', public.circlingarea_ts.feature_lifetime_end,
       'id', public.circlingarea.id,
       'identifier', public.circlingarea.identifier,
       'identifier_code_space', public.circlingarea.identifier_code_space,
       'xml_id', public.circlingarea.xml_id
    ) AS circlingarea
FROM

-- CirclingAreaTimeSliceType
LEFT JOIN public.circlingarea_tsp
ON public.circlingarea_tsp.circlingareatimeslice_id = CirclingAreaTimeSliceType.id
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
LEFT JOIN public.circlingarea_ts_condition
ON public.circlingarea_ts.id = circlingarea_ts_condition.circlingarea_ts_id
LEFT JOIN public.circlingarea_ts
ON circlingarea_ts_condition.approachcondition_pt_id = ApproachConditionPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN public.circlingarea_ts_designsurface
ON public.circlingarea_ts.id = circlingarea_ts_designsurface.circlingarea_ts_id
LEFT JOIN public.circlingarea_ts
ON circlingarea_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN public.circlingarea_ts_annotation
ON public.circlingarea_ts.id = circlingarea_ts_annotation.circlingarea_ts_id
LEFT JOIN public.circlingarea_ts
ON circlingarea_ts_annotation.note_pt_id = NotePropertyType.id
-- CirclingAreaTimeSlicePropertyType
LEFT JOIN public.circlingarea_timeslice
ON public.circlingarea.id = circlingarea_timeslice.circlingarea_id
LEFT JOIN public.circlingarea
ON circlingarea_timeslice.circlingarea_tsp_id = CirclingAreaTimeSlicePropertyType.id
;

CirclingRestriction
CREATE OR REPLACE VIEW circlingrestriction_view AS
SELECT
    jsonb_build_object(
       'id', procedure.circlingrestriction_pt.id,
       'id', procedure.circlingrestriction.id,
       'identifier', procedure.circlingrestriction.identifier,
       'identifier_code_space', procedure.circlingrestriction.identifier_code_space,
       'xml_id', procedure.circlingrestriction.xml_id
    ) AS circlingrestriction
FROM

-- CirclingRestrictionType
LEFT JOIN procedure.circlingrestriction_pt
ON procedure.circlingrestriction_pt.circlingrestriction_id = CirclingRestrictionType.id
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
LEFT JOIN procedure.circlingrestriction_timeinterval
ON procedure.circlingrestriction.id = circlingrestriction_timeinterval.circlingrestriction_id
LEFT JOIN procedure.circlingrestriction
ON circlingrestriction_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.circlingrestriction_annotation
ON procedure.circlingrestriction.id = circlingrestriction_annotation.circlingrestriction_id
LEFT JOIN procedure.circlingrestriction
ON circlingrestriction_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN procedure.circlingrestriction_specialdateauthority
ON procedure.circlingrestriction.id = circlingrestriction_specialdateauthority.circlingrestriction_id
LEFT JOIN procedure.circlingrestriction
ON circlingrestriction_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

City
CREATE OR REPLACE VIEW city_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.city_pt.id,
       'name_value', airport_heliport.city.name_value,
       'name_nilreason', airport_heliport.city.name_nilreason,
       'id', airport_heliport.city.id,
       'identifier', airport_heliport.city.identifier,
       'identifier_code_space', airport_heliport.city.identifier_code_space,
       'xml_id', airport_heliport.city.xml_id
    ) AS city
FROM

-- CityType
LEFT JOIN airport_heliport.city_pt
ON airport_heliport.city_pt.city_id = CityType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.city
ON airport_heliport.city.abstractcityextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.city_annotation
ON airport_heliport.city.id = city_annotation.city_id
LEFT JOIN airport_heliport.city
ON city_annotation.note_pt_id = NotePropertyType.id
;

ConditionCombination
CREATE OR REPLACE VIEW conditioncombination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.conditioncombination_pt.id,
       'logicaloperator_value', airport_heliport.conditioncombination.logicaloperator_value,
       'logicaloperator_nilreason', airport_heliport.conditioncombination.logicaloperator_nilreason,
       'id', airport_heliport.conditioncombination.id,
       'identifier', airport_heliport.conditioncombination.identifier,
       'identifier_code_space', airport_heliport.conditioncombination.identifier_code_space,
       'xml_id', airport_heliport.conditioncombination.xml_id
    ) AS conditioncombination
FROM

-- ConditionCombinationType
LEFT JOIN airport_heliport.conditioncombination_pt
ON airport_heliport.conditioncombination_pt.conditioncombination_id = ConditionCombinationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.conditioncombination
ON airport_heliport.conditioncombination.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.conditioncombination
ON airport_heliport.conditioncombination.abstractconditioncombinationextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.conditioncombination_timeinterval
ON airport_heliport.conditioncombination.id = conditioncombination_timeinterval.conditioncombination_id
LEFT JOIN airport_heliport.conditioncombination
ON conditioncombination_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.conditioncombination_annotation
ON airport_heliport.conditioncombination.id = conditioncombination_annotation.conditioncombination_id
LEFT JOIN airport_heliport.conditioncombination
ON conditioncombination_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.conditioncombination_specialdateauthority
ON airport_heliport.conditioncombination.id = conditioncombination_specialdateauthority.conditioncombination_id
LEFT JOIN airport_heliport.conditioncombination
ON conditioncombination_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- MeteorologyPropertyType
LEFT JOIN airport_heliport.conditioncombination_weather
ON airport_heliport.conditioncombination.id = conditioncombination_weather.conditioncombination_id
LEFT JOIN airport_heliport.conditioncombination
ON conditioncombination_weather.meteorology_pt_id = MeteorologyPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN airport_heliport.conditioncombination_aircraft
ON airport_heliport.conditioncombination.id = conditioncombination_aircraft.conditioncombination_id
LEFT JOIN airport_heliport.conditioncombination
ON conditioncombination_aircraft.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- FlightCharacteristicPropertyType
LEFT JOIN airport_heliport.conditioncombination_flight
ON airport_heliport.conditioncombination.id = conditioncombination_flight.conditioncombination_id
LEFT JOIN airport_heliport.conditioncombination
ON conditioncombination_flight.flightcharacteristic_pt_id = FlightCharacteristicPropertyType.id
-- ConditionCombinationPropertyType
LEFT JOIN airport_heliport.conditioncombination_subcondition
ON airport_heliport.conditioncombination.id = conditioncombination_subcondition.conditioncombination_id
LEFT JOIN airport_heliport.conditioncombination
ON conditioncombination_subcondition.conditioncombination_pt_id = ConditionCombinationPropertyType.id
;

ContactInformation
CREATE OR REPLACE VIEW contactinformation_view AS
SELECT
    jsonb_build_object(
       'id', shared.contactinformation_pt.id,
       'name_value', shared.contactinformation.name_value,
       'name_nilreason', shared.contactinformation.name_nilreason,
       'title_value', shared.contactinformation.title_value,
       'title_nilreason', shared.contactinformation.title_nilreason,
       'id', shared.contactinformation.id,
       'identifier', shared.contactinformation.identifier,
       'identifier_code_space', shared.contactinformation.identifier_code_space,
       'xml_id', shared.contactinformation.xml_id
    ) AS contactinformation
FROM

-- ContactInformationType
LEFT JOIN shared.contactinformation_pt
ON shared.contactinformation_pt.contactinformation_id = ContactInformationType.id
-- AbstractExtensionType
LEFT JOIN shared.contactinformation
ON shared.contactinformation.abstractcontactinformationextension_id = AbstractExtensionType.id

-- PostalAddressPropertyType
LEFT JOIN shared.contactinformation_address
ON shared.contactinformation.id = contactinformation_address.contactinformation_id
LEFT JOIN shared.contactinformation
ON contactinformation_address.postaladdress_pt_id = PostalAddressPropertyType.id
-- OnlineContactPropertyType
LEFT JOIN shared.contactinformation_networknode
ON shared.contactinformation.id = contactinformation_networknode.contactinformation_id
LEFT JOIN shared.contactinformation
ON contactinformation_networknode.onlinecontact_pt_id = OnlineContactPropertyType.id
-- TelephoneContactPropertyType
LEFT JOIN shared.contactinformation_phonefax
ON shared.contactinformation.id = contactinformation_phonefax.contactinformation_id
LEFT JOIN shared.contactinformation
ON contactinformation_phonefax.telephonecontact_pt_id = TelephoneContactPropertyType.id
-- NotePropertyType
LEFT JOIN shared.contactinformation_annotation
ON shared.contactinformation.id = contactinformation_annotation.contactinformation_id
LEFT JOIN shared.contactinformation
ON contactinformation_annotation.note_pt_id = NotePropertyType.id
;

DeicingAreaMarking
CREATE OR REPLACE VIEW deicingareamarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingareamarking_pt.id,
       'nilReason', airport_heliport.deicingareamarking_pt.nilReason,
       'href', airport_heliport.deicingareamarking_pt.href,
       'id', airport_heliport.deicingareamarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.deicingareamarking_ts.feature_lifetime_end,
       'id', airport_heliport.deicingareamarking.id,
       'identifier', airport_heliport.deicingareamarking.identifier,
       'identifier_code_space', airport_heliport.deicingareamarking.identifier_code_space,
       'xml_id', airport_heliport.deicingareamarking.xml_id
    ) AS deicingareamarking
FROM

-- DeicingAreaMarkingTimeSliceType
LEFT JOIN airport_heliport.deicingareamarking_tsp
ON airport_heliport.deicingareamarking_tsp.deicingareamarkingtimeslice_id = DeicingAreaMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.deicingareamarking_ts_element
ON airport_heliport.deicingareamarking_ts.id = deicingareamarking_ts_element.deicingareamarking_ts_id
LEFT JOIN airport_heliport.deicingareamarking_ts
ON deicingareamarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.deicingareamarking_ts_annotation
ON airport_heliport.deicingareamarking_ts.id = deicingareamarking_ts_annotation.deicingareamarking_ts_id
LEFT JOIN airport_heliport.deicingareamarking_ts
ON deicingareamarking_ts_annotation.note_pt_id = NotePropertyType.id
-- DeicingAreaMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.deicingareamarking_timeslice
ON airport_heliport.deicingareamarking.id = deicingareamarking_timeslice.deicingareamarking_id
LEFT JOIN airport_heliport.deicingareamarking
ON deicingareamarking_timeslice.deicingareamarking_tsp_id = DeicingAreaMarkingTimeSlicePropertyType.id
;

DeicingArea
CREATE OR REPLACE VIEW deicingarea_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.deicingarea_pt.id,
       'nilReason', airport_heliport.deicingarea_pt.nilReason,
       'href', airport_heliport.deicingarea_pt.href,
       'id', airport_heliport.deicingarea_tsp.id,
       'id', airport_heliport.deicingarea_ts.id,
       'xml_id', airport_heliport.deicingarea_ts.xml_id,
       'interpretation', airport_heliport.deicingarea_ts.interpretation,
       'sequence_number', airport_heliport.deicingarea_ts.sequence_number,
       'correction_number', airport_heliport.deicingarea_ts.correction_number,
       'valid_time_begin', airport_heliport.deicingarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.deicingarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.deicingarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.deicingarea_ts.feature_lifetime_end,
       'id', airport_heliport.deicingarea.id,
       'identifier', airport_heliport.deicingarea.identifier,
       'identifier_code_space', airport_heliport.deicingarea.identifier_code_space,
       'xml_id', airport_heliport.deicingarea.xml_id
    ) AS deicingarea
FROM

-- DeicingAreaTimeSliceType
LEFT JOIN airport_heliport.deicingarea_tsp
ON airport_heliport.deicingarea_tsp.deicingareatimeslice_id = DeicingAreaTimeSliceType.id
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
LEFT JOIN airport_heliport.deicingarea_ts_annotation
ON airport_heliport.deicingarea_ts.id = deicingarea_ts_annotation.deicingarea_ts_id
LEFT JOIN airport_heliport.deicingarea_ts
ON deicingarea_ts_annotation.note_pt_id = NotePropertyType.id
-- ApronAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.deicingarea_ts_availability
ON airport_heliport.deicingarea_ts.id = deicingarea_ts_availability.deicingarea_ts_id
LEFT JOIN airport_heliport.deicingarea_ts
ON deicingarea_ts_availability.apronareaavailability_pt_id = ApronAreaAvailabilityPropertyType.id
-- DeicingAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.deicingarea_timeslice
ON airport_heliport.deicingarea.id = deicingarea_timeslice.deicingarea_id
LEFT JOIN airport_heliport.deicingarea
ON deicingarea_timeslice.deicingarea_tsp_id = DeicingAreaTimeSlicePropertyType.id
;

DepartureArrivalCondition
CREATE OR REPLACE VIEW departurearrivalcondition_view AS
SELECT
    jsonb_build_object(
       'id', procedure.departurearrivalcondition_pt.id,
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
    ) AS departurearrivalcondition
FROM

-- DepartureArrivalConditionType
LEFT JOIN procedure.departurearrivalcondition_pt
ON procedure.departurearrivalcondition_pt.departurearrivalcondition_id = DepartureArrivalConditionType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.departurearrivalcondition
ON procedure.departurearrivalcondition.engine_id = AircraftCharacteristicPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.departurearrivalcondition
ON procedure.departurearrivalcondition.abstractdeparturearrivalconditionextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.departurearrivalcondition_annotation
ON procedure.departurearrivalcondition.id = departurearrivalcondition_annotation.departurearrivalcondition_id
LEFT JOIN procedure.departurearrivalcondition
ON departurearrivalcondition_annotation.note_pt_id = NotePropertyType.id
;

DepartureLeg
CREATE OR REPLACE VIEW departureleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.departureleg_pt.id,
       'nilReason', procedure.departureleg_pt.nilReason,
       'href', procedure.departureleg_pt.href,
       'id', procedure.departureleg_tsp.id,
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
       'feature_lifetime_end', procedure.departureleg_ts.feature_lifetime_end,
       'id', procedure.departureleg.id,
       'identifier', procedure.departureleg.identifier,
       'identifier_code_space', procedure.departureleg.identifier_code_space,
       'xml_id', procedure.departureleg.xml_id
    ) AS departureleg
FROM

-- DepartureLegTimeSliceType
LEFT JOIN procedure.departureleg_tsp
ON procedure.departureleg_tsp.departurelegtimeslice_id = DepartureLegTimeSliceType.id
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
LEFT JOIN procedure.departureleg_ts_aircraftcategory
ON procedure.departureleg_ts.id = departureleg_ts_aircraftcategory.departureleg_ts_id
LEFT JOIN procedure.departureleg_ts
ON departureleg_ts_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.departureleg_ts_designsurface
ON procedure.departureleg_ts.id = departureleg_ts_designsurface.departureleg_ts_id
LEFT JOIN procedure.departureleg_ts
ON departureleg_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.departureleg_ts_annotation
ON procedure.departureleg_ts.id = departureleg_ts_annotation.departureleg_ts_id
LEFT JOIN procedure.departureleg_ts
ON departureleg_ts_annotation.note_pt_id = NotePropertyType.id
-- DepartureArrivalConditionPropertyType
LEFT JOIN procedure.departureleg_ts_condition
ON procedure.departureleg_ts.id = departureleg_ts_condition.departureleg_ts_id
LEFT JOIN procedure.departureleg_ts
ON departureleg_ts_condition.departurearrivalcondition_pt_id = DepartureArrivalConditionPropertyType.id
-- DepartureLegTimeSlicePropertyType
LEFT JOIN procedure.departureleg_timeslice
ON procedure.departureleg.id = departureleg_timeslice.departureleg_id
LEFT JOIN procedure.departureleg
ON departureleg_timeslice.departureleg_tsp_id = DepartureLegTimeSlicePropertyType.id
;

DesignatedPoint
CREATE OR REPLACE VIEW designatedpoint_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.designatedpoint_pt.id,
       'nilReason', navaids_points.designatedpoint_pt.nilReason,
       'href', navaids_points.designatedpoint_pt.href,
       'id', navaids_points.designatedpoint_tsp.id,
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
       'feature_lifetime_end', navaids_points.designatedpoint_ts.feature_lifetime_end,
       'id', navaids_points.designatedpoint.id,
       'identifier', navaids_points.designatedpoint.identifier,
       'identifier_code_space', navaids_points.designatedpoint.identifier_code_space,
       'xml_id', navaids_points.designatedpoint.xml_id
    ) AS designatedpoint
FROM

-- DesignatedPointTimeSliceType
LEFT JOIN navaids_points.designatedpoint_tsp
ON navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = DesignatedPointTimeSliceType.id
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
LEFT JOIN navaids_points.designatedpoint_ts_annotation
ON navaids_points.designatedpoint_ts.id = designatedpoint_ts_annotation.designatedpoint_ts_id
LEFT JOIN navaids_points.designatedpoint_ts
ON designatedpoint_ts_annotation.note_pt_id = NotePropertyType.id
-- DesignatedPointTimeSlicePropertyType
LEFT JOIN navaids_points.designatedpoint_timeslice
ON navaids_points.designatedpoint.id = designatedpoint_timeslice.designatedpoint_id
LEFT JOIN navaids_points.designatedpoint
ON designatedpoint_timeslice.designatedpoint_tsp_id = DesignatedPointTimeSlicePropertyType.id
;

DirectFlightClass
CREATE OR REPLACE VIEW directflightclass_view AS
SELECT
    jsonb_build_object(
       'id', routes.directflightclass_pt.id,
       'exceedlength_value', routes.directflightclass.exceedlength_value,
       'exceedlength_uom', routes.directflightclass.exceedlength_uom,
       'exceedlength_nilreason', routes.directflightclass.exceedlength_nilreason,
       'id', routes.directflightclass.id,
       'identifier', routes.directflightclass.identifier,
       'identifier_code_space', routes.directflightclass.identifier_code_space,
       'xml_id', routes.directflightclass.xml_id
    ) AS directflightclass
FROM

-- DirectFlightClassType
LEFT JOIN routes.directflightclass_pt
ON routes.directflightclass_pt.directflightclass_id = DirectFlightClassType.id
-- AbstractExtensionType
LEFT JOIN routes.directflightclass
ON routes.directflightclass.abstractdirectflightextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.directflightclass
ON routes.directflightclass.abstractdirectflightclassextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.directflightclass_annotation
ON routes.directflightclass.id = directflightclass_annotation.directflightclass_id
LEFT JOIN routes.directflightclass
ON directflightclass_annotation.note_pt_id = NotePropertyType.id
;

DirectFlight
CREATE OR REPLACE VIEW directflight_view AS
SELECT
    jsonb_build_object(
       'id', routes.directflight_pt.id
    ) AS directflight
FROM


;

DirectFlightSegment
CREATE OR REPLACE VIEW directflightsegment_view AS
SELECT
    jsonb_build_object(
       'id', routes.directflightsegment_pt.id,
       'id', routes.directflightsegment.id,
       'identifier', routes.directflightsegment.identifier,
       'identifier_code_space', routes.directflightsegment.identifier_code_space,
       'xml_id', routes.directflightsegment.xml_id
    ) AS directflightsegment
FROM

-- DirectFlightSegmentType
LEFT JOIN routes.directflightsegment_pt
ON routes.directflightsegment_pt.directflightsegment_id = DirectFlightSegmentType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.end_airportreferencepoint_id = AirportHeliportPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.start_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.abstractdirectflightextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.directflightsegment
ON routes.directflightsegment.abstractdirectflightsegmentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.directflightsegment_annotation
ON routes.directflightsegment.id = directflightsegment_annotation.directflightsegment_id
LEFT JOIN routes.directflightsegment
ON directflightsegment_annotation.note_pt_id = NotePropertyType.id
;

DirectionFinder
CREATE OR REPLACE VIEW directionfinder_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.directionfinder_pt.id,
       'nilReason', navaids_points.directionfinder_pt.nilReason,
       'href', navaids_points.directionfinder_pt.href,
       'id', navaids_points.directionfinder_tsp.id,
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
       'feature_lifetime_end', navaids_points.directionfinder_ts.feature_lifetime_end,
       'id', navaids_points.directionfinder.id,
       'identifier', navaids_points.directionfinder.identifier,
       'identifier_code_space', navaids_points.directionfinder.identifier_code_space,
       'xml_id', navaids_points.directionfinder.xml_id
    ) AS directionfinder
FROM

-- DirectionFinderTimeSliceType
LEFT JOIN navaids_points.directionfinder_tsp
ON navaids_points.directionfinder_tsp.directionfindertimeslice_id = DirectionFinderTimeSliceType.id
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
LEFT JOIN navaids_points.directionfinder_ts_authority
ON navaids_points.directionfinder_ts.id = directionfinder_ts_authority.directionfinder_ts_id
LEFT JOIN navaids_points.directionfinder_ts
ON directionfinder_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.directionfinder_ts_monitoring
ON navaids_points.directionfinder_ts.id = directionfinder_ts_monitoring.directionfinder_ts_id
LEFT JOIN navaids_points.directionfinder_ts
ON directionfinder_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.directionfinder_ts_availability
ON navaids_points.directionfinder_ts.id = directionfinder_ts_availability.directionfinder_ts_id
LEFT JOIN navaids_points.directionfinder_ts
ON directionfinder_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.directionfinder_ts_annotation
ON navaids_points.directionfinder_ts.id = directionfinder_ts_annotation.directionfinder_ts_id
LEFT JOIN navaids_points.directionfinder_ts
ON directionfinder_ts_annotation.note_pt_id = NotePropertyType.id
-- InformationServicePropertyType
LEFT JOIN navaids_points.directionfinder_ts_informationprovision
ON navaids_points.directionfinder_ts.id = directionfinder_ts_informationprovision.directionfinder_ts_id
LEFT JOIN navaids_points.directionfinder_ts
ON directionfinder_ts_informationprovision.informationservice_pt_id = InformationServicePropertyType.id
-- DirectionFinderTimeSlicePropertyType
LEFT JOIN navaids_points.directionfinder_timeslice
ON navaids_points.directionfinder.id = directionfinder_timeslice.directionfinder_id
LEFT JOIN navaids_points.directionfinder
ON directionfinder_timeslice.directionfinder_tsp_id = DirectionFinderTimeSlicePropertyType.id
;

DistanceIndication
CREATE OR REPLACE VIEW distanceindication_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.distanceindication_pt.id,
       'nilReason', navaids_points.distanceindication_pt.nilReason,
       'href', navaids_points.distanceindication_pt.href,
       'id', navaids_points.distanceindication_tsp.id,
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
       'feature_lifetime_end', navaids_points.distanceindication_ts.feature_lifetime_end,
       'id', navaids_points.distanceindication.id,
       'identifier', navaids_points.distanceindication.identifier,
       'identifier_code_space', navaids_points.distanceindication.identifier_code_space,
       'xml_id', navaids_points.distanceindication.xml_id
    ) AS distanceindication
FROM

-- DistanceIndicationTimeSliceType
LEFT JOIN navaids_points.distanceindication_tsp
ON navaids_points.distanceindication_tsp.distanceindicationtimeslice_id = DistanceIndicationTimeSliceType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.fix_id = DesignatedPointPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.distanceindication_ts_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.distanceindication_ts
ON navaids_points.distanceindication_ts.abstractdistanceindicationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.distanceindication_ts_annotation
ON navaids_points.distanceindication_ts.id = distanceindication_ts_annotation.distanceindication_ts_id
LEFT JOIN navaids_points.distanceindication_ts
ON distanceindication_ts_annotation.note_pt_id = NotePropertyType.id
-- DistanceIndicationTimeSlicePropertyType
LEFT JOIN navaids_points.distanceindication_timeslice
ON navaids_points.distanceindication.id = distanceindication_timeslice.distanceindication_id
LEFT JOIN navaids_points.distanceindication
ON distanceindication_timeslice.distanceindication_tsp_id = DistanceIndicationTimeSlicePropertyType.id
;

DME
CREATE OR REPLACE VIEW dme_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.dme_pt.id,
       'nilReason', navaids_points.dme_pt.nilReason,
       'href', navaids_points.dme_pt.href,
       'id', navaids_points.dme_tsp.id,
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
       'feature_lifetime_end', navaids_points.dme_ts.feature_lifetime_end,
       'id', navaids_points.dme.id,
       'identifier', navaids_points.dme.identifier,
       'identifier_code_space', navaids_points.dme.identifier_code_space,
       'xml_id', navaids_points.dme.xml_id
    ) AS dme
FROM

-- DMETimeSliceType
LEFT JOIN navaids_points.dme_tsp
ON navaids_points.dme_tsp.dmetimeslice_id = DMETimeSliceType.id
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
LEFT JOIN navaids_points.dme_ts_authority
ON navaids_points.dme_ts.id = dme_ts_authority.dme_ts_id
LEFT JOIN navaids_points.dme_ts
ON dme_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.dme_ts_monitoring
ON navaids_points.dme_ts.id = dme_ts_monitoring.dme_ts_id
LEFT JOIN navaids_points.dme_ts
ON dme_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.dme_ts_availability
ON navaids_points.dme_ts.id = dme_ts_availability.dme_ts_id
LEFT JOIN navaids_points.dme_ts
ON dme_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.dme_ts_annotation
ON navaids_points.dme_ts.id = dme_ts_annotation.dme_ts_id
LEFT JOIN navaids_points.dme_ts
ON dme_ts_annotation.note_pt_id = NotePropertyType.id
-- DMETimeSlicePropertyType
LEFT JOIN navaids_points.dme_timeslice
ON navaids_points.dme.id = dme_timeslice.dme_id
LEFT JOIN navaids_points.dme
ON dme_timeslice.dme_tsp_id = DMETimeSlicePropertyType.id
;

ElevatedSurface
CREATE OR REPLACE VIEW elevatedsurface_view AS
SELECT
    jsonb_build_object(
       'id', public.elevated_surface_pt.id
    ) AS elevatedsurface
FROM


;

Elevation
CREATE OR REPLACE VIEW elevation_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.elevation_pt.id,
       'nilReason', navaids_points.elevation_pt.nilReason,
       'href', navaids_points.elevation_pt.href,
       'id', navaids_points.elevation_tsp.id,
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
       'feature_lifetime_end', navaids_points.elevation_ts.feature_lifetime_end,
       'id', navaids_points.elevation.id,
       'identifier', navaids_points.elevation.identifier,
       'identifier_code_space', navaids_points.elevation.identifier_code_space,
       'xml_id', navaids_points.elevation.xml_id
    ) AS elevation
FROM

-- ElevationTimeSliceType
LEFT JOIN navaids_points.elevation_tsp
ON navaids_points.elevation_tsp.elevationtimeslice_id = ElevationTimeSliceType.id
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
LEFT JOIN navaids_points.elevation_ts_authority
ON navaids_points.elevation_ts.id = elevation_ts_authority.elevation_ts_id
LEFT JOIN navaids_points.elevation_ts
ON elevation_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.elevation_ts_monitoring
ON navaids_points.elevation_ts.id = elevation_ts_monitoring.elevation_ts_id
LEFT JOIN navaids_points.elevation_ts
ON elevation_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.elevation_ts_availability
ON navaids_points.elevation_ts.id = elevation_ts_availability.elevation_ts_id
LEFT JOIN navaids_points.elevation_ts
ON elevation_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.elevation_ts_annotation
ON navaids_points.elevation_ts.id = elevation_ts_annotation.elevation_ts_id
LEFT JOIN navaids_points.elevation_ts
ON elevation_ts_annotation.note_pt_id = NotePropertyType.id
-- ElevationTimeSlicePropertyType
LEFT JOIN navaids_points.elevation_timeslice
ON navaids_points.elevation.id = elevation_timeslice.elevation_id
LEFT JOIN navaids_points.elevation
ON elevation_timeslice.elevation_tsp_id = ElevationTimeSlicePropertyType.id
;

EnRouteSegmentPoint
CREATE OR REPLACE VIEW enroutesegmentpoint_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.enroutesegmentpoint_pt.id,
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
    ) AS enroutesegmentpoint
FROM

-- EnRouteSegmentPointType
LEFT JOIN navaids_points.enroutesegmentpoint_pt
ON navaids_points.enroutesegmentpoint_pt.enroutesegmentpoint_id = EnRouteSegmentPointType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.enroutesegmentpoint
ON navaids_points.enroutesegmentpoint.enroutesegmentpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
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
LEFT JOIN navaids_points.enroutesegmentpoint_facilitymakeup
ON navaids_points.enroutesegmentpoint.id = enroutesegmentpoint_facilitymakeup.enroutesegmentpoint_id
LEFT JOIN navaids_points.enroutesegmentpoint
ON enroutesegmentpoint_facilitymakeup.pointreference_pt_id = PointReferencePropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.enroutesegmentpoint_annotation
ON navaids_points.enroutesegmentpoint.id = enroutesegmentpoint_annotation.enroutesegmentpoint_id
LEFT JOIN navaids_points.enroutesegmentpoint
ON enroutesegmentpoint_annotation.note_pt_id = NotePropertyType.id
;

EquipmentUnavailableAdjustmentColumn
CREATE OR REPLACE VIEW equipmentunavailableadjustmentcolumn_view AS
SELECT
    jsonb_build_object(
       'id', procedure.equipmentunavailableadjustmentcolumn_pt.id,
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
    ) AS equipmentunavailableadjustmentcolumn
FROM

-- EquipmentUnavailableAdjustmentColumnType
LEFT JOIN procedure.equipmentunavailableadjustmentcolumn_pt
ON procedure.equipmentunavailableadjustmentcolumn_pt.equipmentunavailableadjustmentcolumn_id = EquipmentUnavailableAdjustmentColumnType.id
-- AbstractExtensionType
LEFT JOIN procedure.equipmentunavailableadjustmentcolumn
ON procedure.equipmentunavailableadjustmentcolumn.abstractequipmentunavailableadjustmentcolumnextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.equipmentunavailableadjustmentcolumn_annotation
ON procedure.equipmentunavailableadjustmentcolumn.id = equipmentunavailableadjustmentcolumn_annotation.equipmentunavailableadjustmentcolumn_id
LEFT JOIN procedure.equipmentunavailableadjustmentcolumn
ON equipmentunavailableadjustmentcolumn_annotation.note_pt_id = NotePropertyType.id
;

EquipmentUnavailableAdjustment
CREATE OR REPLACE VIEW equipmentunavailableadjustment_view AS
SELECT
    jsonb_build_object(
       'id', procedure.equipmentunavailableadjustment_pt.id,
       'type_value', procedure.equipmentunavailableadjustment.type_value,
       'type_nilreason', procedure.equipmentunavailableadjustment.type_nilreason,
       'approachlightinginoperative_value', procedure.equipmentunavailableadjustment.approachlightinginoperative_value,
       'approachlightinginoperative_nilreason', procedure.equipmentunavailableadjustment.approachlightinginoperative_nilreason,
       'id', procedure.equipmentunavailableadjustment.id,
       'identifier', procedure.equipmentunavailableadjustment.identifier,
       'identifier_code_space', procedure.equipmentunavailableadjustment.identifier_code_space,
       'xml_id', procedure.equipmentunavailableadjustment.xml_id
    ) AS equipmentunavailableadjustment
FROM

-- EquipmentUnavailableAdjustmentType
LEFT JOIN procedure.equipmentunavailableadjustment_pt
ON procedure.equipmentunavailableadjustment_pt.equipmentunavailableadjustment_id = EquipmentUnavailableAdjustmentType.id
-- AbstractExtensionType
LEFT JOIN procedure.equipmentunavailableadjustment
ON procedure.equipmentunavailableadjustment.abstractequipmentunavailableadjustmentextension_id = AbstractExtensionType.id

-- EquipmentUnavailableAdjustmentColumnPropertyType
LEFT JOIN procedure.equipmentunavailableadjustment_adjustmentinopcol
ON procedure.equipmentunavailableadjustment.id = equipmentunavailableadjustment_adjustmentinopcol.equipmentunavailableadjustment_id
LEFT JOIN procedure.equipmentunavailableadjustment
ON equipmentunavailableadjustment_adjustmentinopcol.equipmentunavailableadjustmentcolumn_pt_id = EquipmentUnavailableAdjustmentColumnPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.equipmentunavailableadjustment_annotation
ON procedure.equipmentunavailableadjustment.id = equipmentunavailableadjustment_annotation.equipmentunavailableadjustment_id
LEFT JOIN procedure.equipmentunavailableadjustment
ON equipmentunavailableadjustment_annotation.note_pt_id = NotePropertyType.id
;

FASDataBlock
CREATE OR REPLACE VIEW fasdatablock_view AS
SELECT
    jsonb_build_object(
       'id', public.fasdatablock_pt.id,
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
       'routeindicator_value', public.fasdatablock.routeindicator_value,
       'routeindicator_nilreason', public.fasdatablock.routeindicator_nilreason,
       'referencepathdataselector_value', public.fasdatablock.referencepathdataselector_value,
       'referencepathdataselector_nilreason', public.fasdatablock.referencepathdataselector_nilreason,
       'referencepathidentifier_value', public.fasdatablock.referencepathidentifier_value,
       'referencepathidentifier_nilreason', public.fasdatablock.referencepathidentifier_nilreason,
       'codeicao_value', public.fasdatablock.codeicao_value,
       'codeicao_nilreason', public.fasdatablock.codeicao_nilreason,
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
    ) AS fasdatablock
FROM

-- FASDataBlockType
LEFT JOIN public.fasdatablock_pt
ON public.fasdatablock_pt.fasdatablock_id = FASDataBlockType.id
-- AbstractExtensionType
LEFT JOIN public.fasdatablock
ON public.fasdatablock.abstractfasdatablockextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN public.fasdatablock_annotation
ON public.fasdatablock.id = fasdatablock_annotation.fasdatablock_id
LEFT JOIN public.fasdatablock
ON fasdatablock_annotation.note_pt_id = NotePropertyType.id
;

FeatureMetadata
CREATE OR REPLACE VIEW featuremetadata_view AS
SELECT
    jsonb_build_object(
       'id', public.message_metadata_property.id,
       'id', public.message_metadata_property.id
    ) AS featuremetadata
FROM


;

FinalLeg
CREATE OR REPLACE VIEW finalleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.finalleg_pt.id,
       'nilReason', procedure.finalleg_pt.nilReason,
       'href', procedure.finalleg_pt.href,
       'id', procedure.finalleg_tsp.id,
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
       'feature_lifetime_end', procedure.finalleg_ts.feature_lifetime_end,
       'id', procedure.finalleg.id,
       'identifier', procedure.finalleg.identifier,
       'identifier_code_space', procedure.finalleg.identifier_code_space,
       'xml_id', procedure.finalleg.xml_id
    ) AS finalleg
FROM

-- FinalLegTimeSliceType
LEFT JOIN procedure.finalleg_tsp
ON procedure.finalleg_tsp.finallegtimeslice_id = FinalLegTimeSliceType.id
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
-- PointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.finalleg_ts
ON procedure.finalleg_ts.finalpathalignmentpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
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
LEFT JOIN procedure.finalleg_ts_aircraftcategory
ON procedure.finalleg_ts.id = finalleg_ts_aircraftcategory.finalleg_ts_id
LEFT JOIN procedure.finalleg_ts
ON finalleg_ts_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.finalleg_ts_designsurface
ON procedure.finalleg_ts.id = finalleg_ts_designsurface.finalleg_ts_id
LEFT JOIN procedure.finalleg_ts
ON finalleg_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.finalleg_ts_annotation
ON procedure.finalleg_ts.id = finalleg_ts_annotation.finalleg_ts_id
LEFT JOIN procedure.finalleg_ts
ON finalleg_ts_annotation.note_pt_id = NotePropertyType.id
-- ApproachConditionPropertyType
LEFT JOIN procedure.finalleg_ts_condition
ON procedure.finalleg_ts.id = finalleg_ts_condition.finalleg_ts_id
LEFT JOIN procedure.finalleg_ts
ON finalleg_ts_condition.approachcondition_pt_id = ApproachConditionPropertyType.id
-- FinalLegTimeSlicePropertyType
LEFT JOIN procedure.finalleg_timeslice
ON procedure.finalleg.id = finalleg_timeslice.finalleg_id
LEFT JOIN procedure.finalleg
ON finalleg_timeslice.finalleg_tsp_id = FinalLegTimeSlicePropertyType.id
;

FinalProfile
CREATE OR REPLACE VIEW finalprofile_view AS
SELECT
    jsonb_build_object(
       'id', procedure.finalprofile_pt.id,
       'id', procedure.finalprofile.id,
       'identifier', procedure.finalprofile.identifier,
       'identifier_code_space', procedure.finalprofile.identifier_code_space,
       'xml_id', procedure.finalprofile.xml_id
    ) AS finalprofile
FROM

-- FinalProfileType
LEFT JOIN procedure.finalprofile_pt
ON procedure.finalprofile_pt.finalprofile_id = FinalProfileType.id
-- AbstractExtensionType
LEFT JOIN procedure.finalprofile
ON procedure.finalprofile.abstractfinalprofileextension_id = AbstractExtensionType.id

-- ApproachAltitudeTablePropertyType
LEFT JOIN procedure.finalprofile_altitude
ON procedure.finalprofile.id = finalprofile_altitude.finalprofile_id
LEFT JOIN procedure.finalprofile
ON finalprofile_altitude.approachaltitudetable_pt_id = ApproachAltitudeTablePropertyType.id
-- ApproachDistanceTablePropertyType
LEFT JOIN procedure.finalprofile_distance
ON procedure.finalprofile.id = finalprofile_distance.finalprofile_id
LEFT JOIN procedure.finalprofile
ON finalprofile_distance.approachdistancetable_pt_id = ApproachDistanceTablePropertyType.id
-- ApproachTimingTablePropertyType
LEFT JOIN procedure.finalprofile_timing
ON procedure.finalprofile.id = finalprofile_timing.finalprofile_id
LEFT JOIN procedure.finalprofile
ON finalprofile_timing.approachtimingtable_pt_id = ApproachTimingTablePropertyType.id
-- NotePropertyType
LEFT JOIN procedure.finalprofile_annotation
ON procedure.finalprofile.id = finalprofile_annotation.finalprofile_id
LEFT JOIN procedure.finalprofile
ON finalprofile_annotation.note_pt_id = NotePropertyType.id
;

FireFightingService
CREATE OR REPLACE VIEW firefightingservice_view AS
SELECT
    jsonb_build_object(
       'id', service.firefightingservice_pt.id,
       'nilReason', service.firefightingservice_pt.nilReason,
       'href', service.firefightingservice_pt.href,
       'id', service.firefightingservice_tsp.id,
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
       'feature_lifetime_end', service.firefightingservice_ts.feature_lifetime_end,
       'id', service.firefightingservice.id,
       'identifier', service.firefightingservice.identifier,
       'identifier_code_space', service.firefightingservice.identifier_code_space,
       'xml_id', service.firefightingservice.xml_id
    ) AS firefightingservice
FROM

-- FireFightingServiceTimeSliceType
LEFT JOIN service.firefightingservice_tsp
ON service.firefightingservice_tsp.firefightingservicetimeslice_id = FireFightingServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.firefightingservice_ts_radiocommunication
ON service.firefightingservice_ts.id = firefightingservice_ts_radiocommunication.firefightingservice_ts_id
LEFT JOIN service.firefightingservice_ts
ON firefightingservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.firefightingservice_ts_groundcommunication
ON service.firefightingservice_ts.id = firefightingservice_ts_groundcommunication.firefightingservice_ts_id
LEFT JOIN service.firefightingservice_ts
ON firefightingservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.firefightingservice_ts_availability
ON service.firefightingservice_ts.id = firefightingservice_ts_availability.firefightingservice_ts_id
LEFT JOIN service.firefightingservice_ts
ON firefightingservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.firefightingservice_ts_annotation
ON service.firefightingservice_ts.id = firefightingservice_ts_annotation.firefightingservice_ts_id
LEFT JOIN service.firefightingservice_ts
ON firefightingservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.firefightingservice_ts_airportheliport
ON service.firefightingservice_ts.id = firefightingservice_ts_airportheliport.firefightingservice_ts_id
LEFT JOIN service.firefightingservice_ts
ON firefightingservice_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- FireFightingServiceTimeSlicePropertyType
LEFT JOIN service.firefightingservice_timeslice
ON service.firefightingservice.id = firefightingservice_timeslice.firefightingservice_id
LEFT JOIN service.firefightingservice
ON firefightingservice_timeslice.firefightingservice_tsp_id = FireFightingServiceTimeSlicePropertyType.id
;

FlightCharacteristic
CREATE OR REPLACE VIEW flightcharacteristic_view AS
SELECT
    jsonb_build_object(
       'id', shared.flightcharacteristic_pt.id,
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
    ) AS flightcharacteristic
FROM

-- FlightCharacteristicType
LEFT JOIN shared.flightcharacteristic_pt
ON shared.flightcharacteristic_pt.flightcharacteristic_id = FlightCharacteristicType.id
-- AbstractExtensionType
LEFT JOIN shared.flightcharacteristic
ON shared.flightcharacteristic.abstractflightcharacteristicextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.flightcharacteristic_annotation
ON shared.flightcharacteristic.id = flightcharacteristic_annotation.flightcharacteristic_id
LEFT JOIN shared.flightcharacteristic
ON flightcharacteristic_annotation.note_pt_id = NotePropertyType.id
;

FlightConditionCircumstance
CREATE OR REPLACE VIEW flightconditioncircumstance_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightconditioncircumstance_pt.id,
       'referencelocation_value', routes.flightconditioncircumstance.referencelocation_value,
       'referencelocation_nilreason', routes.flightconditioncircumstance.referencelocation_nilreason,
       'relationwithlocation_value', routes.flightconditioncircumstance.relationwithlocation_value,
       'relationwithlocation_nilreason', routes.flightconditioncircumstance.relationwithlocation_nilreason,
       'id', routes.flightconditioncircumstance.id,
       'identifier', routes.flightconditioncircumstance.identifier,
       'identifier_code_space', routes.flightconditioncircumstance.identifier_code_space,
       'xml_id', routes.flightconditioncircumstance.xml_id
    ) AS flightconditioncircumstance
FROM

-- FlightConditionCircumstanceType
LEFT JOIN routes.flightconditioncircumstance_pt
ON routes.flightconditioncircumstance_pt.flightconditioncircumstance_id = FlightConditionCircumstanceType.id
-- AbstractExtensionType
LEFT JOIN routes.flightconditioncircumstance
ON routes.flightconditioncircumstance.abstractflightconditioncircumstanceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.flightconditioncircumstance_annotation
ON routes.flightconditioncircumstance.id = flightconditioncircumstance_annotation.flightconditioncircumstance_id
LEFT JOIN routes.flightconditioncircumstance
ON flightconditioncircumstance_annotation.note_pt_id = NotePropertyType.id
;

FlightConditionCombination
CREATE OR REPLACE VIEW flightconditioncombination_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightconditioncombination_pt.id,
       'logicaloperator_value', routes.flightconditioncombination.logicaloperator_value,
       'logicaloperator_nilreason', routes.flightconditioncombination.logicaloperator_nilreason,
       'id', routes.flightconditioncombination.id,
       'identifier', routes.flightconditioncombination.identifier,
       'identifier_code_space', routes.flightconditioncombination.identifier_code_space,
       'xml_id', routes.flightconditioncombination.xml_id
    ) AS flightconditioncombination
FROM

-- FlightConditionCombinationType
LEFT JOIN routes.flightconditioncombination_pt
ON routes.flightconditioncombination_pt.flightconditioncombination_id = FlightConditionCombinationType.id
-- AbstractExtensionType
LEFT JOIN routes.flightconditioncombination
ON routes.flightconditioncombination.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.flightconditioncombination
ON routes.flightconditioncombination.abstractflightconditioncombinationextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN routes.flightconditioncombination_timeinterval
ON routes.flightconditioncombination.id = flightconditioncombination_timeinterval.flightconditioncombination_id
LEFT JOIN routes.flightconditioncombination
ON flightconditioncombination_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN routes.flightconditioncombination_annotation
ON routes.flightconditioncombination.id = flightconditioncombination_annotation.flightconditioncombination_id
LEFT JOIN routes.flightconditioncombination
ON flightconditioncombination_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN routes.flightconditioncombination_specialdateauthority
ON routes.flightconditioncombination.id = flightconditioncombination_specialdateauthority.flightconditioncombination_id
LEFT JOIN routes.flightconditioncombination
ON flightconditioncombination_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- FlightConditionElementPropertyType
LEFT JOIN routes.flightflightconditioncombination_element
ON routes.flightconditioncombination.id = flightflightconditioncombination_element.flightflightconditioncombination_id
LEFT JOIN routes.flightconditioncombination
ON flightflightconditioncombination_element.flightconditionelement_pt_id = FlightConditionElementPropertyType.id
;

FlightConditionElement
CREATE OR REPLACE VIEW flightconditionelement_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightconditionelement_pt.id,
       'index_value', routes.flightconditionelement.index_value,
       'index_nilreason', routes.flightconditionelement.index_nilreason,
       'id', routes.flightconditionelement.id,
       'identifier', routes.flightconditionelement.identifier,
       'identifier_code_space', routes.flightconditionelement.identifier_code_space,
       'xml_id', routes.flightconditionelement.xml_id
    ) AS flightconditionelement
FROM

-- FlightConditionElementType
LEFT JOIN routes.flightconditionelement_pt
ON routes.flightconditionelement_pt.flightconditionelement_id = FlightConditionElementType.id
-- MeteorologyPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_weather_id = MeteorologyPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_aircraft_id = AircraftCharacteristicPropertyType.id
-- FlightCharacteristicPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_flight_id = FlightCharacteristicPropertyType.id
-- DirectFlightPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_directflightcondition_id = DirectFlightPropertyType.id
-- AirspaceBorderCrossingPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_bordercrossingcondition_id = AirspaceBorderCrossingPropertyType.id
-- FlightConditionCombinationPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_operand_id = FlightConditionCombinationPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_routeportioncondition_id = RoutePortionPropertyType.id
-- StandardInstrumentDeparturePropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_standardinstrumentdeparturecondition_id = StandardInstrumentDeparturePropertyType.id
-- StandardInstrumentArrivalPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_standardinstrumentarrivalcondition_id = StandardInstrumentArrivalPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_organisationcondition_id = OrganisationAuthorityPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.significantpointcondition_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AirspacePropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_airspacecondition_id = AirspacePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.flightconditionelement
ON routes.flightconditionelement.flightcondition_airportheliportcondition_id = AirportHeliportPropertyType.id
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
LEFT JOIN routes.flightconditionelement_flightlevel
ON routes.flightconditionelement.id = flightconditionelement_flightlevel.flightconditionelement_id
LEFT JOIN routes.flightconditionelement
ON flightconditionelement_flightlevel.flightrestrictionlevel_pt_id = FlightRestrictionLevelPropertyType.id
-- NotePropertyType
LEFT JOIN routes.flightconditionelement_annotation
ON routes.flightconditionelement.id = flightconditionelement_annotation.flightconditionelement_id
LEFT JOIN routes.flightconditionelement
ON flightconditionelement_annotation.note_pt_id = NotePropertyType.id
;

FlightRestrictionLevel
CREATE OR REPLACE VIEW flightrestrictionlevel_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestrictionlevel_pt.id,
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
    ) AS flightrestrictionlevel
FROM

-- FlightRestrictionLevelType
LEFT JOIN routes.flightrestrictionlevel_pt
ON routes.flightrestrictionlevel_pt.flightrestrictionlevel_id = FlightRestrictionLevelType.id
-- AbstractExtensionType
LEFT JOIN routes.flightrestrictionlevel
ON routes.flightrestrictionlevel.abstractflightrestrictionlevelextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.flightrestrictionlevel_annotation
ON routes.flightrestrictionlevel.id = flightrestrictionlevel_annotation.flightrestrictionlevel_id
LEFT JOIN routes.flightrestrictionlevel
ON flightrestrictionlevel_annotation.note_pt_id = NotePropertyType.id
;

FlightRestriction
CREATE OR REPLACE VIEW flightrestriction_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestriction_pt.id,
       'nilReason', routes.flightrestriction_pt.nilReason,
       'href', routes.flightrestriction_pt.href,
       'id', routes.flightrestriction_tsp.id,
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
       'feature_lifetime_end', routes.flightrestriction_ts.feature_lifetime_end,
       'id', routes.flightrestriction.id,
       'identifier', routes.flightrestriction.identifier,
       'identifier_code_space', routes.flightrestriction.identifier_code_space,
       'xml_id', routes.flightrestriction.xml_id
    ) AS flightrestriction
FROM

-- FlightRestrictionTimeSliceType
LEFT JOIN routes.flightrestriction_tsp
ON routes.flightrestriction_tsp.flightrestrictiontimeslice_id = FlightRestrictionTimeSliceType.id
-- FlightConditionCombinationPropertyType
LEFT JOIN routes.flightrestriction_ts
ON routes.flightrestriction_ts.flight_id = FlightConditionCombinationPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.flightrestriction_ts
ON routes.flightrestriction_ts.abstractflightrestrictionextension_id = AbstractExtensionType.id

-- FlightRestrictionRoutePropertyType
LEFT JOIN routes.flightrestriction_ts_regulatedroute
ON routes.flightrestriction_ts.id = flightrestriction_ts_regulatedroute.flightrestriction_ts_id
LEFT JOIN routes.flightrestriction_ts
ON flightrestriction_ts_regulatedroute.flightrestrictionroute_pt_id = FlightRestrictionRoutePropertyType.id
-- NotePropertyType
LEFT JOIN routes.flightrestriction_ts_annotation
ON routes.flightrestriction_ts.id = flightrestriction_ts_annotation.flightrestriction_ts_id
LEFT JOIN routes.flightrestriction_ts
ON flightrestriction_ts_annotation.note_pt_id = NotePropertyType.id
-- FlightRestrictionTimeSlicePropertyType
LEFT JOIN routes.flightrestriction_timeslice
ON routes.flightrestriction.id = flightrestriction_timeslice.flightrestriction_id
LEFT JOIN routes.flightrestriction
ON flightrestriction_timeslice.flightrestriction_tsp_id = FlightRestrictionTimeSlicePropertyType.id
;

FlightRestrictionRoute
CREATE OR REPLACE VIEW flightrestrictionroute_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightrestrictionroute_pt.id,
       'priorpermission_value', routes.flightrestrictionroute.priorpermission_value,
       'priorpermission_nilreason', routes.flightrestrictionroute.priorpermission_nilreason,
       'id', routes.flightrestrictionroute.id,
       'identifier', routes.flightrestrictionroute.identifier,
       'identifier_code_space', routes.flightrestrictionroute.identifier_code_space,
       'xml_id', routes.flightrestrictionroute.xml_id
    ) AS flightrestrictionroute
FROM

-- FlightRestrictionRouteType
LEFT JOIN routes.flightrestrictionroute_pt
ON routes.flightrestrictionroute_pt.flightrestrictionroute_id = FlightRestrictionRouteType.id
-- AbstractExtensionType
LEFT JOIN routes.flightrestrictionroute
ON routes.flightrestrictionroute.abstractflightrestrictionrouteextension_id = AbstractExtensionType.id

-- FlightRoutingElementPropertyType
LEFT JOIN routes.flightrestrictionroute_routeelement
ON routes.flightrestrictionroute.id = flightrestrictionroute_routeelement.flightrestrictionroute_id
LEFT JOIN routes.flightrestrictionroute
ON flightrestrictionroute_routeelement.flightroutingelement_pt_id = FlightRoutingElementPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN routes.flightrestrictionroute_contact
ON routes.flightrestrictionroute.id = flightrestrictionroute_contact.flightrestrictionroute_id
LEFT JOIN routes.flightrestrictionroute
ON flightrestrictionroute_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN routes.flightrestrictionroute_annotation
ON routes.flightrestrictionroute.id = flightrestrictionroute_annotation.flightrestrictionroute_id
LEFT JOIN routes.flightrestrictionroute
ON flightrestrictionroute_annotation.note_pt_id = NotePropertyType.id
;

FlightRoutingElement
CREATE OR REPLACE VIEW flightroutingelement_view AS
SELECT
    jsonb_build_object(
       'id', routes.flightroutingelement_pt.id,
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
    ) AS flightroutingelement
FROM

-- FlightRoutingElementType
LEFT JOIN routes.flightroutingelement_pt
ON routes.flightroutingelement_pt.flightroutingelement_id = FlightRoutingElementType.id
-- DirectFlightSegmentPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_directflightelement_id = DirectFlightSegmentPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_routeportionelement_id = RoutePortionPropertyType.id
-- StandardInstrumentDeparturePropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_standardinstrumentdepartureelement_id = StandardInstrumentDeparturePropertyType.id
-- StandardInstrumentArrivalPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_standardinstrumentarrivalelement_id = StandardInstrumentArrivalPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.pointelement_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AirspacePropertyType
LEFT JOIN routes.flightroutingelement
ON routes.flightroutingelement.element_airspaceelement_id = AirspacePropertyType.id
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
LEFT JOIN routes.flightroutingelement_flightlevel
ON routes.flightroutingelement.id = flightroutingelement_flightlevel.flightroutingelement_id
LEFT JOIN routes.flightroutingelement
ON flightroutingelement_flightlevel.flightrestrictionlevel_pt_id = FlightRestrictionLevelPropertyType.id
-- NotePropertyType
LEFT JOIN routes.flightroutingelement_annotation
ON routes.flightroutingelement.id = flightroutingelement_annotation.flightroutingelement_id
LEFT JOIN routes.flightroutingelement
ON flightroutingelement_annotation.note_pt_id = NotePropertyType.id
;

FloatingDockSite
CREATE OR REPLACE VIEW floatingdocksite_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.floatingdocksite_pt.id,
       'nilReason', airport_heliport.floatingdocksite_pt.nilReason,
       'href', airport_heliport.floatingdocksite_pt.href,
       'id', airport_heliport.floatingdocksite_tsp.id,
       'id', airport_heliport.floatingdocksite_ts.id,
       'xml_id', airport_heliport.floatingdocksite_ts.xml_id,
       'interpretation', airport_heliport.floatingdocksite_ts.interpretation,
       'sequence_number', airport_heliport.floatingdocksite_ts.sequence_number,
       'correction_number', airport_heliport.floatingdocksite_ts.correction_number,
       'valid_time_begin', airport_heliport.floatingdocksite_ts.valid_time_begin,
       'valid_time_end', airport_heliport.floatingdocksite_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.floatingdocksite_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.floatingdocksite_ts.feature_lifetime_end,
       'id', airport_heliport.floatingdocksite.id,
       'identifier', airport_heliport.floatingdocksite.identifier,
       'identifier_code_space', airport_heliport.floatingdocksite.identifier_code_space,
       'xml_id', airport_heliport.floatingdocksite.xml_id
    ) AS floatingdocksite
FROM

-- FloatingDockSiteTimeSliceType
LEFT JOIN airport_heliport.floatingdocksite_tsp
ON airport_heliport.floatingdocksite_tsp.floatingdocksitetimeslice_id = FloatingDockSiteTimeSliceType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.floatingdocksite_ts
ON airport_heliport.floatingdocksite_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.floatingdocksite_ts
ON airport_heliport.floatingdocksite_ts.abstractfloatingdocksiteextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.floatingdocksite_ts_annotation
ON airport_heliport.floatingdocksite_ts.id = floatingdocksite_ts_annotation.floatingdocksite_ts_id
LEFT JOIN airport_heliport.floatingdocksite_ts
ON floatingdocksite_ts_annotation.note_pt_id = NotePropertyType.id
-- FloatingDockSiteTimeSlicePropertyType
LEFT JOIN airport_heliport.floatingdocksite_timeslice
ON airport_heliport.floatingdocksite.id = floatingdocksite_timeslice.floatingdocksite_id
LEFT JOIN airport_heliport.floatingdocksite
ON floatingdocksite_timeslice.floatingdocksite_tsp_id = FloatingDockSiteTimeSlicePropertyType.id
;

Fuel
CREATE OR REPLACE VIEW fuel_view AS
SELECT
    jsonb_build_object(
       'id', service.fuel_pt.id,
       'category_value', service.fuel.category_value,
       'category_nilreason', service.fuel.category_nilreason,
       'id', service.fuel.id,
       'identifier', service.fuel.identifier,
       'identifier_code_space', service.fuel.identifier_code_space,
       'xml_id', service.fuel.xml_id
    ) AS fuel
FROM

-- FuelType
LEFT JOIN service.fuel_pt
ON service.fuel_pt.fuel_id = FuelType.id
-- AbstractExtensionType
LEFT JOIN service.fuel
ON service.fuel.abstractfuelextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.fuel_annotation
ON service.fuel.id = fuel_annotation.fuel_id
LEFT JOIN service.fuel
ON fuel_annotation.note_pt_id = NotePropertyType.id
;

GeoBorder
CREATE OR REPLACE VIEW geoborder_view AS
SELECT
    jsonb_build_object(
       'id', airspace.geoborder_pt.id,
       'nilReason', airspace.geoborder_pt.nilReason,
       'href', airspace.geoborder_pt.href,
       'id', airspace.geoborder_tsp.id,
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
       'feature_lifetime_end', airspace.geoborder_ts.feature_lifetime_end,
       'id', airspace.geoborder.id,
       'identifier', airspace.geoborder.identifier,
       'identifier_code_space', airspace.geoborder.identifier_code_space,
       'xml_id', airspace.geoborder.xml_id
    ) AS geoborder
FROM

-- GeoBorderTimeSliceType
LEFT JOIN airspace.geoborder_tsp
ON airspace.geoborder_tsp.geobordertimeslice_id = GeoBorderTimeSliceType.id
-- CurvePropertyType
LEFT JOIN airspace.geoborder_ts
ON airspace.geoborder_ts.border_id = CurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN airspace.geoborder_ts
ON airspace.geoborder_ts.abstractgeoborderextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airspace.geoborder_ts_annotation
ON airspace.geoborder_ts.id = geoborder_ts_annotation.geoborder_ts_id
LEFT JOIN airspace.geoborder_ts
ON geoborder_ts_annotation.note_pt_id = NotePropertyType.id
-- GeoBorderTimeSlicePropertyType
LEFT JOIN airspace.geoborder_timeslice
ON airspace.geoborder.id = geoborder_timeslice.geoborder_id
LEFT JOIN airspace.geoborder
ON geoborder_timeslice.geoborder_tsp_id = GeoBorderTimeSlicePropertyType.id
;

Glidepath
CREATE OR REPLACE VIEW glidepath_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.glidepath_pt.id,
       'nilReason', navaids_points.glidepath_pt.nilReason,
       'href', navaids_points.glidepath_pt.href,
       'id', navaids_points.glidepath_tsp.id,
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
       'feature_lifetime_end', navaids_points.glidepath_ts.feature_lifetime_end,
       'id', navaids_points.glidepath.id,
       'identifier', navaids_points.glidepath.identifier,
       'identifier_code_space', navaids_points.glidepath.identifier_code_space,
       'xml_id', navaids_points.glidepath.xml_id
    ) AS glidepath
FROM

-- GlidepathTimeSliceType
LEFT JOIN navaids_points.glidepath_tsp
ON navaids_points.glidepath_tsp.glidepathtimeslice_id = GlidepathTimeSliceType.id
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
LEFT JOIN navaids_points.glidepath_ts_authority
ON navaids_points.glidepath_ts.id = glidepath_ts_authority.glidepath_ts_id
LEFT JOIN navaids_points.glidepath_ts
ON glidepath_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.glidepath_ts_monitoring
ON navaids_points.glidepath_ts.id = glidepath_ts_monitoring.glidepath_ts_id
LEFT JOIN navaids_points.glidepath_ts
ON glidepath_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.glidepath_ts_availability
ON navaids_points.glidepath_ts.id = glidepath_ts_availability.glidepath_ts_id
LEFT JOIN navaids_points.glidepath_ts
ON glidepath_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.glidepath_ts_annotation
ON navaids_points.glidepath_ts.id = glidepath_ts_annotation.glidepath_ts_id
LEFT JOIN navaids_points.glidepath_ts
ON glidepath_ts_annotation.note_pt_id = NotePropertyType.id
-- GlidepathTimeSlicePropertyType
LEFT JOIN navaids_points.glidepath_timeslice
ON navaids_points.glidepath.id = glidepath_timeslice.glidepath_id
LEFT JOIN navaids_points.glidepath
ON glidepath_timeslice.glidepath_tsp_id = GlidepathTimeSlicePropertyType.id
;

GroundLightingAvailability
CREATE OR REPLACE VIEW groundlightingavailability_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.groundlightingavailability_pt.id,
       'operationalstatus_value', airport_heliport.groundlightingavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.groundlightingavailability.operationalstatus_nilreason,
       'id', airport_heliport.groundlightingavailability.id,
       'identifier', airport_heliport.groundlightingavailability.identifier,
       'identifier_code_space', airport_heliport.groundlightingavailability.identifier_code_space,
       'xml_id', airport_heliport.groundlightingavailability.xml_id
    ) AS groundlightingavailability
FROM

-- GroundLightingAvailabilityType
LEFT JOIN airport_heliport.groundlightingavailability_pt
ON airport_heliport.groundlightingavailability_pt.groundlightingavailability_id = GroundLightingAvailabilityType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.groundlightingavailability
ON airport_heliport.groundlightingavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.groundlightingavailability
ON airport_heliport.groundlightingavailability.abstractgroundlightingavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.groundlightingavailability_timeinterval
ON airport_heliport.groundlightingavailability.id = groundlightingavailability_timeinterval.groundlightingavailability_id
LEFT JOIN airport_heliport.groundlightingavailability
ON groundlightingavailability_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.groundlightingavailability_annotation
ON airport_heliport.groundlightingavailability.id = groundlightingavailability_annotation.groundlightingavailability_id
LEFT JOIN airport_heliport.groundlightingavailability
ON groundlightingavailability_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.groundlightingavailability_specialdateauthority
ON airport_heliport.groundlightingavailability.id = groundlightingavailability_specialdateauthority.groundlightingavailability_id
LEFT JOIN airport_heliport.groundlightingavailability
ON groundlightingavailability_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

GroundLightSystem
CREATE OR REPLACE VIEW groundlightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.groundlightsystem_pt.id,
       'nilReason', airport_heliport.groundlightsystem_pt.nilReason,
       'href', airport_heliport.groundlightsystem_pt.href
    ) AS groundlightsystem
FROM


;

GroundTrafficControlService
CREATE OR REPLACE VIEW groundtrafficcontrolservice_view AS
SELECT
    jsonb_build_object(
       'id', service.groundtrafficcontrolservice_pt.id,
       'nilReason', service.groundtrafficcontrolservice_pt.nilReason,
       'href', service.groundtrafficcontrolservice_pt.href,
       'id', service.groundtrafficcontrolservice_tsp.id,
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
       'feature_lifetime_end', service.groundtrafficcontrolservice_ts.feature_lifetime_end,
       'id', service.groundtrafficcontrolservice.id,
       'identifier', service.groundtrafficcontrolservice.identifier,
       'identifier_code_space', service.groundtrafficcontrolservice.identifier_code_space,
       'xml_id', service.groundtrafficcontrolservice.xml_id
    ) AS groundtrafficcontrolservice
FROM

-- GroundTrafficControlServiceTimeSliceType
LEFT JOIN service.groundtrafficcontrolservice_tsp
ON service.groundtrafficcontrolservice_tsp.groundtrafficcontrolservicetimeslice_id = GroundTrafficControlServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.groundtrafficcontrolservice_ts_radiocommunication
ON service.groundtrafficcontrolservice_ts.id = groundtrafficcontrolservice_ts_radiocommunication.groundtrafficcontrolservice_ts_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON groundtrafficcontrolservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.groundtrafficcontrolservice_ts_groundcommunication
ON service.groundtrafficcontrolservice_ts.id = groundtrafficcontrolservice_ts_groundcommunication.groundtrafficcontrolservice_ts_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON groundtrafficcontrolservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.groundtrafficcontrolservice_ts_availability
ON service.groundtrafficcontrolservice_ts.id = groundtrafficcontrolservice_ts_availability.groundtrafficcontrolservice_ts_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON groundtrafficcontrolservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.groundtrafficcontrolservice_ts_annotation
ON service.groundtrafficcontrolservice_ts.id = groundtrafficcontrolservice_ts_annotation.groundtrafficcontrolservice_ts_id
LEFT JOIN service.groundtrafficcontrolservice_ts
ON groundtrafficcontrolservice_ts_annotation.note_pt_id = NotePropertyType.id
-- GroundTrafficControlServiceTimeSlicePropertyType
LEFT JOIN service.groundtrafficcontrolservice_timeslice
ON service.groundtrafficcontrolservice.id = groundtrafficcontrolservice_timeslice.groundtrafficcontrolservice_id
LEFT JOIN service.groundtrafficcontrolservice
ON groundtrafficcontrolservice_timeslice.groundtrafficcontrolservice_tsp_id = GroundTrafficControlServiceTimeSlicePropertyType.id
;

GuidanceLineLightSystem
CREATE OR REPLACE VIEW guidancelinelightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinelightsystem_pt.id,
       'nilReason', airport_heliport.guidancelinelightsystem_pt.nilReason,
       'href', airport_heliport.guidancelinelightsystem_pt.href,
       'id', airport_heliport.guidancelinelightsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.guidancelinelightsystem_ts.feature_lifetime_end,
       'id', airport_heliport.guidancelinelightsystem.id,
       'identifier', airport_heliport.guidancelinelightsystem.identifier,
       'identifier_code_space', airport_heliport.guidancelinelightsystem.identifier_code_space,
       'xml_id', airport_heliport.guidancelinelightsystem.xml_id
    ) AS guidancelinelightsystem
FROM

-- GuidanceLineLightSystemTimeSliceType
LEFT JOIN airport_heliport.guidancelinelightsystem_tsp
ON airport_heliport.guidancelinelightsystem_tsp.guidancelinelightsystemtimeslice_id = GuidanceLineLightSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.guidancelinelightsystem_ts_element
ON airport_heliport.guidancelinelightsystem_ts.id = guidancelinelightsystem_ts_element.guidancelinelightsystem_ts_id
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON guidancelinelightsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.guidancelinelightsystem_ts_availability
ON airport_heliport.guidancelinelightsystem_ts.id = guidancelinelightsystem_ts_availability.guidancelinelightsystem_ts_id
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON guidancelinelightsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.guidancelinelightsystem_ts_annotation
ON airport_heliport.guidancelinelightsystem_ts.id = guidancelinelightsystem_ts_annotation.guidancelinelightsystem_ts_id
LEFT JOIN airport_heliport.guidancelinelightsystem_ts
ON guidancelinelightsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- GuidanceLineLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.guidancelinelightsystem_timeslice
ON airport_heliport.guidancelinelightsystem.id = guidancelinelightsystem_timeslice.guidancelinelightsystem_id
LEFT JOIN airport_heliport.guidancelinelightsystem
ON guidancelinelightsystem_timeslice.guidancelinelightsystem_tsp_id = GuidanceLineLightSystemTimeSlicePropertyType.id
;

GuidanceLineMarking
CREATE OR REPLACE VIEW guidancelinemarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidancelinemarking_pt.id,
       'nilReason', airport_heliport.guidancelinemarking_pt.nilReason,
       'href', airport_heliport.guidancelinemarking_pt.href,
       'id', airport_heliport.guidancelinemarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.guidancelinemarking_ts.feature_lifetime_end,
       'id', airport_heliport.guidancelinemarking.id,
       'identifier', airport_heliport.guidancelinemarking.identifier,
       'identifier_code_space', airport_heliport.guidancelinemarking.identifier_code_space,
       'xml_id', airport_heliport.guidancelinemarking.xml_id
    ) AS guidancelinemarking
FROM

-- GuidanceLineMarkingTimeSliceType
LEFT JOIN airport_heliport.guidancelinemarking_tsp
ON airport_heliport.guidancelinemarking_tsp.guidancelinemarkingtimeslice_id = GuidanceLineMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.guidancelinemarking_ts_element
ON airport_heliport.guidancelinemarking_ts.id = guidancelinemarking_ts_element.guidancelinemarking_ts_id
LEFT JOIN airport_heliport.guidancelinemarking_ts
ON guidancelinemarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.guidancelinemarking_ts_annotation
ON airport_heliport.guidancelinemarking_ts.id = guidancelinemarking_ts_annotation.guidancelinemarking_ts_id
LEFT JOIN airport_heliport.guidancelinemarking_ts
ON guidancelinemarking_ts_annotation.note_pt_id = NotePropertyType.id
-- GuidanceLineMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.guidancelinemarking_timeslice
ON airport_heliport.guidancelinemarking.id = guidancelinemarking_timeslice.guidancelinemarking_id
LEFT JOIN airport_heliport.guidancelinemarking
ON guidancelinemarking_timeslice.guidancelinemarking_tsp_id = GuidanceLineMarkingTimeSlicePropertyType.id
;

GuidanceLine
CREATE OR REPLACE VIEW guidanceline_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.guidanceline_pt.id,
       'nilReason', airport_heliport.guidanceline_pt.nilReason,
       'href', airport_heliport.guidanceline_pt.href,
       'id', airport_heliport.guidanceline_tsp.id,
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
       'feature_lifetime_end', airport_heliport.guidanceline_ts.feature_lifetime_end,
       'id', airport_heliport.guidanceline.id,
       'identifier', airport_heliport.guidanceline.identifier,
       'identifier_code_space', airport_heliport.guidanceline.identifier_code_space,
       'xml_id', airport_heliport.guidanceline.xml_id
    ) AS guidanceline
FROM

-- GuidanceLineTimeSliceType
LEFT JOIN airport_heliport.guidanceline_tsp
ON airport_heliport.guidanceline_tsp.guidancelinetimeslice_id = GuidanceLineTimeSliceType.id
-- ElevatedCurvePropertyType
LEFT JOIN airport_heliport.guidanceline_ts
ON airport_heliport.guidanceline_ts.extent_id = ElevatedCurvePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.guidanceline_ts
ON airport_heliport.guidanceline_ts.abstractguidancelineextension_id = AbstractExtensionType.id

-- TouchDownLiftOffPropertyType
LEFT JOIN airport_heliport.guidanceline_ts_connectedtouchdownliftoff
ON airport_heliport.guidanceline_ts.id = guidanceline_ts_connectedtouchdownliftoff.guidanceline_ts_id
LEFT JOIN airport_heliport.guidanceline_ts
ON guidanceline_ts_connectedtouchdownliftoff.touchdownliftoff_pt_id = TouchDownLiftOffPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN airport_heliport.guidanceline_ts_connectedrunwaycentrelinepoint
ON airport_heliport.guidanceline_ts.id = guidanceline_ts_connectedrunwaycentrelinepoint.guidanceline_ts_id
LEFT JOIN airport_heliport.guidanceline_ts
ON guidanceline_ts_connectedrunwaycentrelinepoint.runwaycentrelinepoint_pt_id = RunwayCentrelinePointPropertyType.id
-- ApronPropertyType
LEFT JOIN airport_heliport.guidanceline_ts_connectedapron
ON airport_heliport.guidanceline_ts.id = guidanceline_ts_connectedapron.guidanceline_ts_id
LEFT JOIN airport_heliport.guidanceline_ts
ON guidanceline_ts_connectedapron.apron_pt_id = ApronPropertyType.id
-- AircraftStandPropertyType
LEFT JOIN airport_heliport.guidanceline_ts_connectedstand
ON airport_heliport.guidanceline_ts.id = guidanceline_ts_connectedstand.guidanceline_ts_id
LEFT JOIN airport_heliport.guidanceline_ts
ON guidanceline_ts_connectedstand.aircraftstand_pt_id = AircraftStandPropertyType.id
-- TaxiwayPropertyType
LEFT JOIN airport_heliport.guidanceline_ts_connectedtaxiway
ON airport_heliport.guidanceline_ts.id = guidanceline_ts_connectedtaxiway.guidanceline_ts_id
LEFT JOIN airport_heliport.guidanceline_ts
ON guidanceline_ts_connectedtaxiway.taxiway_pt_id = TaxiwayPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.guidanceline_ts_annotation
ON airport_heliport.guidanceline_ts.id = guidanceline_ts_annotation.guidanceline_ts_id
LEFT JOIN airport_heliport.guidanceline_ts
ON guidanceline_ts_annotation.note_pt_id = NotePropertyType.id
-- GuidanceLineTimeSlicePropertyType
LEFT JOIN airport_heliport.guidanceline_timeslice
ON airport_heliport.guidanceline.id = guidanceline_timeslice.guidanceline_id
LEFT JOIN airport_heliport.guidanceline
ON guidanceline_timeslice.guidanceline_tsp_id = GuidanceLineTimeSlicePropertyType.id
;

HoldingAssessment
CREATE OR REPLACE VIEW holdingassessment_view AS
SELECT
    jsonb_build_object(
       'id', shared.holdingassessment_pt.id,
       'nilReason', shared.holdingassessment_pt.nilReason,
       'href', shared.holdingassessment_pt.href,
       'id', shared.holdingassessment_tsp.id,
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
       'feature_lifetime_end', shared.holdingassessment_ts.feature_lifetime_end,
       'id', shared.holdingassessment.id,
       'identifier', shared.holdingassessment.identifier,
       'identifier_code_space', shared.holdingassessment.identifier_code_space,
       'xml_id', shared.holdingassessment.xml_id
    ) AS holdingassessment
FROM

-- HoldingAssessmentTimeSliceType
LEFT JOIN shared.holdingassessment_tsp
ON shared.holdingassessment_tsp.holdingassessmenttimeslice_id = HoldingAssessmentTimeSliceType.id
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
LEFT JOIN shared.holdingassessment_ts_obstacleassessment
ON shared.holdingassessment_ts.id = holdingassessment_ts_obstacleassessment.holdingassessment_ts_id
LEFT JOIN shared.holdingassessment_ts
ON holdingassessment_ts_obstacleassessment.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN shared.holdingassessment_ts_annotation
ON shared.holdingassessment_ts.id = holdingassessment_ts_annotation.holdingassessment_ts_id
LEFT JOIN shared.holdingassessment_ts
ON holdingassessment_ts_annotation.note_pt_id = NotePropertyType.id
-- HoldingAssessmentTimeSlicePropertyType
LEFT JOIN shared.holdingassessment_timeslice
ON shared.holdingassessment.id = holdingassessment_timeslice.holdingassessment_id
LEFT JOIN shared.holdingassessment
ON holdingassessment_timeslice.holdingassessment_tsp_id = HoldingAssessmentTimeSlicePropertyType.id
;

HoldingPatternDistance
CREATE OR REPLACE VIEW holdingpatterndistance_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpatterndistance_pt.id,
       'length_value', holding.holdingpatterndistance.length_value,
       'length_uom', holding.holdingpatterndistance.length_uom,
       'length_nilreason', holding.holdingpatterndistance.length_nilreason,
       'id', holding.holdingpatterndistance.id,
       'identifier', holding.holdingpatterndistance.identifier,
       'identifier_code_space', holding.holdingpatterndistance.identifier_code_space,
       'xml_id', holding.holdingpatterndistance.xml_id
    ) AS holdingpatterndistance
FROM

-- HoldingPatternDistanceType
LEFT JOIN holding.holdingpatterndistance_pt
ON holding.holdingpatterndistance_pt.holdingpatterndistance_id = HoldingPatternDistanceType.id
-- AbstractExtensionType
LEFT JOIN holding.holdingpatterndistance
ON holding.holdingpatterndistance.abstractholdingpatterndistanceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN holding.holdingpatterndistance_annotation
ON holding.holdingpatterndistance.id = holdingpatterndistance_annotation.holdingpatterndistance_id
LEFT JOIN holding.holdingpatterndistance
ON holdingpatterndistance_annotation.note_pt_id = NotePropertyType.id
;

HoldingPatternDuration
CREATE OR REPLACE VIEW holdingpatternduration_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpatternduration_pt.id,
       'duration_value', holding.holdingpatternduration.duration_value,
       'duration_uom', holding.holdingpatternduration.duration_uom,
       'duration_nilreason', holding.holdingpatternduration.duration_nilreason,
       'id', holding.holdingpatternduration.id,
       'identifier', holding.holdingpatternduration.identifier,
       'identifier_code_space', holding.holdingpatternduration.identifier_code_space,
       'xml_id', holding.holdingpatternduration.xml_id
    ) AS holdingpatternduration
FROM

-- HoldingPatternDurationType
LEFT JOIN holding.holdingpatternduration_pt
ON holding.holdingpatternduration_pt.holdingpatternduration_id = HoldingPatternDurationType.id
-- AbstractExtensionType
LEFT JOIN holding.holdingpatternduration
ON holding.holdingpatternduration.abstractholdingpatterndurationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN holding.holdingpatternduration_annotation
ON holding.holdingpatternduration.id = holdingpatternduration_annotation.holdingpatternduration_id
LEFT JOIN holding.holdingpatternduration
ON holdingpatternduration_annotation.note_pt_id = NotePropertyType.id
;

HoldingPattern
CREATE OR REPLACE VIEW holdingpattern_view AS
SELECT
    jsonb_build_object(
       'id', holding.holdingpattern_pt.id,
       'nilReason', holding.holdingpattern_pt.nilReason,
       'href', holding.holdingpattern_pt.href,
       'id', holding.holdingpattern_tsp.id,
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
       'feature_lifetime_end', holding.holdingpattern_ts.feature_lifetime_end,
       'id', holding.holdingpattern.id,
       'identifier', holding.holdingpattern.identifier,
       'identifier_code_space', holding.holdingpattern.identifier_code_space,
       'xml_id', holding.holdingpattern.xml_id
    ) AS holdingpattern
FROM

-- HoldingPatternTimeSliceType
LEFT JOIN holding.holdingpattern_tsp
ON holding.holdingpattern_tsp.holdingpatterntimeslice_id = HoldingPatternTimeSliceType.id
-- SegmentPointPropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.outboundlegspan_endpoint_id = SegmentPointPropertyType.id
-- HoldingPatternDistancePropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.outboundlegspan_enddistance_id = HoldingPatternDistancePropertyType.id
-- HoldingPatternDurationPropertyType
LEFT JOIN holding.holdingpattern_ts
ON holding.holdingpattern_ts.outboundlegspan_endtime_id = HoldingPatternDurationPropertyType.id
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
LEFT JOIN holding.holdingpattern_ts_annotation
ON holding.holdingpattern_ts.id = holdingpattern_ts_annotation.holdingpattern_ts_id
LEFT JOIN holding.holdingpattern_ts
ON holdingpattern_ts_annotation.note_pt_id = NotePropertyType.id
-- HoldingPatternTimeSlicePropertyType
LEFT JOIN holding.holdingpattern_timeslice
ON holding.holdingpattern.id = holdingpattern_timeslice.holdingpattern_id
LEFT JOIN holding.holdingpattern
ON holdingpattern_timeslice.holdingpattern_tsp_id = HoldingPatternTimeSlicePropertyType.id
;

HoldingUse
CREATE OR REPLACE VIEW holdinguse_view AS
SELECT
    jsonb_build_object(
       'id', procedure.holdinguse_pt.id,
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
    ) AS holdinguse
FROM

-- HoldingUseType
LEFT JOIN procedure.holdinguse_pt
ON procedure.holdinguse_pt.holdinguse_id = HoldingUseType.id
-- HoldingPatternPropertyType
LEFT JOIN procedure.holdinguse
ON procedure.holdinguse.theholdingpattern_id = HoldingPatternPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.holdinguse
ON procedure.holdinguse.abstractholdinguseextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.holdinguse_annotation
ON procedure.holdinguse.id = holdinguse_annotation.holdinguse_id
LEFT JOIN procedure.holdinguse
ON holdinguse_annotation.note_pt_id = NotePropertyType.id
;

InformationService
CREATE OR REPLACE VIEW informationservice_view AS
SELECT
    jsonb_build_object(
       'id', service.informationservice_pt.id,
       'nilReason', service.informationservice_pt.nilReason,
       'href', service.informationservice_pt.href,
       'id', service.informationservice_tsp.id,
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
       'feature_lifetime_end', service.informationservice_ts.feature_lifetime_end,
       'id', service.informationservice.id,
       'identifier', service.informationservice.identifier,
       'identifier_code_space', service.informationservice.identifier_code_space,
       'xml_id', service.informationservice.xml_id
    ) AS informationservice
FROM

-- InformationServiceTimeSliceType
LEFT JOIN service.informationservice_tsp
ON service.informationservice_tsp.informationservicetimeslice_id = InformationServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.informationservice_ts_radiocommunication
ON service.informationservice_ts.id = informationservice_ts_radiocommunication.informationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.informationservice_ts_groundcommunication
ON service.informationservice_ts.id = informationservice_ts_groundcommunication.informationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.informationservice_ts_availability
ON service.informationservice_ts.id = informationservice_ts_availability.informationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.informationservice_ts_annotation
ON service.informationservice_ts.id = informationservice_ts_annotation.informationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationservice_ts_annotation.note_pt_id = NotePropertyType.id
-- VORPropertyType
LEFT JOIN service.informationinformationservice_ts_navaidbroadcast
ON service.informationservice_ts.id = informationinformationservice_ts_navaidbroadcast.informationinformationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationinformationservice_ts_navaidbroadcast.vor_pt_id = VORPropertyType.id
-- AirspacePropertyType
LEFT JOIN service.informationinformationservice_ts_clientairspace
ON service.informationservice_ts.id = informationinformationservice_ts_clientairspace.informationinformationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationinformationservice_ts_clientairspace.airspace_pt_id = AirspacePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.informationinformationservice_ts_clientairport
ON service.informationservice_ts.id = informationinformationservice_ts_clientairport.informationinformationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationinformationservice_ts_clientairport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.informationinformationservice_ts_clientroute
ON service.informationservice_ts.id = informationinformationservice_ts_clientroute.informationinformationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationinformationservice_ts_clientroute.routeportion_pt_id = RoutePortionPropertyType.id
-- ProcedurePropertyType
LEFT JOIN service.informationinformationservice_ts_clientprocedure
ON service.informationservice_ts.id = informationinformationservice_ts_clientprocedure.informationinformationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationinformationservice_ts_clientprocedure.procedure_pt_id = ProcedurePropertyType.id
-- HoldingPatternPropertyType
LEFT JOIN service.informationinformationservice_ts_clientholding
ON service.informationservice_ts.id = informationinformationservice_ts_clientholding.informationinformationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationinformationservice_ts_clientholding.holdingpattern_pt_id = HoldingPatternPropertyType.id
-- AerialRefuellingPropertyType
LEFT JOIN service.informationinformationservice_ts_clientaerialrefuelling
ON service.informationservice_ts.id = informationinformationservice_ts_clientaerialrefuelling.informationinformationservice_ts_id
LEFT JOIN service.informationservice_ts
ON informationinformationservice_ts_clientaerialrefuelling.aerialrefuelling_pt_id = AerialRefuellingPropertyType.id
-- InformationServiceTimeSlicePropertyType
LEFT JOIN service.informationservice_timeslice
ON service.informationservice.id = informationservice_timeslice.informationservice_id
LEFT JOIN service.informationservice
ON informationservice_timeslice.informationservice_tsp_id = InformationServiceTimeSlicePropertyType.id
;

InitialLeg
CREATE OR REPLACE VIEW initialleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.initialleg_pt.id,
       'nilReason', procedure.initialleg_pt.nilReason,
       'href', procedure.initialleg_pt.href,
       'id', procedure.initialleg_tsp.id,
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
       'feature_lifetime_end', procedure.initialleg_ts.feature_lifetime_end,
       'id', procedure.initialleg.id,
       'identifier', procedure.initialleg.identifier,
       'identifier_code_space', procedure.initialleg.identifier_code_space,
       'xml_id', procedure.initialleg.xml_id
    ) AS initialleg
FROM

-- InitialLegTimeSliceType
LEFT JOIN procedure.initialleg_tsp
ON procedure.initialleg_tsp.initiallegtimeslice_id = InitialLegTimeSliceType.id
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
LEFT JOIN procedure.initialleg_ts_aircraftcategory
ON procedure.initialleg_ts.id = initialleg_ts_aircraftcategory.initialleg_ts_id
LEFT JOIN procedure.initialleg_ts
ON initialleg_ts_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.initialleg_ts_designsurface
ON procedure.initialleg_ts.id = initialleg_ts_designsurface.initialleg_ts_id
LEFT JOIN procedure.initialleg_ts
ON initialleg_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.initialleg_ts_annotation
ON procedure.initialleg_ts.id = initialleg_ts_annotation.initialleg_ts_id
LEFT JOIN procedure.initialleg_ts
ON initialleg_ts_annotation.note_pt_id = NotePropertyType.id
-- InitialLegTimeSlicePropertyType
LEFT JOIN procedure.initialleg_timeslice
ON procedure.initialleg.id = initialleg_timeslice.initialleg_id
LEFT JOIN procedure.initialleg
ON initialleg_timeslice.initialleg_tsp_id = InitialLegTimeSlicePropertyType.id
;

InstrumentApproachProcedure
CREATE OR REPLACE VIEW instrumentapproachprocedure_view AS
SELECT
    jsonb_build_object(
       'id', procedure.instrumentapproachprocedure_pt.id,
       'nilReason', procedure.instrumentapproachprocedure_pt.nilReason,
       'href', procedure.instrumentapproachprocedure_pt.href,
       'id', procedure.instrumentapproachprocedure_tsp.id,
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
       'feature_lifetime_end', procedure.instrumentapproachprocedure_ts.feature_lifetime_end,
       'id', procedure.instrumentapproachprocedure.id,
       'identifier', procedure.instrumentapproachprocedure.identifier,
       'identifier_code_space', procedure.instrumentapproachprocedure.identifier_code_space,
       'xml_id', procedure.instrumentapproachprocedure.xml_id
    ) AS instrumentapproachprocedure
FROM

-- InstrumentApproachProcedureTimeSliceType
LEFT JOIN procedure.instrumentapproachprocedure_tsp
ON procedure.instrumentapproachprocedure_tsp.instrumentapproachproceduretimeslice_id = InstrumentApproachProcedureTimeSliceType.id
-- SpecialNavigationSystemPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.guidancefacility_specialnavigationsystem_id = SpecialNavigationSystemPropertyType.id
-- RadarSystemPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.guidancefacility_radar_id = RadarSystemPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON procedure.instrumentapproachprocedure_ts.guidancefacility_navaid_id = NavaidPropertyType.id
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
LEFT JOIN procedure.instrumentapproachprocedure_ts_availability
ON procedure.instrumentapproachprocedure_ts.id = instrumentapproachprocedure_ts_availability.instrumentapproachprocedure_ts_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON instrumentapproachprocedure_ts_availability.procedureavailability_pt_id = ProcedureAvailabilityPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts_airportheliport
ON procedure.instrumentapproachprocedure_ts.id = instrumentapproachprocedure_ts_airportheliport.instrumentapproachprocedure_ts_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON instrumentapproachprocedure_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts_aircraftcharacteristic
ON procedure.instrumentapproachprocedure_ts.id = instrumentapproachprocedure_ts_aircraftcharacteristic.instrumentapproachprocedure_ts_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON instrumentapproachprocedure_ts_aircraftcharacteristic.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ProcedureTransitionPropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts_flighttransition
ON procedure.instrumentapproachprocedure_ts.id = instrumentapproachprocedure_ts_flighttransition.instrumentapproachprocedure_ts_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON instrumentapproachprocedure_ts_flighttransition.proceduretransition_pt_id = ProcedureTransitionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.instrumentapproachprocedure_ts_annotation
ON procedure.instrumentapproachprocedure_ts.id = instrumentapproachprocedure_ts_annotation.instrumentapproachprocedure_ts_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON instrumentapproachprocedure_ts_annotation.note_pt_id = NotePropertyType.id
-- MissedApproachGroupPropertyType
LEFT JOIN procedure.instrumentapproachinstrumentapproachprocedure_ts_missedinstruction
ON procedure.instrumentapproachprocedure_ts.id = instrumentapproachinstrumentapproachprocedure_ts_missedinstruction.instrumentapproachinstrumentapproachprocedure_ts_id
LEFT JOIN procedure.instrumentapproachprocedure_ts
ON instrumentapproachinstrumentapproachprocedure_ts_missedinstruction.missedapproachgroup_pt_id = MissedApproachGroupPropertyType.id
-- InstrumentApproachProcedureTimeSlicePropertyType
LEFT JOIN procedure.instrumentapproachprocedure_timeslice
ON procedure.instrumentapproachprocedure.id = instrumentapproachprocedure_timeslice.instrumentapproachprocedure_id
LEFT JOIN procedure.instrumentapproachprocedure
ON instrumentapproachprocedure_timeslice.instrumentapproachprocedure_tsp_id = InstrumentApproachProcedureTimeSlicePropertyType.id
;

IntermediateLeg
CREATE OR REPLACE VIEW intermediateleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.intermediateleg_pt.id,
       'nilReason', procedure.intermediateleg_pt.nilReason,
       'href', procedure.intermediateleg_pt.href,
       'id', procedure.intermediateleg_tsp.id,
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
       'feature_lifetime_end', procedure.intermediateleg_ts.feature_lifetime_end,
       'id', procedure.intermediateleg.id,
       'identifier', procedure.intermediateleg.identifier,
       'identifier_code_space', procedure.intermediateleg.identifier_code_space,
       'xml_id', procedure.intermediateleg.xml_id
    ) AS intermediateleg
FROM

-- IntermediateLegTimeSliceType
LEFT JOIN procedure.intermediateleg_tsp
ON procedure.intermediateleg_tsp.intermediatelegtimeslice_id = IntermediateLegTimeSliceType.id
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
LEFT JOIN procedure.intermediateleg_ts_aircraftcategory
ON procedure.intermediateleg_ts.id = intermediateleg_ts_aircraftcategory.intermediateleg_ts_id
LEFT JOIN procedure.intermediateleg_ts
ON intermediateleg_ts_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.intermediateleg_ts_designsurface
ON procedure.intermediateleg_ts.id = intermediateleg_ts_designsurface.intermediateleg_ts_id
LEFT JOIN procedure.intermediateleg_ts
ON intermediateleg_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.intermediateleg_ts_annotation
ON procedure.intermediateleg_ts.id = intermediateleg_ts_annotation.intermediateleg_ts_id
LEFT JOIN procedure.intermediateleg_ts
ON intermediateleg_ts_annotation.note_pt_id = NotePropertyType.id
-- IntermediateLegTimeSlicePropertyType
LEFT JOIN procedure.intermediateleg_timeslice
ON procedure.intermediateleg.id = intermediateleg_timeslice.intermediateleg_id
LEFT JOIN procedure.intermediateleg
ON intermediateleg_timeslice.intermediateleg_tsp_id = IntermediateLegTimeSlicePropertyType.id
;

LandingTakeoffAreaCollection
CREATE OR REPLACE VIEW landingtakeoffareacollection_view AS
SELECT
    jsonb_build_object(
       'id', procedure.landingtakeoffareacollection_pt.id,
       'id', procedure.landingtakeoffareacollection.id,
       'identifier', procedure.landingtakeoffareacollection.identifier,
       'identifier_code_space', procedure.landingtakeoffareacollection.identifier_code_space,
       'xml_id', procedure.landingtakeoffareacollection.xml_id
    ) AS landingtakeoffareacollection
FROM

-- LandingTakeoffAreaCollectionType
LEFT JOIN procedure.landingtakeoffareacollection_pt
ON procedure.landingtakeoffareacollection_pt.landingtakeoffareacollection_id = LandingTakeoffAreaCollectionType.id
-- AbstractExtensionType
LEFT JOIN procedure.landingtakeoffareacollection
ON procedure.landingtakeoffareacollection.abstractlandingtakeoffareacollectionextension_id = AbstractExtensionType.id

-- RunwayDirectionPropertyType
LEFT JOIN procedure.landingtakeoffareacollection_runway
ON procedure.landingtakeoffareacollection.id = landingtakeoffareacollection_runway.landingtakeoffareacollection_id
LEFT JOIN procedure.landingtakeoffareacollection
ON landingtakeoffareacollection_runway.runwaydirection_pt_id = RunwayDirectionPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.landingtakeoffareacollection_tlof
ON procedure.landingtakeoffareacollection.id = landingtakeoffareacollection_tlof.landingtakeoffareacollection_id
LEFT JOIN procedure.landingtakeoffareacollection
ON landingtakeoffareacollection_tlof.touchdownliftoff_pt_id = TouchDownLiftOffPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.landingtakeoffareacollection_annotation
ON procedure.landingtakeoffareacollection.id = landingtakeoffareacollection_annotation.landingtakeoffareacollection_id
LEFT JOIN procedure.landingtakeoffareacollection
ON landingtakeoffareacollection_annotation.note_pt_id = NotePropertyType.id
;

LightActivation
CREATE OR REPLACE VIEW lightactivation_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.lightactivation_pt.id,
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
    ) AS lightactivation
FROM

-- LightActivationType
LEFT JOIN airport_heliport.lightactivation_pt
ON airport_heliport.lightactivation_pt.lightactivation_id = LightActivationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.lightactivation
ON airport_heliport.lightactivation.abstractlightactivationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.lightactivation_annotation
ON airport_heliport.lightactivation.id = lightactivation_annotation.lightactivation_id
LEFT JOIN airport_heliport.lightactivation
ON lightactivation_annotation.note_pt_id = NotePropertyType.id
;

LightElement
CREATE OR REPLACE VIEW lightelement_view AS
SELECT
    jsonb_build_object(
       'id', shared.lightelement_pt.id,
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
    ) AS lightelement
FROM

-- LightElementType
LEFT JOIN shared.lightelement_pt
ON shared.lightelement_pt.lightelement_id = LightElementType.id
-- ElevatedPointPropertyType
LEFT JOIN shared.lightelement
ON shared.lightelement.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.lightelement
ON shared.lightelement.abstractlightelementextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.lightelement_annotation
ON shared.lightelement.id = lightelement_annotation.lightelement_id
LEFT JOIN shared.lightelement
ON lightelement_annotation.note_pt_id = NotePropertyType.id
-- LightElementStatusPropertyType
LEFT JOIN shared.lightelement_availability
ON shared.lightelement.id = lightelement_availability.lightelement_id
LEFT JOIN shared.lightelement
ON lightelement_availability.lightelementstatus_pt_id = LightElementStatusPropertyType.id
;

LightElementStatus
CREATE OR REPLACE VIEW lightelementstatus_view AS
SELECT
    jsonb_build_object(
       'id', shared.lightelementstatus_pt.id,
       'status_value', shared.lightelementstatus.status_value,
       'status_nilreason', shared.lightelementstatus.status_nilreason,
       'id', shared.lightelementstatus.id,
       'identifier', shared.lightelementstatus.identifier,
       'identifier_code_space', shared.lightelementstatus.identifier_code_space,
       'xml_id', shared.lightelementstatus.xml_id
    ) AS lightelementstatus
FROM

-- LightElementStatusType
LEFT JOIN shared.lightelementstatus_pt
ON shared.lightelementstatus_pt.lightelementstatus_id = LightElementStatusType.id
-- AbstractExtensionType
LEFT JOIN shared.lightelementstatus
ON shared.lightelementstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.lightelementstatus
ON shared.lightelementstatus.abstractlightelementstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.lightelementstatus_timeinterval
ON shared.lightelementstatus.id = lightelementstatus_timeinterval.lightelementstatus_id
LEFT JOIN shared.lightelementstatus
ON lightelementstatus_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.lightelementstatus_annotation
ON shared.lightelementstatus.id = lightelementstatus_annotation.lightelementstatus_id
LEFT JOIN shared.lightelementstatus
ON lightelementstatus_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.lightelementstatus_specialdateauthority
ON shared.lightelementstatus.id = lightelementstatus_specialdateauthority.lightelementstatus_id
LEFT JOIN shared.lightelementstatus
ON lightelementstatus_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

LinguisticNote
CREATE OR REPLACE VIEW linguisticnote_view AS
SELECT
    jsonb_build_object(
       'id', notes.linguisticnote_pt.id,
       'note_value', notes.linguisticnote.note_value,
       'note_nilreason', notes.linguisticnote.note_nilreason,
       'note_lang', notes.linguisticnote.note_lang,
       'id', notes.linguisticnote.id,
       'identifier', notes.linguisticnote.identifier,
       'identifier_code_space', notes.linguisticnote.identifier_code_space,
       'xml_id', notes.linguisticnote.xml_id
    ) AS linguisticnote
FROM

-- LinguisticNoteType
LEFT JOIN notes.linguisticnote_pt
ON notes.linguisticnote_pt.linguisticnote_id = LinguisticNoteType.id
-- AbstractExtensionType
LEFT JOIN notes.linguisticnote
ON notes.linguisticnote.abstractlinguisticnoteextension_id = AbstractExtensionType.id

;

Localizer
CREATE OR REPLACE VIEW localizer_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.localizer_pt.id,
       'nilReason', navaids_points.localizer_pt.nilReason,
       'href', navaids_points.localizer_pt.href,
       'id', navaids_points.localizer_tsp.id,
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
       'feature_lifetime_end', navaids_points.localizer_ts.feature_lifetime_end,
       'id', navaids_points.localizer.id,
       'identifier', navaids_points.localizer.identifier,
       'identifier_code_space', navaids_points.localizer.identifier_code_space,
       'xml_id', navaids_points.localizer.xml_id
    ) AS localizer
FROM

-- LocalizerTimeSliceType
LEFT JOIN navaids_points.localizer_tsp
ON navaids_points.localizer_tsp.localizertimeslice_id = LocalizerTimeSliceType.id
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
LEFT JOIN navaids_points.localizer_ts_authority
ON navaids_points.localizer_ts.id = localizer_ts_authority.localizer_ts_id
LEFT JOIN navaids_points.localizer_ts
ON localizer_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.localizer_ts_monitoring
ON navaids_points.localizer_ts.id = localizer_ts_monitoring.localizer_ts_id
LEFT JOIN navaids_points.localizer_ts
ON localizer_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.localizer_ts_availability
ON navaids_points.localizer_ts.id = localizer_ts_availability.localizer_ts_id
LEFT JOIN navaids_points.localizer_ts
ON localizer_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.localizer_ts_annotation
ON navaids_points.localizer_ts.id = localizer_ts_annotation.localizer_ts_id
LEFT JOIN navaids_points.localizer_ts
ON localizer_ts_annotation.note_pt_id = NotePropertyType.id
-- LocalizerTimeSlicePropertyType
LEFT JOIN navaids_points.localizer_timeslice
ON navaids_points.localizer.id = localizer_timeslice.localizer_id
LEFT JOIN navaids_points.localizer
ON localizer_timeslice.localizer_tsp_id = LocalizerTimeSlicePropertyType.id
;

ManoeuvringAreaAvailability
CREATE OR REPLACE VIEW manoeuvringareaavailability_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.manoeuvringareaavailability_pt.id,
       'operationalstatus_value', airport_heliport.manoeuvringareaavailability.operationalstatus_value,
       'operationalstatus_nilreason', airport_heliport.manoeuvringareaavailability.operationalstatus_nilreason,
       'warning_value', airport_heliport.manoeuvringareaavailability.warning_value,
       'warning_nilreason', airport_heliport.manoeuvringareaavailability.warning_nilreason,
       'id', airport_heliport.manoeuvringareaavailability.id,
       'identifier', airport_heliport.manoeuvringareaavailability.identifier,
       'identifier_code_space', airport_heliport.manoeuvringareaavailability.identifier_code_space,
       'xml_id', airport_heliport.manoeuvringareaavailability.xml_id
    ) AS manoeuvringareaavailability
FROM

-- ManoeuvringAreaAvailabilityType
LEFT JOIN airport_heliport.manoeuvringareaavailability_pt
ON airport_heliport.manoeuvringareaavailability_pt.manoeuvringareaavailability_id = ManoeuvringAreaAvailabilityType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON airport_heliport.manoeuvringareaavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON airport_heliport.manoeuvringareaavailability.abstractmanoeuvringareaavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.manoeuvringareaavailability_timeinterval
ON airport_heliport.manoeuvringareaavailability.id = manoeuvringareaavailability_timeinterval.manoeuvringareaavailability_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON manoeuvringareaavailability_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.manoeuvringareaavailability_annotation
ON airport_heliport.manoeuvringareaavailability.id = manoeuvringareaavailability_annotation.manoeuvringareaavailability_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON manoeuvringareaavailability_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.manoeuvringareaavailability_specialdateauthority
ON airport_heliport.manoeuvringareaavailability.id = manoeuvringareaavailability_specialdateauthority.manoeuvringareaavailability_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON manoeuvringareaavailability_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- ManoeuvringAreaUsagePropertyType
LEFT JOIN airport_heliport.manoeuvringareaavailability_usage
ON airport_heliport.manoeuvringareaavailability.id = manoeuvringareaavailability_usage.manoeuvringareaavailability_id
LEFT JOIN airport_heliport.manoeuvringareaavailability
ON manoeuvringareaavailability_usage.manoeuvringareausage_pt_id = ManoeuvringAreaUsagePropertyType.id
;

ManoeuvringAreaUsage
CREATE OR REPLACE VIEW manoeuvringareausage_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.manoeuvringareausage_pt.id,
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
    ) AS manoeuvringareausage
FROM

-- ManoeuvringAreaUsageType
LEFT JOIN airport_heliport.manoeuvringareausage_pt
ON airport_heliport.manoeuvringareausage_pt.manoeuvringareausage_id = ManoeuvringAreaUsageType.id
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
LEFT JOIN airport_heliport.manoeuvringareausage_contact
ON airport_heliport.manoeuvringareausage.id = manoeuvringareausage_contact.manoeuvringareausage_id
LEFT JOIN airport_heliport.manoeuvringareausage
ON manoeuvringareausage_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.manoeuvringareausage_annotation
ON airport_heliport.manoeuvringareausage.id = manoeuvringareausage_annotation.manoeuvringareausage_id
LEFT JOIN airport_heliport.manoeuvringareausage
ON manoeuvringareausage_annotation.note_pt_id = NotePropertyType.id
;

MarkerBeacon
CREATE OR REPLACE VIEW markerbeacon_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.markerbeacon_pt.id,
       'nilReason', navaids_points.markerbeacon_pt.nilReason,
       'href', navaids_points.markerbeacon_pt.href,
       'id', navaids_points.markerbeacon_tsp.id,
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
       'feature_lifetime_end', navaids_points.markerbeacon_ts.feature_lifetime_end,
       'id', navaids_points.markerbeacon.id,
       'identifier', navaids_points.markerbeacon.identifier,
       'identifier_code_space', navaids_points.markerbeacon.identifier_code_space,
       'xml_id', navaids_points.markerbeacon.xml_id
    ) AS markerbeacon
FROM

-- MarkerBeaconTimeSliceType
LEFT JOIN navaids_points.markerbeacon_tsp
ON navaids_points.markerbeacon_tsp.markerbeacontimeslice_id = MarkerBeaconTimeSliceType.id
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
LEFT JOIN navaids_points.markerbeacon_ts_authority
ON navaids_points.markerbeacon_ts.id = markerbeacon_ts_authority.markerbeacon_ts_id
LEFT JOIN navaids_points.markerbeacon_ts
ON markerbeacon_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.markerbeacon_ts_monitoring
ON navaids_points.markerbeacon_ts.id = markerbeacon_ts_monitoring.markerbeacon_ts_id
LEFT JOIN navaids_points.markerbeacon_ts
ON markerbeacon_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.markerbeacon_ts_availability
ON navaids_points.markerbeacon_ts.id = markerbeacon_ts_availability.markerbeacon_ts_id
LEFT JOIN navaids_points.markerbeacon_ts
ON markerbeacon_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.markerbeacon_ts_annotation
ON navaids_points.markerbeacon_ts.id = markerbeacon_ts_annotation.markerbeacon_ts_id
LEFT JOIN navaids_points.markerbeacon_ts
ON markerbeacon_ts_annotation.note_pt_id = NotePropertyType.id
-- MarkerBeaconTimeSlicePropertyType
LEFT JOIN navaids_points.markerbeacon_timeslice
ON navaids_points.markerbeacon.id = markerbeacon_timeslice.markerbeacon_id
LEFT JOIN navaids_points.markerbeacon
ON markerbeacon_timeslice.markerbeacon_tsp_id = MarkerBeaconTimeSlicePropertyType.id
;

MarkingBuoy
CREATE OR REPLACE VIEW markingbuoy_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.markingbuoy_pt.id,
       'nilReason', airport_heliport.markingbuoy_pt.nilReason,
       'href', airport_heliport.markingbuoy_pt.href,
       'id', airport_heliport.markingbuoy_tsp.id,
       'designator_value', airport_heliport.markingbuoy_ts.designator_value,
       'designator_nilreason', airport_heliport.markingbuoy_ts.designator_nilreason,
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
       'feature_lifetime_end', airport_heliport.markingbuoy_ts.feature_lifetime_end,
       'id', airport_heliport.markingbuoy.id,
       'identifier', airport_heliport.markingbuoy.identifier,
       'identifier_code_space', airport_heliport.markingbuoy.identifier_code_space,
       'xml_id', airport_heliport.markingbuoy.xml_id
    ) AS markingbuoy
FROM

-- MarkingBuoyTimeSliceType
LEFT JOIN airport_heliport.markingbuoy_tsp
ON airport_heliport.markingbuoy_tsp.markingbuoytimeslice_id = MarkingBuoyTimeSliceType.id
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
LEFT JOIN airport_heliport.markingbuoy_ts_annotation
ON airport_heliport.markingbuoy_ts.id = markingbuoy_ts_annotation.markingbuoy_ts_id
LEFT JOIN airport_heliport.markingbuoy_ts
ON markingbuoy_ts_annotation.note_pt_id = NotePropertyType.id
-- MarkingBuoyTimeSlicePropertyType
LEFT JOIN airport_heliport.markingbuoy_timeslice
ON airport_heliport.markingbuoy.id = markingbuoy_timeslice.markingbuoy_id
LEFT JOIN airport_heliport.markingbuoy
ON markingbuoy_timeslice.markingbuoy_tsp_id = MarkingBuoyTimeSlicePropertyType.id
;

MarkingElement
CREATE OR REPLACE VIEW markingelement_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.markingelement_pt.id,
       'colour_value', airport_heliport.markingelement.colour_value,
       'colour_nilreason', airport_heliport.markingelement.colour_nilreason,
       'style_value', airport_heliport.markingelement.style_value,
       'style_nilreason', airport_heliport.markingelement.style_nilreason,
       'id', airport_heliport.markingelement.id,
       'identifier', airport_heliport.markingelement.identifier,
       'identifier_code_space', airport_heliport.markingelement.identifier_code_space,
       'xml_id', airport_heliport.markingelement.xml_id
    ) AS markingelement
FROM

-- MarkingElementType
LEFT JOIN airport_heliport.markingelement_pt
ON airport_heliport.markingelement_pt.markingelement_id = MarkingElementType.id
-- ElevatedCurvePropertyType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.extent_curveextent_id = ElevatedCurvePropertyType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.extent_surfaceextent_id = ElevatedSurfacePropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.extent_location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.markingelement
ON airport_heliport.markingelement.abstractmarkingelementextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.markingelement_annotation
ON airport_heliport.markingelement.id = markingelement_annotation.markingelement_id
LEFT JOIN airport_heliport.markingelement
ON markingelement_annotation.note_pt_id = NotePropertyType.id
;

Marking
CREATE OR REPLACE VIEW marking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.marking_pt.id,
       'nilReason', airport_heliport.marking_pt.nilReason,
       'href', airport_heliport.marking_pt.href
    ) AS marking
FROM


;

MessageMetadata
CREATE OR REPLACE VIEW messagemetadata_view AS
SELECT
    jsonb_build_object(
       'id', public.message_metadata_property.id
    ) AS messagemetadata
FROM


;

Meteorology
CREATE OR REPLACE VIEW meteorology_view AS
SELECT
    jsonb_build_object(
       'id', shared.meteorology_pt.id,
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
    ) AS meteorology
FROM

-- MeteorologyType
LEFT JOIN shared.meteorology_pt
ON shared.meteorology_pt.meteorology_id = MeteorologyType.id
-- AbstractExtensionType
LEFT JOIN shared.meteorology
ON shared.meteorology.abstractmeteorologyextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.meteorology_annotation
ON shared.meteorology.id = meteorology_annotation.meteorology_id
LEFT JOIN shared.meteorology
ON meteorology_annotation.note_pt_id = NotePropertyType.id
;

Minima
CREATE OR REPLACE VIEW minima_view AS
SELECT
    jsonb_build_object(
       'id', procedure.minima_pt.id,
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
    ) AS minima
FROM

-- MinimaType
LEFT JOIN procedure.minima_pt
ON procedure.minima_pt.minima_id = MinimaType.id
-- AbstractExtensionType
LEFT JOIN procedure.minima
ON procedure.minima.abstractminimaextension_id = AbstractExtensionType.id

-- EquipmentUnavailableAdjustmentPropertyType
LEFT JOIN procedure.minima_adjustmentinop
ON procedure.minima.id = minima_adjustmentinop.minima_id
LEFT JOIN procedure.minima
ON minima_adjustmentinop.equipmentunavailableadjustment_pt_id = EquipmentUnavailableAdjustmentPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.minima_annotation
ON procedure.minima.id = minima_annotation.minima_id
LEFT JOIN procedure.minima
ON minima_annotation.note_pt_id = NotePropertyType.id
;

MissedApproachGroup
CREATE OR REPLACE VIEW missedapproachgroup_view AS
SELECT
    jsonb_build_object(
       'id', procedure.missedapproachgroup_pt.id,
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
    ) AS missedapproachgroup
FROM

-- MissedApproachGroupType
LEFT JOIN procedure.missedapproachgroup_pt
ON procedure.missedapproachgroup_pt.missedapproachgroup_id = MissedApproachGroupType.id
-- AbstractExtensionType
LEFT JOIN procedure.missedapproachgroup
ON procedure.missedapproachgroup.abstractmissedapproachgroupextension_id = AbstractExtensionType.id

-- AltimeterSourcePropertyType
LEFT JOIN procedure.missedapproachgroup_altimeter
ON procedure.missedapproachgroup.id = missedapproachgroup_altimeter.missedapproachgroup_id
LEFT JOIN procedure.missedapproachgroup
ON missedapproachgroup_altimeter.altimetersource_pt_id = AltimeterSourcePropertyType.id
-- NotePropertyType
LEFT JOIN procedure.missedapproachgroup_annotation
ON procedure.missedapproachgroup.id = missedapproachgroup_annotation.missedapproachgroup_id
LEFT JOIN procedure.missedapproachgroup
ON missedapproachgroup_annotation.note_pt_id = NotePropertyType.id
;

MissedApproachLeg
CREATE OR REPLACE VIEW missedapproachleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.missedapproachleg_pt.id,
       'nilReason', procedure.missedapproachleg_pt.nilReason,
       'href', procedure.missedapproachleg_pt.href,
       'id', procedure.missedapproachleg_tsp.id,
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
       'feature_lifetime_end', procedure.missedapproachleg_ts.feature_lifetime_end,
       'id', procedure.missedapproachleg.id,
       'identifier', procedure.missedapproachleg.identifier,
       'identifier_code_space', procedure.missedapproachleg.identifier_code_space,
       'xml_id', procedure.missedapproachleg.xml_id
    ) AS missedapproachleg
FROM

-- MissedApproachLegTimeSliceType
LEFT JOIN procedure.missedapproachleg_tsp
ON procedure.missedapproachleg_tsp.missedapproachlegtimeslice_id = MissedApproachLegTimeSliceType.id
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
LEFT JOIN procedure.missedapproachleg_ts_aircraftcategory
ON procedure.missedapproachleg_ts.id = missedapproachleg_ts_aircraftcategory.missedapproachleg_ts_id
LEFT JOIN procedure.missedapproachleg_ts
ON missedapproachleg_ts_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstacleAssessmentAreaPropertyType
LEFT JOIN procedure.missedapproachleg_ts_designsurface
ON procedure.missedapproachleg_ts.id = missedapproachleg_ts_designsurface.missedapproachleg_ts_id
LEFT JOIN procedure.missedapproachleg_ts
ON missedapproachleg_ts_designsurface.obstacleassessmentarea_pt_id = ObstacleAssessmentAreaPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.missedapproachleg_ts_annotation
ON procedure.missedapproachleg_ts.id = missedapproachleg_ts_annotation.missedapproachleg_ts_id
LEFT JOIN procedure.missedapproachleg_ts
ON missedapproachleg_ts_annotation.note_pt_id = NotePropertyType.id
-- ApproachConditionPropertyType
LEFT JOIN procedure.missedapproachleg_ts_condition
ON procedure.missedapproachleg_ts.id = missedapproachleg_ts_condition.missedapproachleg_ts_id
LEFT JOIN procedure.missedapproachleg_ts
ON missedapproachleg_ts_condition.approachcondition_pt_id = ApproachConditionPropertyType.id
-- MissedApproachLegTimeSlicePropertyType
LEFT JOIN procedure.missedapproachleg_timeslice
ON procedure.missedapproachleg.id = missedapproachleg_timeslice.missedapproachleg_id
LEFT JOIN procedure.missedapproachleg
ON missedapproachleg_timeslice.missedapproachleg_tsp_id = MissedApproachLegTimeSlicePropertyType.id
;

NavaidComponent
CREATE OR REPLACE VIEW navaidcomponent_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidcomponent_pt.id,
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
    ) AS navaidcomponent
FROM

-- NavaidComponentType
LEFT JOIN navaids_points.navaidcomponent_pt
ON navaids_points.navaidcomponent_pt.navaidcomponent_id = NavaidComponentType.id
-- NavaidEquipmentPropertyType
LEFT JOIN navaids_points.navaidcomponent
ON navaids_points.navaidcomponent.thenavaidequipment_id = NavaidEquipmentPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidcomponent
ON navaids_points.navaidcomponent.abstractnavaidcomponentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.navaidcomponent_annotation
ON navaids_points.navaidcomponent.id = navaidcomponent_annotation.navaidcomponent_id
LEFT JOIN navaids_points.navaidcomponent
ON navaidcomponent_annotation.note_pt_id = NotePropertyType.id
;

NavaidEquipmentDistance
CREATE OR REPLACE VIEW navaidequipmentdistance_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.navaidequipmentdistance_pt.id,
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
    ) AS navaidequipmentdistance
FROM

-- NavaidEquipmentDistanceType
LEFT JOIN airport_heliport.navaidequipmentdistance_pt
ON airport_heliport.navaidequipmentdistance_pt.navaidequipmentdistance_id = NavaidEquipmentDistanceType.id
-- NavaidEquipmentPropertyType
LEFT JOIN airport_heliport.navaidequipmentdistance
ON airport_heliport.navaidequipmentdistance.thenavaidequipment_id = NavaidEquipmentPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.navaidequipmentdistance
ON airport_heliport.navaidequipmentdistance.abstractnavaidequipmentdistanceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.navaidequipmentdistance_annotation
ON airport_heliport.navaidequipmentdistance.id = navaidequipmentdistance_annotation.navaidequipmentdistance_id
LEFT JOIN airport_heliport.navaidequipmentdistance
ON navaidequipmentdistance_annotation.note_pt_id = NotePropertyType.id
;

NavaidEquipmentMonitoring
CREATE OR REPLACE VIEW navaidequipmentmonitoring_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidequipmentmonitoring_pt.id,
       'monitored_value', navaids_points.navaidequipmentmonitoring.monitored_value,
       'monitored_nilreason', navaids_points.navaidequipmentmonitoring.monitored_nilreason,
       'id', navaids_points.navaidequipmentmonitoring.id,
       'identifier', navaids_points.navaidequipmentmonitoring.identifier,
       'identifier_code_space', navaids_points.navaidequipmentmonitoring.identifier_code_space,
       'xml_id', navaids_points.navaidequipmentmonitoring.xml_id
    ) AS navaidequipmentmonitoring
FROM

-- NavaidEquipmentMonitoringType
LEFT JOIN navaids_points.navaidequipmentmonitoring_pt
ON navaids_points.navaidequipmentmonitoring_pt.navaidequipmentmonitoring_id = NavaidEquipmentMonitoringType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON navaids_points.navaidequipmentmonitoring.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON navaids_points.navaidequipmentmonitoring.abstractnavaidequipmentmonitoringextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN navaids_points.navaidequipmentmonitoring_timeinterval
ON navaids_points.navaidequipmentmonitoring.id = navaidequipmentmonitoring_timeinterval.navaidequipmentmonitoring_id
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON navaidequipmentmonitoring_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.navaidequipmentmonitoring_annotation
ON navaids_points.navaidequipmentmonitoring.id = navaidequipmentmonitoring_annotation.navaidequipmentmonitoring_id
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON navaidequipmentmonitoring_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.navaidequipmentmonitoring_specialdateauthority
ON navaids_points.navaidequipmentmonitoring.id = navaidequipmentmonitoring_specialdateauthority.navaidequipmentmonitoring_id
LEFT JOIN navaids_points.navaidequipmentmonitoring
ON navaidequipmentmonitoring_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

NavaidEquipment
CREATE OR REPLACE VIEW navaidequipment_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidequipment_pt.id,
       'nilReason', navaids_points.navaidequipment_pt.nilReason,
       'href', navaids_points.navaidequipment_pt.href
    ) AS navaidequipment
FROM


;

NavaidOperationalStatus
CREATE OR REPLACE VIEW navaidoperationalstatus_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaidoperationalstatus_pt.id,
       'operationalstatus_value', navaids_points.navaidoperationalstatus.operationalstatus_value,
       'operationalstatus_nilreason', navaids_points.navaidoperationalstatus.operationalstatus_nilreason,
       'signaltype_value', navaids_points.navaidoperationalstatus.signaltype_value,
       'signaltype_nilreason', navaids_points.navaidoperationalstatus.signaltype_nilreason,
       'id', navaids_points.navaidoperationalstatus.id,
       'identifier', navaids_points.navaidoperationalstatus.identifier,
       'identifier_code_space', navaids_points.navaidoperationalstatus.identifier_code_space,
       'xml_id', navaids_points.navaidoperationalstatus.xml_id
    ) AS navaidoperationalstatus
FROM

-- NavaidOperationalStatusType
LEFT JOIN navaids_points.navaidoperationalstatus_pt
ON navaids_points.navaidoperationalstatus_pt.navaidoperationalstatus_id = NavaidOperationalStatusType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidoperationalstatus
ON navaids_points.navaidoperationalstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaidoperationalstatus
ON navaids_points.navaidoperationalstatus.abstractnavaidoperationalstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN navaids_points.navaidoperationalstatus_timeinterval
ON navaids_points.navaidoperationalstatus.id = navaidoperationalstatus_timeinterval.navaidoperationalstatus_id
LEFT JOIN navaids_points.navaidoperationalstatus
ON navaidoperationalstatus_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.navaidoperationalstatus_annotation
ON navaids_points.navaidoperationalstatus.id = navaidoperationalstatus_annotation.navaidoperationalstatus_id
LEFT JOIN navaids_points.navaidoperationalstatus
ON navaidoperationalstatus_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.navaidoperationalstatus_specialdateauthority
ON navaids_points.navaidoperationalstatus.id = navaidoperationalstatus_specialdateauthority.navaidoperationalstatus_id
LEFT JOIN navaids_points.navaidoperationalstatus
ON navaidoperationalstatus_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

Navaid
CREATE OR REPLACE VIEW navaid_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navaid_pt.id,
       'nilReason', navaids_points.navaid_pt.nilReason,
       'href', navaids_points.navaid_pt.href,
       'id', navaids_points.navaid_tsp.id,
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
       'feature_lifetime_end', navaids_points.navaid_ts.feature_lifetime_end,
       'id', navaids_points.navaid.id,
       'identifier', navaids_points.navaid.identifier,
       'identifier_code_space', navaids_points.navaid.identifier_code_space,
       'xml_id', navaids_points.navaid.xml_id
    ) AS navaid
FROM

-- NavaidTimeSliceType
LEFT JOIN navaids_points.navaid_tsp
ON navaids_points.navaid_tsp.navaidtimeslice_id = NavaidTimeSliceType.id
-- ElevatedPointPropertyType
LEFT JOIN navaids_points.navaid_ts
ON navaids_points.navaid_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.navaid_ts
ON navaids_points.navaid_ts.abstractnavaidextension_id = AbstractExtensionType.id

-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.navaid_ts_touchdownliftoff
ON navaids_points.navaid_ts.id = navaid_ts_touchdownliftoff.navaid_ts_id
LEFT JOIN navaids_points.navaid_ts
ON navaid_ts_touchdownliftoff.touchdownliftoff_pt_id = TouchDownLiftOffPropertyType.id
-- NavaidComponentPropertyType
LEFT JOIN navaids_points.navaid_ts_navaidequipment
ON navaids_points.navaid_ts.id = navaid_ts_navaidequipment.navaid_ts_id
LEFT JOIN navaids_points.navaid_ts
ON navaid_ts_navaidequipment.navaidcomponent_pt_id = NavaidComponentPropertyType.id
-- RunwayDirectionPropertyType
LEFT JOIN navaids_points.navaid_ts_runwaydirection
ON navaids_points.navaid_ts.id = navaid_ts_runwaydirection.navaid_ts_id
LEFT JOIN navaids_points.navaid_ts
ON navaid_ts_runwaydirection.runwaydirection_pt_id = RunwayDirectionPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.navaid_ts_servedairport
ON navaids_points.navaid_ts.id = navaid_ts_servedairport.navaid_ts_id
LEFT JOIN navaids_points.navaid_ts
ON navaid_ts_servedairport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.navaid_ts_availability
ON navaids_points.navaid_ts.id = navaid_ts_availability.navaid_ts_id
LEFT JOIN navaids_points.navaid_ts
ON navaid_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.navaid_ts_annotation
ON navaids_points.navaid_ts.id = navaid_ts_annotation.navaid_ts_id
LEFT JOIN navaids_points.navaid_ts
ON navaid_ts_annotation.note_pt_id = NotePropertyType.id
-- NavaidTimeSlicePropertyType
LEFT JOIN navaids_points.navaid_timeslice
ON navaids_points.navaid.id = navaid_timeslice.navaid_id
LEFT JOIN navaids_points.navaid
ON navaid_timeslice.navaid_tsp_id = NavaidTimeSlicePropertyType.id
;

NavigationArea
CREATE OR REPLACE VIEW navigationarea_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarea_pt.id,
       'nilReason', procedure.navigationarea_pt.nilReason,
       'href', procedure.navigationarea_pt.href,
       'id', procedure.navigationarea_tsp.id,
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
       'feature_lifetime_end', procedure.navigationarea_ts.feature_lifetime_end,
       'id', procedure.navigationarea.id,
       'identifier', procedure.navigationarea.identifier,
       'identifier_code_space', procedure.navigationarea.identifier_code_space,
       'xml_id', procedure.navigationarea.xml_id
    ) AS navigationarea
FROM

-- NavigationAreaTimeSliceType
LEFT JOIN procedure.navigationarea_tsp
ON procedure.navigationarea_tsp.navigationareatimeslice_id = NavigationAreaTimeSliceType.id
-- StandardInstrumentDeparturePropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.departure_id = StandardInstrumentDeparturePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.centrepoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.navigationarea_ts
ON procedure.navigationarea_ts.abstractnavigationareaextension_id = AbstractExtensionType.id

-- NavigationAreaSectorPropertyType
LEFT JOIN procedure.navigationarea_ts_sector
ON procedure.navigationarea_ts.id = navigationarea_ts_sector.navigationarea_ts_id
LEFT JOIN procedure.navigationarea_ts
ON navigationarea_ts_sector.navigationareasector_pt_id = NavigationAreaSectorPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.navigationarea_ts_annotation
ON procedure.navigationarea_ts.id = navigationarea_ts_annotation.navigationarea_ts_id
LEFT JOIN procedure.navigationarea_ts
ON navigationarea_ts_annotation.note_pt_id = NotePropertyType.id
-- NavigationAreaTimeSlicePropertyType
LEFT JOIN procedure.navigationarea_timeslice
ON procedure.navigationarea.id = navigationarea_timeslice.navigationarea_id
LEFT JOIN procedure.navigationarea
ON navigationarea_timeslice.navigationarea_tsp_id = NavigationAreaTimeSlicePropertyType.id
;

NavigationAreaRestriction
CREATE OR REPLACE VIEW navigationarearestriction_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationarearestriction_pt.id,
       'nilReason', procedure.navigationarearestriction_pt.nilReason,
       'href', procedure.navigationarearestriction_pt.href,
       'id', procedure.navigationarearestriction_tsp.id,
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
       'feature_lifetime_end', procedure.navigationarearestriction_ts.feature_lifetime_end,
       'id', procedure.navigationarearestriction.id,
       'identifier', procedure.navigationarearestriction.identifier,
       'identifier_code_space', procedure.navigationarearestriction.identifier_code_space,
       'xml_id', procedure.navigationarearestriction.xml_id
    ) AS navigationarearestriction
FROM

-- NavigationAreaRestrictionTimeSliceType
LEFT JOIN procedure.navigationarearestriction_tsp
ON procedure.navigationarearestriction_tsp.navigationarearestrictiontimeslice_id = NavigationAreaRestrictionTimeSliceType.id
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
LEFT JOIN procedure.navigationarearestriction_ts_procedure
ON procedure.navigationarearestriction_ts.id = navigationarearestriction_ts_procedure.navigationarearestriction_ts_id
LEFT JOIN procedure.navigationarearestriction_ts
ON navigationarearestriction_ts_procedure.procedure_pt_id = ProcedurePropertyType.id
-- NotePropertyType
LEFT JOIN procedure.navigationarearestriction_ts_annotation
ON procedure.navigationarearestriction_ts.id = navigationarearestriction_ts_annotation.navigationarearestriction_ts_id
LEFT JOIN procedure.navigationarearestriction_ts
ON navigationarearestriction_ts_annotation.note_pt_id = NotePropertyType.id
-- NavigationAreaRestrictionTimeSlicePropertyType
LEFT JOIN procedure.navigationarearestriction_timeslice
ON procedure.navigationarearestriction.id = navigationarearestriction_timeslice.navigationarearestriction_id
LEFT JOIN procedure.navigationarearestriction
ON navigationarearestriction_timeslice.navigationarearestriction_tsp_id = NavigationAreaRestrictionTimeSlicePropertyType.id
;

NavigationAreaSector
CREATE OR REPLACE VIEW navigationareasector_view AS
SELECT
    jsonb_build_object(
       'id', procedure.navigationareasector_pt.id,
       'id', procedure.navigationareasector.id,
       'identifier', procedure.navigationareasector.identifier,
       'identifier_code_space', procedure.navigationareasector.identifier_code_space,
       'xml_id', procedure.navigationareasector.xml_id
    ) AS navigationareasector
FROM

-- NavigationAreaSectorType
LEFT JOIN procedure.navigationareasector_pt
ON procedure.navigationareasector_pt.navigationareasector_id = NavigationAreaSectorType.id
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
LEFT JOIN procedure.navigationareasector_significantobstacle
ON procedure.navigationareasector.id = navigationareasector_significantobstacle.navigationareasector_id
LEFT JOIN procedure.navigationareasector
ON navigationareasector_significantobstacle.obstruction_pt_id = ObstructionPropertyType.id
-- SectorDesignPropertyType
LEFT JOIN procedure.navigationareasector_sectorcriteria
ON procedure.navigationareasector.id = navigationareasector_sectorcriteria.navigationareasector_id
LEFT JOIN procedure.navigationareasector
ON navigationareasector_sectorcriteria.sectordesign_pt_id = SectorDesignPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.navigationareasector_annotation
ON procedure.navigationareasector.id = navigationareasector_annotation.navigationareasector_id
LEFT JOIN procedure.navigationareasector
ON navigationareasector_annotation.note_pt_id = NotePropertyType.id
;

NavigationSystemCheckpoint
CREATE OR REPLACE VIEW navigationsystemcheckpoint_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.navigationsystemcheckpoint_pt.id,
       'nilReason', navaids_points.navigationsystemcheckpoint_pt.nilReason,
       'href', navaids_points.navigationsystemcheckpoint_pt.href
    ) AS navigationsystemcheckpoint
FROM


;

NDB
CREATE OR REPLACE VIEW ndb_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.ndb_pt.id,
       'nilReason', navaids_points.ndb_pt.nilReason,
       'href', navaids_points.ndb_pt.href,
       'id', navaids_points.ndb_tsp.id,
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
       'feature_lifetime_end', navaids_points.ndb_ts.feature_lifetime_end,
       'id', navaids_points.ndb.id,
       'identifier', navaids_points.ndb.identifier,
       'identifier_code_space', navaids_points.ndb.identifier_code_space,
       'xml_id', navaids_points.ndb.xml_id
    ) AS ndb
FROM

-- NDBTimeSliceType
LEFT JOIN navaids_points.ndb_tsp
ON navaids_points.ndb_tsp.ndbtimeslice_id = NDBTimeSliceType.id
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
LEFT JOIN navaids_points.ndb_ts_authority
ON navaids_points.ndb_ts.id = ndb_ts_authority.ndb_ts_id
LEFT JOIN navaids_points.ndb_ts
ON ndb_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.ndb_ts_monitoring
ON navaids_points.ndb_ts.id = ndb_ts_monitoring.ndb_ts_id
LEFT JOIN navaids_points.ndb_ts
ON ndb_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.ndb_ts_availability
ON navaids_points.ndb_ts.id = ndb_ts_availability.ndb_ts_id
LEFT JOIN navaids_points.ndb_ts
ON ndb_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.ndb_ts_annotation
ON navaids_points.ndb_ts.id = ndb_ts_annotation.ndb_ts_id
LEFT JOIN navaids_points.ndb_ts
ON ndb_ts_annotation.note_pt_id = NotePropertyType.id
-- NDBTimeSlicePropertyType
LEFT JOIN navaids_points.ndb_timeslice
ON navaids_points.ndb.id = ndb_timeslice.ndb_id
LEFT JOIN navaids_points.ndb
ON ndb_timeslice.ndb_tsp_id = NDBTimeSlicePropertyType.id
;

Nitrogen
CREATE OR REPLACE VIEW nitrogen_view AS
SELECT
    jsonb_build_object(
       'id', service.nitrogen_pt.id,
       'type_value', service.nitrogen.type_value,
       'type_nilreason', service.nitrogen.type_nilreason,
       'id', service.nitrogen.id,
       'identifier', service.nitrogen.identifier,
       'identifier_code_space', service.nitrogen.identifier_code_space,
       'xml_id', service.nitrogen.xml_id
    ) AS nitrogen
FROM

-- NitrogenType
LEFT JOIN service.nitrogen_pt
ON service.nitrogen_pt.nitrogen_id = NitrogenType.id
-- AbstractExtensionType
LEFT JOIN service.nitrogen
ON service.nitrogen.abstractnitrogenextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.nitrogen_annotation
ON service.nitrogen.id = nitrogen_annotation.nitrogen_id
LEFT JOIN service.nitrogen
ON nitrogen_annotation.note_pt_id = NotePropertyType.id
;

NonMovementArea
CREATE OR REPLACE VIEW nonmovementarea_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.nonmovementarea_pt.id,
       'nilReason', airport_heliport.nonmovementarea_pt.nilReason,
       'href', airport_heliport.nonmovementarea_pt.href,
       'id', airport_heliport.nonmovementarea_tsp.id,
       'id', airport_heliport.nonmovementarea_ts.id,
       'xml_id', airport_heliport.nonmovementarea_ts.xml_id,
       'interpretation', airport_heliport.nonmovementarea_ts.interpretation,
       'sequence_number', airport_heliport.nonmovementarea_ts.sequence_number,
       'correction_number', airport_heliport.nonmovementarea_ts.correction_number,
       'valid_time_begin', airport_heliport.nonmovementarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.nonmovementarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.nonmovementarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.nonmovementarea_ts.feature_lifetime_end,
       'id', airport_heliport.nonmovementarea.id,
       'identifier', airport_heliport.nonmovementarea.identifier,
       'identifier_code_space', airport_heliport.nonmovementarea.identifier_code_space,
       'xml_id', airport_heliport.nonmovementarea.xml_id
    ) AS nonmovementarea
FROM

-- NonMovementAreaTimeSliceType
LEFT JOIN airport_heliport.nonmovementarea_tsp
ON airport_heliport.nonmovementarea_tsp.nonmovementareatimeslice_id = NonMovementAreaTimeSliceType.id
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
LEFT JOIN airport_heliport.nonmovementarea_ts_annotation
ON airport_heliport.nonmovementarea_ts.id = nonmovementarea_ts_annotation.nonmovementarea_ts_id
LEFT JOIN airport_heliport.nonmovementarea_ts
ON nonmovementarea_ts_annotation.note_pt_id = NotePropertyType.id
-- NonMovementAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.nonmovementarea_timeslice
ON airport_heliport.nonmovementarea.id = nonmovementarea_timeslice.nonmovementarea_id
LEFT JOIN airport_heliport.nonmovementarea
ON nonmovementarea_timeslice.nonmovementarea_tsp_id = NonMovementAreaTimeSlicePropertyType.id
;

Note
CREATE OR REPLACE VIEW note_view AS
SELECT
    jsonb_build_object(
       'id', notes.note_pt.id,
       'propertyname_value', notes.note.propertyname_value,
       'propertyname_nilreason', notes.note.propertyname_nilreason,
       'purpose_value', notes.note.purpose_value,
       'purpose_nilreason', notes.note.purpose_nilreason,
       'id', notes.note.id,
       'identifier', notes.note.identifier,
       'identifier_code_space', notes.note.identifier_code_space,
       'xml_id', notes.note.xml_id
    ) AS note
FROM

-- NoteType
LEFT JOIN notes.note_pt
ON notes.note_pt.note_id = NoteType.id
-- AbstractExtensionType
LEFT JOIN notes.note
ON notes.note.abstractnoteextension_id = AbstractExtensionType.id

-- LinguisticNotePropertyType
LEFT JOIN notes.note_translatednote
ON notes.note.id = note_translatednote.note_id
LEFT JOIN notes.note
ON note_translatednote.linguisticnote_pt_id = LinguisticNotePropertyType.id
;

ObstacleArea
CREATE OR REPLACE VIEW obstaclearea_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.obstaclearea_pt.id,
       'nilReason', obstacles.obstaclearea_pt.nilReason,
       'href', obstacles.obstaclearea_pt.href,
       'id', obstacles.obstaclearea_tsp.id,
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
       'feature_lifetime_end', obstacles.obstaclearea_ts.feature_lifetime_end,
       'id', obstacles.obstaclearea.id,
       'identifier', obstacles.obstaclearea.identifier,
       'identifier_code_space', obstacles.obstaclearea.identifier_code_space,
       'xml_id', obstacles.obstaclearea.xml_id
    ) AS obstaclearea
FROM

-- ObstacleAreaTimeSliceType
LEFT JOIN obstacles.obstaclearea_tsp
ON obstacles.obstaclearea_tsp.obstacleareatimeslice_id = ObstacleAreaTimeSliceType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.reference_ownerorganisation_id = OrganisationAuthorityPropertyType.id
-- RunwayDirectionPropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.reference_ownerrunway_id = RunwayDirectionPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.reference_ownerairport_id = AirportHeliportPropertyType.id
-- SurfacePropertyType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.surfaceextent_id = SurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN obstacles.obstaclearea_ts
ON obstacles.obstaclearea_ts.abstractobstacleareaextension_id = AbstractExtensionType.id

-- VerticalStructurePropertyType
LEFT JOIN obstacles.obstaclearea_ts_obstacle
ON obstacles.obstaclearea_ts.id = obstaclearea_ts_obstacle.obstaclearea_ts_id
LEFT JOIN obstacles.obstaclearea_ts
ON obstaclearea_ts_obstacle.verticalstructure_pt_id = VerticalStructurePropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.obstaclearea_ts_annotation
ON obstacles.obstaclearea_ts.id = obstaclearea_ts_annotation.obstaclearea_ts_id
LEFT JOIN obstacles.obstaclearea_ts
ON obstaclearea_ts_annotation.note_pt_id = NotePropertyType.id
-- ObstacleAreaTimeSlicePropertyType
LEFT JOIN obstacles.obstaclearea_timeslice
ON obstacles.obstaclearea.id = obstaclearea_timeslice.obstaclearea_id
LEFT JOIN obstacles.obstaclearea
ON obstaclearea_timeslice.obstaclearea_tsp_id = ObstacleAreaTimeSlicePropertyType.id
;

ObstacleAssessmentArea
CREATE OR REPLACE VIEW obstacleassessmentarea_view AS
SELECT
    jsonb_build_object(
       'id', shared.obstacleassessmentarea_pt.id,
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
    ) AS obstacleassessmentarea
FROM

-- ObstacleAssessmentAreaType
LEFT JOIN shared.obstacleassessmentarea_pt
ON shared.obstacleassessmentarea_pt.obstacleassessmentarea_id = ObstacleAssessmentAreaType.id
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
LEFT JOIN shared.obstacleassessmentarea_aircraftcategory
ON shared.obstacleassessmentarea.id = obstacleassessmentarea_aircraftcategory.obstacleassessmentarea_id
LEFT JOIN shared.obstacleassessmentarea
ON obstacleassessmentarea_aircraftcategory.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ObstructionPropertyType
LEFT JOIN shared.obstacleassessmentarea_significantobstacle
ON shared.obstacleassessmentarea.id = obstacleassessmentarea_significantobstacle.obstacleassessmentarea_id
LEFT JOIN shared.obstacleassessmentarea
ON obstacleassessmentarea_significantobstacle.obstruction_pt_id = ObstructionPropertyType.id
-- NotePropertyType
LEFT JOIN shared.obstacleassessmentarea_annotation
ON shared.obstacleassessmentarea.id = obstacleassessmentarea_annotation.obstacleassessmentarea_id
LEFT JOIN shared.obstacleassessmentarea
ON obstacleassessmentarea_annotation.note_pt_id = NotePropertyType.id
;

ObstaclePlacement
CREATE OR REPLACE VIEW obstacleplacement_view AS
SELECT
    jsonb_build_object(
       'id', shared.obstacleplacement_pt.id,
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
    ) AS obstacleplacement
FROM

-- ObstaclePlacementType
LEFT JOIN shared.obstacleplacement_pt
ON shared.obstacleplacement_pt.obstacleplacement_id = ObstaclePlacementType.id
-- AbstractExtensionType
LEFT JOIN shared.obstacleplacement
ON shared.obstacleplacement.abstractobstacleplacementextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.obstacleplacement_annotation
ON shared.obstacleplacement.id = obstacleplacement_annotation.obstacleplacement_id
LEFT JOIN shared.obstacleplacement
ON obstacleplacement_annotation.note_pt_id = NotePropertyType.id
;

Obstruction
CREATE OR REPLACE VIEW obstruction_view AS
SELECT
    jsonb_build_object(
       'id', shared.obstruction_pt.id,
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
    ) AS obstruction
FROM

-- ObstructionType
LEFT JOIN shared.obstruction_pt
ON shared.obstruction_pt.obstruction_id = ObstructionType.id
-- VerticalStructurePropertyType
LEFT JOIN shared.obstruction
ON shared.obstruction.theverticalstructure_id = VerticalStructurePropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.obstruction
ON shared.obstruction.abstractobstructionextension_id = AbstractExtensionType.id

-- AltitudeAdjustmentPropertyType
LEFT JOIN shared.obstruction_adjustment
ON shared.obstruction.id = obstruction_adjustment.obstruction_id
LEFT JOIN shared.obstruction
ON obstruction_adjustment.altitudeadjustment_pt_id = AltitudeAdjustmentPropertyType.id
-- ObstaclePlacementPropertyType
LEFT JOIN shared.obstruction_obstacleplacement
ON shared.obstruction.id = obstruction_obstacleplacement.obstruction_id
LEFT JOIN shared.obstruction
ON obstruction_obstacleplacement.obstacleplacement_pt_id = ObstaclePlacementPropertyType.id
-- NotePropertyType
LEFT JOIN shared.obstruction_annotation
ON shared.obstruction.id = obstruction_annotation.obstruction_id
LEFT JOIN shared.obstruction
ON obstruction_annotation.note_pt_id = NotePropertyType.id
;

Oil
CREATE OR REPLACE VIEW oil_view AS
SELECT
    jsonb_build_object(
       'id', service.oil_pt.id,
       'category_value', service.oil.category_value,
       'category_nilreason', service.oil.category_nilreason,
       'id', service.oil.id,
       'identifier', service.oil.identifier,
       'identifier_code_space', service.oil.identifier_code_space,
       'xml_id', service.oil.xml_id
    ) AS oil
FROM

-- OilType
LEFT JOIN service.oil_pt
ON service.oil_pt.oil_id = OilType.id
-- AbstractExtensionType
LEFT JOIN service.oil
ON service.oil.abstractoilextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.oil_annotation
ON service.oil.id = oil_annotation.oil_id
LEFT JOIN service.oil
ON oil_annotation.note_pt_id = NotePropertyType.id
;

OnlineContact
CREATE OR REPLACE VIEW onlinecontact_view AS
SELECT
    jsonb_build_object(
       'id', shared.onlinecontact_pt.id,
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
    ) AS onlinecontact
FROM

-- OnlineContactType
LEFT JOIN shared.onlinecontact_pt
ON shared.onlinecontact_pt.onlinecontact_id = OnlineContactType.id
-- AbstractExtensionType
LEFT JOIN shared.onlinecontact
ON shared.onlinecontact.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.onlinecontact
ON shared.onlinecontact.abstractonlinecontactextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.onlinecontact_timeinterval
ON shared.onlinecontact.id = onlinecontact_timeinterval.onlinecontact_id
LEFT JOIN shared.onlinecontact
ON onlinecontact_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.onlinecontact_annotation
ON shared.onlinecontact.id = onlinecontact_annotation.onlinecontact_id
LEFT JOIN shared.onlinecontact
ON onlinecontact_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.onlinecontact_specialdateauthority
ON shared.onlinecontact.id = onlinecontact_specialdateauthority.onlinecontact_id
LEFT JOIN shared.onlinecontact
ON onlinecontact_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

OrganisationAuthorityAssociation
CREATE OR REPLACE VIEW organisationauthorityassociation_view AS
SELECT
    jsonb_build_object(
       'id', organisation.organisationauthorityassociation_pt.id,
       'type_value', organisation.organisationauthorityassociation.type_value,
       'type_nilreason', organisation.organisationauthorityassociation.type_nilreason,
       'id', organisation.organisationauthorityassociation.id,
       'identifier', organisation.organisationauthorityassociation.identifier,
       'identifier_code_space', organisation.organisationauthorityassociation.identifier_code_space,
       'xml_id', organisation.organisationauthorityassociation.xml_id
    ) AS organisationauthorityassociation
FROM

-- OrganisationAuthorityAssociationType
LEFT JOIN organisation.organisationauthorityassociation_pt
ON organisation.organisationauthorityassociation_pt.organisationauthorityassociation_id = OrganisationAuthorityAssociationType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN organisation.organisationauthorityassociation
ON organisation.organisationauthorityassociation.theorganisationauthority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN organisation.organisationauthorityassociation
ON organisation.organisationauthorityassociation.abstractorganisationauthorityassociationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN organisation.organisationauthorityassociation_annotation
ON organisation.organisationauthorityassociation.id = organisationauthorityassociation_annotation.organisationauthorityassociation_id
LEFT JOIN organisation.organisationauthorityassociation
ON organisationauthorityassociation_annotation.note_pt_id = NotePropertyType.id
;

OrganisationAuthority
CREATE OR REPLACE VIEW organisationauthority_view AS
SELECT
    jsonb_build_object(
       'id', organisation.organisationauthority_pt.id,
       'nilReason', organisation.organisationauthority_pt.nilReason,
       'href', organisation.organisationauthority_pt.href,
       'id', organisation.organisationauthority_tsp.id,
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
       'feature_lifetime_end', organisation.organisationauthority_ts.feature_lifetime_end,
       'id', organisation.organisationauthority.id,
       'identifier', organisation.organisationauthority.identifier,
       'identifier_code_space', organisation.organisationauthority.identifier_code_space,
       'xml_id', organisation.organisationauthority.xml_id
    ) AS organisationauthority
FROM

-- OrganisationAuthorityTimeSliceType
LEFT JOIN organisation.organisationauthority_tsp
ON organisation.organisationauthority_tsp.organisationauthoritytimeslice_id = OrganisationAuthorityTimeSliceType.id
-- AbstractExtensionType
LEFT JOIN organisation.organisationauthority_ts
ON organisation.organisationauthority_ts.abstractorganisationauthorityextension_id = AbstractExtensionType.id

-- ContactInformationPropertyType
LEFT JOIN organisation.organisationauthority_ts_contact
ON organisation.organisationauthority_ts.id = organisationauthority_ts_contact.organisationauthority_ts_id
LEFT JOIN organisation.organisationauthority_ts
ON organisationauthority_ts_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- OrganisationAuthorityAssociationPropertyType
LEFT JOIN organisation.organisationauthority_ts_relatedorganisationauthority
ON organisation.organisationauthority_ts.id = organisationauthority_ts_relatedorganisationauthority.organisationauthority_ts_id
LEFT JOIN organisation.organisationauthority_ts
ON organisationauthority_ts_relatedorganisationauthority.organisationauthorityassociation_pt_id = OrganisationAuthorityAssociationPropertyType.id
-- NotePropertyType
LEFT JOIN organisation.organisationauthority_ts_annotation
ON organisation.organisationauthority_ts.id = organisationauthority_ts_annotation.organisationauthority_ts_id
LEFT JOIN organisation.organisationauthority_ts
ON organisationauthority_ts_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityTimeSlicePropertyType
LEFT JOIN organisation.organisationauthority_timeslice
ON organisation.organisationauthority.id = organisationauthority_timeslice.organisationauthority_id
LEFT JOIN organisation.organisationauthority
ON organisationauthority_timeslice.organisationauthority_tsp_id = OrganisationAuthorityTimeSlicePropertyType.id
;

Oxygen
CREATE OR REPLACE VIEW oxygen_view AS
SELECT
    jsonb_build_object(
       'id', service.oxygen_pt.id,
       'type_value', service.oxygen.type_value,
       'type_nilreason', service.oxygen.type_nilreason,
       'id', service.oxygen.id,
       'identifier', service.oxygen.identifier,
       'identifier_code_space', service.oxygen.identifier_code_space,
       'xml_id', service.oxygen.xml_id
    ) AS oxygen
FROM

-- OxygenType
LEFT JOIN service.oxygen_pt
ON service.oxygen_pt.oxygen_id = OxygenType.id
-- AbstractExtensionType
LEFT JOIN service.oxygen
ON service.oxygen.abstractoxygenextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN service.oxygen_annotation
ON service.oxygen.id = oxygen_annotation.oxygen_id
LEFT JOIN service.oxygen
ON oxygen_annotation.note_pt_id = NotePropertyType.id
;

PassengerLoadingBridge
CREATE OR REPLACE VIEW passengerloadingbridge_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.passengerloadingbridge_pt.id,
       'nilReason', airport_heliport.passengerloadingbridge_pt.nilReason,
       'href', airport_heliport.passengerloadingbridge_pt.href,
       'id', airport_heliport.passengerloadingbridge_tsp.id,
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
       'feature_lifetime_end', airport_heliport.passengerloadingbridge_ts.feature_lifetime_end,
       'id', airport_heliport.passengerloadingbridge.id,
       'identifier', airport_heliport.passengerloadingbridge.identifier,
       'identifier_code_space', airport_heliport.passengerloadingbridge.identifier_code_space,
       'xml_id', airport_heliport.passengerloadingbridge.xml_id
    ) AS passengerloadingbridge
FROM

-- PassengerLoadingBridgeTimeSliceType
LEFT JOIN airport_heliport.passengerloadingbridge_tsp
ON airport_heliport.passengerloadingbridge_tsp.passengerloadingbridgetimeslice_id = PassengerLoadingBridgeTimeSliceType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON airport_heliport.passengerloadingbridge_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON airport_heliport.passengerloadingbridge_ts.abstractpassengerloadingbridgeextension_id = AbstractExtensionType.id

-- AircraftStandPropertyType
LEFT JOIN airport_heliport.passengerloadingbridge_ts_associatedstand
ON airport_heliport.passengerloadingbridge_ts.id = passengerloadingbridge_ts_associatedstand.passengerloadingbridge_ts_id
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON passengerloadingbridge_ts_associatedstand.aircraftstand_pt_id = AircraftStandPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.passengerloadingbridge_ts_annotation
ON airport_heliport.passengerloadingbridge_ts.id = passengerloadingbridge_ts_annotation.passengerloadingbridge_ts_id
LEFT JOIN airport_heliport.passengerloadingbridge_ts
ON passengerloadingbridge_ts_annotation.note_pt_id = NotePropertyType.id
-- PassengerLoadingBridgeTimeSlicePropertyType
LEFT JOIN airport_heliport.passengerloadingbridge_timeslice
ON airport_heliport.passengerloadingbridge.id = passengerloadingbridge_timeslice.passengerloadingbridge_id
LEFT JOIN airport_heliport.passengerloadingbridge
ON passengerloadingbridge_timeslice.passengerloadingbridge_tsp_id = PassengerLoadingBridgeTimeSlicePropertyType.id
;

PassengerService
CREATE OR REPLACE VIEW passengerservice_view AS
SELECT
    jsonb_build_object(
       'id', service.passengerservice_pt.id,
       'nilReason', service.passengerservice_pt.nilReason,
       'href', service.passengerservice_pt.href,
       'id', service.passengerservice_tsp.id,
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
       'feature_lifetime_end', service.passengerservice_ts.feature_lifetime_end,
       'id', service.passengerservice.id,
       'identifier', service.passengerservice.identifier,
       'identifier_code_space', service.passengerservice.identifier_code_space,
       'xml_id', service.passengerservice.xml_id
    ) AS passengerservice
FROM

-- PassengerServiceTimeSliceType
LEFT JOIN service.passengerservice_tsp
ON service.passengerservice_tsp.passengerservicetimeslice_id = PassengerServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.passengerservice_ts_radiocommunication
ON service.passengerservice_ts.id = passengerservice_ts_radiocommunication.passengerservice_ts_id
LEFT JOIN service.passengerservice_ts
ON passengerservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.passengerservice_ts_groundcommunication
ON service.passengerservice_ts.id = passengerservice_ts_groundcommunication.passengerservice_ts_id
LEFT JOIN service.passengerservice_ts
ON passengerservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.passengerservice_ts_availability
ON service.passengerservice_ts.id = passengerservice_ts_availability.passengerservice_ts_id
LEFT JOIN service.passengerservice_ts
ON passengerservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.passengerservice_ts_annotation
ON service.passengerservice_ts.id = passengerservice_ts_annotation.passengerservice_ts_id
LEFT JOIN service.passengerservice_ts
ON passengerservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN service.passengerservice_ts_airportheliport
ON service.passengerservice_ts.id = passengerservice_ts_airportheliport.passengerservice_ts_id
LEFT JOIN service.passengerservice_ts
ON passengerservice_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- PassengerServiceTimeSlicePropertyType
LEFT JOIN service.passengerservice_timeslice
ON service.passengerservice.id = passengerservice_timeslice.passengerservice_id
LEFT JOIN service.passengerservice
ON passengerservice_timeslice.passengerservice_tsp_id = PassengerServiceTimeSlicePropertyType.id
;

PilotControlledLighting
CREATE OR REPLACE VIEW pilotcontrolledlighting_view AS
SELECT
    jsonb_build_object(
       'id', service.pilotcontrolledlighting_pt.id,
       'nilReason', service.pilotcontrolledlighting_pt.nilReason,
       'href', service.pilotcontrolledlighting_pt.href,
       'id', service.pilotcontrolledlighting_tsp.id,
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
       'feature_lifetime_end', service.pilotcontrolledlighting_ts.feature_lifetime_end,
       'id', service.pilotcontrolledlighting.id,
       'identifier', service.pilotcontrolledlighting.identifier,
       'identifier_code_space', service.pilotcontrolledlighting.identifier_code_space,
       'xml_id', service.pilotcontrolledlighting.xml_id
    ) AS pilotcontrolledlighting
FROM

-- PilotControlledLightingTimeSliceType
LEFT JOIN service.pilotcontrolledlighting_tsp
ON service.pilotcontrolledlighting_tsp.pilotcontrolledlightingtimeslice_id = PilotControlledLightingTimeSliceType.id
-- AbstractExtensionType
LEFT JOIN service.pilotcontrolledlighting_ts
ON service.pilotcontrolledlighting_ts.abstractpilotcontrolledlightingextension_id = AbstractExtensionType.id

-- LightActivationPropertyType
LEFT JOIN service.pilotcontrolledlighting_ts_controlledlightintensity
ON service.pilotcontrolledlighting_ts.id = pilotcontrolledlighting_ts_controlledlightintensity.pilotcontrolledlighting_ts_id
LEFT JOIN service.pilotcontrolledlighting_ts
ON pilotcontrolledlighting_ts_controlledlightintensity.lightactivation_pt_id = LightActivationPropertyType.id
-- GroundLightSystemPropertyType
LEFT JOIN service.pilotcontrolledlighting_ts_activatedgroundlighting
ON service.pilotcontrolledlighting_ts.id = pilotcontrolledlighting_ts_activatedgroundlighting.pilotcontrolledlighting_ts_id
LEFT JOIN service.pilotcontrolledlighting_ts
ON pilotcontrolledlighting_ts_activatedgroundlighting.groundlightsystem_pt_id = GroundLightSystemPropertyType.id
-- NotePropertyType
LEFT JOIN service.pilotcontrolledlighting_ts_annotation
ON service.pilotcontrolledlighting_ts.id = pilotcontrolledlighting_ts_annotation.pilotcontrolledlighting_ts_id
LEFT JOIN service.pilotcontrolledlighting_ts
ON pilotcontrolledlighting_ts_annotation.note_pt_id = NotePropertyType.id
-- PilotControlledLightingTimeSlicePropertyType
LEFT JOIN service.pilotcontrolledlighting_timeslice
ON service.pilotcontrolledlighting.id = pilotcontrolledlighting_timeslice.pilotcontrolledlighting_id
LEFT JOIN service.pilotcontrolledlighting
ON pilotcontrolledlighting_timeslice.pilotcontrolledlighting_tsp_id = PilotControlledLightingTimeSlicePropertyType.id
;

PointReference
CREATE OR REPLACE VIEW pointreference_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.pointreference_pt.id,
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
    ) AS pointreference
FROM

-- PointReferenceType
LEFT JOIN navaids_points.pointreference_pt
ON navaids_points.pointreference_pt.pointreference_id = PointReferenceType.id
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
LEFT JOIN navaids_points.pointreference_facilityangle
ON navaids_points.pointreference.id = pointreference_facilityangle.pointreference_id
LEFT JOIN navaids_points.pointreference
ON pointreference_facilityangle.angleuse_pt_id = AngleUsePropertyType.id
-- DistanceIndicationPropertyType
LEFT JOIN navaids_points.pointreference_facilitydistance
ON navaids_points.pointreference.id = pointreference_facilitydistance.pointreference_id
LEFT JOIN navaids_points.pointreference
ON pointreference_facilitydistance.distanceindication_pt_id = DistanceIndicationPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.pointreference_annotation
ON navaids_points.pointreference.id = pointreference_annotation.pointreference_id
LEFT JOIN navaids_points.pointreference
ON pointreference_annotation.note_pt_id = NotePropertyType.id
;

PostalAddress
CREATE OR REPLACE VIEW postaladdress_view AS
SELECT
    jsonb_build_object(
       'id', shared.postaladdress_pt.id,
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
    ) AS postaladdress
FROM

-- PostalAddressType
LEFT JOIN shared.postaladdress_pt
ON shared.postaladdress_pt.postaladdress_id = PostalAddressType.id
-- AbstractExtensionType
LEFT JOIN shared.postaladdress
ON shared.postaladdress.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.postaladdress
ON shared.postaladdress.abstractpostaladdressextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.postaladdress_timeinterval
ON shared.postaladdress.id = postaladdress_timeinterval.postaladdress_id
LEFT JOIN shared.postaladdress
ON postaladdress_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.postaladdress_annotation
ON shared.postaladdress.id = postaladdress_annotation.postaladdress_id
LEFT JOIN shared.postaladdress
ON postaladdress_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.postaladdress_specialdateauthority
ON shared.postaladdress.id = postaladdress_specialdateauthority.postaladdress_id
LEFT JOIN shared.postaladdress
ON postaladdress_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

PrecisionApproachRadar
CREATE OR REPLACE VIEW precisionapproachradar_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.precisionapproachradar_pt.id,
       'nilReason', surveillance.precisionapproachradar_pt.nilReason,
       'href', surveillance.precisionapproachradar_pt.href,
       'id', surveillance.precisionapproachradar_tsp.id,
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
       'feature_lifetime_end', surveillance.precisionapproachradar_ts.feature_lifetime_end,
       'id', surveillance.precisionapproachradar.id,
       'identifier', surveillance.precisionapproachradar.identifier,
       'identifier_code_space', surveillance.precisionapproachradar.identifier_code_space,
       'xml_id', surveillance.precisionapproachradar.xml_id
    ) AS precisionapproachradar
FROM

-- PrecisionApproachRadarTimeSliceType
LEFT JOIN surveillance.precisionapproachradar_tsp
ON surveillance.precisionapproachradar_tsp.precisionapproachradartimeslice_id = PrecisionApproachRadarTimeSliceType.id
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
LEFT JOIN surveillance.precisionapproachradar_ts_contact
ON surveillance.precisionapproachradar_ts.id = precisionapproachradar_ts_contact.precisionapproachradar_ts_id
LEFT JOIN surveillance.precisionapproachradar_ts
ON precisionapproachradar_ts_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.precisionapproachradar_ts_annotation
ON surveillance.precisionapproachradar_ts.id = precisionapproachradar_ts_annotation.precisionapproachradar_ts_id
LEFT JOIN surveillance.precisionapproachradar_ts
ON precisionapproachradar_ts_annotation.note_pt_id = NotePropertyType.id
-- ReflectorPropertyType
LEFT JOIN surveillance.precisionapproachradar_ts_reflector
ON surveillance.precisionapproachradar_ts.id = precisionapproachradar_ts_reflector.precisionapproachradar_ts_id
LEFT JOIN surveillance.precisionapproachradar_ts
ON precisionapproachradar_ts_reflector.reflector_pt_id = ReflectorPropertyType.id
-- PrecisionApproachRadarTimeSlicePropertyType
LEFT JOIN surveillance.precisionapproachradar_timeslice
ON surveillance.precisionapproachradar.id = precisionapproachradar_timeslice.precisionapproachradar_id
LEFT JOIN surveillance.precisionapproachradar
ON precisionapproachradar_timeslice.precisionapproachradar_tsp_id = PrecisionApproachRadarTimeSlicePropertyType.id
;

PrimarySurveillanceRadar
CREATE OR REPLACE VIEW primarysurveillanceradar_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.primarysurveillanceradar_pt.id,
       'nilReason', surveillance.primarysurveillanceradar_pt.nilReason,
       'href', surveillance.primarysurveillanceradar_pt.href,
       'id', surveillance.primarysurveillanceradar_tsp.id,
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
       'feature_lifetime_end', surveillance.primarysurveillanceradar_ts.feature_lifetime_end,
       'id', surveillance.primarysurveillanceradar.id,
       'identifier', surveillance.primarysurveillanceradar.identifier,
       'identifier_code_space', surveillance.primarysurveillanceradar.identifier_code_space,
       'xml_id', surveillance.primarysurveillanceradar.xml_id
    ) AS primarysurveillanceradar
FROM

-- PrimarySurveillanceRadarTimeSliceType
LEFT JOIN surveillance.primarysurveillanceradar_tsp
ON surveillance.primarysurveillanceradar_tsp.primarysurveillanceradartimeslice_id = PrimarySurveillanceRadarTimeSliceType.id
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
LEFT JOIN surveillance.primarysurveillanceradar_ts_contact
ON surveillance.primarysurveillanceradar_ts.id = primarysurveillanceradar_ts_contact.primarysurveillanceradar_ts_id
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON primarysurveillanceradar_ts_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.primarysurveillanceradar_ts_annotation
ON surveillance.primarysurveillanceradar_ts.id = primarysurveillanceradar_ts_annotation.primarysurveillanceradar_ts_id
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON primarysurveillanceradar_ts_annotation.note_pt_id = NotePropertyType.id
-- SurveillanceGroundStationPropertyType
LEFT JOIN surveillance.primarysurveillanceradar_ts_groundstation
ON surveillance.primarysurveillanceradar_ts.id = primarysurveillanceradar_ts_groundstation.primarysurveillanceradar_ts_id
LEFT JOIN surveillance.primarysurveillanceradar_ts
ON primarysurveillanceradar_ts_groundstation.surveillancegroundstation_pt_id = SurveillanceGroundStationPropertyType.id
-- PrimarySurveillanceRadarTimeSlicePropertyType
LEFT JOIN surveillance.primarysurveillanceradar_timeslice
ON surveillance.primarysurveillanceradar.id = primarysurveillanceradar_timeslice.primarysurveillanceradar_id
LEFT JOIN surveillance.primarysurveillanceradar
ON primarysurveillanceradar_timeslice.primarysurveillanceradar_tsp_id = PrimarySurveillanceRadarTimeSlicePropertyType.id
;

ProcedureAvailability
CREATE OR REPLACE VIEW procedureavailability_view AS
SELECT
    jsonb_build_object(
       'id', procedure.procedureavailability_pt.id,
       'status_value', procedure.procedureavailability.status_value,
       'status_nilreason', procedure.procedureavailability.status_nilreason,
       'id', procedure.procedureavailability.id,
       'identifier', procedure.procedureavailability.identifier,
       'identifier_code_space', procedure.procedureavailability.identifier_code_space,
       'xml_id', procedure.procedureavailability.xml_id
    ) AS procedureavailability
FROM

-- ProcedureAvailabilityType
LEFT JOIN procedure.procedureavailability_pt
ON procedure.procedureavailability_pt.procedureavailability_id = ProcedureAvailabilityType.id
-- AbstractExtensionType
LEFT JOIN procedure.procedureavailability
ON procedure.procedureavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN procedure.procedureavailability
ON procedure.procedureavailability.abstractprocedureavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN procedure.procedureavailability_timeinterval
ON procedure.procedureavailability.id = procedureavailability_timeinterval.procedureavailability_id
LEFT JOIN procedure.procedureavailability
ON procedureavailability_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.procedureavailability_annotation
ON procedure.procedureavailability.id = procedureavailability_annotation.procedureavailability_id
LEFT JOIN procedure.procedureavailability
ON procedureavailability_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN procedure.procedureavailability_specialdateauthority
ON procedure.procedureavailability.id = procedureavailability_specialdateauthority.procedureavailability_id
LEFT JOIN procedure.procedureavailability
ON procedureavailability_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

ProcedureDME
CREATE OR REPLACE VIEW proceduredme_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduredme_pt.id,
       'nilReason', procedure.proceduredme_pt.nilReason,
       'href', procedure.proceduredme_pt.href,
       'id', procedure.proceduredme_tsp.id,
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
       'feature_lifetime_end', procedure.proceduredme_ts.feature_lifetime_end,
       'id', procedure.proceduredme.id,
       'identifier', procedure.proceduredme.identifier,
       'identifier_code_space', procedure.proceduredme.identifier_code_space,
       'xml_id', procedure.proceduredme.xml_id
    ) AS proceduredme
FROM

-- ProcedureDMETimeSliceType
LEFT JOIN procedure.proceduredme_tsp
ON procedure.proceduredme_tsp.proceduredmetimeslice_id = ProcedureDMETimeSliceType.id
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
LEFT JOIN procedure.proceduredme_ts_annotation
ON procedure.proceduredme_ts.id = proceduredme_ts_annotation.proceduredme_ts_id
LEFT JOIN procedure.proceduredme_ts
ON proceduredme_ts_annotation.note_pt_id = NotePropertyType.id
-- ProcedureDMETimeSlicePropertyType
LEFT JOIN procedure.proceduredme_timeslice
ON procedure.proceduredme.id = proceduredme_timeslice.proceduredme_id
LEFT JOIN procedure.proceduredme
ON proceduredme_timeslice.proceduredme_tsp_id = ProcedureDMETimeSlicePropertyType.id
;

Procedure
CREATE OR REPLACE VIEW procedure_view AS
SELECT
    jsonb_build_object(
       'id', procedure.procedure_pt.id,
       'nilReason', procedure.procedure_pt.nilReason,
       'href', procedure.procedure_pt.href
    ) AS procedure
FROM


;

ProcedureTransitionLeg
CREATE OR REPLACE VIEW proceduretransitionleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduretransitionleg_pt.id,
       'seqnumberarinc_value', procedure.proceduretransitionleg.seqnumberarinc_value,
       'seqnumberarinc_nilreason', procedure.proceduretransitionleg.seqnumberarinc_nilreason,
       'id', procedure.proceduretransitionleg.id,
       'identifier', procedure.proceduretransitionleg.identifier,
       'identifier_code_space', procedure.proceduretransitionleg.identifier_code_space,
       'xml_id', procedure.proceduretransitionleg.xml_id
    ) AS proceduretransitionleg
FROM

-- ProcedureTransitionLegType
LEFT JOIN procedure.proceduretransitionleg_pt
ON procedure.proceduretransitionleg_pt.proceduretransitionleg_id = ProcedureTransitionLegType.id
-- SegmentLegPropertyType
LEFT JOIN procedure.proceduretransitionleg
ON procedure.proceduretransitionleg.thesegmentleg_id = SegmentLegPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.proceduretransitionleg
ON procedure.proceduretransitionleg.abstractproceduretransitionlegextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.proceduretransitionleg_annotation
ON procedure.proceduretransitionleg.id = proceduretransitionleg_annotation.proceduretransitionleg_id
LEFT JOIN procedure.proceduretransitionleg
ON proceduretransitionleg_annotation.note_pt_id = NotePropertyType.id
;

ProcedureTransition
CREATE OR REPLACE VIEW proceduretransition_view AS
SELECT
    jsonb_build_object(
       'id', procedure.proceduretransition_pt.id,
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
    ) AS proceduretransition
FROM

-- ProcedureTransitionType
LEFT JOIN procedure.proceduretransition_pt
ON procedure.proceduretransition_pt.proceduretransition_id = ProcedureTransitionType.id
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
LEFT JOIN procedure.proceduretransition_transitionleg
ON procedure.proceduretransition.id = proceduretransition_transitionleg.proceduretransition_id
LEFT JOIN procedure.proceduretransition
ON proceduretransition_transitionleg.proceduretransitionleg_pt_id = ProcedureTransitionLegPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.proceduretransition_annotation
ON procedure.proceduretransition.id = proceduretransition_annotation.proceduretransition_id
LEFT JOIN procedure.proceduretransition
ON proceduretransition_annotation.note_pt_id = NotePropertyType.id
;

PropertiesWithSchedule
CREATE OR REPLACE VIEW propertieswithschedule_view AS
SELECT
    jsonb_build_object(
       'id', shared.propertieswithschedule_pt.id
    ) AS propertieswithschedule
FROM


;

RadarComponent
CREATE OR REPLACE VIEW radarcomponent_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarcomponent_pt.id,
       'collocationgroup_value', surveillance.radarcomponent.collocationgroup_value,
       'collocationgroup_nilreason', surveillance.radarcomponent.collocationgroup_nilreason,
       'id', surveillance.radarcomponent.id,
       'identifier', surveillance.radarcomponent.identifier,
       'identifier_code_space', surveillance.radarcomponent.identifier_code_space,
       'xml_id', surveillance.radarcomponent.xml_id
    ) AS radarcomponent
FROM

-- RadarComponentType
LEFT JOIN surveillance.radarcomponent_pt
ON surveillance.radarcomponent_pt.radarcomponent_id = RadarComponentType.id
-- RadarEquipmentPropertyType
LEFT JOIN surveillance.radarcomponent
ON surveillance.radarcomponent.theradarequipment_id = RadarEquipmentPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.radarcomponent
ON surveillance.radarcomponent.abstractradarcomponentextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN surveillance.radarcomponent_annotation
ON surveillance.radarcomponent.id = radarcomponent_annotation.radarcomponent_id
LEFT JOIN surveillance.radarcomponent
ON radarcomponent_annotation.note_pt_id = NotePropertyType.id
;

RadarEquipment
CREATE OR REPLACE VIEW radarequipment_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarequipment_pt.id,
       'nilReason', surveillance.radarequipment_pt.nilReason,
       'href', surveillance.radarequipment_pt.href
    ) AS radarequipment
FROM


;

RadarSystem
CREATE OR REPLACE VIEW radarsystem_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.radarsystem_pt.id,
       'nilReason', surveillance.radarsystem_pt.nilReason,
       'href', surveillance.radarsystem_pt.href,
       'id', surveillance.radarsystem_tsp.id,
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
       'feature_lifetime_end', surveillance.radarsystem_ts.feature_lifetime_end,
       'id', surveillance.radarsystem.id,
       'identifier', surveillance.radarsystem.identifier,
       'identifier_code_space', surveillance.radarsystem.identifier_code_space,
       'xml_id', surveillance.radarsystem.xml_id
    ) AS radarsystem
FROM

-- RadarSystemTimeSliceType
LEFT JOIN surveillance.radarsystem_tsp
ON surveillance.radarsystem_tsp.radarsystemtimeslice_id = RadarSystemTimeSliceType.id
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
LEFT JOIN surveillance.radarsystem_ts_radarequipment
ON surveillance.radarsystem_ts.id = radarsystem_ts_radarequipment.radarsystem_ts_id
LEFT JOIN surveillance.radarsystem_ts
ON radarsystem_ts_radarequipment.radarcomponent_pt_id = RadarComponentPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN surveillance.radarsystem_ts_office
ON surveillance.radarsystem_ts.id = radarsystem_ts_office.radarsystem_ts_id
LEFT JOIN surveillance.radarsystem_ts
ON radarsystem_ts_office.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- RunwayPropertyType
LEFT JOIN surveillance.radarsystem_ts_parrunway
ON surveillance.radarsystem_ts.id = radarsystem_ts_parrunway.radarsystem_ts_id
LEFT JOIN surveillance.radarsystem_ts
ON radarsystem_ts_parrunway.runway_pt_id = RunwayPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.radarsystem_ts_annotation
ON surveillance.radarsystem_ts.id = radarsystem_ts_annotation.radarsystem_ts_id
LEFT JOIN surveillance.radarsystem_ts
ON radarsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- RadarSystemTimeSlicePropertyType
LEFT JOIN surveillance.radarsystem_timeslice
ON surveillance.radarsystem.id = radarsystem_timeslice.radarsystem_id
LEFT JOIN surveillance.radarsystem
ON radarsystem_timeslice.radarsystem_tsp_id = RadarSystemTimeSlicePropertyType.id
;

RadioCommunicationChannel
CREATE OR REPLACE VIEW radiocommunicationchannel_view AS
SELECT
    jsonb_build_object(
       'id', service.radiocommunicationchannel_pt.id,
       'nilReason', service.radiocommunicationchannel_pt.nilReason,
       'href', service.radiocommunicationchannel_pt.href,
       'id', service.radiocommunicationchannel_tsp.id,
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
       'feature_lifetime_end', service.radiocommunicationchannel_ts.feature_lifetime_end,
       'id', service.radiocommunicationchannel.id,
       'identifier', service.radiocommunicationchannel.identifier,
       'identifier_code_space', service.radiocommunicationchannel.identifier_code_space,
       'xml_id', service.radiocommunicationchannel.xml_id
    ) AS radiocommunicationchannel
FROM

-- RadioCommunicationChannelTimeSliceType
LEFT JOIN service.radiocommunicationchannel_tsp
ON service.radiocommunicationchannel_tsp.radiocommunicationchanneltimeslice_id = RadioCommunicationChannelTimeSliceType.id
-- AbstractExtensionType
LEFT JOIN service.radiocommunicationchannel_ts
ON service.radiocommunicationchannel_ts.abstractradiocommunicationchannelextension_id = AbstractExtensionType.id

-- ElevatedPointPropertyType
LEFT JOIN service.radiocommunicationchannel_ts_location
ON service.radiocommunicationchannel_ts.id = radiocommunicationchannel_ts_location.radiocommunicationchannel_ts_id
LEFT JOIN service.radiocommunicationchannel_ts
ON radiocommunicationchannel_ts_location.elevatedpoint_pt_id = ElevatedPointPropertyType.id
-- RadioCommunicationOperationalStatusPropertyType
LEFT JOIN service.radiocommunicationchannel_ts_availability
ON service.radiocommunicationchannel_ts.id = radiocommunicationchannel_ts_availability.radiocommunicationchannel_ts_id
LEFT JOIN service.radiocommunicationchannel_ts
ON radiocommunicationchannel_ts_availability.radiocommunicationoperationalstatus_pt_id = RadioCommunicationOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.radiocommunicationchannel_ts_annotation
ON service.radiocommunicationchannel_ts.id = radiocommunicationchannel_ts_annotation.radiocommunicationchannel_ts_id
LEFT JOIN service.radiocommunicationchannel_ts
ON radiocommunicationchannel_ts_annotation.note_pt_id = NotePropertyType.id
-- RadioCommunicationChannelTimeSlicePropertyType
LEFT JOIN service.radiocommunicationchannel_timeslice
ON service.radiocommunicationchannel.id = radiocommunicationchannel_timeslice.radiocommunicationchannel_id
LEFT JOIN service.radiocommunicationchannel
ON radiocommunicationchannel_timeslice.radiocommunicationchannel_tsp_id = RadioCommunicationChannelTimeSlicePropertyType.id
;

RadioCommunicationOperationalStatus
CREATE OR REPLACE VIEW radiocommunicationoperationalstatus_view AS
SELECT
    jsonb_build_object(
       'id', service.radiocommunicationoperationalstatus_pt.id,
       'operationalstatus_value', service.radiocommunicationoperationalstatus.operationalstatus_value,
       'operationalstatus_nilreason', service.radiocommunicationoperationalstatus.operationalstatus_nilreason,
       'id', service.radiocommunicationoperationalstatus.id,
       'identifier', service.radiocommunicationoperationalstatus.identifier,
       'identifier_code_space', service.radiocommunicationoperationalstatus.identifier_code_space,
       'xml_id', service.radiocommunicationoperationalstatus.xml_id
    ) AS radiocommunicationoperationalstatus
FROM

-- RadioCommunicationOperationalStatusType
LEFT JOIN service.radiocommunicationoperationalstatus_pt
ON service.radiocommunicationoperationalstatus_pt.radiocommunicationoperationalstatus_id = RadioCommunicationOperationalStatusType.id
-- AbstractExtensionType
LEFT JOIN service.radiocommunicationoperationalstatus
ON service.radiocommunicationoperationalstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.radiocommunicationoperationalstatus
ON service.radiocommunicationoperationalstatus.abstractradiocommunicationoperationalstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN service.radiocommunicationoperationalstatus_timeinterval
ON service.radiocommunicationoperationalstatus.id = radiocommunicationoperationalstatus_timeinterval.radiocommunicationoperationalstatus_id
LEFT JOIN service.radiocommunicationoperationalstatus
ON radiocommunicationoperationalstatus_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN service.radiocommunicationoperationalstatus_annotation
ON service.radiocommunicationoperationalstatus.id = radiocommunicationoperationalstatus_annotation.radiocommunicationoperationalstatus_id
LEFT JOIN service.radiocommunicationoperationalstatus
ON radiocommunicationoperationalstatus_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN service.radiocommunicationoperationalstatus_specialdateauthority
ON service.radiocommunicationoperationalstatus.id = radiocommunicationoperationalstatus_specialdateauthority.radiocommunicationoperationalstatus_id
LEFT JOIN service.radiocommunicationoperationalstatus
ON radiocommunicationoperationalstatus_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

RadioFrequencyArea
CREATE OR REPLACE VIEW radiofrequencyarea_view AS
SELECT
    jsonb_build_object(
       'id', shared.radiofrequencyarea_pt.id,
       'nilReason', shared.radiofrequencyarea_pt.nilReason,
       'href', shared.radiofrequencyarea_pt.href,
       'id', shared.radiofrequencyarea_tsp.id,
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
       'feature_lifetime_end', shared.radiofrequencyarea_ts.feature_lifetime_end,
       'id', shared.radiofrequencyarea.id,
       'identifier', shared.radiofrequencyarea.identifier,
       'identifier_code_space', shared.radiofrequencyarea.identifier_code_space,
       'xml_id', shared.radiofrequencyarea.xml_id
    ) AS radiofrequencyarea
FROM

-- RadioFrequencyAreaTimeSliceType
LEFT JOIN shared.radiofrequencyarea_tsp
ON shared.radiofrequencyarea_tsp.radiofrequencyareatimeslice_id = RadioFrequencyAreaTimeSliceType.id
-- SecondarySurveillanceRadarPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_radar_id = SecondarySurveillanceRadarPropertyType.id
-- PrecisionApproachRadarPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_precisionapproachradar_id = PrecisionApproachRadarPropertyType.id
-- RadioCommunicationChannelPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_frequency_id = RadioCommunicationChannelPropertyType.id
-- SpecialNavigationStationPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_specialnavigationstation_id = SpecialNavigationStationPropertyType.id
-- NavaidEquipmentPropertyType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.equipment_navaidequipment_id = NavaidEquipmentPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.radiofrequencyarea_ts
ON shared.radiofrequencyarea_ts.abstractradiofrequencyareaextension_id = AbstractExtensionType.id

-- CircleSectorPropertyType
LEFT JOIN shared.radiofrequencyarea_ts_sector
ON shared.radiofrequencyarea_ts.id = radiofrequencyarea_ts_sector.radiofrequencyarea_ts_id
LEFT JOIN shared.radiofrequencyarea_ts
ON radiofrequencyarea_ts_sector.circlesector_pt_id = CircleSectorPropertyType.id
-- SurfacePropertyType
LEFT JOIN shared.radiofrequencyarea_ts_extent
ON shared.radiofrequencyarea_ts.id = radiofrequencyarea_ts_extent.radiofrequencyarea_ts_id
LEFT JOIN shared.radiofrequencyarea_ts
ON radiofrequencyarea_ts_extent.surface_pt_id = SurfacePropertyType.id
-- NotePropertyType
LEFT JOIN shared.radiofrequencyarea_ts_annotation
ON shared.radiofrequencyarea_ts.id = radiofrequencyarea_ts_annotation.radiofrequencyarea_ts_id
LEFT JOIN shared.radiofrequencyarea_ts
ON radiofrequencyarea_ts_annotation.note_pt_id = NotePropertyType.id
-- RadioFrequencyAreaTimeSlicePropertyType
LEFT JOIN shared.radiofrequencyarea_timeslice
ON shared.radiofrequencyarea.id = radiofrequencyarea_timeslice.radiofrequencyarea_id
LEFT JOIN shared.radiofrequencyarea
ON radiofrequencyarea_timeslice.radiofrequencyarea_tsp_id = RadioFrequencyAreaTimeSlicePropertyType.id
;

Reflector
CREATE OR REPLACE VIEW reflector_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.reflector_pt.id,
       'type_value', surveillance.reflector.type_value,
       'type_nilreason', surveillance.reflector.type_nilreason,
       'id', surveillance.reflector.id,
       'identifier', surveillance.reflector.identifier,
       'identifier_code_space', surveillance.reflector.identifier_code_space,
       'xml_id', surveillance.reflector.xml_id
    ) AS reflector
FROM

-- ReflectorType
LEFT JOIN surveillance.reflector_pt
ON surveillance.reflector_pt.reflector_id = ReflectorType.id
-- ElevatedPointPropertyType
LEFT JOIN surveillance.reflector
ON surveillance.reflector.touchdownreflector_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.reflector
ON surveillance.reflector.abstractreflectorextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN surveillance.reflector_annotation
ON surveillance.reflector.id = reflector_annotation.reflector_id
LEFT JOIN surveillance.reflector
ON reflector_annotation.note_pt_id = NotePropertyType.id
;

Ridge
CREATE OR REPLACE VIEW ridge_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.ridge_pt.id,
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
    ) AS ridge
FROM

-- RidgeType
LEFT JOIN airport_heliport.ridge_pt
ON airport_heliport.ridge_pt.ridge_id = RidgeType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.ridge
ON airport_heliport.ridge.abstractridgeextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.ridge_annotation
ON airport_heliport.ridge.id = ridge_annotation.ridge_id
LEFT JOIN airport_heliport.ridge
ON ridge_annotation.note_pt_id = NotePropertyType.id
;

Road
CREATE OR REPLACE VIEW road_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.road_pt.id,
       'nilReason', airport_heliport.road_pt.nilReason,
       'href', airport_heliport.road_pt.href,
       'id', airport_heliport.road_tsp.id,
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
       'feature_lifetime_end', airport_heliport.road_ts.feature_lifetime_end,
       'id', airport_heliport.road.id,
       'identifier', airport_heliport.road.identifier,
       'identifier_code_space', airport_heliport.road.identifier_code_space,
       'xml_id', airport_heliport.road.xml_id
    ) AS road
FROM

-- RoadTimeSliceType
LEFT JOIN airport_heliport.road_tsp
ON airport_heliport.road_tsp.roadtimeslice_id = RoadTimeSliceType.id
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
LEFT JOIN airport_heliport.road_ts_accessiblestand
ON airport_heliport.road_ts.id = road_ts_accessiblestand.road_ts_id
LEFT JOIN airport_heliport.road_ts
ON road_ts_accessiblestand.aircraftstand_pt_id = AircraftStandPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.road_ts_annotation
ON airport_heliport.road_ts.id = road_ts_annotation.road_ts_id
LEFT JOIN airport_heliport.road_ts
ON road_ts_annotation.note_pt_id = NotePropertyType.id
-- RoadTimeSlicePropertyType
LEFT JOIN airport_heliport.road_timeslice
ON airport_heliport.road.id = road_timeslice.road_id
LEFT JOIN airport_heliport.road
ON road_timeslice.road_tsp_id = RoadTimeSlicePropertyType.id
;

RouteAvailability
CREATE OR REPLACE VIEW routeavailability_view AS
SELECT
    jsonb_build_object(
       'id', routes.routeavailability_pt.id,
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
    ) AS routeavailability
FROM

-- RouteAvailabilityType
LEFT JOIN routes.routeavailability_pt
ON routes.routeavailability_pt.routeavailability_id = RouteAvailabilityType.id
-- AbstractExtensionType
LEFT JOIN routes.routeavailability
ON routes.routeavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN routes.routeavailability
ON routes.routeavailability.abstractrouteavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN routes.routeavailability_timeinterval
ON routes.routeavailability.id = routeavailability_timeinterval.routeavailability_id
LEFT JOIN routes.routeavailability
ON routeavailability_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN routes.routeavailability_annotation
ON routes.routeavailability.id = routeavailability_annotation.routeavailability_id
LEFT JOIN routes.routeavailability
ON routeavailability_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN routes.routeavailability_specialdateauthority
ON routes.routeavailability.id = routeavailability_specialdateauthority.routeavailability_id
LEFT JOIN routes.routeavailability
ON routeavailability_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- AirspaceLayerPropertyType
LEFT JOIN routes.routeavailability_levels
ON routes.routeavailability.id = routeavailability_levels.routeavailability_id
LEFT JOIN routes.routeavailability
ON routeavailability_levels.airspacelayer_pt_id = AirspaceLayerPropertyType.id
;

RouteDME
CREATE OR REPLACE VIEW routedme_view AS
SELECT
    jsonb_build_object(
       'id', routes.routedme_pt.id,
       'nilReason', routes.routedme_pt.nilReason,
       'href', routes.routedme_pt.href,
       'id', routes.routedme_tsp.id,
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
       'feature_lifetime_end', routes.routedme_ts.feature_lifetime_end,
       'id', routes.routedme.id,
       'identifier', routes.routedme.identifier,
       'identifier_code_space', routes.routedme.identifier_code_space,
       'xml_id', routes.routedme.xml_id
    ) AS routedme
FROM

-- RouteDMETimeSliceType
LEFT JOIN routes.routedme_tsp
ON routes.routedme_tsp.routedmetimeslice_id = RouteDMETimeSliceType.id
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
LEFT JOIN routes.routedme_ts_annotation
ON routes.routedme_ts.id = routedme_ts_annotation.routedme_ts_id
LEFT JOIN routes.routedme_ts
ON routedme_ts_annotation.note_pt_id = NotePropertyType.id
-- RouteDMETimeSlicePropertyType
LEFT JOIN routes.routedme_timeslice
ON routes.routedme.id = routedme_timeslice.routedme_id
LEFT JOIN routes.routedme
ON routedme_timeslice.routedme_tsp_id = RouteDMETimeSlicePropertyType.id
;

RoutePortion
CREATE OR REPLACE VIEW routeportion_view AS
SELECT
    jsonb_build_object(
       'id', routes.routeportion_pt.id,
       'id', routes.routeportion.id,
       'identifier', routes.routeportion.identifier,
       'identifier_code_space', routes.routeportion.identifier_code_space,
       'xml_id', routes.routeportion.xml_id
    ) AS routeportion
FROM

-- RoutePortionType
LEFT JOIN routes.routeportion_pt
ON routes.routeportion_pt.routeportion_id = RoutePortionType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.start_airportreferencepoint_id = AirportHeliportPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.intermediatepoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- RoutePropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.referencedroute_id = RoutePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN routes.routeportion
ON routes.routeportion.end_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.routeportion
ON routes.routeportion.abstractrouteportionextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.routeportion_annotation
ON routes.routeportion.id = routeportion_annotation.routeportion_id
LEFT JOIN routes.routeportion
ON routeportion_annotation.note_pt_id = NotePropertyType.id
;

Route
CREATE OR REPLACE VIEW route_view AS
SELECT
    jsonb_build_object(
       'id', routes.route_pt.id,
       'nilReason', routes.route_pt.nilReason,
       'href', routes.route_pt.href,
       'id', routes.route_tsp.id,
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
       'feature_lifetime_end', routes.route_ts.feature_lifetime_end,
       'id', routes.route.id,
       'identifier', routes.route.identifier,
       'identifier_code_space', routes.route.identifier_code_space,
       'xml_id', routes.route.xml_id
    ) AS route
FROM

-- RouteTimeSliceType
LEFT JOIN routes.route_tsp
ON routes.route_tsp.routetimeslice_id = RouteTimeSliceType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN routes.route_ts
ON routes.route_ts.userorganisation_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN routes.route_ts
ON routes.route_ts.abstractrouteextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN routes.route_ts_annotation
ON routes.route_ts.id = route_ts_annotation.route_ts_id
LEFT JOIN routes.route_ts
ON route_ts_annotation.note_pt_id = NotePropertyType.id
-- RouteTimeSlicePropertyType
LEFT JOIN routes.route_timeslice
ON routes.route.id = route_timeslice.route_id
LEFT JOIN routes.route
ON route_timeslice.route_tsp_id = RouteTimeSlicePropertyType.id
;

RouteSegment
CREATE OR REPLACE VIEW routesegment_view AS
SELECT
    jsonb_build_object(
       'id', routes.routesegment_pt.id,
       'nilReason', routes.routesegment_pt.nilReason,
       'href', routes.routesegment_pt.href,
       'id', routes.routesegment_tsp.id,
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
       'feature_lifetime_end', routes.routesegment_ts.feature_lifetime_end,
       'id', routes.routesegment.id,
       'identifier', routes.routesegment.identifier,
       'identifier_code_space', routes.routesegment.identifier_code_space,
       'xml_id', routes.routesegment.xml_id
    ) AS routesegment
FROM

-- RouteSegmentTimeSliceType
LEFT JOIN routes.routesegment_tsp
ON routes.routesegment_tsp.routesegmenttimeslice_id = RouteSegmentTimeSliceType.id
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
LEFT JOIN routes.routesegment_ts_availability
ON routes.routesegment_ts.id = routesegment_ts_availability.routesegment_ts_id
LEFT JOIN routes.routesegment_ts
ON routesegment_ts_availability.routeavailability_pt_id = RouteAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN routes.routesegment_ts_annotation
ON routes.routesegment_ts.id = routesegment_ts_annotation.routesegment_ts_id
LEFT JOIN routes.routesegment_ts
ON routesegment_ts_annotation.note_pt_id = NotePropertyType.id
-- RouteSegmentTimeSlicePropertyType
LEFT JOIN routes.routesegment_timeslice
ON routes.routesegment.id = routesegment_timeslice.routesegment_id
LEFT JOIN routes.routesegment
ON routesegment_timeslice.routesegment_tsp_id = RouteSegmentTimeSlicePropertyType.id
;

RulesProcedures
CREATE OR REPLACE VIEW rulesprocedures_view AS
SELECT
    jsonb_build_object(
       'id', rules_procedures.rulesprocedures_pt.id,
       'nilReason', rules_procedures.rulesprocedures_pt.nilReason,
       'href', rules_procedures.rulesprocedures_pt.href,
       'id', rules_procedures.rulesprocedures_tsp.id,
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
       'feature_lifetime_end', rules_procedures.rulesprocedures_ts.feature_lifetime_end,
       'id', rules_procedures.rulesprocedures.id,
       'identifier', rules_procedures.rulesprocedures.identifier,
       'identifier_code_space', rules_procedures.rulesprocedures.identifier_code_space,
       'xml_id', rules_procedures.rulesprocedures.xml_id
    ) AS rulesprocedures
FROM

-- RulesProceduresTimeSliceType
LEFT JOIN rules_procedures.rulesprocedures_tsp
ON rules_procedures.rulesprocedures_tsp.rulesprocedurestimeslice_id = RulesProceduresTimeSliceType.id
-- AbstractExtensionType
LEFT JOIN rules_procedures.rulesprocedures_ts
ON rules_procedures.rulesprocedures_ts.abstractrulesproceduresextension_id = AbstractExtensionType.id

-- AirportHeliportPropertyType
LEFT JOIN rules_procedures.rulesprocedures_ts_affectedlocation
ON rules_procedures.rulesprocedures_ts.id = rulesprocedures_ts_affectedlocation.rulesprocedures_ts_id
LEFT JOIN rules_procedures.rulesprocedures_ts
ON rulesprocedures_ts_affectedlocation.airportheliport_pt_id = AirportHeliportPropertyType.id
-- AirspacePropertyType
LEFT JOIN rules_procedures.rulesprocedures_ts_affectedarea
ON rules_procedures.rulesprocedures_ts.id = rulesprocedures_ts_affectedarea.rulesprocedures_ts_id
LEFT JOIN rules_procedures.rulesprocedures_ts
ON rulesprocedures_ts_affectedarea.airspace_pt_id = AirspacePropertyType.id
-- NotePropertyType
LEFT JOIN rules_procedures.rulesprocedures_ts_annotation
ON rules_procedures.rulesprocedures_ts.id = rulesprocedures_ts_annotation.rulesprocedures_ts_id
LEFT JOIN rules_procedures.rulesprocedures_ts
ON rulesprocedures_ts_annotation.note_pt_id = NotePropertyType.id
-- RulesProceduresTimeSlicePropertyType
LEFT JOIN rules_procedures.rulesprocedures_timeslice
ON rules_procedures.rulesprocedures.id = rulesprocedures_timeslice.rulesprocedures_id
LEFT JOIN rules_procedures.rulesprocedures
ON rulesprocedures_timeslice.rulesprocedures_tsp_id = RulesProceduresTimeSlicePropertyType.id
;

RunwayBlastPad
CREATE OR REPLACE VIEW runwayblastpad_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayblastpad_pt.id,
       'nilReason', airport_heliport.runwayblastpad_pt.nilReason,
       'href', airport_heliport.runwayblastpad_pt.href,
       'id', airport_heliport.runwayblastpad_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwayblastpad_ts.feature_lifetime_end,
       'id', airport_heliport.runwayblastpad.id,
       'identifier', airport_heliport.runwayblastpad.identifier,
       'identifier_code_space', airport_heliport.runwayblastpad.identifier_code_space,
       'xml_id', airport_heliport.runwayblastpad.xml_id
    ) AS runwayblastpad
FROM

-- RunwayBlastPadTimeSliceType
LEFT JOIN airport_heliport.runwayblastpad_tsp
ON airport_heliport.runwayblastpad_tsp.runwayblastpadtimeslice_id = RunwayBlastPadTimeSliceType.id
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
LEFT JOIN airport_heliport.runwayblastpad_ts_annotation
ON airport_heliport.runwayblastpad_ts.id = runwayblastpad_ts_annotation.runwayblastpad_ts_id
LEFT JOIN airport_heliport.runwayblastpad_ts
ON runwayblastpad_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwayBlastPadTimeSlicePropertyType
LEFT JOIN airport_heliport.runwayblastpad_timeslice
ON airport_heliport.runwayblastpad.id = runwayblastpad_timeslice.runwayblastpad_id
LEFT JOIN airport_heliport.runwayblastpad
ON runwayblastpad_timeslice.runwayblastpad_tsp_id = RunwayBlastPadTimeSlicePropertyType.id
;

RunwayCentrelinePoint
CREATE OR REPLACE VIEW runwaycentrelinepoint_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaycentrelinepoint_pt.id,
       'nilReason', airport_heliport.runwaycentrelinepoint_pt.nilReason,
       'href', airport_heliport.runwaycentrelinepoint_pt.href,
       'id', airport_heliport.runwaycentrelinepoint_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwaycentrelinepoint_ts.feature_lifetime_end,
       'id', airport_heliport.runwaycentrelinepoint.id,
       'identifier', airport_heliport.runwaycentrelinepoint.identifier,
       'identifier_code_space', airport_heliport.runwaycentrelinepoint.identifier_code_space,
       'xml_id', airport_heliport.runwaycentrelinepoint.xml_id
    ) AS runwaycentrelinepoint
FROM

-- RunwayCentrelinePointTimeSliceType
LEFT JOIN airport_heliport.runwaycentrelinepoint_tsp
ON airport_heliport.runwaycentrelinepoint_tsp.runwaycentrelinepointtimeslice_id = RunwayCentrelinePointTimeSliceType.id
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
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts_associateddeclareddistance
ON airport_heliport.runwaycentrelinepoint_ts.id = runwaycentrelinepoint_ts_associateddeclareddistance.runwaycentrelinepoint_ts_id
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON runwaycentrelinepoint_ts_associateddeclareddistance.runwaydeclareddistance_pt_id = RunwayDeclaredDistancePropertyType.id
-- NavaidEquipmentDistancePropertyType
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts_navaidequipment
ON airport_heliport.runwaycentrelinepoint_ts.id = runwaycentrelinepoint_ts_navaidequipment.runwaycentrelinepoint_ts_id
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON runwaycentrelinepoint_ts_navaidequipment.navaidequipmentdistance_pt_id = NavaidEquipmentDistancePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts_annotation
ON airport_heliport.runwaycentrelinepoint_ts.id = runwaycentrelinepoint_ts_annotation.runwaycentrelinepoint_ts_id
LEFT JOIN airport_heliport.runwaycentrelinepoint_ts
ON runwaycentrelinepoint_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwayCentrelinePointTimeSlicePropertyType
LEFT JOIN airport_heliport.runwaycentrelinepoint_timeslice
ON airport_heliport.runwaycentrelinepoint.id = runwaycentrelinepoint_timeslice.runwaycentrelinepoint_id
LEFT JOIN airport_heliport.runwaycentrelinepoint
ON runwaycentrelinepoint_timeslice.runwaycentrelinepoint_tsp_id = RunwayCentrelinePointTimeSlicePropertyType.id
;

RunwayContamination
CREATE OR REPLACE VIEW runwaycontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaycontamination_pt.id,
       'observationtime_value', airport_heliport.runwaycontamination.observationtime_value,
       'observationtime_nilreason', airport_heliport.runwaycontamination.observationtime_nilreason,
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
       'nextobservationtime_value', airport_heliport.runwaycontamination.nextobservationtime_value,
       'nextobservationtime_nilreason', airport_heliport.runwaycontamination.nextobservationtime_nilreason,
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
    ) AS runwaycontamination
FROM

-- RunwayContaminationType
LEFT JOIN airport_heliport.runwaycontamination_pt
ON airport_heliport.runwaycontamination_pt.runwaycontamination_id = RunwayContaminationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaycontamination
ON airport_heliport.runwaycontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaycontamination
ON airport_heliport.runwaycontamination.abstractrunwaycontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.runwaycontamination_criticalridge
ON airport_heliport.runwaycontamination.id = runwaycontamination_criticalridge.runwaycontamination_id
LEFT JOIN airport_heliport.runwaycontamination
ON runwaycontamination_criticalridge.ridge_pt_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.runwaycontamination_layer
ON airport_heliport.runwaycontamination.id = runwaycontamination_layer.runwaycontamination_id
LEFT JOIN airport_heliport.runwaycontamination
ON runwaycontamination_layer.surfacecontaminationlayer_pt_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwaycontamination_annotation
ON airport_heliport.runwaycontamination.id = runwaycontamination_annotation.runwaycontamination_id
LEFT JOIN airport_heliport.runwaycontamination
ON runwaycontamination_annotation.note_pt_id = NotePropertyType.id
;

RunwayDeclaredDistance
CREATE OR REPLACE VIEW runwaydeclareddistance_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydeclareddistance_pt.id,
       'type_value', airport_heliport.runwaydeclareddistance.type_value,
       'type_nilreason', airport_heliport.runwaydeclareddistance.type_nilreason,
       'id', airport_heliport.runwaydeclareddistance.id,
       'identifier', airport_heliport.runwaydeclareddistance.identifier,
       'identifier_code_space', airport_heliport.runwaydeclareddistance.identifier_code_space,
       'xml_id', airport_heliport.runwaydeclareddistance.xml_id
    ) AS runwaydeclareddistance
FROM

-- RunwayDeclaredDistanceType
LEFT JOIN airport_heliport.runwaydeclareddistance_pt
ON airport_heliport.runwaydeclareddistance_pt.runwaydeclareddistance_id = RunwayDeclaredDistanceType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydeclareddistance
ON airport_heliport.runwaydeclareddistance.abstractrunwaydeclareddistanceextension_id = AbstractExtensionType.id

-- RunwayDeclaredDistanceValuePropertyType
LEFT JOIN airport_heliport.runwaydeclareddistance_declaredvalue
ON airport_heliport.runwaydeclareddistance.id = runwaydeclareddistance_declaredvalue.runwaydeclareddistance_id
LEFT JOIN airport_heliport.runwaydeclareddistance
ON runwaydeclareddistance_declaredvalue.runwaydeclareddistancevalue_pt_id = RunwayDeclaredDistanceValuePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwaydeclareddistance_annotation
ON airport_heliport.runwaydeclareddistance.id = runwaydeclareddistance_annotation.runwaydeclareddistance_id
LEFT JOIN airport_heliport.runwaydeclareddistance
ON runwaydeclareddistance_annotation.note_pt_id = NotePropertyType.id
;

RunwayDeclaredDistanceValue
CREATE OR REPLACE VIEW runwaydeclareddistancevalue_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydeclareddistancevalue_pt.id,
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
    ) AS runwaydeclareddistancevalue
FROM

-- RunwayDeclaredDistanceValueType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue_pt
ON airport_heliport.runwaydeclareddistancevalue_pt.runwaydeclareddistancevalue_id = RunwayDeclaredDistanceValueType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON airport_heliport.runwaydeclareddistancevalue.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON airport_heliport.runwaydeclareddistancevalue.abstractrunwaydeclareddistancevalueextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue_timeinterval
ON airport_heliport.runwaydeclareddistancevalue.id = runwaydeclareddistancevalue_timeinterval.runwaydeclareddistancevalue_id
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON runwaydeclareddistancevalue_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue_annotation
ON airport_heliport.runwaydeclareddistancevalue.id = runwaydeclareddistancevalue_annotation.runwaydeclareddistancevalue_id
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON runwaydeclareddistancevalue_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.runwaydeclareddistancevalue_specialdateauthority
ON airport_heliport.runwaydeclareddistancevalue.id = runwaydeclareddistancevalue_specialdateauthority.runwaydeclareddistancevalue_id
LEFT JOIN airport_heliport.runwaydeclareddistancevalue
ON runwaydeclareddistancevalue_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

RunwayDirectionLightSystem
CREATE OR REPLACE VIEW runwaydirectionlightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirectionlightsystem_pt.id,
       'nilReason', airport_heliport.runwaydirectionlightsystem_pt.nilReason,
       'href', airport_heliport.runwaydirectionlightsystem_pt.href,
       'id', airport_heliport.runwaydirectionlightsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwaydirectionlightsystem_ts.feature_lifetime_end,
       'id', airport_heliport.runwaydirectionlightsystem.id,
       'identifier', airport_heliport.runwaydirectionlightsystem.identifier,
       'identifier_code_space', airport_heliport.runwaydirectionlightsystem.identifier_code_space,
       'xml_id', airport_heliport.runwaydirectionlightsystem.xml_id
    ) AS runwaydirectionlightsystem
FROM

-- RunwayDirectionLightSystemTimeSliceType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_tsp
ON airport_heliport.runwaydirectionlightsystem_tsp.runwaydirectionlightsystemtimeslice_id = RunwayDirectionLightSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts_element
ON airport_heliport.runwaydirectionlightsystem_ts.id = runwaydirectionlightsystem_ts_element.runwaydirectionlightsystem_ts_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON runwaydirectionlightsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts_availability
ON airport_heliport.runwaydirectionlightsystem_ts.id = runwaydirectionlightsystem_ts_availability.runwaydirectionlightsystem_ts_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON runwaydirectionlightsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts_annotation
ON airport_heliport.runwaydirectionlightsystem_ts.id = runwaydirectionlightsystem_ts_annotation.runwaydirectionlightsystem_ts_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem_ts
ON runwaydirectionlightsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwayDirectionLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.runwaydirectionlightsystem_timeslice
ON airport_heliport.runwaydirectionlightsystem.id = runwaydirectionlightsystem_timeslice.runwaydirectionlightsystem_id
LEFT JOIN airport_heliport.runwaydirectionlightsystem
ON runwaydirectionlightsystem_timeslice.runwaydirectionlightsystem_tsp_id = RunwayDirectionLightSystemTimeSlicePropertyType.id
;

RunwayDirection
CREATE OR REPLACE VIEW runwaydirection_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaydirection_pt.id,
       'nilReason', airport_heliport.runwaydirection_pt.nilReason,
       'href', airport_heliport.runwaydirection_pt.href,
       'id', airport_heliport.runwaydirection_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwaydirection_ts.feature_lifetime_end,
       'id', airport_heliport.runwaydirection.id,
       'identifier', airport_heliport.runwaydirection.identifier,
       'identifier_code_space', airport_heliport.runwaydirection.identifier_code_space,
       'xml_id', airport_heliport.runwaydirection.xml_id
    ) AS runwaydirection
FROM

-- RunwayDirectionTimeSliceType
LEFT JOIN airport_heliport.runwaydirection_tsp
ON airport_heliport.runwaydirection_tsp.runwaydirectiontimeslice_id = RunwayDirectionTimeSliceType.id
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
LEFT JOIN airport_heliport.runwaydirection_ts_annotation
ON airport_heliport.runwaydirection_ts.id = runwaydirection_ts_annotation.runwaydirection_ts_id
LEFT JOIN airport_heliport.runwaydirection_ts
ON runwaydirection_ts_annotation.note_pt_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.runwaydirection_ts_availability
ON airport_heliport.runwaydirection_ts.id = runwaydirection_ts_availability.runwaydirection_ts_id
LEFT JOIN airport_heliport.runwaydirection_ts
ON runwaydirection_ts_availability.manoeuvringareaavailability_pt_id = ManoeuvringAreaAvailabilityPropertyType.id
-- RunwayDirectionTimeSlicePropertyType
LEFT JOIN airport_heliport.runwaydirection_timeslice
ON airport_heliport.runwaydirection.id = runwaydirection_timeslice.runwaydirection_id
LEFT JOIN airport_heliport.runwaydirection
ON runwaydirection_timeslice.runwaydirection_tsp_id = RunwayDirectionTimeSlicePropertyType.id
;

RunwayElement
CREATE OR REPLACE VIEW runwayelement_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayelement_pt.id,
       'nilReason', airport_heliport.runwayelement_pt.nilReason,
       'href', airport_heliport.runwayelement_pt.href,
       'id', airport_heliport.runwayelement_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwayelement_ts.feature_lifetime_end,
       'id', airport_heliport.runwayelement.id,
       'identifier', airport_heliport.runwayelement.identifier,
       'identifier_code_space', airport_heliport.runwayelement.identifier_code_space,
       'xml_id', airport_heliport.runwayelement.xml_id
    ) AS runwayelement
FROM

-- RunwayElementTimeSliceType
LEFT JOIN airport_heliport.runwayelement_tsp
ON airport_heliport.runwayelement_tsp.runwayelementtimeslice_id = RunwayElementTimeSliceType.id
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
LEFT JOIN airport_heliport.runwayelement_ts_associatedrunway
ON airport_heliport.runwayelement_ts.id = runwayelement_ts_associatedrunway.runwayelement_ts_id
LEFT JOIN airport_heliport.runwayelement_ts
ON runwayelement_ts_associatedrunway.runway_pt_id = RunwayPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwayelement_ts_annotation
ON airport_heliport.runwayelement_ts.id = runwayelement_ts_annotation.runwayelement_ts_id
LEFT JOIN airport_heliport.runwayelement_ts
ON runwayelement_ts_annotation.note_pt_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.runwayelement_ts_availability
ON airport_heliport.runwayelement_ts.id = runwayelement_ts_availability.runwayelement_ts_id
LEFT JOIN airport_heliport.runwayelement_ts
ON runwayelement_ts_availability.manoeuvringareaavailability_pt_id = ManoeuvringAreaAvailabilityPropertyType.id
-- RunwayElementTimeSlicePropertyType
LEFT JOIN airport_heliport.runwayelement_timeslice
ON airport_heliport.runwayelement.id = runwayelement_timeslice.runwayelement_id
LEFT JOIN airport_heliport.runwayelement
ON runwayelement_timeslice.runwayelement_tsp_id = RunwayElementTimeSlicePropertyType.id
;

RunwayMarking
CREATE OR REPLACE VIEW runwaymarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaymarking_pt.id,
       'nilReason', airport_heliport.runwaymarking_pt.nilReason,
       'href', airport_heliport.runwaymarking_pt.href,
       'id', airport_heliport.runwaymarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwaymarking_ts.feature_lifetime_end,
       'id', airport_heliport.runwaymarking.id,
       'identifier', airport_heliport.runwaymarking.identifier,
       'identifier_code_space', airport_heliport.runwaymarking.identifier_code_space,
       'xml_id', airport_heliport.runwaymarking.xml_id
    ) AS runwaymarking
FROM

-- RunwayMarkingTimeSliceType
LEFT JOIN airport_heliport.runwaymarking_tsp
ON airport_heliport.runwaymarking_tsp.runwaymarkingtimeslice_id = RunwayMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.runwaymarking_ts_element
ON airport_heliport.runwaymarking_ts.id = runwaymarking_ts_element.runwaymarking_ts_id
LEFT JOIN airport_heliport.runwaymarking_ts
ON runwaymarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwaymarking_ts_annotation
ON airport_heliport.runwaymarking_ts.id = runwaymarking_ts_annotation.runwaymarking_ts_id
LEFT JOIN airport_heliport.runwaymarking_ts
ON runwaymarking_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwayMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.runwaymarking_timeslice
ON airport_heliport.runwaymarking.id = runwaymarking_timeslice.runwaymarking_id
LEFT JOIN airport_heliport.runwaymarking
ON runwaymarking_timeslice.runwaymarking_tsp_id = RunwayMarkingTimeSlicePropertyType.id
;

Runway
CREATE OR REPLACE VIEW runway_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runway_pt.id,
       'nilReason', airport_heliport.runway_pt.nilReason,
       'href', airport_heliport.runway_pt.href,
       'id', airport_heliport.runway_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runway_ts.feature_lifetime_end,
       'id', airport_heliport.runway.id,
       'identifier', airport_heliport.runway.identifier,
       'identifier_code_space', airport_heliport.runway.identifier_code_space,
       'xml_id', airport_heliport.runway.xml_id
    ) AS runway
FROM

-- RunwayTimeSliceType
LEFT JOIN airport_heliport.runway_tsp
ON airport_heliport.runway_tsp.runwaytimeslice_id = RunwayTimeSliceType.id
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
LEFT JOIN airport_heliport.runway_ts_overallcontaminant
ON airport_heliport.runway_ts.id = runway_ts_overallcontaminant.runway_ts_id
LEFT JOIN airport_heliport.runway_ts
ON runway_ts_overallcontaminant.runwaycontamination_pt_id = RunwayContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runway_ts_annotation
ON airport_heliport.runway_ts.id = runway_ts_annotation.runway_ts_id
LEFT JOIN airport_heliport.runway_ts
ON runway_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwaySectionContaminationPropertyType
LEFT JOIN airport_heliport.runway_ts_areacontaminant
ON airport_heliport.runway_ts.id = runway_ts_areacontaminant.runway_ts_id
LEFT JOIN airport_heliport.runway_ts
ON runway_ts_areacontaminant.runwaysectioncontamination_pt_id = RunwaySectionContaminationPropertyType.id
-- RunwayTimeSlicePropertyType
LEFT JOIN airport_heliport.runway_timeslice
ON airport_heliport.runway.id = runway_timeslice.runway_id
LEFT JOIN airport_heliport.runway
ON runway_timeslice.runway_tsp_id = RunwayTimeSlicePropertyType.id
;

RunwayProtectAreaLightSystem
CREATE OR REPLACE VIEW runwayprotectarealightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarealightsystem_pt.id,
       'nilReason', airport_heliport.runwayprotectarealightsystem_pt.nilReason,
       'href', airport_heliport.runwayprotectarealightsystem_pt.href,
       'id', airport_heliport.runwayprotectarealightsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwayprotectarealightsystem_ts.feature_lifetime_end,
       'id', airport_heliport.runwayprotectarealightsystem.id,
       'identifier', airport_heliport.runwayprotectarealightsystem.identifier,
       'identifier_code_space', airport_heliport.runwayprotectarealightsystem.identifier_code_space,
       'xml_id', airport_heliport.runwayprotectarealightsystem.xml_id
    ) AS runwayprotectarealightsystem
FROM

-- RunwayProtectAreaLightSystemTimeSliceType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_tsp
ON airport_heliport.runwayprotectarealightsystem_tsp.runwayprotectarealightsystemtimeslice_id = RunwayProtectAreaLightSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts_element
ON airport_heliport.runwayprotectarealightsystem_ts.id = runwayprotectarealightsystem_ts_element.runwayprotectarealightsystem_ts_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON runwayprotectarealightsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts_availability
ON airport_heliport.runwayprotectarealightsystem_ts.id = runwayprotectarealightsystem_ts_availability.runwayprotectarealightsystem_ts_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON runwayprotectarealightsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts_annotation
ON airport_heliport.runwayprotectarealightsystem_ts.id = runwayprotectarealightsystem_ts_annotation.runwayprotectarealightsystem_ts_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem_ts
ON runwayprotectarealightsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwayProtectAreaLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.runwayprotectarealightsystem_timeslice
ON airport_heliport.runwayprotectarealightsystem.id = runwayprotectarealightsystem_timeslice.runwayprotectarealightsystem_id
LEFT JOIN airport_heliport.runwayprotectarealightsystem
ON runwayprotectarealightsystem_timeslice.runwayprotectarealightsystem_tsp_id = RunwayProtectAreaLightSystemTimeSlicePropertyType.id
;

RunwayProtectArea
CREATE OR REPLACE VIEW runwayprotectarea_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayprotectarea_pt.id,
       'nilReason', airport_heliport.runwayprotectarea_pt.nilReason,
       'href', airport_heliport.runwayprotectarea_pt.href,
       'id', airport_heliport.runwayprotectarea_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwayprotectarea_ts.feature_lifetime_end,
       'id', airport_heliport.runwayprotectarea.id,
       'identifier', airport_heliport.runwayprotectarea.identifier,
       'identifier_code_space', airport_heliport.runwayprotectarea.identifier_code_space,
       'xml_id', airport_heliport.runwayprotectarea.xml_id
    ) AS runwayprotectarea
FROM

-- RunwayProtectAreaTimeSliceType
LEFT JOIN airport_heliport.runwayprotectarea_tsp
ON airport_heliport.runwayprotectarea_tsp.runwayprotectareatimeslice_id = RunwayProtectAreaTimeSliceType.id
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
LEFT JOIN airport_heliport.runwayprotectarea_ts_annotation
ON airport_heliport.runwayprotectarea_ts.id = runwayprotectarea_ts_annotation.runwayprotectarea_ts_id
LEFT JOIN airport_heliport.runwayprotectarea_ts
ON runwayprotectarea_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwayProtectAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.runwayprotectarea_timeslice
ON airport_heliport.runwayprotectarea.id = runwayprotectarea_timeslice.runwayprotectarea_id
LEFT JOIN airport_heliport.runwayprotectarea
ON runwayprotectarea_timeslice.runwayprotectarea_tsp_id = RunwayProtectAreaTimeSlicePropertyType.id
;

RunwaySectionContamination
CREATE OR REPLACE VIEW runwaysectioncontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwaysectioncontamination_pt.id,
       'observationtime_value', airport_heliport.runwaysectioncontamination.observationtime_value,
       'observationtime_nilreason', airport_heliport.runwaysectioncontamination.observationtime_nilreason,
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
       'nextobservationtime_value', airport_heliport.runwaysectioncontamination.nextobservationtime_value,
       'nextobservationtime_nilreason', airport_heliport.runwaysectioncontamination.nextobservationtime_nilreason,
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
    ) AS runwaysectioncontamination
FROM

-- RunwaySectionContaminationType
LEFT JOIN airport_heliport.runwaysectioncontamination_pt
ON airport_heliport.runwaysectioncontamination_pt.runwaysectioncontamination_id = RunwaySectionContaminationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaysectioncontamination
ON airport_heliport.runwaysectioncontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwaysectioncontamination
ON airport_heliport.runwaysectioncontamination.abstractrunwaysectioncontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.runwaysectioncontamination_criticalridge
ON airport_heliport.runwaysectioncontamination.id = runwaysectioncontamination_criticalridge.runwaysectioncontamination_id
LEFT JOIN airport_heliport.runwaysectioncontamination
ON runwaysectioncontamination_criticalridge.ridge_pt_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.runwaysectioncontamination_layer
ON airport_heliport.runwaysectioncontamination.id = runwaysectioncontamination_layer.runwaysectioncontamination_id
LEFT JOIN airport_heliport.runwaysectioncontamination
ON runwaysectioncontamination_layer.surfacecontaminationlayer_pt_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwaysectioncontamination_annotation
ON airport_heliport.runwaysectioncontamination.id = runwaysectioncontamination_annotation.runwaysectioncontamination_id
LEFT JOIN airport_heliport.runwaysectioncontamination
ON runwaysectioncontamination_annotation.note_pt_id = NotePropertyType.id
;

RunwayVisualRange
CREATE OR REPLACE VIEW runwayvisualrange_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.runwayvisualrange_pt.id,
       'nilReason', airport_heliport.runwayvisualrange_pt.nilReason,
       'href', airport_heliport.runwayvisualrange_pt.href,
       'id', airport_heliport.runwayvisualrange_tsp.id,
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
       'feature_lifetime_end', airport_heliport.runwayvisualrange_ts.feature_lifetime_end,
       'id', airport_heliport.runwayvisualrange.id,
       'identifier', airport_heliport.runwayvisualrange.identifier,
       'identifier_code_space', airport_heliport.runwayvisualrange.identifier_code_space,
       'xml_id', airport_heliport.runwayvisualrange.xml_id
    ) AS runwayvisualrange
FROM

-- RunwayVisualRangeTimeSliceType
LEFT JOIN airport_heliport.runwayvisualrange_tsp
ON airport_heliport.runwayvisualrange_tsp.runwayvisualrangetimeslice_id = RunwayVisualRangeTimeSliceType.id
-- ElevatedPointPropertyType
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON airport_heliport.runwayvisualrange_ts.location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON airport_heliport.runwayvisualrange_ts.abstractrunwayvisualrangeextension_id = AbstractExtensionType.id

-- RunwayDirectionPropertyType
LEFT JOIN airport_heliport.runwayvisualrange_ts_associatedrunwaydirection
ON airport_heliport.runwayvisualrange_ts.id = runwayvisualrange_ts_associatedrunwaydirection.runwayvisualrange_ts_id
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON runwayvisualrange_ts_associatedrunwaydirection.runwaydirection_pt_id = RunwayDirectionPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.runwayvisualrange_ts_annotation
ON airport_heliport.runwayvisualrange_ts.id = runwayvisualrange_ts_annotation.runwayvisualrange_ts_id
LEFT JOIN airport_heliport.runwayvisualrange_ts
ON runwayvisualrange_ts_annotation.note_pt_id = NotePropertyType.id
-- RunwayVisualRangeTimeSlicePropertyType
LEFT JOIN airport_heliport.runwayvisualrange_timeslice
ON airport_heliport.runwayvisualrange.id = runwayvisualrange_timeslice.runwayvisualrange_id
LEFT JOIN airport_heliport.runwayvisualrange
ON runwayvisualrange_timeslice.runwayvisualrange_tsp_id = RunwayVisualRangeTimeSlicePropertyType.id
;

SafeAltitudeArea
CREATE OR REPLACE VIEW safealtitudearea_view AS
SELECT
    jsonb_build_object(
       'id', procedure.safealtitudearea_pt.id,
       'nilReason', procedure.safealtitudearea_pt.nilReason,
       'href', procedure.safealtitudearea_pt.href,
       'id', procedure.safealtitudearea_tsp.id,
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
       'feature_lifetime_end', procedure.safealtitudearea_ts.feature_lifetime_end,
       'id', procedure.safealtitudearea.id,
       'identifier', procedure.safealtitudearea.identifier,
       'identifier_code_space', procedure.safealtitudearea.identifier_code_space,
       'xml_id', procedure.safealtitudearea.xml_id
    ) AS safealtitudearea
FROM

-- SafeAltitudeAreaTimeSliceType
LEFT JOIN procedure.safealtitudearea_tsp
ON procedure.safealtitudearea_tsp.safealtitudeareatimeslice_id = SafeAltitudeAreaTimeSliceType.id
-- DesignatedPointPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.centrepoint_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN procedure.safealtitudearea_ts
ON procedure.safealtitudearea_ts.abstractsafealtitudeareaextension_id = AbstractExtensionType.id

-- SafeAltitudeAreaSectorPropertyType
LEFT JOIN procedure.safealtitudearea_ts_sector
ON procedure.safealtitudearea_ts.id = safealtitudearea_ts_sector.safealtitudearea_ts_id
LEFT JOIN procedure.safealtitudearea_ts
ON safealtitudearea_ts_sector.safealtitudeareasector_pt_id = SafeAltitudeAreaSectorPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.safealtitudearea_ts_location
ON procedure.safealtitudearea_ts.id = safealtitudearea_ts_location.safealtitudearea_ts_id
LEFT JOIN procedure.safealtitudearea_ts
ON safealtitudearea_ts_location.airportheliport_pt_id = AirportHeliportPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.safealtitudearea_ts_annotation
ON procedure.safealtitudearea_ts.id = safealtitudearea_ts_annotation.safealtitudearea_ts_id
LEFT JOIN procedure.safealtitudearea_ts
ON safealtitudearea_ts_annotation.note_pt_id = NotePropertyType.id
-- SafeAltitudeAreaTimeSlicePropertyType
LEFT JOIN procedure.safealtitudearea_timeslice
ON procedure.safealtitudearea.id = safealtitudearea_timeslice.safealtitudearea_id
LEFT JOIN procedure.safealtitudearea
ON safealtitudearea_timeslice.safealtitudearea_tsp_id = SafeAltitudeAreaTimeSlicePropertyType.id
;

SafeAltitudeAreaSector
CREATE OR REPLACE VIEW safealtitudeareasector_view AS
SELECT
    jsonb_build_object(
       'id', procedure.safealtitudeareasector_pt.id,
       'bufferwidth_value', procedure.safealtitudeareasector.bufferwidth_value,
       'bufferwidth_uom', procedure.safealtitudeareasector.bufferwidth_uom,
       'bufferwidth_nilreason', procedure.safealtitudeareasector.bufferwidth_nilreason,
       'id', procedure.safealtitudeareasector.id,
       'identifier', procedure.safealtitudeareasector.identifier,
       'identifier_code_space', procedure.safealtitudeareasector.identifier_code_space,
       'xml_id', procedure.safealtitudeareasector.xml_id
    ) AS safealtitudeareasector
FROM

-- SafeAltitudeAreaSectorType
LEFT JOIN procedure.safealtitudeareasector_pt
ON procedure.safealtitudeareasector_pt.safealtitudeareasector_id = SafeAltitudeAreaSectorType.id
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
LEFT JOIN procedure.safealtitudeareasector_significantobstacle
ON procedure.safealtitudeareasector.id = safealtitudeareasector_significantobstacle.safealtitudeareasector_id
LEFT JOIN procedure.safealtitudeareasector
ON safealtitudeareasector_significantobstacle.obstruction_pt_id = ObstructionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.safealtitudeareasector_annotation
ON procedure.safealtitudeareasector.id = safealtitudeareasector_annotation.safealtitudeareasector_id
LEFT JOIN procedure.safealtitudeareasector
ON safealtitudeareasector_annotation.note_pt_id = NotePropertyType.id
;

SDF
CREATE OR REPLACE VIEW sdf_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.sdf_pt.id,
       'nilReason', navaids_points.sdf_pt.nilReason,
       'href', navaids_points.sdf_pt.href,
       'id', navaids_points.sdf_tsp.id,
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
       'feature_lifetime_end', navaids_points.sdf_ts.feature_lifetime_end,
       'id', navaids_points.sdf.id,
       'identifier', navaids_points.sdf.identifier,
       'identifier_code_space', navaids_points.sdf.identifier_code_space,
       'xml_id', navaids_points.sdf.xml_id
    ) AS sdf
FROM

-- SDFTimeSliceType
LEFT JOIN navaids_points.sdf_tsp
ON navaids_points.sdf_tsp.sdftimeslice_id = SDFTimeSliceType.id
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
LEFT JOIN navaids_points.sdf_ts_authority
ON navaids_points.sdf_ts.id = sdf_ts_authority.sdf_ts_id
LEFT JOIN navaids_points.sdf_ts
ON sdf_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.sdf_ts_monitoring
ON navaids_points.sdf_ts.id = sdf_ts_monitoring.sdf_ts_id
LEFT JOIN navaids_points.sdf_ts
ON sdf_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.sdf_ts_availability
ON navaids_points.sdf_ts.id = sdf_ts_availability.sdf_ts_id
LEFT JOIN navaids_points.sdf_ts
ON sdf_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.sdf_ts_annotation
ON navaids_points.sdf_ts.id = sdf_ts_annotation.sdf_ts_id
LEFT JOIN navaids_points.sdf_ts
ON sdf_ts_annotation.note_pt_id = NotePropertyType.id
-- SDFTimeSlicePropertyType
LEFT JOIN navaids_points.sdf_timeslice
ON navaids_points.sdf.id = sdf_timeslice.sdf_id
LEFT JOIN navaids_points.sdf
ON sdf_timeslice.sdf_tsp_id = SDFTimeSlicePropertyType.id
;

SeaplaneLandingArea
CREATE OR REPLACE VIEW seaplanelandingarea_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanelandingarea_pt.id,
       'nilReason', airport_heliport.seaplanelandingarea_pt.nilReason,
       'href', airport_heliport.seaplanelandingarea_pt.href,
       'id', airport_heliport.seaplanelandingarea_tsp.id,
       'id', airport_heliport.seaplanelandingarea_ts.id,
       'xml_id', airport_heliport.seaplanelandingarea_ts.xml_id,
       'interpretation', airport_heliport.seaplanelandingarea_ts.interpretation,
       'sequence_number', airport_heliport.seaplanelandingarea_ts.sequence_number,
       'correction_number', airport_heliport.seaplanelandingarea_ts.correction_number,
       'valid_time_begin', airport_heliport.seaplanelandingarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.seaplanelandingarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.seaplanelandingarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.seaplanelandingarea_ts.feature_lifetime_end,
       'id', airport_heliport.seaplanelandingarea.id,
       'identifier', airport_heliport.seaplanelandingarea.identifier,
       'identifier_code_space', airport_heliport.seaplanelandingarea.identifier_code_space,
       'xml_id', airport_heliport.seaplanelandingarea.xml_id
    ) AS seaplanelandingarea
FROM

-- SeaplaneLandingAreaTimeSliceType
LEFT JOIN airport_heliport.seaplanelandingarea_tsp
ON airport_heliport.seaplanelandingarea_tsp.seaplanelandingareatimeslice_id = SeaplaneLandingAreaTimeSliceType.id
-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON airport_heliport.seaplanelandingarea_ts.extent_id = ElevatedSurfacePropertyType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON airport_heliport.seaplanelandingarea_ts.abstractseaplanelandingareaextension_id = AbstractExtensionType.id

-- SeaplaneRampSitePropertyType
LEFT JOIN airport_heliport.seaplanelandingarea_ts_rampsite
ON airport_heliport.seaplanelandingarea_ts.id = seaplanelandingarea_ts_rampsite.seaplanelandingarea_ts_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON seaplanelandingarea_ts_rampsite.seaplanerampsite_pt_id = SeaplaneRampSitePropertyType.id
-- FloatingDockSitePropertyType
LEFT JOIN airport_heliport.seaplanelandingarea_ts_docksite
ON airport_heliport.seaplanelandingarea_ts.id = seaplanelandingarea_ts_docksite.seaplanelandingarea_ts_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON seaplanelandingarea_ts_docksite.floatingdocksite_pt_id = FloatingDockSitePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.seaplanelandingarea_ts_annotation
ON airport_heliport.seaplanelandingarea_ts.id = seaplanelandingarea_ts_annotation.seaplanelandingarea_ts_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON seaplanelandingarea_ts_annotation.note_pt_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.seaplanelandingarea_ts_availability
ON airport_heliport.seaplanelandingarea_ts.id = seaplanelandingarea_ts_availability.seaplanelandingarea_ts_id
LEFT JOIN airport_heliport.seaplanelandingarea_ts
ON seaplanelandingarea_ts_availability.manoeuvringareaavailability_pt_id = ManoeuvringAreaAvailabilityPropertyType.id
-- SeaplaneLandingAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.seaplanelandingarea_timeslice
ON airport_heliport.seaplanelandingarea.id = seaplanelandingarea_timeslice.seaplanelandingarea_id
LEFT JOIN airport_heliport.seaplanelandingarea
ON seaplanelandingarea_timeslice.seaplanelandingarea_tsp_id = SeaplaneLandingAreaTimeSlicePropertyType.id
;

SeaplaneRampSite
CREATE OR REPLACE VIEW seaplanerampsite_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.seaplanerampsite_pt.id,
       'nilReason', airport_heliport.seaplanerampsite_pt.nilReason,
       'href', airport_heliport.seaplanerampsite_pt.href,
       'id', airport_heliport.seaplanerampsite_tsp.id,
       'id', airport_heliport.seaplanerampsite_ts.id,
       'xml_id', airport_heliport.seaplanerampsite_ts.xml_id,
       'interpretation', airport_heliport.seaplanerampsite_ts.interpretation,
       'sequence_number', airport_heliport.seaplanerampsite_ts.sequence_number,
       'correction_number', airport_heliport.seaplanerampsite_ts.correction_number,
       'valid_time_begin', airport_heliport.seaplanerampsite_ts.valid_time_begin,
       'valid_time_end', airport_heliport.seaplanerampsite_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.seaplanerampsite_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.seaplanerampsite_ts.feature_lifetime_end,
       'id', airport_heliport.seaplanerampsite.id,
       'identifier', airport_heliport.seaplanerampsite.identifier,
       'identifier_code_space', airport_heliport.seaplanerampsite.identifier_code_space,
       'xml_id', airport_heliport.seaplanerampsite.xml_id
    ) AS seaplanerampsite
FROM

-- SeaplaneRampSiteTimeSliceType
LEFT JOIN airport_heliport.seaplanerampsite_tsp
ON airport_heliport.seaplanerampsite_tsp.seaplanerampsitetimeslice_id = SeaplaneRampSiteTimeSliceType.id
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
LEFT JOIN airport_heliport.seaplanerampsite_ts_annotation
ON airport_heliport.seaplanerampsite_ts.id = seaplanerampsite_ts_annotation.seaplanerampsite_ts_id
LEFT JOIN airport_heliport.seaplanerampsite_ts
ON seaplanerampsite_ts_annotation.note_pt_id = NotePropertyType.id
-- SeaplaneRampSiteTimeSlicePropertyType
LEFT JOIN airport_heliport.seaplanerampsite_timeslice
ON airport_heliport.seaplanerampsite.id = seaplanerampsite_timeslice.seaplanerampsite_id
LEFT JOIN airport_heliport.seaplanerampsite
ON seaplanerampsite_timeslice.seaplanerampsite_tsp_id = SeaplaneRampSiteTimeSlicePropertyType.id
;

SearchRescueService
CREATE OR REPLACE VIEW searchrescueservice_view AS
SELECT
    jsonb_build_object(
       'id', service.searchrescueservice_pt.id,
       'nilReason', service.searchrescueservice_pt.nilReason,
       'href', service.searchrescueservice_pt.href,
       'id', service.searchrescueservice_tsp.id,
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
       'feature_lifetime_end', service.searchrescueservice_ts.feature_lifetime_end,
       'id', service.searchrescueservice.id,
       'identifier', service.searchrescueservice.identifier,
       'identifier_code_space', service.searchrescueservice.identifier_code_space,
       'xml_id', service.searchrescueservice.xml_id
    ) AS searchrescueservice
FROM

-- SearchRescueServiceTimeSliceType
LEFT JOIN service.searchrescueservice_tsp
ON service.searchrescueservice_tsp.searchrescueservicetimeslice_id = SearchRescueServiceTimeSliceType.id
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

-- RadioCommunicationChannelPropertyType
LEFT JOIN service.searchrescueservice_ts_radiocommunication
ON service.searchrescueservice_ts.id = searchrescueservice_ts_radiocommunication.searchrescueservice_ts_id
LEFT JOIN service.searchrescueservice_ts
ON searchrescueservice_ts_radiocommunication.radiocommunicationchannel_pt_id = RadioCommunicationChannelPropertyType.id
-- ContactInformationPropertyType
LEFT JOIN service.searchrescueservice_ts_groundcommunication
ON service.searchrescueservice_ts.id = searchrescueservice_ts_groundcommunication.searchrescueservice_ts_id
LEFT JOIN service.searchrescueservice_ts
ON searchrescueservice_ts_groundcommunication.contactinformation_pt_id = ContactInformationPropertyType.id
-- ServiceOperationalStatusPropertyType
LEFT JOIN service.searchrescueservice_ts_availability
ON service.searchrescueservice_ts.id = searchrescueservice_ts_availability.searchrescueservice_ts_id
LEFT JOIN service.searchrescueservice_ts
ON searchrescueservice_ts_availability.serviceoperationalstatus_pt_id = ServiceOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN service.searchrescueservice_ts_annotation
ON service.searchrescueservice_ts.id = searchrescueservice_ts_annotation.searchrescueservice_ts_id
LEFT JOIN service.searchrescueservice_ts
ON searchrescueservice_ts_annotation.note_pt_id = NotePropertyType.id
-- AirspacePropertyType
LEFT JOIN service.searchrescuesearchrescueservice_ts_clientairspace
ON service.searchrescueservice_ts.id = searchrescuesearchrescueservice_ts_clientairspace.searchrescuesearchrescueservice_ts_id
LEFT JOIN service.searchrescueservice_ts
ON searchrescuesearchrescueservice_ts_clientairspace.airspace_pt_id = AirspacePropertyType.id
-- RoutePortionPropertyType
LEFT JOIN service.searchrescuesearchrescueservice_ts_clientroute
ON service.searchrescueservice_ts.id = searchrescuesearchrescueservice_ts_clientroute.searchrescuesearchrescueservice_ts_id
LEFT JOIN service.searchrescueservice_ts
ON searchrescuesearchrescueservice_ts_clientroute.routeportion_pt_id = RoutePortionPropertyType.id
-- SearchRescueServiceTimeSlicePropertyType
LEFT JOIN service.searchrescueservice_timeslice
ON service.searchrescueservice.id = searchrescueservice_timeslice.searchrescueservice_id
LEFT JOIN service.searchrescueservice
ON searchrescueservice_timeslice.searchrescueservice_tsp_id = SearchRescueServiceTimeSlicePropertyType.id
;

SecondarySurveillanceRadar
CREATE OR REPLACE VIEW secondarysurveillanceradar_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.secondarysurveillanceradar_pt.id,
       'nilReason', surveillance.secondarysurveillanceradar_pt.nilReason,
       'href', surveillance.secondarysurveillanceradar_pt.href,
       'id', surveillance.secondarysurveillanceradar_tsp.id,
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
       'feature_lifetime_end', surveillance.secondarysurveillanceradar_ts.feature_lifetime_end,
       'id', surveillance.secondarysurveillanceradar.id,
       'identifier', surveillance.secondarysurveillanceradar.identifier,
       'identifier_code_space', surveillance.secondarysurveillanceradar.identifier_code_space,
       'xml_id', surveillance.secondarysurveillanceradar.xml_id
    ) AS secondarysurveillanceradar
FROM

-- SecondarySurveillanceRadarTimeSliceType
LEFT JOIN surveillance.secondarysurveillanceradar_tsp
ON surveillance.secondarysurveillanceradar_tsp.secondarysurveillanceradartimeslice_id = SecondarySurveillanceRadarTimeSliceType.id
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
LEFT JOIN surveillance.secondarysurveillanceradar_ts_contact
ON surveillance.secondarysurveillanceradar_ts.id = secondarysurveillanceradar_ts_contact.secondarysurveillanceradar_ts_id
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON secondarysurveillanceradar_ts_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- NotePropertyType
LEFT JOIN surveillance.secondarysurveillanceradar_ts_annotation
ON surveillance.secondarysurveillanceradar_ts.id = secondarysurveillanceradar_ts_annotation.secondarysurveillanceradar_ts_id
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON secondarysurveillanceradar_ts_annotation.note_pt_id = NotePropertyType.id
-- SurveillanceGroundStationPropertyType
LEFT JOIN surveillance.secondarysurveillanceradar_ts_groundstation
ON surveillance.secondarysurveillanceradar_ts.id = secondarysurveillanceradar_ts_groundstation.secondarysurveillanceradar_ts_id
LEFT JOIN surveillance.secondarysurveillanceradar_ts
ON secondarysurveillanceradar_ts_groundstation.surveillancegroundstation_pt_id = SurveillanceGroundStationPropertyType.id
-- SecondarySurveillanceRadarTimeSlicePropertyType
LEFT JOIN surveillance.secondarysurveillanceradar_timeslice
ON surveillance.secondarysurveillanceradar.id = secondarysurveillanceradar_timeslice.secondarysurveillanceradar_id
LEFT JOIN surveillance.secondarysurveillanceradar
ON secondarysurveillanceradar_timeslice.secondarysurveillanceradar_tsp_id = SecondarySurveillanceRadarTimeSlicePropertyType.id
;

SectorDesign
CREATE OR REPLACE VIEW sectordesign_view AS
SELECT
    jsonb_build_object(
       'id', procedure.sectordesign_pt.id,
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
    ) AS sectordesign
FROM

-- SectorDesignType
LEFT JOIN procedure.sectordesign_pt
ON procedure.sectordesign_pt.sectordesign_id = SectorDesignType.id
-- AbstractExtensionType
LEFT JOIN procedure.sectordesign
ON procedure.sectordesign.abstractsectordesignextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN procedure.sectordesign_annotation
ON procedure.sectordesign.id = sectordesign_annotation.sectordesign_id
LEFT JOIN procedure.sectordesign
ON sectordesign_annotation.note_pt_id = NotePropertyType.id
;

SegmentLeg
CREATE OR REPLACE VIEW segmentleg_view AS
SELECT
    jsonb_build_object(
       'id', procedure.segmentleg_pt.id,
       'nilReason', procedure.segmentleg_pt.nilReason,
       'href', procedure.segmentleg_pt.href
    ) AS segmentleg
FROM


;

SegmentPoint
CREATE OR REPLACE VIEW segmentpoint_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.segmentpoint_pt.id
    ) AS segmentpoint
FROM


;

ServiceOperationalStatus
CREATE OR REPLACE VIEW serviceoperationalstatus_view AS
SELECT
    jsonb_build_object(
       'id', service.serviceoperationalstatus_pt.id,
       'operationalstatus_value', service.serviceoperationalstatus.operationalstatus_value,
       'operationalstatus_nilreason', service.serviceoperationalstatus.operationalstatus_nilreason,
       'id', service.serviceoperationalstatus.id,
       'identifier', service.serviceoperationalstatus.identifier,
       'identifier_code_space', service.serviceoperationalstatus.identifier_code_space,
       'xml_id', service.serviceoperationalstatus.xml_id
    ) AS serviceoperationalstatus
FROM

-- ServiceOperationalStatusType
LEFT JOIN service.serviceoperationalstatus_pt
ON service.serviceoperationalstatus_pt.serviceoperationalstatus_id = ServiceOperationalStatusType.id
-- AbstractExtensionType
LEFT JOIN service.serviceoperationalstatus
ON service.serviceoperationalstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN service.serviceoperationalstatus
ON service.serviceoperationalstatus.abstractserviceoperationalstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN service.serviceoperationalstatus_timeinterval
ON service.serviceoperationalstatus.id = serviceoperationalstatus_timeinterval.serviceoperationalstatus_id
LEFT JOIN service.serviceoperationalstatus
ON serviceoperationalstatus_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN service.serviceoperationalstatus_annotation
ON service.serviceoperationalstatus.id = serviceoperationalstatus_annotation.serviceoperationalstatus_id
LEFT JOIN service.serviceoperationalstatus
ON serviceoperationalstatus_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN service.serviceoperationalstatus_specialdateauthority
ON service.serviceoperationalstatus.id = serviceoperationalstatus_specialdateauthority.serviceoperationalstatus_id
LEFT JOIN service.serviceoperationalstatus
ON serviceoperationalstatus_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

Service
CREATE OR REPLACE VIEW service_view AS
SELECT
    jsonb_build_object(
       'id', service.service_pt.id,
       'nilReason', service.service_pt.nilReason,
       'href', service.service_pt.href
    ) AS service
FROM


;

SignificantPointInAirspace
CREATE OR REPLACE VIEW significantpointinairspace_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.significantpointinairspace_pt.id,
       'nilReason', navaids_points.significantpointinairspace_pt.nilReason,
       'href', navaids_points.significantpointinairspace_pt.href,
       'id', navaids_points.significantpointinairspace_tsp.id,
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
       'feature_lifetime_end', navaids_points.significantpointinairspace_ts.feature_lifetime_end,
       'id', navaids_points.significantpointinairspace.id,
       'identifier', navaids_points.significantpointinairspace.identifier,
       'identifier_code_space', navaids_points.significantpointinairspace.identifier_code_space,
       'xml_id', navaids_points.significantpointinairspace.xml_id
    ) AS significantpointinairspace
FROM

-- SignificantPointInAirspaceTimeSliceType
LEFT JOIN navaids_points.significantpointinairspace_tsp
ON navaids_points.significantpointinairspace_tsp.significantpointinairspacetimeslice_id = SignificantPointInAirspaceTimeSliceType.id
-- AirspacePropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.containingairspace_id = AirspacePropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.location_airportreferencepoint_id = AirportHeliportPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.significantpointinairspace_ts
ON navaids_points.significantpointinairspace_ts.abstractsignificantpointinairspaceextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.significantpointinsignificantpointinairspace_ts_annotation
ON navaids_points.significantpointinairspace_ts.id = significantpointinsignificantpointinairspace_ts_annotation.significantpointinsignificantpointinairspace_ts_id
LEFT JOIN navaids_points.significantpointinairspace_ts
ON significantpointinsignificantpointinairspace_ts_annotation.note_pt_id = NotePropertyType.id
-- SignificantPointInAirspaceTimeSlicePropertyType
LEFT JOIN navaids_points.significantpointinairspace_timeslice
ON navaids_points.significantpointinairspace.id = significantpointinairspace_timeslice.significantpointinairspace_id
LEFT JOIN navaids_points.significantpointinairspace
ON significantpointinairspace_timeslice.significantpointinairspace_tsp_id = SignificantPointInAirspaceTimeSlicePropertyType.id
;

SpecialDate
CREATE OR REPLACE VIEW specialdate_view AS
SELECT
    jsonb_build_object(
       'id', shared.specialdate_pt.id,
       'nilReason', shared.specialdate_pt.nilReason,
       'href', shared.specialdate_pt.href,
       'id', shared.specialdate_tsp.id,
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
       'feature_lifetime_end', shared.specialdate_ts.feature_lifetime_end,
       'id', shared.specialdate.id,
       'identifier', shared.specialdate.identifier,
       'identifier_code_space', shared.specialdate.identifier_code_space,
       'xml_id', shared.specialdate.xml_id
    ) AS specialdate
FROM

-- SpecialDateTimeSliceType
LEFT JOIN shared.specialdate_tsp
ON shared.specialdate_tsp.specialdatetimeslice_id = SpecialDateTimeSliceType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.specialdate_ts
ON shared.specialdate_ts.authority_id = OrganisationAuthorityPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.specialdate_ts
ON shared.specialdate_ts.abstractspecialdateextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.specialdate_ts_annotation
ON shared.specialdate_ts.id = specialdate_ts_annotation.specialdate_ts_id
LEFT JOIN shared.specialdate_ts
ON specialdate_ts_annotation.note_pt_id = NotePropertyType.id
-- SpecialDateTimeSlicePropertyType
LEFT JOIN shared.specialdate_timeslice
ON shared.specialdate.id = specialdate_timeslice.specialdate_id
LEFT JOIN shared.specialdate
ON specialdate_timeslice.specialdate_tsp_id = SpecialDateTimeSlicePropertyType.id
;

SpecialNavigationStation
CREATE OR REPLACE VIEW specialnavigationstation_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationstation_pt.id,
       'nilReason', navaids_points.specialnavigationstation_pt.nilReason,
       'href', navaids_points.specialnavigationstation_pt.href,
       'id', navaids_points.specialnavigationstation_tsp.id,
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
       'feature_lifetime_end', navaids_points.specialnavigationstation_ts.feature_lifetime_end,
       'id', navaids_points.specialnavigationstation.id,
       'identifier', navaids_points.specialnavigationstation.identifier,
       'identifier_code_space', navaids_points.specialnavigationstation.identifier_code_space,
       'xml_id', navaids_points.specialnavigationstation.xml_id
    ) AS specialnavigationstation
FROM

-- SpecialNavigationStationTimeSliceType
LEFT JOIN navaids_points.specialnavigationstation_tsp
ON navaids_points.specialnavigationstation_tsp.specialnavigationstationtimeslice_id = SpecialNavigationStationTimeSliceType.id
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
LEFT JOIN navaids_points.specialnavigationstation_ts_availability
ON navaids_points.specialnavigationstation_ts.id = specialnavigationstation_ts_availability.specialnavigationstation_ts_id
LEFT JOIN navaids_points.specialnavigationstation_ts
ON specialnavigationstation_ts_availability.specialnavigationstationstatus_pt_id = SpecialNavigationStationStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.specialnavigationstation_ts_annotation
ON navaids_points.specialnavigationstation_ts.id = specialnavigationstation_ts_annotation.specialnavigationstation_ts_id
LEFT JOIN navaids_points.specialnavigationstation_ts
ON specialnavigationstation_ts_annotation.note_pt_id = NotePropertyType.id
-- SpecialNavigationStationTimeSlicePropertyType
LEFT JOIN navaids_points.specialnavigationstation_timeslice
ON navaids_points.specialnavigationstation.id = specialnavigationstation_timeslice.specialnavigationstation_id
LEFT JOIN navaids_points.specialnavigationstation
ON specialnavigationstation_timeslice.specialnavigationstation_tsp_id = SpecialNavigationStationTimeSlicePropertyType.id
;

SpecialNavigationStationStatus
CREATE OR REPLACE VIEW specialnavigationstationstatus_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationstationstatus_pt.id,
       'operationalstatus_value', navaids_points.specialnavigationstationstatus.operationalstatus_value,
       'operationalstatus_nilreason', navaids_points.specialnavigationstationstatus.operationalstatus_nilreason,
       'id', navaids_points.specialnavigationstationstatus.id,
       'identifier', navaids_points.specialnavigationstationstatus.identifier,
       'identifier_code_space', navaids_points.specialnavigationstationstatus.identifier_code_space,
       'xml_id', navaids_points.specialnavigationstationstatus.xml_id
    ) AS specialnavigationstationstatus
FROM

-- SpecialNavigationStationStatusType
LEFT JOIN navaids_points.specialnavigationstationstatus_pt
ON navaids_points.specialnavigationstationstatus_pt.specialnavigationstationstatus_id = SpecialNavigationStationStatusType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.specialnavigationstationstatus
ON navaids_points.specialnavigationstationstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.specialnavigationstationstatus
ON navaids_points.specialnavigationstationstatus.abstractspecialnavigationstationstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN navaids_points.specialnavigationstationstatus_timeinterval
ON navaids_points.specialnavigationstationstatus.id = specialnavigationstationstatus_timeinterval.specialnavigationstationstatus_id
LEFT JOIN navaids_points.specialnavigationstationstatus
ON specialnavigationstationstatus_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.specialnavigationstationstatus_annotation
ON navaids_points.specialnavigationstationstatus.id = specialnavigationstationstatus_annotation.specialnavigationstationstatus_id
LEFT JOIN navaids_points.specialnavigationstationstatus
ON specialnavigationstationstatus_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN navaids_points.specialnavigationstationstatus_specialdateauthority
ON navaids_points.specialnavigationstationstatus.id = specialnavigationstationstatus_specialdateauthority.specialnavigationstationstatus_id
LEFT JOIN navaids_points.specialnavigationstationstatus
ON specialnavigationstationstatus_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

SpecialNavigationSystem
CREATE OR REPLACE VIEW specialnavigationsystem_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.specialnavigationsystem_pt.id,
       'nilReason', navaids_points.specialnavigationsystem_pt.nilReason,
       'href', navaids_points.specialnavigationsystem_pt.href,
       'id', navaids_points.specialnavigationsystem_tsp.id,
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
       'feature_lifetime_end', navaids_points.specialnavigationsystem_ts.feature_lifetime_end,
       'id', navaids_points.specialnavigationsystem.id,
       'identifier', navaids_points.specialnavigationsystem.identifier,
       'identifier_code_space', navaids_points.specialnavigationsystem.identifier_code_space,
       'xml_id', navaids_points.specialnavigationsystem.xml_id
    ) AS specialnavigationsystem
FROM

-- SpecialNavigationSystemTimeSliceType
LEFT JOIN navaids_points.specialnavigationsystem_tsp
ON navaids_points.specialnavigationsystem_tsp.specialnavigationsystemtimeslice_id = SpecialNavigationSystemTimeSliceType.id
-- AuthorityForSpecialNavigationSystemPropertyType
LEFT JOIN navaids_points.specialnavigationsystem_ts
ON navaids_points.specialnavigationsystem_ts.responsibleorganisation_id = AuthorityForSpecialNavigationSystemPropertyType.id
-- AbstractExtensionType
LEFT JOIN navaids_points.specialnavigationsystem_ts
ON navaids_points.specialnavigationsystem_ts.abstractspecialnavigationsystemextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN navaids_points.specialnavigationsystem_ts_annotation
ON navaids_points.specialnavigationsystem_ts.id = specialnavigationsystem_ts_annotation.specialnavigationsystem_ts_id
LEFT JOIN navaids_points.specialnavigationsystem_ts
ON specialnavigationsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- SpecialNavigationSystemTimeSlicePropertyType
LEFT JOIN navaids_points.specialnavigationsystem_timeslice
ON navaids_points.specialnavigationsystem.id = specialnavigationsystem_timeslice.specialnavigationsystem_id
LEFT JOIN navaids_points.specialnavigationsystem
ON specialnavigationsystem_timeslice.specialnavigationsystem_tsp_id = SpecialNavigationSystemTimeSlicePropertyType.id
;

StandardInstrumentArrival
CREATE OR REPLACE VIEW standardinstrumentarrival_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentarrival_pt.id,
       'nilReason', procedure.standardinstrumentarrival_pt.nilReason,
       'href', procedure.standardinstrumentarrival_pt.href,
       'id', procedure.standardinstrumentarrival_tsp.id,
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
       'feature_lifetime_end', procedure.standardinstrumentarrival_ts.feature_lifetime_end,
       'id', procedure.standardinstrumentarrival.id,
       'identifier', procedure.standardinstrumentarrival.identifier,
       'identifier_code_space', procedure.standardinstrumentarrival.identifier_code_space,
       'xml_id', procedure.standardinstrumentarrival.xml_id
    ) AS standardinstrumentarrival
FROM

-- StandardInstrumentArrivalTimeSliceType
LEFT JOIN procedure.standardinstrumentarrival_tsp
ON procedure.standardinstrumentarrival_tsp.standardinstrumentarrivaltimeslice_id = StandardInstrumentArrivalTimeSliceType.id
-- SpecialNavigationSystemPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.guidancefacility_specialnavigationsystem_id = SpecialNavigationSystemPropertyType.id
-- RadarSystemPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.guidancefacility_radar_id = RadarSystemPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts
ON procedure.standardinstrumentarrival_ts.guidancefacility_navaid_id = NavaidPropertyType.id
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
LEFT JOIN procedure.standardinstrumentarrival_ts_availability
ON procedure.standardinstrumentarrival_ts.id = standardinstrumentarrival_ts_availability.standardinstrumentarrival_ts_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON standardinstrumentarrival_ts_availability.procedureavailability_pt_id = ProcedureAvailabilityPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts_airportheliport
ON procedure.standardinstrumentarrival_ts.id = standardinstrumentarrival_ts_airportheliport.standardinstrumentarrival_ts_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON standardinstrumentarrival_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts_aircraftcharacteristic
ON procedure.standardinstrumentarrival_ts.id = standardinstrumentarrival_ts_aircraftcharacteristic.standardinstrumentarrival_ts_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON standardinstrumentarrival_ts_aircraftcharacteristic.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ProcedureTransitionPropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts_flighttransition
ON procedure.standardinstrumentarrival_ts.id = standardinstrumentarrival_ts_flighttransition.standardinstrumentarrival_ts_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON standardinstrumentarrival_ts_flighttransition.proceduretransition_pt_id = ProcedureTransitionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.standardinstrumentarrival_ts_annotation
ON procedure.standardinstrumentarrival_ts.id = standardinstrumentarrival_ts_annotation.standardinstrumentarrival_ts_id
LEFT JOIN procedure.standardinstrumentarrival_ts
ON standardinstrumentarrival_ts_annotation.note_pt_id = NotePropertyType.id
-- StandardInstrumentArrivalTimeSlicePropertyType
LEFT JOIN procedure.standardinstrumentarrival_timeslice
ON procedure.standardinstrumentarrival.id = standardinstrumentarrival_timeslice.standardinstrumentarrival_id
LEFT JOIN procedure.standardinstrumentarrival
ON standardinstrumentarrival_timeslice.standardinstrumentarrival_tsp_id = StandardInstrumentArrivalTimeSlicePropertyType.id
;

StandardInstrumentDeparture
CREATE OR REPLACE VIEW standardinstrumentdeparture_view AS
SELECT
    jsonb_build_object(
       'id', procedure.standardinstrumentdeparture_pt.id,
       'nilReason', procedure.standardinstrumentdeparture_pt.nilReason,
       'href', procedure.standardinstrumentdeparture_pt.href,
       'id', procedure.standardinstrumentdeparture_tsp.id,
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
       'feature_lifetime_end', procedure.standardinstrumentdeparture_ts.feature_lifetime_end,
       'id', procedure.standardinstrumentdeparture.id,
       'identifier', procedure.standardinstrumentdeparture.identifier,
       'identifier_code_space', procedure.standardinstrumentdeparture.identifier_code_space,
       'xml_id', procedure.standardinstrumentdeparture.xml_id
    ) AS standardinstrumentdeparture
FROM

-- StandardInstrumentDepartureTimeSliceType
LEFT JOIN procedure.standardinstrumentdeparture_tsp
ON procedure.standardinstrumentdeparture_tsp.standardinstrumentdeparturetimeslice_id = StandardInstrumentDepartureTimeSliceType.id
-- SpecialNavigationSystemPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.guidancefacility_specialnavigationsystem_id = SpecialNavigationSystemPropertyType.id
-- RadarSystemPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.guidancefacility_radar_id = RadarSystemPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON procedure.standardinstrumentdeparture_ts.guidancefacility_navaid_id = NavaidPropertyType.id
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
LEFT JOIN procedure.standardinstrumentdeparture_ts_availability
ON procedure.standardinstrumentdeparture_ts.id = standardinstrumentdeparture_ts_availability.standardinstrumentdeparture_ts_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON standardinstrumentdeparture_ts_availability.procedureavailability_pt_id = ProcedureAvailabilityPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts_airportheliport
ON procedure.standardinstrumentdeparture_ts.id = standardinstrumentdeparture_ts_airportheliport.standardinstrumentdeparture_ts_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON standardinstrumentdeparture_ts_airportheliport.airportheliport_pt_id = AirportHeliportPropertyType.id
-- AircraftCharacteristicPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts_aircraftcharacteristic
ON procedure.standardinstrumentdeparture_ts.id = standardinstrumentdeparture_ts_aircraftcharacteristic.standardinstrumentdeparture_ts_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON standardinstrumentdeparture_ts_aircraftcharacteristic.aircraftcharacteristic_pt_id = AircraftCharacteristicPropertyType.id
-- ProcedureTransitionPropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts_flighttransition
ON procedure.standardinstrumentdeparture_ts.id = standardinstrumentdeparture_ts_flighttransition.standardinstrumentdeparture_ts_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON standardinstrumentdeparture_ts_flighttransition.proceduretransition_pt_id = ProcedureTransitionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.standardinstrumentdeparture_ts_annotation
ON procedure.standardinstrumentdeparture_ts.id = standardinstrumentdeparture_ts_annotation.standardinstrumentdeparture_ts_id
LEFT JOIN procedure.standardinstrumentdeparture_ts
ON standardinstrumentdeparture_ts_annotation.note_pt_id = NotePropertyType.id
-- StandardInstrumentDepartureTimeSlicePropertyType
LEFT JOIN procedure.standardinstrumentdeparture_timeslice
ON procedure.standardinstrumentdeparture.id = standardinstrumentdeparture_timeslice.standardinstrumentdeparture_id
LEFT JOIN procedure.standardinstrumentdeparture
ON standardinstrumentdeparture_timeslice.standardinstrumentdeparture_tsp_id = StandardInstrumentDepartureTimeSlicePropertyType.id
;

StandardLevelColumn
CREATE OR REPLACE VIEW standardlevelcolumn_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelcolumn_pt.id,
       'nilReason', shared.standardlevelcolumn_pt.nilReason,
       'href', shared.standardlevelcolumn_pt.href,
       'id', shared.standardlevelcolumn_tsp.id,
       'series_value', shared.standardlevelcolumn_ts.series_value,
       'series_nilreason', shared.standardlevelcolumn_ts.series_nilreason,
       'unitofmeasurement_value', shared.standardlevelcolumn_ts.unitofmeasurement_value,
       'unitofmeasurement_nilreason', shared.standardlevelcolumn_ts.unitofmeasurement_nilreason,
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
       'feature_lifetime_end', shared.standardlevelcolumn_ts.feature_lifetime_end,
       'id', shared.standardlevelcolumn.id,
       'identifier', shared.standardlevelcolumn.identifier,
       'identifier_code_space', shared.standardlevelcolumn.identifier_code_space,
       'xml_id', shared.standardlevelcolumn.xml_id
    ) AS standardlevelcolumn
FROM

-- StandardLevelColumnTimeSliceType
LEFT JOIN shared.standardlevelcolumn_tsp
ON shared.standardlevelcolumn_tsp.standardlevelcolumntimeslice_id = StandardLevelColumnTimeSliceType.id
-- StandardLevelTablePropertyType
LEFT JOIN shared.standardlevelcolumn_ts
ON shared.standardlevelcolumn_ts.leveltable_id = StandardLevelTablePropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.standardlevelcolumn_ts
ON shared.standardlevelcolumn_ts.abstractstandardlevelcolumnextension_id = AbstractExtensionType.id

-- StandardLevelPropertyType
LEFT JOIN shared.standardlevelcolumn_ts_level
ON shared.standardlevelcolumn_ts.id = standardlevelcolumn_ts_level.standardlevelcolumn_ts_id
LEFT JOIN shared.standardlevelcolumn_ts
ON standardlevelcolumn_ts_level.standardlevel_pt_id = StandardLevelPropertyType.id
-- NotePropertyType
LEFT JOIN shared.standardlevelcolumn_ts_annotation
ON shared.standardlevelcolumn_ts.id = standardlevelcolumn_ts_annotation.standardlevelcolumn_ts_id
LEFT JOIN shared.standardlevelcolumn_ts
ON standardlevelcolumn_ts_annotation.note_pt_id = NotePropertyType.id
-- StandardLevelColumnTimeSlicePropertyType
LEFT JOIN shared.standardlevelcolumn_timeslice
ON shared.standardlevelcolumn.id = standardlevelcolumn_timeslice.standardlevelcolumn_id
LEFT JOIN shared.standardlevelcolumn
ON standardlevelcolumn_timeslice.standardlevelcolumn_tsp_id = StandardLevelColumnTimeSlicePropertyType.id
;

StandardLevel
CREATE OR REPLACE VIEW standardlevel_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevel_pt.id,
       'verticaldistance_value', shared.standardlevel.verticaldistance_value,
       'verticaldistance_uom', shared.standardlevel.verticaldistance_uom,
       'verticaldistance_nilreason', shared.standardlevel.verticaldistance_nilreason,
       'id', shared.standardlevel.id,
       'identifier', shared.standardlevel.identifier,
       'identifier_code_space', shared.standardlevel.identifier_code_space,
       'xml_id', shared.standardlevel.xml_id
    ) AS standardlevel
FROM

-- StandardLevelType
LEFT JOIN shared.standardlevel_pt
ON shared.standardlevel_pt.standardlevel_id = StandardLevelType.id
-- AbstractExtensionType
LEFT JOIN shared.standardlevel
ON shared.standardlevel.abstractstandardlevelextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.standardlevel_annotation
ON shared.standardlevel.id = standardlevel_annotation.standardlevel_id
LEFT JOIN shared.standardlevel
ON standardlevel_annotation.note_pt_id = NotePropertyType.id
;

StandardLevelSector
CREATE OR REPLACE VIEW standardlevelsector_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardlevelsector_pt.id,
       'nilReason', shared.standardlevelsector_pt.nilReason,
       'href', shared.standardlevelsector_pt.href,
       'id', shared.standardlevelsector_tsp.id,
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
       'feature_lifetime_end', shared.standardlevelsector_ts.feature_lifetime_end,
       'id', shared.standardlevelsector.id,
       'identifier', shared.standardlevelsector.identifier,
       'identifier_code_space', shared.standardlevelsector.identifier_code_space,
       'xml_id', shared.standardlevelsector.xml_id
    ) AS standardlevelsector
FROM

-- StandardLevelSectorTimeSliceType
LEFT JOIN shared.standardlevelsector_tsp
ON shared.standardlevelsector_tsp.standardlevelsectortimeslice_id = StandardLevelSectorTimeSliceType.id
-- StandardLevelColumnPropertyType
LEFT JOIN shared.standardlevelsector_ts
ON shared.standardlevelsector_ts.applicablelevelcolumn_id = StandardLevelColumnPropertyType.id
-- AbstractExtensionType
LEFT JOIN shared.standardlevelsector_ts
ON shared.standardlevelsector_ts.abstractstandardlevelsectorextension_id = AbstractExtensionType.id

-- AirspacePropertyType
LEFT JOIN shared.standardlevelsector_ts_applicableairspace
ON shared.standardlevelsector_ts.id = standardlevelsector_ts_applicableairspace.standardlevelsector_ts_id
LEFT JOIN shared.standardlevelsector_ts
ON standardlevelsector_ts_applicableairspace.airspace_pt_id = AirspacePropertyType.id
-- NotePropertyType
LEFT JOIN shared.standardlevelsector_ts_annotation
ON shared.standardlevelsector_ts.id = standardlevelsector_ts_annotation.standardlevelsector_ts_id
LEFT JOIN shared.standardlevelsector_ts
ON standardlevelsector_ts_annotation.note_pt_id = NotePropertyType.id
-- StandardLevelSectorTimeSlicePropertyType
LEFT JOIN shared.standardlevelsector_timeslice
ON shared.standardlevelsector.id = standardlevelsector_timeslice.standardlevelsector_id
LEFT JOIN shared.standardlevelsector
ON standardlevelsector_timeslice.standardlevelsector_tsp_id = StandardLevelSectorTimeSlicePropertyType.id
;

StandardLevelTable
CREATE OR REPLACE VIEW standardleveltable_view AS
SELECT
    jsonb_build_object(
       'id', shared.standardleveltable_pt.id,
       'nilReason', shared.standardleveltable_pt.nilReason,
       'href', shared.standardleveltable_pt.href,
       'id', shared.standardleveltable_tsp.id,
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
       'feature_lifetime_end', shared.standardleveltable_ts.feature_lifetime_end,
       'id', shared.standardleveltable.id,
       'identifier', shared.standardleveltable.identifier,
       'identifier_code_space', shared.standardleveltable.identifier_code_space,
       'xml_id', shared.standardleveltable.xml_id
    ) AS standardleveltable
FROM

-- StandardLevelTableTimeSliceType
LEFT JOIN shared.standardleveltable_tsp
ON shared.standardleveltable_tsp.standardleveltabletimeslice_id = StandardLevelTableTimeSliceType.id
-- AbstractExtensionType
LEFT JOIN shared.standardleveltable_ts
ON shared.standardleveltable_ts.abstractstandardleveltableextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.standardleveltable_ts_annotation
ON shared.standardleveltable_ts.id = standardleveltable_ts_annotation.standardleveltable_ts_id
LEFT JOIN shared.standardleveltable_ts
ON standardleveltable_ts_annotation.note_pt_id = NotePropertyType.id
-- StandardLevelTableTimeSlicePropertyType
LEFT JOIN shared.standardleveltable_timeslice
ON shared.standardleveltable.id = standardleveltable_timeslice.standardleveltable_id
LEFT JOIN shared.standardleveltable
ON standardleveltable_timeslice.standardleveltable_tsp_id = StandardLevelTableTimeSlicePropertyType.id
;

StandMarking
CREATE OR REPLACE VIEW standmarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.standmarking_pt.id,
       'nilReason', airport_heliport.standmarking_pt.nilReason,
       'href', airport_heliport.standmarking_pt.href,
       'id', airport_heliport.standmarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.standmarking_ts.feature_lifetime_end,
       'id', airport_heliport.standmarking.id,
       'identifier', airport_heliport.standmarking.identifier,
       'identifier_code_space', airport_heliport.standmarking.identifier_code_space,
       'xml_id', airport_heliport.standmarking.xml_id
    ) AS standmarking
FROM

-- StandMarkingTimeSliceType
LEFT JOIN airport_heliport.standmarking_tsp
ON airport_heliport.standmarking_tsp.standmarkingtimeslice_id = StandMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.standmarking_ts_element
ON airport_heliport.standmarking_ts.id = standmarking_ts_element.standmarking_ts_id
LEFT JOIN airport_heliport.standmarking_ts
ON standmarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.standmarking_ts_annotation
ON airport_heliport.standmarking_ts.id = standmarking_ts_annotation.standmarking_ts_id
LEFT JOIN airport_heliport.standmarking_ts
ON standmarking_ts_annotation.note_pt_id = NotePropertyType.id
-- StandMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.standmarking_timeslice
ON airport_heliport.standmarking.id = standmarking_timeslice.standmarking_id
LEFT JOIN airport_heliport.standmarking
ON standmarking_timeslice.standmarking_tsp_id = StandMarkingTimeSlicePropertyType.id
;

SurfaceCharacteristics
CREATE OR REPLACE VIEW surfacecharacteristics_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surfacecharacteristics_pt.id,
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
    ) AS surfacecharacteristics
FROM

-- SurfaceCharacteristicsType
LEFT JOIN airport_heliport.surfacecharacteristics_pt
ON airport_heliport.surfacecharacteristics_pt.surfacecharacteristics_id = SurfaceCharacteristicsType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.surfacecharacteristics
ON airport_heliport.surfacecharacteristics.abstractsurfacecharacteristicsextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN airport_heliport.surfacecharacteristics_annotation
ON airport_heliport.surfacecharacteristics.id = surfacecharacteristics_annotation.surfacecharacteristics_id
LEFT JOIN airport_heliport.surfacecharacteristics
ON surfacecharacteristics_annotation.note_pt_id = NotePropertyType.id
;

SurfaceContaminationLayer
CREATE OR REPLACE VIEW surfacecontaminationlayer_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surfacecontaminationlayer_pt.id,
       'layerorder_value', airport_heliport.surfacecontaminationlayer.layerorder_value,
       'layerorder_nilreason', airport_heliport.surfacecontaminationlayer.layerorder_nilreason,
       'type_value', airport_heliport.surfacecontaminationlayer.type_value,
       'type_nilreason', airport_heliport.surfacecontaminationlayer.type_nilreason,
       'id', airport_heliport.surfacecontaminationlayer.id,
       'identifier', airport_heliport.surfacecontaminationlayer.identifier,
       'identifier_code_space', airport_heliport.surfacecontaminationlayer.identifier_code_space,
       'xml_id', airport_heliport.surfacecontaminationlayer.xml_id
    ) AS surfacecontaminationlayer
FROM

-- SurfaceContaminationLayerType
LEFT JOIN airport_heliport.surfacecontaminationlayer_pt
ON airport_heliport.surfacecontaminationlayer_pt.surfacecontaminationlayer_id = SurfaceContaminationLayerType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.surfacecontaminationlayer
ON airport_heliport.surfacecontaminationlayer.abstractsurfacecontaminationlayerextension_id = AbstractExtensionType.id

-- ElevatedSurfacePropertyType
LEFT JOIN airport_heliport.surfacecontaminationlayer_extent
ON airport_heliport.surfacecontaminationlayer.id = surfacecontaminationlayer_extent.surfacecontaminationlayer_id
LEFT JOIN airport_heliport.surfacecontaminationlayer
ON surfacecontaminationlayer_extent.elevatedsurface_pt_id = ElevatedSurfacePropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.surfacecontaminationlayer_annotation
ON airport_heliport.surfacecontaminationlayer.id = surfacecontaminationlayer_annotation.surfacecontaminationlayer_id
LEFT JOIN airport_heliport.surfacecontaminationlayer
ON surfacecontaminationlayer_annotation.note_pt_id = NotePropertyType.id
;

SurfaceContamination
CREATE OR REPLACE VIEW surfacecontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surfacecontamination_pt.id
    ) AS surfacecontamination
FROM


;

SurveillanceGroundStation
CREATE OR REPLACE VIEW surveillancegroundstation_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.surveillancegroundstation_pt.id,
       'videomap_value', surveillance.surveillancegroundstation.videomap_value,
       'videomap_nilreason', surveillance.surveillancegroundstation.videomap_nilreason,
       'id', surveillance.surveillancegroundstation.id,
       'identifier', surveillance.surveillancegroundstation.identifier,
       'identifier_code_space', surveillance.surveillancegroundstation.identifier_code_space,
       'xml_id', surveillance.surveillancegroundstation.xml_id
    ) AS surveillancegroundstation
FROM

-- SurveillanceGroundStationType
LEFT JOIN surveillance.surveillancegroundstation_pt
ON surveillance.surveillancegroundstation_pt.surveillancegroundstation_id = SurveillanceGroundStationType.id
-- UnitPropertyType
LEFT JOIN surveillance.surveillancegroundstation
ON surveillance.surveillancegroundstation.theunit_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN surveillance.surveillancegroundstation
ON surveillance.surveillancegroundstation.abstractsurveillancegroundstationextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN surveillance.surveillancegroundstation_annotation
ON surveillance.surveillancegroundstation.id = surveillancegroundstation_annotation.surveillancegroundstation_id
LEFT JOIN surveillance.surveillancegroundstation
ON surveillancegroundstation_annotation.note_pt_id = NotePropertyType.id
;

SurveillanceRadar
CREATE OR REPLACE VIEW surveillanceradar_view AS
SELECT
    jsonb_build_object(
       'id', surveillance.surveillanceradar_pt.id,
       'nilReason', surveillance.surveillanceradar_pt.nilReason,
       'href', surveillance.surveillanceradar_pt.href
    ) AS surveillanceradar
FROM


;

SurveyControlPoint
CREATE OR REPLACE VIEW surveycontrolpoint_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.surveycontrolpoint_pt.id,
       'nilReason', airport_heliport.surveycontrolpoint_pt.nilReason,
       'href', airport_heliport.surveycontrolpoint_pt.href,
       'id', airport_heliport.surveycontrolpoint_tsp.id,
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
       'feature_lifetime_end', airport_heliport.surveycontrolpoint_ts.feature_lifetime_end,
       'id', airport_heliport.surveycontrolpoint.id,
       'identifier', airport_heliport.surveycontrolpoint.identifier,
       'identifier_code_space', airport_heliport.surveycontrolpoint.identifier_code_space,
       'xml_id', airport_heliport.surveycontrolpoint.xml_id
    ) AS surveycontrolpoint
FROM

-- SurveyControlPointTimeSliceType
LEFT JOIN airport_heliport.surveycontrolpoint_tsp
ON airport_heliport.surveycontrolpoint_tsp.surveycontrolpointtimeslice_id = SurveyControlPointTimeSliceType.id
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
LEFT JOIN airport_heliport.surveycontrolpoint_ts_annotation
ON airport_heliport.surveycontrolpoint_ts.id = surveycontrolpoint_ts_annotation.surveycontrolpoint_ts_id
LEFT JOIN airport_heliport.surveycontrolpoint_ts
ON surveycontrolpoint_ts_annotation.note_pt_id = NotePropertyType.id
-- SurveyControlPointTimeSlicePropertyType
LEFT JOIN airport_heliport.surveycontrolpoint_timeslice
ON airport_heliport.surveycontrolpoint.id = surveycontrolpoint_timeslice.surveycontrolpoint_id
LEFT JOIN airport_heliport.surveycontrolpoint
ON surveycontrolpoint_timeslice.surveycontrolpoint_tsp_id = SurveyControlPointTimeSlicePropertyType.id
;

TACAN
CREATE OR REPLACE VIEW tacan_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.tacan_pt.id,
       'nilReason', navaids_points.tacan_pt.nilReason,
       'href', navaids_points.tacan_pt.href,
       'id', navaids_points.tacan_tsp.id,
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
       'feature_lifetime_end', navaids_points.tacan_ts.feature_lifetime_end,
       'id', navaids_points.tacan.id,
       'identifier', navaids_points.tacan.identifier,
       'identifier_code_space', navaids_points.tacan.identifier_code_space,
       'xml_id', navaids_points.tacan.xml_id
    ) AS tacan
FROM

-- TACANTimeSliceType
LEFT JOIN navaids_points.tacan_tsp
ON navaids_points.tacan_tsp.tacantimeslice_id = TACANTimeSliceType.id
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
LEFT JOIN navaids_points.tacan_ts_authority
ON navaids_points.tacan_ts.id = tacan_ts_authority.tacan_ts_id
LEFT JOIN navaids_points.tacan_ts
ON tacan_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.tacan_ts_monitoring
ON navaids_points.tacan_ts.id = tacan_ts_monitoring.tacan_ts_id
LEFT JOIN navaids_points.tacan_ts
ON tacan_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.tacan_ts_availability
ON navaids_points.tacan_ts.id = tacan_ts_availability.tacan_ts_id
LEFT JOIN navaids_points.tacan_ts
ON tacan_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.tacan_ts_annotation
ON navaids_points.tacan_ts.id = tacan_ts_annotation.tacan_ts_id
LEFT JOIN navaids_points.tacan_ts
ON tacan_ts_annotation.note_pt_id = NotePropertyType.id
-- TACANTimeSlicePropertyType
LEFT JOIN navaids_points.tacan_timeslice
ON navaids_points.tacan.id = tacan_timeslice.tacan_id
LEFT JOIN navaids_points.tacan
ON tacan_timeslice.tacan_tsp_id = TACANTimeSlicePropertyType.id
;

TaxiHoldingPositionLightSystem
CREATE OR REPLACE VIEW taxiholdingpositionlightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionlightsystem_pt.id,
       'nilReason', airport_heliport.taxiholdingpositionlightsystem_pt.nilReason,
       'href', airport_heliport.taxiholdingpositionlightsystem_pt.href,
       'id', airport_heliport.taxiholdingpositionlightsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.taxiholdingpositionlightsystem_ts.feature_lifetime_end,
       'id', airport_heliport.taxiholdingpositionlightsystem.id,
       'identifier', airport_heliport.taxiholdingpositionlightsystem.identifier,
       'identifier_code_space', airport_heliport.taxiholdingpositionlightsystem.identifier_code_space,
       'xml_id', airport_heliport.taxiholdingpositionlightsystem.xml_id
    ) AS taxiholdingpositionlightsystem
FROM

-- TaxiHoldingPositionLightSystemTimeSliceType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_tsp
ON airport_heliport.taxiholdingpositionlightsystem_tsp.taxiholdingpositionlightsystemtimeslice_id = TaxiHoldingPositionLightSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts_element
ON airport_heliport.taxiholdingpositionlightsystem_ts.id = taxiholdingpositionlightsystem_ts_element.taxiholdingpositionlightsystem_ts_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON taxiholdingpositionlightsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts_availability
ON airport_heliport.taxiholdingpositionlightsystem_ts.id = taxiholdingpositionlightsystem_ts_availability.taxiholdingpositionlightsystem_ts_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON taxiholdingpositionlightsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts_annotation
ON airport_heliport.taxiholdingpositionlightsystem_ts.id = taxiholdingpositionlightsystem_ts_annotation.taxiholdingpositionlightsystem_ts_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_ts
ON taxiholdingpositionlightsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- TaxiHoldingPositionLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem_timeslice
ON airport_heliport.taxiholdingpositionlightsystem.id = taxiholdingpositionlightsystem_timeslice.taxiholdingpositionlightsystem_id
LEFT JOIN airport_heliport.taxiholdingpositionlightsystem
ON taxiholdingpositionlightsystem_timeslice.taxiholdingpositionlightsystem_tsp_id = TaxiHoldingPositionLightSystemTimeSlicePropertyType.id
;

TaxiHoldingPositionMarking
CREATE OR REPLACE VIEW taxiholdingpositionmarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingpositionmarking_pt.id,
       'nilReason', airport_heliport.taxiholdingpositionmarking_pt.nilReason,
       'href', airport_heliport.taxiholdingpositionmarking_pt.href,
       'id', airport_heliport.taxiholdingpositionmarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.taxiholdingpositionmarking_ts.feature_lifetime_end,
       'id', airport_heliport.taxiholdingpositionmarking.id,
       'identifier', airport_heliport.taxiholdingpositionmarking.identifier,
       'identifier_code_space', airport_heliport.taxiholdingpositionmarking.identifier_code_space,
       'xml_id', airport_heliport.taxiholdingpositionmarking.xml_id
    ) AS taxiholdingpositionmarking
FROM

-- TaxiHoldingPositionMarkingTimeSliceType
LEFT JOIN airport_heliport.taxiholdingpositionmarking_tsp
ON airport_heliport.taxiholdingpositionmarking_tsp.taxiholdingpositionmarkingtimeslice_id = TaxiHoldingPositionMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts_element
ON airport_heliport.taxiholdingpositionmarking_ts.id = taxiholdingpositionmarking_ts_element.taxiholdingpositionmarking_ts_id
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts
ON taxiholdingpositionmarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts_annotation
ON airport_heliport.taxiholdingpositionmarking_ts.id = taxiholdingpositionmarking_ts_annotation.taxiholdingpositionmarking_ts_id
LEFT JOIN airport_heliport.taxiholdingpositionmarking_ts
ON taxiholdingpositionmarking_ts_annotation.note_pt_id = NotePropertyType.id
-- TaxiHoldingPositionMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.taxiholdingpositionmarking_timeslice
ON airport_heliport.taxiholdingpositionmarking.id = taxiholdingpositionmarking_timeslice.taxiholdingpositionmarking_id
LEFT JOIN airport_heliport.taxiholdingpositionmarking
ON taxiholdingpositionmarking_timeslice.taxiholdingpositionmarking_tsp_id = TaxiHoldingPositionMarkingTimeSlicePropertyType.id
;

TaxiHoldingPosition
CREATE OR REPLACE VIEW taxiholdingposition_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiholdingposition_pt.id,
       'nilReason', airport_heliport.taxiholdingposition_pt.nilReason,
       'href', airport_heliport.taxiholdingposition_pt.href,
       'id', airport_heliport.taxiholdingposition_tsp.id,
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
       'feature_lifetime_end', airport_heliport.taxiholdingposition_ts.feature_lifetime_end,
       'id', airport_heliport.taxiholdingposition.id,
       'identifier', airport_heliport.taxiholdingposition.identifier,
       'identifier_code_space', airport_heliport.taxiholdingposition.identifier_code_space,
       'xml_id', airport_heliport.taxiholdingposition.xml_id
    ) AS taxiholdingposition
FROM

-- TaxiHoldingPositionTimeSliceType
LEFT JOIN airport_heliport.taxiholdingposition_tsp
ON airport_heliport.taxiholdingposition_tsp.taxiholdingpositiontimeslice_id = TaxiHoldingPositionTimeSliceType.id
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
LEFT JOIN airport_heliport.taxiholdingposition_ts_protectedrunway
ON airport_heliport.taxiholdingposition_ts.id = taxiholdingposition_ts_protectedrunway.taxiholdingposition_ts_id
LEFT JOIN airport_heliport.taxiholdingposition_ts
ON taxiholdingposition_ts_protectedrunway.runway_pt_id = RunwayPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.taxiholdingposition_ts_annotation
ON airport_heliport.taxiholdingposition_ts.id = taxiholdingposition_ts_annotation.taxiholdingposition_ts_id
LEFT JOIN airport_heliport.taxiholdingposition_ts
ON taxiholdingposition_ts_annotation.note_pt_id = NotePropertyType.id
-- TaxiHoldingPositionTimeSlicePropertyType
LEFT JOIN airport_heliport.taxiholdingposition_timeslice
ON airport_heliport.taxiholdingposition.id = taxiholdingposition_timeslice.taxiholdingposition_id
LEFT JOIN airport_heliport.taxiholdingposition
ON taxiholdingposition_timeslice.taxiholdingposition_tsp_id = TaxiHoldingPositionTimeSlicePropertyType.id
;

TaxiwayContamination
CREATE OR REPLACE VIEW taxiwaycontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaycontamination_pt.id,
       'observationtime_value', airport_heliport.taxiwaycontamination.observationtime_value,
       'observationtime_nilreason', airport_heliport.taxiwaycontamination.observationtime_nilreason,
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
       'nextobservationtime_value', airport_heliport.taxiwaycontamination.nextobservationtime_value,
       'nextobservationtime_nilreason', airport_heliport.taxiwaycontamination.nextobservationtime_nilreason,
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
    ) AS taxiwaycontamination
FROM

-- TaxiwayContaminationType
LEFT JOIN airport_heliport.taxiwaycontamination_pt
ON airport_heliport.taxiwaycontamination_pt.taxiwaycontamination_id = TaxiwayContaminationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaycontamination
ON airport_heliport.taxiwaycontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.taxiwaycontamination
ON airport_heliport.taxiwaycontamination.abstracttaxiwaycontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.taxiwaycontamination_criticalridge
ON airport_heliport.taxiwaycontamination.id = taxiwaycontamination_criticalridge.taxiwaycontamination_id
LEFT JOIN airport_heliport.taxiwaycontamination
ON taxiwaycontamination_criticalridge.ridge_pt_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.taxiwaycontamination_layer
ON airport_heliport.taxiwaycontamination.id = taxiwaycontamination_layer.taxiwaycontamination_id
LEFT JOIN airport_heliport.taxiwaycontamination
ON taxiwaycontamination_layer.surfacecontaminationlayer_pt_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.taxiwaycontamination_annotation
ON airport_heliport.taxiwaycontamination.id = taxiwaycontamination_annotation.taxiwaycontamination_id
LEFT JOIN airport_heliport.taxiwaycontamination
ON taxiwaycontamination_annotation.note_pt_id = NotePropertyType.id
;

TaxiwayElement
CREATE OR REPLACE VIEW taxiwayelement_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwayelement_pt.id,
       'nilReason', airport_heliport.taxiwayelement_pt.nilReason,
       'href', airport_heliport.taxiwayelement_pt.href,
       'id', airport_heliport.taxiwayelement_tsp.id,
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
       'feature_lifetime_end', airport_heliport.taxiwayelement_ts.feature_lifetime_end,
       'id', airport_heliport.taxiwayelement.id,
       'identifier', airport_heliport.taxiwayelement.identifier,
       'identifier_code_space', airport_heliport.taxiwayelement.identifier_code_space,
       'xml_id', airport_heliport.taxiwayelement.xml_id
    ) AS taxiwayelement
FROM

-- TaxiwayElementTimeSliceType
LEFT JOIN airport_heliport.taxiwayelement_tsp
ON airport_heliport.taxiwayelement_tsp.taxiwayelementtimeslice_id = TaxiwayElementTimeSliceType.id
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
LEFT JOIN airport_heliport.taxiwayelement_ts_annotation
ON airport_heliport.taxiwayelement_ts.id = taxiwayelement_ts_annotation.taxiwayelement_ts_id
LEFT JOIN airport_heliport.taxiwayelement_ts
ON taxiwayelement_ts_annotation.note_pt_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.taxiwayelement_ts_availability
ON airport_heliport.taxiwayelement_ts.id = taxiwayelement_ts_availability.taxiwayelement_ts_id
LEFT JOIN airport_heliport.taxiwayelement_ts
ON taxiwayelement_ts_availability.manoeuvringareaavailability_pt_id = ManoeuvringAreaAvailabilityPropertyType.id
-- TaxiwayElementTimeSlicePropertyType
LEFT JOIN airport_heliport.taxiwayelement_timeslice
ON airport_heliport.taxiwayelement.id = taxiwayelement_timeslice.taxiwayelement_id
LEFT JOIN airport_heliport.taxiwayelement
ON taxiwayelement_timeslice.taxiwayelement_tsp_id = TaxiwayElementTimeSlicePropertyType.id
;

TaxiwayLightSystem
CREATE OR REPLACE VIEW taxiwaylightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaylightsystem_pt.id,
       'nilReason', airport_heliport.taxiwaylightsystem_pt.nilReason,
       'href', airport_heliport.taxiwaylightsystem_pt.href,
       'id', airport_heliport.taxiwaylightsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.taxiwaylightsystem_ts.feature_lifetime_end,
       'id', airport_heliport.taxiwaylightsystem.id,
       'identifier', airport_heliport.taxiwaylightsystem.identifier,
       'identifier_code_space', airport_heliport.taxiwaylightsystem.identifier_code_space,
       'xml_id', airport_heliport.taxiwaylightsystem.xml_id
    ) AS taxiwaylightsystem
FROM

-- TaxiwayLightSystemTimeSliceType
LEFT JOIN airport_heliport.taxiwaylightsystem_tsp
ON airport_heliport.taxiwaylightsystem_tsp.taxiwaylightsystemtimeslice_id = TaxiwayLightSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.taxiwaylightsystem_ts_element
ON airport_heliport.taxiwaylightsystem_ts.id = taxiwaylightsystem_ts_element.taxiwaylightsystem_ts_id
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON taxiwaylightsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.taxiwaylightsystem_ts_availability
ON airport_heliport.taxiwaylightsystem_ts.id = taxiwaylightsystem_ts_availability.taxiwaylightsystem_ts_id
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON taxiwaylightsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.taxiwaylightsystem_ts_annotation
ON airport_heliport.taxiwaylightsystem_ts.id = taxiwaylightsystem_ts_annotation.taxiwaylightsystem_ts_id
LEFT JOIN airport_heliport.taxiwaylightsystem_ts
ON taxiwaylightsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- TaxiwayLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.taxiwaylightsystem_timeslice
ON airport_heliport.taxiwaylightsystem.id = taxiwaylightsystem_timeslice.taxiwaylightsystem_id
LEFT JOIN airport_heliport.taxiwaylightsystem
ON taxiwaylightsystem_timeslice.taxiwaylightsystem_tsp_id = TaxiwayLightSystemTimeSlicePropertyType.id
;

TaxiwayMarking
CREATE OR REPLACE VIEW taxiwaymarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiwaymarking_pt.id,
       'nilReason', airport_heliport.taxiwaymarking_pt.nilReason,
       'href', airport_heliport.taxiwaymarking_pt.href,
       'id', airport_heliport.taxiwaymarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.taxiwaymarking_ts.feature_lifetime_end,
       'id', airport_heliport.taxiwaymarking.id,
       'identifier', airport_heliport.taxiwaymarking.identifier,
       'identifier_code_space', airport_heliport.taxiwaymarking.identifier_code_space,
       'xml_id', airport_heliport.taxiwaymarking.xml_id
    ) AS taxiwaymarking
FROM

-- TaxiwayMarkingTimeSliceType
LEFT JOIN airport_heliport.taxiwaymarking_tsp
ON airport_heliport.taxiwaymarking_tsp.taxiwaymarkingtimeslice_id = TaxiwayMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.taxiwaymarking_ts_element
ON airport_heliport.taxiwaymarking_ts.id = taxiwaymarking_ts_element.taxiwaymarking_ts_id
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON taxiwaymarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.taxiwaymarking_ts_annotation
ON airport_heliport.taxiwaymarking_ts.id = taxiwaymarking_ts_annotation.taxiwaymarking_ts_id
LEFT JOIN airport_heliport.taxiwaymarking_ts
ON taxiwaymarking_ts_annotation.note_pt_id = NotePropertyType.id
-- TaxiwayMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.taxiwaymarking_timeslice
ON airport_heliport.taxiwaymarking.id = taxiwaymarking_timeslice.taxiwaymarking_id
LEFT JOIN airport_heliport.taxiwaymarking
ON taxiwaymarking_timeslice.taxiwaymarking_tsp_id = TaxiwayMarkingTimeSlicePropertyType.id
;

Taxiway
CREATE OR REPLACE VIEW taxiway_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.taxiway_pt.id,
       'nilReason', airport_heliport.taxiway_pt.nilReason,
       'href', airport_heliport.taxiway_pt.href,
       'id', airport_heliport.taxiway_tsp.id,
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
       'feature_lifetime_end', airport_heliport.taxiway_ts.feature_lifetime_end,
       'id', airport_heliport.taxiway.id,
       'identifier', airport_heliport.taxiway.identifier,
       'identifier_code_space', airport_heliport.taxiway.identifier_code_space,
       'xml_id', airport_heliport.taxiway.xml_id
    ) AS taxiway
FROM

-- TaxiwayTimeSliceType
LEFT JOIN airport_heliport.taxiway_tsp
ON airport_heliport.taxiway_tsp.taxiwaytimeslice_id = TaxiwayTimeSliceType.id
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
LEFT JOIN airport_heliport.taxiway_ts_contaminant
ON airport_heliport.taxiway_ts.id = taxiway_ts_contaminant.taxiway_ts_id
LEFT JOIN airport_heliport.taxiway_ts
ON taxiway_ts_contaminant.taxiwaycontamination_pt_id = TaxiwayContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.taxiway_ts_annotation
ON airport_heliport.taxiway_ts.id = taxiway_ts_annotation.taxiway_ts_id
LEFT JOIN airport_heliport.taxiway_ts
ON taxiway_ts_annotation.note_pt_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.taxiway_ts_availability
ON airport_heliport.taxiway_ts.id = taxiway_ts_availability.taxiway_ts_id
LEFT JOIN airport_heliport.taxiway_ts
ON taxiway_ts_availability.manoeuvringareaavailability_pt_id = ManoeuvringAreaAvailabilityPropertyType.id
-- TaxiwayTimeSlicePropertyType
LEFT JOIN airport_heliport.taxiway_timeslice
ON airport_heliport.taxiway.id = taxiway_timeslice.taxiway_id
LEFT JOIN airport_heliport.taxiway
ON taxiway_timeslice.taxiway_tsp_id = TaxiwayTimeSlicePropertyType.id
;

TelephoneContact
CREATE OR REPLACE VIEW telephonecontact_view AS
SELECT
    jsonb_build_object(
       'id', shared.telephonecontact_pt.id,
       'voice_value', shared.telephonecontact.voice_value,
       'voice_nilreason', shared.telephonecontact.voice_nilreason,
       'facsimile_value', shared.telephonecontact.facsimile_value,
       'facsimile_nilreason', shared.telephonecontact.facsimile_nilreason,
       'id', shared.telephonecontact.id,
       'identifier', shared.telephonecontact.identifier,
       'identifier_code_space', shared.telephonecontact.identifier_code_space,
       'xml_id', shared.telephonecontact.xml_id
    ) AS telephonecontact
FROM

-- TelephoneContactType
LEFT JOIN shared.telephonecontact_pt
ON shared.telephonecontact_pt.telephonecontact_id = TelephoneContactType.id
-- AbstractExtensionType
LEFT JOIN shared.telephonecontact
ON shared.telephonecontact.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN shared.telephonecontact
ON shared.telephonecontact.abstracttelephonecontactextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN shared.telephonecontact_timeinterval
ON shared.telephonecontact.id = telephonecontact_timeinterval.telephonecontact_id
LEFT JOIN shared.telephonecontact
ON telephonecontact_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN shared.telephonecontact_annotation
ON shared.telephonecontact.id = telephonecontact_annotation.telephonecontact_id
LEFT JOIN shared.telephonecontact
ON telephonecontact_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN shared.telephonecontact_specialdateauthority
ON shared.telephonecontact.id = telephonecontact_specialdateauthority.telephonecontact_id
LEFT JOIN shared.telephonecontact
ON telephonecontact_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

TerminalArrivalArea
CREATE OR REPLACE VIEW terminalarrivalarea_view AS
SELECT
    jsonb_build_object(
       'id', procedure.terminalarrivalarea_pt.id,
       'nilReason', procedure.terminalarrivalarea_pt.nilReason,
       'href', procedure.terminalarrivalarea_pt.href,
       'id', procedure.terminalarrivalarea_tsp.id,
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
       'feature_lifetime_end', procedure.terminalarrivalarea_ts.feature_lifetime_end,
       'id', procedure.terminalarrivalarea.id,
       'identifier', procedure.terminalarrivalarea.identifier,
       'identifier_code_space', procedure.terminalarrivalarea.identifier_code_space,
       'xml_id', procedure.terminalarrivalarea.xml_id
    ) AS terminalarrivalarea
FROM

-- TerminalArrivalAreaTimeSliceType
LEFT JOIN procedure.terminalarrivalarea_tsp
ON procedure.terminalarrivalarea_tsp.terminalarrivalareatimeslice_id = TerminalArrivalAreaTimeSliceType.id
-- DesignatedPointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.if_airportreferencepoint_id = AirportHeliportPropertyType.id
-- DesignatedPointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN procedure.terminalarrivalarea_ts
ON procedure.terminalarrivalarea_ts.iaf_airportreferencepoint_id = AirportHeliportPropertyType.id
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
LEFT JOIN procedure.terminalarrivalarea_ts_sector
ON procedure.terminalarrivalarea_ts.id = terminalarrivalarea_ts_sector.terminalarrivalarea_ts_id
LEFT JOIN procedure.terminalarrivalarea_ts
ON terminalarrivalarea_ts_sector.terminalarrivalareasector_pt_id = TerminalArrivalAreaSectorPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.terminalarrivalarea_ts_annotation
ON procedure.terminalarrivalarea_ts.id = terminalarrivalarea_ts_annotation.terminalarrivalarea_ts_id
LEFT JOIN procedure.terminalarrivalarea_ts
ON terminalarrivalarea_ts_annotation.note_pt_id = NotePropertyType.id
-- TerminalArrivalAreaTimeSlicePropertyType
LEFT JOIN procedure.terminalarrivalarea_timeslice
ON procedure.terminalarrivalarea.id = terminalarrivalarea_timeslice.terminalarrivalarea_id
LEFT JOIN procedure.terminalarrivalarea
ON terminalarrivalarea_timeslice.terminalarrivalarea_tsp_id = TerminalArrivalAreaTimeSlicePropertyType.id
;

TerminalArrivalAreaSector
CREATE OR REPLACE VIEW terminalarrivalareasector_view AS
SELECT
    jsonb_build_object(
       'id', procedure.terminalarrivalareasector_pt.id,
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
    ) AS terminalarrivalareasector
FROM

-- TerminalArrivalAreaSectorType
LEFT JOIN procedure.terminalarrivalareasector_pt
ON procedure.terminalarrivalareasector_pt.terminalarrivalareasector_id = TerminalArrivalAreaSectorType.id
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
LEFT JOIN procedure.terminalarrivalareasector_significantobstacle
ON procedure.terminalarrivalareasector.id = terminalarrivalareasector_significantobstacle.terminalarrivalareasector_id
LEFT JOIN procedure.terminalarrivalareasector
ON terminalarrivalareasector_significantobstacle.obstruction_pt_id = ObstructionPropertyType.id
-- NotePropertyType
LEFT JOIN procedure.terminalarrivalareasector_annotation
ON procedure.terminalarrivalareasector.id = terminalarrivalareasector_annotation.terminalarrivalareasector_id
LEFT JOIN procedure.terminalarrivalareasector
ON terminalarrivalareasector_annotation.note_pt_id = NotePropertyType.id
;

TerminalSegmentPoint
CREATE OR REPLACE VIEW terminalsegmentpoint_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.terminalsegmentpoint_pt.id,
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
    ) AS terminalsegmentpoint
FROM

-- TerminalSegmentPointType
LEFT JOIN navaids_points.terminalsegmentpoint_pt
ON navaids_points.terminalsegmentpoint_pt.terminalsegmentpoint_id = TerminalSegmentPointType.id
-- DesignatedPointPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_fixdesignatedpoint_id = DesignatedPointPropertyType.id
-- NavaidPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_navaidsystem_id = NavaidPropertyType.id
-- PointPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_position_id = PointPropertyType.id
-- RunwayCentrelinePointPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_runwaypoint_id = RunwayCentrelinePointPropertyType.id
-- TouchDownLiftOffPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_aimingpoint_id = TouchDownLiftOffPropertyType.id
-- AirportHeliportPropertyType
LEFT JOIN navaids_points.terminalsegmentpoint
ON navaids_points.terminalsegmentpoint.terminalsegmentpoint_airportreferencepoint_id = AirportHeliportPropertyType.id
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
LEFT JOIN navaids_points.terminalsegmentpoint_facilitymakeup
ON navaids_points.terminalsegmentpoint.id = terminalsegmentpoint_facilitymakeup.terminalsegmentpoint_id
LEFT JOIN navaids_points.terminalsegmentpoint
ON terminalsegmentpoint_facilitymakeup.pointreference_pt_id = PointReferencePropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.terminalsegmentpoint_annotation
ON navaids_points.terminalsegmentpoint.id = terminalsegmentpoint_annotation.terminalsegmentpoint_id
LEFT JOIN navaids_points.terminalsegmentpoint
ON terminalsegmentpoint_annotation.note_pt_id = NotePropertyType.id
;

Timesheet
CREATE OR REPLACE VIEW timesheet_view AS
SELECT
    jsonb_build_object(
       'id', shared.timesheet_pt.id,
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
    ) AS timesheet
FROM

-- TimesheetType
LEFT JOIN shared.timesheet_pt
ON shared.timesheet_pt.timesheet_id = TimesheetType.id
-- AbstractExtensionType
LEFT JOIN shared.timesheet
ON shared.timesheet.abstracttimesheetextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN shared.timesheet_annotation
ON shared.timesheet.id = timesheet_annotation.timesheet_id
LEFT JOIN shared.timesheet
ON timesheet_annotation.note_pt_id = NotePropertyType.id
;

TouchDownLiftOffContamination
CREATE OR REPLACE VIEW touchdownliftoffcontamination_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffcontamination_pt.id,
       'observationtime_value', airport_heliport.touchdownliftoffcontamination.observationtime_value,
       'observationtime_nilreason', airport_heliport.touchdownliftoffcontamination.observationtime_nilreason,
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
       'nextobservationtime_value', airport_heliport.touchdownliftoffcontamination.nextobservationtime_value,
       'nextobservationtime_nilreason', airport_heliport.touchdownliftoffcontamination.nextobservationtime_nilreason,
       'proportion_value', airport_heliport.touchdownliftoffcontamination.proportion_value,
       'proportion_nilreason', airport_heliport.touchdownliftoffcontamination.proportion_nilreason,
       'depth_value', airport_heliport.touchdownliftoffcontamination.depth_value,
       'depth_uom', airport_heliport.touchdownliftoffcontamination.depth_uom,
       'depth_nilreason', airport_heliport.touchdownliftoffcontamination.depth_nilreason,
       'id', airport_heliport.touchdownliftoffcontamination.id,
       'identifier', airport_heliport.touchdownliftoffcontamination.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoffcontamination.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoffcontamination.xml_id
    ) AS touchdownliftoffcontamination
FROM

-- TouchDownLiftOffContaminationType
LEFT JOIN airport_heliport.touchdownliftoffcontamination_pt
ON airport_heliport.touchdownliftoffcontamination_pt.touchdownliftoffcontamination_id = TouchDownLiftOffContaminationType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON airport_heliport.touchdownliftoffcontamination.abstractsurfacecontaminationextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON airport_heliport.touchdownliftoffcontamination.abstracttouchdownliftoffcontaminationextension_id = AbstractExtensionType.id

-- RidgePropertyType
LEFT JOIN airport_heliport.touchdownliftoffcontamination_criticalridge
ON airport_heliport.touchdownliftoffcontamination.id = touchdownliftoffcontamination_criticalridge.touchdownliftoffcontamination_id
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON touchdownliftoffcontamination_criticalridge.ridge_pt_id = RidgePropertyType.id
-- SurfaceContaminationLayerPropertyType
LEFT JOIN airport_heliport.touchdownliftoffcontamination_layer
ON airport_heliport.touchdownliftoffcontamination.id = touchdownliftoffcontamination_layer.touchdownliftoffcontamination_id
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON touchdownliftoffcontamination_layer.surfacecontaminationlayer_pt_id = SurfaceContaminationLayerPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.touchdownliftoffcontamination_annotation
ON airport_heliport.touchdownliftoffcontamination.id = touchdownliftoffcontamination_annotation.touchdownliftoffcontamination_id
LEFT JOIN airport_heliport.touchdownliftoffcontamination
ON touchdownliftoffcontamination_annotation.note_pt_id = NotePropertyType.id
;

TouchDownLiftOffLightSystem
CREATE OR REPLACE VIEW touchdownliftofflightsystem_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftofflightsystem_pt.id,
       'nilReason', airport_heliport.touchdownliftofflightsystem_pt.nilReason,
       'href', airport_heliport.touchdownliftofflightsystem_pt.href,
       'id', airport_heliport.touchdownliftofflightsystem_tsp.id,
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
       'feature_lifetime_end', airport_heliport.touchdownliftofflightsystem_ts.feature_lifetime_end,
       'id', airport_heliport.touchdownliftofflightsystem.id,
       'identifier', airport_heliport.touchdownliftofflightsystem.identifier,
       'identifier_code_space', airport_heliport.touchdownliftofflightsystem.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftofflightsystem.xml_id
    ) AS touchdownliftofflightsystem
FROM

-- TouchDownLiftOffLightSystemTimeSliceType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_tsp
ON airport_heliport.touchdownliftofflightsystem_tsp.touchdownliftofflightsystemtimeslice_id = TouchDownLiftOffLightSystemTimeSliceType.id
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
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts_element
ON airport_heliport.touchdownliftofflightsystem_ts.id = touchdownliftofflightsystem_ts_element.touchdownliftofflightsystem_ts_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON touchdownliftofflightsystem_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts_availability
ON airport_heliport.touchdownliftofflightsystem_ts.id = touchdownliftofflightsystem_ts_availability.touchdownliftofflightsystem_ts_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON touchdownliftofflightsystem_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts_annotation
ON airport_heliport.touchdownliftofflightsystem_ts.id = touchdownliftofflightsystem_ts_annotation.touchdownliftofflightsystem_ts_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem_ts
ON touchdownliftofflightsystem_ts_annotation.note_pt_id = NotePropertyType.id
-- TouchDownLiftOffLightSystemTimeSlicePropertyType
LEFT JOIN airport_heliport.touchdownliftofflightsystem_timeslice
ON airport_heliport.touchdownliftofflightsystem.id = touchdownliftofflightsystem_timeslice.touchdownliftofflightsystem_id
LEFT JOIN airport_heliport.touchdownliftofflightsystem
ON touchdownliftofflightsystem_timeslice.touchdownliftofflightsystem_tsp_id = TouchDownLiftOffLightSystemTimeSlicePropertyType.id
;

TouchDownLiftOffMarking
CREATE OR REPLACE VIEW touchdownliftoffmarking_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffmarking_pt.id,
       'nilReason', airport_heliport.touchdownliftoffmarking_pt.nilReason,
       'href', airport_heliport.touchdownliftoffmarking_pt.href,
       'id', airport_heliport.touchdownliftoffmarking_tsp.id,
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
       'feature_lifetime_end', airport_heliport.touchdownliftoffmarking_ts.feature_lifetime_end,
       'id', airport_heliport.touchdownliftoffmarking.id,
       'identifier', airport_heliport.touchdownliftoffmarking.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoffmarking.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoffmarking.xml_id
    ) AS touchdownliftoffmarking
FROM

-- TouchDownLiftOffMarkingTimeSliceType
LEFT JOIN airport_heliport.touchdownliftoffmarking_tsp
ON airport_heliport.touchdownliftoffmarking_tsp.touchdownliftoffmarkingtimeslice_id = TouchDownLiftOffMarkingTimeSliceType.id
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
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts_element
ON airport_heliport.touchdownliftoffmarking_ts.id = touchdownliftoffmarking_ts_element.touchdownliftoffmarking_ts_id
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts
ON touchdownliftoffmarking_ts_element.markingelement_pt_id = MarkingElementPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts_annotation
ON airport_heliport.touchdownliftoffmarking_ts.id = touchdownliftoffmarking_ts_annotation.touchdownliftoffmarking_ts_id
LEFT JOIN airport_heliport.touchdownliftoffmarking_ts
ON touchdownliftoffmarking_ts_annotation.note_pt_id = NotePropertyType.id
-- TouchDownLiftOffMarkingTimeSlicePropertyType
LEFT JOIN airport_heliport.touchdownliftoffmarking_timeslice
ON airport_heliport.touchdownliftoffmarking.id = touchdownliftoffmarking_timeslice.touchdownliftoffmarking_id
LEFT JOIN airport_heliport.touchdownliftoffmarking
ON touchdownliftoffmarking_timeslice.touchdownliftoffmarking_tsp_id = TouchDownLiftOffMarkingTimeSlicePropertyType.id
;

TouchDownLiftOff
CREATE OR REPLACE VIEW touchdownliftoff_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoff_pt.id,
       'nilReason', airport_heliport.touchdownliftoff_pt.nilReason,
       'href', airport_heliport.touchdownliftoff_pt.href,
       'id', airport_heliport.touchdownliftoff_tsp.id,
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
       'feature_lifetime_end', airport_heliport.touchdownliftoff_ts.feature_lifetime_end,
       'id', airport_heliport.touchdownliftoff.id,
       'identifier', airport_heliport.touchdownliftoff.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoff.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoff.xml_id
    ) AS touchdownliftoff
FROM

-- TouchDownLiftOffTimeSliceType
LEFT JOIN airport_heliport.touchdownliftoff_tsp
ON airport_heliport.touchdownliftoff_tsp.touchdownliftofftimeslice_id = TouchDownLiftOffTimeSliceType.id
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
LEFT JOIN airport_heliport.touchdownliftoff_ts_contaminant
ON airport_heliport.touchdownliftoff_ts.id = touchdownliftoff_ts_contaminant.touchdownliftoff_ts_id
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON touchdownliftoff_ts_contaminant.touchdownliftoffcontamination_pt_id = TouchDownLiftOffContaminationPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.touchdownliftoff_ts_annotation
ON airport_heliport.touchdownliftoff_ts.id = touchdownliftoff_ts_annotation.touchdownliftoff_ts_id
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON touchdownliftoff_ts_annotation.note_pt_id = NotePropertyType.id
-- ManoeuvringAreaAvailabilityPropertyType
LEFT JOIN airport_heliport.touchdownliftoff_ts_availability
ON airport_heliport.touchdownliftoff_ts.id = touchdownliftoff_ts_availability.touchdownliftoff_ts_id
LEFT JOIN airport_heliport.touchdownliftoff_ts
ON touchdownliftoff_ts_availability.manoeuvringareaavailability_pt_id = ManoeuvringAreaAvailabilityPropertyType.id
-- TouchDownLiftOffTimeSlicePropertyType
LEFT JOIN airport_heliport.touchdownliftoff_timeslice
ON airport_heliport.touchdownliftoff.id = touchdownliftoff_timeslice.touchdownliftoff_id
LEFT JOIN airport_heliport.touchdownliftoff
ON touchdownliftoff_timeslice.touchdownliftoff_tsp_id = TouchDownLiftOffTimeSlicePropertyType.id
;

TouchDownLiftOffSafeArea
CREATE OR REPLACE VIEW touchdownliftoffsafearea_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.touchdownliftoffsafearea_pt.id,
       'nilReason', airport_heliport.touchdownliftoffsafearea_pt.nilReason,
       'href', airport_heliport.touchdownliftoffsafearea_pt.href,
       'id', airport_heliport.touchdownliftoffsafearea_tsp.id,
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
       'feature_lifetime_end', airport_heliport.touchdownliftoffsafearea_ts.feature_lifetime_end,
       'id', airport_heliport.touchdownliftoffsafearea.id,
       'identifier', airport_heliport.touchdownliftoffsafearea.identifier,
       'identifier_code_space', airport_heliport.touchdownliftoffsafearea.identifier_code_space,
       'xml_id', airport_heliport.touchdownliftoffsafearea.xml_id
    ) AS touchdownliftoffsafearea
FROM

-- TouchDownLiftOffSafeAreaTimeSliceType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_tsp
ON airport_heliport.touchdownliftoffsafearea_tsp.touchdownliftoffsafeareatimeslice_id = TouchDownLiftOffSafeAreaTimeSliceType.id
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
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts_annotation
ON airport_heliport.touchdownliftoffsafearea_ts.id = touchdownliftoffsafearea_ts_annotation.touchdownliftoffsafearea_ts_id
LEFT JOIN airport_heliport.touchdownliftoffsafearea_ts
ON touchdownliftoffsafearea_ts_annotation.note_pt_id = NotePropertyType.id
-- TouchDownLiftOffSafeAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.touchdownliftoffsafearea_timeslice
ON airport_heliport.touchdownliftoffsafearea.id = touchdownliftoffsafearea_timeslice.touchdownliftoffsafearea_id
LEFT JOIN airport_heliport.touchdownliftoffsafearea
ON touchdownliftoffsafearea_timeslice.touchdownliftoffsafearea_tsp_id = TouchDownLiftOffSafeAreaTimeSlicePropertyType.id
;

TrafficSeparationService
CREATE OR REPLACE VIEW trafficseparationservice_view AS
SELECT
    jsonb_build_object(
       'id', service.trafficseparationservice_pt.id,
       'nilReason', service.trafficseparationservice_pt.nilReason,
       'href', service.trafficseparationservice_pt.href
    ) AS trafficseparationservice
FROM


;

UnitAvailability
CREATE OR REPLACE VIEW unitavailability_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unitavailability_pt.id,
       'operationalstatus_value', organisation.unitavailability.operationalstatus_value,
       'operationalstatus_nilreason', organisation.unitavailability.operationalstatus_nilreason,
       'id', organisation.unitavailability.id,
       'identifier', organisation.unitavailability.identifier,
       'identifier_code_space', organisation.unitavailability.identifier_code_space,
       'xml_id', organisation.unitavailability.xml_id
    ) AS unitavailability
FROM

-- UnitAvailabilityType
LEFT JOIN organisation.unitavailability_pt
ON organisation.unitavailability_pt.unitavailability_id = UnitAvailabilityType.id
-- AbstractExtensionType
LEFT JOIN organisation.unitavailability
ON organisation.unitavailability.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN organisation.unitavailability
ON organisation.unitavailability.abstractunitavailabilityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN organisation.unitavailability_timeinterval
ON organisation.unitavailability.id = unitavailability_timeinterval.unitavailability_id
LEFT JOIN organisation.unitavailability
ON unitavailability_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN organisation.unitavailability_annotation
ON organisation.unitavailability.id = unitavailability_annotation.unitavailability_id
LEFT JOIN organisation.unitavailability
ON unitavailability_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN organisation.unitavailability_specialdateauthority
ON organisation.unitavailability.id = unitavailability_specialdateauthority.unitavailability_id
LEFT JOIN organisation.unitavailability
ON unitavailability_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

UnitDependency
CREATE OR REPLACE VIEW unitdependency_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unitdependency_pt.id,
       'type_value', organisation.unitdependency.type_value,
       'type_nilreason', organisation.unitdependency.type_nilreason,
       'id', organisation.unitdependency.id,
       'identifier', organisation.unitdependency.identifier,
       'identifier_code_space', organisation.unitdependency.identifier_code_space,
       'xml_id', organisation.unitdependency.xml_id
    ) AS unitdependency
FROM

-- UnitDependencyType
LEFT JOIN organisation.unitdependency_pt
ON organisation.unitdependency_pt.unitdependency_id = UnitDependencyType.id
-- UnitPropertyType
LEFT JOIN organisation.unitdependency
ON organisation.unitdependency.theunit_id = UnitPropertyType.id
-- AbstractExtensionType
LEFT JOIN organisation.unitdependency
ON organisation.unitdependency.abstractunitdependencyextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN organisation.unitdependency_annotation
ON organisation.unitdependency.id = unitdependency_annotation.unitdependency_id
LEFT JOIN organisation.unitdependency
ON unitdependency_annotation.note_pt_id = NotePropertyType.id
;

Unit
CREATE OR REPLACE VIEW unit_view AS
SELECT
    jsonb_build_object(
       'id', organisation.unit_pt.id,
       'nilReason', organisation.unit_pt.nilReason,
       'href', organisation.unit_pt.href,
       'id', organisation.unit_tsp.id,
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
       'feature_lifetime_end', organisation.unit_ts.feature_lifetime_end,
       'id', organisation.unit.id,
       'identifier', organisation.unit.identifier,
       'identifier_code_space', organisation.unit.identifier_code_space,
       'xml_id', organisation.unit.xml_id
    ) AS unit
FROM

-- UnitTimeSliceType
LEFT JOIN organisation.unit_tsp
ON organisation.unit_tsp.unittimeslice_id = UnitTimeSliceType.id
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
LEFT JOIN organisation.unit_ts_contact
ON organisation.unit_ts.id = unit_ts_contact.unit_ts_id
LEFT JOIN organisation.unit_ts
ON unit_ts_contact.contactinformation_pt_id = ContactInformationPropertyType.id
-- UnitDependencyPropertyType
LEFT JOIN organisation.unit_ts_relatedunit
ON organisation.unit_ts.id = unit_ts_relatedunit.unit_ts_id
LEFT JOIN organisation.unit_ts
ON unit_ts_relatedunit.unitdependency_pt_id = UnitDependencyPropertyType.id
-- UnitAvailabilityPropertyType
LEFT JOIN organisation.unit_ts_availability
ON organisation.unit_ts.id = unit_ts_availability.unit_ts_id
LEFT JOIN organisation.unit_ts
ON unit_ts_availability.unitavailability_pt_id = UnitAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN organisation.unit_ts_annotation
ON organisation.unit_ts.id = unit_ts_annotation.unit_ts_id
LEFT JOIN organisation.unit_ts
ON unit_ts_annotation.note_pt_id = NotePropertyType.id
-- UnitTimeSlicePropertyType
LEFT JOIN organisation.unit_timeslice
ON organisation.unit.id = unit_timeslice.unit_id
LEFT JOIN organisation.unit
ON unit_timeslice.unit_tsp_id = UnitTimeSlicePropertyType.id
;

UnplannedHolding
CREATE OR REPLACE VIEW unplannedholding_view AS
SELECT
    jsonb_build_object(
       'id', holding.unplannedholding_pt.id,
       'nilReason', holding.unplannedholding_pt.nilReason,
       'href', holding.unplannedholding_pt.href,
       'id', holding.unplannedholding_tsp.id,
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
       'feature_lifetime_end', holding.unplannedholding_ts.feature_lifetime_end,
       'id', holding.unplannedholding.id,
       'identifier', holding.unplannedholding.identifier,
       'identifier_code_space', holding.unplannedholding.identifier_code_space,
       'xml_id', holding.unplannedholding.xml_id
    ) AS unplannedholding
FROM

-- UnplannedHoldingTimeSliceType
LEFT JOIN holding.unplannedholding_tsp
ON holding.unplannedholding_tsp.unplannedholdingtimeslice_id = UnplannedHoldingTimeSliceType.id
-- SegmentPointPropertyType
LEFT JOIN holding.unplannedholding_ts
ON holding.unplannedholding_ts.holdingpoint_id = SegmentPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN holding.unplannedholding_ts
ON holding.unplannedholding_ts.abstractunplannedholdingextension_id = AbstractExtensionType.id

-- NotePropertyType
LEFT JOIN holding.unplannedholding_ts_annotation
ON holding.unplannedholding_ts.id = unplannedholding_ts_annotation.unplannedholding_ts_id
LEFT JOIN holding.unplannedholding_ts
ON unplannedholding_ts_annotation.note_pt_id = NotePropertyType.id
-- UnplannedHoldingTimeSlicePropertyType
LEFT JOIN holding.unplannedholding_timeslice
ON holding.unplannedholding.id = unplannedholding_timeslice.unplannedholding_id
LEFT JOIN holding.unplannedholding
ON unplannedholding_timeslice.unplannedholding_tsp_id = UnplannedHoldingTimeSlicePropertyType.id
;

UsageCondition
CREATE OR REPLACE VIEW usagecondition_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.usagecondition_pt.id
    ) AS usagecondition
FROM


;

VerticalStructureLightingStatus
CREATE OR REPLACE VIEW verticalstructurelightingstatus_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructurelightingstatus_pt.id,
       'status_value', obstacles.verticalstructurelightingstatus.status_value,
       'status_nilreason', obstacles.verticalstructurelightingstatus.status_nilreason,
       'id', obstacles.verticalstructurelightingstatus.id,
       'identifier', obstacles.verticalstructurelightingstatus.identifier,
       'identifier_code_space', obstacles.verticalstructurelightingstatus.identifier_code_space,
       'xml_id', obstacles.verticalstructurelightingstatus.xml_id
    ) AS verticalstructurelightingstatus
FROM

-- VerticalStructureLightingStatusType
LEFT JOIN obstacles.verticalstructurelightingstatus_pt
ON obstacles.verticalstructurelightingstatus_pt.verticalstructurelightingstatus_id = VerticalStructureLightingStatusType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurelightingstatus
ON obstacles.verticalstructurelightingstatus.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurelightingstatus
ON obstacles.verticalstructurelightingstatus.abstractverticalstructurelightingstatusextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN obstacles.verticalstructurelightingstatus_timeinterval
ON obstacles.verticalstructurelightingstatus.id = verticalstructurelightingstatus_timeinterval.verticalstructurelightingstatus_id
LEFT JOIN obstacles.verticalstructurelightingstatus
ON verticalstructurelightingstatus_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.verticalstructurelightingstatus_annotation
ON obstacles.verticalstructurelightingstatus.id = verticalstructurelightingstatus_annotation.verticalstructurelightingstatus_id
LEFT JOIN obstacles.verticalstructurelightingstatus
ON verticalstructurelightingstatus_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.verticalstructurelightingstatus_specialdateauthority
ON obstacles.verticalstructurelightingstatus.id = verticalstructurelightingstatus_specialdateauthority.verticalstructurelightingstatus_id
LEFT JOIN obstacles.verticalstructurelightingstatus
ON verticalstructurelightingstatus_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

VerticalStructurePart
CREATE OR REPLACE VIEW verticalstructurepart_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructurepart_pt.id,
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
    ) AS verticalstructurepart
FROM

-- VerticalStructurePartType
LEFT JOIN obstacles.verticalstructurepart_pt
ON obstacles.verticalstructurepart_pt.verticalstructurepart_id = VerticalStructurePartType.id
-- ElevatedSurfacePropertyType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.horizontalprojection_surfaceextent_id = ElevatedSurfacePropertyType.id
-- ElevatedCurvePropertyType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.horizontalprojection_linearextent_id = ElevatedCurvePropertyType.id
-- ElevatedPointPropertyType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.horizontalprojection_location_id = ElevatedPointPropertyType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructurepart
ON obstacles.verticalstructurepart.abstractverticalstructurepartextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN obstacles.verticalstructurepart_timeinterval
ON obstacles.verticalstructurepart.id = verticalstructurepart_timeinterval.verticalstructurepart_id
LEFT JOIN obstacles.verticalstructurepart
ON verticalstructurepart_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.verticalstructurepart_annotation
ON obstacles.verticalstructurepart.id = verticalstructurepart_annotation.verticalstructurepart_id
LEFT JOIN obstacles.verticalstructurepart
ON verticalstructurepart_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.verticalstructurepart_specialdateauthority
ON obstacles.verticalstructurepart.id = verticalstructurepart_specialdateauthority.verticalstructurepart_id
LEFT JOIN obstacles.verticalstructurepart
ON verticalstructurepart_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- LightElementPropertyType
LEFT JOIN obstacles.verticalstructurepart_lighting
ON obstacles.verticalstructurepart.id = verticalstructurepart_lighting.verticalstructurepart_id
LEFT JOIN obstacles.verticalstructurepart
ON verticalstructurepart_lighting.lightelement_pt_id = LightElementPropertyType.id
;

VerticalStructure
CREATE OR REPLACE VIEW verticalstructure_view AS
SELECT
    jsonb_build_object(
       'id', obstacles.verticalstructure_pt.id,
       'nilReason', obstacles.verticalstructure_pt.nilReason,
       'href', obstacles.verticalstructure_pt.href,
       'id', obstacles.verticalstructure_tsp.id,
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
       'feature_lifetime_end', obstacles.verticalstructure_ts.feature_lifetime_end,
       'id', obstacles.verticalstructure.id,
       'identifier', obstacles.verticalstructure.identifier,
       'identifier_code_space', obstacles.verticalstructure.identifier_code_space,
       'xml_id', obstacles.verticalstructure.xml_id
    ) AS verticalstructure
FROM

-- VerticalStructureTimeSliceType
LEFT JOIN obstacles.verticalstructure_tsp
ON obstacles.verticalstructure_tsp.verticalstructuretimeslice_id = VerticalStructureTimeSliceType.id
-- MarkerBeaconPropertyType
LEFT JOIN obstacles.verticalstructure_ts
ON obstacles.verticalstructure_ts.marker_id = MarkerBeaconPropertyType.id
-- AbstractExtensionType
LEFT JOIN obstacles.verticalstructure_ts
ON obstacles.verticalstructure_ts.abstractverticalstructureextension_id = AbstractExtensionType.id

-- VerticalStructurePartPropertyType
LEFT JOIN obstacles.verticalstructure_ts_part
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_part.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_part.verticalstructurepart_pt_id = VerticalStructurePartPropertyType.id
-- PassengerServicePropertyType
LEFT JOIN obstacles.verticalstructure_ts_hostedpassengerservice
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_hostedpassengerservice.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_hostedpassengerservice.passengerservice_pt_id = PassengerServicePropertyType.id
-- GroundLightSystemPropertyType
LEFT JOIN obstacles.verticalstructure_ts_supportedgroundlight
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_supportedgroundlight.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_supportedgroundlight.groundlightsystem_pt_id = GroundLightSystemPropertyType.id
-- NavaidEquipmentPropertyType
LEFT JOIN obstacles.verticalstructure_ts_hostednavaidequipment
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_hostednavaidequipment.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_hostednavaidequipment.navaidequipment_pt_id = NavaidEquipmentPropertyType.id
-- SpecialNavigationStationPropertyType
LEFT JOIN obstacles.verticalstructure_ts_hostedspecialnavstation
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_hostedspecialnavstation.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_hostedspecialnavstation.specialnavigationstation_pt_id = SpecialNavigationStationPropertyType.id
-- UnitPropertyType
LEFT JOIN obstacles.verticalstructure_ts_hostedunit
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_hostedunit.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_hostedunit.unit_pt_id = UnitPropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN obstacles.verticalstructure_ts_hostedorganisation
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_hostedorganisation.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_hostedorganisation.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
-- ServicePropertyType
LEFT JOIN obstacles.verticalstructure_ts_supportedservice
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_supportedservice.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_supportedservice.service_pt_id = ServicePropertyType.id
-- NotePropertyType
LEFT JOIN obstacles.verticalstructure_ts_annotation
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_annotation.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_annotation.note_pt_id = NotePropertyType.id
-- VerticalStructureLightingStatusPropertyType
LEFT JOIN obstacles.verticalstructure_ts_lightingavailability
ON obstacles.verticalstructure_ts.id = verticalstructure_ts_lightingavailability.verticalstructure_ts_id
LEFT JOIN obstacles.verticalstructure_ts
ON verticalstructure_ts_lightingavailability.verticalstructurelightingstatus_pt_id = VerticalStructureLightingStatusPropertyType.id
-- VerticalStructureTimeSlicePropertyType
LEFT JOIN obstacles.verticalstructure_timeslice
ON obstacles.verticalstructure.id = verticalstructure_timeslice.verticalstructure_id
LEFT JOIN obstacles.verticalstructure
ON verticalstructure_timeslice.verticalstructure_tsp_id = VerticalStructureTimeSlicePropertyType.id
;

VisualGlideSlopeIndicator
CREATE OR REPLACE VIEW visualglideslopeindicator_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.visualglideslopeindicator_pt.id,
       'nilReason', airport_heliport.visualglideslopeindicator_pt.nilReason,
       'href', airport_heliport.visualglideslopeindicator_pt.href,
       'id', airport_heliport.visualglideslopeindicator_tsp.id,
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
       'feature_lifetime_end', airport_heliport.visualglideslopeindicator_ts.feature_lifetime_end,
       'id', airport_heliport.visualglideslopeindicator.id,
       'identifier', airport_heliport.visualglideslopeindicator.identifier,
       'identifier_code_space', airport_heliport.visualglideslopeindicator.identifier_code_space,
       'xml_id', airport_heliport.visualglideslopeindicator.xml_id
    ) AS visualglideslopeindicator
FROM

-- VisualGlideSlopeIndicatorTimeSliceType
LEFT JOIN airport_heliport.visualglideslopeindicator_tsp
ON airport_heliport.visualglideslopeindicator_tsp.visualglideslopeindicatortimeslice_id = VisualGlideSlopeIndicatorTimeSliceType.id
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
LEFT JOIN airport_heliport.visualglideslopeindicator_ts_element
ON airport_heliport.visualglideslopeindicator_ts.id = visualglideslopeindicator_ts_element.visualglideslopeindicator_ts_id
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON visualglideslopeindicator_ts_element.lightelement_pt_id = LightElementPropertyType.id
-- GroundLightingAvailabilityPropertyType
LEFT JOIN airport_heliport.visualglideslopeindicator_ts_availability
ON airport_heliport.visualglideslopeindicator_ts.id = visualglideslopeindicator_ts_availability.visualglideslopeindicator_ts_id
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON visualglideslopeindicator_ts_availability.groundlightingavailability_pt_id = GroundLightingAvailabilityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.visualglideslopeindicator_ts_annotation
ON airport_heliport.visualglideslopeindicator_ts.id = visualglideslopeindicator_ts_annotation.visualglideslopeindicator_ts_id
LEFT JOIN airport_heliport.visualglideslopeindicator_ts
ON visualglideslopeindicator_ts_annotation.note_pt_id = NotePropertyType.id
-- VisualGlideSlopeIndicatorTimeSlicePropertyType
LEFT JOIN airport_heliport.visualglideslopeindicator_timeslice
ON airport_heliport.visualglideslopeindicator.id = visualglideslopeindicator_timeslice.visualglideslopeindicator_id
LEFT JOIN airport_heliport.visualglideslopeindicator
ON visualglideslopeindicator_timeslice.visualglideslopeindicator_tsp_id = VisualGlideSlopeIndicatorTimeSlicePropertyType.id
;

VOR
CREATE OR REPLACE VIEW vor_view AS
SELECT
    jsonb_build_object(
       'id', navaids_points.vor_pt.id,
       'nilReason', navaids_points.vor_pt.nilReason,
       'href', navaids_points.vor_pt.href,
       'id', navaids_points.vor_tsp.id,
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
       'feature_lifetime_end', navaids_points.vor_ts.feature_lifetime_end,
       'id', navaids_points.vor.id,
       'identifier', navaids_points.vor.identifier,
       'identifier_code_space', navaids_points.vor.identifier_code_space,
       'xml_id', navaids_points.vor.xml_id
    ) AS vor
FROM

-- VORTimeSliceType
LEFT JOIN navaids_points.vor_tsp
ON navaids_points.vor_tsp.vortimeslice_id = VORTimeSliceType.id
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
LEFT JOIN navaids_points.vor_ts_authority
ON navaids_points.vor_ts.id = vor_ts_authority.vor_ts_id
LEFT JOIN navaids_points.vor_ts
ON vor_ts_authority.authorityfornavaidequipment_pt_id = AuthorityForNavaidEquipmentPropertyType.id
-- NavaidEquipmentMonitoringPropertyType
LEFT JOIN navaids_points.vor_ts_monitoring
ON navaids_points.vor_ts.id = vor_ts_monitoring.vor_ts_id
LEFT JOIN navaids_points.vor_ts
ON vor_ts_monitoring.navaidequipmentmonitoring_pt_id = NavaidEquipmentMonitoringPropertyType.id
-- NavaidOperationalStatusPropertyType
LEFT JOIN navaids_points.vor_ts_availability
ON navaids_points.vor_ts.id = vor_ts_availability.vor_ts_id
LEFT JOIN navaids_points.vor_ts
ON vor_ts_availability.navaidoperationalstatus_pt_id = NavaidOperationalStatusPropertyType.id
-- NotePropertyType
LEFT JOIN navaids_points.vor_ts_annotation
ON navaids_points.vor_ts.id = vor_ts_annotation.vor_ts_id
LEFT JOIN navaids_points.vor_ts
ON vor_ts_annotation.note_pt_id = NotePropertyType.id
-- VORTimeSlicePropertyType
LEFT JOIN navaids_points.vor_timeslice
ON navaids_points.vor.id = vor_timeslice.vor_id
LEFT JOIN navaids_points.vor
ON vor_timeslice.vor_tsp_id = VORTimeSlicePropertyType.id
;

WorkareaActivity
CREATE OR REPLACE VIEW workareaactivity_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.workareaactivity_pt.id,
       'isactive_value', airport_heliport.workareaactivity.isactive_value,
       'isactive_nilreason', airport_heliport.workareaactivity.isactive_nilreason,
       'id', airport_heliport.workareaactivity.id,
       'identifier', airport_heliport.workareaactivity.identifier,
       'identifier_code_space', airport_heliport.workareaactivity.identifier_code_space,
       'xml_id', airport_heliport.workareaactivity.xml_id
    ) AS workareaactivity
FROM

-- WorkareaActivityType
LEFT JOIN airport_heliport.workareaactivity_pt
ON airport_heliport.workareaactivity_pt.workareaactivity_id = WorkareaActivityType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.workareaactivity
ON airport_heliport.workareaactivity.abstractpropertieswithscheduleextension_id = AbstractExtensionType.id
-- AbstractExtensionType
LEFT JOIN airport_heliport.workareaactivity
ON airport_heliport.workareaactivity.abstractworkareaactivityextension_id = AbstractExtensionType.id

-- TimesheetPropertyType
LEFT JOIN airport_heliport.workareaactivity_timeinterval
ON airport_heliport.workareaactivity.id = workareaactivity_timeinterval.workareaactivity_id
LEFT JOIN airport_heliport.workareaactivity
ON workareaactivity_timeinterval.timesheet_pt_id = TimesheetPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.workareaactivity_annotation
ON airport_heliport.workareaactivity.id = workareaactivity_annotation.workareaactivity_id
LEFT JOIN airport_heliport.workareaactivity
ON workareaactivity_annotation.note_pt_id = NotePropertyType.id
-- OrganisationAuthorityPropertyType
LEFT JOIN airport_heliport.workareaactivity_specialdateauthority
ON airport_heliport.workareaactivity.id = workareaactivity_specialdateauthority.workareaactivity_id
LEFT JOIN airport_heliport.workareaactivity
ON workareaactivity_specialdateauthority.organisationauthority_pt_id = OrganisationAuthorityPropertyType.id
;

WorkArea
CREATE OR REPLACE VIEW workarea_view AS
SELECT
    jsonb_build_object(
       'id', airport_heliport.workarea_pt.id,
       'nilReason', airport_heliport.workarea_pt.nilReason,
       'href', airport_heliport.workarea_pt.href,
       'id', airport_heliport.workarea_tsp.id,
       'type_value', airport_heliport.workarea_ts.type_value,
       'type_nilreason', airport_heliport.workarea_ts.type_nilreason,
       'plannedoperational_value', airport_heliport.workarea_ts.plannedoperational_value,
       'plannedoperational_nilreason', airport_heliport.workarea_ts.plannedoperational_nilreason,
       'id', airport_heliport.workarea_ts.id,
       'xml_id', airport_heliport.workarea_ts.xml_id,
       'interpretation', airport_heliport.workarea_ts.interpretation,
       'sequence_number', airport_heliport.workarea_ts.sequence_number,
       'correction_number', airport_heliport.workarea_ts.correction_number,
       'valid_time_begin', airport_heliport.workarea_ts.valid_time_begin,
       'valid_time_end', airport_heliport.workarea_ts.valid_time_end,
       'feature_lifetime_begin', airport_heliport.workarea_ts.feature_lifetime_begin,
       'feature_lifetime_end', airport_heliport.workarea_ts.feature_lifetime_end,
       'id', airport_heliport.workarea.id,
       'identifier', airport_heliport.workarea.identifier,
       'identifier_code_space', airport_heliport.workarea.identifier_code_space,
       'xml_id', airport_heliport.workarea.xml_id
    ) AS workarea
FROM

-- WorkAreaTimeSliceType
LEFT JOIN airport_heliport.workarea_tsp
ON airport_heliport.workarea_tsp.workareatimeslice_id = WorkAreaTimeSliceType.id
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
LEFT JOIN airport_heliport.workarea_ts_activation
ON airport_heliport.workarea_ts.id = workarea_ts_activation.workarea_ts_id
LEFT JOIN airport_heliport.workarea_ts
ON workarea_ts_activation.workareaactivity_pt_id = WorkareaActivityPropertyType.id
-- NotePropertyType
LEFT JOIN airport_heliport.workarea_ts_annotation
ON airport_heliport.workarea_ts.id = workarea_ts_annotation.workarea_ts_id
LEFT JOIN airport_heliport.workarea_ts
ON workarea_ts_annotation.note_pt_id = NotePropertyType.id
-- WorkAreaTimeSlicePropertyType
LEFT JOIN airport_heliport.workarea_timeslice
ON airport_heliport.workarea.id = workarea_timeslice.workarea_id
LEFT JOIN airport_heliport.workarea
ON workarea_timeslice.workarea_tsp_id = WorkAreaTimeSlicePropertyType.id
;

