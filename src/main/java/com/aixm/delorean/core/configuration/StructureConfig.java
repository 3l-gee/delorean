package com.aixm.delorean.core.configuration;


public enum StructureConfig {

    AIXM_5_1_1(
        "a5_1_1", 
        "com.aixm.delorean.core.schema.a5_1_1.aixm.message.AIXMBasicMessageType"
        );

    private final String version;
    private final String structure;

    private StructureConfig(String version, String structure) {
        this.version = version;
        this.structure = structure;
    }

    public String getVersion() {
        return version;
    }
    
    public String getStructure() {
        return structure;
    }
    
    public static StructureConfig fromString(String version) {
        for (StructureConfig structure : StructureConfig.values()) {
            if (structure.getVersion().equals(version)) {
                return structure;
            }
        }
        throw new IllegalArgumentException("Unsupported schema version: " + version);
    }
}
