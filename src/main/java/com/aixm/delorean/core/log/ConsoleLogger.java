package com.aixm.delorean.core.log;

public class ConsoleLogger implements Logger {
    private LogLevel currentLevel;

    public ConsoleLogger(LogLevel level) {
        this.currentLevel = level;
    }

    @Override
    public void log(LogLevel level, String message) {
        if (level.ordinal() >= currentLevel.ordinal()) {
            System.out.println(formatMessage(level, message));
        }
    }

    @Override
    public void log(LogLevel level, String message, Throwable throwable) {
        if (level.ordinal() >= currentLevel.ordinal()) {
            System.out.println(formatMessage(level, message));
            throwable.printStackTrace(System.out);
        }
    }

    private String formatMessage(LogLevel level, String message) {
        return String.format("[%s] %s", level, message);
    }

    public void setLevel(LogLevel level) {
        this.currentLevel = level;
    }
}
