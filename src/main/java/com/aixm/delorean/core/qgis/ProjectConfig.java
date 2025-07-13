package com.aixm.delorean.core.qgis;

import java.util.List;

import com.aixm.delorean.core.database.DatabaseBinding;

public class ProjectConfig {
    private String templatePath;
    private String sqlitePath;
    private String title;
    private String dbname;
    private String host;
    private String port;
        
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

    public String getDbname() { 
        return dbname; 
    }

    public String getHost() { 
        return host; 
    }

    public String getPort() { 
        return port; 
    }
    
    public void generateSource(DatabaseBinding binding) {
        //TODO solve this with non localhosted DB 
        String url = binding.getUrl();  // e.g., jdbc:postgresql://localhost:5432/demo

        String cleanedUrl = url.replace("jdbc:postgresql://", "");

        String[] hostPortAndDb = cleanedUrl.split("/");
        if (hostPortAndDb.length != 2) {
            throw new IllegalArgumentException("Invalid JDBC URL: " + url);
        }

        String hostPort = hostPortAndDb[0]; // localhost:5432
        String dbname = hostPortAndDb[1];   // demo

        String[] hostPortParts = hostPort.split(":");
        String host = hostPortParts[0];     // localhost
        String port = hostPortParts[1];     // 5432

        this.dbname = dbname;
        this.host = host;
        this.port = port;
    }
}
