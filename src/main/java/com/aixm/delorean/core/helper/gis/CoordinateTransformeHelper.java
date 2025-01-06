package com.aixm.delorean.core.helper.gis;

import java.util.List;
import java.io.Console;
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
import java.util.Set;

import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;

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
        Map.entry("urn:ogc:def:crs:EPSG::4269", crsFactory.createFromName("EPSG:4269")),
        Map.entry("urn:ogc:def:crs:OGC:1.3:CRS84", crsFactory.createFromParameters("CRS84", new String[]{"+proj=longlat", "+datum=WGS84", "+no_defs", "+axis=enu"}))
    );

    private Map<String, CoordinateTransform> transformMap = new HashMap<>();
   
    // Singleton instance
    private static CoordinateTransformeHelper instance;

    // Private constructor to prevent instantiation
    private CoordinateTransformeHelper() {
        // Initialization code here
    }

    private boolean isLongLatCRS(String crsIdentifier) {
        Set<String> latLongCRSIdentifiers = Set.of(
            "urn:ogc:def:crs:EPSG::4326",
            "urn:ogc:def:crs:EPSG::4258",
            "urn:ogc:def:crs:EPSG::4322",
            "urn:ogc:def:crs:EPSG::4230",
            "urn:ogc:def:crs:EPSG::4668",
            "urn:ogc:def:crs:EPSG::4312",
            "urn:ogc:def:crs:EPSG::4215",
            "urn:ogc:def:crs:EPSG::4801",
            "urn:ogc:def:crs:EPSG::4149",
            "urn:ogc:def:crs:EPSG::4275",
            "urn:ogc:def:crs:EPSG::4746",
            "urn:ogc:def:crs:EPSG::4121",
            "urn:ogc:def:crs:EPSG::4658",
            "urn:ogc:def:crs:EPSG::4299",
            "urn:ogc:def:crs:EPSG::4806",
            "urn:ogc:def:crs:EPSG::4277",
            "urn:ogc:def:crs:EPSG::4207",
            "urn:ogc:def:crs:EPSG::4274",
            "urn:ogc:def:crs:EPSG::4740",
            "urn:ogc:def:crs:EPSG::4313",
            "urn:ogc:def:crs:EPSG::4124",
            "urn:ogc:def:crs:EPSG::4267",
            "urn:ogc:def:crs:EPSG::4269"
        );
    
        Set<String> longLatCRSIdentifiers = Set.of(
            "urn:ogc:def:crs:OGC:1.3:CRS84"
        );
    
        if (longLatCRSIdentifiers.contains(crsIdentifier)) {
            return true; 
        } else if (latLongCRSIdentifiers.contains(crsIdentifier)) {
            return false;
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "Invalid CRS identifier: " + crsIdentifier, new Exception().getStackTrace()[0]);
            throw new RuntimeException();
        }
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
            ConsoleLogger.log(LogLevel.FATAL, "Invalid source or target CRS: " + sourceCRS + ", " + targetCRS, new Exception().getStackTrace()[0]);
            throw new RuntimeException();
        }
    
        String key = sourceCRS + ":" + targetCRS;
    
        transformMap.computeIfAbsent(key, k -> {
            ConsoleLogger.log(LogLevel.DEBUG, "Creating new CoordinateTransform for key: " + k, new Exception().getStackTrace()[0]);
            CoordinateReferenceSystem source = validSrsName.get(sourceCRS);
            CoordinateReferenceSystem target = validSrsName.get(targetCRS);
            return ctFactory.createTransform(source, target);
        });
        
        ConsoleLogger.log(LogLevel.DEBUG, "Returning CoordinateTransform for key: " + key, new Exception().getStackTrace()[0]);
        return transformMap.get(key);
    }

    private List<Coordinate> transform(String sourceCRS, String targetCRS, List<Coordinate> sourceCoordinates) {
        ConsoleLogger.log(LogLevel.DEBUG, "sourceCRS: " + sourceCRS + ", targetCRS: " + targetCRS + ", sourceCoordinates: " + sourceCoordinates, new Exception().getStackTrace()[0]);
        CoordinateTransform transform = getTransform(sourceCRS, targetCRS);
        
        // Check if the CRS expects lat-long or long-lat
        boolean sourceIsLongLat = isLongLatCRS(sourceCRS); // Custom function to determine if the source CRS uses lat-long order
        boolean targetIsLongLat = isLongLatCRS(targetCRS); // Custom function to determine if the target CRS uses lat-long order

        ConsoleLogger.log(LogLevel.DEBUG, "sourceIsLongLat: " + sourceIsLongLat + ", targetIsLongLat: " + targetIsLongLat, new Exception().getStackTrace()[0]);
    
        ProjCoordinate source;
        ProjCoordinate target = new ProjCoordinate();

        List<Coordinate> targetCoordinates = new ArrayList<>();
        for (Coordinate sourceCoordinate : sourceCoordinates) {
            if (sourceIsLongLat) {
                source = new ProjCoordinate(sourceCoordinate.getX(), sourceCoordinate.getY()); // Swap for Proj4j
            } else {
                source = new ProjCoordinate(sourceCoordinate.getY(), sourceCoordinate.getX());
            }

            transform.transform(source, target);

            if (targetIsLongLat) {
                targetCoordinates.add(new Coordinate(target.y, target.x)); // Swap back for output
            } else {
                targetCoordinates.add(new Coordinate(target.x, target.y));
            }
        }
        return targetCoordinates;
    }

    private Coordinate ProjectPoint(Coordinate sourceCoordinate, double radius, double bearing) {
        ConsoleLogger.log(LogLevel.DEBUG, "sourceCoordinate: " + sourceCoordinate + ", radius: " + radius + ", bearing: " + bearing, new Exception().getStackTrace()[0]);
        double A = 6378137.0;
        double F = 1 / 298.257223563;
        double B = A * (1 - F);

        double lat = Math.toRadians(sourceCoordinate.getY());
        double lon = Math.toRadians(sourceCoordinate.getX());
        double distance = radius / A;

        double new_lat = Math.asin(Math.sin(lat) * Math.cos(distance) + Math.cos(lat) * Math.sin(distance) * Math.cos(bearing));
        double new_lon = lon + Math.atan2(Math.sin(bearing) * Math.sin(distance) * Math.cos(lat), Math.cos(distance) - Math.sin(lat) * Math.sin(lat));

        return new Coordinate(Math.toDegrees(new_lon), Math.toDegrees(new_lat));
    
    }

    private Coordinate transform(String sourceCRS, String targetCRS, Coordinate sourceCoordinate) {
        CoordinateTransform transform = getTransform(sourceCRS, targetCRS);
        
        // Check if the CRS expects lat-long or long-lat
        boolean sourceIsLongLat = isLongLatCRS(sourceCRS); // Custom function to determine if the source CRS uses lat-long order
        boolean targetIsLongLat = isLongLatCRS(targetCRS); // Custom function to determine if the target CRS uses lat-long order
    
        ProjCoordinate source;
        ProjCoordinate target = new ProjCoordinate();
    
        if (sourceCoordinate.getZ() == Double.NaN) {
            // Handle 2D coordinate transformation
            if (sourceIsLongLat) {
                source = new ProjCoordinate(sourceCoordinate.getX(), sourceCoordinate.getY()); // Swap for Proj4j
            } else {
                source = new ProjCoordinate(sourceCoordinate.getY(), sourceCoordinate.getX());
            }
            
            transform.transform(source, target);
    
            if (targetIsLongLat) {
                return new Coordinate(target.y, target.x); // Swap back for output
            } else {
                return new Coordinate(target.x, target.y);
            }
        } else {
            // Handle 3D coordinate transformation
            if (sourceIsLongLat) {
                source = new ProjCoordinate(sourceCoordinate.getX(), sourceCoordinate.getY(), sourceCoordinate.getZ());
            } else {
                source = new ProjCoordinate(sourceCoordinate.getY(), sourceCoordinate.getX(), sourceCoordinate.getZ());
            }
    
            transform.transform(source, target);
    
            if (targetIsLongLat) {
                return new Coordinate(target.y, target.x, target.z); // Swap back for output
            } else {
                return new Coordinate(target.x, target.y, target.z);
            }
        }
    }

    public static Point transformToPoint(String sourceCRS, String targetCRS, Coordinate sourceCoordinate) {
        ConsoleLogger.log(LogLevel.DEBUG, "sourceCRS: " + sourceCRS + ", targetCRS: " + targetCRS + ", sourceCoordinate: " + sourceCoordinate, new Exception().getStackTrace()[0]);
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        Coordinate targetCoordinate = instance.transform(sourceCRS, targetCRS, sourceCoordinate);
        Point point = geometryFactory.createPoint(targetCoordinate);
        ConsoleLogger.log(LogLevel.DEBUG, "point: " + point, new Exception().getStackTrace()[0]);
        return point;
    }

    public static LineString transformToLineString(String sourceCRS, String targetCRS, List<Coordinate> sourceCoordinates) {
        ConsoleLogger.log(LogLevel.DEBUG, "sourceCRS: " + sourceCRS + ", targetCRS: " + targetCRS + ", sourceCoordinates: " + sourceCoordinates, new Exception().getStackTrace()[0]);
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        List<Coordinate> targetCoordinatesList = instance.transform(sourceCRS, targetCRS, sourceCoordinates);
        Coordinate[] targetCoordinates = targetCoordinatesList.toArray(new Coordinate[0]);
        LineString line = geometryFactory.createLineString(targetCoordinates);
        ConsoleLogger.log(LogLevel.DEBUG, "line: " + line, new Exception().getStackTrace()[0]);
        return line;
    }

    public static LineString transformToLineString(String sourceCRS, String targetCRS, Coordinate sourceCoordinate, double distance, double bearing1, double bearing2) {
        ConsoleLogger.log(LogLevel.DEBUG, "sourceCRS: " + sourceCRS + ", targetCRS: " + targetCRS + ", sourceCoordinate: " + sourceCoordinate + ", distance: " + distance + ", bearing1: " + bearing1 + ", bearing2: " + bearing2, new Exception().getStackTrace()[0]);
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        Coordinate targetCoordinate = instance.transform(sourceCRS, targetCRS, sourceCoordinate);
        Coordinate targetCoordinate1 = instance.ProjectPoint(targetCoordinate, distance, bearing1);
        Coordinate targetCoordinate2 = instance.ProjectPoint(targetCoordinate, distance, bearing2);
        Coordinate[] targetCoordinates = {targetCoordinate1, targetCoordinate, targetCoordinate2};
        LineString line =  geometryFactory.createLineString(targetCoordinates);
        ConsoleLogger.log(LogLevel.DEBUG, "line: " + line, new Exception().getStackTrace()[0]);
        return line;
    }

    public static LineString transformToLineString(HashMap<Coordinate, String> sourceCoordinates, String targetCRS) {
        ConsoleLogger.log(LogLevel.DEBUG, "sourceCoordinates: " + sourceCoordinates + ", targetCRS: " + targetCRS, new Exception().getStackTrace()[0]);
        CoordinateTransformeHelper instance = CoordinateTransformeHelper.getInstance();
        List<Coordinate> targetCoordinatesList = new ArrayList<>();
        for (Map.Entry<Coordinate, String> entry : sourceCoordinates.entrySet()) {
            targetCoordinatesList.add(instance.transform(entry.getValue(), targetCRS, entry.getKey()));
        }
        Coordinate[] targetCoordinates = targetCoordinatesList.toArray(new Coordinate[0]);
        LineString line = geometryFactory.createLineString(targetCoordinates);
        ConsoleLogger.log(LogLevel.DEBUG, "line: " + line, new Exception().getStackTrace()[0]);
        return line;
    }

    public static Polygon transformToPolygon(String sourceCRS, String targetCRS, List<Coordinate> shell, List<List<Coordinate>> holes) {
        ConsoleLogger.log(LogLevel.DEBUG, "sourceCRS: " + sourceCRS + ", targetCRS: " + targetCRS + ", shell: " + shell + ", holes: " + holes, new Exception().getStackTrace()[0]);
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
        Polygon polygon = geometryFactory.createPolygon(targetShellRing, targetHoles);
        ConsoleLogger.log(LogLevel.DEBUG, "polygon: " + polygon, new Exception().getStackTrace()[0]);
        return polygon;
    }

    public static MultiPolygon mergeToMultiPolygon(List<Polygon> polygons) {
        ConsoleLogger.log(LogLevel.DEBUG, "polygons: " + polygons, new Exception().getStackTrace()[0]);
        Polygon[] polygonArray = polygons.toArray(new Polygon[0]);
        MultiPolygon multiPolygon = geometryFactory.createMultiPolygon(polygonArray);
        ConsoleLogger.log(LogLevel.DEBUG, "multiPolygon: " + multiPolygon, new Exception().getStackTrace()[0]);
        return multiPolygon;
    }

}
