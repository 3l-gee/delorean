package com.aixm.delorean.core.helper.gis;

import java.util.List;
import java.util.Random;
import java.security.spec.RSAKeyGenParameterSpec;
import java.util.ArrayList;
import java.util.HashMap;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.LineString;
import org.postgresql.shaded.com.ongres.scram.common.bouncycastle.pbkdf2.RuntimeCryptoException;

import jakarta.xml.bind.JAXBElement;
import net.postgis.jdbc.geometry.Point;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.OffsetCurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.LineStringSegmentType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.gis.type.Segment;
import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractCurveSegmentType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcByBulgeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcByCenterPointType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.LengthType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AngleType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcStringByBulgeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.BSplineType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.BezierType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CircleByCenterPointType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CircleType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ClothoidType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CubicSplineType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.ArcStringType;
public class CurveGmlHelper {

    public static List<Segment> parseGMLcurve (CurveType value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start parseGMLcurve" + new Exception().getStackTrace()[0]);
        if (value == null) {
            ConsoleLogger.log(LogLevel.FATAL, "CurveType is null", new Exception());
            return null;
        }
        

        CurveSegmentArrayPropertyType segments = value.getSegments();
        if (segments == null) {
            ConsoleLogger.log(LogLevel.FATAL, "CurveSegmentArrayPropertyType is null" + value.getClass().getName(), new Exception());
            return null;
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            ConsoleLogger.log(LogLevel.FATAL, "CurveSegmentArrayPropertyType is null" + value.getClass().getName(), new Exception());
            return null;
        }

        return parseCurveSegementArrayProperty(segments, srsName);
    }


