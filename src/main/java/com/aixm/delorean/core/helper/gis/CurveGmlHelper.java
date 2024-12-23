package com.aixm.delorean.core.helper.gis;

import java.util.List;
import java.util.ArrayList;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.LineString;

import jakarta.xml.bind.JAXBElement;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionListType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.OffsetCurveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.LineStringSegmentType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractCurveSegmentType;
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
public class CurveGmlHelper {

    public static LineString parseGMLcurve (CurveType value) {
        if (value == null) {
            return null;
        }

        CurveSegmentArrayPropertyType segments = value.getSegments();
        if (segments == null) {
            throw new IllegalArgumentException("CurveSegmentArrayPropertyType is null" + value.getClass().getName());
        }

        String srsName = value.getSrsName();
        if (srsName == null) {
            throw new IllegalArgumentException("srsName is null" + value.getClass().getName());
        }

        // BigInteger srsDimension = value.getSrsDimension();
        List<Coordinate> coordinates = parseCurveSegementArrayProperty(segments);

        return CoordinateTransformeHelper.transformToLineString(srsName, "urn:ogc:def:crs:EPSG::4326", coordinates);
    }


    public static List<Coordinate> parseCurveSegementArrayProperty (CurveSegmentArrayPropertyType value){
        List<Coordinate> coordinates = new ArrayList<>();
        Class<?> segmentType = null;

        for (JAXBElement<? extends AbstractCurveSegmentType> element : value.getAbstractCurveSegment()) {
            if (element.getValue() == null) {
                throw new IllegalArgumentException("AbstractCurveSegmentType is null" + value.getClass().getName());
    
            } else {
                if (segmentType == null) {
                    segmentType = element.getValue().getClass();
                } else if (!segmentType.equals(element.getValue().getClass())) {
                    throw new IllegalArgumentException("Mixed types are not allowed in the list");
                }

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
                coordinates.addAll(parseGeodesicString((GeodesicStringType) element.getValue()));

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
        }

        return coordinates;
        }

        public static CurveSegmentArrayPropertyType printCurveSegmentArrayPropertyType (){

        return new CurveSegmentArrayPropertyType();
    }

    //TODO: to implement
    public static List<Coordinate> parseArcByCenterPoint(ArcByCenterPointType value) {
        return new ArrayList<Coordinate>();
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

    //TODO: to implement
    public static List<Coordinate> parseCircleByCenterPoint(CircleByCenterPointType value) {
        return new ArrayList<Coordinate>();
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

    public static List<Coordinate> parseGeodesicString (GeodesicStringType value) {
        DirectPositionListType posList = value.getPosList();

        if (posList == null) {
            throw new IllegalArgumentException("DirectPositionListType is null" + value.getClass().getName());
        }

        return parseDirectPositionList(posList);
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

    //TODO: to implement
    public static List<Coordinate> parseGeodesic (GeodesicType value) {
        return new ArrayList<Coordinate>();
    }

    public static GeodesicType printGeodesic (LineString value) {

        return new GeodesicType();
    }

    //TODO: to implement
    public static List<Coordinate> parseLineStringSegment (LineStringSegmentType value) {
        return new ArrayList<Coordinate>();
    }

    public static LineStringSegmentType printLineStringSegment (LineString value) {

        return new LineStringSegmentType();
    }

    public static List<Coordinate> parseDirectPositionList (DirectPositionListType value) {
        if (value == null) {
            throw new IllegalArgumentException("DirectPositionListType is null" + value.getClass().getName());
        }

        List<Double> posList = value.getValue();

        if (posList == null || posList.isEmpty()) {
            throw new IllegalArgumentException("list<Double> value is null or empty" + value.getClass().getName());
        }
        int srsDimension = value.getSrsDimension() != null ? value.getSrsDimension().intValue() : 2;
        List<Coordinate> coordinates = new ArrayList<>();

        for (int i = 0; i < posList.size(); i += srsDimension) {
            if (posList.get(i) == null || posList.get(i + 1) == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
            }

            if (srsDimension == 2) {
                coordinates.add(new Coordinate(posList.get(i), posList.get(i + 1)));
            } else if (srsDimension == 3) {
                if (posList.get(i + 2) == null) {
                    throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
                }
                coordinates.add(new Coordinate(posList.get(i), posList.get(i + 1), posList.get(i + 2)));
            }
        }

        return coordinates;
    }

    public static DirectPositionListType printDirectPositionList (List<Coordinate> value) {
        if (value == null) {
            throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
        }

        DirectPositionListType posList = new DirectPositionListType();
        for (Coordinate coordinate : value) {
            if (coordinate == null) {
                throw new IllegalArgumentException("Coordinate values cannot be null" + value.getClass().getName());
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




}