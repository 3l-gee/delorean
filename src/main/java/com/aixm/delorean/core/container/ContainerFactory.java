package com.aixm.delorean.core.container;

import com.aixm.delorean.core.configuration.RootStructure;

import jakarta.xml.bind.JAXBContext;
import javax.xml.validation.Schema;


public final class ContainerFactory {
    private ContainerFactory() {
        // Private constructor to prevent instantiation
    }

    public static Container createContainer(RootStructure Structure) {
        Class<?> schemaVersionClass = null;
        try {
            schemaVersionClass = Class.forName(Structure.getRoot());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Schema schema = Structure.getSchema();

        JAXBContext context = null;
        try {
            context = JAXBContext.newInstance(schemaVersionClass);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return new Container(context, schemaVersionClass, schema);
    }
       
}
