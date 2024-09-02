package com.aixm.delorean.core.xml;

import javax.xml.XMLConstants;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import java.io.File;

public enum XMLConfig {

    AIXM_5_1_1(
        "a5_1_1", 
        "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd"
        );

    private final String version;
    private final String xsd;
    private final Schema schema;
    private final SchemaFactory schemaFactory;

    private XMLConfig(String version, String xsd) {
        this.version = version;
        this.xsd = xsd;
        this.schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        this.schema = loadSchema(xsd);
    }

    public String getVersion() {
        return version;
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
