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
import com.aixm.delorean.core.schema.a5_1_1.org.gml.OffsetCurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.LineStringSegmentType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PolygonPatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfaceType;
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
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractRingPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfacePatchArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractSurfacePatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcByBulgeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcByCenterPointType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcStringByBulgeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.BSplineType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.BezierType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CircleByCenterPointType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CircleType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ClothoidType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CubicSplineType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurvePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.RingType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType;

public class CurveGmlHelper {

    public static LineString parseGMLcurve (CurveType value) {
        CurveSegmentArrayPropertyType segments = value.getSegments();
        String srsName = value.getSrsName();
        BigInteger srsDimension = value.getSrsDimension();
        return new LineString(null, null);
    }

    public static CurveType printGMLcurve (LineString value) {
        return new CurveType();
    }

    public static LineString parseCurveSegementArrayProperty (CurveSegmentArrayPropertyType value) {
        for (JAXBElement<? extends AbstractCurveSegmentType> element : value.getAbstractCurveSegment()){
            if (element.getValue() instanceof ArcByBulgeType) {
                //AIXM-5.1_RULE-1A3EC2

            } else if (element.getValue() instanceof ArcByCenterPointType) {
                //TODO: Implement this

            } else if (element.getValue() instanceof ArcStringByBulgeType) {
                //AIXM-5.1_RULE-1A3EC1	

            } else if (element.getValue() instanceof ArcStringType) {
                //AIXM-5.1_RULE-1A3EC3

            } else if (element.getValue() instanceof ArcType) {
                //TODO: Implement this

            } else if (element.getValue() instanceof BSplineType) {
                //AIXM-5.1_RULE-1A3EC4	

            } else if (element.getValue() instanceof BezierType) {
                //AIXM-5.1_RULE-1A3EC5	

            } else if (element.getValue() instanceof CircleByCenterPointType) {
                //TODO: Implement this

            } else if (element.getValue() instanceof CircleType) {
                //TODO: Implement this

            } else if (element.getValue() instanceof ClothoidType) {
                //AIXM-5.1_RULE-1A3EC7	

            } else if (element.getValue() instanceof CubicSplineType) {
                //AIXM-5.1_RULE-1A3EC6	

            } else if (element.getValue() instanceof GeodesicStringType) {

            } else if (element.getValue() instanceof GeodesicType) {
                //TODO: Implement this

            } else if (element.getValue() instanceof LineStringSegmentType) {
                //TODO: Implement this

            } else if (element.getValue() instanceof OffsetCurveType) {
                //AIXM-5.1_RULE-1A3EC8	

            } else {
                throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
            }
        }

        return new LineString(null, null);
    }

    public static CurveSegmentArrayPropertyType printCurveSegmentArrayPropertyType (){

        return new CurveSegmentArrayPropertyType();
    }

    public static LineString parseArcByCenterPoint(ArcByCenterPointType value) {
        return new LineString(null, null);
    }

    public static ArcByCenterPointType printArcByCenterPoint (LineString value) {
        return new ArcByCenterPointType();
    }

    public static LineString parseArc(ArcType value) {
        return new LineString(null, null);
    }

    public static ArcType printArc (LineString value) {
        return new ArcType();
    }

    public static LineString parseCircleByCenterPoint(CircleByCenterPointType value) {
        return new LineString(null, null);
    }  

    public static CircleByCenterPointType printCircleByCenterPoint (LineString value) {
        return new CircleByCenterPointType();
    }

    public static LineString parseCircle(CircleType value) {
        return new LineString(null, null);
    }

    public static CircleType printCircle (LineString value) {
        return new CircleType();
    }

    public static LineString parseGeodesicString (GeodesicStringType value) {

        return new LineString(null, null);
    }

    public static GeodesicStringType printGeodesicString (LineString value) {

        return new GeodesicStringType();
    }

    public static LineString parseGeodesic (GeodesicType value) {

        return new LineString(null, null);
    }

    public static GeodesicType printGeodesic (LineString value) {

        return new GeodesicType();
    }

    public static LineString parseLineStringSegment (LineStringSegmentType value) {

        return new LineString(null, null);
    }

    public static LineStringSegmentType printLineStringSegment (LineString value) {

        return new LineStringSegmentType();
    }

    public static LineString parseDirectPositionList (DirectPositionListType value) {

        return new LineString(null, null);
    }

    public static DirectPositionListType printDirectPositionList (LineString value) {

        return new DirectPositionListType();
    }




}