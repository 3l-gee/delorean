package com.aixm.delorean.core.helper.gis;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.PrecisionModel;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.LinearRing;
import org.locationtech.jts.geom.MultiPolygon;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.CoordinateTransform;
import org.locationtech.proj4j.CoordinateTransformFactory;
import org.locationtech.proj4j.ProjCoordinate;
import java.util.HashMap;

public class CoordinateTransformeHelper {
    //TODO should this be configurable?
    private static final PrecisionModel precisionModel = new PrecisionModel(0.001);
    private static final GeometryFactory geometryFactory = new GeometryFactory(precisionModel);
    private static final CRSFactory crsFactory = new CRSFactory();
    private static final CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();

    //AIXM-5.1_RULE-1A5E00	
    private static final Map<String, CoordinateReferenceSystem> validSrsName = Map.ofEntries(
        Map.entry("urn:ogc:def:crs:EPSG::4326", crsFactory.createFromName("EPSG:4326")),
        Map.entry("urn:ogc:def:crs:EPSG::4258", crsFactory.createFromName("EPSG:4258")),
        Map.entry("urn:ogc:def:crs:EPSG::4322", crsFactory.createFromName("EPSG:4322")),
        Map.entry("urn:ogc:def:crs:EPSG::4230", crsFactory.createFromName("EPSG:4230")),
        Map.entry("urn:ogc:def:crs:EPSG::4668", crsFactory.createFromName("EPSG:4668")),
        Map.entry("urn:ogc:def:crs:EPSG::4312", crsFactory.createFromName("EPSG:4312")),
        Map.entry("urn:ogc:def:crs:EPSG::4215", crsFactory.createFromName("EPSG:4215")),
        Map.entry("urn:ogc:def:crs:EPSG::4801", crsFactory.createFromName("EPSG:4801")),
        Map.entry("urn:ogc:def:crs:EPSG::4149", crsFactory.createFromName("EPSG:4149")),
        Map.entry("urn:ogc:def:crs:EPSG::4275", crsFactory.createFromName("EPSG:4275")),
        Map.entry("urn:ogc:def:crs:EPSG::4746", crsFactory.createFromName("EPSG:4746")),
        Map.entry("urn:ogc:def:crs:EPSG::4121", crsFactory.createFromName("EPSG:4121")),
        Map.entry("urn:ogc:def:crs:EPSG::4658", crsFactory.createFromName("EPSG:4658")),
        Map.entry("urn:ogc:def:crs:EPSG::4299", crsFactory.createFromName("EPSG:4299")),
        Map.entry("urn:ogc:def:crs:EPSG::4806", crsFactory.createFromName("EPSG:4806")),
        Map.entry("urn:ogc:def:crs:EPSG::4277", crsFactory.createFromName("EPSG:4277")),
        Map.entry("urn:ogc:def:crs:EPSG::4207", crsFactory.createFromName("EPSG:4207")),
        Map.entry("urn:ogc:def:crs:EPSG::4274", crsFactory.createFromName("EPSG:4274")),
        Map.entry("urn:ogc:def:crs:EPSG::4740", crsFactory.createFromName("EPSG:4740")),
        Map.entry("urn:ogc:def:crs:EPSG::4313", crsFactory.createFromName("EPSG:4313")),
        Map.entry("urn:ogc:def:crs:EPSG::4124", crsFactory.createFromName("EPSG:4124")),
        Map.entry("urn:ogc:def:crs:EPSG::4267", crsFactory.createFromName("EPSG:4267")),
        Map.entry("urn:ogc:def:crs:EPSG::4269", crsFactory.createFromName("EPSG:4269"))
        // Map.entry("urn:ogc:def:crs:OGC:1.3:CRS84", crsFactory.createFromName("OGC:1.3:CRS84")) // CRS84 not supported by proj4j
    );

    private Map<String, CoordinateTransform> transformMap = new HashMap<>();
   
    // Singleton instance
    private static CoordinateTransformeHelper instance;

    // Private constructor to prevent instantiation
    private CoordinateTransformeHelper() {
        // Initialization code here
    }

    // Public method to provide access to the instance
    public static synchronized CoordinateTransformeHelper getInstance() {
        if (instance == null) {
            instance = new CoordinateTransformeHelper();
        }
        return instance;
    }

