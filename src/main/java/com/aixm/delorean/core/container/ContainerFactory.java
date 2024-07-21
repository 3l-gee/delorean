package com.aixm.delorean.core.container;

import org.glassfish.jaxb.runtime.v2.util.TypeCast;

import com.aixm.delorean.core.aixm.message.AIXMBasicMessageType;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.Unmarshaller;

public final class ContainerFactory {
    private ContainerFactory() {
        // Private constructor to prevent instantiation
    }
    
    //TODO : version must be seletable by user
    public static Container createContainer(String version) {
        
        // Create JAXB context
        JAXBContext context = null;

        // Create an Unmarshaller
        Unmarshaller unmarshaller = null;
        try {
            // Set cotext
            context = JAXBContext.newInstance(AIXMBasicMessageType.class);

        } catch (Exception e) {
            e.printStackTrace();
        
        }

        return new Container(context, AIXMBasicMessageType.class);
    }
    
}
