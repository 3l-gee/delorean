package com.aixm.delorean.core.database;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType;

import org.hibernate.Transaction;

public class DatabaseBinding {
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
            this.sessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
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
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Object retrieve(Object id) {
        if (this.sessionFactory == null) {
            throw new IllegalArgumentException("sessionfactory is not initialized");
        }

        Session session = this.sessionFactory.openSession();
        Transaction transaction = null;
        Object object = null;

        try {
            transaction = session.beginTransaction();
            object = session.get(AIXMBasicMessageType.class, id);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return object;
        }

        private boolean isMappedClass(Object object){ 
        if (this.databaseConfig.getMappedClasses().contains(object.getClass())){
            return true;
        }
        return false;
    }
}

