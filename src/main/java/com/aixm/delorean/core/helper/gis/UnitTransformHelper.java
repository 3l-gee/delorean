package com.aixm.delorean.core.helper.gis;

import java.util.HashMap;
import java.util.Map;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;



public class UnitTransformHelper {
    private static final Map<String, Double> DISTANCE_UNIT_CONVERSION = new HashMap<String, Double>() {{
        put("[nmi_i]", 1852.0);
        put("NM", 1852.0);
        put("nm", 1852.0);
        put("KM", 1000.0);
        put("km", 1000.0);
        put("M", 1.0);
        put("m", 1.0);
        put("MI", 1609.34);
        put("FT", 0.3048);
    }};

    private static final Map<String, Double> ANGLE_UNIT_CONVERSION = new HashMap<String, Double>() {{
        put("deg", Math.PI / 180.0);
        put("rad", 1.0);
    }};

    public static Double convertDistanceToMeters(Double value, String unit) {
        if (DISTANCE_UNIT_CONVERSION.containsKey(unit)) {
            return value * DISTANCE_UNIT_CONVERSION.get(unit);
        } else {
            throw new RuntimeException("Unsupported distance unit: " + unit);
        }
    }

    public static Double convertAngle (Double value, String source, String target) {
        if (ANGLE_UNIT_CONVERSION.containsKey(source) && ANGLE_UNIT_CONVERSION.containsKey(target)) {
            return value * ANGLE_UNIT_CONVERSION.get(source) / ANGLE_UNIT_CONVERSION.get(target);
        } else {
            throw new RuntimeException("Unsupported angle unit: " + source + " or " + target);
        }
    }

    public static Double convertAngleToBearing(Double value, String source, String target, String srs) {
        if (ANGLE_UNIT_CONVERSION.containsKey(source) && ANGLE_UNIT_CONVERSION.containsKey(target)) {
            if (srs.equals("urn:ogc:def:crs:OGC:1.3:CRS84")) {
                return (2 * Math.PI - (value * ANGLE_UNIT_CONVERSION.get(source)) + Math.PI / 2) / ANGLE_UNIT_CONVERSION.get(target);
            } else if (srs.equals("urn:ogc:def:crs:EPSG::4326")) {
                return value * ANGLE_UNIT_CONVERSION.get(source) / ANGLE_UNIT_CONVERSION.get(target);
            } else {
                return value * ANGLE_UNIT_CONVERSION.get(source) / ANGLE_UNIT_CONVERSION.get(target);
            }
        } else {
            throw new RuntimeException("Unknown angle unit: " + source + " or " + target);
        }
    }
}