package com.aixm.delorean.core.qgis;

import java.util.List;

public class ProjectConfig {
    private String templatePath;
    private String sqlitePath;
    private String title;
    private List<LayerConfig> layers;

    public ProjectConfig(String templatePath,String sqlitePath, String title, List<LayerConfig> layers) {
        this.templatePath = templatePath; 
        this.sqlitePath = sqlitePath; 
        this.title = title;
        this.layers = layers;
    }

    public String getTemplatePath() {
        return this.templatePath;
    }

    public String getSqlitePath() {
        return this.sqlitePath;
    }

    public String getTitle() {
        return this.title;
    }

    public List<LayerConfig> getLayer() {
        return this.layers;
    }
}
