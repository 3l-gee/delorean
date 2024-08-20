package com.aixm.delorean.core.container;

import com.aixm.delorean.core.configuration.StructureConfig;

public final class ContainerFactory {
    private ContainerFactory() {
        // Private constructor to prevent instantiation
    }

    public static Container createContainer(StructureConfig structure) {
        Class<?> structureClass = null;
        try {
            structureClass = Class.forName(structure.getStructure());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return new Container(structureClass);
    }
       
}
