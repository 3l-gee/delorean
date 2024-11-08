package com.aixm.delorean.core.database;

import org.hibernate.cfg.Configuration;

import java.util.Arrays;
import java.util.List;

public enum DatabaseConfig {

    AIXM_5_1_1(
        "a5_1_1",                                    // version
        "jdbc:postgresql://localhost:5432/delorean", // Default URL
        "postgres",                             // Default username
        "postgres",                             // Default password
        5,                         // Connection pool min size
        20,                        // Connection pool max size
        true,                                    // Hibernate show_sql
        "update",                            // Hibernate hbm2ddl.auto
        new Class<?>[]{
            com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingAnchorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingTrackType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForAerialRefuellingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportAvailabilityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportCollocationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportCollocationTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportResponsibilityOrganisationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportUsageType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHotSpotType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHotSpotTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AltimeterSourceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AltimeterSourceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AltimeterSourceStatusType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ConditionCombinationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NonMovementAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NonMovementAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceCharacteristicsType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SurveyControlPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SurveyControlPointTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.WorkAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.WorkAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.WorkareaActivityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftStandType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftStandTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronAreaAvailabilityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronAreaUsageType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronElementTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerLoadingBridgeType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerLoadingBridgeTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RoadType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RoadTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffSafeAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffSafeAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachLightingSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachLightingSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronLightSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GroundLightingAvailabilityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineLightSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LightActivationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionLightSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaLightSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionLightSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayLightSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffLightSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportProtectionAreaMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportProtectionAreaMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MarkingElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffMarkingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrestingGearType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrestingGearTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ManoeuvringAreaAvailabilityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ManoeuvringAreaUsageType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidEquipmentDistanceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayBlastPadType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayBlastPadTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayCentrelinePointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayCentrelinePointTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDeclaredDistanceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDeclaredDistanceValueType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayElementTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayVisualRangeType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayVisualRangeTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VisualGlideSlopeIndicatorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VisualGlideSlopeIndicatorTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FloatingDockSiteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FloatingDockSiteTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MarkingBuoyType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MarkingBuoyTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneLandingAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneLandingAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneRampSiteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneRampSiteTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftStandContaminationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportContaminationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronContaminationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RidgeType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayContaminationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwaySectionContaminationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceContaminationLayerType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayContaminationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffContaminationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayElementTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceActivationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceGeometryComponentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceLayerClassType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceVolumeType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceVolumeDependencyType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForAirspaceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForAirspaceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GeoBorderType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GeoBorderTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternDistanceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternDurationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnplannedHoldingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnplannedHoldingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForNavaidEquipmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForSpecialNavigationStationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForSpecialNavigationSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AzimuthType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AzimuthTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointINSType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointINSTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointVORType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointVORTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DirectionFinderType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DirectionFinderTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DMEType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DMETimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ElevationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ElevationTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GlidepathType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GlidepathTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LocalizerType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LocalizerTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MarkerBeaconType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MarkerBeaconTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidComponentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidEquipmentMonitoringType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidOperationalStatusType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NDBType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NDBTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SDFType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SDFTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationStationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationStationTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationStationStatusType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TACANType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TACANTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VORType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VORTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AngleIndicationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AngleIndicationTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AngleUseType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DistanceIndicationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DistanceIndicationTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.EnRouteSegmentPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PointReferenceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalSegmentPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DesignatedPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DesignatedPointTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SignificantPointInAirspaceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SignificantPointInAirspaceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AeronauticalGroundLightType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AeronauticalGroundLightTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LinguisticNoteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NoteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ObstacleAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ObstacleAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructureType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructureTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructureLightingStatusType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructurePartType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.OrganisationAuthorityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.OrganisationAuthorityTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.OrganisationAuthorityAssociationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnitType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnitTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnitAvailabilityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnitDependencyType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachAltitudeTableType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachConditionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachDistanceTableType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachTimingTableType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FinalProfileType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InstrumentApproachProcedureType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InstrumentApproachProcedureTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MissedApproachGroupType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalArrivalAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalArrivalAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalArrivalAreaSectorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FASDataBlockType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CirclingAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CirclingAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CirclingRestrictionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.EquipmentUnavailableAdjustmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.EquipmentUnavailableAdjustmentColumnType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MinimaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentArrivalType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentArrivalTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DepartureArrivalConditionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaSectorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SectorDesignType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentDepartureType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentDepartureTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SafeAltitudeAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SafeAltitudeAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SafeAltitudeAreaSectorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalFeederLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalFeederLegTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalLegTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DepartureLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DepartureLegTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FinalLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FinalLegTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingUseType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InitialLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InitialLegTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.IntermediateLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.IntermediateLegTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LandingTakeoffAreaCollectionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MissedApproachLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MissedApproachLegTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaRestrictionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaRestrictionTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureDMEType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureDMETimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureTransitionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureTransitionLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureAvailabilityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ChangeOverPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ChangeOverPointTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteAvailabilityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteDMEType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteDMETimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RoutePortionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteSegmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteSegmentTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceBorderCrossingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceBorderCrossingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DirectFlightClassType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DirectFlightSegmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightConditionCircumstanceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightConditionCombinationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightConditionElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionLevelType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionRouteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRoutingElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RulesProceduresType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RulesProceduresTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftGroundServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftGroundServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportClearanceServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportClearanceServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportSuppliesServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportSuppliesServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficControlServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficControlServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficManagementServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficManagementServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CallsignDetailType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FireFightingServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FireFightingServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FuelType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GroundTrafficControlServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GroundTrafficControlServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InformationServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InformationServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NitrogenType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.OilType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.OxygenType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PilotControlledLightingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PilotControlledLightingTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadioCommunicationChannelType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadioCommunicationChannelTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadioCommunicationOperationalStatusType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SearchRescueServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SearchRescueServiceTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ServiceOperationalStatusType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ContactInformationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.OnlineContactType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PostalAddressType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TelephoneContactType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftCharacteristicType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightCharacteristicType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceLayerType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CircleSectorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LightElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LightElementStatusType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MeteorologyType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadioFrequencyAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadioFrequencyAreaTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialDateType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialDateTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TimesheetType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelColumnType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelColumnTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelSectorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelSectorTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelTableType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelTableTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AltitudeAdjustmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingAssessmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingAssessmentTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ObstacleAssessmentAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ObstaclePlacementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ObstructionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PrecisionApproachRadarType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PrecisionApproachRadarTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PrimarySurveillanceRadarType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PrimarySurveillanceRadarTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadarComponentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadarSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadarSystemTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ReflectorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SecondarySurveillanceRadarType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SecondarySurveillanceRadarTimeSliceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SurveillanceGroundStationType.class,
        } // Mapping classes
    ),
    SCHOOL(
        "school",
        "jdbc:postgresql://localhost:5432/delorean",
        "postgres",
        "postgres",
        5,
        20,
        true,
        "update",
        new Class<?>[]{
            // com.aixm.delorean.core.schema.school.School.class,
            // com.aixm.delorean.core.schema.school.Classroom.class,
            // com.aixm.delorean.core.schema.school.Student.class,
            // com.aixm.delorean.core.schema.school.Teacher.class,
            // com.aixm.delorean.core.schema.school.AixmPointPropertyType.class,
            // com.aixm.delorean.core.schema.school.ElevatedPointPropertyType.class,
            // com.aixm.delorean.core.schema.school.AixmCurvePropertyType.class,
            // com.aixm.delorean.core.schema.school.ElevatedCurvePropertyType.class,
            // com.aixm.delorean.core.schema.school.SurfacePropertyType.class,
            // com.aixm.delorean.core.schema.school.ElevatedSurfacePropertyType.class,
            // com.aixm.delorean.core.schema.school.ImplementationAixmPoint.class,
            // com.aixm.delorean.core.schema.school.ImplementationAixmElevatedPoint.class,
            // com.aixm.delorean.core.schema.school.ImplementationAixmCurve.class,
            // com.aixm.delorean.core.schema.school.ImplementationAixmElevatedCurve.class,
            // com.aixm.delorean.core.schema.school.ImplementationAixmSurface.class,
            // com.aixm.delorean.core.schema.school.ImplementationAixmElevatedSurface.class,
            // com.aixm.delorean.core.adapter.type.gis.AixmPointType.class,
            // com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType.class,
            // com.aixm.delorean.core.adapter.type.gis.AixmCurveType.class,
            // com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType.class,
        }
    );

