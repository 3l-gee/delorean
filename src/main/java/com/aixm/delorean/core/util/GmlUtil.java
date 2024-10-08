package com.aixm.delorean.core.util;

import java.math.BigInteger;
import java.util.List;

import javax.xml.namespace.QName;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;

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
    private static GeometryFactory geometryFactory = new GeometryFactory();

    public static Point parseGMLPoint(PointType value) {
        DirectPositionType pos = value.getPos();
        double x = pos.getValue().get(0);
        double y = pos.getValue().get(1);
        String srsName = value.getSrsName();

        System.out.println("srsName: " + srsName);
        System.out.println("x: " + x);
        System.out.println("y: " + y);
        //TODO BigInteger srsDimension = pos.getSrsDimension();
        //TODO List<String> axisLabels = pos.getAxisLabels();
        //TODO List<String> uomLabels = pos.getUomLabels();

        //TODO srsName is null, we should assume it is EPSG:4326 is this always the case?
        return geometryFactory.createPoint(new Coordinate(x, y));
        // if (srsName.equals("EPSG:4326") || srsName == null) {
        //     System.out.println("srsName null assuming EPSG:4326");
        //     return geometryFactory.createPoint(new Coordinate(x, y));
        // } else {
        //     System.out.println("srsName not null transforming to EPSG:4326");
        //     return LocationTechUtil.transformCRS(geometryFactory.createPoint(new Coordinate(x, y)), srsName, "EPSG:4326");
        // }
    }

    public static PointType printGMLPoint(Point value){  
        DirectPositionType pos = new DirectPositionType();

        pos.getValue().add(value.getX());
        pos.getValue().add(value.getY());
        if (value.getSRID() != 0) {
            pos.setSrsName("EPSG:" + value.getSRID());
        }

        PointType pointType = new PointType();
        pointType.setPos(pos);

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
            //TODO z = posList.get(i + 2);
            //TODO m = posList.get(i + 3);
            //TODO srsDimension > 2
        }

        return LocationTechUtil.transformCRS(geometryFactory.createLineString(coordinates), value.getSrsName(), "EPSG:4326");	
    }

    public static CurveType printGMLCurve(LineString value) {
        GeodesicStringType geodesicString = new GeodesicStringType();
        DirectPositionListType posList = new DirectPositionListType();
        List<Double> positions = posList.getValue();
        
        Coordinate[] coordinates = value.getCoordinates();
        for (Coordinate coord : coordinates) {
            positions.add(coord.getX());
            positions.add(coord.getY());
        }

        posList.setSrsDimension(BigInteger.valueOf(2));

        geodesicString.setPosList(posList);

        CurveType curve = new CurveType();
        JAXBElement<GeodesicStringType> geodesicElement = new JAXBElement<>(
            new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), 
            GeodesicStringType.class, 
            geodesicString
        );

        curve.getSegments().getAbstractCurveSegment().add(geodesicElement);

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
