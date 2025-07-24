def generate_java_if_chain(feature_names):
    lines = []

    for i, name in enumerate(feature_names):
        feature_type = f"{name}Type"
        slice_prop_type = f"{name}TimeSlicePropertyType"
        slice_type = f"{name}TimeSliceType"
        slice_getter = f"get{name}TimeSlice"

        prefix = "if" if i == 0 else "else if"
        lines.append(f"{prefix} (abstractFeature instanceof {feature_type} feature) {{")
        lines.append(f"    for ({slice_prop_type} tsp : feature.getTimeSlice()) {{")
        lines.append(f"        {slice_type} ts = tsp.{slice_getter}();")
        lines.append(f"        return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);")
        lines.append("    }")
        lines.append("}")

    # Add default else
    lines.append("else {")
    lines.append('    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractAIXMFeatureType : " + abstractFeature.getClass().getName(), new Exception());')
    lines.append("    return existing;")
    lines.append("}")

    return "\n".join(lines)


# Example usage:
feature_names = [
    "RunwayDirection",
    "RunwayCentrelinePoint",
    "Runway",
    "ArrestingGear",
    "RunwayElement",
    "RunwayVisualRange",
    "RunwayBlastPad",
    "TaxiHoldingPosition",
    "Taxiway",
    "TaxiwayElement",
    "GuidanceLine",
    "Apron",
    "ApronElement",
    "AircraftStand",
    "Road",
    "DeicingArea",
    "PassengerLoadingBridge",
    "TouchDownLiftOff",
    "FloatingDockSite",
    "MarkingBuoy",
    "SeaplaneLandingArea",
    "SeaplaneRampSite",
    "WorkArea",
    "SurveyControlPoint",
    "NonMovementArea",
    "AirportHeliportCollocation",
    "AirportHeliport",
    "AltimeterSource",
    "AirportHotSpot",
    "AuthorityForAirspace",
    "Airspace",
    "GeoBorder",
    "RadarSystem",
    "HoldingAssessment",
    "StandardLevelTable",
    "StandardLevelSector",
    "StandardLevelColumn",
    "RadioFrequencyArea",
    "SpecialDate",
    "RadioCommunicationChannel",
    "PilotControlledLighting",
    "AngleIndication",
    "DistanceIndication",
    "Navaid",
    "SpecialNavigationStation",
    "SpecialNavigationSystem",
    "DesignatedPoint",
    "SignificantPointInAirspace",
    "AeronauticalGroundLight",
    "OrganisationAuthority",
    "Unit",
    "ObstacleArea",
    "VerticalStructure",
    "CirclingArea",
    "TerminalArrivalArea",
    "NavigationArea",
    "NavigationAreaRestriction",
    "ProcedureDME",
    "SafeAltitudeArea",
    "HoldingPattern",
    "UnplannedHolding",
    "AirspaceBorderCrossing",
    "FlightRestriction",
    "RouteSegment",
    "RouteDME",
    "Route",
    "ChangeOverPoint",
    "AerialRefuelling",
    "RulesProcedures",
    "ArrivalLeg",
    "DepartureLeg",
    "ArrivalFeederLeg",
    "FinalLeg",
    "InitialLeg",
    "IntermediateLeg",
    "MissedApproachLeg",
    "InstrumentApproachProcedure",
    "StandardInstrumentDeparture",
    "StandardInstrumentArrival",
    "Azimuth",
    "DME",
    "Elevation",
    "Glidepath",
    "Localizer",
    "MarkerBeacon",
    "SDF",
    "NDB",
    "VOR",
    "TACAN",
    "DirectionFinder",
    "CheckpointINS",
    "CheckpointVOR",
    "InformationService",
    "AirTrafficManagementService",
    "SearchRescueService",
    "GroundTrafficControlService",
    "AirTrafficControlService",
    "PassengerService",
    "AircraftGroundService",
    "FireFightingService",
    "AirportClearanceService",
    "AirportSuppliesService",
    "PrecisionApproachRadar",
    "PrimarySurveillanceRadar",
    "SecondarySurveillanceRadar",
    "VisualGlideSlopeIndicator",
    "ApronLightSystem",
    "TaxiwayLightSystem",
    "RunwayDirectionLightSystem",
    "TouchDownLiftOffLightSystem",
    "GuidanceLineLightSystem",
    "RunwayProtectAreaLightSystem",
    "TaxiHoldingPositionLightSystem",
    "ApproachLightingSystem",
    "TaxiwayMarking",
    "ApronMarking",
    "AirportProtectionAreaMarking",
    "TouchDownLiftOffMarking",
    "RunwayMarking",
    "GuidanceLineMarking",
    "DeicingAreaMarking",
    "TaxiHoldingPositionMarking",
    "StandMarking",
    "RunwayProtectArea",
    "TouchDownLiftOffSafeArea",
]

java_code = generate_java_if_chain(feature_names)
print(java_code)
