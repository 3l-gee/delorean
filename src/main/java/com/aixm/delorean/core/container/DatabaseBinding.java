package com.aixm.delorean.core.container;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.validator.constraints.URL;
import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.persistence.metamodel.Metamodel;
import jakarta.validation.constraints.Null;

import java.util.List;
import java.util.ArrayList;


public class DatabaseBinding {
    private SessionFactory sessionFactory;
    private Configuration configuration;

    public DatabaseBinding(Configuration configuration, String url, String username, String password){
        configuration.setProperty("hibernate.connection.username", username);
        configuration.setProperty("hibernate.connection.password", password);
        configuration.setProperty("hibernate.connection.url", url);
        this.configuration = configuration;
        this.sessionFactory = null;
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

    public void load(Object... objects){
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
        Class<?> clazz = object.getClass();
        Class<?>[] metamodel = this.configuration.getMappedClasses();

        for (Class<?> mappedClass : databaseConfig.getMappedClasses()) {
            if (mappedClass.equals(clazz)) {
                return true;
            }
        }

        return false;
    }
}

