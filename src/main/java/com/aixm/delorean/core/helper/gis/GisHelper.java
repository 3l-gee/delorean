package com.aixm.delorean.core.helper.gis;

import java.math.BigInteger;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import javax.xml.namespace.QName;

import com.aixm.delorean.core.helper.gis.PointGmlHelper;
import com.aixm.delorean.core.helper.gis.CurveGmlHelper;
import com.aixm.delorean.core.helper.gis.SurfaceGmlHelper;

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
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurvePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.RingType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType;

public class GisHelper {    
    private static int SRID = 4326; // EPSG:4326
    private static PrecisionModel precisionModel = new PrecisionModel( 0.001);
    private static GeometryFactory geometryFactory = new GeometryFactory(precisionModel, SRID);
    private static CRSFactory crsFactory = new CRSFactory();
    private static CoordinateTransformFactory ctFactory = new CoordinateTransformFactory();

    private static Coordinate[] segmentToCoordinate(String srsName, GeodesicStringType segment) {
        if (srsName == null) {
            srsName = "EPSG:4326";
        }
        CoordinateTransform transform = createCoordinateTransform(srsName, "EPSG:4326");
        List<Double> posList = segment.getPosList().getValue();
        BigInteger srsDimension = segment.getPosList().getSrsDimension();
        int dimension = (srsDimension != null) ? srsDimension.intValue() : 2;
        Coordinate[] coordinates = new Coordinate[posList.size() / dimension];

        for (int i = 0; i < posList.size(); i += dimension) {
            coordinates[i / dimension] = transformCoordinates(new Coordinate(posList.get(i), posList.get(i + 1)), transform);
        }
        
        return coordinates;
    }

    private static GeodesicStringType coordinateToSegment(Coordinate[] coordinates) {
        GeodesicStringType segment = new GeodesicStringType();
        DirectPositionListType posList = new DirectPositionListType();
        
        for (Coordinate coord : coordinates) {
            if(coord == null) {
                return new GeodesicStringType();
            } else {
                posList.getValue().add(coord.getX());
                posList.getValue().add(coord.getY());
            }
        }
        
        segment.setPosList(posList);
        return segment;
    }

    private static CoordinateTransform createCoordinateTransform(String sourceCRS, String targetCRS) {
        String formattedSourceCRS = null;
        if (!sourceCRS.contains("EPSG")) {
            throw new IllegalArgumentException("Invalid CRS format: " + sourceCRS);
        } else {
            String[] parts = sourceCRS.split(":");
            for (String part : parts) {
                if (part.matches("\\d+")) {
                    formattedSourceCRS = "EPSG:" + part;
                }
            }
        }

        if (!isValidCRS(formattedSourceCRS)) {
            throw new IllegalArgumentException("Invalid source CRS: " + formattedSourceCRS);
        }

        if (!isValidCRS(formattedSourceCRS)) {
            throw new IllegalArgumentException("Invalid target CRS: " + formattedSourceCRS);
        }

        CoordinateReferenceSystem srcCrs = crsFactory.createFromName(formattedSourceCRS);
        CoordinateReferenceSystem tgtCrs = crsFactory.createFromName(targetCRS);
        return ctFactory.createTransform(srcCrs, tgtCrs);
    }

    private static RingType geodesicStringTypeWrapper(GeodesicStringType value) {
        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();   
        segments.getAbstractCurveSegment().add(new JAXBElement<GeodesicStringType>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, value));

        CurveType curve = new CurveType();
        curve.setSegments(segments);

        CurvePropertyType curveProperty = new CurvePropertyType();
        curveProperty.setAbstractCurve(new JAXBElement<CurveType>(new QName("http://www.opengis.net/gml/3.2", "Curve"), CurveType.class, curve)); 
        
        RingType ring = new RingType();
        ring.getCurveMember().add(curveProperty);

        return ring;
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

