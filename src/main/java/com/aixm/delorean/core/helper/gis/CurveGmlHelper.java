package com.aixm.delorean.core.helper.gis;

import java.util.List;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Point;     

import jakarta.xml.bind.JAXBElement;

import com.aixm.delorean.core.org.gml.v_3_2.CurveType;
import com.aixm.delorean.core.org.gml.v_3_2.DirectPositionListType;
import com.aixm.delorean.core.org.gml.v_3_2.DirectPositionType;
import com.aixm.delorean.core.org.gml.v_3_2.GeodesicStringType;
import com.aixm.delorean.core.org.gml.v_3_2.OffsetCurveType;
import com.aixm.delorean.core.org.gml.v_3_2.GeodesicType;
import com.aixm.delorean.core.org.gml.v_3_2.LineStringSegmentType;
import com.aixm.delorean.core.org.gml.v_3_2.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.gis.type.LinestringSegment;
import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;
import com.aixm.delorean.core.org.gml.v_3_2.AbstractCurveSegmentType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcByBulgeType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcByCenterPointType;
import com.aixm.delorean.core.org.gml.v_3_2.LengthType;
import com.aixm.delorean.core.org.gml.v_3_2.AngleType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcStringByBulgeType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcType;
import com.aixm.delorean.core.org.gml.v_3_2.BSplineType;
import com.aixm.delorean.core.org.gml.v_3_2.BezierType;
import com.aixm.delorean.core.org.gml.v_3_2.CircleByCenterPointType;
import com.aixm.delorean.core.org.gml.v_3_2.CircleType;
import com.aixm.delorean.core.org.gml.v_3_2.ClothoidType;
import com.aixm.delorean.core.org.gml.v_3_2.CubicSplineType;
import com.aixm.delorean.core.org.gml.v_3_2.ArcStringType;
public class CurveGmlHelper {

    public static List<LinestringSegment> parseGMLcurve (CurveType value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start parseGMLcurve" + new Exception().getStackTrace()[0]);
        if (value == null) {
            ConsoleLogger.log(LogLevel.FATAL, "CurveType is null", new Exception());
            return null;
        }
        

        CurveSegmentArrayPropertyType segments = value.getSegments();
        if (segments == null) {
            ConsoleLogger.log(LogLevel.FATAL, "CurveSegmentArrayPropertyType is null" + value.getClass().getName() + " id : " + value.getXmlId(), new Exception());
            return null;
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            ConsoleLogger.log(LogLevel.FATAL, "CurveSegmentArrayPropertyType is null" + value.getClass().getName() + " id : " + value.getXmlId(), new Exception());
            return null;
        }
        try {
            return parseCurveSegementArrayProperty(segments, srsName);
        } catch (Exception e) {
            ConsoleLogger.log(LogLevel.FATAL, "Error parsing CurveSegmentArrayPropertyType" + value.getClass().getName() + " id : " + value.getXmlId(), e);
            return null;
        }
    }


