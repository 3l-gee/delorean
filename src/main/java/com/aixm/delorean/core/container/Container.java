package com.aixm.delorean.core.container;

import org.glassfish.jaxb.runtime.v2.util.TypeCast;

import com.aixm.delorean.core.schema.a5_1_1.message.AIXMBasicMessageType;
import com.aixm.delorean.core.schema.a5_1_1.message.BasicMessageMemberAIXMPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.AbstractAIXMFeatureType;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.Unmarshaller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Scanner;

public class Container {
    private final JAXBContext context;
    private final Class<?> rootType;
    private AIXMBasicMessageType root;
    private Unmarshaller unmarshaller;


    public Container(JAXBContext context, Class<?> rootType) {
        this.rootType = rootType;
        this.context = context; 
        try {
            this.unmarshaller = this.context.createUnmarshaller();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setRoot(AIXMBasicMessageType root) {
        this.root = root;
    }

    public Object getRoot() {
        return root;
    }

    public JAXBContext getContext() {
        return context;
    }

    public Class<?> getTypes() {
        return rootType;
    }

    public void unmarshal(String path) {
        try {
            InputStream xmlStream = null;

            try { 
                xmlStream = new FileInputStream(path);

            } catch (Exception e) {
                e.printStackTrace();
            }
            
            // TODO this must become dynamic
            JAXBElement<AIXMBasicMessageType> rootElement = (JAXBElement<AIXMBasicMessageType>) this.unmarshaller.unmarshal(xmlStream);
            this.root = rootElement.getValue();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void show() {
        List<BasicMessageMemberAIXMPropertyType> list = root.getHasMember();

        for (int i = 0; i < list.size(); i++) {
                AbstractAIXMFeatureType item = (AbstractAIXMFeatureType) list.get(i).getAbstractAIXMFeature().getValue();
                System.err.println(item.getIdentifier().getValue());
        } 
    }
}

        // try {
        //     // Create JAXB context
        //     JAXBContext context = JAXBContext.newInstance(AIXMBasicMessageType.class);

        //     // Create an Unmarshaller
        //     Unmarshaller unmarshaller = context.createUnmarshaller();

        //     // Load XML file into AIXMBasicMessageType instance using InputStream
        //     InputStream xmlStream = null;

        //     try {
        //         xmlStream = new FileInputStream("C:\\Users\\rapha\\Documents\\project\\delorean\\data\\a5_1_1\\Donlon.xml");
        //         // xmlStream = new FileInputStream("C:\\Users\\gerth\\source\\repos\\3l-gee\\delorean\\data\\a5_1_1\\Donlon.xml");
        //         // Use the xmlStream here
        //     } catch (Exception e) {
        //         e.printStackTrace();
        //     }

        //     JAXBElement<AIXMBasicMessageType> rootElement = (JAXBElement<AIXMBasicMessageType>) unmarshaller.unmarshal(xmlStream);

        //     // Get the AIXMBasicMessageType instance
        //     AIXMBasicMessageType root = rootElement.getValue();

        //     // Here you can use 'root' as needed
        //     List<BasicMessageMemberAIXMPropertyType> list = root.getHasMember();

        //     for (int i = 0; i < list.size(); i++) {
        //         AbstractAIXMFeatureType item = (AbstractAIXMFeatureType) list.get(i).getAbstractAIXMFeature().getValue();
        //         System.err.println(item.getIdentifier().getValue());
        //     } 
            
        // } catch (Exception e) {
        //         e.printStackTrace(); 
        // }
//     }