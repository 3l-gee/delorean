package com.aixm.delorean.core.helper.gis;

import java.util.List;

import org.locationtech.jts.geom.Coordinate;
import java.util.LinkedHashMap;

import com.aixm.delorean.core.exception.gis.MalformedGeometryException;

public class GeometryValidationHelper {

    private static GeometryValidationHelper instance;

    private GeometryValidationHelper() {
    }

    public static void validGeometryPoint(Coordinate Coordinate) throws IllegalArgumentException, MalformedGeometryException {
        if (Coordinate.x == Double.NaN || Coordinate.y == Double.NaN || Coordinate.z == Double.NaN) {
                throw new IllegalArgumentException("Illegal value of null in coordinate");
        }
    }

    public static void validGeometryPoint(List<Double> Coordinate) throws IllegalArgumentException, MalformedGeometryException {
        if (Coordinate.size() == 2) {
            Double x = Coordinate.get(0);
            Double y = Coordinate.get(1);
            if (x == null || y == null) {
                throw new IllegalArgumentException("Illegal value of null in coordinate");
            }
        } else if (Coordinate.size() == 3) {
            Double x = Coordinate.get(0);
            Double y = Coordinate.get(1);
            Double z = Coordinate.get(2);
            if (x == null || y == null || z == null) {
                throw new IllegalArgumentException("Illegal value of null in coordinate");
            }
        } else {
            throw new IllegalArgumentException("Illegal Size of coordinate : " + Coordinate.size());
        }
    }

    public static void validGeometryLine(List<Coordinate> Coordinates) throws IllegalArgumentException, MalformedGeometryException {
        for (int i = 1 ; i < Coordinates.size() ; i++) {
            if (Coordinates.get(i).getX() == Coordinates.get(i-1).getX() && Coordinates.get(i).getY() == Coordinates.get(i-1).getY()) {
                throw new MalformedGeometryException("Malformed Linestring with identical start and end points are ignored.");
            }

            if (Coordinates.get(i).getX() == Double.NaN || Coordinates.get(i).getY() == Double.NaN) {
                throw new IllegalArgumentException("Illegal value of NaN / null in Linestring.");
            }
        }
    }

    public static void validGeometryLine(LinkedHashMap<Integer, Coordinate> Coordinates) throws IllegalArgumentException, MalformedGeometryException {
        for (int i = 1 ; i < Coordinates.size() ; i++) {
            if (Coordinates.get(i).getX() == Coordinates.get(i-1).getX() && Coordinates.get(i).getY() == Coordinates.get(i-1).getY()) {
                throw new MalformedGeometryException("Malformed Linestring with identical start and end points are ignored.");
            }

            if (Coordinates.get(i).getX() == Double.NaN || Coordinates.get(i).getY() == Double.NaN) {
                throw new IllegalArgumentException("Illegal value of NaN / null in Linestring.");
            }
        }
    }
}