package com.aixm.delorean.core.adapter.feature;

import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import jakarta.xml.bind.JAXBElement;
import javax.xml.namespace.QName;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.schema.a5_1_1.aixm.*;

public class AbstractFeatureAdapter extends XmlAdapter<JAXBElement<? extends AbstractAIXMFeatureType>, AbstractAIXMFeatureType> {

    @Override
    public AbstractAIXMFeatureType unmarshal(JAXBElement<? extends AbstractAIXMFeatureType> v) throws Exception {
        if (v != null) {
            Class<? extends AbstractAIXMFeatureType> clazz = v.getDeclaredType();

            if (AbstractMarkingType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(AirportProtectionAreaMarkingType.class)){
                    return (AirportProtectionAreaMarkingType) v.getValue();
                } 

                if (clazz.equals(ApronMarkingType.class)){
                    return (ApronMarkingType) v.getValue();
                }

                if (clazz.equals(DeicingAreaMarkingType.class)){
                    return (DeicingAreaMarkingType) v.getValue();
                }

                if (clazz.equals(GuidanceLineMarkingType.class)){
                    return (GuidanceLineMarkingType) v.getValue();
                }

                if (clazz.equals(RunwayMarkingType.class)){
                    return (RunwayMarkingType) v.getValue();
                }

                if (clazz.equals(StandMarkingType.class)){
                    return (StandMarkingType) v.getValue();
                }

                if (clazz.equals(TaxiHoldingPositionMarkingType.class)){
                    return (TaxiHoldingPositionMarkingType) v.getValue();
                }

                if (clazz.equals(TaxiwayMarkingType.class)){
                    return (TaxiwayMarkingType) v.getValue();
                }

                if (clazz.equals(TouchDownLiftOffMarkingType.class)){
                    return (TouchDownLiftOffMarkingType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractMarkingType : " + clazz.getName(), new Exception());
                }

            }

            if (AbstractAirportHeliportProtectionAreaType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(TouchDownLiftOffSafeAreaType.class)){
                    return (TouchDownLiftOffSafeAreaType) v.getValue();
                }

                if (clazz.equals(RunwayProtectAreaType.class)){
                    return (RunwayProtectAreaType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractAirportHeliportProtectionAreaTypes : " + clazz.getName(), new Exception());
                }
            }

            if (AbstractGroundLightSystemType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(ApproachLightingSystemType.class)){
                    return (ApproachLightingSystemType) v.getValue();
                }

                if (clazz.equals(ApronLightSystemType.class)){
                    return (ApronLightSystemType) v.getValue();
                }

                if (clazz.equals(GuidanceLineLightSystemType.class)){
                    return (GuidanceLineLightSystemType) v.getValue();
                }

                if (clazz.equals(RunwayDirectionLightSystemType.class)){
                    return (RunwayDirectionLightSystemType) v.getValue();
                }

                if (clazz.equals(RunwayProtectAreaLightSystemType.class)){
                    return (RunwayProtectAreaLightSystemType) v.getValue();
                }

                if (clazz.equals(TaxiHoldingPositionLightSystemType.class)){
                    return (TaxiHoldingPositionLightSystemType) v.getValue();
                }

                if (clazz.equals(TaxiwayLightSystemType.class)){
                    return (TaxiwayLightSystemType) v.getValue();
                }

                if (clazz.equals(TouchDownLiftOffLightSystemType.class)){
                    return (TouchDownLiftOffLightSystemType) v.getValue();
                }

                if (clazz.equals(VisualGlideSlopeIndicatorType.class)){
                    return (VisualGlideSlopeIndicatorType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractGroundLightSystemType : " + clazz.getName(), new Exception());
                }
            }

            if (AbstractNavigationSystemCheckpointType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(CheckpointINSType.class)){
                    return (CheckpointINSType) v.getValue();
                }

                if (clazz.equals(CheckpointVORType.class)){
                    return (CheckpointVORType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractNavigationSystemCheckpointType : " + clazz.getName(), new Exception());
                }
            }

            if (AbstractNavaidEquipmentType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(AzimuthType.class)){
                    return (AzimuthType) v.getValue();
                }

                if (clazz.equals(DirectionFinderType.class)){
                    return (DirectionFinderType) v.getValue();
                }

                if (clazz.equals(DMEType.class)){
                    return (DMEType) v.getValue();
                }

                if (clazz.equals(ElevationType.class)){
                    return (ElevationType) v.getValue();
                }

                if (clazz.equals(GlidepathType.class)){
                    return (GlidepathType) v.getValue();
                }

                if (clazz.equals(LocalizerType.class)){
                    return (LocalizerType) v.getValue();
                }

                if (clazz.equals(MarkerBeaconType.class)){
                    return (MarkerBeaconType) v.getValue();
                }

                if (clazz.equals(NDBType.class)){
                    return (NDBType) v.getValue();
                }

                if (clazz.equals(SDFType.class)){
                    return (SDFType) v.getValue();
                }

                if (clazz.equals(TACANType.class)){
                    return (TACANType) v.getValue();
                }

                if (clazz.equals(VORType.class)){
                    return (VORType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractNavaidEquipmentType : " + clazz.getName(), new Exception());
                }
            }

            if (AbstractProcedureType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(InstrumentApproachProcedureType.class)){
                    return (InstrumentApproachProcedureType) v.getValue();
                }

                if (clazz.equals(StandardInstrumentArrivalType.class)){
                    return (StandardInstrumentArrivalType) v.getValue();
                }

                if (clazz.equals(StandardInstrumentDepartureType.class)){
                    return (StandardInstrumentDepartureType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractProcedureType : " + clazz.getName(), new Exception());
                }
            }

            if (AbstractSegmentLegType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(ArrivalLegType.class)){
                    return (ArrivalLegType) v.getValue();
                }

                if (clazz.equals(ArrivalLegType.class)){
                    return (ArrivalLegType) v.getValue();
                }

                if (clazz.equals(DepartureLegType.class)){
                    return (DepartureLegType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractSegmentLegType : " + clazz.getName(), new Exception());
                }
            }

            if (AbstractServiceType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(AirTrafficManagementServiceType.class)){
                    return (AirTrafficManagementServiceType) v.getValue();
                }

                if (AbstractTrafficSeparationServiceType.class.isAssignableFrom(clazz)){
                    if (clazz.equals(AirTrafficControlServiceType.class)){
                        return (AirTrafficControlServiceType) v.getValue();
                    }

                    if (clazz.equals(GroundTrafficControlServiceType.class)){
                        return (GroundTrafficControlServiceType) v.getValue();
                    }

                    else {
                        ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractTrafficSeparationServiceType : " + clazz.getName(), new Exception());
                    }
                }

                if (clazz.equals(InformationServiceType.class)){
                    return (InformationServiceType) v.getValue();
                }

                if (AbstractAirportGroundServiceType.class.isAssignableFrom(clazz)){
                    if (clazz.equals(AircraftGroundServiceType.class)){
                        return (AircraftGroundServiceType) v.getValue();
                    }

                    if (clazz.equals(AirportClearanceServiceType.class)){
                        return (AirportClearanceServiceType) v.getValue();
                    }

                    if (clazz.equals(AirportSuppliesServiceType.class)){
                        return (AirportSuppliesServiceType) v.getValue();
                    }

                    if (clazz.equals(FireFightingServiceType.class)){
                        return (FireFightingServiceType) v.getValue();
                    }

                    if (clazz.equals(PassengerServiceType.class)){
                        return (PassengerServiceType) v.getValue();
                    }

                    else {
                        ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractAirportGroundServiceType : " + clazz.getName(), new Exception());
                    }
                }

                if (clazz.equals(SearchRescueServiceType.class)){
                    return (SearchRescueServiceType) v.getValue();
                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractServiceType : " + clazz.getName(), new Exception());
                }
            }

            if (AbstractRadarEquipmentType.class.isAssignableFrom(clazz)) {
                if (clazz.equals(PrecisionApproachRadarType.class)){
                    return (PrecisionApproachRadarType) v.getValue();
                }

                if (AbstractRadarEquipmentType.class.isAssignableFrom(clazz)) {
                    if (clazz.equals(PrimarySurveillanceRadarType.class)){
                        return (PrimarySurveillanceRadarType) v.getValue();
                    }

                    if (clazz.equals(SecondarySurveillanceRadarType.class)){
                        return (SecondarySurveillanceRadarType) v.getValue();
                    }

                    else {
                        ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractRadarEquipmentType : " + clazz.getName(), new Exception());
                    }

                }

                else {
                    ConsoleLogger.log(LogLevel.FATAL, "unknown class extension of AbstractRadarEquipmentType : " + clazz.getName(), new Exception());
                }
            }
        
            if (clazz.equals(AerialRefuellingType.class)) {
                return (AerialRefuellingType) v.getValue();
            }

            if (clazz.equals(AirportHeliportType.class)) {
                return (AirportHeliportType) v.getValue();
            }

            if (clazz.equals(AirportHeliportCollocationType.class)) {
                return (AirportHeliportCollocationType) v.getValue();
            }

            if (clazz.equals(AirportHotSpotType.class)) {
                return (AirportHotSpotType) v.getValue();
            }
            
            if (clazz.equals(AltimeterSourceType.class)) {
                return (AltimeterSourceType) v.getValue();
            }

            if (clazz.equals(NonMovementAreaType.class)) {
                return (NonMovementAreaType) v.getValue();
            }

            if (clazz.equals(SurveyControlPointType.class)) {
                return (SurveyControlPointType) v.getValue();
            }
            
            if (clazz.equals(WorkAreaType.class)) {
                return (WorkAreaType) v.getValue();
            }

            if (clazz.equals(AircraftStandType.class)) {
                return (AircraftStandType) v.getValue();
            }

            if (clazz.equals(ApronType.class)) {
                return (ApronType) v.getValue();
            }

            if (clazz.equals(ApronElementType.class)) {
                return (ApronElementType) v.getValue();
            }

            if (clazz.equals(DeicingAreaType.class)) {
                return (DeicingAreaType) v.getValue();
            }

            if (clazz.equals(PassengerLoadingBridgeType.class)) {
                return (PassengerLoadingBridgeType) v.getValue();
            }
            if (clazz.equals(RoadType.class)) {
                return (RoadType) v.getValue();
            }

            if (clazz.equals(TouchDownLiftOffType.class)) {
                return (TouchDownLiftOffType) v.getValue();
            }

            if (clazz.equals(ArrestingGearType.class)) {
                return (ArrestingGearType) v.getValue();
            }

            if (clazz.equals(RunwayType.class)) {
                return (RunwayType) v.getValue();
            }

            if (clazz.equals(RunwayBlastPadType.class)) {
                return (RunwayBlastPadType) v.getValue();
            }

            if (clazz.equals(RunwayCentrelinePointType.class)) {
                return (RunwayCentrelinePointType) v.getValue();
            }

            if (clazz.equals(RunwayDirectionType.class)) {
                return (RunwayDirectionType) v.getValue();
            }

            if (clazz.equals(RunwayElementType.class)) {
                return (RunwayElementType) v.getValue();
            }

            if (clazz.equals(RunwayVisualRangeType.class)) {
                return (RunwayVisualRangeType) v.getValue();
            }

            if (clazz.equals(FloatingDockSiteType.class)) {
                return (FloatingDockSiteType) v.getValue();
            }

            if (clazz.equals(MarkingBuoyType.class)) {
                return (MarkingBuoyType) v.getValue();
            }

            if (clazz.equals(SeaplaneLandingAreaType.class)) {
                return (SeaplaneLandingAreaType) v.getValue();
            }

            if (clazz.equals(SeaplaneRampSiteType.class)) {
                return (SeaplaneRampSiteType) v.getValue();
            }

            if (clazz.equals(GuidanceLineType.class)) {
                return (GuidanceLineType) v.getValue();
            }

            if (clazz.equals(TaxiHoldingPositionType.class)) {
                return (TaxiHoldingPositionType) v.getValue();
            }

            if (clazz.equals(TaxiwayType.class)) {
                return (TaxiwayType) v.getValue();
            }

            if (clazz.equals(TaxiwayElementType.class)) {
                return (TaxiwayElementType) v.getValue();
            }

            if (clazz.equals(AirspaceType.class)) {
                return (AirspaceType) v.getValue();
            }

            if (clazz.equals(AuthorityForAirspaceType.class)) {
                return (AuthorityForAirspaceType) v.getValue();
            }

            if (clazz.equals(GeoBorderType.class)) {
                return (GeoBorderType) v.getValue();
            }

            if (clazz.equals(HoldingPatternType.class)) {
                return (HoldingPatternType) v.getValue();
            }

            if (clazz.equals(UnplannedHoldingType.class)) {
                return (UnplannedHoldingType) v.getValue();
            }

            if (clazz.equals(NavaidType.class)) {
                return (NavaidType) v.getValue();
            }

            if (clazz.equals(SpecialNavigationStationType.class)) {
                return (SpecialNavigationStationType) v.getValue();
            }

            if (clazz.equals(SpecialNavigationSystemType.class)) {
                return (SpecialNavigationSystemType) v.getValue();
            }

            if (clazz.equals(AngleIndicationType.class)) {
                return (AngleIndicationType) v.getValue();
            }

            if (clazz.equals(DistanceIndicationType.class)) {
                return (DistanceIndicationType) v.getValue();
            }

            if (clazz.equals(DesignatedPointType.class)) {
                return (DesignatedPointType) v.getValue();
            }

            if (clazz.equals(SignificantPointInAirspaceType.class)) {
                return (SignificantPointInAirspaceType) v.getValue();
            }

            if (clazz.equals(AeronauticalGroundLightType.class)) {
                return (AeronauticalGroundLightType) v.getValue();
            }

            if (clazz.equals(ObstacleAreaType.class)) {
                return (ObstacleAreaType) v.getValue();
            }

            if (clazz.equals(VerticalStructureType.class)) {
                return (VerticalStructureType) v.getValue();
            }

            if (clazz.equals(OrganisationAuthorityType.class)) {
                return (OrganisationAuthorityType) v.getValue();
            }

            if (clazz.equals(UnitType.class)) {
                return (UnitType) v.getValue();
            }

            if (clazz.equals(TerminalArrivalAreaType.class)) {
                return (TerminalArrivalAreaType) v.getValue();
            }

            if (clazz.equals(CirclingAreaType.class)) {
                return (CirclingAreaType) v.getValue();
            }

            if (clazz.equals(NavigationAreaType.class)) {
                return (NavigationAreaType) v.getValue();
            }

            if (clazz.equals(SafeAltitudeAreaType.class)) {
                return (SafeAltitudeAreaType) v.getValue();
            }

            if (clazz.equals(NavigationAreaRestrictionType.class)) {
                return (NavigationAreaRestrictionType) v.getValue();
            }

            if (clazz.equals(ProcedureDMEType.class)) {
                return (ProcedureDMEType) v.getValue();
            }

            if (clazz.equals(ChangeOverPointType.class)) {
                return (ChangeOverPointType) v.getValue();
            }

            if (clazz.equals(RouteType.class)) {
                return (RouteType) v.getValue();
            }

            if (clazz.equals(RouteDMEType.class)) {
                return (RouteDMEType) v.getValue();
            }

            if (clazz.equals(RouteSegmentType.class)) {
                return (RouteSegmentType) v.getValue();
            }

            if (clazz.equals(AirspaceBorderCrossingType.class)) {
                return (AirspaceBorderCrossingType) v.getValue();
            }

            if (clazz.equals(FlightRestrictionType.class)) {
                return (FlightRestrictionType) v.getValue();
            }

            if (clazz.equals(RulesProceduresType.class)) {
                return (RulesProceduresType) v.getValue();
            }

            if (clazz.equals(PilotControlledLightingType.class)) {
                return (PilotControlledLightingType) v.getValue();
            }

            if (clazz.equals(RadioCommunicationChannelType.class)) {
                return (RadioCommunicationChannelType) v.getValue();
            }

            if (clazz.equals(RadioFrequencyAreaType.class)) {
                return (RadioFrequencyAreaType) v.getValue();
            }

            if (clazz.equals(SpecialDateType.class)) {
                return (SpecialDateType) v.getValue();
            }

            if (clazz.equals(StandardLevelColumnType.class)) {
                return (StandardLevelColumnType) v.getValue();
            }

            if (clazz.equals(StandardLevelSectorType.class)) {
                return (StandardLevelSectorType) v.getValue();
            }

            if (clazz.equals(StandardLevelTableType.class)) {
                return (StandardLevelTableType) v.getValue();
            }

            if (clazz.equals(HoldingAssessmentType.class)) {
                return (HoldingAssessmentType) v.getValue();
            }

            if (clazz.equals(RadarSystemType.class)) {
                return (RadarSystemType) v.getValue();
            }

            ConsoleLogger.log(LogLevel.FATAL, "unknown class " + clazz.getName(), new Exception());
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "class is null ", new Exception());
            throw new RuntimeException("class is null");
        }
        return null;
    }
    

    @Override
    //TODO JAVAAAAA !! what the fuck is this? is ther really no other way to do this ??
    public JAXBElement<? extends AbstractAIXMFeatureType> marshal(AbstractAIXMFeatureType v) throws Exception {
        if (v == null) {
            return null;
        }

        Class<? extends AbstractAIXMFeatureType> clazz = v.getClass();

        if (clazz.equals(AbstractAIXMFeatureType.class)) {
            return new JAXBElement<AbstractAIXMFeatureType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractAIXMFeature"),
                AbstractAIXMFeatureType.class,
                (AbstractAIXMFeatureType) v
            );
        }
        if (clazz.equals(AbstractAirportGroundServiceType.class)) {
            return new JAXBElement<AbstractAirportGroundServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractAirportGroundService"),
                AbstractAirportGroundServiceType.class,
                (AbstractAirportGroundServiceType) v
            );
        }
        if (clazz.equals(AbstractAirportHeliportProtectionAreaType.class)) {
            return new JAXBElement<AbstractAirportHeliportProtectionAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractAirportHeliportProtectionArea"),
                AbstractAirportHeliportProtectionAreaType.class,
                (AbstractAirportHeliportProtectionAreaType) v
            );
        }
        if (clazz.equals(AbstractApproachLegType.class)) {
            return new JAXBElement<AbstractApproachLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractApproachLeg"),
                AbstractApproachLegType.class,
                (AbstractApproachLegType) v
            );
        }
        if (clazz.equals(AbstractGroundLightSystemType.class)) {
            return new JAXBElement<AbstractGroundLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractGroundLightSystem"),
                AbstractGroundLightSystemType.class,
                (AbstractGroundLightSystemType) v
            );
        }
        if (clazz.equals(AbstractMarkingType.class)) {
            return new JAXBElement<AbstractMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractMarking"),
                AbstractMarkingType.class,
                (AbstractMarkingType) v
            );
        }
        if (clazz.equals(AbstractNavaidEquipmentType.class)) {
            return new JAXBElement<AbstractNavaidEquipmentType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractNavaidEquipment"),
                AbstractNavaidEquipmentType.class,
                (AbstractNavaidEquipmentType) v
            );
        }
        if (clazz.equals(AbstractNavigationSystemCheckpointType.class)) {
            return new JAXBElement<AbstractNavigationSystemCheckpointType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractNavigationSystemCheckpoint"),
                AbstractNavigationSystemCheckpointType.class,
                (AbstractNavigationSystemCheckpointType) v
            );
        }
        if (clazz.equals(AbstractProcedureType.class)) {
            return new JAXBElement<AbstractProcedureType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractProcedure"),
                AbstractProcedureType.class,
                (AbstractProcedureType) v
            );
        }
        if (clazz.equals(AbstractRadarEquipmentType.class)) {
            return new JAXBElement<AbstractRadarEquipmentType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractRadarEquipment"),
                AbstractRadarEquipmentType.class,
                (AbstractRadarEquipmentType) v
            );
        }
        if (clazz.equals(AbstractSegmentLegType.class)) {
            return new JAXBElement<AbstractSegmentLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractSegmentLeg"),
                AbstractSegmentLegType.class,
                (AbstractSegmentLegType) v
            );
        }
        if (clazz.equals(AbstractServiceType.class)) {
            return new JAXBElement<AbstractServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractService"),
                AbstractServiceType.class,
                (AbstractServiceType) v
            );
        }
        if (clazz.equals(AbstractSurveillanceRadarType.class)) {
            return new JAXBElement<AbstractSurveillanceRadarType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractSurveillanceRadar"),
                AbstractSurveillanceRadarType.class,
                (AbstractSurveillanceRadarType) v
            );
        }
        if (clazz.equals(AbstractTrafficSeparationServiceType.class)) {
            return new JAXBElement<AbstractTrafficSeparationServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AbstractTrafficSeparationService"),
                AbstractTrafficSeparationServiceType.class,
                (AbstractTrafficSeparationServiceType) v
            );
        }
        if (clazz.equals(AerialRefuellingType.class)) {
            return new JAXBElement<AerialRefuellingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AerialRefuelling"),
                AerialRefuellingType.class,
                (AerialRefuellingType) v
            );
        }
        if (clazz.equals(AeronauticalGroundLightType.class)) {
            return new JAXBElement<AeronauticalGroundLightType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AeronauticalGroundLight"),
                AeronauticalGroundLightType.class,
                (AeronauticalGroundLightType) v
            );
        }
        if (clazz.equals(AirTrafficControlServiceType.class)) {
            return new JAXBElement<AirTrafficControlServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirTrafficControlService"),
                AirTrafficControlServiceType.class,
                (AirTrafficControlServiceType) v
            );
        }
        if (clazz.equals(AirTrafficManagementServiceType.class)) {
            return new JAXBElement<AirTrafficManagementServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirTrafficManagementService"),
                AirTrafficManagementServiceType.class,
                (AirTrafficManagementServiceType) v
            );
        }
        if (clazz.equals(AircraftGroundServiceType.class)) {
            return new JAXBElement<AircraftGroundServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AircraftGroundService"),
                AircraftGroundServiceType.class,
                (AircraftGroundServiceType) v
            );
        }
        if (clazz.equals(AircraftStandType.class)) {
            return new JAXBElement<AircraftStandType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AircraftStand"),
                AircraftStandType.class,
                (AircraftStandType) v
            );
        }
        if (clazz.equals(AirportClearanceServiceType.class)) {
            return new JAXBElement<AirportClearanceServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirportClearanceService"),
                AirportClearanceServiceType.class,
                (AirportClearanceServiceType) v
            );
        }
        if (clazz.equals(AirportHeliportCollocationType.class)) {
            return new JAXBElement<AirportHeliportCollocationType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirportHeliportCollocation"),
                AirportHeliportCollocationType.class,
                (AirportHeliportCollocationType) v
            );
        }
        if (clazz.equals(AirportHeliportType.class)) {
            return new JAXBElement<AirportHeliportType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirportHeliport"),
                AirportHeliportType.class,
                (AirportHeliportType) v
            );
        }
        if (clazz.equals(AirportHotSpotType.class)) {
            return new JAXBElement<AirportHotSpotType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirportHotSpot"),
                AirportHotSpotType.class,
                (AirportHotSpotType) v
            );
        }
        if (clazz.equals(AirportProtectionAreaMarkingType.class)) {
            return new JAXBElement<AirportProtectionAreaMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirportProtectionAreaMarking"),
                AirportProtectionAreaMarkingType.class,
                (AirportProtectionAreaMarkingType) v
            );
        }
        if (clazz.equals(AirportSuppliesServiceType.class)) {
            return new JAXBElement<AirportSuppliesServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirportSuppliesService"),
                AirportSuppliesServiceType.class,
                (AirportSuppliesServiceType) v
            );
        }
        if (clazz.equals(AirspaceBorderCrossingType.class)) {
            return new JAXBElement<AirspaceBorderCrossingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AirspaceBorderCrossing"),
                AirspaceBorderCrossingType.class,
                (AirspaceBorderCrossingType) v
            );
        }
        if (clazz.equals(AirspaceType.class)) {
            return new JAXBElement<AirspaceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Airspace"),
                AirspaceType.class,
                (AirspaceType) v
            );
        }
        if (clazz.equals(AltimeterSourceType.class)) {
            return new JAXBElement<AltimeterSourceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AltimeterSource"),
                AltimeterSourceType.class,
                (AltimeterSourceType) v
            );
        }
        if (clazz.equals(AngleIndicationType.class)) {
            return new JAXBElement<AngleIndicationType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AngleIndication"),
                AngleIndicationType.class,
                (AngleIndicationType) v
            );
        }
        if (clazz.equals(ApproachLightingSystemType.class)) {
            return new JAXBElement<ApproachLightingSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ApproachLightingSystem"),
                ApproachLightingSystemType.class,
                (ApproachLightingSystemType) v
            );
        }
        if (clazz.equals(ApronElementType.class)) {
            return new JAXBElement<ApronElementType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ApronElement"),
                ApronElementType.class,
                (ApronElementType) v
            );
        }
        if (clazz.equals(ApronLightSystemType.class)) {
            return new JAXBElement<ApronLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ApronLightSystem"),
                ApronLightSystemType.class,
                (ApronLightSystemType) v
            );
        }
        if (clazz.equals(ApronMarkingType.class)) {
            return new JAXBElement<ApronMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ApronMarking"),
                ApronMarkingType.class,
                (ApronMarkingType) v
            );
        }
        if (clazz.equals(ApronType.class)) {
            return new JAXBElement<ApronType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Apron"),
                ApronType.class,
                (ApronType) v
            );
        }
        if (clazz.equals(ArrestingGearType.class)) {
            return new JAXBElement<ArrestingGearType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ArrestingGear"),
                ArrestingGearType.class,
                (ArrestingGearType) v
            );
        }
        if (clazz.equals(ArrivalFeederLegType.class)) {
            return new JAXBElement<ArrivalFeederLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ArrivalFeederLeg"),
                ArrivalFeederLegType.class,
                (ArrivalFeederLegType) v
            );
        }
        if (clazz.equals(ArrivalLegType.class)) {
            return new JAXBElement<ArrivalLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ArrivalLeg"),
                ArrivalLegType.class,
                (ArrivalLegType) v
            );
        }
        if (clazz.equals(AuthorityForAirspaceType.class)) {
            return new JAXBElement<AuthorityForAirspaceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "AuthorityForAirspace"),
                AuthorityForAirspaceType.class,
                (AuthorityForAirspaceType) v
            );
        }
        if (clazz.equals(AzimuthType.class)) {
            return new JAXBElement<AzimuthType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Azimuth"),
                AzimuthType.class,
                (AzimuthType) v
            );
        }
        if (clazz.equals(ChangeOverPointType.class)) {
            return new JAXBElement<ChangeOverPointType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ChangeOverPoint"),
                ChangeOverPointType.class,
                (ChangeOverPointType) v
            );
        }
        if (clazz.equals(CheckpointINSType.class)) {
            return new JAXBElement<CheckpointINSType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "CheckpointINS"),
                CheckpointINSType.class,
                (CheckpointINSType) v
            );
        }
        if (clazz.equals(CheckpointVORType.class)) {
            return new JAXBElement<CheckpointVORType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "CheckpointVOR"),
                CheckpointVORType.class,
                (CheckpointVORType) v
            );
        }
        if (clazz.equals(CirclingAreaType.class)) {
            return new JAXBElement<CirclingAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "CirclingArea"),
                CirclingAreaType.class,
                (CirclingAreaType) v
            );
        }
        if (clazz.equals(DMEType.class)) {
            return new JAXBElement<DMEType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "DME"),
                DMEType.class,
                (DMEType) v
            );
        }
        if (clazz.equals(DeicingAreaMarkingType.class)) {
            return new JAXBElement<DeicingAreaMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "DeicingAreaMarking"),
                DeicingAreaMarkingType.class,
                (DeicingAreaMarkingType) v
            );
        }
        if (clazz.equals(DeicingAreaType.class)) {
            return new JAXBElement<DeicingAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "DeicingArea"),
                DeicingAreaType.class,
                (DeicingAreaType) v
            );
        }
        if (clazz.equals(DepartureLegType.class)) {
            return new JAXBElement<DepartureLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "DepartureLeg"),
                DepartureLegType.class,
                (DepartureLegType) v
            );
        }
        if (clazz.equals(DesignatedPointType.class)) {
            return new JAXBElement<DesignatedPointType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "DesignatedPoint"),
                DesignatedPointType.class,
                (DesignatedPointType) v
            );
        }
        if (clazz.equals(DirectionFinderType.class)) {
            return new JAXBElement<DirectionFinderType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "DirectionFinder"),
                DirectionFinderType.class,
                (DirectionFinderType) v
            );
        }
        if (clazz.equals(DistanceIndicationType.class)) {
            return new JAXBElement<DistanceIndicationType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "DistanceIndication"),
                DistanceIndicationType.class,
                (DistanceIndicationType) v
            );
        }
        if (clazz.equals(ElevationType.class)) {
            return new JAXBElement<ElevationType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Elevation"),
                ElevationType.class,
                (ElevationType) v
            );
        }
        if (clazz.equals(FinalLegType.class)) {
            return new JAXBElement<FinalLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "FinalLeg"),
                FinalLegType.class,
                (FinalLegType) v
            );
        }
        if (clazz.equals(FireFightingServiceType.class)) {
            return new JAXBElement<FireFightingServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "FireFightingService"),
                FireFightingServiceType.class,
                (FireFightingServiceType) v
            );
        }
        if (clazz.equals(FlightRestrictionType.class)) {
            return new JAXBElement<FlightRestrictionType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "FlightRestriction"),
                FlightRestrictionType.class,
                (FlightRestrictionType) v
            );
        }
        if (clazz.equals(FloatingDockSiteType.class)) {
            return new JAXBElement<FloatingDockSiteType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "FloatingDockSite"),
                FloatingDockSiteType.class,
                (FloatingDockSiteType) v
            );
        }
        if (clazz.equals(GeoBorderType.class)) {
            return new JAXBElement<GeoBorderType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "GeoBorder"),
                GeoBorderType.class,
                (GeoBorderType) v
            );
        }
        if (clazz.equals(GlidepathType.class)) {
            return new JAXBElement<GlidepathType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Glidepath"),
                GlidepathType.class,
                (GlidepathType) v
            );
        }
        if (clazz.equals(GroundTrafficControlServiceType.class)) {
            return new JAXBElement<GroundTrafficControlServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "GroundTrafficControlService"),
                GroundTrafficControlServiceType.class,
                (GroundTrafficControlServiceType) v
            );
        }
        if (clazz.equals(GuidanceLineLightSystemType.class)) {
            return new JAXBElement<GuidanceLineLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "GuidanceLineLightSystem"),
                GuidanceLineLightSystemType.class,
                (GuidanceLineLightSystemType) v
            );
        }
        if (clazz.equals(GuidanceLineMarkingType.class)) {
            return new JAXBElement<GuidanceLineMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "GuidanceLineMarking"),
                GuidanceLineMarkingType.class,
                (GuidanceLineMarkingType) v
            );
        }
        if (clazz.equals(GuidanceLineType.class)) {
            return new JAXBElement<GuidanceLineType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "GuidanceLine"),
                GuidanceLineType.class,
                (GuidanceLineType) v
            );
        }
        if (clazz.equals(HoldingAssessmentType.class)) {
            return new JAXBElement<HoldingAssessmentType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "HoldingAssessment"),
                HoldingAssessmentType.class,
                (HoldingAssessmentType) v
            );
        }
        if (clazz.equals(HoldingPatternType.class)) {
            return new JAXBElement<HoldingPatternType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "HoldingPattern"),
                HoldingPatternType.class,
                (HoldingPatternType) v
            );
        }
        if (clazz.equals(InformationServiceType.class)) {
            return new JAXBElement<InformationServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "InformationService"),
                InformationServiceType.class,
                (InformationServiceType) v
            );
        }
        if (clazz.equals(InitialLegType.class)) {
            return new JAXBElement<InitialLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "InitialLeg"),
                InitialLegType.class,
                (InitialLegType) v
            );
        }
        if (clazz.equals(InstrumentApproachProcedureType.class)) {
            return new JAXBElement<InstrumentApproachProcedureType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "InstrumentApproachProcedure"),
                InstrumentApproachProcedureType.class,
                (InstrumentApproachProcedureType) v
            );
        }
        if (clazz.equals(IntermediateLegType.class)) {
            return new JAXBElement<IntermediateLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "IntermediateLeg"),
                IntermediateLegType.class,
                (IntermediateLegType) v
            );
        }
        if (clazz.equals(LocalizerType.class)) {
            return new JAXBElement<LocalizerType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Localizer"),
                LocalizerType.class,
                (LocalizerType) v
            );
        }
        if (clazz.equals(MarkerBeaconType.class)) {
            return new JAXBElement<MarkerBeaconType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "MarkerBeacon"),
                MarkerBeaconType.class,
                (MarkerBeaconType) v
            );
        }
        if (clazz.equals(MarkingBuoyType.class)) {
            return new JAXBElement<MarkingBuoyType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "MarkingBuoy"),
                MarkingBuoyType.class,
                (MarkingBuoyType) v
            );
        }
        if (clazz.equals(MissedApproachLegType.class)) {
            return new JAXBElement<MissedApproachLegType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "MissedApproachLeg"),
                MissedApproachLegType.class,
                (MissedApproachLegType) v
            );
        }
        if (clazz.equals(NDBType.class)) {
            return new JAXBElement<NDBType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "NDB"),
                NDBType.class,
                (NDBType) v
            );
        }
        if (clazz.equals(NavaidType.class)) {
            return new JAXBElement<NavaidType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Navaid"),
                NavaidType.class,
                (NavaidType) v
            );
        }
        if (clazz.equals(NavigationAreaRestrictionType.class)) {
            return new JAXBElement<NavigationAreaRestrictionType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "NavigationAreaRestriction"),
                NavigationAreaRestrictionType.class,
                (NavigationAreaRestrictionType) v
            );
        }
        if (clazz.equals(NavigationAreaType.class)) {
            return new JAXBElement<NavigationAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "NavigationArea"),
                NavigationAreaType.class,
                (NavigationAreaType) v
            );
        }
        if (clazz.equals(NonMovementAreaType.class)) {
            return new JAXBElement<NonMovementAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "NonMovementArea"),
                NonMovementAreaType.class,
                (NonMovementAreaType) v
            );
        }
        if (clazz.equals(ObstacleAreaType.class)) {
            return new JAXBElement<ObstacleAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ObstacleArea"),
                ObstacleAreaType.class,
                (ObstacleAreaType) v
            );
        }
        if (clazz.equals(OrganisationAuthorityType.class)) {
            return new JAXBElement<OrganisationAuthorityType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "OrganisationAuthority"),
                OrganisationAuthorityType.class,
                (OrganisationAuthorityType) v
            );
        }
        if (clazz.equals(PassengerLoadingBridgeType.class)) {
            return new JAXBElement<PassengerLoadingBridgeType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "PassengerLoadingBridge"),
                PassengerLoadingBridgeType.class,
                (PassengerLoadingBridgeType) v
            );
        }
        if (clazz.equals(PassengerServiceType.class)) {
            return new JAXBElement<PassengerServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "PassengerService"),
                PassengerServiceType.class,
                (PassengerServiceType) v
            );
        }
        if (clazz.equals(PilotControlledLightingType.class)) {
            return new JAXBElement<PilotControlledLightingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "PilotControlledLighting"),
                PilotControlledLightingType.class,
                (PilotControlledLightingType) v
            );
        }
        if (clazz.equals(PrecisionApproachRadarType.class)) {
            return new JAXBElement<PrecisionApproachRadarType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "PrecisionApproachRadar"),
                PrecisionApproachRadarType.class,
                (PrecisionApproachRadarType) v
            );
        }
        if (clazz.equals(PrimarySurveillanceRadarType.class)) {
            return new JAXBElement<PrimarySurveillanceRadarType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "PrimarySurveillanceRadar"),
                PrimarySurveillanceRadarType.class,
                (PrimarySurveillanceRadarType) v
            );
        }
        if (clazz.equals(ProcedureDMEType.class)) {
            return new JAXBElement<ProcedureDMEType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "ProcedureDME"),
                ProcedureDMEType.class,
                (ProcedureDMEType) v
            );
        }
        if (clazz.equals(RadarSystemType.class)) {
            return new JAXBElement<RadarSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RadarSystem"),
                RadarSystemType.class,
                (RadarSystemType) v
            );
        }
        if (clazz.equals(RadioCommunicationChannelType.class)) {
            return new JAXBElement<RadioCommunicationChannelType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RadioCommunicationChannel"),
                RadioCommunicationChannelType.class,
                (RadioCommunicationChannelType) v
            );
        }
        if (clazz.equals(RadioFrequencyAreaType.class)) {
            return new JAXBElement<RadioFrequencyAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RadioFrequencyArea"),
                RadioFrequencyAreaType.class,
                (RadioFrequencyAreaType) v
            );
        }
        if (clazz.equals(RoadType.class)) {
            return new JAXBElement<RoadType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Road"),
                RoadType.class,
                (RoadType) v
            );
        }
        if (clazz.equals(RouteDMEType.class)) {
            return new JAXBElement<RouteDMEType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RouteDME"),
                RouteDMEType.class,
                (RouteDMEType) v
            );
        }
        if (clazz.equals(RouteSegmentType.class)) {
            return new JAXBElement<RouteSegmentType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RouteSegment"),
                RouteSegmentType.class,
                (RouteSegmentType) v
            );
        }
        if (clazz.equals(RouteType.class)) {
            return new JAXBElement<RouteType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Route"),
                RouteType.class,
                (RouteType) v
            );
        }
        if (clazz.equals(RulesProceduresType.class)) {
            return new JAXBElement<RulesProceduresType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RulesProcedures"),
                RulesProceduresType.class,
                (RulesProceduresType) v
            );
        }
        if (clazz.equals(RunwayBlastPadType.class)) {
            return new JAXBElement<RunwayBlastPadType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayBlastPad"),
                RunwayBlastPadType.class,
                (RunwayBlastPadType) v
            );
        }
        if (clazz.equals(RunwayCentrelinePointType.class)) {
            return new JAXBElement<RunwayCentrelinePointType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayCentrelinePoint"),
                RunwayCentrelinePointType.class,
                (RunwayCentrelinePointType) v
            );
        }
        if (clazz.equals(RunwayDirectionLightSystemType.class)) {
            return new JAXBElement<RunwayDirectionLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayDirectionLightSystem"),
                RunwayDirectionLightSystemType.class,
                (RunwayDirectionLightSystemType) v
            );
        }
        if (clazz.equals(RunwayDirectionType.class)) {
            return new JAXBElement<RunwayDirectionType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayDirection"),
                RunwayDirectionType.class,
                (RunwayDirectionType) v
            );
        }
        if (clazz.equals(RunwayElementType.class)) {
            return new JAXBElement<RunwayElementType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayElement"),
                RunwayElementType.class,
                (RunwayElementType) v
            );
        }
        if (clazz.equals(RunwayMarkingType.class)) {
            return new JAXBElement<RunwayMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayMarking"),
                RunwayMarkingType.class,
                (RunwayMarkingType) v
            );
        }
        if (clazz.equals(RunwayProtectAreaLightSystemType.class)) {
            return new JAXBElement<RunwayProtectAreaLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayProtectAreaLightSystem"),
                RunwayProtectAreaLightSystemType.class,
                (RunwayProtectAreaLightSystemType) v
            );
        }
        if (clazz.equals(RunwayProtectAreaType.class)) {
            return new JAXBElement<RunwayProtectAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayProtectArea"),
                RunwayProtectAreaType.class,
                (RunwayProtectAreaType) v
            );
        }
        if (clazz.equals(RunwayType.class)) {
            return new JAXBElement<RunwayType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Runway"),
                RunwayType.class,
                (RunwayType) v
            );
        }
        if (clazz.equals(RunwayVisualRangeType.class)) {
            return new JAXBElement<RunwayVisualRangeType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "RunwayVisualRange"),
                RunwayVisualRangeType.class,
                (RunwayVisualRangeType) v
            );
        }
        if (clazz.equals(SDFType.class)) {
            return new JAXBElement<SDFType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SDF"),
                SDFType.class,
                (SDFType) v
            );
        }
        if (clazz.equals(SafeAltitudeAreaType.class)) {
            return new JAXBElement<SafeAltitudeAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SafeAltitudeArea"),
                SafeAltitudeAreaType.class,
                (SafeAltitudeAreaType) v
            );
        }
        if (clazz.equals(SeaplaneLandingAreaType.class)) {
            return new JAXBElement<SeaplaneLandingAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SeaplaneLandingArea"),
                SeaplaneLandingAreaType.class,
                (SeaplaneLandingAreaType) v
            );
        }
        if (clazz.equals(SeaplaneRampSiteType.class)) {
            return new JAXBElement<SeaplaneRampSiteType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SeaplaneRampSite"),
                SeaplaneRampSiteType.class,
                (SeaplaneRampSiteType) v
            );
        }
        if (clazz.equals(SearchRescueServiceType.class)) {
            return new JAXBElement<SearchRescueServiceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SearchRescueService"),
                SearchRescueServiceType.class,
                (SearchRescueServiceType) v
            );
        }
        if (clazz.equals(SecondarySurveillanceRadarType.class)) {
            return new JAXBElement<SecondarySurveillanceRadarType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SecondarySurveillanceRadar"),
                SecondarySurveillanceRadarType.class,
                (SecondarySurveillanceRadarType) v
            );
        }
        if (clazz.equals(SignificantPointInAirspaceType.class)) {
            return new JAXBElement<SignificantPointInAirspaceType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SignificantPointInAirspace"),
                SignificantPointInAirspaceType.class,
                (SignificantPointInAirspaceType) v
            );
        }
        if (clazz.equals(SpecialDateType.class)) {
            return new JAXBElement<SpecialDateType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SpecialDate"),
                SpecialDateType.class,
                (SpecialDateType) v
            );
        }
        if (clazz.equals(SpecialNavigationStationType.class)) {
            return new JAXBElement<SpecialNavigationStationType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SpecialNavigationStation"),
                SpecialNavigationStationType.class,
                (SpecialNavigationStationType) v
            );
        }
        if (clazz.equals(SpecialNavigationSystemType.class)) {
            return new JAXBElement<SpecialNavigationSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SpecialNavigationSystem"),
                SpecialNavigationSystemType.class,
                (SpecialNavigationSystemType) v
            );
        }
        if (clazz.equals(StandMarkingType.class)) {
            return new JAXBElement<StandMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "StandMarking"),
                StandMarkingType.class,
                (StandMarkingType) v
            );
        }
        if (clazz.equals(StandardInstrumentArrivalType.class)) {
            return new JAXBElement<StandardInstrumentArrivalType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "StandardInstrumentArrival"),
                StandardInstrumentArrivalType.class,
                (StandardInstrumentArrivalType) v
            );
        }
        if (clazz.equals(StandardInstrumentDepartureType.class)) {
            return new JAXBElement<StandardInstrumentDepartureType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "StandardInstrumentDeparture"),
                StandardInstrumentDepartureType.class,
                (StandardInstrumentDepartureType) v
            );
        }
        if (clazz.equals(StandardLevelColumnType.class)) {
            return new JAXBElement<StandardLevelColumnType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "StandardLevelColumn"),
                StandardLevelColumnType.class,
                (StandardLevelColumnType) v
            );
        }
        if (clazz.equals(StandardLevelSectorType.class)) {
            return new JAXBElement<StandardLevelSectorType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "StandardLevelSector"),
                StandardLevelSectorType.class,
                (StandardLevelSectorType) v
            );
        }
        if (clazz.equals(StandardLevelTableType.class)) {
            return new JAXBElement<StandardLevelTableType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "StandardLevelTable"),
                StandardLevelTableType.class,
                (StandardLevelTableType) v
            );
        }
        if (clazz.equals(SurveyControlPointType.class)) {
            return new JAXBElement<SurveyControlPointType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "SurveyControlPoint"),
                SurveyControlPointType.class,
                (SurveyControlPointType) v
            );
        }
        if (clazz.equals(TACANType.class)) {
            return new JAXBElement<TACANType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TACAN"),
                TACANType.class,
                (TACANType) v
            );
        }
        if (clazz.equals(TaxiHoldingPositionLightSystemType.class)) {
            return new JAXBElement<TaxiHoldingPositionLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TaxiHoldingPositionLightSystem"),
                TaxiHoldingPositionLightSystemType.class,
                (TaxiHoldingPositionLightSystemType) v
            );
        }
        if (clazz.equals(TaxiHoldingPositionMarkingType.class)) {
            return new JAXBElement<TaxiHoldingPositionMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TaxiHoldingPositionMarking"),
                TaxiHoldingPositionMarkingType.class,
                (TaxiHoldingPositionMarkingType) v
            );
        }
        if (clazz.equals(TaxiHoldingPositionType.class)) {
            return new JAXBElement<TaxiHoldingPositionType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TaxiHoldingPosition"),
                TaxiHoldingPositionType.class,
                (TaxiHoldingPositionType) v
            );
        }
        if (clazz.equals(TaxiwayElementType.class)) {
            return new JAXBElement<TaxiwayElementType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TaxiwayElement"),
                TaxiwayElementType.class,
                (TaxiwayElementType) v
            );
        }
        if (clazz.equals(TaxiwayLightSystemType.class)) {
            return new JAXBElement<TaxiwayLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TaxiwayLightSystem"),
                TaxiwayLightSystemType.class,
                (TaxiwayLightSystemType) v
            );
        }
        if (clazz.equals(TaxiwayMarkingType.class)) {
            return new JAXBElement<TaxiwayMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TaxiwayMarking"),
                TaxiwayMarkingType.class,
                (TaxiwayMarkingType) v
            );
        }
        if (clazz.equals(TaxiwayType.class)) {
            return new JAXBElement<TaxiwayType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Taxiway"),
                TaxiwayType.class,
                (TaxiwayType) v
            );
        }
        if (clazz.equals(TerminalArrivalAreaType.class)) {
            return new JAXBElement<TerminalArrivalAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TerminalArrivalArea"),
                TerminalArrivalAreaType.class,
                (TerminalArrivalAreaType) v
            );
        }
        if (clazz.equals(TouchDownLiftOffLightSystemType.class)) {
            return new JAXBElement<TouchDownLiftOffLightSystemType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TouchDownLiftOffLightSystem"),
                TouchDownLiftOffLightSystemType.class,
                (TouchDownLiftOffLightSystemType) v
            );
        }
        if (clazz.equals(TouchDownLiftOffMarkingType.class)) {
            return new JAXBElement<TouchDownLiftOffMarkingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TouchDownLiftOffMarking"),
                TouchDownLiftOffMarkingType.class,
                (TouchDownLiftOffMarkingType) v
            );
        }
        if (clazz.equals(TouchDownLiftOffSafeAreaType.class)) {
            return new JAXBElement<TouchDownLiftOffSafeAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TouchDownLiftOffSafeArea"),
                TouchDownLiftOffSafeAreaType.class,
                (TouchDownLiftOffSafeAreaType) v
            );
        }
        if (clazz.equals(TouchDownLiftOffType.class)) {
            return new JAXBElement<TouchDownLiftOffType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "TouchDownLiftOff"),
                TouchDownLiftOffType.class,
                (TouchDownLiftOffType) v
            );
        }
        if (clazz.equals(UnitType.class)) {
            return new JAXBElement<UnitType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "Unit"),
                UnitType.class,
                (UnitType) v
            );
        }
        if (clazz.equals(UnplannedHoldingType.class)) {
            return new JAXBElement<UnplannedHoldingType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "UnplannedHolding"),
                UnplannedHoldingType.class,
                (UnplannedHoldingType) v
            );
        }
        if (clazz.equals(VORType.class)) {
            return new JAXBElement<VORType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "VOR"),
                VORType.class,
                (VORType) v
            );
        }
        if (clazz.equals(VerticalStructureType.class)) {
            return new JAXBElement<VerticalStructureType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "VerticalStructure"),
                VerticalStructureType.class,
                (VerticalStructureType) v
            );
        }
        if (clazz.equals(VisualGlideSlopeIndicatorType.class)) {
            return new JAXBElement<VisualGlideSlopeIndicatorType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "VisualGlideSlopeIndicator"),
                VisualGlideSlopeIndicatorType.class,
                (VisualGlideSlopeIndicatorType) v
            );
        }
        if (clazz.equals(WorkAreaType.class)) {
            return new JAXBElement<WorkAreaType>(
                new QName("http://www.aixm.aero/schema/5.1.1", "WorkArea"),
                WorkAreaType.class,
                (WorkAreaType) v
            );
        } else {
            throw new IllegalArgumentException("Unknown type: " + clazz.getName());
        }
    }
}

