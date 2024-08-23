package com.aixm.delorean.core.util;
import java.util.UUID;

public final class Util {
    private Util() {
        // Private constructor to prevent instantiation
    }

    public static String generateId() {
        return generateShortId().toString();
    }

    public static String generateShortId() {
        return UUID.randomUUID().toString().substring(0, 6);
    }

    //Input : "{"url":"jdbc:postgresql://localhost:5432/delorean", "username":"postgres", "password":"postgres"}"
}
