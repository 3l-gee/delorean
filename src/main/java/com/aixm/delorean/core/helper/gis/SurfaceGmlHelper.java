package com.aixm.delorean.core.helper.gis;

import java.util.List;
import java.util.ArrayList;

import javax.xml.namespace.QName;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.MultiPolygon;
import org.locationtech.jts.geom.Polygon;

import jakarta.xml.bind.JAXBElement;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PolygonPatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ConeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CylinderType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.RectangleType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SphereType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TriangleType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.LinearRingType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.RingType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractRingType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CompositeCurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.LineStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.OrientableCurveType;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractCurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractRingPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfacePatchArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractSurfacePatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurvePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;

public class SurfaceGmlHelper {
    

    public static MultiPolygon parseGMLsurface(SurfaceType value) {
        if (value == null) {
            return null;
        }

        SurfacePatchArrayPropertyType patches = value.getPatches().getValue();
        if (patches == null) {
            throw new IllegalArgumentException("SurfacePatchArrayPropertyType is null" + value.getClass().getName());
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            throw new IllegalArgumentException("srsName is null" + value.getClass().getName());
        }

        List<Polygon> polygons = new ArrayList<Polygon>();
        for (JAXBElement<? extends AbstractSurfacePatchType> patch : patches.getAbstractSurfacePatch()) {
            List<Coordinate> exterior = parseSurfacePatchArrayProperty(patch, true).get(0);
            List<List<Coordinate>> interior = parseSurfacePatchArrayProperty(patch, false);
            polygons.add(CoordinateTransformeHelper.transformToPolygon(srsName, "urn:ogc:def:crs:EPSG::4326", exterior, interior));
        }

        return CoordinateTransformeHelper.mergeToMultiPolygon(polygons);
    }

    public static SurfaceType printGMLsurface(Polygon value) {

        return new SurfaceType();
    }

    public static List<List<Coordinate>>  parseSurfacePatchArrayProperty (JAXBElement<? extends AbstractSurfacePatchType> element, Boolean isExterior) {
        List<List<Coordinate>> coordinates =  new ArrayList<List<Coordinate>>();
        if (element.getValue() instanceof ConeType) {
            //AIXM-5.1_RULE-1A3ED3

        } else if (element.getValue() instanceof CylinderType) {
            //AIXM-5.1_RULE-1A3ED4

        } else if (element.getValue() instanceof PolygonPatchType) {
            if (isExterior) {
                coordinates.add(parsePolygonPatchExterior((PolygonPatchType) element.getValue()));
            } else {
                coordinates.addAll(parsePolygonPatchInterior((PolygonPatchType) element.getValue()));
            }

        } else if (element.getValue() instanceof RectangleType) {
            //AIXM-5.1_RULE-1A3ED1
            
        } else if (element.getValue() instanceof SphereType) {
            //AIXM-5.1_RULE-1A3ED5
            
        } else if (element.getValue() instanceof TriangleType) {
            //AIXM-5.1_RULE-1A3ED2
            
        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }
        return coordinates;
    }

    public static List<Coordinate> parsePolygonPatchExterior (PolygonPatchType value) {
        AbstractRingPropertyType exterior = value.getExterior();
        if (exterior == null) {
            throw new IllegalArgumentException("exterior is null" + value.getClass().getName());
        }
        return parseAbstractRingProperty(exterior);
    }

    public static List<List<Coordinate>> parsePolygonPatchInterior (PolygonPatchType value) {
        List<AbstractRingPropertyType> interior = value.getInterior();
        List<List<Coordinate>> coordinates = new ArrayList<List<Coordinate>>();
        if (interior == null) {
            return new ArrayList<List<Coordinate>>();
        }

        for (AbstractRingPropertyType ring : interior) {
            coordinates.add(parseAbstractRingProperty(ring));
        }

        return coordinates;
    }

