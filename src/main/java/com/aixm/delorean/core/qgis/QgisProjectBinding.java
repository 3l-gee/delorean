package com.aixm.delorean.core.qgis;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

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
        this.cfg.setClassLoaderForTemplateLoading(getClass().getClassLoader(), "qgis");
        this.input = new HashMap<String, Object>();
    }

    public void init() {
        this.loadTemplate();
        this.putInput(this.projectConfig);
        System.out.println(this.processTemplate());
    }

    public void loadTemplate() {
        try {
            this.template = cfg.getTemplate(this.projectConfig.getPath());
        } catch (TemplateNotFoundException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Template not found: " + this.projectConfig.getPath(), e);
        } catch (MalformedTemplateNameException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Malformed template name: " + this.projectConfig.getPath(), e);
        } catch (ParseException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Failed to parse template: " + this.projectConfig.getPath(), e);
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while loading template: " + this.projectConfig.getPath(), e);
        }
    }

    public void putInput(ProjectConfig config){
        this.input.put("ProjectConfig", config);
    };

    public byte[] processTemplate() {
        // 1. Process template into a string
        StringWriter stringWriter = new StringWriter();
        try {
            this.template.process(this.input, stringWriter);
        } catch (TemplateException e) {
            ConsoleLogger.log(LogLevel.ERROR, "Runtime exception while processing template: " + this.projectConfig.getPath() + " with values from: " + this.input.getClass(), e);
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while processing template: " + this.projectConfig.getPath() + " with values from: " + this.input.getClass(), e);
        }
        String rendered = stringWriter.toString();

        // 2. Write the string to a zip archive in memory
        ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
        ZipOutputStream zipOut = new ZipOutputStream(byteOut);
        ZipEntry entry = new ZipEntry("output.txt");
        try {
            zipOut.putNextEntry(entry);
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while zipping: ", e);
        }

        try {
            zipOut.write(rendered.getBytes(StandardCharsets.UTF_8));
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while zipping: ", e);
        }

        try {
            zipOut.closeEntry();
        } catch (IOException e) {
            ConsoleLogger.log(LogLevel.ERROR, "I/O error while zipping: ", e);
        }
        
        // // 3. Return zipped byte array
        return byteOut.toByteArray();
    }
}
    