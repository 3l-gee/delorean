package com.aixm.delorean.core.xml;

import com.aixm.delorean.core.configuration.XMLConfig;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.xml.XMLConstants;
import javax.xml.namespace.QName;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import org.glassfish.jaxb.core.v2.TODO;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.Unmarshaller;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.ValidationEvent;
import jakarta.xml.bind.ValidationEventHandler;

public class XMLBinding<T> {
    private JAXBContext context;
    private final Class<T> structure;
    private Unmarshaller unmarshaller;
    private Marshaller marshaller;
    private SchemaFactory schemaFactory;
    private Schema schema;

    public XMLBinding(XMLConfig xmlConfig, Class<T> structure) {
        this.schema = xmlConfig.getSchema();
        this.structure = structure;
        try {
            this.context = JAXBContext.newInstance(structure);
            this.schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
            this.unmarshaller = this.context.createUnmarshaller();
            this.marshaller = this.context.createMarshaller();
            this.marshaller.setSchema(this.schema);
            this.marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void setValidationRule() {
        try {
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

    public T unmarshal(String path) {
        try (InputStream xmlStream = new FileInputStream(path)) {
            JAXBElement<T> rootElement = (JAXBElement<T>) this.unmarshaller.unmarshal(xmlStream);
            T root = rootElement.getValue();
            return root;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void marshal(T record, String path, Class<T> clazz) {
        try (FileOutputStream outputStream = new FileOutputStream(new File(path))) {
            //TODO for now this is easier
            this.marshaller.setSchema(null);

            // Create JAXBElement with the provided class type
            QName qName = new QName("http://www.aixm.aero/schema/5.1.1", "AIXMBasicMessage");
            JAXBElement<T> rootElement = new JAXBElement<>(qName, clazz, record);

            // Marshal the JAXBElement to the output stream
            this.marshaller.marshal(rootElement, outputStream); 

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

