package com.aixm.delorean.core.database;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.Filter;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.hibernate.StatelessSession;
import org.hibernate.cfg.Configuration;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.org.gml.v_3_2.ArcStringType;
import com.aixm.delorean.core.schema.a5_1.aixm.message.AIXMBasicMessageType;
import com.aixm.delorean.core.schema.a5_1.aixm.message.BasicMessageMemberAIXMPropertyType;
import com.aixm.delorean.core.schema.a5_1.aixm.AbstractAIXMFeatureType;
import com.aixm.delorean.core.schema.a5_1.aixm.DesignatedPointType;
import com.aixm.delorean.core.schema.a5_1.aixm.DesignatedPointTimeSlicePropertyType;
import com.aixm.delorean.core.schema.a5_1.aixm.DesignatedPointTimeSliceType;
import org.hibernate.Transaction;

import jakarta.persistence.Tuple;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Set;

public class DatabaseBinding<T> {
    private SessionFactory sessionFactory;
    private Configuration configuration;
    private DatabaseConfig databaseConfig;

    public DatabaseBinding(DatabaseConfig databaseConfig){
        this.databaseConfig = databaseConfig;
        Configuration configuration = databaseConfig.getConfiguration();
        this.configuration = configuration;
        this.sessionFactory = null;
    }
    
    public void setUrl(String url){
        this.configuration.setProperty("hibernate.connection.url", url);
    }

    public String getUrl(){
        return this.configuration.getProperty("hibernate.connection.url");
    }

    public void setUsername(String username){
        this.configuration.setProperty("hibernate.connection.username", username);
    }

    public String getUserName(){
        return this.configuration.getProperty("hibernate.connection.username");
    }

    public void setPassword(String password){
        this.configuration.setProperty("hibernate.connection.password", password);
    }

    private Connection getConnection() throws SQLException {
        String url = configuration.getProperty("hibernate.connection.url");
        String username = configuration.getProperty("hibernate.connection.username");
        String password = configuration.getProperty("hibernate.connection.password");
        return DriverManager.getConnection(url, username, password);
    }

    public Session getSession() {
        return this.sessionFactory.openSession();
    }

    private enum hbm2ddlEnum {
        NONE("none"),
        CREATE_ONLY("create-only"),
        DROP("drop"),
        CREATE("create"),
        CREATE_DROP("create-drop"),
        VALIDATE("validate"),
        UPDATE("update");
    
        private final String value;
    
        hbm2ddlEnum(String value) {
            this.value = value;
        }
    
        public String getValue() {
            return value;
        }
    
        public static hbm2ddlEnum fromString(String value) {
            for (hbm2ddlEnum e : hbm2ddlEnum.values()) {
                if (e.value.equalsIgnoreCase(value)) {
                    return e;
                }
            }
            throw new IllegalArgumentException("Invalid hbm2ddl value: " + value);
        }
    }

    public void setHbm2ddl(String hbm2ddlAuto) {
        if (hbm2ddlAuto != null) {
            try {
                hbm2ddlEnum hbm2ddl = hbm2ddlEnum.fromString(hbm2ddlAuto);
                this.configuration.setProperty("hibernate.hbm2ddl.auto", hbm2ddl.getValue());
            } catch (IllegalArgumentException e) {            
                ConsoleLogger.log(LogLevel.ERROR, "Invalid hbm2ddl value: " + hbm2ddlAuto, new Exception().getStackTrace()[0]);
                System.err.println("Invalid hbm2ddl value provided: " + hbm2ddlAuto);
            }
        }
    }
  
    public void startup() {
        try {
            String hbm2ddl = this.configuration.getProperty("hibernate.hbm2ddl.auto");
            switch (hbm2ddl) {
                case "create":
                case "create-only":
                case "create-drop":
                    this.executeSQLScript(this.databaseConfig.getSqlPreInitFilePath());
                    this.sessionFactory = configuration.buildSessionFactory();
                    this.executeSQLScript(this.databaseConfig.getSqlPostInitFilePath());
                    break;

                case "none":
                case "drop":
                case "validate":
                case "update":
                    this.sessionFactory = configuration.buildSessionFactory();
                    break;

                default:
                    throw new IllegalArgumentException("Unknown hbm2ddl.auto value: " + hbm2ddl);
            }
            ConsoleLogger.log(LogLevel.INFO, "Successfully initialized Hibernate session factory");
        } catch (Exception e) {
            ConsoleLogger.log(LogLevel.ERROR, "Failed during startup", e);
            throw new RuntimeException("Startup failed", e);
        }
    }


