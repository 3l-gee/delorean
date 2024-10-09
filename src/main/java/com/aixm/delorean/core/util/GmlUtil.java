package com.aixm.delorean.core.util;

import java.math.BigInteger;
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

import com.aixm.delorean.core.schema.school.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.school.org.gml.AbstractCurveSegmentType;
import jakarta.xml.bind.JAXBElement;
import com.aixm.delorean.core.schema.school.org.gml.CurveType;
import com.aixm.delorean.core.schema.school.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.school.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.school.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.school.org.gml.PointType;
import com.aixm.delorean.core.schema.school.org.gml.SurfaceType;

public class GmlUtil {    
    private static int SRID = 4326; // EPSG:4326
    private static PrecisionModel precisionModel = new PrecisionModel( 0.001);
    private static GeometryFactory geometryFactory = new GeometryFactory(precisionModel, SRID);

    public static Point parseGMLPoint(PointType value) {
        DirectPositionType pos = value.getPos();

        double x = pos.getValue().get(0);
        double y = pos.getValue().get(1);

        return geometryFactory.createPoint(new Coordinate(x, y));
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
            System.out.println("x: " + posList.get(i));
            System.out.println("y: " + posList.get(i + 1));
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


    public Polygon parseGMLSurface(SurfaceType value) {
        return null;
    }

    public SurfaceType printGMLSurface(Polygon value){
        return null;
    }
    
}
