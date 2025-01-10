from machinery import Machinery
from annotation import Tag, Strategy

# Snowflake : 
# segmentpointpropertygroup_facilitymakeup (3)
# propertieswithschedulepropertygroup_timeinterval (28)
# propertieswithschedulepropertygroup_annotation 
# propertieswithschedulepropertygroup_specialdateauthority (28)
# airspacelayerclasspropertygroup_associatedlevels 

debug = {
    "mode" : False,
    "entity" : {
        "mode" : True,
        "list" : ["PointPropertyType"]
    },
}

schema = {
    "Aerial Refuelling" : {
        "schema" : "aerial_refuelling",
        "list" : [
            "AerialRefuelling",
            "AerialRefuellingAnchor",
            "AerialRefuellingPoint",
            "AerialRefuellingTrack",
            "AuthorityForAerialRefuelling",
        ],
    },
    "Airport Heliport" : {
        "schema" : "airport_heliport",
        "list" : [
            "AirportHeliport",
            "AirportHeliportAvailability",
            "AirportHeliportCollocation",
            "AirportHeliportProtectionArea",
            "AirportHeliportResponsibilityOrganisation",
            "AirportHeliportUsage",
            "AirportHotSpot",
            "AltimeterSource",
            "AltimeterSourceStatus",
            "City",
            "ConditionCombination",
            "NonMovementArea",
            "SurfaceCharacteristics",
            "SurveyControlPoint",
            "UsageCondition",
            "WorkArea",
            "WorkareaActivity",
        ],
    },
    "Apron " : {
        "schema" : "apron",
        "list" : [
            "AircraftStand",
            "Apron",
            "ApronAreaAvailability",
            "ApronAreaUsage",
            "ApronElement",
            "DeicingArea",
            "PassengerLoadingBridge",
            "Road",
        ],
    }, 
    "Helicopter Surfaces" : {
        "schema" : "helicopter_surfaces",
        "list" : [
            "TouchDownLiftOff",
            "TouchDownLiftOffSafeArea",
        ],
    },
    "Lighting" : {
        "schema" : "lighting",
        "list" : [
            "ApproachLightingSystem",
            "ApronLightSystem",
            "GroundLightSystem",
            "GroundLightingAvailability",
            "GuidanceLineLightSystem",
            "LightActivation",
            "RunwayDirectionLightSystem",
            "RunwayProtectAreaLightSystem",
            "TaxiHoldingPositionLightSystem",
            "TaxiwayLightSystem",
            "TouchDownLiftOffLightSystem",
        ],
    },
    "Markings" : {
        "schema" : "markings",
        "list" : [
            "AirportProtectionAreaMarking",
            "ApronMarking",
            "DeicingAreaMarking",
            "GuidanceLineMarking",
            "Marking",
            "MarkingElement",
            "MarkingExtent",
            "RunwayMarking",
            "StandMarking",
            "TaxiHoldingPositionMarking",
            "TaxiwayMarking",
            "TouchDownLiftOffMarking",
        ],
    },
    "Runway" : {
        "schema" : "runway",
        "list" : [
            "ArrestingGear",
            "ArrestingGearExtent",
            "ManoeuvringAreaAvailability",
            "ManoeuvringAreaUsage",
            "NavaidEquipmentDistance",
            "Runway",
            "RunwayBlastPad",
            "RunwayCentrelinePoint",
            "RunwayDeclaredDistance",
            "RunwayDeclaredDistanceValue",
            "RunwayDirection",
            "RunwayElement",
            "RunwayProtectArea",
            "RunwayVisualRange",
            "VisualGlideSlopeIndicator",
        ],
    },
    "Seaplanes" : {
        "schema" : "seaplanes",
        "list" : [
            "FloatingDockSite",
            "MarkingBuoy",
            "SeaplaneLandingArea",
            "SeaplaneRampSite",
        ],
    },
    "Surface Contamination" : {
        "schema" : "surface_contamination",
        "list" : [
            "AircraftStandContamination",
            "AirportHeliportContamination",
            "ApronContamination",
            "Ridge",
            "RunwayContamination",
            "RunwaySectionContamination",
            "SurfaceContamination",
            "SurfaceContaminationLayer",
            "TaxiwayContamination",
            "TouchDownLiftOffContamination",
        ],
    },
    "Taxiway" : {
        "schema" : "taxiway",
        "list" : [
            "GuidanceLine",
            "TaxiHoldingPosition",
            "Taxiway",
            "TaxiwayElement",
        ],
    },
    "Airspace" : {
        "schema" : "airspace",
        "list" : [
            "Airspace",
            "AirspaceActivation",
            "AirspaceGeometryComponent",
            "AirspaceLayerClass",
            "AirspaceVolume",
            "AirspaceVolumeDependency",
            "AuthorityForAirspace",
            "GeoBorder",
        ],
    },
    "Geometry" : {
        "schema" : "geometry",
        "list" : [
            "Curve",
            "ElevatedCurve",
            "ElevatedPoint",
            "ElevatedSurface",
            "Point",
            "Surface",
        ],
    },
    "Holding" : {
        "schema" : "holding",
        "list" : [
            "HoldingPattern",
            "HoldingPatternDistance",
            "HoldingPatternDuration",
            "HoldingPatternLength",
            "UnplannedHolding",
        ],
    },
    "Guidance Service" : {
        "schema" : "guidance_service",
        "list" : [
            "GuidanceService",
            ],
    },
    "Navaids" : {
        "schema" : "navaids",
        "list" : [
            "AuthorityForNavaidEquipment",
            "AuthorityForSpecialNavigationStation",
            "AuthorityForSpecialNavigationSystem",
            "Azimuth",
            "CheckpointINS",
            "CheckpointVOR",
            "DME",
            "DirectionFinder",
            "Elevation",
            "Glidepath",
            "Localizer",
            "MarkerBeacon",
            "NDB",
            "Navaid",
            "NavaidComponent",
            "NavaidEquipment",
            "NavaidEquipmentMonitoring",
            "NavaidOperationalStatus",
            "NavigationSystemCheckpoint",
            "SDF",
            "SpecialNavigationStation",
            "SpecialNavigationStationStatus",
            "SpecialNavigationSystem",
            "TACAN",
            "VOR",
        ],
    },
    "Point Reference" : {
        "schema" : "point_reference",
        "list" : [
            "AngleIndication",
            "AngleUse",
            "DistanceIndication",
            "EnRouteSegmentPoint",
            "PointReference",
            "SegmentPoint",
            "TerminalSegmentPoint",
        ],
    },
    "Points" : {
        "schema" : "points",
        "list" : [
            "DesignatedPoint",
            "SignificantPoint",
            "SignificantPointInAirspace",
        ],
    },
    "Visual Navigation" : {
        "schema" : "visual_navigation",
        "list" : [
            "AeronauticalGroundLight",
        ],
    },
    "Notes" : {
        "schema" : "notes",
        "list" : [
            "LinguisticNote",
            "Note"
            ],
    },
    "Obstacles" : {
        "schema" : "obstacles",
        "list" : [
            "ObstacleArea",
            "ObstacleAreaOrigin",
            "VerticalStructure",
            "VerticalStructureLightingStatus",
            "VerticalStructurePart",
            "VerticalStructurePartGeometry",
        ],
    },
    "Organisation" : {
        "schema" : "organisation",
        "list" : [
            "OrganisationAuthority",
            "OrganisationAuthorityAssociation",
            "Unit",
            "UnitAvailability",
            "UnitDependency",
        ],
    },
    "Approach" : {
        "schema" : "approach",
        "list" : [
            "ApproachAltitudeTable",
            "ApproachCondition",
            "ApproachDistanceTable",
            "ApproachTimingTable",
            "FinalProfile",
            "InstrumentApproachProcedure",
            "MissedApproachGroup",

        ],
    },
    "Terminal" : {
        "schema" : "terminal",
        "list" : [
            "TerminalArrivalArea",
            "TerminalArrivalAreaSector",
        ],
    },
    "Segment Leg" : {
        "schema" : "segment_leg",
        "list" : [
            "FASDataBlock"
        ],
    },
    "Circling" : {
        "schema" : "circling",
        "list" : [
            "CirclingArea",
            "CirclingRestriction",
        ],
    },
    "Minima" : {
        "schema" : "minima",
        "list" : [
            "EquipmentUnavailableAdjustment",
            "EquipmentUnavailableAdjustmentColumn",
            "Minima",
        ],
    },
    "Arrival" : {
        "schema" : "arrival",
        "list" : [
            "StandardInstrumentArrival",
        ],
    },
    "Departure" : {
        "schema" : "departure",
        "list" : [
            "DepartureArrivalCondition",
            "NavigationArea",
            "NavigationAreaSector",
            "SectorDesign",
            "StandardInstrumentDeparture",
        ],
    },
    "Safe Altitude" : {
        "schema" : "safe_altitude",
        "list" : [
            "SafeAltitudeArea",
            "SafeAltitudeAreaSector",
        ],
    },
    "Procedure Overview" : {
        "schema" : "procedure",
        "list" : [
            "ApproachLeg",
            "ArrivalFeederLeg",
            "ArrivalLeg",
            "DepartureLeg",
            "FinalLeg",
            "HoldingUse",
            "InitialLeg",
            "IntermediateLeg",
            "LandingTakeoffAreaCollection",
            "MissedApproachLeg",
            "NavigationAreaRestriction",
            "Procedure",
            "ProcedureDME",
            "ProcedureTransition",  
            "ProcedureTransitionLeg",
            "SegmentLeg",
        ],
    },
    "Usage" : {
        "schema" : "usage",
        "list" : [
            "ProcedureAvailability",
        ],
    },
    "En Route" : {
        "schema" : "en_route",
        "list" : [
            "ChangeOverPoint",
            "Route",
            "RouteAvailability",
            "RouteDME",
            "RoutePortion",  
            "RouteSegment",
        ],
    },
    "Flight Restrictions" : {
        "schema" : "flight_restrictions",
        "list" : [
            "AirspaceBorderCrossing",
            "DirectFlight",
            "DirectFlightClass",
            "DirectFlightSegment",
            "FlightConditionCircumstance",
            "FlightConditionCombination",
            "FlightConditionElement",
            "FlightConditionElementChoice",
            "FlightRestriction",
            "FlightRestrictionLevel",
            "FlightRestrictionRoute",
            "FlightRoutingElement",
            "FlightRoutingElementChoice",
        ],
    },
    "Rules Procedures" : {
        "schema" : "rules_procedures",
        "list" : [
            "RulesProcedures",
        ],
    },
    "Service" : {
        "schema" : "service",
        "list" : [
            "AirTrafficControlService",
            "AirTrafficManagementService",
            "AircraftGroundService",
            "AirportClearanceService",
            "AirportGroundService",
            "AirportSuppliesService",
            "CallsignDetail",
            "FireFightingService",
            "Fuel",
            "GroundTrafficControlService",
            "InformationService",
            "Nitrogen",
            "Oil",
            "Oxygen",
            "PassengerService",
            "PilotControlledLighting",
            "RadioCommunicationChannel",
            "RadioCommunicationOperationalStatus",
            "SearchRescueService",
            "Service",
            "ServiceOperationalStatus",
            "TrafficSeparationService",
        ],
    },
    "Address" : {
        "schema" : "address",
        "list" : [
            "ContactInformation",
            "OnlineContact",
            "PostalAddress",
            "TelephoneContact",
        ],
    },
    "Aircraft And Flight" : {
        "schema" : "aircraft_and_flight",
        "list" : [
            "AircraftCharacteristic",
            "FlightCharacteristic",
        ],
    },
    "Airspace Layer" : {
        "schema" : "airspace_layer",
        "list" : [
            "AirspaceLayer",
        ],
    },
    "Circle Sector" : {
        "schema" : "circle_sector",
        "list" : [
            "CircleSector",
        ],
    },
    "Light Element" : {
        "schema" : "light_element",
        "list" : [
            "LightElement",
            "LightElementStatus",
        ],
    },
    "Meteorology" : {
        "schema" : "meteorology",
        "list" : [
            "Meteorology",
        ],
    },
    "Radio Frequency Limitation" : {
        "schema" : "radio_frequency_limitation",
        "list" : [
            "EquipmentChoice",
            "RadioFrequencyArea",
        ],
    },
    "Schedules" : {
        "schema" : "schedules",
        "list" : [
            "PropertiesWithSchedule",
            "SpecialDate",
            "Timesheet",
        ],
    },
    "Standard Levels" : {
        "schema" : "standard_levels",
        "list" : [
            "StandardLevel",
            "StandardLevelColumn",
            "StandardLevelSector",
            "StandardLevelTable",
        ],
    },
    "Surface Assessment" : {
        "schema" : "surface_assessment",
        "list" : [
            "AltitudeAdjustment",
            "HoldingAssessment",
            "ObstacleAssessmentArea",
            "ObstaclePlacement",
            "Obstruction"
        ],
    },
    "Surveillance" : {
        "schema" : "surveillance",
        "list" : [
            "PrecisionApproachRadar",
            "PrimarySurveillanceRadar",
            "RadarComponent",
            "RadarEquipment",
            "RadarSystem",
            "Reflector",
            "SecondarySurveillanceRadar",
            "SurveillanceGroundStation",
            "SurveillanceRadar",
        ],
    }


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
        ],
    "abstract": [
        "AbstractMarkingType",
        "AbstractAirportHeliportProtectionAreaType",
        "AbstractGroundLightSystemType",
        "AbstractNavigationSystemCheckpointType",
        "AbstractNavaidEquipmentType",
        "AbstractProcedureType",
        "AbstractSegmentLegType",
        "AbstractApproachLegType",
        "AbstractServiceType",
        "AbstractTrafficSeparationServiceType",
        "AbstractAirportGroundServiceType",
        "AbstractRadarEquipmentType",
        "AbstractExtensionType",
        "AbstractUsageConditionType",
        "AbstractSurfaceContaminationType",
        "AbstractSegmentPointType",
        "AbstractDirectFlightType",
        "AbstractPropertiesWithScheduleType",
    ],
    "package": "com.aixm.delorean.core.schema.a5_1_1.aixm",
    "output_path": "schema/aixm5_1_1/binding/aixm.xjb"
}

