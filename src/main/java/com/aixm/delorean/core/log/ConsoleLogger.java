package com.aixm.delorean.core.log;

public class ConsoleLogger implements Logger {
    private static ConsoleLogger instance;
    private LogLevel currentLevel;

    // Define ANSI color codes
    private static final String RESET = "\u001B[0m";
    private static final String RED = "\u001B[31m";
    private static final String YELLOW = "\u001B[33m";
    private static final String GREEN = "\u001B[32m";
    private static final String CYAN = "\u001B[36m";

    // Method to get the color based on the log level
    private String getColor(LogLevel level) {
        switch (level) {
            case ERROR:
                return RED;
            case WARN:
                return YELLOW;
            case INFO:
                return GREEN;
            case DEBUG:
                return CYAN;
            default:
                return RESET;
        }
    }

    // Private constructor to prevent external instantiation
    private ConsoleLogger(LogLevel level) {
        this.currentLevel = level;
    }

    // Thread-safe Singleton initialization
    public static synchronized ConsoleLogger getInstance() {
        if (instance == null) {
            instance = new ConsoleLogger(LogLevel.INFO); // Default log level
        }
        return instance;
    }

    // Static method to set the global log level
    public static void setGlobalLogLevel(LogLevel level) {
        getInstance().setLevel(level);
    }

    // Instance method to log a message at the specified level (implements Logger interface)
    @Override
    public void logOverride(LogLevel level, String message) {
        if (level.ordinal() >= currentLevel.ordinal()) {
            System.out.println(formatMessage(level, message));
        }
    }

    // Instance method to log a message along with an exception (implements Logger interface)
    @Override
    public void logOverride(LogLevel level, String message, Throwable throwable) {
        if (level.ordinal() >= currentLevel.ordinal()) {
            System.out.println(formatMessage(level, message));
            throwable.printStackTrace(System.out);
        }
    }

        // Instance method to log a message along with an exception (implements Logger interface)
    @Override
    public void logOverride(LogLevel level, String message, StackTraceElement element) {
        if (level.ordinal() >= currentLevel.ordinal()) {
            System.out.println(formatMessage(level, message, element));
        }
    }

    // Static method to log a message at the specified level (directly calls the instance method)
    public static void log(LogLevel level, String message) {
        ConsoleLogger logger = getInstance();
        logger.logOverride(level, message);  // Delegates to instance method
    }

    // Static method to log a message along with an exception (directly calls the instance method)
    public static void log(LogLevel level, String message, Throwable throwable) {
        ConsoleLogger logger = getInstance();
        logger.logOverride(level, message, throwable);  // Delegates to instance method
    }

    // Static method to log a message along with an exception (directly calls the instance method)
    public static void log(LogLevel level, String message, StackTraceElement element) {
        ConsoleLogger logger = getInstance();
        logger.logOverride(level, message, element);  // Delegates to instance method
    }

    // Method to format the log message
    private String formatMessage(LogLevel level, String message) {
        return String.format("[%s] %s", level, message);
    }

    // Method to format the log message
    private String formatMessage(LogLevel level, String message, StackTraceElement element) {
        return String.format("[%s] %s : %s", level, element, message);
    }

    // Set the log level dynamically if needed
    private void setLevel(LogLevel level) {
        this.currentLevel = level;
    }
}
