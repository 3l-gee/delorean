package com.aixm.delorean.core.configuration;

import javax.xml.XMLConstants;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.InputStream;
import java.net.URL;

public enum SchemaVersion {
    // TODO VERSION_5_1_1("5.1.1", "com.aixm.delorean.core.aixm.v511.message."),
    AIXM_5_1_1("a5_1_1", "com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType", "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd");

    private String version;
    private String root;
    private String xsd;
    private Schema schema;
    private SchemaFactory schemaFactory;

    private SchemaVersion(String version, String root, String xsd) {
        this.version = version;
        this.root = root;
        this.xsd = xsd;
        this.schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        this.schema = loadSchema(xsd);
    }

    public String getVersion() {
        return version;
    }
    
    public String getRoot() {
        return root;
    }
    
    public String getXsd() {
        return xsd;
    }

    public Schema getSchema() {
        return schema;
    }

    private Schema loadSchema(String xsdPath) {
        try {
          
            Schema schema = this.schemaFactory.newSchema(new File(xsdPath));
            
            return schema;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load schema: " + xsdPath, e);
        }
    }

    // private Schema loadSchema(String xsdPath) {
    //     try (InputStream xsdStream = SchemaVersion.class.getResourceAsStream(xsdPath)) {
    //         if (xsdStream == null) {
    //             throw new IllegalArgumentException("Schema file not found in classpath: " + xsdPath);
    //         }
            
    //         return this.schemaFactory.newSchema(new StreamSource(xsdStream));
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         throw new RuntimeException("Failed to load schema: " + xsdPath, e);
    //     }
    // }

    public static SchemaVersion fromString(String version) {
        for (SchemaVersion schemaVersion : SchemaVersion.values()) {
            if (schemaVersion.getVersion().equals(version)) {
                return schemaVersion;
            }
        }
        throw new IllegalArgumentException("Unsupported schema version: " + version);
    }
}