    public static PolygonPatchType printPolygonPatch(List<Coordinate> exterior, List<List<Coordinate>> interior) {
        PolygonPatchType polygonPatch = new PolygonPatchType();

        //exterior
        RingType ringType = printRingType(exterior);
        AbstractRingPropertyType abstractRingPropertyType = new AbstractRingPropertyType();
        abstractRingPropertyType.setAbstractRing(new JAXBElement<RingType>(new QName("http://www.opengis.net/gml/3.2", "RingType"), RingType.class, ringType));
        polygonPatch.setExterior(abstractRingPropertyType);

        //interior
        List<AbstractRingPropertyType> abstractRingPropertyTypes = new ArrayList<AbstractRingPropertyType>();
        for (List<Coordinate> coordinates : interior) {
            RingType ring = printRingType(coordinates);
            AbstractRingPropertyType abstractRingPropertyType1 = new AbstractRingPropertyType();
            abstractRingPropertyType1.setAbstractRing(new JAXBElement<RingType>(new QName("http://www.opengis.net/gml/3.2", "RingType"), RingType.class, ring));
            abstractRingPropertyTypes.add(abstractRingPropertyType1);
        }

        return polygonPatch;
    }

    public static List<Coordinate> parseAbstractRingProperty(AbstractRingPropertyType value){
        JAXBElement<? extends AbstractRingType> element =  value.getAbstractRing();
        if (element.getValue() instanceof LinearRingType) {
            //AIXM-5.1_RULE-1A3ED6
            return new ArrayList<Coordinate>();

        } else if (element.getValue() instanceof RingType) {
            return parseRingType((RingType) element.getValue());

        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }
    }

    public static List<Coordinate> parseRingType(RingType value){
        List<Coordinate> coordinates = new ArrayList<Coordinate>();
        List<CurvePropertyType> curveMember = value.getCurveMember();
        if (curveMember == null) {
            return new ArrayList<Coordinate>();
        }

        for (CurvePropertyType curve : curveMember) {
            coordinates.addAll(parseCurveProperty(curve));
        }
        
        return coordinates;
    }
    
    public static RingType printRingType(List<Coordinate> value){
        RingType ringType = new RingType();
        CurveType curveType = new CurveType();
        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();
        GeodesicStringType geodesicString = CurveGmlHelper.printGeodesicString(value);
        segments.getAbstractCurveSegment().add(new JAXBElement<GeodesicStringType>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, geodesicString));
        curveType.setSegments(segments);
        CurvePropertyType curvePropertyType = new CurvePropertyType();
        curvePropertyType.setAbstractCurve(new JAXBElement<CurveType>(new QName("http://www.opengis.net/gml/3.2", "CurveType"), CurveType.class, curveType));
        ringType.getCurveMember().add(curvePropertyType);
        return ringType;
    }

    public static List<Coordinate> parseCurveProperty(CurvePropertyType value){
        List<Coordinate> coordinates = new ArrayList<Coordinate>();
        JAXBElement<? extends AbstractCurveType> element =  value.getAbstractCurve();
        if (element.getValue() instanceof com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType) {

        } else if (element.getValue() instanceof ElevatedCurveType){
            //TODO is this allowed in AIXM?

        } else if (element.getValue() instanceof CompositeCurveType){
            //TODO is this allowed in AIXM?

        } else if (element.getValue() instanceof com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType){
            // CurveType curveType = (CurveType) element.getValue();
            // if (curveType == null || curveType.getSegments() == null) {
            //     return coordinates;
            // } else {
            //     coordinates.addAll(CurveGmlHelper.parseCurveSegementArrayProperty(curveType.getSegments()));
            // }
        } else if (element.getValue() instanceof LineStringType){
            //TODO is this allowed in AIXM?
            
        } else if (element.getValue() instanceof LinearRingType){
            //TODO is this allowed in AIXM?
            
        } else if (element.getValue() instanceof OrientableCurveType){
            //TODO is this allowed in AIXM?
            
        } else if (element.getValue() instanceof RingType){
            //TODO is this allowed in AIXM?
            
        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }
        return coordinates;
    }

}
