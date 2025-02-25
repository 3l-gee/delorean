package com.aixm.delorean.core.xml;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.net.URL;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Collections;
import java.util.Comparator;

public enum XMLConfig {

    AIXM_5_1_1(
        "a5_1_1", 
        "aixm-5.1.1/AIXM_AbstractGML_ObjectTypes.xsd",
        "a5_1_1"
    ),
    AIXM_5_1(
        "a5_1", 
        "message/AIXM_BasicMessage.xsd",
        "a5_1"
    );

    private final String version;
    private final String root;
    private final String xsd;
    private final Schema schema;
    private final SchemaFactory schemaFactory;

    private XMLConfig(String version, String root, String xsd) {
        this.version = version; 
        this.root = root;
        this.xsd = xsd;
        this.schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        Path tempPath = generateFile(xsd);
        this.schema = loadSchema(tempPath, root);
    }

    public String getVersion() {
        return version;
    }
        
    public Schema getSchema() {
        return schema;
    }

    public Path generateFile(String path) {
        try {
            ClassLoader classLoader = getClass().getClassLoader();
            URL url = classLoader.getResource(path);

            if (url == null) {
                ConsoleLogger.log(LogLevel.FATAL,"Resource not found: " + path, new Exception().getStackTrace()[0]);
                throw new RuntimeException("Resource not found: " + path);
            }

            File tempDir = Files.createTempDirectory("delorean_" + path.hashCode()).toFile();

            // Ensure tempDir is deleted when JVM exits
            tempDir.deleteOnExit();

            if ("jar".equalsIgnoreCase(url.getProtocol())) {
                URI jarUri = URI.create(url.toString().split("!")[0]);

                try (FileSystem xsdFileSystem = FileSystems.newFileSystem(jarUri, Collections.emptyMap())) {
                    Path sourcePath = xsdFileSystem.getPath(path);
                    Files.walk(sourcePath).forEach(source -> {
                        try {
                            Path destination = tempDir.toPath().resolve(sourcePath.relativize(source).toString());
                            if (Files.isDirectory(source)) {
                                Files.createDirectories(destination);
                            } else {
                                Files.copy(source, destination, StandardCopyOption.REPLACE_EXISTING);
                            }
                        } catch (IOException e) {
                            ConsoleLogger.log(LogLevel.FATAL,"Resource not found: " + path, new Exception().getStackTrace()[0]);
                            throw new RuntimeException("Failed to copy file: " + source, e);
                        }
                    });
                }
            } else {
                Path sourcePath = Paths.get(url.toURI());
                Files.walk(sourcePath).forEach(source -> {
                    try {
                        Path destination = tempDir.toPath().resolve(sourcePath.relativize(source).toString());
                        if (Files.isDirectory(source)) {
                            Files.createDirectories(destination);
                        } else {
                            Files.copy(source, destination, StandardCopyOption.REPLACE_EXISTING);
                        }
                    } catch (IOException e) {
                        throw new RuntimeException("Failed to copy file: " + source, e);
                    }
                });
            }

            ConsoleLogger.log(LogLevel.DEBUG,"copied XSD to : " + path, new Exception().getStackTrace()[0]);
            return tempDir.toPath();

        } catch (Exception e) {
            ConsoleLogger.log(LogLevel.FATAL,"Failed to generate temporary directory structure", new Exception().getStackTrace()[0]);
            throw new RuntimeException("Failed to generate temporary directory structure", e);
        }
    }

    private Schema loadSchema(Path path, String root) {
        try {
          
            String xsdPath = path.resolve(root).toString();
            Schema schema = this.schemaFactory.newSchema(new File(xsdPath));
            
            return schema;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load schema: " + path + "///" + root, e);
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