    public static List<Segment> parseCurveSegementArrayProperty (CurveSegmentArrayPropertyType value, String srsName) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName.toString(), new Exception().getStackTrace()[0]);
        List<Segment> segment = new ArrayList<>();
        long counter = 0;

        for (JAXBElement<? extends AbstractCurveSegmentType> element : value.getAbstractCurveSegment()) {
            if (element.getValue() == null) {
                ConsoleLogger.log(LogLevel.FATAL, "element is null", new Exception().getStackTrace()[0]);
                throw new RuntimeException("element is null");

            } else if (element.getValue() instanceof ArcByBulgeType) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC2 : ArcByBulgeType is not supported", new Exception().getStackTrace()[0]);
                continue;


            } else if (element.getValue().getClass().equals(ArcByCenterPointType.class)) {
                ConsoleLogger.log(LogLevel.DEBUG, "ArcByCenterPointType");
                segment.add(parseArcByCenterPoint((ArcByCenterPointType) element.getValue(), srsName, counter));
                counter++;
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
                segment.add(parseCircleByCenterPoint((CircleByCenterPointType) element.getValue(), srsName, counter));
                counter++;

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
                segment.add(parseGeodesicString((GeodesicStringType) element.getValue(), srsName, counter));
                counter++;
                continue;

            } else if (element.getValue().getClass().equals(GeodesicType.class)) {
                ConsoleLogger.log(LogLevel.DEBUG, "GeodesicType");
                segment.add(parseGeodesicString((GeodesicType) element.getValue(), srsName, counter));
                counter++;
                continue;

            } else if (element.getValue().getClass().equals(LineStringSegmentType.class)) {
                ConsoleLogger.log(LogLevel.DEBUG, "LineStringSegmentType");
                segment.add(parseLineStringSegment((LineStringSegmentType) element.getValue(), srsName, counter));
                counter++;
                continue;

            } else if (element.getValue().getClass().equals(OffsetCurveType.class)) {
                ConsoleLogger.log(LogLevel.WARN, "AIXM-5.1_RULE-1A3EC6 : OffsetCurveType is not supported", new Exception().getStackTrace()[0]);
                continue;

            } else {
                ConsoleLogger.log(LogLevel.FATAL, "element is not supported", new Exception().getStackTrace()[0]);
                throw new RuntimeException("element is not supported");
            }
        }

        return segment;
    }

    public static CurveSegmentArrayPropertyType printCurveSegmentArrayPropertyType (){

        return new CurveSegmentArrayPropertyType();
    }

    public static Segment parseArcByCenterPoint(ArcByCenterPointType value, String srsName, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName.toString() + " counter : " + counter, new Exception().getStackTrace()[0]);
        LengthType radius = value.getRadius();
        AngleType startAngle = value.getStartAngle();
        AngleType endAngle = value.getEndAngle();
        if (radius == null || startAngle == null || endAngle == null) {
            ConsoleLogger.log(LogLevel.FATAL, "radius or startangle or endangle can't be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("radius or startangle or endangle can't be null" + value.getClass().getName());
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
            coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1), posList.getValue().get(2));
            
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "DirectPositionType is null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("DirectPositionType is null" + value.getClass().getName());
        }

        Double radius_m = UnitTransformHelper.convertDistanceToMeters(radius.getValue(), radius.getUom());
        Double startAngle_rad = UnitTransformHelper.convertAngleToBearingInRadians(startAngle.getValue(), startAngle.getUom(), actualSrsName);
        Double endAngle_rad = UnitTransformHelper.convertAngleToBearingInRadians(endAngle.getValue(), endAngle.getUom(), actualSrsName);

        ConsoleLogger.log(LogLevel.DEBUG, "radius[m]: " + radius_m + " first bearing[rad]: " + startAngle_rad + " second bearing[rad]: " + endAngle_rad);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(actualSrsName, "urn:ogc:def:crs:EPSG::4326", coordinate, radius_m, startAngle_rad, endAngle_rad);
        Segment segment = new Segment();
        segment.setLineString(lineString);
        segment.setInterpretation(Segment.Interpretation.ARCBYCENTER);
        segment.setSequence(counter);

        return segment;
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

    public static Segment parseCircleByCenterPoint(CircleByCenterPointType value, String srsName, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName.toString() + " counter : " + counter, new Exception().getStackTrace()[0]);
        LengthType radius = value.getRadius();
        AngleType startAngle = new AngleType();
        startAngle.setValue(0);
        startAngle.setUom("deg");

        AngleType endAngle = new AngleType();
        endAngle.setValue(360);
        endAngle.setUom("deg");

        if (radius == null ) {
            ConsoleLogger.log(LogLevel.FATAL, "radius can't be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("radius can't be null" + value.getClass().getName());
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
            coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1), posList.getValue().get(2));
            
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "DirectPositionType is null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("DirectPositionType is null" + value.getClass().getName());
        }

        Double radius_m = UnitTransformHelper.convertDistanceToMeters(radius.getValue(), radius.getUom());
        Double startAngle_rad = UnitTransformHelper.convertAngleToBearingInRadians(startAngle.getValue(), startAngle.getUom(), actualSrsName);
        Double endAngle_rad = UnitTransformHelper.convertAngleToBearingInRadians(endAngle.getValue(), endAngle.getUom(), actualSrsName);

        ConsoleLogger.log(LogLevel.DEBUG, "radius[m]: " + radius_m + " first bearing[rad]: " + startAngle_rad + " second bearing[rad]: " + endAngle_rad);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(actualSrsName, "urn:ogc:def:crs:EPSG::4326", coordinate, radius_m, startAngle_rad, endAngle_rad);
        Segment segment = new Segment();
        segment.setLineString(lineString);
        segment.setInterpretation(Segment.Interpretation.CIRCLEBYCENTER);
        segment.setSequence(counter);

        return segment;
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

    public static Segment parseGeodesicString (GeodesicStringType value, String srsName, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " counter : " + counter, new Exception().getStackTrace()[0]);   
        DirectPositionListType posList = value.getPosList();
        List<Object> geometricPositionGroup = value.getGeometricPositionGroup();
        
        if (posList != null) {
            String actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;
            return parseDirectPositionList(posList, actualSrsName, Segment.Interpretation.GEODESIC, counter);
        } else if (geometricPositionGroup != null) {
            return parseListOfDirectPosition(geometricPositionGroup, srsName, Segment.Interpretation.GEODESIC, counter, null);
        }

        ConsoleLogger.log(LogLevel.FATAL, "DirectPositionListType and geometricPositionGroup is null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
        throw new RuntimeException("DirectPositionListType and geometricPositionGroup is null" + value.getClass().getName());
    }

    public static GeodesicStringType printGeodesicString (List<Coordinate> value) {
        GeodesicStringType geodesicString = new GeodesicStringType();
        if (value == null) {
            throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
        }
        DirectPositionListType posList = printDirectPositionList(value);
        geodesicString.setPosList(posList);
        return geodesicString;
    }

    public static Segment parseLineStringSegment (LineStringSegmentType value, String srsName, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " counter : " + counter, new Exception().getStackTrace()[0]); 
        DirectPositionListType posList = value.getPosList();
        List<JAXBElement<?>> posOrPointPropertyOrPointRep = value.getPosOrPointPropertyOrPointRep();
        if (posList != null) {
            String actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;

            ConsoleLogger.log(LogLevel.DEBUG, "end parseLineStringSegment : " + posList.toString() + " / " + actualSrsName);
            return parseDirectPositionList(posList, actualSrsName, Segment.Interpretation.LINESTRING, counter);
        } else if (posOrPointPropertyOrPointRep != null) {

            ConsoleLogger.log(LogLevel.DEBUG, "end parseLineStringSegment : " + posOrPointPropertyOrPointRep.toString() + " / " + srsName);
            return parseListOfDirectPosition(posOrPointPropertyOrPointRep, srsName, Segment.Interpretation.LINESTRING, counter);

        }  
        ConsoleLogger.log(LogLevel.FATAL, "DirectPositionListType and posOrPointPropertyOrPointRep is null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
        throw new RuntimeException("DirectPositionListType and posOrPointPropertyOrPointRep is null" + value.getClass().getName());
    }

    public static LineStringSegmentType printLineStringSegment (LineString value) {

        return new LineStringSegmentType();
    }

    public static Segment parseDirectPositionList (DirectPositionListType value, String srsName, Segment.Interpretation interpretation, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsNam : " + srsName +  " interpretation :" + interpretation + " counter : " + counter, new Exception().getStackTrace()[0]);
        
        List<Double> posList = value.getValue();

        if (posList == null || posList.isEmpty()) {
            ConsoleLogger.log(LogLevel.FATAL, "list<Double> value is null or empty" + value.getClass().getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("list<Double> value is null or empty" + value.getClass().getName());
        }
        int srsDimension = value.getSrsDimension() != null ? value.getSrsDimension().intValue() : 2;
        List<Coordinate> coordinates = new ArrayList<>();

        for (int i = 0; i < posList.size(); i += srsDimension) {
            if (posList.get(i) == null || posList.get(i + 1) == null) {
                ConsoleLogger.log(LogLevel.FATAL, "Coordinate values cannot be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("Coordinate values cannot be null" + value.getClass().getName());
            }

            if (srsDimension == 2) {
                coordinates.add(new Coordinate(posList.get(i), posList.get(i + 1)));
            } else if (srsDimension == 3) {
                if (posList.get(i + 2) == null) {
                    ConsoleLogger.log(LogLevel.FATAL, "Coordinate values cannot be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                    throw new RuntimeException("Coordinate values cannot be null" + value.getClass().getName());
                }
                coordinates.add(new Coordinate(posList.get(i), posList.get(i + 1), posList.get(i + 2)));
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinates : " + coordinates.toString() + " srsName " + srsName + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(srsName, "urn:ogc:def:crs:EPSG::4326", coordinates);
        Segment segment = new Segment();
        segment.setLineString(lineString);
        segment.setInterpretation(interpretation);
        segment.setSequence(counter);
        return segment;
    }

    public static DirectPositionListType printDirectPositionList (List<Coordinate> value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start printDirectPositionList : " + value.toString(), new Exception().getStackTrace()[0]);

        DirectPositionListType posList = new DirectPositionListType();
        for (Coordinate coordinate : value) {
            if (coordinate == null) {
                ConsoleLogger.log(LogLevel.FATAL, "Coordinate values cannot be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("Coordinate values cannot be null" + value.getClass().getName());
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

    public static Segment parseListOfDirectPosition(List<Object> value, String srsName, Segment.Interpretation interpretation, long counter, String type) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName " + srsName + " interpretation : " + interpretation + " counter : " + counter, new Exception().getStackTrace()[0]);
    
        HashMap<Coordinate, String> coordinates = new HashMap<>();
        for (Object element : value) {
            if (element == null) {
                ConsoleLogger.log(LogLevel.FATAL, "content of geometricPositionGroup can't be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("content of geometricPositionGroup can't be null" + value.getClass().getName());
            }

            if (element.getClass().equals(DirectPositionType.class)) {
                DirectPositionType pos = (DirectPositionType) element;
                String actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
                coordinates.put(PointGmlHelper.parseDirectPositionToCoordinate(pos), actualSrsName);
            } else {
                ConsoleLogger.log(LogLevel.FATAL, "element is not supported", new Exception().getStackTrace()[0]);
                throw new RuntimeException("element is not supported");
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinates : " + coordinates.toString() + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(coordinates, "urn:ogc:def:crs:EPSG::4326");
        Segment segment = new Segment();
        segment.setLineString(lineString);
        segment.setInterpretation(interpretation);
        segment.setSequence(counter);
        return segment;
    }

    public static Segment parseListOfDirectPosition(List<JAXBElement<?>> value, String srsName, Segment.Interpretation interpretation, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName " + srsName + " interpretation : " + interpretation + " counter : " + counter, new Exception().getStackTrace()[0]);    

        HashMap<Coordinate, String> coordinates = new HashMap<>();
        for (JAXBElement<?> element : value) {
            if (element.getValue() == null) {
                ConsoleLogger.log(LogLevel.FATAL, "JAXBElement<?> values cannot be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("JAXBElement<?> values cannot be null" + value.getClass().getName());
            }

            if (element.getValue().getClass().equals(DirectPositionType.class)) {
                DirectPositionType pos = (DirectPositionType) element.getValue();
                String actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
                coordinates.put(PointGmlHelper.parseDirectPositionToCoordinate(pos), actualSrsName);
            } else {
                ConsoleLogger.log(LogLevel.FATAL, "element is not supported", new Exception().getStackTrace()[0]);
                throw new RuntimeException("element is not supported");
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinates : " + coordinates.toString() + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(coordinates, "urn:ogc:def:crs:EPSG::4326");
        Segment segment = new Segment();
        segment.setLineString(lineString);
        segment.setInterpretation(interpretation);
        segment.setSequence(counter);
        return segment;
    }




}