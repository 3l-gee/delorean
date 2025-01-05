package com.aixm.delorean.core.log;

public interface Logger {
    void logOverride(LogLevel level, String message);
    void logOverride(LogLevel level, String message, Throwable throwable);
    void logOverride(LogLevel level, String message, StackTraceElement element);
}
