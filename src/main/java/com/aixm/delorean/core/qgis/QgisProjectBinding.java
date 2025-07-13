package com.aixm.delorean.core.qgis;

import java.io.ByteArrayOutputStream;
import java.io.Console;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.aixm.delorean.core.database.DatabaseBinding;
import com.aixm.delorean.core.database.DatabaseConfig;
import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;

import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.TemplateNotFoundException;
import freemarker.template.TemplateException;
import freemarker.core.ParseException;
import freemarker.template.Version;

public class QgisProjectBinding {
    private ProjectConfig projectConfig; 
    private Configuration cfg;
    private Template template;
    private Map<String, Object> input;
    private byte[] projectZip;

    public QgisProjectBinding(ProjectConfig prjConfig){
        this.projectConfig = prjConfig;
        this.cfg = new Configuration(new Version(2, 3, 34));
        this.cfg.setDefaultEncoding("UTF-8");
        this.cfg.setLocale(Locale.US);
        this.cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        this.cfg.setClassLoaderForTemplateLoading(getClass().getClassLoader(), "");
        this.input = new HashMap<String, Object>();
    }

    public byte[] getProject() {
          return this.projectZip;
    }


    public void init(DatabaseBinding databaseBinding) {
        this.loadTemplate();
        this.projectConfig.generateSource(databaseBinding);
        this.putInput(this.projectConfig);
        this.projectZip = this.processTemplate();
    }

    public void loadProject(Session session, String user){
        Transaction transaction = null;

        try {
            transaction = session.beginTransaction();

            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSSSSS");
            String formattedNow = now.format(formatter);

            String metadata = "{\n" +
                "  \"last_modified_time\": \"" + formattedNow + "\",\n" +
                "  \"last_modified_user\": \"" + user + "\"\n" +
                "}";

            session.createNativeMutationQuery("""
                INSERT INTO qgis.qgis_projects
                VALUES (:name, CAST(:metadata AS jsonb), :content)
            """)
            .setParameter("name", this.projectConfig.getTitle())
            .setParameter("metadata", metadata)
            .setParameter("content", this.projectZip)
            .executeUpdate();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void loadTemplate() {
        try {
            this.template = this.cfg.getTemplate(this.projectConfig.getTemplatePath());
        } catch (TemplateNotFoundException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Template not found: " + this.projectConfig.getTemplatePath(), e);
        } catch (MalformedTemplateNameException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Malformed template name: " + this.projectConfig.getTemplatePath(), e);
        } catch (ParseException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Failed to parse template: " + this.projectConfig.getTemplatePath(), e);
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while loading template: " + this.projectConfig.getTemplatePath(), e);
        }
    }

    private void putInput(ProjectConfig config){
        this.input.put("ProjectConfig", config);
    };

    public String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    // public static byte[] hexToBytes(String hex) {
    //     int len = hex.length();
    //     byte[] data = new byte[len / 2];
    //     for (int i = 0; i < len; i += 2) {
    //         data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
    //                             + Character.digit(hex.charAt(i+1), 16));
    //     }
    //     return data;
    // }

    private byte[] readBinaryResource(String resourcePath) throws IOException {
        try (InputStream is = getClass().getClassLoader().getResourceAsStream(resourcePath)) {
            if (is == null) {
                throw new FileNotFoundException("Resource not found: " + resourcePath);
            }
            return is.readAllBytes();
        }
    }

    private void zipObject(ZipOutputStream zipOut, String name, byte[] content) throws IOException {
        ZipEntry entry = new ZipEntry(name);
        zipOut.putNextEntry(entry);
        zipOut.write(content);
        zipOut.closeEntry();
    }

    private byte[] processTemplate() {
        // 1. Process template into a string
        StringWriter stringWriter = new StringWriter();
        try {
            this.template.process(this.input, stringWriter);
        } catch (TemplateException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Runtime exception while processing template: " + this.projectConfig.getTemplatePath() + " with values from: " + this.input.getClass(), e);
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while processing template: " + this.projectConfig.getTemplatePath() + " with values from: " + this.input.getClass(), e);
        }

        byte[] qgsBytes = stringWriter.toString().getBytes(StandardCharsets.UTF_8);

        // Prepare output zip
        ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
        ZipOutputStream zipOut = new ZipOutputStream(byteOut);

        // Add .qgs
        try {
            zipObject(zipOut, "delorean.qgs", qgsBytes);
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while processing template delorean.qgs", e);
        }

        // Add .db  
        try {
            byte[] dbBytes = readBinaryResource(this.projectConfig.getSqlitePath());
            zipObject(zipOut, "8753078a_styles.db", dbBytes);
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while processing template 8753078a_styles.db", e);
        }


        try {
            zipOut.close();
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while closing zip: ", e);
        }
        
        return byteOut.toByteArray();
    }
}
    