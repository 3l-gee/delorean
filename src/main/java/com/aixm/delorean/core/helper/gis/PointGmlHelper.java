package com.aixm.delorean.core.helper.gis;

import java.util.List;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType;


public class PointGmlHelper {
    
    //Point
    public static Point parseGMLPoint (PointType value){
        if (value == null) {
            return null;
        }
        
        DirectPositionType pos = value.getPos();
        if (pos == null) {
            throw new IllegalArgumentException("DirectPositionType is null" + value.getClass().getName());
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            throw new IllegalArgumentException("srsName is null" + value.getClass().getName());
        }

        // BigInteger srsDiemnesion = value.getSrsDimension();
        return parseDirectPosition(pos, srsName);        
    }

    public static Point parseDirectPosition (DirectPositionType value, String srsName){
        if (value == null) {
            throw new IllegalArgumentException("DirectPositionType is null" + value.getClass().getName());
        }

        String actualSrsName = value.getSrsName() != null ? value.getSrsName() : srsName;
        List<Double> coordinatesList = value.getValue();

        if (coordinatesList == null || coordinatesList.isEmpty()) {
            throw new IllegalArgumentException("list<Double> value is null or empty" + value.getClass().getName());
        }

        if (coordinatesList.size() == 2) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            if (x == null || y == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
            }
            return CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", new Coordinate(x, y));
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
            }
            return CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", new Coordinate(x, y, z));
        } else {
            throw new IllegalArgumentException("list<Double> value is not 2 or 3" + value.getClass().getName());
        }
    }

    public static Coordinate parseDirectPositionToCoordinate (DirectPositionType value){
        if (value == null) {
            throw new IllegalArgumentException("DirectPositionType is null" + value.getClass().getName());
        }

        List<Double> coordinatesList = value.getValue();

        if (coordinatesList == null || coordinatesList.isEmpty()) {
            throw new IllegalArgumentException("list<Double> value is null or empty" + value.getClass().getName());
        }

        if (coordinatesList.size() == 2) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            if (x == null || y == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
            }
            return  new Coordinate(x, y);
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
            }
            return  new Coordinate(x, y, z);
        } else {
            throw new IllegalArgumentException("list<Double> value is not 2 or 3" + value.getClass().getName());
        }
    }
}
