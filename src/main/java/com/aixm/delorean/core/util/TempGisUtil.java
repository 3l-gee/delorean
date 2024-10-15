package com.aixm.delorean.core.util;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.xml.namespace.QName;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.LineString;
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

public class TempGisUtil {    
    private static int SRID = 4326; // EPSG:4326
    private static PrecisionModel precisionModel = new PrecisionModel( 0.001);
    private static GeometryFactory geometryFactory = new GeometryFactory(precisionModel, SRID);
    private static CRSFactory crsFactory = new CRSFactory();
    private static CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();

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

        List<Double> posList = segment.getPosList().getValue();
        BigInteger srsDimension = segment.getPosList().getSrsDimension();
        int dimension = (srsDimension != null) ? srsDimension.intValue() : 2;
        Coordinate[] coordinates = new Coordinate[posList.size() / dimension];

        for (int i = 0; i < posList.size(); i += dimension) {
            coordinates[i / dimension] = new Coordinate(posList.get(i), posList.get(i + 1));
        }

        return geometryFactory.createLineString(coordinates);
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
        List<PolygonPatchType> patches = null;
        String srsName = value.getSrsName();
        Integer counter = 0;
        Map<Integer, RingType> exteriorMap = new HashMap<>(256);
        Map<Integer, RingType> interiorMap = new HashMap<>(256);
        
        
        //TODO cam Only handel PolygonPatchType
        for (JAXBElement<? extends AbstractSurfacePatchType> element : value.getPatches().getValue().getAbstractSurfacePatch()) {
            if (element.getValue() instanceof PolygonPatchType) {
                    patches.add((PolygonPatchType) element.getValue());

            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + element.getValue().getClass().getName());
            }    
        }

        for (PolygonPatchType patch : patches) {
            //Handels Exterior
            if(patch.getExterior().getAbstractRing().getValue() instanceof RingType){
                exteriorMap.put(counter, (RingType) patch.getExterior().getAbstractRing().getValue());
            }

            //Handels Interior
            for (AbstractRingPropertyType interior : patch.getInterior()){
                if (interior.getAbstractRing().getValue() instanceof RingType) {
                    interiorMap.put(counter, (RingType) interior.getAbstractRing().getValue());
                }
            }

            counter++;
        }

        for (Integer i : exteriorMap.keySet()){
            System.out.println("exteriorMap :"  +  exteriorMap.get(i));
        }



        return null;
    }

    public static SurfaceType printGMLSurface(Polygon value){


        return new SurfaceType();
    }
    
}
