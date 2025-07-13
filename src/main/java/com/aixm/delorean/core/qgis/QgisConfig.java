package com.aixm.delorean.core.qgis;

import com.aixm.delorean.core.database.DatabaseConfig;
import com.aixm.delorean.core.qgis.PostgresLayerConfig;

import java.util.List;

public enum QgisConfig {
    
    A5_1(
        "a5_1",
        new ProjectConfig(
            "a5_1/qgis/publisher.qgs.ftl",
            "a5_1/qgis/8753078a_styles.db",
            "delorean aixm 5.1 - publisher",
            List.of(new PostgresLayerConfig(
                "OpenStreetMap",
                ""
                ))
        ),
        new ProjectConfig(
            null,
            null,
            null,
            List.of(new PostgresLayerConfig(
                "OpenStreetMap",
                ""
                ))
        )
    );

    private final String name;
    private final ProjectConfig publishConfig;
    private final ProjectConfig editConfig;
    QgisConfig(String name, ProjectConfig publishCFG, ProjectConfig editCFG){
        this.name = name;
        this.publishConfig = publishCFG;
        this.editConfig = editCFG;
    }

    public static QgisConfig fromString(String version) {
        for (QgisConfig Schema : QgisConfig.values()) {
            if (Schema.getName().equals(version)) {
                return Schema;
            }
        }
        throw new IllegalArgumentException(
            "Unsupported QGIS config named: " + version +
            ". Supported config are: " + getSupportedNames()
        );
    }

    private static String getSupportedNames() {
        StringBuilder sb = new StringBuilder("[ ");
        for (QgisConfig config : QgisConfig.values()) {
            sb.append(config.getName()).append(", ");
        }
        if (sb.length() > 2) {
            sb.setLength(sb.length() - 2);
        }
        sb.append(" ]");
        return sb.toString();
    }

    public String getName() {
        return name;
    }

    public ProjectConfig getPublishConfig() {
        return publishConfig;
    }

    public ProjectConfig getEditConfig() {
        return editConfig;
    }

}