    public static AixmElevatedGeometryType parseElevatedGeometry(AixmElevatedGeometryType target,
        String id,
        ValDistanceType horizontalElement,
        ValDistanceType verticalElement,
        ValDistanceVerticalType elevationElement,
        ValDistanceSignedType geoidElement,
        CodeVerticalDatumType verticalDatumElement) {

        if (id != null) {
            target.setId(id);
        }

        // Handle Horizontal Accuracy
        if (horizontalElement != null) {
            target.setHorizontalAccuracy(horizontalElement.getValue());
            target.setHorizontalAccuracy_uom(horizontalElement.getUom());
            target.setHorizontalAccuracy_nilReason(horizontalElement.getNilReason());
        }
        
        // Handle Vertical Accuracy
        if (verticalElement != null) {
            target.setVerticalAccuracy(verticalElement.getValue());
            target.setVerticalAccuracy_uom(verticalElement.getUom());
            target.setVerticalAccuracy_nilReason(verticalElement.getNilReason());
        }
        
        // Handle Elevation
        if (elevationElement != null) {
            target.setElevation(elevationElement.getValue() != null 
                ? new BigDecimal(elevationElement.getValue()) 
                : BigDecimal.ZERO);
            target.setElevation_uom(elevationElement.getUom());
            target.setElevation_nilReason(elevationElement.getNilReason());
        }
        
        // Handle Geoid Undulation
        if (geoidElement != null) {
            target.setGeoidUndulation(geoidElement.getValue());
            target.setGeoidUndulation_uom(geoidElement.getUom());
            target.setGeoidUndulation_nilReason(geoidElement.getNilReason());
        }
        
        // Handle Vertical Datum
        if (verticalDatumElement != null) {
            target.setVerticalDatum(verticalDatumElement.getValue());
            target.setVerticalDatum_nilReason(verticalDatumElement.getNilReason());
        }

        return target;  
    }

    public static <T extends AixmGeometryType> T aixmGeometryAttributesFactory(
        Class<T> target,
        String id,
        ValDistanceType horizontalElement) {

        T obj;
        if (target == AixmPointType.class) {
            obj = target.cast(new AixmPointType());
        } else if (target == AixmCurveType.class) {
            obj = target.cast(new AixmCurveType());
        } else if (target == AixmSurfaceType.class) {
            obj = target.cast(new AixmSurfaceType());
        } else {
            throw new IllegalArgumentException("Unsupported target type: " + target.getName());
        }
            
        if (id != null) {
            obj.setId(id);
        }

        // Handle Horizontal Accuracy
        if (horizontalElement != null) {
            obj.setHorizontalAccuracy(horizontalElement.getValue());
            obj.setHorizontalAccuracy_uom(horizontalElement.getUom());
            obj.setHorizontalAccuracy_nilReason(horizontalElement.getNilReason());
        }
        
        return obj;  
    }

    public static <T extends AixmElevatedGeometryType> T elevatedAixmGeometryAttributesFactory(
        Class<T> target,
        String id,
        ValDistanceType horizontalElement,
        ValDistanceType verticalElement,
        ValDistanceVerticalType elevationElement,
        ValDistanceSignedType geoidElement,
        CodeVerticalDatumType verticalDatumElement) {

        T obj;
        if (target == AixmElevatedPointType.class) {
            obj = target.cast(new AixmElevatedPointType());
        } else if (target == AixmElevatedCurveType.class) {
            obj = target.cast(new AixmElevatedCurveType());
        } else if (target == AixmElevatedSurfaceType.class) {
            obj = target.cast(new AixmElevatedSurfaceType());
        } else {
            throw new IllegalArgumentException("Unsupported target type: " + target.getName());
        }

        if (id != null) {
            obj.setId(id);
        }

        // Handle Horizontal Accuracy
        if (horizontalElement != null) {
            obj.setHorizontalAccuracy(horizontalElement.getValue());
            obj.setHorizontalAccuracy_uom(horizontalElement.getUom());
            obj.setHorizontalAccuracy_nilReason(horizontalElement.getNilReason());
        }
        
        // Handle Vertical Accuracy
        if (verticalElement != null) {
            obj.setVerticalAccuracy(verticalElement.getValue());
            obj.setVerticalAccuracy_uom(verticalElement.getUom());
            obj.setVerticalAccuracy_nilReason(verticalElement.getNilReason());
        }
        
        // Handle Elevation
        if (elevationElement != null) {
            obj.setElevation(elevationElement.getValue() != null 
                ? new BigDecimal(elevationElement.getValue()) 
                : BigDecimal.ZERO);
            obj.setElevation_uom(elevationElement.getUom());
            obj.setElevation_nilReason(elevationElement.getNilReason());
        }
        
        // Handle Geoid Undulation
        if (geoidElement != null) {
            obj.setGeoidUndulation(geoidElement.getValue());
            obj.setGeoidUndulation_uom(geoidElement.getUom());
            obj.setGeoidUndulation_nilReason(geoidElement.getNilReason());
        }
        
        // Handle Vertical Datum
        if (verticalDatumElement != null) {
            obj.setVerticalDatum(verticalDatumElement.getValue());
            obj.setVerticalDatum_nilReason(verticalDatumElement.getNilReason());
        }
        return obj;  
    }