    private CoordinateTransform getTransform(String sourceCRS, String targetCRS) {
        if (!validSrsName.containsKey(sourceCRS) || !validSrsName.containsKey(targetCRS)) {
            throw new IllegalArgumentException("Invalid CRS provided.");
        }
    
        String key = sourceCRS + ":" + targetCRS;
    
        transformMap.computeIfAbsent(key, k -> {
            CoordinateReferenceSystem source = validSrsName.get(sourceCRS);
            CoordinateReferenceSystem target = validSrsName.get(targetCRS);
            return ctFactory.createTransform(source, target);
        });
    
        return transformMap.get(key);
    }

    private Coordinate transform(String sourceCRS, String targetCRS, Coordinate sourceCoordinate) {
        CoordinateTransform transform = getTransform(sourceCRS, targetCRS);
        if (sourceCoordinate.getZ() == Double.NaN) {
            // GML does latitute, longitude in that order
            // Proj4j expects longitude, latitude  in that order
            ProjCoordinate source = new ProjCoordinate(sourceCoordinate.getY(), sourceCoordinate.getX());
            ProjCoordinate target = new ProjCoordinate();
            transform.transform(source, target);
            return new Coordinate(target.x, target.y);
        } else {
            // GML does latitute, longitude, altitude in that order
            // Proj4j expects longitude, latitude, altitude  in that order
            ProjCoordinate source = new ProjCoordinate(sourceCoordinate.getY(), sourceCoordinate.getX(), sourceCoordinate.getZ());
            ProjCoordinate target = new ProjCoordinate();
            transform.transform(source, target);
            return new Coordinate(target.x, target.y, target.z);
        }
    }

    private List<Coordinate> transform(String sourceCRS, String targetCRS, List<Coordinate> sourceCoordinates) {
        CoordinateTransform transform = getTransform(sourceCRS, targetCRS);
        List<Coordinate> targetCoordinates = new ArrayList<>();
        for (Coordinate sourceCoordinate : sourceCoordinates) {
            // GML does latitute, longitude, altitude in that order
            // Proj4j expects longitude, latitude, altitude  in that order
            ProjCoordinate source = new ProjCoordinate(sourceCoordinate.getY(), sourceCoordinate.getX());
            ProjCoordinate target = new ProjCoordinate();
            transform.transform(source, target);
            targetCoordinates.add(new Coordinate(target.x, target.y));
        }
        return targetCoordinates;
    }

    public static Point transformToPoint(String sourceCRS, String targetCRS, Coordinate sourceCoordinate) {
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        Coordinate targetCoordinate = instance.transform(sourceCRS, targetCRS, sourceCoordinate);
        return geometryFactory.createPoint(targetCoordinate);
    }

    public static LineString transformToLineString(String sourceCRS, String targetCRS, List<Coordinate> sourceCoordinates) {
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        List<Coordinate> targetCoordinatesList = instance.transform(sourceCRS, targetCRS, sourceCoordinates);
        Coordinate[] targetCoordinates = targetCoordinatesList.toArray(new Coordinate[0]);
        return geometryFactory.createLineString(targetCoordinates);
    }

    public static LineString transformToLineString(HashMap<Coordinate, String> sourceCoordinates, String targetCRS) {
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        List<Coordinate> targetCoordinatesList = new ArrayList<>();
        for (Map.Entry<Coordinate, String> entry : sourceCoordinates.entrySet()) {
            targetCoordinatesList.add(instance.transform(entry.getValue(), targetCRS, entry.getKey()));
        }
        Coordinate[] targetCoordinates = targetCoordinatesList.toArray(new Coordinate[0]);
        return geometryFactory.createLineString(targetCoordinates);
    }

    public static Polygon transformToPolygon(String sourceCRS, String targetCRS, List<Coordinate> shell, List<List<Coordinate>> holes) {
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        List<Coordinate> targetShell = instance.transform(sourceCRS, targetCRS, shell);
        LinearRing[] targetHoles = new LinearRing[holes.size()];
        for (List<Coordinate> hole : holes) {
            List<Coordinate> targetHole = instance.transform(sourceCRS, targetCRS, hole);
            Coordinate[] targetHoleArray = targetHole.toArray(new Coordinate[0]);
            LinearRing targetHoleRing = geometryFactory.createLinearRing(targetHoleArray);
            targetHoles[holes.indexOf(hole)] = targetHoleRing;
        }

        Coordinate[] targetShellArray = targetShell.toArray(new Coordinate[0]);
        LinearRing targetShellRing = geometryFactory.createLinearRing(targetShellArray);
        return geometryFactory.createPolygon(targetShellRing, targetHoles);
    }

    public static MultiPolygon mergeToMultiPolygon(List<Polygon> polygons) {
        Polygon[] polygonArray = polygons.toArray(new Polygon[0]);
        return geometryFactory.createMultiPolygon(polygonArray);
    }

}
