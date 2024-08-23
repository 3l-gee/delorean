package com.aixm.delorean.core.container;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.validator.constraints.URL;

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
}

