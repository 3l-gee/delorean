package com.aixm.delorean.core.database;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.Filter;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;

import com.aixm.delorean.core.schema.a5_1.aixm.message.AIXMBasicMessageType;
import com.aixm.delorean.core.schema.a5_1.aixm.message.BasicMessageMemberAIXMPropertyType;
import com.aixm.delorean.core.schema.a5_1.aixm.DesignatedPointType;
import org.hibernate.Transaction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;

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

    public void setUsername(String username){
        this.configuration.setProperty("hibernate.connection.username", username);
    }

    public void setPassword(String password){
        this.configuration.setProperty("hibernate.connection.password", password);
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
        try{
            this.executeSchemaSetupScript();
            this.sessionFactory = configuration.buildSessionFactory();
            ConsoleLogger.log(LogLevel.INFO, "Sucessfully generated mappings");
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    private void executeSchemaSetupScript() {
        String url = this.configuration.getProperty("hibernate.connection.url");
        String username = this.configuration.getProperty("hibernate.connection.username");
        String password = this.configuration.getProperty("hibernate.connection.password");
        String sqlInitFilePath = this.databaseConfig.getSqlInitFilePath();
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream(sqlInitFilePath)) {
            if (inputStream == null) {
                throw new IOException("SQL schema file not found: " + sqlInitFilePath);
            }

            // Read file content
            String sql = new BufferedReader(new InputStreamReader(inputStream))
                    .lines()
                    .collect(Collectors.joining("\n"));

            try (Connection connection = DriverManager.getConnection(url, username, password);
                Statement statement = connection.createStatement()) {

                // Split and execute SQL statements
                for (String query : sql.split(";")) {
                    if (!query.trim().isEmpty()) {
                        statement.execute(query.trim());
                    }
                }

                ConsoleLogger.log(LogLevel.INFO, "Sucessfully generated schema and extensions");
            }

        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Failed to read SQL file: " + e.getMessage(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("Could not read SQL schema file", e);
        } catch (SQLException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Database setup failed: " + e.getMessage(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("Database setup failed", e);
        }
    }


    public void shutdown(){
        this.sessionFactory.close();
    }

    public void load(Object object){
        if (this.sessionFactory == null){
            throw new IllegalArgumentException("sessionfactory is not init");
        }

        Session session = this.sessionFactory.openSession();
        Transaction transaction = null;

        if (object == null || !isMappedClass(object) ){
            return;
        }

        try {
            transaction = session.beginTransaction();
            session.persist(object);
            transaction.commit();
            ConsoleLogger.log(LogLevel.INFO, "Sucessfully loaded");
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
            SELECT DISTINCT ON (sequence_number)
            navaids_points.designatedpoint_tsp.id
            FROM navaids_points.designatedpoint
            LEFT JOIN designatedpoint_timeslice
            ON navaids_points.designatedpoint.id = designatedpoint_timeslice.designatedpoint_id
            LEFT JOIN navaids_points.designatedpoint_tsp
            ON designatedpoint_timeslice.designatedpoint_tsp_id = navaids_points.designatedpoint_tsp.id
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
            WHERE tsp.dbid IN :validIds
                AND (:validDateTime <= ts.validTime.endPosition OR ts.validTime.endPosition IS NULL)
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

        ConsoleLogger.log(LogLevel.INFO, "Successfully exported");
        return object;
    }


    private boolean isMappedClass(Object object){ 
        if (this.databaseConfig.getMappedClasses().contains(object.getClass())){
            return true;
        }
        return false;
    }
}

