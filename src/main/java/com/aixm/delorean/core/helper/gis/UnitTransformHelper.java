package com.aixm.delorean.core.helper.gis;

import java.util.HashMap;
import java.util.Map;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;



public class UnitTransformHelper {
    private static final Map<String, Double> DISTANCE_UNIT_CONVERSION = new HashMap<String, Double>() {{
        put("nmi_i", 1852.0);
        put("NM", 1852.0);
        put("KM", 1000.0);
        put("M", 1.0);
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
            ConsoleLogger.log(LogLevel.FATAL, "unsupported distance unit: " + unit, new Exception().getStackTrace()[0]);
            throw new RuntimeException("Unsupported distance unit: " + unit);
        }
    }

    public static Double convertAngleToRadians(Double value, String unit) {
        if (ANGLE_UNIT_CONVERSION.containsKey(unit)) {
            return value * ANGLE_UNIT_CONVERSION.get(unit);
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "unsupported angle unit: " + unit, new Exception().getStackTrace()[0]);
            throw new RuntimeException("Unsupported angle unit: " + unit);
        }
    }

    public static Double convertAngleToBearingInRadians(Double angle, String unit, String srs) {
        if (ANGLE_UNIT_CONVERSION.containsKey(unit)) {
            if (srs.equals("urn:ogc:def:crs:OGC:1.3:CRS84")) {
                return 2 * Math.PI - (angle * ANGLE_UNIT_CONVERSION.get(unit)) + Math.PI / 2;
            } else if (srs.equals("urn:ogc:def:crs:EPSG::4326")) {
                return angle * ANGLE_UNIT_CONVERSION.get(unit);
            } else {
                return angle * ANGLE_UNIT_CONVERSION.get(unit);
            }
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "unsupported angle unit: " + unit, new Exception().getStackTrace()[0]);
            throw new RuntimeException("Unknown angle unit: " + unit);
        }
    }
}