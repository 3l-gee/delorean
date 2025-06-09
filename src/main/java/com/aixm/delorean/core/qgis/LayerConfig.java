package com.aixm.delorean.core.qgis;

public class LayerConfig {
    private String layerName;

    public LayerConfig(String layerName) {
        this.layerName = layerName;
    }

    public String getLayer() {
        return this.layerName;
    }

    public void setLayer(String layerName) {
        this.layerName = layerName;
    }
}

