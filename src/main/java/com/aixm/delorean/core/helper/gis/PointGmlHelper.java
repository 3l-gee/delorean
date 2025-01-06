package com.aixm.delorean.core.helper.gis;

import java.util.List;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType;


public class PointGmlHelper {
    
    //Point
    public static Point parseGMLPoint (PointType value){
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        if (value == null) {
            ConsoleLogger.log(LogLevel.WARN, "parseGMLPoint is null", new Exception().getStackTrace()[0]);
            return null;
        }
        
        DirectPositionType pos = value.getPos();
        if (pos == null) {
            ConsoleLogger.log(LogLevel.FATAL, "DirectPositionType is null", new Exception());
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            ConsoleLogger.log(LogLevel.FATAL, "srsName is null", new Exception());
        }

        // BigInteger srsDiemnesion = value.getSrsDimension();
        return parseDirectPosition(pos, srsName);        
    }

    public static Point parseDirectPosition (DirectPositionType value, String srsName){
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        if (value == null) {
            ConsoleLogger.log(LogLevel.FATAL, "DirectPositionType is null", new Exception());
        }

        String actualSrsName = value.getSrsName() != null ? value.getSrsName() : srsName;
        List<Double> coordinatesList = value.getValue();

        if (coordinatesList == null || coordinatesList.isEmpty()) {
            ConsoleLogger.log(LogLevel.FATAL, "list<Double> value is null or empty", new Exception());
        }

        if (coordinatesList.size() == 2) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            if (x == null || y == null) {
                ConsoleLogger.log(LogLevel.FATAL, "x or y (in 2d config) is null", new Exception());
            }
            return CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", new Coordinate(x, y));
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                ConsoleLogger.log(LogLevel.FATAL, "x or y or z (in 3d config) is null", new Exception());
            }
            return CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", new Coordinate(x, y, z));
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "list<Double> value is not 2 or 3", new Exception());
            return null;
        }
    }

    public static Coordinate parseDirectPositionToCoordinate (DirectPositionType value){
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        if (value == null) {
            ConsoleLogger.log(LogLevel.FATAL, "DirectPositionType is null", new Exception().getStackTrace()[0]);
            throw new RuntimeException("DirectPositionType is null");
        }

        List<Double> coordinatesList = value.getValue();

        if (coordinatesList == null || coordinatesList.isEmpty()) {
            ConsoleLogger.log(LogLevel.FATAL, "list<Double> value is null or empty", new Exception().getStackTrace()[0]);
            throw new RuntimeException("DirectPositionType is null");
        }

        if (coordinatesList.size() == 2) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            if (x == null || y == null) {
                ConsoleLogger.log(LogLevel.FATAL, "x or y (in 2d config) is null", new Exception().getStackTrace()[0]);
                throw new RuntimeException("DirectPositionType is null");
            }
            return  new Coordinate(x, y);
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                ConsoleLogger.log(LogLevel.FATAL, "x or y or z (in 3d config) is null", new Exception().getStackTrace()[0]);
                throw new RuntimeException("DirectPositionType is null");}

            return  new Coordinate(x, y, z);
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "list<Double> value is not 2 or 3", new Exception());
            throw new RuntimeException("DirectPositionType is null");
        }
    }
}
