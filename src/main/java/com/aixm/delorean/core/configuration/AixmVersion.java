package com.aixm.delorean.core.configuration;

public enum AixmVersion {
    VERSION_4_5("4.5", "com.aixm.delorean.core.aixm.v45.message."),
    VERSION_5_0("5.0", "com.aixm.delorean.core.aixm.v50.message."),
    // TODO VERSION_5_1_1("5.1.1", "com.aixm.delorean.core.aixm.v511.message."),
    VERSION_5_1_1("5.1.1", "com.aixm.delorean.core.aixm.message."),
    VERSION_5_2("5.2", "com.aixm.delorean.core.aixm.v52.message.");

    private String version;
    private String root;

    private AixmVersion(String version, String root) {
        this.version = version;
        this.root = root;
    }

    public String getRoot() {
        return root;
    }

    public String getVersion() {
        return version;
    }
}
