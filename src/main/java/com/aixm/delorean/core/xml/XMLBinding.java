package com.aixm.delorean.core.xml;

import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.xml.XMLConstants;
import javax.xml.namespace.QName;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;

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
            Object unmarshalledObject = this.unmarshaller.unmarshal(xmlStream);
    
            if (unmarshalledObject instanceof JAXBElement<?>) {

                JAXBElement<T> rootElement = (JAXBElement<T>) unmarshalledObject;
                ConsoleLogger.log(LogLevel.INFO, "Successfully unmarshalled");
                return rootElement.getValue();
            } else {
                ConsoleLogger.log(LogLevel.INFO, "Successfully unmarshalled");
                return (T) unmarshalledObject;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    
    
    public T unmarshalPojo(String path) {
        try (InputStream xmlStream = new FileInputStream(path)) {
            return (T) this.unmarshaller.unmarshal(xmlStream);
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
            QName qName = new QName("http://www.aixm.aero/schema/5.1/message", "AIXMBasicMessage");
            JAXBElement<T> rootElement = new JAXBElement<>(qName, clazz, record);

            // Marshal the JAXBElement to the output stream
            this.marshaller.marshal(rootElement, outputStream); 

            ConsoleLogger.log(LogLevel.INFO, "Successfully marshalled");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

