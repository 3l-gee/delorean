package com.aixm.delorean.core.log;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class FileLogger implements Logger {
    private LogLevel currentLevel;
    private PrintWriter writer;

    public FileLogger(LogLevel level, String filePath) throws IOException {
        this.currentLevel = level;
        this.writer = new PrintWriter(new FileWriter(filePath, true));
    }

    @Override
    public void log(LogLevel level, String message) {
        if (level.ordinal() >= currentLevel.ordinal()) {
            writer.println(formatMessage(level, message));
            writer.flush();
        }
    }

    @Override
    public void log(LogLevel level, String message, Throwable throwable) {
        if (level.ordinal() >= currentLevel.ordinal()) {
            writer.println(formatMessage(level, message));
            throwable.printStackTrace(writer);
            writer.flush();
        }
    }

    private String formatMessage(LogLevel level, String message) {
        return String.format("[%s] %s", level, message);
    }

    public void setLevel(LogLevel level) {
        this.currentLevel = level;
    }

    public void close() {
        writer.close();
    }
}