    private final String version;
    private final String url;
    private final String username;
    private final String password;
    private final int connectionPoolMinSize;
    private final int connectionPoolMaxSize;
    private final boolean showSql;
    private final String hbm2ddlAuto;
    private final Class<?>[] mappingClasses;
    private final Configuration configuration;

    DatabaseConfig(String version, String url, String username, String password, int connectionPoolMinSize, int connectionPoolMaxSize, boolean showSql, String hbm2ddlAuto, Class<?>[] mappingClasses) {
        this.version = version;
        this.url = url;
        this.username = username;
        this.password = password;
        this.connectionPoolMinSize = connectionPoolMinSize;
        this.connectionPoolMaxSize = connectionPoolMaxSize;
        this.showSql = showSql;
        this.hbm2ddlAuto = hbm2ddlAuto;
        this.mappingClasses = mappingClasses;
        this.configuration = getHibernateConfiguration();
    }

    public String getVersion() {
        return version;
    }

    public Configuration getConfiguration() {
        return configuration;  
    }

    public List<Class<?>> getMappedClasses() {
        return Arrays.asList(mappingClasses);
    }

    // Method to get a pre-configured Hibernate Configuration object
    public Configuration getHibernateConfiguration() {
        Configuration configuration = new Configuration();

        // Set database connection properties
        configuration.setProperty("hibernate.connection.driver_class", "org.postgresql.Driver");
        configuration.setProperty("hibernate.connection.url", this.url);
        configuration.setProperty("hibernate.connection.username", this.username);
        configuration.setProperty("hibernate.connection.password", this.password);

        // Set JDBC connection pool settings
        configuration.setProperty("hibernate.c3p0.min_size", String.valueOf(this.connectionPoolMinSize));
        configuration.setProperty("hibernate.c3p0.max_size", String.valueOf(this.connectionPoolMaxSize));

        // Set Hibernate settings
        configuration.setProperty("hibernate.show_sql", String.valueOf(this.showSql));
        configuration.setProperty("hibernate.format_sql", "true");  // Formats the SQL for readability
        configuration.setProperty("hibernate.generate_statistics", "true");  // Enables detailed statistics
        configuration.setProperty("hibernate.use_sql_comments", "true");  // Adds comments to the generated SQL for context
        configuration.setProperty("hibernate.hbm2ddl.auto", this.hbm2ddlAuto);

        //Set PostgreSQL dialect
        configuration.setProperty("hibernate.dialect.PostgreSQLDialect", "org.hibernate.spatial.dialect.postgis.PostgisDialect");

        // Add mapping classes
        for (Class<?> mappingClass : this.mappingClasses) {
            configuration.addAnnotatedClass(mappingClass);
        }

        return configuration;
    }

    public static DatabaseConfig fromString(String version) {
        for (DatabaseConfig Schema : DatabaseConfig.values()) {
            if (Schema.getVersion().equals(version)) {
                return Schema;
            }
        }
        throw new IllegalArgumentException("Unsupported schema version: " + version);
    }
}