    public static AixmGeometryType parseGeometry(
        AixmGeometryType target,
        String id,
        ValDistanceType horizontalElement) {
            
        if (id != null) {
            target.setId(id);
        }

        // Handle Horizontal Accuracy
        if (horizontalElement != null) {
            target.setHorizontalAccuracy(horizontalElement.getValue());
            target.setHorizontalAccuracy_uom(horizontalElement.getUom());
            target.setHorizontalAccuracy_nilReason(horizontalElement.getNilReason());
        }
        
        return target;  
    }

    public static AixmPointType parseAIXMPoint (com.aixm.delorean.core.schema.a5_1_1.aixm.PointType value) {
        AixmPointType aixmPoint = aixmGeometryAttributesFactory(
            AixmPointType.class, 
            value.getId(), 
            value.getHorizontalAccuracy()
            );

        aixmPoint.setPoint(PointGmlHelper.parseGMLPoint(value));
        return aixmPoint;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.PointType printAIXMPoint(AixmPointType value) {
        //output object
        com.aixm.delorean.core.schema.a5_1_1.aixm.PointType pointType = new com.aixm.delorean.core.schema.a5_1_1.aixm.PointType();
        DirectPositionType pos = new DirectPositionType();

        //setting id
        pointType.setId(value.getId());

        //setting srsName

        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        pointType.setHorizontalAccuracy(valDistance);
    
        //attributes extraction
        Point point = value.getPoint();

        // setting point
        if (point == null) {
            return pointType;
        } else if (point.getX() == Double.NaN || point.getY() == Double.NaN) {
            return pointType;
        } else {
            pos.getValue().add(point.getX());
            pos.getValue().add(point.getY());
            pointType.setPos(pos);
        } 

        return pointType;
    }

    public static AixmElevatedPointType parseAIXMElevatedPoint (ElevatedPointType value) {
        AixmElevatedPointType aixmElevatedPoint = elevatedAixmGeometryAttributesFactory(
            AixmElevatedPointType.class, 
            value.getId(), 
            value.getHorizontalAccuracy(), 
            value.getVerticalAccuracy(), 
            value.getElevation(), 
            value.getGeoidUndulation(), 
            value.getVerticalDatum()
            );

        aixmElevatedPoint.setPoint(PointGmlHelper.parseGMLPoint(value));
        return aixmElevatedPoint;
    }

    public static ElevatedPointType printAIXMElevatedPoint(AixmElevatedPointType value) {
        // Output object
        ElevatedPointType elevatedPointType = new ElevatedPointType();
        DirectPositionType pos = new DirectPositionType();

        // setting id
        elevatedPointType.setId(value.getId());

        // setting srsName
        elevatedPointType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getPoint().getSRID());

        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedPointType.setHorizontalAccuracy(valDistance);

        ValDistanceVerticalType valDistanceVertical = new ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedPointType.setElevation(valDistanceVertical);

        ValDistanceSignedType valDistanceSigned = new ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedPointType.setGeoidUndulation(valDistanceSigned);

        CodeVerticalDatumType codeVerticalDatum = new CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedPointType.setVerticalDatum(codeVerticalDatum);

        ValDistanceType valDistanceVerticalAccuracy = new ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedPointType.setVerticalAccuracy(valDistanceVerticalAccuracy);

        //attributes extraction
        Point point = value.getPoint();

        // setting point
        if (point == null) {
            return elevatedPointType;
        } else if (point.getX() == Double.NaN || point.getY() == Double.NaN) {
            return elevatedPointType;
        } else {
            pos.getValue().add(point.getX());
            pos.getValue().add(point.getY());
            elevatedPointType.setPos(pos);
        } 

        return elevatedPointType;
    }

