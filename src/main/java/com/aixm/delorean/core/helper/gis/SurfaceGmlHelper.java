package com.aixm.delorean.core.helper.gis;

import java.math.BigInteger;
import java.math.BigDecimal;
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

import jakarta.xml.bind.JAXBElement;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType;
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

import com.aixm.delorean.core.adapter.type.gis.AixmGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedSurfaceType;
import com.aixm.delorean.core.adapter.type.gis.AixmPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractCurveSegmentType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractCurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractRingPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfacePatchArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractSurfacePatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurvePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.RingType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType;

public class SurfaceGmlHelper {
    

    public static Polygon parseGMLsurface(SurfaceType value) {

        return new Polygon(null, null, null);
    }

    public static SurfaceType printGMLsurface(Polygon value) {

        return new SurfaceType();
    }

    public static Polygon parseSurfacePatchArrayProperty (SurfacePatchArrayPropertyType value) {
        for (JAXBElement<? extends AbstractSurfacePatchType> element : value.getAbstractSurfacePatch()){
            if (element.getValue() instanceof ConeType) {
                //AIXM-5.1_RULE-1A3ED3

            } else if (element.getValue() instanceof CylinderType) {
                //AIXM-5.1_RULE-1A3ED4

            } else if (element.getValue() instanceof PolygonPatchType) {

            } else if (element.getValue() instanceof RectangleType) {
                //AIXM-5.1_RULE-1A3ED1
                
            } else if (element.getValue() instanceof SphereType) {
                //AIXM-5.1_RULE-1A3ED5
                
            } else if (element.getValue() instanceof TriangleType) {
                //AIXM-5.1_RULE-1A3ED2
                
            } else {
                throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
            }
        }
        return new Polygon(null, null, null);
    }

    public static Polygon parsePolygonPatch (PolygonPatchType value) {
        return new Polygon(null, null, null);
    }

    public static PolygonPatchType printPolygonPatch (Polygon value) {
        return new PolygonPatchType();
    }

    public static Coordinate[] parseAbstractRingProperty(AbstractRingPropertyType value){
        JAXBElement<? extends AbstractRingType> element =  value.getAbstractRing();
        if (element.getValue() instanceof LinearRingType) {
            //AIXM-5.1_RULE-1A3ED6

        } else if (element.getValue() instanceof RingType) {

        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }

        return new Coordinate[0];
    }

    public static Coordinate[] parseRingType(RingType value){
        return new Coordinate[0];
    }
    
    public static RingType pRingType(Coordinate[] value){
        return new RingType();
    }

    public static Coordinate[] parseCurveProperty(CurvePropertyType value){
        JAXBElement<? extends AbstractCurveType> element =  value.getAbstractCurve();
        if (element.getValue() instanceof com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType) {

        } else if (element.getValue() instanceof ElevatedCurveType){

        } else if (element.getValue() instanceof CompositeCurveType){
            
        } else if (element.getValue() instanceof com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType){
            
        } else if (element.getValue() instanceof LineStringType){
            
        } else if (element.getValue() instanceof LinearRingType){
            
        } else if (element.getValue() instanceof OrientableCurveType){
            
        } else if (element.getValue() instanceof RingType){
            
        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }

        return new Coordinate[0];
    }

}
