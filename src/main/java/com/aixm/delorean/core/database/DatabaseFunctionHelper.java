package com.aixm.delorean.core.database;

import java.util.Map;

import org.hibernate.Session;

import java.time.Instant;
import java.util.List;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.schema.a5_1.aixm.*;
import com.aixm.delorean.core.schema.a5_1.aixm.message.BasicMessageMemberAIXMPropertyType;

public class DatabaseFunctionHelper {

    enum TimeSliceAction{
        NEW,
        NOTHING,
        CHANGE,
        CORRECTION
    }


    public static <T extends AbstractAIXMFeatureType> MutationFeatureTimeslice A5_1HandelTimeSlice(
            BasicMessageMemberAIXMPropertyType basicMessageMember, 
            MutationFeatureTimeslice existing, 
            Session session) {
        AbstractAIXMFeatureType abstractFeature = basicMessageMember.getAbstractAIXMFeature(); 

        if (abstractFeature instanceof RunwayDirectionType feature) {
            for (RunwayDirectionTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayDirectionTimeSliceType ts = tsp.getRunwayDirectionTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayCentrelinePointType feature) {
            for (RunwayCentrelinePointTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayCentrelinePointTimeSliceType ts = tsp.getRunwayCentrelinePointTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayType feature) {
            for (RunwayTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayTimeSliceType ts = tsp.getRunwayTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ArrestingGearType feature) {
            for (ArrestingGearTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ArrestingGearTimeSliceType ts = tsp.getArrestingGearTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayElementType feature) {
            for (RunwayElementTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayElementTimeSliceType ts = tsp.getRunwayElementTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayVisualRangeType feature) {
            for (RunwayVisualRangeTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayVisualRangeTimeSliceType ts = tsp.getRunwayVisualRangeTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayBlastPadType feature) {
            for (RunwayBlastPadTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayBlastPadTimeSliceType ts = tsp.getRunwayBlastPadTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TaxiHoldingPositionType feature) {
            for (TaxiHoldingPositionTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TaxiHoldingPositionTimeSliceType ts = tsp.getTaxiHoldingPositionTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TaxiwayType feature) {
            for (TaxiwayTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TaxiwayTimeSliceType ts = tsp.getTaxiwayTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TaxiwayElementType feature) {
            for (TaxiwayElementTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TaxiwayElementTimeSliceType ts = tsp.getTaxiwayElementTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof GuidanceLineType feature) {
            for (GuidanceLineTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                GuidanceLineTimeSliceType ts = tsp.getGuidanceLineTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ApronType feature) {
            for (ApronTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ApronTimeSliceType ts = tsp.getApronTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ApronElementType feature) {
            for (ApronElementTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ApronElementTimeSliceType ts = tsp.getApronElementTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AircraftStandType feature) {
            for (AircraftStandTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AircraftStandTimeSliceType ts = tsp.getAircraftStandTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RoadType feature) {
            for (RoadTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RoadTimeSliceType ts = tsp.getRoadTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof DeicingAreaType feature) {
            for (DeicingAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                DeicingAreaTimeSliceType ts = tsp.getDeicingAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof PassengerLoadingBridgeType feature) {
            for (PassengerLoadingBridgeTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                PassengerLoadingBridgeTimeSliceType ts = tsp.getPassengerLoadingBridgeTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TouchDownLiftOffType feature) {
            for (TouchDownLiftOffTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TouchDownLiftOffTimeSliceType ts = tsp.getTouchDownLiftOffTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof FloatingDockSiteType feature) {
            for (FloatingDockSiteTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                FloatingDockSiteTimeSliceType ts = tsp.getFloatingDockSiteTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof MarkingBuoyType feature) {
            for (MarkingBuoyTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                MarkingBuoyTimeSliceType ts = tsp.getMarkingBuoyTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SeaplaneLandingAreaType feature) {
            for (SeaplaneLandingAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SeaplaneLandingAreaTimeSliceType ts = tsp.getSeaplaneLandingAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SeaplaneRampSiteType feature) {
            for (SeaplaneRampSiteTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SeaplaneRampSiteTimeSliceType ts = tsp.getSeaplaneRampSiteTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof WorkAreaType feature) {
            for (WorkAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                WorkAreaTimeSliceType ts = tsp.getWorkAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SurveyControlPointType feature) {
            for (SurveyControlPointTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SurveyControlPointTimeSliceType ts = tsp.getSurveyControlPointTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof NonMovementAreaType feature) {
            for (NonMovementAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                NonMovementAreaTimeSliceType ts = tsp.getNonMovementAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirportHeliportCollocationType feature) {
            for (AirportHeliportCollocationTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportHeliportCollocationTimeSliceType ts = tsp.getAirportHeliportCollocationTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirportHeliportType feature) {
            for (AirportHeliportTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportHeliportTimeSliceType ts = tsp.getAirportHeliportTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AltimeterSourceType feature) {
            for (AltimeterSourceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AltimeterSourceTimeSliceType ts = tsp.getAltimeterSourceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirportHotSpotType feature) {
            for (AirportHotSpotTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportHotSpotTimeSliceType ts = tsp.getAirportHotSpotTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AuthorityForAirspaceType feature) {
            for (AuthorityForAirspaceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AuthorityForAirspaceTimeSliceType ts = tsp.getAuthorityForAirspaceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirspaceType feature) {
            for (AirspaceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirspaceTimeSliceType ts = tsp.getAirspaceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof GeoBorderType feature) {
            for (GeoBorderTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                GeoBorderTimeSliceType ts = tsp.getGeoBorderTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RadarSystemType feature) {
            for (RadarSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RadarSystemTimeSliceType ts = tsp.getRadarSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof HoldingAssessmentType feature) {
            for (HoldingAssessmentTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                HoldingAssessmentTimeSliceType ts = tsp.getHoldingAssessmentTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof StandardLevelTableType feature) {
            for (StandardLevelTableTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                StandardLevelTableTimeSliceType ts = tsp.getStandardLevelTableTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof StandardLevelSectorType feature) {
            for (StandardLevelSectorTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                StandardLevelSectorTimeSliceType ts = tsp.getStandardLevelSectorTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof StandardLevelColumnType feature) {
            for (StandardLevelColumnTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                StandardLevelColumnTimeSliceType ts = tsp.getStandardLevelColumnTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RadioFrequencyAreaType feature) {
            for (RadioFrequencyAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RadioFrequencyAreaTimeSliceType ts = tsp.getRadioFrequencyAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SpecialDateType feature) {
            for (SpecialDateTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SpecialDateTimeSliceType ts = tsp.getSpecialDateTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RadioCommunicationChannelType feature) {
            for (RadioCommunicationChannelTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RadioCommunicationChannelTimeSliceType ts = tsp.getRadioCommunicationChannelTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof PilotControlledLightingType feature) {
            for (PilotControlledLightingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                PilotControlledLightingTimeSliceType ts = tsp.getPilotControlledLightingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AngleIndicationType feature) {
            for (AngleIndicationTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AngleIndicationTimeSliceType ts = tsp.getAngleIndicationTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof DistanceIndicationType feature) {
            for (DistanceIndicationTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                DistanceIndicationTimeSliceType ts = tsp.getDistanceIndicationTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof NavaidType feature) {
            for (NavaidTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                NavaidTimeSliceType ts = tsp.getNavaidTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SpecialNavigationStationType feature) {
            for (SpecialNavigationStationTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SpecialNavigationStationTimeSliceType ts = tsp.getSpecialNavigationStationTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SpecialNavigationSystemType feature) {
            for (SpecialNavigationSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SpecialNavigationSystemTimeSliceType ts = tsp.getSpecialNavigationSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof DesignatedPointType feature) {
            for (DesignatedPointTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                DesignatedPointTimeSliceType ts = tsp.getDesignatedPointTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SignificantPointInAirspaceType feature) {
            for (SignificantPointInAirspaceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SignificantPointInAirspaceTimeSliceType ts = tsp.getSignificantPointInAirspaceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AeronauticalGroundLightType feature) {
            for (AeronauticalGroundLightTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AeronauticalGroundLightTimeSliceType ts = tsp.getAeronauticalGroundLightTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof OrganisationAuthorityType feature) {
            for (OrganisationAuthorityTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                OrganisationAuthorityTimeSliceType ts = tsp.getOrganisationAuthorityTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof UnitType feature) {
            for (UnitTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                UnitTimeSliceType ts = tsp.getUnitTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ObstacleAreaType feature) {
            for (ObstacleAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ObstacleAreaTimeSliceType ts = tsp.getObstacleAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof VerticalStructureType feature) {
            for (VerticalStructureTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                VerticalStructureTimeSliceType ts = tsp.getVerticalStructureTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof CirclingAreaType feature) {
            for (CirclingAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                CirclingAreaTimeSliceType ts = tsp.getCirclingAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TerminalArrivalAreaType feature) {
            for (TerminalArrivalAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TerminalArrivalAreaTimeSliceType ts = tsp.getTerminalArrivalAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof NavigationAreaType feature) {
            for (NavigationAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                NavigationAreaTimeSliceType ts = tsp.getNavigationAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof NavigationAreaRestrictionType feature) {
            for (NavigationAreaRestrictionTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                NavigationAreaRestrictionTimeSliceType ts = tsp.getNavigationAreaRestrictionTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ProcedureDMEType feature) {
            for (ProcedureDMETimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ProcedureDMETimeSliceType ts = tsp.getProcedureDMETimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SafeAltitudeAreaType feature) {
            for (SafeAltitudeAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SafeAltitudeAreaTimeSliceType ts = tsp.getSafeAltitudeAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof HoldingPatternType feature) {
            for (HoldingPatternTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                HoldingPatternTimeSliceType ts = tsp.getHoldingPatternTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof UnplannedHoldingType feature) {
            for (UnplannedHoldingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                UnplannedHoldingTimeSliceType ts = tsp.getUnplannedHoldingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirspaceBorderCrossingType feature) {
            for (AirspaceBorderCrossingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirspaceBorderCrossingTimeSliceType ts = tsp.getAirspaceBorderCrossingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof FlightRestrictionType feature) {
            for (FlightRestrictionTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                FlightRestrictionTimeSliceType ts = tsp.getFlightRestrictionTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RouteSegmentType feature) {
            for (RouteSegmentTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RouteSegmentTimeSliceType ts = tsp.getRouteSegmentTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RouteDMEType feature) {
            for (RouteDMETimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RouteDMETimeSliceType ts = tsp.getRouteDMETimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RouteType feature) {
            for (RouteTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RouteTimeSliceType ts = tsp.getRouteTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ChangeOverPointType feature) {
            for (ChangeOverPointTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ChangeOverPointTimeSliceType ts = tsp.getChangeOverPointTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AerialRefuellingType feature) {
            for (AerialRefuellingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AerialRefuellingTimeSliceType ts = tsp.getAerialRefuellingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RulesProceduresType feature) {
            for (RulesProceduresTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RulesProceduresTimeSliceType ts = tsp.getRulesProceduresTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ArrivalLegType feature) {
            for (ArrivalLegTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ArrivalLegTimeSliceType ts = tsp.getArrivalLegTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof DepartureLegType feature) {
            for (DepartureLegTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                DepartureLegTimeSliceType ts = tsp.getDepartureLegTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ArrivalFeederLegType feature) {
            for (ArrivalFeederLegTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ArrivalFeederLegTimeSliceType ts = tsp.getArrivalFeederLegTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof FinalLegType feature) {
            for (FinalLegTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                FinalLegTimeSliceType ts = tsp.getFinalLegTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof InitialLegType feature) {
            for (InitialLegTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                InitialLegTimeSliceType ts = tsp.getInitialLegTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof IntermediateLegType feature) {
            for (IntermediateLegTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                IntermediateLegTimeSliceType ts = tsp.getIntermediateLegTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof MissedApproachLegType feature) {
            for (MissedApproachLegTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                MissedApproachLegTimeSliceType ts = tsp.getMissedApproachLegTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof InstrumentApproachProcedureType feature) {
            for (InstrumentApproachProcedureTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                InstrumentApproachProcedureTimeSliceType ts = tsp.getInstrumentApproachProcedureTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof StandardInstrumentDepartureType feature) {
            for (StandardInstrumentDepartureTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                StandardInstrumentDepartureTimeSliceType ts = tsp.getStandardInstrumentDepartureTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof StandardInstrumentArrivalType feature) {
            for (StandardInstrumentArrivalTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                StandardInstrumentArrivalTimeSliceType ts = tsp.getStandardInstrumentArrivalTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AzimuthType feature) {
            for (AzimuthTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AzimuthTimeSliceType ts = tsp.getAzimuthTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof DMEType feature) {
            for (DMETimeSlicePropertyType tsp : feature.getTimeSlice()) {
                DMETimeSliceType ts = tsp.getDMETimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ElevationType feature) {
            for (ElevationTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ElevationTimeSliceType ts = tsp.getElevationTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof GlidepathType feature) {
            for (GlidepathTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                GlidepathTimeSliceType ts = tsp.getGlidepathTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof LocalizerType feature) {
            for (LocalizerTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                LocalizerTimeSliceType ts = tsp.getLocalizerTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof MarkerBeaconType feature) {
            for (MarkerBeaconTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                MarkerBeaconTimeSliceType ts = tsp.getMarkerBeaconTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SDFType feature) {
            for (SDFTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SDFTimeSliceType ts = tsp.getSDFTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof NDBType feature) {
            for (NDBTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                NDBTimeSliceType ts = tsp.getNDBTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof VORType feature) {
            for (VORTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                VORTimeSliceType ts = tsp.getVORTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TACANType feature) {
            for (TACANTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TACANTimeSliceType ts = tsp.getTACANTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof DirectionFinderType feature) {
            for (DirectionFinderTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                DirectionFinderTimeSliceType ts = tsp.getDirectionFinderTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof CheckpointINSType feature) {
            for (CheckpointINSTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                CheckpointINSTimeSliceType ts = tsp.getCheckpointINSTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof CheckpointVORType feature) {
            for (CheckpointVORTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                CheckpointVORTimeSliceType ts = tsp.getCheckpointVORTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof InformationServiceType feature) {
            for (InformationServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                InformationServiceTimeSliceType ts = tsp.getInformationServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirTrafficManagementServiceType feature) {
            for (AirTrafficManagementServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirTrafficManagementServiceTimeSliceType ts = tsp.getAirTrafficManagementServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SearchRescueServiceType feature) {
            for (SearchRescueServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SearchRescueServiceTimeSliceType ts = tsp.getSearchRescueServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof GroundTrafficControlServiceType feature) {
            for (GroundTrafficControlServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                GroundTrafficControlServiceTimeSliceType ts = tsp.getGroundTrafficControlServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirTrafficControlServiceType feature) {
            for (AirTrafficControlServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirTrafficControlServiceTimeSliceType ts = tsp.getAirTrafficControlServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof PassengerServiceType feature) {
            for (PassengerServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                PassengerServiceTimeSliceType ts = tsp.getPassengerServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AircraftGroundServiceType feature) {
            for (AircraftGroundServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AircraftGroundServiceTimeSliceType ts = tsp.getAircraftGroundServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof FireFightingServiceType feature) {
            for (FireFightingServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                FireFightingServiceTimeSliceType ts = tsp.getFireFightingServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirportClearanceServiceType feature) {
            for (AirportClearanceServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportClearanceServiceTimeSliceType ts = tsp.getAirportClearanceServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirportSuppliesServiceType feature) {
            for (AirportSuppliesServiceTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportSuppliesServiceTimeSliceType ts = tsp.getAirportSuppliesServiceTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof PrecisionApproachRadarType feature) {
            for (PrecisionApproachRadarTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                PrecisionApproachRadarTimeSliceType ts = tsp.getPrecisionApproachRadarTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof PrimarySurveillanceRadarType feature) {
            for (PrimarySurveillanceRadarTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                PrimarySurveillanceRadarTimeSliceType ts = tsp.getPrimarySurveillanceRadarTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof SecondarySurveillanceRadarType feature) {
            for (SecondarySurveillanceRadarTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                SecondarySurveillanceRadarTimeSliceType ts = tsp.getSecondarySurveillanceRadarTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof VisualGlideSlopeIndicatorType feature) {
            for (VisualGlideSlopeIndicatorTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                VisualGlideSlopeIndicatorTimeSliceType ts = tsp.getVisualGlideSlopeIndicatorTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ApronLightSystemType feature) {
            for (ApronLightSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ApronLightSystemTimeSliceType ts = tsp.getApronLightSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TaxiwayLightSystemType feature) {
            for (TaxiwayLightSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TaxiwayLightSystemTimeSliceType ts = tsp.getTaxiwayLightSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayDirectionLightSystemType feature) {
            for (RunwayDirectionLightSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayDirectionLightSystemTimeSliceType ts = tsp.getRunwayDirectionLightSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TouchDownLiftOffLightSystemType feature) {
            for (TouchDownLiftOffLightSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TouchDownLiftOffLightSystemTimeSliceType ts = tsp.getTouchDownLiftOffLightSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof GuidanceLineLightSystemType feature) {
            for (GuidanceLineLightSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                GuidanceLineLightSystemTimeSliceType ts = tsp.getGuidanceLineLightSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayProtectAreaLightSystemType feature) {
            for (RunwayProtectAreaLightSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayProtectAreaLightSystemTimeSliceType ts = tsp.getRunwayProtectAreaLightSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TaxiHoldingPositionLightSystemType feature) {
            for (TaxiHoldingPositionLightSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TaxiHoldingPositionLightSystemTimeSliceType ts = tsp.getTaxiHoldingPositionLightSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ApproachLightingSystemType feature) {
            for (ApproachLightingSystemTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ApproachLightingSystemTimeSliceType ts = tsp.getApproachLightingSystemTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TaxiwayMarkingType feature) {
            for (TaxiwayMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TaxiwayMarkingTimeSliceType ts = tsp.getTaxiwayMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof ApronMarkingType feature) {
            for (ApronMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                ApronMarkingTimeSliceType ts = tsp.getApronMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof AirportProtectionAreaMarkingType feature) {
            for (AirportProtectionAreaMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                AirportProtectionAreaMarkingTimeSliceType ts = tsp.getAirportProtectionAreaMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TouchDownLiftOffMarkingType feature) {
            for (TouchDownLiftOffMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TouchDownLiftOffMarkingTimeSliceType ts = tsp.getTouchDownLiftOffMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayMarkingType feature) {
            for (RunwayMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayMarkingTimeSliceType ts = tsp.getRunwayMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof GuidanceLineMarkingType feature) {
            for (GuidanceLineMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                GuidanceLineMarkingTimeSliceType ts = tsp.getGuidanceLineMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof DeicingAreaMarkingType feature) {
            for (DeicingAreaMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                DeicingAreaMarkingTimeSliceType ts = tsp.getDeicingAreaMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TaxiHoldingPositionMarkingType feature) {
            for (TaxiHoldingPositionMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TaxiHoldingPositionMarkingTimeSliceType ts = tsp.getTaxiHoldingPositionMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof StandMarkingType feature) {
            for (StandMarkingTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                StandMarkingTimeSliceType ts = tsp.getStandMarkingTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof RunwayProtectAreaType feature) {
            for (RunwayProtectAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                RunwayProtectAreaTimeSliceType ts = tsp.getRunwayProtectAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        }
        else if (abstractFeature instanceof TouchDownLiftOffSafeAreaType feature) {
            for (TouchDownLiftOffSafeAreaTimeSlicePropertyType tsp : feature.getTimeSlice()) {
                TouchDownLiftOffSafeAreaTimeSliceType ts = tsp.getTouchDownLiftOffSafeAreaTimeSlice();
                return DatabaseFunctionHelper.mergeTimeSlice(ts, tsp, feature, existing, basicMessageMember, session);
            }
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractAIXMFeatureType : " + abstractFeature.getClass().getName(), new Exception());
            return existing;
        }

        return existing;
    }

    private static MutationFeatureTimeslice mergeTimeSlice(
            AbstractAIXMTimeSliceType ts,
            Object tsp,
            AbstractAIXMFeatureType feature,
            MutationFeatureTimeslice existing,
            BasicMessageMemberAIXMPropertyType bmm,
            Session session) {
        // 1. malformed timeslice are ignored
        if (ts == null) {
            return existing;
        }

        int incomingSeq = ts.getSequenceNumber().intValue();
        int incomingCorr = ts.getCorrectionNumber().intValue();

        // 2. new feature are persited at the basic message level
        if (existing == null) {
            session.persist(bmm);
            return existing;

        // 3. new changes are merged on the existing feature
        } else if (incomingSeq > existing.getSequenceNumber()) {
            // 3.a missing timesclice result in an error
            if (incomingSeq != existing.getSequenceNumber() + 1) {
                ConsoleLogger.log(LogLevel.WARN, "Missing Timeslice for feature [" + feature.getClass().getSimpleName() + "] : " +  existing.getIdentifier() + " between sequence numbers: " + existing.getSequenceNumber() + " and " + incomingSeq);
            }
            session.persist(tsp);
            existing.setAction(TimeSliceAction.CHANGE);
            existing.setTimeSliceProperty(tsp);
            existing.setNewTimeSliceStart(ts.getValidTime().getBeginPosition());
            return existing;
        
        // 4. correction changes are merged on the existing feature
        } else if (incomingSeq == existing.getSequenceNumber() && incomingCorr > existing.getCorrectionNumber()) {
            session.persist(tsp);
            existing.setAction(TimeSliceAction.CORRECTION);
            existing.setTimeSliceProperty(tsp);
            return existing;

        } else {
            existing.setAction(TimeSliceAction.NOTHING);
            return existing;

        }
    }
}
