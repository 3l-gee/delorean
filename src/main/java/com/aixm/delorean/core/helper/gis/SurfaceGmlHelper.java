package com.aixm.delorean.core.helper.gis;

import java.util.List;
import java.util.stream.Collectors;
import java.util.Map;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;

import com.aixm.delorean.core.exception.gis.MalformedGeometryException;
import com.aixm.delorean.core.gis.type.PolygonSegment;
import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;

import javax.xml.namespace.QName;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Point;

import jakarta.xml.bind.JAXBElement;
import com.aixm.delorean.core.org.gml.v_3_2.CurveType;
import com.aixm.delorean.core.org.gml.v_3_2.GeodesicStringType;
import com.aixm.delorean.core.org.gml.v_3_2.GeodesicType;
import com.aixm.delorean.core.org.gml.v_3_2.LengthType;
import com.aixm.delorean.core.org.gml.v_3_2.LineStringSegmentType;
import com.aixm.delorean.core.org.gml.v_3_2.PolygonPatchType;
import com.aixm.delorean.core.org.gml.v_3_2.SurfaceType;
import com.aixm.delorean.core.org.gml.v_3_2.ConeType;
import com.aixm.delorean.core.org.gml.v_3_2.CubicSplineType;
import com.aixm.delorean.core.org.gml.v_3_2.CylinderType;
import com.aixm.delorean.core.org.gml.v_3_2.DirectPositionListType;
import com.aixm.delorean.core.org.gml.v_3_2.DirectPositionType;
import com.aixm.delorean.core.org.gml.v_3_2.RectangleType;
import com.aixm.delorean.core.org.gml.v_3_2.SphereType;
import com.aixm.delorean.core.org.gml.v_3_2.TriangleType;
import com.aixm.delorean.core.org.gml.v_3_2.LinearRingType;
import com.aixm.delorean.core.org.gml.v_3_2.OffsetCurveType;
import com.aixm.delorean.core.org.gml.v_3_2.RingType;
import com.aixm.delorean.core.org.gml.v_3_2.AbstractRingType;
import com.aixm.delorean.core.org.gml.v_3_2.CompositeCurveType;
import com.aixm.delorean.core.org.gml.v_3_2.LineStringType;
import com.aixm.delorean.core.org.gml.v_3_2.OrientableCurveType;
import com.aixm.delorean.core.org.gml.v_3_2.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.org.gml.v_3_2.AbstractCurveSegmentType;
import com.aixm.delorean.core.org.gml.v_3_2.AbstractCurveType;
import com.aixm.delorean.core.org.gml.v_3_2.AbstractRingPropertyType;
import com.aixm.delorean.core.org.gml.v_3_2.SurfacePatchArrayPropertyType;
import com.aixm.delorean.core.org.gml.v_3_2.AbstractSurfacePatchType;
import com.aixm.delorean.core.org.gml.v_3_2.AngleType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcByBulgeType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcByCenterPointType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcStringByBulgeType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcStringType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcType;
import com.aixm.delorean.core.org.gml.v_3_2.BSplineType;
import com.aixm.delorean.core.org.gml.v_3_2.BezierType;
import com.aixm.delorean.core.org.gml.v_3_2.CircleByCenterPointType;
import com.aixm.delorean.core.org.gml.v_3_2.CircleType;
import com.aixm.delorean.core.org.gml.v_3_2.ClothoidType;
import com.aixm.delorean.core.org.gml.v_3_2.CurvePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;

public class SurfaceGmlHelper {
    public static List<PolygonSegment> parseGMLsurfaceExterior(SurfaceType value) {
        if (value == null) {
            ConsoleLogger.log(LogLevel.WARN, "parseGMLsurface is null", new Exception().getStackTrace()[0]);
            return null;
        }

        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);

        SurfacePatchArrayPropertyType patches = value.getPatches().getValue();
        if (patches == null) {
            ConsoleLogger.log(LogLevel.FATAL, "SurfacePatchArrayPropertyType is null", new Exception().getStackTrace()[0]);
            return null;
        }
        String srsName = value.getSrsName();
        if (srsName == null) {
            ConsoleLogger.log(LogLevel.FATAL, "srsName is null", new Exception().getStackTrace()[0]);
            return null;
        }

        List<PolygonSegment> exterior = new ArrayList<PolygonSegment>();
        try {
            for (JAXBElement<? extends AbstractSurfacePatchType> patch : patches.getAbstractSurfacePatch()) {
                exterior.addAll(parseSurfacePatchArrayProperty(patch, srsName, true));
            }
        } catch (IllegalArgumentException e) {
            ConsoleLogger.log(LogLevel.FATAL, "parseSurfacePatchArrayProperty encoutered a Illegal Format at id : " + value.getXmlId(), e);
            return null;
        } catch (Exception e) {
            ConsoleLogger.log(LogLevel.FATAL, "parseSurfacePatchArrayProperty encoutered an issue at id : " + value.getXmlId(), e);
            return null;
        }