feature = {
    "name" : "../aixm/AIXM_Features",
    "path" : "schema/aixm5_1_1/aixm/AIXM_Features.xsd",
    "strategy" : Strategy.feature,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm",
    "manual" : "util/manual/a5_1_1/AIXM_Features.xjb"
}

data_types = {
    "name" : "../aixm/AIXM_DataTypes",
    "path" : "schema/aixm5_1_1/aixm/AIXM_DataTypes.xsd",
    "strategy" : Strategy.data_type,
    "manual" : "util/manual/a5_1_1/AIXM_DataTypes.xjb"
}

abstract = {
    "name" : "../aixm/AIXM_AbstractGML_ObjectTypes",
    "path" : "schema/aixm5_1_1/aixm/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategy" : Strategy.abstract,
    "manual" : "util/manual/a5_1_1/AIXM_AbstractGML_ObjectTypes.xjb"
}

message = {
    "name" : "../aixm/message/AIXM_BasicMessage",
    "path" : "schema/aixm5_1_1/aixm/message/AIXM_BasicMessage.xsd",
    "strategy" : Strategy.other,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm.message",
    "manual" : "util/manual/a5_1_1/AIXM_BasicMessage.xjb"
}



machinery = Machinery(config, debug, schema, [data_types, feature, abstract, message])

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
        ],
    "abstract": [
        "AbstractMarkingType",
        "AbstractAirportHeliportProtectionAreaType",
        "AbstractGroundLightSystemType",
        "AbstractNavigationSystemCheckpointType",
        "AbstractNavaidEquipmentType",
        "AbstractProcedureType",
        "AbstractSegmentLegType",
        "AbstractApproachLegType",
        "AbstractServiceType",
        "AbstractTrafficSeparationServiceType",
        "AbstractAirportGroundServiceType",
        "AbstractRadarEquipmentType",
        "AbstractExtensionType",
        "AbstractUsageConditionType",
        "AbstractSurfaceContaminationType",
        "AbstractSegmentPointType",
        "AbstractDirectFlightType",
        "AbstractPropertiesWithScheduleType",
    ],
    "package": "com.aixm.delorean.core.schema.a5_1.aixm",
    "output_path": "schema/aixm5_1/binding/aixm.xjb"
}

