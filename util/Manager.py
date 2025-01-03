import Machinery

debug = {
    "mode" : False,
    "entity" : {
        "mode" : True,
        "list" : ["PointPropertyType"]
    },
}

config = {
    "ignore": [
        "XHTMLType",
        "AIXMBasicMessageType",
        "AIXMBasicMessagePropertyGroup",
        "BasicMessageMemberAIXMPropertyType",
        "PointPropertyType",
        "CurvePropertyType",
        "SurfacePropertyType",
        "ElevatedPointPropertyType",
        "ElevatedCurvePropertyType",
        "ElevatedSurfacePropertyType",
        "AbstractAIXMMessageBaseType",
        "AbstractAIXMMessageType",
        "AbstractAIXMFeatureBaseType",
        "AbstractAIXMFeatureType",
        "AbstractAIXMTimeSliceBaseType",
        "AbstractAIXMTimeSliceType",
        "AbstractAIXMPropertyType",
        "AbstractAIXMObjectBaseType",
        "AbstractAIXMObjectType",
        "MessageMetadataPropertyType",
        "FeatureMetadataPropertyType",
        "FeatureTimeSliceMetadataPropertyType",
        "MessageMetadataPropertyType,",
    ],
    "transient" : [
        "aixm:AbstractDirectFlight",
        "aixm:AbstractPropertiesWithSchedule",
        "aixm:AbstractUsageConditio",
        "aixm:AbstractSurfaceContamination",
        "aixm:AbstractSegmentPoint",
        "aixm:AbstractUsageCondition",
        "extension",
        "aixm:XHTMLType",
        "aixm:AIXMBasicMessageType",
        "aixm:AIXMBasicMessagePropertyGroup",
        "aixm:BasicMessageMemberAIXMPropertyType",
        "aixm:AbstractAIXMMessageBaseType",
        "aixm:AbstractAIXMMessageType",
        "aixm:AbstractAIXMFeatureBaseType",
        "aixm:AbstractAIXMFeatureType",
        "aixm:AbstractAIXMTimeSliceBaseType",
        "aixm:AbstractAIXMTimeSliceType",
        "aixm:AbstractAIXMPropertyType",
        "aixm:AbstractAIXMObjectBaseType",
        "aixm:AbstractAIXMObjectType",
        "aixm:MessageMetadataPropertyType",
        "aixm:FeatureMetadataPropertyType",
        "aixm:FeatureTimeSliceMetadataPropertyType",
        "aixm:MessageMetadataPropertyType,",
    ],
    "embed": [
        "PointType",
        "ElevatedPointType",
        "CurveType",
        "ElevatedCurveType",
        "SurfaceType",
        "ElevatedSurfaceType",
        "AerialRefuellingPropertyType",
        "AirportHeliportPropertyType",
        "AirportHeliportCollocationPropertyType",
        "AirportHeliportProtectionAreaPropertyType",
        "AirportHotSpotPropertyType",
        "AltimeterSourcePropertyType",
        "NonMovementAreaPropertyType",
        "SurveyControlPointPropertyType",
        "WorkAreaPropertyType",
        "AircraftStandPropertyType",
        "ApronPropertyType",
        "ApronElementPropertyType",
        "DeicingAreaPropertyType",
        "PassengerLoadingBridgePropertyType",
        "RoadPropertyType",
        "TouchDownLiftOffPropertyType",
        "TouchDownLiftOffSafeAreaPropertyType",
        "ApproachLightingSystemPropertyType",
        "ApronLightSystemPropertyType",
        "GroundLightSystemPropertyType",
        "GuidanceLineLightSystemPropertyType",
        "RunwayDirectionLightSystemPropertyType",
        "RunwayProtectAreaLightSystemPropertyType",
        "TaxiHoldingPositionLightSystemPropertyType",
        "TaxiwayLightSystemPropertyType",
        "TouchDownLiftOffLightSystemPropertyType",
        "AirportProtectionAreaMarkingPropertyType",
        "ApronMarkingPropertyType",
        "DeicingAreaMarkingPropertyType",
        "GuidanceLineMarkingPropertyType",
        "MarkingPropertyType",
        "RunwayMarkingPropertyType",
        "StandMarkingPropertyType",
        "TaxiHoldingPositionMarkingPropertyType",
        "TaxiwayMarkingPropertyType",
        "TouchDownLiftOffMarkingPropertyType",
        "ArrestingGearPropertyType",
        "RunwayPropertyType",
        "RunwayBlastPadPropertyType",
        "RunwayCentrelinePointPropertyType",
        "RunwayDirectionPropertyType",
        "RunwayElementPropertyType",
        "RunwayProtectAreaPropertyType",
        "RunwayVisualRangePropertyType",
        "VisualGlideSlopeIndicatorPropertyType",
        "FloatingDockSitePropertyType",
        "MarkingBuoyPropertyType",
        "SeaplaneLandingAreaPropertyType",
        "SeaplaneRampSitePropertyType",
        "GuidanceLinePropertyType",
        "TaxiHoldingPositionPropertyType",
        "TaxiwayPropertyType",
        "TaxiwayElementPropertyType",
        "AirspacePropertyType",
        "AuthorityForAirspacePropertyType",
        "GeoBorderPropertyType",
        "HoldingPatternPropertyType",
        "UnplannedHoldingPropertyType",
        "AzimuthPropertyType",
        "CheckpointINSPropertyType",
        "CheckpointVORPropertyType",
        "DirectionFinderPropertyType",
        "DMEPropertyType",
        "ElevationPropertyType",
        "GlidepathPropertyType",
        "LocalizerPropertyType",
        "MarkerBeaconPropertyType",
        "NavaidPropertyType",
        "NavaidEquipmentPropertyType",
        "NavigationSystemCheckpointPropertyType",
        "NDBPropertyType",
        "SDFPropertyType",
        "SpecialNavigationStationPropertyType",
        "SpecialNavigationSystemPropertyType",
        "TACANPropertyType",
        "VORPropertyType",
        "AngleIndicationPropertyType",
        "DistanceIndicationPropertyType",
        "DesignatedPointPropertyType",
        "SignificantPointInAirspacePropertyType",
        "AeronauticalGroundLightPropertyType",
        "ObstacleAreaPropertyType",
        "VerticalStructurePropertyType",
        "OrganisationAuthorityPropertyType",
        "UnitPropertyType",
        "InstrumentApproachProcedurePropertyType",
        "TerminalArrivalAreaPropertyType",
        "CirclingAreaPropertyType",
        "StandardInstrumentArrivalPropertyType",
        "NavigationAreaPropertyType",
        "StandardInstrumentDeparturePropertyType",
        "SafeAltitudeAreaPropertyType",
        "ApproachLegPropertyType",
        "ArrivalFeederLegPropertyType",
        "ArrivalLegPropertyType",
        "DepartureLegPropertyType",
        "FinalLegPropertyType",
        "InitialLegPropertyType",
        "IntermediateLegPropertyType",
        "MissedApproachLegPropertyType",
        "NavigationAreaRestrictionPropertyType",
        "ProcedurePropertyType",
        "ProcedureDMEPropertyType",
        "SegmentLegPropertyType",
        "ChangeOverPointPropertyType",
        "RoutePropertyType",
        "RouteDMEPropertyType",
        "RouteSegmentPropertyType",
        "AirspaceBorderCrossingPropertyType",
        "FlightRestrictionPropertyType",
        "RulesProceduresPropertyType",
        "AircraftGroundServicePropertyType",
        "AirportClearanceServicePropertyType",
        "AirportGroundServicePropertyType",
        "AirportSuppliesServicePropertyType",
        "AirTrafficControlServicePropertyType",
        "AirTrafficManagementServicePropertyType",
        "FireFightingServicePropertyType",
        "GroundTrafficControlServicePropertyType",
        "InformationServicePropertyType",
        "PassengerServicePropertyType",
        "PilotControlledLightingPropertyType",
        "RadioCommunicationChannelPropertyType",
        "SearchRescueServicePropertyType",
        "ServicePropertyType",
        "TrafficSeparationServicePropertyType",
        "RadioFrequencyAreaPropertyType",
        "SpecialDatePropertyType",
        "StandardLevelColumnPropertyType",
        "StandardLevelSectorPropertyType",
        "StandardLevelTablePropertyType",
        "HoldingAssessmentPropertyType",
        "PrecisionApproachRadarPropertyType",
        "PrimarySurveillanceRadarPropertyType",
        "RadarEquipmentPropertyType",
        "RadarSystemPropertyType",
        "SecondarySurveillanceRadarPropertyType",   
        "SurveillanceRadarPropertyType",
    ],
    "abstract": [],
    "package": "com.aixm.delorean.core.schema.a5_1_1.aixm",
    "output_path": "schema/aixm5_1_1/binding/aixm.xjb"
}

