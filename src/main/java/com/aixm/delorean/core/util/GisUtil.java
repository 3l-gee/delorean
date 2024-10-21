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

import com.aixm.delorean.core.schema.school.AixmPointType;

import com.aixm.delorean.core.schema.school.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.school.org.gml.AbstractCurveSegmentType;
import com.aixm.delorean.core.schema.school.org.gml.AbstractRingPropertyType;
import com.aixm.delorean.core.schema.school.org.gml.AbstractRingType;
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
        if (srsName == null) {
            srsName = "EPSG:4326";
        }
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

    private static RingType geodesicStringTypeWrapper(GeodesicStringType value) {
        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();   
        segments.getAbstractCurveSegment().add(new JAXBElement<GeodesicStringType>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, value));

        CurveType curve = new CurveType();
        curve.setSegments(segments);

        CurvePropertyType curveProperty = new CurvePropertyType();
        curveProperty.setAbstractCurve(new JAXBElement<CurveType>(new QName("http://www.opengis.net/gml/3.2", "Curve"), CurveType.class, curve)); 
        
        RingType ring = new RingType();
        ring.getCurveMember().add(curveProperty);

        return ring;
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

    public static Point parseAIXMPoint (AixmPointType value) {
        return parseGMLPoint(value);
    }
    

    public static List<Point> parseGMLPoints(List<PointType> values) {
        List<Point> points = new ArrayList<>(values.size());
        for (PointType value : values) {
            points.add(parseGMLPoint(value));
        }
        return points;
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

    public static AixmPointType printAIXMPoint(Point value) {
        DirectPositionType pos = new DirectPositionType();

        pos.getValue().add(value.getX());
        pos.getValue().add(value.getY());


        AixmPointType aixmPointType = new AixmPointType();
        aixmPointType.setPos(pos);

        if (value.getSRID() != 0) {
            aixmPointType.setSrsName("EPSG:" + value.getSRID());
        }

        return aixmPointType;
    }

    public static List<PointType> printGMLPoints(List<Point> values){
        List<PointType> points = new ArrayList<>(values.size());
        for (Point value : values) {
            points.add(printGMLPoint(value));
        }
        return points;
    }

    public static LineString parseGMLCurve(CurveType value) {
        GeodesicStringType segment = null;

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

    public static List<LineString> parseGMLCurves(List<CurveType> values) {
        List<LineString> curves = new ArrayList<>(values.size());
        for (CurveType value : values) {
            curves.add(parseGMLCurve(value));
        }
        return curves;
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

    public static List<CurveType> printGMLCurves(List<LineString> values) {
        List<CurveType> curves = new ArrayList<>(values.size());
        for (LineString value : values) {
            curves.add(printGMLCurve(value));
        }
        return curves;
    }

    public static Polygon parseGMLSurface(SurfaceType value) { 
        System.out.println("parseGMLSurface(SurfaceType value)");
        List<PolygonPatchType> patches = new ArrayList<>();
        Integer counter = 0;
        GeodesicStringType exteriorMap = null;
        Map<Integer, GeodesicStringType> interiorMap = new HashMap<>(256);


        for (JAXBElement<? extends AbstractSurfacePatchType> element : value.getPatches().getValue().getAbstractSurfacePatch()) {
            if (element.getValue() instanceof PolygonPatchType) {
                    patches.add((PolygonPatchType) element.getValue());

            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + element.getValue().getClass().getName());
            }    
        }

        if(patches.get(0).getExterior().getAbstractRing().getValue() instanceof RingType || patches.size() == 1) {
            RingType exteriorRing = (RingType) patches.getFirst().getExterior().getAbstractRing().getValue();

            if (exteriorRing.getCurveMember().getFirst().getAbstractCurve().getValue() instanceof CurveType){
                CurveType exteriorCurve = (CurveType) exteriorRing.getCurveMember().getFirst().getAbstractCurve().getValue();

                if (exteriorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType){
                    exteriorMap = (GeodesicStringType) exteriorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue();

                } else {
                    throw new IllegalArgumentException("Unsupported curve segment type: " + exteriorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue().getClass().getName());
                }
            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + patches.getFirst().getExterior().getAbstractRing().getValue().getClass().getName());
            }
        } else {
            throw new IllegalArgumentException("Unsupported surface patch type: " + patches.getFirst().getExterior().getAbstractRing().getValue().getClass().getName());
        }

        for (AbstractRingPropertyType interior : patches.get(0).getInterior()){

            if (interior.getAbstractRing().getValue() instanceof RingType) {
                RingType interiorRing = (RingType) interior.getAbstractRing().getValue();

                if (interiorRing.getCurveMember().getFirst().getAbstractCurve().getValue() instanceof CurveType){
                    CurveType interiorCurve = (CurveType) interiorRing.getCurveMember().getFirst().getAbstractCurve().getValue();

                    if (interiorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType){
                        interiorMap.put(counter, (GeodesicStringType) interiorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue());

                    } else {
                        throw new IllegalArgumentException("Unsupported curve segment type: " + interiorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue().getClass().getName());
                    }

                } else {
                    throw new IllegalArgumentException("Unsupported surface patch type: " + patches.get(0).getExterior().getAbstractRing().getValue().getClass().getName());
                }
            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + interior.getAbstractRing().getValue().getClass().getName());
            }
            counter++;
        }

        LinearRing shell = geometryFactory.createLinearRing(segmentToCoordinate(value.getSrsName(), exteriorMap));
        LinearRing[] holes = new LinearRing[interiorMap.size()];

        for (Integer i : interiorMap.keySet()) {
            holes[i] = geometryFactory.createLinearRing(segmentToCoordinate(value.getSrsName(), interiorMap.get(i)));
        }
       
        return geometryFactory.createPolygon(shell, holes);
    }

    public static SurfaceType printGMLSurface(Polygon value){

        //shell
        GeodesicStringType shell = coordinateToSegment(value.getExteriorRing().getCoordinates());
        RingType exterior = geodesicStringTypeWrapper(shell);
        AbstractRingPropertyType exteriorRing = new AbstractRingPropertyType();
        exteriorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, exterior));
        
        //holes
        List<AbstractRingPropertyType> interiorRingList = new ArrayList<>();
        for (int i = 0; i < value.getNumInteriorRing(); i++) {
            GeodesicStringType hole = coordinateToSegment(value.getInteriorRingN(i).getCoordinates());
            RingType interior = geodesicStringTypeWrapper(hole);
            AbstractRingPropertyType interiorRing = new AbstractRingPropertyType();
            interiorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, interior));
            interiorRingList.add(interiorRing);
        }

        PolygonPatchType patch = new PolygonPatchType();
        patch.setExterior(exteriorRing);
        patch.getInterior().addAll(interiorRingList);   

        SurfacePatchArrayPropertyType patches = new SurfacePatchArrayPropertyType();
        patches.getAbstractSurfacePatch().add(new JAXBElement<PolygonPatchType>(new QName("http://www.opengis.net/gml/3.2", "PolygonPatch"), PolygonPatchType.class, patch));


        SurfaceType surface = new SurfaceType();
        surface.setPatches(new JAXBElement<SurfacePatchArrayPropertyType>(new QName("http://www.opengis.net/gml/3.2", "patches"), SurfacePatchArrayPropertyType.class, patches));
        surface.setSrsDimension(BigInteger.valueOf(2));
        surface.setSrsName("EPSG:4326");

        return surface;
    }
   
}
