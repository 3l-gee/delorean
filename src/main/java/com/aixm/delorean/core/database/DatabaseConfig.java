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
            com.aixm.delorean.core.schema.a5_1_1.aixm.message.BasicMessageMemberAIXMPropertyType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AerialRefuellingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AeronauticalGroundLightType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficControlServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirTrafficManagementServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftGroundServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AircraftStandType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportClearanceServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportCollocationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHeliportType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportHotSpotType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportProtectionAreaMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirportSuppliesServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceBorderCrossingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AirspaceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AltimeterSourceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AngleIndicationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApproachLightingSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ApronType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrestingGearType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalFeederLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ArrivalLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AuthorityForAirspaceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.AzimuthType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ChangeOverPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointINSType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CheckpointVORType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.CirclingAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DMEType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DeicingAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DepartureLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DesignatedPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DirectionFinderType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.DistanceIndicationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ElevationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FinalLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FireFightingServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FlightRestrictionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.FloatingDockSiteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GeoBorderType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GlidepathType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GroundTrafficControlServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.GuidanceLineType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingAssessmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.HoldingPatternType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InformationServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InitialLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.InstrumentApproachProcedureType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.IntermediateLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.LocalizerType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MarkerBeaconType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MarkingBuoyType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.MissedApproachLegType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NDBType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaRestrictionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NavigationAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.NonMovementAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ObstacleAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.OrganisationAuthorityType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerLoadingBridgeType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PassengerServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PilotControlledLightingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PrecisionApproachRadarType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.PrimarySurveillanceRadarType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.ProcedureDMEType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadarSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadioCommunicationChannelType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RadioFrequencyAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RoadType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteDMEType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteSegmentType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RouteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RulesProceduresType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayBlastPadType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayCentrelinePointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayDirectionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayProtectAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.RunwayVisualRangeType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SDFType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SafeAltitudeAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneLandingAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SeaplaneRampSiteType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SearchRescueServiceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SecondarySurveillanceRadarType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SignificantPointInAirspaceType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialDateType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationStationType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SpecialNavigationSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentArrivalType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardInstrumentDepartureType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelColumnType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelSectorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.StandardLevelTableType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.SurveyControlPointType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TACANType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiHoldingPositionType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayElementType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TaxiwayType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TerminalArrivalAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffLightSystemType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffMarkingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffSafeAreaType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.TouchDownLiftOffType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnitType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.UnplannedHoldingType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VORType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VerticalStructureType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.VisualGlideSlopeIndicatorType.class,
            com.aixm.delorean.core.schema.a5_1_1.aixm.WorkAreaType.class
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
            com.aixm.delorean.core.schema.school.School.class,
            com.aixm.delorean.core.schema.school.Classroom.class,
            com.aixm.delorean.core.schema.school.ClassroomList.class,
            com.aixm.delorean.core.schema.school.StudentList.class,
            com.aixm.delorean.core.schema.school.Student.class,
            com.aixm.delorean.core.schema.school.TeacherList.class,
            com.aixm.delorean.core.schema.school.Teacher.class
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
        configuration.setProperty("hibernate.hbm2ddl.auto", this.hbm2ddlAuto);

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
