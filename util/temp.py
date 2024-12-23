classes = [
    "AerialRefuellingType.class",
    "AirportHeliportType.class",
    "AirportHeliportCollocationType.class",
    "AirportHotSpotType.class",
    "AltimeterSourceType.class",
    "NonMovementAreaType.class",
    "SurveyControlPointType.class",
    "WorkAreaType.class",
    "AircraftStandType.class",
    "ApronType.class",
    "ApronElementType.class",
    "DeicingAreaType.class",
    "PassengerLoadingBridgeType.class",
    "RoadType.class",
    "TouchDownLiftOffType.class",
    "AbstractMarkingType.class",
    "ArrestingGearType.class",
    "RunwayType.class",
    "RunwayBlastPadType.class",
    "RunwayCentrelinePointType.class",
    "RunwayDirectionType.class",
    "RunwayElementType.class",
    "AbstractAirportHeliportProtectionAreaType.class",
    "RunwayVisualRangeType.class",
    "AbstractGroundLightSystemType.class",
    "FloatingDockSiteType.class",
    "MarkingBuoyType.class",
    "SeaplaneLandingAreaType.class",
    "SeaplaneRampSiteType.class",
    "GuidanceLineType.class",
    "TaxiHoldingPositionType.class",
    "TaxiwayType.class",
    "TaxiwayElementType.class",
    "AirspaceType.class",
    "AuthorityForAirspaceType.class",
    "GeoBorderType.class",
    "HoldingPatternType.class",
    "UnplannedHoldingType.class",
    "AbstractNavigationSystemCheckpointType.class",
    "NavaidType.class",
    "SpecialNavigationStationType.class",
    "SpecialNavigationSystemType.class",
    "AbstractNavaidEquipmentType.class",
    "AngleIndicationType.class",
    "DistanceIndicationType.class",
    "DesignatedPointType.class",
    "SignificantPointInAirspaceType.class",
    "AeronauticalGroundLightType.class",
    "ObstacleAreaType.class",
    "VerticalStructureType.class",
    "OrganisationAuthorityType.class",
    "UnitType.class",
    "TerminalArrivalAreaType.class",
    "CirclingAreaType.class",
    "NavigationAreaType.class",
    "AbstractProcedureType.class",
    "SafeAltitudeAreaType.class",
    "AbstractSegmentLegType.class",
    "NavigationAreaRestrictionType.class",
    "ProcedureDMEType.class",
    "ChangeOverPointType.class",
    "RouteType.class",
    "RouteDMEType.class",
    "RouteSegmentType.class",
    "AirspaceBorderCrossingType.class",
    "FlightRestrictionType.class",
    "RulesProceduresType.class",
    "PilotControlledLightingType.class",
    "RadioCommunicationChannelType.class",
    "AbstractServiceType.class",
    "RadioFrequencyAreaType.class",
    "SpecialDateType.class",
    "StandardLevelColumnType.class",
    "StandardLevelSectorType.class",
    "StandardLevelTableType.class",
    "HoldingAssessmentType.class",
    "RadarSystemType.class",
    "AbstractRadarEquipmentType.class",
]

java_code = [
    "if (v != null) {",
    "    Class<? extends AbstractAIXMFeatureType> clazz = v.getDeclaredType();",
    "",
]

for cls in classes:
    class_name = cls.replace(".class", "")
    java_code.append(f"    if (clazz.equals({class_name}.class)) {{")
    java_code.append(f"        return ({class_name}) v.getValue();")
    java_code.append("    }")

java_code.append("    // Optional: Add a fallback for other subtypes")
java_code.append("    throw new IllegalArgumentException(\"Unsupported feature type: \" + clazz.getName());")
java_code.append("} else {")
java_code.append("    System.out.println(\"FeatureAdapter.unmarshal: null\");")
java_code.append("    return null;")
java_code.append("}")

with open("generated_code.java", "w") as file:
    file.write("\n".join(java_code))
