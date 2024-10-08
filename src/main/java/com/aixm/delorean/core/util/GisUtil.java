package com.aixm.delorean.core.util;

import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateTransformFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.CoordinateTransform;
import org.locationtech.proj4j.ProjCoordinate;

import java.util.ArrayList;
import java.util.List;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Polygon;

public class GisUtil {

    private static CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();
    private static CRSFactory crsFactory = new CRSFactory();
    private static GeometryFactory geometryFactory = new GeometryFactory();

    private static CoordinateTransform createCoordinateTransform(String sourceCRS, String targetCRS) {
        if (!isValidCRS(sourceCRS)) {
            throw new IllegalArgumentException("Invalid source CRS: " + sourceCRS);
        }

        if (!isValidCRS(targetCRS)) {
            throw new IllegalArgumentException("Invalid target CRS: " + targetCRS);
        }

        CoordinateReferenceSystem srcCrs = crsFactory.createFromName(sourceCRS);
        CoordinateReferenceSystem tgtCrs = crsFactory.createFromName(targetCRS);
        return ctFactory.createTransform(srcCrs, tgtCrs);
    }

    private static boolean isValidCRS(String crs) {
            try {
                crsFactory.createFromName(crs);
                return true;
            } catch (Exception e) {
                return false;
            }
        }

    private static Coordinate transformCoordinates(Coordinate value, CoordinateTransform transform) {
        ProjCoordinate srcCoord = new ProjCoordinate(value.getX(), value.getY());
        ProjCoordinate tgtCoord = new ProjCoordinate();
        transform.transform(srcCoord, tgtCoord);

        // Return transformed coordinate
        Coordinate coordinate = new Coordinate(tgtCoord.x, tgtCoord.y);

        return coordinate;
    }

    public static Point transformCRS(Point value, String sourceCRS, String targetCRS) {
        CoordinateTransform transform = createCoordinateTransform(sourceCRS, targetCRS);

        Point point = geometryFactory.createPoint(transformCoordinates(value.getCoordinate(), transform));

        return point;
    }

    public static LineString transformCRS(LineString value, String sourceCRS, String targetCRS) {
        CoordinateTransform transform = createCoordinateTransform(sourceCRS, targetCRS);

        List<Coordinate> transformedCoordinates = new ArrayList<>();
        for (Coordinate coordinate : value.getCoordinates()) {
            transformedCoordinates.add(transformCoordinates(coordinate, transform));
        }
    
        Coordinate[] transformedArray = transformedCoordinates.toArray(new Coordinate[0]);
    
        return geometryFactory.createLineString(transformedArray);
    }

    public static Polygon transformCRS(Polygon value, String sourceCRS, String targetCRS) {
        return null;
    }
}