        return exterior;
    }
    public static List<PolygonSegment> parseGMLsurfaceInterior(SurfaceType value) {
        if (value == null) {
            ConsoleLogger.log(LogLevel.WARN, "parseGMLsurface is null", new Exception().getStackTrace()[0]);
            return null;
        }

        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);

        SurfacePatchArrayPropertyType patches = value.getPatches().getValue();
        if (patches == null) {
            ConsoleLogger.log(LogLevel.FATAL, "SurfacePatchArrayPropertyType is null", new Exception().getStackTrace()[0]);
            return null;
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            ConsoleLogger.log(LogLevel.FATAL, "srsName is null", new Exception().getStackTrace()[0]);
            return null;
        }

        List<PolygonSegment> interior = new ArrayList<PolygonSegment>();
        try {
            for (JAXBElement<? extends AbstractSurfacePatchType> patch : patches.getAbstractSurfacePatch()) {
                interior.addAll(parseSurfacePatchArrayProperty(patch, srsName,  false));
            }
        } catch (IllegalArgumentException e) {
            ConsoleLogger.log(LogLevel.FATAL, "parseSurfacePatchArrayProperty encoutered a Illegal Format at id : " + value.getXmlId(), e);
            return null;
        } catch (Exception e) {
            ConsoleLogger.log(LogLevel.FATAL, "parseSurfacePatchArrayProperty encoutered an issue at id : " + value.getXmlId(), e);
            return null;
        }
        return interior;
    }

    public static RingType printExteriorRing(List<PolygonSegment> value) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);
        
        // Sort the list by Part, Member, and Sequence
        RingType ring = new RingType();
        value.sort((a, b) -> {
            int partCompare = Long.compare(a.getPart(), b.getPart());
            if (partCompare != 0) return partCompare;
            int memberCompare = Long.compare(a.getMember(), b.getMember());
            if (memberCompare != 0) return memberCompare;
            return Long.compare(a.getSequence(), b.getSequence());
        });

        // Group segments by Member number
        Map<Long, List<PolygonSegment>> memberGroups = value.stream()
        .collect(Collectors.groupingBy(PolygonSegment::getMember));

        // Convert the map values to a list of lists
        List<List<PolygonSegment>> groupedSegments = new ArrayList<>(memberGroups.values());

        for (List<PolygonSegment> group : groupedSegments) {
            CurvePropertyType CurveProperty= printCurveSegmentArrayPropertyType(group);
            ring.getCurveMember().add(CurveProperty);
        }

        return ring;
    }

    public static List<RingType> printInteriorRing(List<PolygonSegment> value) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);
        
        // Sort the list by Part, Member, and Sequence
        List<RingType> rings = new ArrayList<>();
        value.sort((a, b) -> {
            int partCompare = Long.compare(a.getPart(), b.getPart());
            if (partCompare != 0) return partCompare;
            int memberCompare = Long.compare(a.getMember(), b.getMember());
            if (memberCompare != 0) return memberCompare;
            return Long.compare(a.getSequence(), b.getSequence());
        });
    
        // Group segments by Part first, then by Member
        Map<Long, Map<Long, List<PolygonSegment>>> partGroups = value.stream()
            .collect(Collectors.groupingBy(PolygonSegment::getPart, 
                Collectors.groupingBy(PolygonSegment::getMember)));
    
        // Process each group separately
        for (Map<Long, List<PolygonSegment>> memberGroups : partGroups.values()) {
            RingType ring = new RingType();
            
            for (List<PolygonSegment> group : memberGroups.values()) {
                CurvePropertyType curveProperty = printCurveSegmentArrayPropertyType(group);
                ring.getCurveMember().add(curveProperty);
            }
            
            rings.add(ring);
        }
    
        return rings;
    }
    

    public static CurveType printCurveType (PolygonSegment value) {
        return new CurveType();
    }

    public static CurvePropertyType printCurveSegmentArrayPropertyType (List<PolygonSegment> value){
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);
        CurveSegmentArrayPropertyType curveSegmentArray = new CurveSegmentArrayPropertyType();
        for (PolygonSegment segment : value) {
            if (segment.getInterpretation() == PolygonSegment.Interpretation.CURVEREF){
                CurvePropertyType curveSegment = new CurvePropertyType();
                //TODO: set title
                curveSegment.setHref(segment.getCurveRef());
                if (value.size() > 1) {
                    ConsoleLogger.log(LogLevel.WARN, "Curve ref can only have one member", new Exception().getStackTrace()[0]);
                }
                return curveSegment;
            } else if (segment.getInterpretation() == PolygonSegment.Interpretation.ARCBYCENTER) {
                ArcByCenterPointType arcByCenterPoint = printArcByCenterPoint(segment);
                JAXBElement<ArcByCenterPointType> jaxbArcByCenterPoint =  new JAXBElement<ArcByCenterPointType>(new QName("http://www.opengis.net/gml/3.2", "ArcByCenterPoint"), ArcByCenterPointType.class, arcByCenterPoint);
                curveSegmentArray.getAbstractCurveSegment().add(jaxbArcByCenterPoint);

            } else if (segment.getInterpretation() == PolygonSegment.Interpretation.GEODESIC) {
                GeodesicStringType geodesicString = printGeodesicString(segment);
                JAXBElement<GeodesicStringType> jaxbGeodesicString = new JAXBElement<GeodesicStringType>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, geodesicString);
                curveSegmentArray.getAbstractCurveSegment().add(jaxbGeodesicString);

            } else if (segment.getInterpretation() == PolygonSegment.Interpretation.LINESTRING) {
                LineStringSegmentType lineStringSegment = printLineStringSegment(segment);
                JAXBElement<LineStringSegmentType> jaxbLineStringSegment = new JAXBElement<LineStringSegmentType>(new QName("http://www.opengis.net/gml/3.2", "LineStringSegment"), LineStringSegmentType.class, lineStringSegment);
                curveSegmentArray.getAbstractCurveSegment().add(jaxbLineStringSegment);

            } else if (segment.getInterpretation() == PolygonSegment.Interpretation.CIRCLEBYCENTER) {
                CircleByCenterPointType circleByCenterPoint = printCircleByCenterPoint(segment);
                JAXBElement<CircleByCenterPointType> jaxbCircleByCenterPoint = new JAXBElement<CircleByCenterPointType>(new QName("http://www.opengis.net/gml/3.2", "CircleByCenterPoint"), CircleByCenterPointType.class, circleByCenterPoint);
                curveSegmentArray.getAbstractCurveSegment().add(jaxbCircleByCenterPoint);

            } else {
                ConsoleLogger.log(LogLevel.FATAL, "Interpretation is not supported", new Exception().getStackTrace()[0]);
                throw new RuntimeException("Interpretation is not supported");
            }
        }
        CurveType curve = new CurveType();
        curve.setSegments(curveSegmentArray);
        JAXBElement<CurveType> jaxbCurve = new JAXBElement<CurveType>(new QName("http://www.opengis.net/gml/3.2", "Curve"), CurveType.class, curve);
        CurvePropertyType CurveProperty = new CurvePropertyType();
        CurveProperty.setAbstractCurve(jaxbCurve);

        return CurveProperty;
    }

    public static ArcByCenterPointType printArcByCenterPoint (PolygonSegment value) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);
        ArcByCenterPointType arcByCenterPoint = new ArcByCenterPointType();

        Point point = value.getPoint();
        Coordinate center = point.getCoordinate();
        int srs = point.getSRID();
        Double radius = value.getRadius();
        Double startAngle = value.getStartAngle();
        Double endAngle = value.getEndAngle();
        
        // setting direct position
        DirectPositionType directPosition = PointGmlHelper.printCoordinateToDirectPosition(center);
        directPosition.setSrsName("urn:ogc:def:crs:EPSG::" + srs);
        arcByCenterPoint.setPos(directPosition);

        // setting radius
        LengthType lengthType = new LengthType();
        lengthType.setValue(radius);
        lengthType.setUom("m");
        arcByCenterPoint.setRadius(lengthType);

        // setting start angle
        AngleType angleType = new AngleType();
        angleType.setValue(UnitTransformHelper.convertAngle(startAngle, "rad", "deg"));
        angleType.setUom("deg");
        arcByCenterPoint.setStartAngle(angleType);

        // setting end angle
        AngleType angleType2 = new AngleType();
        angleType2.setValue(UnitTransformHelper.convertAngle(endAngle, "rad", "deg"));
        angleType2.setUom("deg");
        arcByCenterPoint.setEndAngle(angleType2);

        return arcByCenterPoint;
    }

    public static CircleByCenterPointType printCircleByCenterPoint (PolygonSegment value) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);
        CircleByCenterPointType circleByCenterPoint = new CircleByCenterPointType();

        Point point = value.getPoint();
        Coordinate center = point.getCoordinate();
        int srs = point.getSRID();
        Double radius = value.getRadius();
        
        // setting direct position
        DirectPositionType directPosition = PointGmlHelper.printCoordinateToDirectPosition(center);
        directPosition.setSrsName("urn:ogc:def:crs:EPSG::" + srs);
        circleByCenterPoint.setPos(directPosition);

        // setting radius
        LengthType lengthType = new LengthType();
        lengthType.setValue(radius);
        lengthType.setUom("m");
        circleByCenterPoint.setRadius(lengthType);

        return circleByCenterPoint;
    }

    public static GeodesicStringType printGeodesicString (PolygonSegment value) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);
        GeodesicStringType geodesicString = new GeodesicStringType();

        LineString line = value.getLinestring();
        int srs = line.getSRID();
        Coordinate[] coordinates = line.getCoordinates();

        // setting direct position list
        DirectPositionListType posList = printDirectPositionList(Arrays.asList(coordinates));
        posList.setSrsName("urn:ogc:def:crs:EPSG::" + srs);
        geodesicString.setPosList(posList);

        return geodesicString;
    }

    public static LineStringSegmentType printLineStringSegment (PolygonSegment value) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString(), new Exception().getStackTrace()[0]);
        LineStringSegmentType lineStringSegment = new LineStringSegmentType();

        LineString line = value.getLinestring();
        int srs = line.getSRID();
        Coordinate[] coordinates = line.getCoordinates();

        // setting direct position list
        DirectPositionListType posList = printDirectPositionList(Arrays.asList(coordinates));
        posList.setSrsName("urn:ogc:def:crs:EPSG::" + srs);
        lineStringSegment.setPosList(posList);

        return lineStringSegment;
    }

    public static List<PolygonSegment>  parseSurfacePatchArrayProperty (JAXBElement<? extends AbstractSurfacePatchType> element, String srsName, Boolean isExterior) throws IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + element.toString() + " srsName : " + srsName + " isExterior : " + isExterior, new Exception().getStackTrace()[0]);
        List<PolygonSegment> coordinates =  new ArrayList<PolygonSegment>();
        if (element.getValue().getClass().equals(ConeType.class)) {
            ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3ED3", new Exception().getStackTrace()[0]);

        } else if (element.getValue().getClass().equals(CylinderType.class)) {	
            ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3ED4", new Exception().getStackTrace()[0]);

        } else if (element.getValue().getClass().equals(PolygonPatchType.class)) {
            if (isExterior) {
                coordinates.addAll(parsePolygonPatchExterior((PolygonPatchType) element.getValue(), srsName));
            } else {
                coordinates.addAll(parsePolygonPatchInterior((PolygonPatchType) element.getValue(), srsName));
            }

        } else if (element.getValue().getClass().equals(RectangleType.class)) {
            ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3ED1", new Exception().getStackTrace()[0]);
            
        } else if (element.getValue().getClass().equals(SphereType.class)) {
            ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3ED5", new Exception().getStackTrace()[0]);
            throw new RuntimeException("AIXM-5.1_RULE-1A3ED5");
            
        } else if (element.getValue().getClass().equals(TriangleType.class)) {
            ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3ED2", new Exception().getStackTrace()[0]);
            
        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }
        return coordinates;
    }

    public static List<PolygonSegment> parsePolygonPatchExterior (PolygonPatchType value, String srsName) throws IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName, new Exception().getStackTrace()[0]);
        AbstractRingPropertyType exterior = value.getExterior();
        if (exterior == null) {
            throw new IllegalArgumentException("exterior is null");
        }
        long part = 0;
        return parseAbstractRingProperty(exterior, srsName, part);
    }

    public static List<PolygonSegment> parsePolygonPatchInterior (PolygonPatchType value, String srsName) throws IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName, new Exception().getStackTrace()[0]);
        List<AbstractRingPropertyType> interior = value.getInterior();
        List<PolygonSegment> coordinates = new ArrayList<PolygonSegment>();
        if (interior == null) {
            return new ArrayList<PolygonSegment>();
        }

        long part = 1;
        for (AbstractRingPropertyType ring : interior) {
            coordinates.addAll(parseAbstractRingProperty(ring, srsName, part));
            part++;
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

    public static List<PolygonSegment> parseAbstractRingProperty(AbstractRingPropertyType value, String srsName, long part) throws IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " part : " + part, new Exception().getStackTrace()[0]);
        JAXBElement<? extends AbstractRingType> element =  value.getAbstractRing();
        if (element.getValue().getClass().equals(LinearRingType.class)){
            ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3ED6", new Exception().getStackTrace()[0]);; 
            return null;

        } else if (element.getValue().getClass().equals(RingType.class)){
            return parseRingType((RingType) element.getValue(), srsName, part);

        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }
    }

    public static List<PolygonSegment> parseRingType(RingType value, String srsName, long part) throws IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " counter : " + part, new Exception().getStackTrace()[0]);
        List<PolygonSegment> coordinates = new ArrayList<PolygonSegment>();
        List<CurvePropertyType> curveMember = value.getCurveMember();
        if (curveMember == null) {
            return new ArrayList<PolygonSegment>();
        }

        long member = 0;
        for (CurvePropertyType curve : curveMember) {
            coordinates.addAll(parseCurveProperty(curve, srsName, part, member));
            member++;
        }
        
        return coordinates;
    }
    
    public static RingType printRingType(List<Coordinate> value){
        RingType ringType = new RingType();
        return ringType;
    }

    public static List<PolygonSegment> parseCurveProperty(CurvePropertyType value, String srsName, long part, long member) throws IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " part : " + part + " member : " + member, new Exception().getStackTrace()[0]);
        List<PolygonSegment> coordinates = new ArrayList<PolygonSegment>();
        JAXBElement<? extends AbstractCurveType> element =  value.getAbstractCurve();
        if (element == null) {
            String href = value.getHref();
            if (href == null) {
                return new ArrayList<PolygonSegment>();
            } else {
                PolygonSegment polygonSegment = new PolygonSegment();
                polygonSegment.setCurveRef(href);
                polygonSegment.setPart(0);
                polygonSegment.setMember(member);
                polygonSegment.setSequence(0);
                polygonSegment.setInterpretation(PolygonSegment.Interpretation.CURVEREF);
                coordinates.add(polygonSegment);
                return coordinates;
            }
        }

        if (element.getValue() instanceof com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType) {

        } else if (element.getValue().getClass().equals(ElevatedCurveType.class)){
            ConsoleLogger.log(LogLevel.WARN, "ElevatedCurveType is not supported", new Exception().getStackTrace()[0]);
            //TODO is this allowed in AIXM?

        } else if (element.getValue().getClass().equals(CompositeCurveType.class)){
            ConsoleLogger.log(LogLevel.WARN, "CompositeCurveType is not supported", new Exception().getStackTrace()[0]);
            //TODO is this allowed in AIXM?

        } else if (element.getValue().getClass().equals(com.aixm.delorean.core.org.gml.v_3_2.CurveType.class)){
            CurveType curveType = (CurveType) element.getValue();
            if (curveType == null || curveType.getSegments() == null) {
                return coordinates;
            } else {
                coordinates.addAll(parseCurveSegementArrayProperty(curveType.getSegments(), curveType.getXmlId(), srsName, part, member));
            }
        } else if (element.getValue().getClass().equals(LineStringType.class)){
            ConsoleLogger.log(LogLevel.WARN, "LineStringType is not supported", new Exception().getStackTrace()[0]);
            //TODO is this allowed in AIXM?
            
        } else if (element.getValue().getClass().equals(LinearRingType.class)){
            ConsoleLogger.log(LogLevel.WARN, "LinearRingType is not supported", new Exception().getStackTrace()[0]);
            //TODO is this allowed in AIXM?
            
        } else if (element.getValue().getClass().equals(OrientableCurveType.class)){
            ConsoleLogger.log(LogLevel.WARN, "OrientableCurveType is not supported", new Exception().getStackTrace()[0]);
            //TODO is this allowed in AIXM?
            
        } else if (element.getValue().getClass().equals(RingType.class)){
            ConsoleLogger.log(LogLevel.WARN, "RingType is not supported", new Exception().getStackTrace()[0]);
            //TODO is this allowed in AIXM?
            
        } else {
            throw new IllegalArgumentException("Unsupported type " + element.getValue().getClass().getName());
        }
        return coordinates;
    }

    public static List<PolygonSegment> parseCurveSegementArrayProperty (CurveSegmentArrayPropertyType value, String xml_id, String srsName, long part, long member) throws IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + "xml_id : " + xml_id + " srsName : " + srsName + " part : " + part + " member : " + member, new Exception().getStackTrace()[0]);
        List<PolygonSegment> segment = new ArrayList<>();
        long counter = 0;

        for (JAXBElement<? extends AbstractCurveSegmentType> element : value.getAbstractCurveSegment()) {
            if (element.getValue() == null) {
                throw new IllegalArgumentException("element is null");

            } else if (element.getValue() instanceof ArcByBulgeType) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC2 : ArcByBulgeType is not supported", new Exception().getStackTrace()[0]);
                continue;


            } else if (element.getValue().getClass().equals(ArcByCenterPointType.class)) {
                ConsoleLogger.log(LogLevel.DEBUG, "ArcByCenterPointType");
                try {
                    segment.add(parseArcByCenterPoint((ArcByCenterPointType) element.getValue(), xml_id, srsName, part, member, counter));
                    counter++;
                } catch (MalformedGeometryException e) {
                    ConsoleLogger.log(LogLevel.WARN, "parseArcByCenterPoint encoutered a Malformed Geometry at id : " + xml_id, e.getStackTrace()[0]);    
                }
                continue;

            } else if (element.getValue().getClass().equals(ArcStringByBulgeType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC1  : ArcStringByBulgeType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else if (element.getValue().getClass().equals(ArcStringType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC3 : ArcStringType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else if (element.getValue().getClass().equals(ArcType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC3 : ArcStringType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else if (element.getValue().getClass().equals(BSplineType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC4 : BSplineType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else if (element.getValue().getClass().equals(BezierType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC5 : BezierType is not supported", new Exception().getStackTrace()[0]);
                continue;
                
            } else if (element.getValue().getClass().equals(CircleByCenterPointType.class)) {
                try {
                    segment.add(parseCircleByCenterPoint((CircleByCenterPointType) element.getValue(), xml_id, srsName, part, member, counter));
                    counter++;
                } catch (MalformedGeometryException e) {
                    ConsoleLogger.log(LogLevel.WARN, "parseArcByCenterPoint encoutered a Malformed Geometry at id : "  + xml_id, e.getStackTrace()[0]);    
                }
                continue;

            } else if (element.getValue().getClass().equals(CircleType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC3 : ArcStringType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else if (element.getValue().getClass().equals(ClothoidType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC7 : ClothoidType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else if (element.getValue().getClass().equals(CubicSplineType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC9 : CubicSplineType is not supported", new Exception().getStackTrace()[0]);
                continue;   

            } else if (element.getValue().getClass().equals(GeodesicStringType.class)) {
                ConsoleLogger.log(LogLevel.DEBUG, "GeodesicStringType");
                try {
                    segment.add(parseGeodesicString((GeodesicStringType) element.getValue(), xml_id, srsName, part, member, counter));
                    counter++;
                } catch (MalformedGeometryException e) {
                    ConsoleLogger.log(LogLevel.WARN, "parseArcByCenterPoint encoutered a Malformed Geometry at id : "  + xml_id, e.getStackTrace()[0]);    
                }
                continue;

            } else if (element.getValue().getClass().equals(GeodesicType.class)) {
                ConsoleLogger.log(LogLevel.DEBUG, "GeodesicType");
                try { 
                    segment.add(parseGeodesicString((GeodesicType) element.getValue(), xml_id, srsName, part, member, counter));
                    counter++;
                } catch (MalformedGeometryException e) {
                    ConsoleLogger.log(LogLevel.WARN, "parseArcByCenterPoint encoutered a Malformed Geometry at id : "  + xml_id, e.getStackTrace()[0]);    
                }
                continue;

            } else if (element.getValue().getClass().equals(LineStringSegmentType.class)) {
                ConsoleLogger.log(LogLevel.DEBUG, "LineStringSegmentType");
                try {
                    segment.add(parseLineStringSegment((LineStringSegmentType) element.getValue(), xml_id, srsName, part, member, counter));
                    counter++;
                } catch (MalformedGeometryException e) {
                    ConsoleLogger.log(LogLevel.WARN, "parseArcByCenterPoint encoutered a Malformed Geometry at id : "  + xml_id, e.getStackTrace()[0]);    
                }
                continue;

            } else if (element.getValue().getClass().equals(OffsetCurveType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC6 : OffsetCurveType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else {
                throw new IllegalArgumentException("element is not supported" + element.getValue().getClass().getName());
            }
        }

        return segment;
    }

    public static CurveSegmentArrayPropertyType printCurveSegmentArrayPropertyType (){

        return new CurveSegmentArrayPropertyType();
    }

    public static PolygonSegment parseArcByCenterPoint(ArcByCenterPointType value, String xml_id,  String srsName, long part, long member, long counter) throws MalformedGeometryException, IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " id : " + xml_id + " srsName : " + srsName.toString() + " part : " + part + " member : " + member + " counter : " + counter, new Exception().getStackTrace()[0]);
        LengthType radius = value.getRadius();
        AngleType startAngle = value.getStartAngle();
        AngleType endAngle = value.getEndAngle();
        if (radius == null || startAngle == null || endAngle == null) {
            throw new IllegalArgumentException("radius or startangle or endangle can't be null");
        }
        DirectPositionType pos = value.getPos();
        DirectPositionListType posList = value.getPosList();
        Coordinate coordinate = null;
        String actualSrsName = null;
        if (pos != null) {
            actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
            coordinate = PointGmlHelper.parseDirectPositionToCoordinate(pos);
            
        } else if (posList != null) {
            actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;

            if (posList.getValue().size() == 2) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1));
            } else if (posList.getValue().size() == 3) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1), posList.getValue().get(2));
            } else {
                throw new IllegalArgumentException("Invalid number of coordinates" + posList.getValue().size());
            }
            
        } else {
            throw new IllegalArgumentException("DirectPositionType is null");
        }

        Double radius_m = UnitTransformHelper.convertDistanceToMeters(radius.getValue(), radius.getUom());
        Double startAngle_rad = UnitTransformHelper.convertAngleToBearing(startAngle.getValue(), startAngle.getUom(), "rad", actualSrsName);
        Double endAngle_rad = UnitTransformHelper.convertAngleToBearing(endAngle.getValue(), endAngle.getUom(), "rad", actualSrsName);

        ConsoleLogger.log(LogLevel.DEBUG, "radius[m]: " + radius_m + " first bearing[rad]: " + startAngle_rad + " second bearing[rad]: " + endAngle_rad);

        Point point = CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", coordinate);
        PolygonSegment polygonSegment = new PolygonSegment();
        polygonSegment.setPoint(point);
        polygonSegment.setXmlId(xml_id);
        polygonSegment.setRadius(radius_m);
        polygonSegment.setStartAngle(startAngle_rad);
        polygonSegment.setEndAngle(endAngle_rad);
        polygonSegment.setInterpretation(PolygonSegment.Interpretation.ARCBYCENTER);
        polygonSegment.setPart(part);
        polygonSegment.setMember(member);
        polygonSegment.setSequence(counter);

        return polygonSegment;
    }



    public static ArcByCenterPointType printArcByCenterPoint (LineString value) {
        return new ArcByCenterPointType();
    }

    //TODO: to implement
    public static List<Coordinate> parseArc(ArcType value) {
        return new ArrayList<Coordinate>();
    }

    public static ArcType printArc (LineString value) {
        return new ArcType();
    }

public static PolygonSegment parseCircleByCenterPoint(CircleByCenterPointType value, String xml_id, String srsName, long part, long member, long counter) throws MalformedGeometryException, IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " id : " + xml_id + " srsName : " + srsName.toString() + " part : " + part + " member : " + member + " counter : " + counter, new Exception().getStackTrace()[0]);
        LengthType radius = value.getRadius();

        if (radius == null ) {
            throw new IllegalArgumentException("radius can't be null");
        }
        DirectPositionType pos = value.getPos();
        DirectPositionListType posList = value.getPosList();
        Coordinate coordinate = null;
        String actualSrsName = null;
        if (pos != null) {
            actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
            coordinate = PointGmlHelper.parseDirectPositionToCoordinate(pos);
            
        } else if (posList != null) {
            actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;

            if (posList.getValue().size() == 2) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1));
            } else if (posList.getValue().size() == 3) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1), posList.getValue().get(2));
            } else {
                throw new IllegalArgumentException("Invalid number of coordinates" + posList.getValue().size());
            }
            
        } else {
            throw new IllegalArgumentException("DirectPositionType is null");
        }

        Double radius_m = UnitTransformHelper.convertDistanceToMeters(radius.getValue(), radius.getUom());

        ConsoleLogger.log(LogLevel.DEBUG, "radius[m]: " + radius_m);
        Point point = CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", coordinate);
        PolygonSegment polygonSegment = new PolygonSegment();
        polygonSegment.setPoint(point);
        polygonSegment.setXmlId(xml_id);
        polygonSegment.setRadius(radius_m);
        polygonSegment.setInterpretation(PolygonSegment.Interpretation.CIRCLEBYCENTER);
        polygonSegment.setPart(part);
        polygonSegment.setMember(member);
        polygonSegment.setSequence(counter);

        return polygonSegment;
    }  

    public static CircleByCenterPointType printCircleByCenterPoint (LineString value) {
        return new CircleByCenterPointType();
    }

    //TODO: to implement
    public static List<Coordinate> parseCircle(CircleType value) {
        return new ArrayList<Coordinate>();
    }

    public static CircleType printCircle (LineString value) {
        return new CircleType();
    }

    public static PolygonSegment parseGeodesicString (GeodesicStringType value, String xml_id, String srsName, long part, long member, long counter) throws MalformedGeometryException, IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " id : " + xml_id + " srsName : " + srsName + " part : " + part + " member : " + member + " counter : " + counter, new Exception().getStackTrace()[0]);   
        DirectPositionListType posList = value.getPosList();
        List<Object> geometricPositionGroup = value.getGeometricPositionGroup();
        
        if (posList != null) {
            String actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;
            return parseDirectPositionList(posList, xml_id, actualSrsName, PolygonSegment.Interpretation.GEODESIC, part, member, counter);
        } else if (geometricPositionGroup != null) {
            return parseListOfDirectPosition(geometricPositionGroup, xml_id, srsName, PolygonSegment.Interpretation.GEODESIC, part, member, counter, null);
        }
        throw new IllegalArgumentException("DirectPositionListType and geometricPositionGroup is null");
    }

    public static GeodesicStringType printGeodesicString (List<Coordinate> value) {
        GeodesicStringType geodesicString = new GeodesicStringType();
        if (value == null) {
            throw new IllegalArgumentException("Coordinate values cannot be null");
        }
        DirectPositionListType posList = printDirectPositionList(value);
        geodesicString.setPosList(posList);
        return geodesicString;
    }

    public static PolygonSegment parseLineStringSegment (LineStringSegmentType value, String xml_id, String srsName, long part, long member, long counter) throws MalformedGeometryException, IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " part : " + part + " member : " + member + " counter : " + counter, new Exception().getStackTrace()[0]); 
        DirectPositionListType posList = value.getPosList();
        List<JAXBElement<?>> posOrPointPropertyOrPointRep = value.getPosOrPointPropertyOrPointRep();
        if (posList != null) {
            String actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;

            ConsoleLogger.log(LogLevel.DEBUG, "end parseLineStringSegment : " + posList.toString() + " / " + actualSrsName);
            return parseDirectPositionList(posList, xml_id, actualSrsName, PolygonSegment.Interpretation.LINESTRING, part, member, counter);
        } else if (posOrPointPropertyOrPointRep != null) {

            ConsoleLogger.log(LogLevel.DEBUG, "end parseLineStringSegment : " + posOrPointPropertyOrPointRep.toString() + " / " + srsName);
            return parseListOfDirectPosition(posOrPointPropertyOrPointRep, xml_id, srsName, PolygonSegment.Interpretation.LINESTRING, part, member, counter);

        }  
        throw new IllegalArgumentException("DirectPositionListType and posOrPointPropertyOrPointRep is null" + value.getClass().getName());
    }

    public static LineStringSegmentType printLineStringSegment (LineString value) {

        return new LineStringSegmentType();
    }

    public static PolygonSegment parseDirectPositionList (DirectPositionListType value, String xml_id, String srsName, PolygonSegment.Interpretation interpretation, long part, long member, long counter) throws MalformedGeometryException, IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " id : " + xml_id + " srsNam : " + srsName +  " interpretation :" + interpretation + " part : " + part + " member : " + member + " counter : " + counter, new Exception().getStackTrace()[0]);
        
        List<Double> posList = value.getValue();

        if (posList == null || posList.isEmpty()) {
            throw new IllegalArgumentException("list<Double> value is null or empty");
        }
        int srsDimension = value.getSrsDimension() != null ? value.getSrsDimension().intValue() : 2;
        List<Coordinate> coordinates = new ArrayList<>();

        for (int i = 0; i < posList.size(); i += srsDimension) {
            if (posList.get(i) == null || posList.get(i + 1) == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null");
            }

            if (srsDimension == 2) {
                coordinates.add(new Coordinate(posList.get(i), posList.get(i + 1)));
            } else if (srsDimension == 3) {
                if (posList.get(i + 2) == null) {
                    throw new IllegalArgumentException("Coordinate values cannot be null");
                }
                coordinates.add(new Coordinate(posList.get(i), posList.get(i + 1), posList.get(i + 2)));
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinates : " + coordinates.toString() + " srsName " + srsName + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(srsName, "urn:ogc:def:crs:EPSG::4326", coordinates);
        PolygonSegment polygonSegment = new PolygonSegment();
        polygonSegment.setLinestring(lineString);
        polygonSegment.setXmlId(xml_id);
        polygonSegment.setInterpretation(interpretation);
        polygonSegment.setPart(part);
        polygonSegment.setMember(member);
        polygonSegment.setSequence(counter);

        return polygonSegment;
    }

    public static DirectPositionListType printDirectPositionList (List<Coordinate> value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start printDirectPositionList : " + value.toString(), new Exception().getStackTrace()[0]);

        DirectPositionListType posList = new DirectPositionListType();
        for (Coordinate coordinate : value) {
            if (coordinate == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null");
            }

            //Posgis does latitute, longitude, altitude in that order
            //GML expects longitude, latitude,altitude in that order
            posList.getValue().add(coordinate.getY());
            posList.getValue().add(coordinate.getX());
            if (!Double.isNaN(coordinate.getZ())) {
                posList.getValue().add(coordinate.getZ());
            }
        }

        return posList;
        }

    public static PolygonSegment parseListOfDirectPosition(List<Object> value, String xml_id, String srsName, PolygonSegment.Interpretation interpretation, long part, long member, long counter, String type) throws MalformedGeometryException, IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " id : " + xml_id + " srsName " + srsName + " interpretation : " + interpretation + " part : " + part + " member : " + member + " counter : " + counter, new Exception().getStackTrace()[0]);
    
        LinkedHashMap<Integer, Coordinate> coordinatesMap = new LinkedHashMap<>();
        LinkedHashMap<Integer, String> srsNameMap = new LinkedHashMap<>();
        for (Object element : value) {
            if (element == null) {
                throw new IllegalArgumentException("content of geometricPositionGroup can't be null" );
            }

            if (element.getClass().equals(DirectPositionType.class)) {
                DirectPositionType pos = (DirectPositionType) element;
                String actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
                coordinatesMap.put(value.indexOf(element), PointGmlHelper.parseDirectPositionToCoordinate(pos));
                srsNameMap.put(value.indexOf(element), actualSrsName);
            } else {
                throw new IllegalArgumentException("Unsupported type " + element.getClass().getName());
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinates : " + coordinatesMap.toString() + " srsNameMap : " + srsNameMap.toString() + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(coordinatesMap, srsNameMap, "urn:ogc:def:crs:EPSG::4326");
        PolygonSegment polygonSegment = new PolygonSegment();
        polygonSegment.setLinestring(lineString);
        polygonSegment.setXmlId(xml_id);
        polygonSegment.setInterpretation(interpretation);
        polygonSegment.setPart(part);
        polygonSegment.setMember(member);
        polygonSegment.setSequence(counter);
        return polygonSegment;
    }

    public static PolygonSegment parseListOfDirectPosition(List<JAXBElement<?>> value, String xml_id, String srsName, PolygonSegment.Interpretation interpretation, long part, long member, long counter) throws MalformedGeometryException, IllegalArgumentException {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " id : " + xml_id + " srsName " + srsName + " interpretation : " + interpretation + " part : " + part + " member : " + member + " counter : " + counter, new Exception().getStackTrace()[0]);
        
        LinkedHashMap<Integer, Coordinate> coordinatesMap = new LinkedHashMap<>();
        LinkedHashMap<Integer, String> srsNameMap = new LinkedHashMap<>();
        for (JAXBElement<?> element : value) {
            if (element.getValue() == null) {
                throw new IllegalArgumentException("JAXBElement<?> values cannot be null");
            }

            if (element.getValue().getClass().equals(DirectPositionType.class)) {
                DirectPositionType pos = (DirectPositionType) element.getValue();
                String actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
                coordinatesMap.put(value.indexOf(element), PointGmlHelper.parseDirectPositionToCoordinate(pos));
                srsNameMap.put(value.indexOf(element), actualSrsName);
            } else {
                throw new IllegalArgumentException("element is not supported");
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinatesMap : " + coordinatesMap.toString() + " srsNameMap : " + srsNameMap.toString() + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(coordinatesMap, srsNameMap, "urn:ogc:def:crs:EPSG::4326");
        PolygonSegment polygonSegment = new PolygonSegment();
        polygonSegment.setLinestring(lineString);
        polygonSegment.setXmlId(xml_id);
        polygonSegment.setInterpretation(interpretation);
        polygonSegment.setPart(part);
        polygonSegment.setMember(member);
        polygonSegment.setSequence(counter);
        return polygonSegment;
    }

}
