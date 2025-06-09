package com.aixm.delorean.core.qgis;

import java.util.List;

public class ProjectConfig {
    private String path;
    private String title;
    private List<LayerConfig> layers;

    public ProjectConfig(String path, String title, List<LayerConfig> layers) {
        this.path = path; 
        this.title = title;
        this.layers = layers;
    }

    public String getPath() {
        return this.path;
    }

    public String getTitle() {
        return this.title;
    }

    public List<LayerConfig> getLayer() {
        return this.layers;
    }
}