    public static List<LinestringSegment> parseCurveSegementArrayProperty (CurveSegmentArrayPropertyType value, String srsName) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName.toString(), new Exception().getStackTrace()[0]);
        List<LinestringSegment> segment = new ArrayList<>();
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

    public static LinestringSegment parseArcByCenterPoint(ArcByCenterPointType value, String srsName, long counter) {
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

            if (posList.getValue().size() == 2) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1));
            } else if (posList.getValue().size() == 3) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1), posList.getValue().get(2));
            } else {
                ConsoleLogger.log(LogLevel.FATAL, "Invalid number of coordinates" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("Invalid number of coordinates" + value.getClass().getName());
            }
            
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "DirectPositionType is null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("DirectPositionType is null" + value.getClass().getName());
        }

        Double radius_m = UnitTransformHelper.convertDistanceToMeters(radius.getValue(), radius.getUom());
        Double startAngle_rad = UnitTransformHelper.convertAngleToBearingInRadians(startAngle.getValue(), startAngle.getUom(), actualSrsName);
        Double endAngle_rad = UnitTransformHelper.convertAngleToBearingInRadians(endAngle.getValue(), endAngle.getUom(), actualSrsName);

        ConsoleLogger.log(LogLevel.DEBUG, "radius[m]: " + radius_m + " first bearing[rad]: " + startAngle_rad + " second bearing[rad]: " + endAngle_rad);

        Point point = CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", coordinate);
        LinestringSegment linestringSegment = new LinestringSegment();
        linestringSegment.setPoint(point);
        linestringSegment.setRadius(radius_m);
        linestringSegment.setStartAngle(startAngle_rad);
        linestringSegment.setEndAngle(endAngle_rad);
        linestringSegment.setInterpretation(LinestringSegment.Interpretation.ARCBYCENTER);
        linestringSegment.setSequence(counter);

        return linestringSegment;
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

    public static LinestringSegment parseCircleByCenterPoint(CircleByCenterPointType value, String srsName, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName.toString() + " counter : " + counter, new Exception().getStackTrace()[0]);
        LengthType radius = value.getRadius();

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

            if (posList.getValue().size() == 2) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1));
            } else if (posList.getValue().size() == 3) {
                coordinate = new Coordinate(posList.getValue().get(0), posList.getValue().get(1), posList.getValue().get(2));
            } else {
                ConsoleLogger.log(LogLevel.FATAL, "Invalid number of coordinates" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("Invalid number of coordinates" + value.getClass().getName());
            }
            
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "DirectPositionType is null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException("DirectPositionType is null" + value.getClass().getName());
        }

        Double radius_m = UnitTransformHelper.convertDistanceToMeters(radius.getValue(), radius.getUom());

        ConsoleLogger.log(LogLevel.DEBUG, "radius[m]: " + radius_m);
        Point point = CoordinateTransformeHelper.transformToPoint(actualSrsName, "urn:ogc:def:crs:EPSG::4326", coordinate);
        LinestringSegment linestringSegment = new LinestringSegment();
        linestringSegment.setPoint(point);
        linestringSegment.setRadius(radius_m);
        linestringSegment.setInterpretation(LinestringSegment.Interpretation.CIRCLEBYCENTER);
        linestringSegment.setSequence(counter);

        return linestringSegment;
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

    public static LinestringSegment parseGeodesicString (GeodesicStringType value, String srsName, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " counter : " + counter, new Exception().getStackTrace()[0]);   
        DirectPositionListType posList = value.getPosList();
        List<Object> geometricPositionGroup = value.getGeometricPositionGroup();
        
        if (posList != null) {
            String actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;
            return parseDirectPositionList(posList, actualSrsName, LinestringSegment.Interpretation.GEODESIC, counter);
        } else if (geometricPositionGroup != null) {
            return parseListOfDirectPosition(geometricPositionGroup, srsName, LinestringSegment.Interpretation.GEODESIC, counter, null);
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

    public static LinestringSegment parseLineStringSegment (LineStringSegmentType value, String srsName, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName : " + srsName + " counter : " + counter, new Exception().getStackTrace()[0]); 
        DirectPositionListType posList = value.getPosList();
        List<JAXBElement<?>> posOrPointPropertyOrPointRep = value.getPosOrPointPropertyOrPointRep();
        if (posList != null) {
            String actualSrsName = posList.getSrsName() != null ? posList.getSrsName() : srsName;

            ConsoleLogger.log(LogLevel.DEBUG, "end parseLineStringSegment : " + posList.toString() + " / " + actualSrsName);
            return parseDirectPositionList(posList, actualSrsName, LinestringSegment.Interpretation.LINESTRING, counter);
        } else if (posOrPointPropertyOrPointRep != null) {

            ConsoleLogger.log(LogLevel.DEBUG, "end parseLineStringSegment : " + posOrPointPropertyOrPointRep.toString() + " / " + srsName);
            return parseListOfDirectPosition(posOrPointPropertyOrPointRep, srsName, LinestringSegment.Interpretation.LINESTRING, counter);

        }  
        ConsoleLogger.log(LogLevel.FATAL, "DirectPositionListType and posOrPointPropertyOrPointRep is null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
        throw new RuntimeException("DirectPositionListType and posOrPointPropertyOrPointRep is null" + value.getClass().getName());
    }

    public static LineStringSegmentType printLineStringSegment (LineString value) {

        return new LineStringSegmentType();
    }

    public static LinestringSegment parseDirectPositionList (DirectPositionListType value, String srsName, LinestringSegment.Interpretation interpretation, long counter) {
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
        LinestringSegment linestringSegment = new LinestringSegment();
        linestringSegment.setLinestring(lineString);
        linestringSegment.setInterpretation(interpretation);
        linestringSegment.setSequence(counter);
        return linestringSegment;
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

    public static LinestringSegment parseListOfDirectPosition(List<Object> value, String srsName, LinestringSegment.Interpretation interpretation, long counter, String type) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName " + srsName + " interpretation : " + interpretation + " counter : " + counter, new Exception().getStackTrace()[0]);
    
        LinkedHashMap<Integer, Coordinate> coordinatesMap = new LinkedHashMap<>();
        LinkedHashMap<Integer, String> srsNameMap = new LinkedHashMap<>();
        for (Object element : value) {
            if (element == null) {
                ConsoleLogger.log(LogLevel.FATAL, "content of geometricPositionGroup can't be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("content of geometricPositionGroup can't be null" + value.getClass().getName());
            }

            if (element.getClass().equals(DirectPositionType.class)) {
                DirectPositionType pos = (DirectPositionType) element;
                String actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
                coordinatesMap.put(value.indexOf(element), PointGmlHelper.parseDirectPositionToCoordinate(pos));
                srsNameMap.put(value.indexOf(element), actualSrsName);
            } else {
                ConsoleLogger.log(LogLevel.FATAL, "element is not supported", new Exception().getStackTrace()[0]);
                throw new RuntimeException("element is not supported");
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinates : " + coordinatesMap.toString() + " srsNameMap : " + srsNameMap.toString() + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(coordinatesMap, srsNameMap, "urn:ogc:def:crs:EPSG::4326");
        LinestringSegment linestringSegment = new LinestringSegment();
        linestringSegment.setLinestring(lineString);
        linestringSegment.setInterpretation(interpretation);
        linestringSegment.setSequence(counter);
        return linestringSegment;
    }

    public static LinestringSegment parseListOfDirectPosition(List<JAXBElement<?>> value, String srsName, LinestringSegment.Interpretation interpretation, long counter) {
        ConsoleLogger.log(LogLevel.DEBUG, "value : " + value.toString() + " srsName " + srsName + " interpretation : " + interpretation + " counter : " + counter, new Exception().getStackTrace()[0]);    

        LinkedHashMap<Integer, Coordinate> coordinatesMap = new LinkedHashMap<>();
        LinkedHashMap<Integer, String> srsNameMap = new LinkedHashMap<>();
        for (JAXBElement<?> element : value) {
            if (element.getValue() == null) {
                ConsoleLogger.log(LogLevel.FATAL, "JAXBElement<?> values cannot be null" + value.getClass().getName(), new Exception().getStackTrace()[0]);
                throw new RuntimeException("JAXBElement<?> values cannot be null" + value.getClass().getName());
            }

            if (element.getValue().getClass().equals(DirectPositionType.class)) {
                DirectPositionType pos = (DirectPositionType) element.getValue();
                String actualSrsName = pos.getSrsName() != null ? pos.getSrsName() : srsName;
                coordinatesMap.put(value.indexOf(element), PointGmlHelper.parseDirectPositionToCoordinate(pos));
                srsNameMap.put(value.indexOf(element), actualSrsName);
            } else {
                ConsoleLogger.log(LogLevel.FATAL, "element is not supported", new Exception().getStackTrace()[0]);
                throw new RuntimeException("element is not supported");
            }
        }

        ConsoleLogger.log(LogLevel.DEBUG, "coordinates : " + coordinatesMap.toString() + " srsNameMap : " + srsNameMap.toString() + " interpretation : " + interpretation + " counter : " + counter);

        LineString lineString = CoordinateTransformeHelper.transformToLineString(coordinatesMap, srsNameMap,  "urn:ogc:def:crs:EPSG::4326");
        LinestringSegment linestringSegment = new LinestringSegment();
        linestringSegment.setLinestring(lineString);
        linestringSegment.setInterpretation(interpretation);
        linestringSegment.setSequence(counter);
        return linestringSegment;
    }
}