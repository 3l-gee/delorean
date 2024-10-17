package com.aixm.delorean.core.util;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import javax.xml.namespace.QName;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.LinearRing;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.jts.geom.PrecisionModel;
import org.locationtech.proj4j.CRSFactory;
import org.locationtech.proj4j.CoordinateReferenceSystem;
import org.locationtech.proj4j.CoordinateTransformFactory;
import org.locationtech.proj4j.ProjCoordinate;
import org.locationtech.proj4j.CoordinateTransform;

import com.aixm.delorean.core.schema.school.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.school.org.gml.AbstractCurveSegmentType;
import com.aixm.delorean.core.schema.school.org.gml.AbstractRingPropertyType;
import com.aixm.delorean.core.schema.school.org.gml.SurfacePatchArrayPropertyType;
import com.aixm.delorean.core.schema.school.org.gml.AbstractSurfacePatchType;
import com.aixm.delorean.core.schema.school.org.gml.CurvePropertyType;
import com.aixm.delorean.core.schema.school.org.gml.PolygonPatchType;
import com.aixm.delorean.core.schema.school.org.gml.RingType;

import jakarta.xml.bind.JAXBElement;
import com.aixm.delorean.core.schema.school.org.gml.CurveType;
import com.aixm.delorean.core.schema.school.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.school.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.school.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.school.org.gml.PointType;
import com.aixm.delorean.core.schema.school.org.gml.PolygonPatchType;
import com.aixm.delorean.core.schema.school.org.gml.SurfaceType;

public class GisUtil {    
    private static int SRID = 4326; // EPSG:4326
    private static PrecisionModel precisionModel = new PrecisionModel( 0.001);
    private static GeometryFactory geometryFactory = new GeometryFactory(precisionModel, SRID);
    private static CRSFactory crsFactory = new CRSFactory();
    private static CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();

    private static Coordinate[] segmentToCoordinate(String srsName, GeodesicStringType segment) {
        CoordinateTransform transform = createCoordinateTransform(srsName, "EPSG:4326");
        List<Double> posList = segment.getPosList().getValue();
        BigInteger srsDimension = segment.getPosList().getSrsDimension();
        int dimension = (srsDimension != null) ? srsDimension.intValue() : 2;
        Coordinate[] coordinates = new Coordinate[posList.size() / dimension];

        for (int i = 0; i < posList.size(); i += dimension) {
            coordinates[i / dimension] = transformCoordinates(new Coordinate(posList.get(i), posList.get(i + 1)), transform);
        }
        
        return coordinates;
    }

    private static GeodesicStringType coordinateToSegment(Coordinate[] coordinates) {
        GeodesicStringType segment = new GeodesicStringType();
        DirectPositionListType posList = new DirectPositionListType();
        
        for (Coordinate coord : coordinates) {
            posList.getValue().add(coord.getX());
            posList.getValue().add(coord.getY());
        }
        
        segment.setPosList(posList);
        return segment;
    }

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

