package com.aixm.delorean.core.qgis;

import java.util.UUID;

import com.aixm.delorean.core.database.DatabaseBinding;

// "dbname='demo' port=5432 key='row' srid=4326 type=Point checkPrimaryKeyUnicity='1' table=&quot;navaids_points&quot;.&quot;designatedpoint_publisher_view&quot; (geom)"
public class PostgresLayerConfig extends LayerConfig {
    private String table;
 
    public PostgresLayerConfig(String name, String table) {
        super(name, "postgres", null);
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
        String dbName = hostPortAndDb[1];   // demo

        String[] hostPortParts = hostPort.split(":");
        String host = hostPortParts[0];     // localhost
        String port = hostPortParts[1];     // 5432

        this.setSource(String.format(
            "dbname='%s' host='%s' port=%s table=\"%s\" (geom)",
            dbName, host, port, this.table
        ));
    }

}
