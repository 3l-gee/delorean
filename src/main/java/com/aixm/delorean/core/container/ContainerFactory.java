package com.aixm.delorean.core.container;

import com.aixm.delorean.core.configuration.SchemaVersion;

import jakarta.xml.bind.JAXBContext;
import javax.xml.validation.Schema;


public final class ContainerFactory {
    private ContainerFactory() {
        // Private constructor to prevent instantiation
    }

    public static Container createContainer(String version) {
    SchemaVersion schemaVersion = SchemaVersion.fromString(version);
    Class<?> schemaVersionClass = null;
    try {
        schemaVersionClass = Class.forName(schemaVersion.getRoot());
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Schema schema = schemaVersion.getSchema();

    JAXBContext context = null;
    try {
        context = JAXBContext.newInstance(schemaVersionClass);

    } catch (Exception e) {
        e.printStackTrace();
    }

    return new Container(context, schemaVersionClass, schema);
    }
       
}
