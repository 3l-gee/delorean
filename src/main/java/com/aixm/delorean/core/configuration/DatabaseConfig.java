package com.aixm.delorean.core.configuration;

import org.hibernate.cfg.Configuration;

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
        new Class<?>[]{com.aixm.delorean.core.schema.a5_1_1.aixm.TACANPropertyType.class} // Mapping classes
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

    // Enum constructor
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
    }

    public String getVersion() {
        return version;
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

    public static Configuration fromString(String version) {
        for (DatabaseConfig Schema : DatabaseConfig.values()) {
            if (Schema.getVersion().equals(version)) {
                return Schema.getHibernateConfiguration();
            }
        }
        throw new IllegalArgumentException("Unsupported schema version: " + version);
    }


}
