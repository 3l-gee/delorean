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
            throw new IllegalArgumentException("DirectPositionType is null");
        }

        String srsName = value.getSrsName();

        if (srsName == null) {
            throw new IllegalArgumentException("srsName is null");
        }

        // BigInteger srsDiemnesion = value.getSrsDimension();
        Coordinate coordinate = parseDirectPosition(pos);
        if (coordinate == null) {
            throw new IllegalArgumentException("Coordinate is null");
        }

        return CoordinateTransformeHelper.transformToPoint(srsName, "urn:ogc:def:crs:EPSG::4326", coordinate);
    }

    public static Coordinate parseDirectPosition (DirectPositionType value) {
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
                throw new IllegalArgumentException("Coordinate values cannot be null");
            }
            return new Coordinate(x, y);
        } else if (coordinatesList.size() == 3) {
            Double x = coordinatesList.get(0);
            Double y = coordinatesList.get(1);
            Double z = coordinatesList.get(2);
            if (x == null || y == null || z == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null");
            }
            return new Coordinate(x, y, z);
        } else {
            throw new IllegalArgumentException("list<Double> value is not 2 or 3");
        }
    }
}
