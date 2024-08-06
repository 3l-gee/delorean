package com.aixm.delorean.core.database;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.schema.TargetType;
import org.hibernate.tool.schema.internal.SchemaDropperImpl;
import org.hibernate.tool.schema.spi.SchemaManagementException;
import org.hibernate.tool.schema.spi.SchemaManagementTool;
import org.hibernate.tool.schema.spi.SchemaManagementToolCoordinator;

import java.util.EnumSet;
import java.util.Properties;

public final class DatabaseSchemaBuilder {

    private DatabaseSchemaBuilder() {
        // Private constructor to prevent instantiation
    }

    public static void buildSchema() {
        // Set up Hibernate configuration programmatically
        Configuration configuration = new Configuration();
        configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
        configuration.setProperty("hibernate.connection.driver_class", "org.postgresql.Driver");
        configuration.setProperty("hibernate.connection.url", "jdbc:postgresql://localhost:5432/delorean");
        configuration.setProperty("hibernate.connection.username", "postgres");
        configuration.setProperty("hibernate.connection.password", "postgres");
        configuration.setProperty("hibernate.hbm2ddl.auto", "update"); // Can be "create", "create-drop", "update"

        // Add annotated classes
        configuration.addAnnotatedClass(com.aixm.delorean.core.schema.a5_1_1.aixm.NavaidType.class);

        // Build session factory
        StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        Metadata metadata = new MetadataSources(standardRegistry).getMetadataBuilder().build();
        
        try {
            SchemaManagementTool schemaManagementTool = SchemaManagementToolCoordinator.getSchemaManagementTool(metadata.getMetadataImplementor());
            schemaManagementTool.getSchemaManagementTool(metadata.getMetadataImplementor()).doCreation(
                    metadata.getMetadataImplementor().getSchemaManagementTool().getSchemaManagementTool(metadata.getMetadataImplementor()),
                    metadata.getMetadataImplementor(),
                    EnumSet.of(TargetType.DATABASE)
            );
        } catch (SchemaManagementException e) {
            e.printStackTrace();
        } finally {
            StandardServiceRegistryBuilder.destroy(standardRegistry);
        }
    }
}