feature = {
    "name" : "../aixm/AIXM_Features",
    "path" : "src/main/resources/a5_1_1/AIXM_Features.xsd",
    "strategy" : Machinery.strategy.feature,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm",
    "manual" : "util/manual/AIXM_Features.xjb"
}

data_types = {
    "name" : "../aixm/AIXM_DataTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_DataTypes.xsd",
    "strategy" : Machinery.strategy.data_type,
    "manual" : "util/manual/AIXM_DataTypes.xjb"
}

abstract = {
    "name" : "../aixm/AIXM_AbstractGML_ObjectTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategy" : Machinery.strategy.abstract,
    "manual" : "util/manual/AIXM_AbstractGML_ObjectTypes.xjb"
}

message = {
    "name" : "../aixm/message/AIXM_BasicMessage",
    "path" : "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd",
    "strategy" : Machinery.strategy.other,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm.message",
    "manual" : "util/manual/AIXM_BasicMessage.xjb"
}



machinery = Machinery.runner(config, debug, [data_types, feature, abstract, message],)

# config = {
#     "ignore": [
#         "XHTMLType",
#         "AIXMBasicMessageType",
#         "AIXMBasicMessagePropertyGroup",
#         "BasicMessageMemberAIXMPropertyType",
#         "PointPropertyType",
#         "CurvePropertyType",
#         "SurfacePropertyType",
#         "ElevatedPointPropertyType",
#         "ElevatedCurvePropertyType",
#         "ElevatedSurfacePropertyType",
#         "AbstractAIXMMessageBaseType",
#         "AbstractAIXMMessageType",
#         "AbstractAIXMFeatureBaseType",
#         "AbstractAIXMFeatureType",
#         "AbstractAIXMTimeSliceBaseType",
#         "AbstractAIXMTimeSliceType",
#         "AbstractAIXMPropertyType",
#         "AbstractAIXMObjectBaseType",
#         "AbstractAIXMObjectType",
#         "MessageMetadataPropertyType",
#         "FeatureMetadataPropertyType",
#         "FeatureTimeSliceMetadataPropertyType",
#         "MessageMetadataPropertyType,",
#         "AerialRefuellingPropertyType",
#         "AirportHeliportPropertyType",
#         "AirportHeliportCollocationPropertyType",
#         "AirportHeliportProtectionAreaPropertyType",
#         "AirportHotSpotPropertyType",
#         "AltimeterSourcePropertyType",
#         "NonMovementAreaPropertyType",
#         "SurveyControlPointPropertyType",
#         "WorkAreaPropertyType",
#         "AircraftStandPropertyType",
#         "ApronPropertyType",
#         "ApronElementPropertyType",
#         "DeicingAreaPropertyType",
#         "PassengerLoadingBridgePropertyType",
#         "RoadPropertyType",
#         "TouchDownLiftOffPropertyType",
#         "TouchDownLiftOffSafeAreaPropertyType",
#         "ApproachLightingSystemPropertyType",
#         "ApronLightSystemPropertyType",
#         "GroundLightSystemPropertyType",
#         "GuidanceLineLightSystemPropertyType",
#         "RunwayDirectionLightSystemPropertyType",
#         "RunwayProtectAreaLightSystemPropertyType",
#         "TaxiHoldingPositionLightSystemPropertyType",
#         "TaxiwayLightSystemPropertyType",
#         "TouchDownLiftOffLightSystemPropertyType",
#         "AirportProtectionAreaMarkingPropertyType",
#         "ApronMarkingPropertyType",
#         "DeicingAreaMarkingPropertyType",
#         "GuidanceLineMarkingPropertyType",
#         "MarkingPropertyType",
#         "RunwayMarkingPropertyType",
#         "StandMarkingPropertyType",
#         "TaxiHoldingPositionMarkingPropertyType",
#         "TaxiwayMarkingPropertyType",
#         "TouchDownLiftOffMarkingPropertyType",
#         "ArrestingGearPropertyType",
#         "RunwayPropertyType",
#         "RunwayBlastPadPropertyType",
#         "RunwayCentrelinePointPropertyType",
#         "RunwayDirectionPropertyType",
#         "RunwayElementPropertyType",
#         "RunwayProtectAreaPropertyType",
#         "RunwayVisualRangePropertyType",
#         "VisualGlideSlopeIndicatorPropertyType",
#         "FloatingDockSitePropertyType",
#         "MarkingBuoyPropertyType",
#         "SeaplaneLandingAreaPropertyType",
#         "SeaplaneRampSitePropertyType",
#         "GuidanceLinePropertyType",
#         "TaxiHoldingPositionPropertyType",
#         "TaxiwayPropertyType",
#         "TaxiwayElementPropertyType",
#         "AirspacePropertyType",
#         "AuthorityForAirspacePropertyType",
#         "GeoBorderPropertyType",
#         "HoldingPatternPropertyType",
#         "UnplannedHoldingPropertyType",
#         "AzimuthPropertyType",
#         "CheckpointINSPropertyType",
#         "CheckpointVORPropertyType",
#         "DirectionFinderPropertyType",
#         "DMEPropertyType",
#         "ElevationPropertyType",
#         "GlidepathPropertyType",
#         "LocalizerPropertyType",
#         "MarkerBeaconPropertyType",
#         "NavaidPropertyType",
#         "NavaidEquipmentPropertyType",
#         "NavigationSystemCheckpointPropertyType",
#         "NDBPropertyType",
#         "SDFPropertyType",
#         "SpecialNavigationStationPropertyType",
#         "SpecialNavigationSystemPropertyType",
#         "TACANPropertyType",
#         "VORPropertyType",
#         "AngleIndicationPropertyType",
#         "DistanceIndicationPropertyType",
#         "DesignatedPointPropertyType",
#         "SignificantPointInAirspacePropertyType",
#         "AeronauticalGroundLightPropertyType",
#         "ObstacleAreaPropertyType",
#         "VerticalStructurePropertyType",
#         "OrganisationAuthorityPropertyType",
#         "UnitPropertyType",
#         "InstrumentApproachProcedurePropertyType",
#         "TerminalArrivalAreaPropertyType",
#         "CirclingAreaPropertyType",
#         "StandardInstrumentArrivalPropertyType",
#         "NavigationAreaPropertyType",
#         "StandardInstrumentDeparturePropertyType",
#         "SafeAltitudeAreaPropertyType",
#         "ApproachLegPropertyType",
#         "ArrivalFeederLegPropertyType",
#         "ArrivalLegPropertyType",
#         "DepartureLegPropertyType",
#         "FinalLegPropertyType",
#         "InitialLegPropertyType",
#         "IntermediateLegPropertyType",
#         "MissedApproachLegPropertyType",
#         "NavigationAreaRestrictionPropertyType",
#         "ProcedurePropertyType",
#         "ProcedureDMEPropertyType",
#         "SegmentLegPropertyType",
#         "ChangeOverPointPropertyType",
#         "RoutePropertyType",
#         "RouteDMEPropertyType",
#         "RouteSegmentPropertyType",
#         "AirspaceBorderCrossingPropertyType",
#         "FlightRestrictionPropertyType",
#         "RulesProceduresPropertyType",
#         "AircraftGroundServicePropertyType",
#         "AirportClearanceServicePropertyType",
#         "AirportGroundServicePropertyType",
#         "AirportSuppliesServicePropertyType",
#         "AirTrafficControlServicePropertyType",
#         "AirTrafficManagementServicePropertyType",
#         "FireFightingServicePropertyType",
#         "GroundTrafficControlServicePropertyType",
#         "InformationServicePropertyType",
#         "PassengerServicePropertyType",
#         "PilotControlledLightingPropertyType",
#         "RadioCommunicationChannelPropertyType",
#         "SearchRescueServicePropertyType",
#         "ServicePropertyType",
#         "TrafficSeparationServicePropertyType",
#         "RadioFrequencyAreaPropertyType",
#         "SpecialDatePropertyType",
#         "StandardLevelColumnPropertyType",
#         "StandardLevelSectorPropertyType",
#         "StandardLevelTablePropertyType",
#         "HoldingAssessmentPropertyType",
#         "PrecisionApproachRadarPropertyType",
#         "PrimarySurveillanceRadarPropertyType",
#         "RadarEquipmentPropertyType",
#         "RadarSystemPropertyType",
#         "SecondarySurveillanceRadarPropertyType",   
#         "SurveillanceRadarPropertyType",
#     ],
#     "transient" : [
#         "aixm:AbstractDirectFlight",
#         "aixm:AbstractPropertiesWithSchedule",
#         "aixm:AbstractUsageConditio",
#         "aixm:AbstractSurfaceContamination",
#         "aixm:AbstractSegmentPoint",
#         "aixm:AbstractUsageCondition",
#         "extension",
#         "aixm:XHTMLType",
#         "aixm:AIXMBasicMessageType",
#         "aixm:AIXMBasicMessagePropertyGroup",
#         "aixm:BasicMessageMemberAIXMPropertyType",
#         "aixm:AbstractAIXMMessageBaseType",
#         "aixm:AbstractAIXMMessageType",
#         "aixm:AbstractAIXMFeatureBaseType",
#         "aixm:AbstractAIXMFeatureType",
#         "aixm:AbstractAIXMTimeSliceBaseType",
#         "aixm:AbstractAIXMTimeSliceType",
#         "aixm:AbstractAIXMPropertyType",
#         "aixm:AbstractAIXMObjectBaseType",
#         "aixm:AbstractAIXMObjectType",
#         "aixm:MessageMetadataPropertyType",
#         "aixm:FeatureMetadataPropertyType",
#         "aixm:FeatureTimeSliceMetadataPropertyType",
#         "aixm:MessageMetadataPropertyType,",
#         "aixm:AerialRefuellingPropertyType",
#         "aixm:AirportHeliportPropertyType",
#         "aixm:AirportHeliportCollocationPropertyType",
#         "aixm:AirportHeliportProtectionAreaPropertyType",
#         "aixm:AirportHotSpotPropertyType",
#         "aixm:AltimeterSourcePropertyType",
#         "aixm:NonMovementAreaPropertyType",
#         "aixm:SurveyControlPointPropertyType",
#         "aixm:WorkAreaPropertyType",
#         "aixm:AircraftStandPropertyType",
#         "aixm:ApronPropertyType",
#         "aixm:ApronElementPropertyType",
#         "aixm:DeicingAreaPropertyType",
#         "aixm:PassengerLoadingBridgePropertyType",
#         "aixm:RoadPropertyType",
#         "aixm:TouchDownLiftOffPropertyType",
#         "aixm:TouchDownLiftOffSafeAreaPropertyType",
#         "aixm:ApproachLightingSystemPropertyType",
#         "aixm:ApronLightSystemPropertyType",
#         "aixm:GroundLightSystemPropertyType",
#         "aixm:GuidanceLineLightSystemPropertyType",
#         "aixm:RunwayDirectionLightSystemPropertyType",
#         "aixm:RunwayProtectAreaLightSystemPropertyType",
#         "aixm:TaxiHoldingPositionLightSystemPropertyType",
#         "aixm:TaxiwayLightSystemPropertyType",
#         "aixm:TouchDownLiftOffLightSystemPropertyType",
#         "aixm:AirportProtectionAreaMarkingPropertyType",
#         "aixm:ApronMarkingPropertyType",
#         "aixm:DeicingAreaMarkingPropertyType",
#         "aixm:GuidanceLineMarkingPropertyType",
#         "aixm:MarkingPropertyType",
#         "aixm:RunwayMarkingPropertyType",
#         "aixm:StandMarkingPropertyType",
#         "aixm:TaxiHoldingPositionMarkingPropertyType",
#         "aixm:TaxiwayMarkingPropertyType",
#         "aixm:TouchDownLiftOffMarkingPropertyType",
#         "aixm:ArrestingGearPropertyType",
#         "aixm:RunwayPropertyType",
#         "aixm:RunwayBlastPadPropertyType",
#         "aixm:RunwayCentrelinePointPropertyType",
#         "aixm:RunwayDirectionPropertyType",
#         "aixm:RunwayElementPropertyType",
#         "aixm:RunwayProtectAreaPropertyType",
#         "aixm:RunwayVisualRangePropertyType",
#         "aixm:VisualGlideSlopeIndicatorPropertyType",
#         "aixm:FloatingDockSitePropertyType",
#         "aixm:MarkingBuoyPropertyType",
#         "aixm:SeaplaneLandingAreaPropertyType",
#         "aixm:SeaplaneRampSitePropertyType",
#         "aixm:GuidanceLinePropertyType",
#         "aixm:TaxiHoldingPositionPropertyType",
#         "aixm:TaxiwayPropertyType",
#         "aixm:TaxiwayElementPropertyType",
#         "aixm:AirspacePropertyType",
#         "aixm:AuthorityForAirspacePropertyType",
#         "aixm:GeoBorderPropertyType",
#         "aixm:HoldingPatternPropertyType",
#         "aixm:UnplannedHoldingPropertyType",
#         "aixm:AzimuthPropertyType",
#         "aixm:CheckpointINSPropertyType",
#         "aixm:CheckpointVORPropertyType",
#         "aixm:DirectionFinderPropertyType",
#         "aixm:DMEPropertyType",
#         "aixm:ElevationPropertyType",
#         "aixm:GlidepathPropertyType",
#         "aixm:LocalizerPropertyType",
#         "aixm:MarkerBeaconPropertyType",
#         "aixm:NavaidPropertyType",
#         "aixm:NavaidEquipmentPropertyType",
#         "aixm:NavigationSystemCheckpointPropertyType",
#         "aixm:NDBPropertyType",
#         "aixm:SDFPropertyType",
#         "aixm:SpecialNavigationStationPropertyType",
#         "aixm:SpecialNavigationSystemPropertyType",
#         "aixm:TACANPropertyType",
#         "aixm:VORPropertyType",
#         "aixm:AngleIndicationPropertyType",
#         "aixm:DistanceIndicationPropertyType",
#         "aixm:DesignatedPointPropertyType",
#         "aixm:SignificantPointInAirspacePropertyType",
#         "aixm:AeronauticalGroundLightPropertyType",
#         "aixm:ObstacleAreaPropertyType",
#         "aixm:VerticalStructurePropertyType",
#         "aixm:OrganisationAuthorityPropertyType",
#         "aixm:UnitPropertyType",
#         "aixm:InstrumentApproachProcedurePropertyType",
#         "aixm:TerminalArrivalAreaPropertyType",
#         "aixm:CirclingAreaPropertyType",
#         "aixm:StandardInstrumentArrivalPropertyType",
#         "aixm:NavigationAreaPropertyType",
#         "aixm:StandardInstrumentDeparturePropertyType",
#         "aixm:SafeAltitudeAreaPropertyType",
#         "aixm:ApproachLegPropertyType",
#         "aixm:ArrivalFeederLegPropertyType",
#         "aixm:ArrivalLegPropertyType",
#         "aixm:DepartureLegPropertyType",
#         "aixm:FinalLegPropertyType",
#         "aixm:InitialLegPropertyType",
#         "aixm:IntermediateLegPropertyType",
#         "aixm:MissedApproachLegPropertyType",
#         "aixm:NavigationAreaRestrictionPropertyType",
#         "aixm:ProcedurePropertyType",
#         "aixm:ProcedureDMEPropertyType",
#         "aixm:SegmentLegPropertyType",
#         "aixm:ChangeOverPointPropertyType",
#         "aixm:RoutePropertyType",
#         "aixm:RouteDMEPropertyType",
#         "aixm:RouteSegmentPropertyType",
#         "aixm:AirspaceBorderCrossingPropertyType",
#         "aixm:FlightRestrictionPropertyType",
#         "aixm:RulesProceduresPropertyType",
#         "aixm:AircraftGroundServicePropertyType",
#         "aixm:AirportClearanceServicePropertyType",
#         "aixm:AirportGroundServicePropertyType",
#         "aixm:AirportSuppliesServicePropertyType",
#         "aixm:AirTrafficControlServicePropertyType",
#         "aixm:AirTrafficManagementServicePropertyType",
#         "aixm:FireFightingServicePropertyType",
#         "aixm:GroundTrafficControlServicePropertyType",
#         "aixm:InformationServicePropertyType",
#         "aixm:PassengerServicePropertyType",
#         "aixm:PilotControlledLightingPropertyType",
#         "aixm:RadioCommunicationChannelPropertyType",
#         "aixm:SearchRescueServicePropertyType",
#         "aixm:ServicePropertyType",
#         "aixm:TrafficSeparationServicePropertyType",
#         "aixm:RadioFrequencyAreaPropertyType",
#         "aixm:SpecialDatePropertyType",
#         "aixm:StandardLevelColumnPropertyType",
#         "aixm:StandardLevelSectorPropertyType",
#         "aixm:StandardLevelTablePropertyType",
#         "aixm:HoldingAssessmentPropertyType",
#         "aixm:PrecisionApproachRadarPropertyType",
#         "aixm:PrimarySurveillanceRadarPropertyType",
#         "aixm:RadarEquipmentPropertyType",
#         "aixm:RadarSystemPropertyType",
#         "aixm:SecondarySurveillanceRadarPropertyType",   
#         "aixm:SurveillanceRadarPropertyType",
#     ],
#     "embed": [
#         "PointType",
#         "ElevatedPointType",
#         "CurveType",
#         "ElevatedCurveType",
#         "SurfaceType",
#         "ElevatedSurfaceType",
#     ],
#     "abstract": [],
#     "package": "com.aixm.delorean.core.schema.a5_1.aixm",
#     "output_path": "schema/aixm5_1/binding/aixm.xjb"
# }
# feature = {
#     "name" : "../aixm/AIXM_Features",
#     "path" : "schema/aixm5_1/aixm/AIXM_Features.xsd",
#     "strategy" : Machinery.strategy.feature,
#     "package" : "com.aixm.delorean.core.schema.a5_1.aixm",
#     "manual" : "util/manual/AIXM_Features.xjb"
# }

# data_types = {
#     "name" : "../aixm/AIXM_DataTypes",
#     "path" : "schema/aixm5_1/aixm/AIXM_DataTypes.xsd",
#     "strategy" : Machinery.strategy.data_type,
#     "manual" : "util/manual/AIXM_DataTypes.xjb"
# }

# abstract = {
#     "name" : "../aixm/AIXM_AbstractGML_ObjectTypes",
#     "path" : "schema/aixm5_1/aixm/AIXM_AbstractGML_ObjectTypes.xsd",
#     "strategy" : Machinery.strategy.abstract,
#     "manual" : "util/manual/AIXM_AbstractGML_ObjectTypes.xjb"
# }

# message = {
#     "name" : "../aixm/message/AIXM_BasicMessage",
#     "path" : "schema/aixm5_1/aixm/message/AIXM_BasicMessage.xsd",
#     "strategy" : Machinery.strategy.other,
#     "package" : "com.aixm.delorean.core.schema.a5_1.aixm.message",
#     "manual" : "util/manual/AIXM_BasicMessage.xjb"
# }

# machinery = Machinery.runner(config, debug, [data_types, feature, abstract, message],)