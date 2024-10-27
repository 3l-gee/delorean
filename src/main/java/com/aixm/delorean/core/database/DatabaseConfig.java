package com.aixm.delorean.core.database;

import org.hibernate.cfg.Configuration;

import java.util.Arrays;
import java.util.List;

public enum DatabaseConfig {

    // AIXM_5_1_1(
    //     "a5_1_1",                                    // version
    //     "jdbc:postgresql://localhost:5432/delorean", // Default URL
    //     "postgres",                             // Default username
    //     "postgres",                             // Default password
    //     5,                         // Connection pool min size
    //     20,                        // Connection pool max size
    //     true,                                    // Hibernate show_sql
    //     "update",                            // Hibernate hbm2ddl.auto
    //     new Class<?>[]{
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingAnchorPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingPointPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingTrackPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForAerialRefuellingPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportAvailabilityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportCollocationType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportCollocationTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportResponsibilityOrganisationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportUsagePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHotSpotType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHotSpotTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AltimeterSourceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AltimeterSourceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AltimeterSourceStatusPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ConditionCombinationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NonMovementAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NonMovementAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceCharacteristicsPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SurveyControlPointType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SurveyControlPointTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.UsageConditionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.WorkAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.WorkAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.WorkareaActivityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftStandType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftStandTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronAreaAvailabilityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronAreaUsagePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronElementType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronElementTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerLoadingBridgeType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerLoadingBridgeTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RoadType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RoadTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffSafeAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffSafeAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachLightingSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachLightingSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronLightSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronLightSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GroundLightingAvailabilityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineLightSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineLightSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.LightActivationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionLightSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionLightSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaLightSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaLightSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionLightSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionLightSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayLightSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayLightSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffLightSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffLightSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportProtectionAreaMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportProtectionAreaMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MarkingElementPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffMarkingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffMarkingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ArrestingGearType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ArrestingGearTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ManoeuvringAreaAvailabilityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ManoeuvringAreaUsagePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidEquipmentDistancePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayBlastPadType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayBlastPadTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayCentrelinePointType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayCentrelinePointTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDeclaredDistancePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDeclaredDistanceValuePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayElementType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayElementTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayVisualRangeType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayVisualRangeTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VisualGlideSlopeIndicatorType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VisualGlideSlopeIndicatorTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FloatingDockSiteType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FloatingDockSiteTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MarkingBuoyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MarkingBuoyTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneLandingAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneLandingAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneRampSiteType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneRampSiteTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftStandContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApronContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RidgePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RunwaySectionContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceContaminationLayerPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffContaminationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayElementType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayElementTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceActivationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceGeometryComponentPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceLayerClassPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceVolumePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceVolumeDependencyPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForAirspaceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForAirspaceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GeoBorderType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GeoBorderTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CurvePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurvePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfacePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PointPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SurfacePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternDistancePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternDurationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.UnplannedHoldingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.UnplannedHoldingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForNavaidEquipmentPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForSpecialNavigationStationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForSpecialNavigationSystemPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AzimuthType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AzimuthTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointINSType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointINSTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointVORType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointVORTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DirectionFinderType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DirectionFinderTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DMEType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DMETimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ElevationType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ElevationTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GlidepathType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GlidepathTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.LocalizerType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.LocalizerTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MarkerBeaconType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MarkerBeaconTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidComponentPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidEquipmentMonitoringPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidOperationalStatusPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NDBType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NDBTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SDFType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SDFTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationStationType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationStationTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationStationStatusPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TACANType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TACANTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VORType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VORTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AngleIndicationType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AngleIndicationTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AngleUsePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DistanceIndicationType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DistanceIndicationTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.EnRouteSegmentPointPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PointReferencePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SegmentPointPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalSegmentPointPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DesignatedPointType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DesignatedPointTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SignificantPointInAirspaceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SignificantPointInAirspaceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AeronauticalGroundLightType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AeronauticalGroundLightTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.LinguisticNotePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NotePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ObstacleAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ObstacleAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructureType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructureTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructureLightingStatusPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructurePartPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.OrganisationAuthorityType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.OrganisationAuthorityTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.OrganisationAuthorityAssociationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.UnitType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.UnitTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.UnitAvailabilityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.UnitDependencyPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachAltitudeTablePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachConditionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachDistanceTablePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachTimingTablePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FinalProfilePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.InstrumentApproachProcedureType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.InstrumentApproachProcedureTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MissedApproachGroupPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalArrivalAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalArrivalAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalArrivalAreaSectorPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FASDataBlockPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CirclingAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CirclingAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CirclingRestrictionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.EquipmentUnavailableAdjustmentPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.EquipmentUnavailableAdjustmentColumnPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MinimaPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentArrivalType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentArrivalTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DepartureArrivalConditionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaSectorPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SectorDesignPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentDepartureType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentDepartureTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SafeAltitudeAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SafeAltitudeAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SafeAltitudeAreaSectorPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalFeederLegType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalFeederLegTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalLegType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalLegTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DepartureLegType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DepartureLegTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FinalLegType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FinalLegTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingUsePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.InitialLegType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.InitialLegTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.IntermediateLegType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.IntermediateLegTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.LandingTakeoffAreaCollectionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MissedApproachLegType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MissedApproachLegTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaRestrictionType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaRestrictionTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureDMEType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureDMETimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureTransitionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureTransitionLegPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureAvailabilityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ChangeOverPointType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ChangeOverPointTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RouteType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RouteTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RouteAvailabilityPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RouteDMEType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RouteDMETimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RoutePortionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RouteSegmentType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RouteSegmentTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceBorderCrossingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceBorderCrossingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DirectFlightPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DirectFlightClassPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.DirectFlightSegmentPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightConditionCircumstancePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightConditionCombinationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightConditionElementPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionLevelPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionRoutePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRoutingElementPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RulesProceduresType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RulesProceduresTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftGroundServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftGroundServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportClearanceServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportClearanceServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportSuppliesServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirportSuppliesServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficControlServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficControlServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficManagementServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficManagementServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CallsignDetailPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FireFightingServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FireFightingServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FuelPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GroundTrafficControlServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.GroundTrafficControlServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.InformationServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.InformationServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.NitrogenPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.OilPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.OxygenPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PilotControlledLightingType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PilotControlledLightingTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadioCommunicationChannelType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadioCommunicationChannelTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadioCommunicationOperationalStatusPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SearchRescueServiceType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SearchRescueServiceTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ServiceOperationalStatusPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ContactInformationPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.OnlineContactPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PostalAddressPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TelephoneContactPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftCharacteristicPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.FlightCharacteristicPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceLayerPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.CircleSectorPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.LightElementPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.LightElementStatusPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.MeteorologyPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadioFrequencyAreaType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadioFrequencyAreaTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PropertiesWithSchedulePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialDateType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialDateTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.TimesheetPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelColumnType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelColumnTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelSectorType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelSectorTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelTableType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelTableTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.AltitudeAdjustmentPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingAssessmentType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingAssessmentTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ObstacleAssessmentAreaPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ObstaclePlacementPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ObstructionPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PrecisionApproachRadarType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PrecisionApproachRadarTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PrimarySurveillanceRadarType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.PrimarySurveillanceRadarTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadarComponentPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadarSystemType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.RadarSystemTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.ReflectorPropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SecondarySurveillanceRadarType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SecondarySurveillanceRadarTimeSlicePropertyType.class,
    //         com.aixm.delorean.core.schema.a5_1_1.aixm.SurveillanceGroundStationPropertyType.class,
    //     } // Mapping classes
    // ),
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
            com.aixm.delorean.core.schema.school.School.class,
            com.aixm.delorean.core.schema.school.Classroom.class,
            com.aixm.delorean.core.schema.school.Student.class,
            com.aixm.delorean.core.schema.school.Teacher.class,
            com.aixm.delorean.core.schema.school.AixmPointPropertyType.class,
            com.aixm.delorean.core.schema.school.ElevatedPointPropertyType.class,
            com.aixm.delorean.core.schema.school.AixmCurvePropertyType.class,
            com.aixm.delorean.core.schema.school.ElevatedCurvePropertyType.class,
            com.aixm.delorean.core.schema.school.ImplementationAixmPoint.class,
            com.aixm.delorean.core.schema.school.ImplementationAixmElevatedPoint.class,
            com.aixm.delorean.core.schema.school.ImplementationAixmCurve.class,
            com.aixm.delorean.core.schema.school.ImplementationAixmElevatedCurve.class,
            com.aixm.delorean.core.adapter.type.gis.AixmPointType.class,
            com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType.class,
            com.aixm.delorean.core.adapter.type.gis.AixmCurveType.class,
            com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType.class,
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
