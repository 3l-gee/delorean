package com.aixm.delorean.core.qgis;

import java.util.UUID;

public abstract class LayerConfig {
    private String name;
    private String uuid;
    private String nameUuid;
    private String provider;
    private String source;

    public LayerConfig(String name, String provider, String source) {
        this.name = name;
        this.provider = provider;
        this.source = source;
        this.uuid = UUID.randomUUID().toString().replace("-", "_");
        this.nameUuid = this.name + "_" + this.uuid;
    }

    public String getName() {
        return this.name;
    }

    public String getUuid() {
        return this.uuid;
    }

    public String getNameUuid() {
        return this.nameUuid;
    }

    public String getProvider() {
        return this.provider;
    }

    public String getSource() {
        return this.source;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public void setSource(String source) {
        this.source = source;
    }
}

