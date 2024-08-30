package com.aixm.delorean.core.log;

public interface Logger {
    void log(LogLevel level, String message);
    void log(LogLevel level, String message, Throwable throwable);
}