feature = {
    "name" : "../aixm/AIXM_Features",
    "path" : "schema/aixm5_1/aixm/AIXM_Features.xsd",
    "strategy" : Strategy.feature,
    "package" : "com.aixm.delorean.core.schema.a5_1.aixm",
    "manual" : "util/manual/a5_1/AIXM_Features.xjb"
}

data_types = {
    "name" : "../aixm/AIXM_DataTypes",
    "path" : "schema/aixm5_1/aixm/AIXM_DataTypes.xsd",
    "strategy" : Strategy.data_type,
    "manual" : "util/manual/a5_1/AIXM_DataTypes.xjb"
}

abstract = {
    "name" : "../aixm/AIXM_AbstractGML_ObjectTypes",
    "path" : "schema/aixm5_1/aixm/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategy" : Strategy.abstract,
    "manual" : "util/manual/a5_1/AIXM_AbstractGML_ObjectTypes.xjb"
}

message = {
    "name" : "../aixm/message/AIXM_BasicMessage",
    "path" : "schema/aixm5_1/aixm/message/AIXM_BasicMessage.xsd",
    "strategy" : Strategy.other,
    "package" : "com.aixm.delorean.core.schema.a5_1.aixm.message",
    "manual" : "util/manual/a5_1/AIXM_BasicMessage.xjb"
}

machinery = Machinery(config, debug, schema, [data_types, feature, abstract, message],)