        return new Coordinate(tgtCoord.x, tgtCoord.y);
    }

    public static Point parseGMLPoint(PointType value) {
        DirectPositionType pos = value.getPos();
        String srsName = value.getSrsName();
        Coordinate srcCoord = new Coordinate(pos.getValue().get(0), pos.getValue().get(1));
        if (srsName == null) {
            // No transformation needed
            return geometryFactory.createPoint(new Coordinate(srcCoord.x, srcCoord.y));
        }
        
        CoordinateTransform transform = createCoordinateTransform(srsName, "EPSG:4326");
        Coordinate tgtCoord = transformCoordinates(new Coordinate(srcCoord.x, srcCoord.y), transform);

        return geometryFactory.createPoint(new Coordinate(tgtCoord.x, tgtCoord.y));
    }

    public static PointType printGMLPoint(Point value){  
        DirectPositionType pos = new DirectPositionType();

        pos.getValue().add(value.getX());
        pos.getValue().add(value.getY());


        PointType pointType = new PointType();
        pointType.setPos(pos);

        if (value.getSRID() != 0) {
            pointType.setSrsName("EPSG:" + value.getSRID());
        }

        return pointType;
    }

    public static LineString parseGMLCurve(CurveType value) {
        GeodesicStringType segment = null;

        //TODO can only handle GeodesicString segmentstype
        for (JAXBElement<? extends AbstractCurveSegmentType> element : value.getSegments().getAbstractCurveSegment()) {
            if (element.getValue() instanceof GeodesicStringType) {
                segment = (GeodesicStringType) element.getValue();

            } else {
                throw new IllegalArgumentException("Unsupported curve segment type: " + element.getValue().getClass().getName());
            }
        }

        if (segment == null) {
            throw new IllegalArgumentException("No GeodesicStringType segment found in the curve.");
        }

        return geometryFactory.createLineString(segmentToCoordinate(value.getSrsName(), segment));
    }

    public static CurveType printGMLCurve(LineString value) {
        CurveType curve = new CurveType();
        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();
        GeodesicStringType geodesicString = new GeodesicStringType();
        DirectPositionListType posList = new DirectPositionListType();

        for (Coordinate coord : value.getCoordinates()) {
            posList.getValue().add(coord.getX());
            posList.getValue().add(coord.getY());
        }

        curve.setSrsDimension(BigInteger.valueOf(2));

        geodesicString.setPosList(posList);

        JAXBElement<GeodesicStringType> geodesicElement = new JAXBElement<>(
            new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), 
            GeodesicStringType.class, 
            geodesicString
        );

        segments.getAbstractCurveSegment().add(geodesicElement);
        curve.setSegments(segments);
        
        int srid = value.getSRID();
        if (srid != 0) {
            curve.setSrsName("EPSG:" + srid);
        }

        return curve;
    }


    public static Polygon parseGMLSurface(SurfaceType value) { 
        System.out.println("parseGMLSurface(SurfaceType value)");
        List<PolygonPatchType> patches = new ArrayList<>();
        Integer counter = 0;
        Map<Integer, GeodesicStringType> exteriorMap = new HashMap<>(256);
        Map<Integer, GeodesicStringType> interiorMap = new HashMap<>(256);
        
        for (JAXBElement<? extends AbstractSurfacePatchType> element : value.getPatches().getValue().getAbstractSurfacePatch()) {
            if (element.getValue() instanceof PolygonPatchType) {
                    patches.add((PolygonPatchType) element.getValue());

            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + element.getValue().getClass().getName());
            }    
        }

        for (PolygonPatchType patch : patches) {
            if(patch.getExterior().getAbstractRing().getValue() instanceof RingType){
                RingType exteriorRing = (RingType) patch.getExterior().getAbstractRing().getValue();

                if (exteriorRing.getCurveMember().getFirst().getAbstractCurve().getValue() instanceof CurveType){
                    CurveType curve = (CurveType) exteriorRing.getCurveMember().getFirst().getAbstractCurve().getValue();

                    if (curve.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType){
                        exteriorMap.put(counter, (GeodesicStringType) curve.getSegments().getAbstractCurveSegment().getFirst().getValue());
                    } else {
                        throw new IllegalArgumentException("Unsupported curve segment type: " + curve.getSegments().getAbstractCurveSegment().getFirst().getValue().getClass().getName());
                    }
                } else {
                    throw new IllegalArgumentException("Unsupported surface patch type: " + patch.getExterior().getAbstractRing().getValue().getClass().getName());
                }
            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + patch.getExterior().getAbstractRing().getValue().getClass().getName());
            }

            for (AbstractRingPropertyType interior : patch.getInterior()){
                if (interior.getAbstractRing().getValue() instanceof RingType) {
                    RingType interiorRing = (RingType) patch.getExterior().getAbstractRing().getValue();

                    if (interiorRing.getCurveMember().getFirst().getAbstractCurve().getValue() instanceof CurveType){
                        CurveType curve = (CurveType) interiorRing.getCurveMember().getFirst().getAbstractCurve().getValue();
    
                        if (curve.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType){
                            interiorMap.put(counter, (GeodesicStringType) curve.getSegments().getAbstractCurveSegment().getFirst().getValue());
                        } else {
                            throw new IllegalArgumentException("Unsupported curve segment type: " + curve.getSegments().getAbstractCurveSegment().getFirst().getValue().getClass().getName());
                        }
    
                    } else {
                        throw new IllegalArgumentException("Unsupported surface patch type: " + patch.getExterior().getAbstractRing().getValue().getClass().getName());
                    }
                } else {
                    throw new IllegalArgumentException("Unsupported surface patch type: " + interior.getAbstractRing().getValue().getClass().getName());
                }
            }
            counter++;
        }

        if (exteriorMap.size() != 1) {
            throw new IllegalArgumentException("The exterior map must contain exactly one entry.");
        }

        LinearRing shell = geometryFactory.createLinearRing(segmentToCoordinate(value.getSrsName(), exteriorMap.get(0)));
        LinearRing[] holes = new LinearRing[interiorMap.size()];

        for (Integer i : interiorMap.keySet()) {
            holes[i] = geometryFactory.createLinearRing(segmentToCoordinate(value.getSrsName(), interiorMap.get(i)));
        }

        return geometryFactory.createPolygon(shell, holes);
    }

    public static SurfaceType printGMLSurface(Polygon value){


        return new SurfaceType();
    }
    
}
