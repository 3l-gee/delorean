package com.aixm.delorean.core.xml;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;

public enum XMLConfig {

    AIXM_5_1_1(
        "a5_1_1", 
        "a5_1_1/aixm-5.1.1/AIXM_AbstractGML_ObjectTypes.xsd",
        "a5_1_1"
    ),
    AIXM_5_1(
        "a5_1", 
        "a5_1/message/AIXM_BasicMessage.xsd",
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
        File tempDir = generateFile(root);
        this.schema = loadSchema(root, xsd);
    }

    public String getVersion() {
        return version;
    }
        
    public Schema getSchema() {
        return schema;
    }

public File generateFile(String xsdRoot) {
        try {
            ClassLoader classLoader = getClass().getClassLoader();
            URL rootUrl = classLoader.getResource(xsdRoot);

            if (rootUrl == null) {
                throw new RuntimeException("Root directory not found: " + xsdRoot);
            }

            File tempDir = Files.createTempDirectory("temp_schema_root" + xsdRoot.hashCode()).toFile();
            // tempDir.deleteOnExit();

            Path rootPath = Paths.get(rootUrl.toURI());
            Files.walk(rootPath).forEach(sourcePath -> {
                try {
                    Path relativePath = rootPath.relativize(sourcePath);
                    File tempFileOrDir = new File(tempDir, relativePath.toString());

                    if (Files.isDirectory(sourcePath)) {
                        tempFileOrDir.mkdirs();
                    } else if (Files.isRegularFile(sourcePath)) {
                        tempFileOrDir.getParentFile().mkdirs();
                        try (InputStream inputStream = Files.newInputStream(sourcePath);
                             OutputStream outputStream = new FileOutputStream(tempFileOrDir)) {
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                        }
                        // tempFileOrDir.deleteOnExit();
                    }
                } catch (Exception e) {
                    throw new RuntimeException("Failed to process file: " + sourcePath, e);
                }
            });

            return tempDir;

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to generate temporary directory structure", e);
        }
    }

    private Schema loadSchema(String xsdRoot, String xsdPath) {
        try {
            ClassLoader classLoader = getClass().getClassLoader();
            InputStream xsdStream = classLoader.getResourceAsStream(xsdPath);
            
            if (xsdStream == null) {
                throw new RuntimeException("Resource not found: " + xsdPath);
            }
            
            File tempFile = createTempFileFromStream(xsdStream, xsdPath);
            Schema xsdSchema = this.schemaFactory.newSchema(tempFile);

            return xsdSchema;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load schema: " + xsdPath, e);
        }
    }

    private File createTempFileFromStream(InputStream xsdStream, String xsdPath) throws IOException {
        File tempFile = File.createTempFile("schema_", xsdPath.hashCode() + ".xsd");
        try (FileOutputStream out = new FileOutputStream(tempFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = xsdStream.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
        // tempFile.deleteOnExit(); // Ensure the file is deleted on exit
        return tempFile;
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