    private String readSQLFromClasspath(String path) throws IOException {
        try (InputStream is = getClass().getClassLoader().getResourceAsStream(path)) {
            if (is == null) throw new IOException("SQL script not found: " + path);
            return new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))
                    .lines().collect(Collectors.joining("\n"));
        }
    }

    private void executeSQLScript(String sqlScriptPath) {
        try {
            String sql = readSQLFromClasspath(sqlScriptPath);
            try (Connection conn = getConnection(); Statement stmt = conn.createStatement()) {
                if (sql.contains("DO $$")) {
                    stmt.execute(sql);  // Handle PostgreSQL DO block as one statement
                } else {
                    for (String query : sql.split(";")) {
                        if (!query.trim().isEmpty()) {
                            stmt.execute(query.trim());
                        }
                    }
                }
                ConsoleLogger.log(LogLevel.INFO, "Successfully executed script: " + sqlScriptPath);
            }
        } catch (IOException | SQLException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Error executing script: " + sqlScriptPath, e);
            throw new RuntimeException(e);
        }
    }

    public void shutdown(){
        this.sessionFactory.close();
        ConsoleLogger.log(LogLevel.INFO, "Successfully close connection");
    }

    private List<MutationFeatureTimeslice> getTopTimeslice(Session session, List<String> nameList){

        List<MutationFeatureTimeslice> featureTimeslices = new ArrayList<>();

        for (String name : nameList) {

            String sql = this.generateTopFeatureTimesliceSql(name);

            List<Tuple> tuples = session.createNativeQuery(sql, Tuple.class).getResultList();

            featureTimeslices.addAll(tuples.stream()
                .map(t -> new MutationFeatureTimeslice(
                    t.get("feature_id", Long.class),
                    t.get("identifier", String.class),
                    t.get("sequence_number", Long.class),
                    t.get("correction_number", Long.class),
                    t.get("time_slice_property_id", Long.class),
                    t.get("time_slice_id", Long.class),
                    name
                ))
                .toList());
        }

        return featureTimeslices;
    }

    private String generateTopFeatureTimesliceSql(String name) {
        String feature = name;
        String timeSliceProperty = name + "_tsp";
        String timeSlice = name + "_ts";
        String featureType = name.replaceFirst("^.*\\.", "") + "timeslice_id";

        return String.format("""
            SELECT DISTINCT ON (%1$s.identifier)
            %1$s.id AS feature_id,
            %1$s.identifier AS identifier,
            %3$s.sequence_number AS sequence_number,
            %3$s.correction_number AS correction_number,
            %2$s.id As time_slice_property_id,
            %3$s.id AS time_slice_id
            FROM %1$s
            LEFT JOIN master_join
            ON %1$s.id = master_join.source_id
            LEFT JOIN %2$s
            ON master_join.target_id = %2$s.id
            LEFT JOIN %3$s
            ON %2$s.%4$s = %3$s.id
            WHERE
                %1$s.feature_status = 'APPROVED'
                AND 
                %3$s.feature_status = 'APPROVED'
            ORDER BY identifier, sequence_number DESC, correction_number DESC;
        """,
            feature,                // %1$s - alias: dp, rw, etc.
            timeSliceProperty,      // %2$s - full table (e.g., navaids_points.designatedpoint)
            timeSlice,              // %3$s - tsp table
            featureType             // %4$s - ts table
        );
    }

    public void load(Object object){
        if (this.sessionFactory == null){
            throw new IllegalArgumentException("sessionfactory is not init");
        }

        Session session = this.getSession();
        Transaction transaction = null;

        if (object == null || !isMappedClass(object) ){
            return;
        }

        try {
            transaction = session.beginTransaction();

            // 1. Convert to AixmBasicMesage to separet message and memeber
            AIXMBasicMessageType message = (AIXMBasicMessageType) object;
            List<BasicMessageMemberAIXMPropertyType> basicMessageMembers = message.getHasMember();
            message.unsetHasMember();

            // 2. Persite memeberless message
            session.persist(message); 

            // 3. extract current top timeslice from db (top = last)
            List<MutationFeatureTimeslice> mutationFeatureTimeslices = this.getTopTimeslice(session, this.databaseConfig.getFeatureSqlList());

            // 4. merge timeslice
            basicMessageMembers.parallelStream().forEach(bmm -> {
                try (Session threadSession = this.sessionFactory.openSession()) {
                    threadSession.beginTransaction();

                    AbstractAIXMFeatureType abstractFeature = bmm.getAbstractAIXMFeature();
                    String identifier = abstractFeature.getIdentifier().getValue();
                    MutationFeatureTimeslice existing = mutationFeatureTimeslices.stream()
                        .filter(f -> f.getIdentifier().equals(identifier))
                        .findFirst()
                        .orElse(null);

                    DatabaseFunctionHelper.A5_1HandelTimeSlice(bmm, existing, threadSession);

                    threadSession.getTransaction().commit();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });

            // 5. flush and close original session after persisting message
            session.flush();

            // 6. Use StatelessSession for manual batch operations
            StatelessSession statelessSession = this.sessionFactory.openStatelessSession();
            Transaction statelessTx = statelessSession.beginTransaction();

            try {
                for (MutationFeatureTimeslice mft : mutationFeatureTimeslices){
                    if (mft != null) {
                        mft.appplyMutationStateless(statelessSession); // << implement this
                    }
                }

                statelessTx.commit();
                ConsoleLogger.log(LogLevel.INFO, "Successfully loaded");
            } catch (Exception e) {
                statelessTx.rollback();
                e.printStackTrace();
            } finally {
                statelessSession.close();
            }

            transaction.commit();
            ConsoleLogger.log(LogLevel.INFO, "Sucessfully loaded");

            //TODO : link BasicMessageMemberAIXMPropertyType back to AIXMBasicMessageType, but how do i know to wich one ?
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Object export(Class<T> structure, Object id) {
        ConsoleLogger.log(LogLevel.DEBUG, "Retrieving : " + structure + " with id: " + id, new Exception().getStackTrace()[0]);
        if (this.sessionFactory == null) {
            throw new IllegalArgumentException("sessionfactory is not initialized");
        }

        Session session = this.sessionFactory.openSession();
        Transaction transaction = null;
        AIXMBasicMessageType object = null;

        try {
            transaction = session.beginTransaction();

            // 1. Execute SQL to get the latest IDs per sequence_number
            String sql = """
            SELECT DISTINCT ON (identifier, sequence_number)
            navaids_points.designatedpoint_tsp.id
            FROM navaids_points.designatedpoint
            LEFT JOIN master_join
            ON navaids_points.designatedpoint.id = master_join.source_id
            LEFT JOIN navaids_points.designatedpoint_tsp
            ON master_join.target_id = navaids_points.designatedpoint_tsp.id
            LEFT JOIN navaids_points.designatedpoint_ts
            ON navaids_points.designatedpoint_tsp.designatedpointtimeslice_id = navaids_points.designatedpoint_ts.id
            WHERE
                navaids_points.designatedpoint.feature_status = 'APPROVED'
                AND 
                navaids_points.designatedpoint_ts.feature_status = 'APPROVED'
            ORDER BY sequence_number, correction_number DESC;
            """;

            List<Integer> validIds = session.createNativeQuery(sql, Integer.class).getResultList();

            if (validIds.isEmpty()) {
                ConsoleLogger.log(LogLevel.INFO, "No valid DesignatedPointTimeSlice IDs found");
                return null;
            }

            // 2. Run the HQL using the result from SQL
            String hql = """
            SELECT dpt
            FROM DesignatedPointType dpt
            JOIN FETCH dpt.timeSlice tsp
            JOIN FETCH  tsp.designatedPointTimeSlice ts
            WHERE 
                tsp.dbid IN :validIds
                AND 
                (:validDateTime <= ts.validTime.endPosition OR ts.validTime.endPosition IS NULL)
            ORDER BY ts.sequenceNumber, ts.correctionNumber DESC
            """;

            List<DesignatedPointType> designatedPoints = session.createQuery(hql, DesignatedPointType.class)
                .setParameterList("validIds", validIds)
                .setParameter("validDateTime", Instant.parse("2011-01-01T00:00:00.000Z"))
                .getResultList();


            // 3. Build the export message
            object = new AIXMBasicMessageType();
            for (DesignatedPointType dpt : designatedPoints) {
                BasicMessageMemberAIXMPropertyType member = new BasicMessageMemberAIXMPropertyType();
                member.setAbstractAIXMFeature(dpt);
                object.getHasMember().add(member);
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        ConsoleLogger.log(LogLevel.INFO, "AIXM Successfully exported");
        return object;
    }

    public void computeDBView() {
        this.executeSQLScript(this.databaseConfig.getSqlDBViewFilePath());

        ConsoleLogger.log(LogLevel.INFO, "Database views successfully created.");
    }


    private boolean isMappedClass(Object object){ 
        if (this.databaseConfig.getMappedClasses().contains(object.getClass())){
            return true;
        }
        return false;
    }
}

