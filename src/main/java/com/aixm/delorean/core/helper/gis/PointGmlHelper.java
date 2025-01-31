package com.aixm.delorean.core.helper.gis;

import java.lang.IllegalArgumentException;
import java.util.List;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.org.gml.v_3_2.DirectPositionType;
import com.aixm.delorean.core.org.gml.v_3_2.PointType;

import com.aixm.delorean.core.exception.gis.MalformedGeometryException;

public class PointGmlHelper {
    
    //Point
    public static Point parseGMLPoint (PointType value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        if (value == null) {
            ConsoleLogger.log(LogLevel.WARN, "parseGMLPoint is null", new Exception().getStackTrace()[0]);
            return null;
        }
        
        DirectPositionType pos = value.getPos();
        if (pos == null) {
            ConsoleLogger.log(LogLevel.WARN, "DirectPositionType is null", new Exception().getStackTrace()[0]);
            return null;
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            ConsoleLogger.log(LogLevel.WARN, "srsName is null, Asummed 4326 ()", new Exception().getStackTrace()[0]);
            srsName = "urn:ogc:def:crs:EPSG::4326";
        }
        try {
            return parseDirectPosition(pos, srsName);
        } catch (IllegalArgumentException e) {
            ConsoleLogger.log(LogLevel.FATAL, "parseDirectPosition encoutered a Illegal Argument Input at id : " + value.getXmlId(), e.getStackTrace()[0]);
            return null;       
        } catch (Exception e) {
            ConsoleLogger.log(LogLevel.FATAL, "parseDirectPosition encoutered an ??? id : " + value.getXmlId(), e);
            return null;
        }
    }

    public static Point parseDirectPosition (DirectPositionType value, String srsName) throws IllegalArgumentException, MalformedGeometryException {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        if (value == null) {
            throw new IllegalArgumentException("DirectPositionType is null");
        }

        String actualSrsName = value.getSrsName() != null ? value.getSrsName() : srsName;
        List<Double> coordinatesList = value.getValue();

        if (coordinatesList == null || coordinatesList.isEmpty()) {
            throw new IllegalArgumentException("list<Double> value is null or empty");
        }

        if (coordinatesList.size() == 2) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            if (x == null || y == null) {
                throw new IllegalArgumentException("x or y (in 2d config) is null");
            }
            return CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", new Coordinate(x, y));
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                throw new IllegalArgumentException("x or y or z (in 3d config) is null");
            }
            return CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", new Coordinate(x, y, z));
        } else {
            throw new IllegalArgumentException("list<Double> value is not 2 or 3");
        }
    }

    public static DirectPositionType printDirectPosition (Point value){
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        DirectPositionType pos = new DirectPositionType();
        if (value == null) {
            return pos;

        } else if (value.getX() == Double.NaN || value.getY() == Double.NaN) {
            return pos;

        } else {
            pos.getValue().add(value.getY());
            pos.getValue().add(value.getX());

        }
        
        return pos;
    }

    public static Coordinate parseDirectPositionToCoordinate (DirectPositionType value) throws IllegalArgumentException,MalformedGeometryException {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        if (value == null) {
            throw new IllegalArgumentException("DirectPositionType is null");
        }

        List<Double> coordinatesList = value.getValue();

        if (coordinatesList == null || coordinatesList.isEmpty()) {
            throw new IllegalArgumentException("list<Double> value is null or empty");
        }

        if (coordinatesList.size() == 2) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            if (x == null || y == null) {
                throw new IllegalArgumentException("x or y (in 2d config) is null");
            }
            return  new Coordinate(x, y);
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                throw new IllegalArgumentException("x or y or z (in 3d config) is null");
            }
            return new Coordinate(x, y, z);
        } else {
            throw new IllegalArgumentException("list<Double> value is not 2 or 3");
        }
    }

    public static DirectPositionType printCoordinateToDirectPosition (Coordinate value){
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        DirectPositionType pos = new DirectPositionType();
        if (value == null) {
            return pos;

        } else if (value.getX() == Double.NaN || value.getY() == Double.NaN) {
            return pos;

        } else {
            pos.getValue().add(value.getY());
            pos.getValue().add(value.getX());

        }

        return pos;
    }
}
