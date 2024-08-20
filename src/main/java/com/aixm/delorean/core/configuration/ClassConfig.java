package com.aixm.delorean.core.configuration;

import javax.xml.XMLConstants;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import java.io.File;

public enum ClassConfig {
    // TODO VERSION_5_1_1("5.1.1", "com.aixm.delorean.core.aixm.v511.message."),
    AIXM_5_1_1(
        "a5_1_1", 
        "com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType"
        );

    private String version;
    private String root;
    private String xsd;
    private Schema schema;
    private SchemaFactory schemaFactory;

    private ClassConfig(String version, String root, String xsd) {
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

    public static XMLConfig fromString(String version) {
        for (XMLConfig schemaVersion : XMLConfig.values()) {
            if (schemaVersion.getVersion().equals(version)) {
                return schemaVersion;
            }
        }
        throw new IllegalArgumentException("Unsupported schema version: " + version);
    }
}