    public static LineString parseGMLCurve(CurveType value) {
        GeodesicStringType segment = null;

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

        return geometryFactory.createLineString(segmentToCoordinate(value.getSrsName(), segment));
    }

    public static CurveType printGMLCurve(LineString value) {
        if (value == null) {
            return new CurveType();
        }
        CurveType curve = new CurveType();
        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();
        GeodesicStringType geodesicString = new GeodesicStringType();
        DirectPositionListType posList = new DirectPositionListType();

        for (Coordinate coord : value.getCoordinates()) {
            if(coord == null) {
                    return new CurveType();
            } else {
                posList.getValue().add(coord.getX());
                posList.getValue().add(coord.getY());
            }
        }

        curve.setSrsDimension(BigInteger.valueOf(2));

        geodesicString.setPosList(posList);
        JAXBElement<GeodesicStringType> geodesicElement = new JAXBElement<>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, geodesicString);
        segments.getAbstractCurveSegment().add(geodesicElement);
        curve.setSegments(segments);
        
        if (value.getSRID() != 0) {
            curve.setSrsName("EPSG:" + value.getSRID());
        }

        return curve;
    }

    public static AixmCurveType parseAIXMCurve(com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType value) {
        AixmCurveType curve = new AixmCurveType();
        curve.setLineString(parseGMLCurve(value));

        return (AixmCurveType) parseGeometry(curve, null, value.getHorizontalAccuracy());
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType printAIXMCurve(AixmCurveType value) {
        com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType curve = new com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType();
        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();
        GeodesicStringType geodesicString = new GeodesicStringType();
        DirectPositionListType posList = new DirectPositionListType();

        if (value.getLineString() == null || value.getLineString().getCoordinates() == null) {
            return null;
        } else {
            for (Coordinate coord : value.getLineString().getCoordinates()) {
                posList.getValue().add(coord.getX());
                posList.getValue().add(coord.getY());
            }
        }

        curve.setSrsDimension(BigInteger.valueOf(2));
        geodesicString.setPosList(posList);

        JAXBElement<GeodesicStringType> geodesicElement = new JAXBElement<>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, geodesicString);
        segments.getAbstractCurveSegment().add(geodesicElement);
        curve.setSegments(segments);

        if (value.getLineString().getSRID() != 0) {
            curve.setSrsName("EPSG:" + value.getLineString().getSRID());
        }      

        curve.setId(value.getId());

        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        curve.setHorizontalAccuracy(valDistance);

        return curve;
    }

    public static AixmElevatedCurveType parseAIXMElevatedCurve(ElevatedCurveType value) {
        AixmElevatedCurveType curve = new AixmElevatedCurveType();
        curve.setLineString(parseGMLCurve(value));

        return (AixmElevatedCurveType) parseElevatedGeometry(curve, null, value.getHorizontalAccuracy(), value.getVerticalAccuracy(), value.getElevation(), value.getGeoidUndulation(), value.getVerticalDatum());
    }

    public static ElevatedCurveType printAIXMElevatedCurve(AixmElevatedCurveType value) {
        ElevatedCurveType curve = new ElevatedCurveType();
        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();
        GeodesicStringType geodesicString = new GeodesicStringType();
        DirectPositionListType posList = new DirectPositionListType();

        if (value.getLineString() == null || value.getLineString().getCoordinates() == null) {
            return null;
        } else {
            for (Coordinate coord : value.getLineString().getCoordinates()) {
                posList.getValue().add(coord.getX());
                posList.getValue().add(coord.getY());
            }
        }

        curve.setSrsDimension(BigInteger.valueOf(2));
        geodesicString.setPosList(posList);

        JAXBElement<GeodesicStringType> geodesicElement = new JAXBElement<>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, geodesicString);
        segments.getAbstractCurveSegment().add(geodesicElement);
        curve.setSegments(segments);

        if (value.getLineString().getSRID() != 0) {
            curve.setSrsName("EPSG:" + value.getLineString().getSRID());
        }

        curve.setId(value.getId());

        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        curve.setHorizontalAccuracy(valDistance);

        ValDistanceVerticalType valDistanceVertical = new ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        curve.setElevation(valDistanceVertical);

        ValDistanceSignedType valDistanceSigned = new ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        curve.setGeoidUndulation(valDistanceSigned);

        CodeVerticalDatumType codeVerticalDatum = new CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        curve.setVerticalDatum(codeVerticalDatum);

        ValDistanceType valDistanceVerticalAccuracy = new ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        curve.setVerticalAccuracy(valDistanceVerticalAccuracy);
        
        return curve;
    }

    public static List<LineString> parseGMLCurves(List<CurveType> values) {
        List<LineString> curves = new ArrayList<>(values.size());
        for (CurveType value : values) {
            curves.add(parseGMLCurve(value));
        }
        return curves;
    }

    public static List<CurveType> printGMLCurves(List<LineString> values) {
        List<CurveType> curves = new ArrayList<>(values.size());
        for (LineString value : values) {
            curves.add(printGMLCurve(value));
        }
        return curves;
    }

    public static Polygon parseGMLSurface(SurfaceType value) { 
        List<PolygonPatchType> patches = new ArrayList<>();
        Integer counter = 0;
        GeodesicStringType exteriorMap = null;
        Map<Integer, GeodesicStringType> interiorMap = new HashMap<>(256);

        for (JAXBElement<? extends AbstractSurfacePatchType> element : value.getPatches().getValue().getAbstractSurfacePatch()) {
            if (element.getValue() instanceof PolygonPatchType) {
                    patches.add((PolygonPatchType) element.getValue());

            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + element.getValue().getClass().getName());
            }    
        }

        if(patches.get(0).getExterior().getAbstractRing().getValue() instanceof RingType || patches.size() == 1) {
            RingType exteriorRing = (RingType) patches.getFirst().getExterior().getAbstractRing().getValue();

            if (exteriorRing.getCurveMember().getFirst().getAbstractCurve().getValue() instanceof CurveType){
                CurveType exteriorCurve = (CurveType) exteriorRing.getCurveMember().getFirst().getAbstractCurve().getValue();

                if (exteriorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType){
                    exteriorMap = (GeodesicStringType) exteriorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue();

                } else {
                    throw new IllegalArgumentException("Unsupported curve segment type: " + exteriorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue().getClass().getName());
                }
            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + patches.getFirst().getExterior().getAbstractRing().getValue().getClass().getName());
            }
        } else {
            throw new IllegalArgumentException("Unsupported surface patch type: " + patches.getFirst().getExterior().getAbstractRing().getValue().getClass().getName());
        }

        for (AbstractRingPropertyType interior : patches.get(0).getInterior()){

            if (interior.getAbstractRing().getValue() instanceof RingType) {
                RingType interiorRing = (RingType) interior.getAbstractRing().getValue();

                if (interiorRing.getCurveMember().getFirst().getAbstractCurve().getValue() instanceof CurveType){
                    CurveType interiorCurve = (CurveType) interiorRing.getCurveMember().getFirst().getAbstractCurve().getValue();

                    if (interiorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType){
                        interiorMap.put(counter, (GeodesicStringType) interiorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue());

                    } else {
                        throw new IllegalArgumentException("Unsupported curve segment type: " + interiorCurve.getSegments().getAbstractCurveSegment().getFirst().getValue().getClass().getName());
                    }

                } else {
                    throw new IllegalArgumentException("Unsupported surface patch type: " + patches.get(0).getExterior().getAbstractRing().getValue().getClass().getName());
                }
            } else {
                throw new IllegalArgumentException("Unsupported surface patch type: " + interior.getAbstractRing().getValue().getClass().getName());
            }
            counter++;
        }

        LinearRing shell = geometryFactory.createLinearRing(segmentToCoordinate(value.getSrsName(), exteriorMap));
        LinearRing[] holes = new LinearRing[interiorMap.size()];

        for (Integer i : interiorMap.keySet()) {
            holes[i] = geometryFactory.createLinearRing(segmentToCoordinate(value.getSrsName(), interiorMap.get(i)));
        }
       
        return geometryFactory.createPolygon(shell, holes);
    }

    public static SurfaceType printGMLSurface(Polygon value){
        if (value == null) {
            return new SurfaceType();
        }
        GeodesicStringType shell = coordinateToSegment(value.getExteriorRing().getCoordinates());
        RingType exterior = geodesicStringTypeWrapper(shell);
        AbstractRingPropertyType exteriorRing = new AbstractRingPropertyType();
        exteriorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, exterior));
        
        List<AbstractRingPropertyType> interiorRingList = new ArrayList<>();
        for (int i = 0; i < value.getNumInteriorRing(); i++) {
            GeodesicStringType hole = coordinateToSegment(value.getInteriorRingN(i).getCoordinates());
            RingType interior = geodesicStringTypeWrapper(hole);
            AbstractRingPropertyType interiorRing = new AbstractRingPropertyType();
            interiorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, interior));
            interiorRingList.add(interiorRing);
        }

        PolygonPatchType patch = new PolygonPatchType();
        patch.setExterior(exteriorRing);
        patch.getInterior().addAll(interiorRingList);   

        SurfacePatchArrayPropertyType patches = new SurfacePatchArrayPropertyType();
        patches.getAbstractSurfacePatch().add(new JAXBElement<PolygonPatchType>(new QName("http://www.opengis.net/gml/3.2", "PolygonPatch"), PolygonPatchType.class, patch));

        SurfaceType surface = new SurfaceType();
        surface.setPatches(new JAXBElement<SurfacePatchArrayPropertyType>(new QName("http://www.opengis.net/gml/3.2", "patches"), SurfacePatchArrayPropertyType.class, patches));
        surface.setSrsDimension(BigInteger.valueOf(2));
        surface.setSrsName("EPSG:4326");

        return surface;
    }
   
    public static AixmSurfaceType parseAIXMSurface(com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType value) {
        AixmSurfaceType surface = new AixmSurfaceType();
        surface.setPolygon(parseGMLSurface(value));

        return (AixmSurfaceType) parseGeometry(surface, surface.getId(), value.getHorizontalAccuracy());
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType printAIXMSurface(AixmSurfaceType value){
        com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType surface = new com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType();
        GeodesicStringType shell = coordinateToSegment(value.getPolygon().getExteriorRing().getCoordinates());
        RingType exterior = geodesicStringTypeWrapper(shell);
        AbstractRingPropertyType exteriorRing = new AbstractRingPropertyType();
        exteriorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, exterior));
        
        List<AbstractRingPropertyType> interiorRingList = new ArrayList<>();
        for (int i = 0; i < value.getPolygon().getNumInteriorRing(); i++) {
            GeodesicStringType hole = coordinateToSegment(value.getPolygon().getInteriorRingN(i).getCoordinates());
            RingType interior = geodesicStringTypeWrapper(hole);
            AbstractRingPropertyType interiorRing = new AbstractRingPropertyType();
            interiorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, interior));
            interiorRingList.add(interiorRing);
        }

        PolygonPatchType patch = new PolygonPatchType();
        patch.setExterior(exteriorRing);
        patch.getInterior().addAll(interiorRingList);   

        SurfacePatchArrayPropertyType patches = new SurfacePatchArrayPropertyType();
        patches.getAbstractSurfacePatch().add(new JAXBElement<PolygonPatchType>(new QName("http://www.opengis.net/gml/3.2", "PolygonPatch"), PolygonPatchType.class, patch));

        surface.setPatches(new JAXBElement<SurfacePatchArrayPropertyType>(new QName("http://www.opengis.net/gml/3.2", "patches"), SurfacePatchArrayPropertyType.class, patches));
        surface.setSrsDimension(BigInteger.valueOf(2));
        surface.setSrsName("EPSG:4326");

        surface.setId(value.getId());

        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        surface.setHorizontalAccuracy(valDistance);

        return surface;
    }

    public static AixmElevatedSurfaceType parseAIXMElevatedSurface(ElevatedSurfaceType value) {
        AixmElevatedSurfaceType surface = new AixmElevatedSurfaceType();
        surface.setPolygon(parseGMLSurface(value));

        return (AixmElevatedSurfaceType) parseElevatedGeometry(surface, null, value.getHorizontalAccuracy(), value.getVerticalAccuracy(), value.getElevation(), value.getGeoidUndulation(), value.getVerticalDatum());
    }

    public static ElevatedSurfaceType printAIXMElevatedSurface(AixmElevatedSurfaceType value) {
        ElevatedSurfaceType surface = new ElevatedSurfaceType();
        GeodesicStringType shell = coordinateToSegment(value.getPolygon().getExteriorRing().getCoordinates());
        RingType exterior = geodesicStringTypeWrapper(shell);
        AbstractRingPropertyType exteriorRing = new AbstractRingPropertyType();
        exteriorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, exterior));
        
        List<AbstractRingPropertyType> interiorRingList = new ArrayList<>();
        for (int i = 0; i < value.getPolygon().getNumInteriorRing(); i++) {
            GeodesicStringType hole = coordinateToSegment(value.getPolygon().getInteriorRingN(i).getCoordinates());
            RingType interior = geodesicStringTypeWrapper(hole);
            AbstractRingPropertyType interiorRing = new AbstractRingPropertyType();
            interiorRing.setAbstractRing(new JAXBElement<RingType>( new QName("http://www.opengis.net/gml/3.2", "Ring"), RingType.class, interior));
            interiorRingList.add(interiorRing);
        }

        PolygonPatchType patch = new PolygonPatchType();
        patch.setExterior(exteriorRing);
        patch.getInterior().addAll(interiorRingList);   

        SurfacePatchArrayPropertyType patches = new SurfacePatchArrayPropertyType();
        patches.getAbstractSurfacePatch().add(new JAXBElement<PolygonPatchType>(new QName("http://www.opengis.net/gml/3.2", "PolygonPatch"), PolygonPatchType.class, patch));

        surface.setPatches(new JAXBElement<SurfacePatchArrayPropertyType>(new QName("http://www.opengis.net/gml/3.2", "patches"), SurfacePatchArrayPropertyType.class, patches));
        surface.setSrsDimension(BigInteger.valueOf(2));
        surface.setSrsName("EPSG:4326");

        surface.setId(value.getId());

        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        surface.setHorizontalAccuracy(valDistance);

        ValDistanceVerticalType valDistanceVertical = new ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        surface.setElevation(valDistanceVertical);

        ValDistanceSignedType valDistanceSigned = new ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        surface.setGeoidUndulation(valDistanceSigned);

        CodeVerticalDatumType codeVerticalDatum = new CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        surface.setVerticalDatum(codeVerticalDatum);

        ValDistanceType valDistanceVerticalAccuracy = new ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        surface.setVerticalAccuracy(valDistanceVerticalAccuracy);

        return surface;
    }
}
