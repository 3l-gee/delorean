package com.aixm.delorean.core.container;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.validator.constraints.URL;

import com.aixm.delorean.core.configuration.DatabaseConfig;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.persistence.metamodel.Metamodel;
import jakarta.validation.constraints.Null;

import java.util.List;
import java.util.ArrayList;


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

    public void load(List<?> objects){
        if (this.sessionFactory == null){
            throw new IllegalArgumentException("sessionfactory is not init");
        }

        Session session = this.sessionFactory.openSession();
        Transaction transaction = null;
        List<Object> mappedObjects = new ArrayList<>();

        for (Object object : objects){
            if (object != null && isMappedClass(object)){
                mappedObjects.add(object);
            }
        }

        try {
            transaction = session.beginTransaction();

            for (Object mappedObject : mappedObjects){
                session.persist(mappedObject);
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
    }

    private boolean isMappedClass(Object object){
        System.err.println(object.getClass());   
        if (this.databaseConfig.getMappedClasses().contains(object.getClass())){
            System.err.println("true");
            return true;
        }

        System.err.println("false");
        return false;
    }
}

