package com.aixm.delorean.core.container;

import com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.message.BasicMessageMemberAIXMPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.AbstractAIXMFeatureType;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.Unmarshaller;
import jakarta.xml.bind.ValidationEvent;
import jakarta.xml.bind.ValidationEventHandler;
import jakarta.xml.bind.ValidationEventLocator;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.xml.validation.SchemaFactory;
import javax.xml.XMLConstants;
import javax.xml.validation.Schema;

public class Container {
    private final JAXBContext context;
    private final Class<?> rootType;
    private AIXMBasicMessageType root;
    private Unmarshaller unmarshaller;
    private SchemaFactory schemaFactory;
    private Schema schema;


    public Container(JAXBContext context, Class<?> rootType, String schemaPath) {
        this.rootType = rootType;
        this.context = context; 
        this.schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        try {
            this.schema = this.schemaFactory.newSchema(new File(schemaPath));
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            this.unmarshaller = this.context.createUnmarshaller();
            this.unmarshaller.setSchema(this.schema);
            this.unmarshaller.setEventHandler(new ValidationEventHandler() {
                public boolean handleEvent(ValidationEvent event) {
                    System.out.println("\nEVENT");
                    System.out.println("SEVERITY:  " + event.getSeverity());
                    System.out.println("MESSAGE:  " + event.getMessage());
                    System.out.println("LINKED EXCEPTION:  " + event.getLinkedException());
                    System.out.println("LOCATOR");
                    System.out.println("    LINE NUMBER:  " + event.getLocator().getLineNumber());
                    System.out.println("    COLUMN NUMBER:  " + event.getLocator().getColumnNumber());
                    System.out.println("    OFFSET:  " + event.getLocator().getOffset());
                    System.out.println("    OBJECT:  " + event.getLocator().getObject());
                    System.out.println("    NODE:  " + event.getLocator().getNode());
                    System.out.println("    URL:  " + event.getLocator().getURL());
                    return true;
                }
            });
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