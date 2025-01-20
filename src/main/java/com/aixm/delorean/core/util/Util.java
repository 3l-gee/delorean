package com.aixm.delorean.core.util;
import java.util.HashMap;
import java.util.UUID;
import java.util.Map;


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
    public static Map<String, String> parseToMap(String input) {
        // Extract the substring containing the key-value pairs
        int startIndex = input.indexOf('{');
        int endIndex = input.lastIndexOf('}');
        if (startIndex == -1 || endIndex == -1 || startIndex >= endIndex) {
            return new HashMap<>();
        }

        String keyValueString = input.substring(startIndex + 1, endIndex);

        // Split the key-value pairs
        String[] pairs = keyValueString.split(",");
        Map<String, String> map = new HashMap<>();

        for (String pair : pairs) {
            String[] keyValue = pair.split(":", 2); // Split into key and value
            if (keyValue.length == 2) {
                String key = keyValue[0].trim();
                String value = keyValue[1].trim();
                map.put(key, value);
            } else {
                throw new IllegalArgumentException("Invalid key-value pair: " + pair);
            }
        }

        return map;
    }
}
