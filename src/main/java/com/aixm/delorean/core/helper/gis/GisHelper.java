package com.aixm.delorean.core.helper.gis;

import java.math.BigDecimal;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

import javax.xml.namespace.QName;


import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.LineString;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;
import org.locationtech.jts.geom.MultiPolygon;

import jakarta.xml.bind.JAXBElement;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.DirectPositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.GeodesicStringType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.PolygonPatchType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.SurfacePatchArrayPropertyType;
import com.aixm.delorean.core.adapter.type.gis.AixmGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedSurfaceType;
import com.aixm.delorean.core.adapter.type.gis.AixmPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.CurveSegmentArrayPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType;
import com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType;

public class GisHelper {    
    
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

        if (value == null) {
            return new com.aixm.delorean.core.schema.a5_1_1.aixm.PointType();
        }

        //setting id
        pointType.setId(value.getId());
    
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

        //setting srsName
        pointType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getPoint().getSRID());

        //setting horizontal accuracy
        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        pointType.setHorizontalAccuracy(valDistance);

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

        if (value == null) {
            return new ElevatedPointType();
        }

        // setting id
        elevatedPointType.setId(value.getId());

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

        // setting srsName
        elevatedPointType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getPoint().getSRID());

        // setting horizontal accuracy
        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedPointType.setHorizontalAccuracy(valDistance);

        // setting vertical accuracy
        ValDistanceVerticalType valDistanceVertical = new ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedPointType.setElevation(valDistanceVertical);

        // setting geoid undulation
        ValDistanceSignedType valDistanceSigned = new ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedPointType.setGeoidUndulation(valDistanceSigned);

        // setting vertical datum
        CodeVerticalDatumType codeVerticalDatum = new CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedPointType.setVerticalDatum(codeVerticalDatum);

        // setting vertical accuracy
        ValDistanceType valDistanceVerticalAccuracy = new ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedPointType.setVerticalAccuracy(valDistanceVerticalAccuracy);

        return elevatedPointType;
    }


    public static AixmCurveType parseAIXMCurve(com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType value) {
        AixmCurveType aixmCurve = aixmGeometryAttributesFactory(
            AixmCurveType.class,
            value.getId(),
            value.getHorizontalAccuracy()
            );
        
        aixmCurve.setLineString(CurveGmlHelper.parseGMLcurve(value));

        if (value.getSegments() != null && value.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType) {
            aixmCurve.setInterpretation(AixmCurveType.Interpretation.GEODESIC);
        }        
        else {
            aixmCurve.setInterpretation(AixmCurveType.Interpretation.LINESTRING);
        }

        return aixmCurve;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType printAIXMCurve(AixmCurveType value) {
        //output object
        com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType curveType = new com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType();

        if (value == null) {
            return new com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType();
        }

        // setting id
        curveType.setId(value.getId());

        LineString lineString = value.getLineString();

        if (lineString == null) {
            return curveType;
        }

        // setting srsName
        curveType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getLineString().getSRID());

        AixmCurveType.Interpretation interpretation = value.getInterpretation();

        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();

        if (interpretation == AixmCurveType.Interpretation.GEODESIC) {
            GeodesicStringType geodesicString = CurveGmlHelper.printGeodesicString(Arrays.asList(lineString.getCoordinates()));
            segments.getAbstractCurveSegment().add(new JAXBElement<GeodesicStringType>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, geodesicString));
        } else {
            //TODO: Implement LineString interpretation
        }

        // setting horizontal accuracy
        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        curveType.setHorizontalAccuracy(valDistance);

        curveType.setSegments(segments);

        return curveType;
    }

    public static AixmElevatedCurveType parseAIXMElevatedCurve(ElevatedCurveType value) {
        AixmElevatedCurveType aixmElevatedCurve = elevatedAixmGeometryAttributesFactory(
            AixmElevatedCurveType.class,
            value.getId(),
            value.getHorizontalAccuracy(),
            value.getVerticalAccuracy(),
            value.getElevation(),
            value.getGeoidUndulation(),
            value.getVerticalDatum()
            );
        aixmElevatedCurve.setLineString(CurveGmlHelper.parseGMLcurve(value));

        if (value.getSegments() != null && value.getSegments().getAbstractCurveSegment().getFirst().getValue() instanceof GeodesicStringType) {
            aixmElevatedCurve.setInterpretation(AixmElevatedCurveType.Interpretation.GEODESIC);
        }        
        else {
            aixmElevatedCurve.setInterpretation(AixmElevatedCurveType.Interpretation.LINESTRING);
        }

        return aixmElevatedCurve;
    }

    public static ElevatedCurveType printAIXMElevatedCurve(AixmElevatedCurveType value) {
        //output object
        ElevatedCurveType elevatedCurve = new ElevatedCurveType();

        if (value == null) {
            return new ElevatedCurveType();
        }

        // setting id
        elevatedCurve.setId(value.getId());

        LineString lineString = value.getLineString();

        if (lineString == null) {
            return elevatedCurve;
        }

        // setting srsName
        elevatedCurve.setSrsName("urn:ogc:def:crs:EPSG:" + lineString.getSRID());

        AixmElevatedCurveType.Interpretation interpretation = value.getInterpretation();

        CurveSegmentArrayPropertyType segments = new CurveSegmentArrayPropertyType();

        if (interpretation == AixmElevatedCurveType.Interpretation.GEODESIC) {
            Coordinate[] coordinates = lineString.getCoordinates();
            GeodesicStringType geodesicString = CurveGmlHelper.printGeodesicString(Arrays.asList(coordinates));
            segments.getAbstractCurveSegment().add(new JAXBElement<GeodesicStringType>(new QName("http://www.opengis.net/gml/3.2", "GeodesicString"), GeodesicStringType.class, geodesicString));
        } else {
            //TODO: Implement LineString interpretation
        }

        // setting horizontal accuracy
        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedCurve.setHorizontalAccuracy(valDistance);

        // setting vertical accuracy
        ValDistanceVerticalType valDistanceVertical = new ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedCurve.setElevation(valDistanceVertical);

        // setting geoid undulation
        ValDistanceSignedType valDistanceSigned = new ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedCurve.setGeoidUndulation(valDistanceSigned);

        // setting vertical datum
        CodeVerticalDatumType codeVerticalDatum = new CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedCurve.setVerticalDatum(codeVerticalDatum);

        // setting vertical accuracy
        ValDistanceType valDistanceVerticalAccuracy = new ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedCurve.setVerticalAccuracy(valDistanceVerticalAccuracy);

        elevatedCurve.setSegments(segments);
        
        return elevatedCurve;
    }

   
    public static AixmSurfaceType parseAIXMSurface(com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType value) {
        AixmSurfaceType aixmSurface = aixmGeometryAttributesFactory(
            AixmSurfaceType.class, 
            value.getId(), 
            value.getHorizontalAccuracy()
            );
        aixmSurface.setMultiPolygon(SurfaceGmlHelper.parseGMLsurface(value));

        return aixmSurface;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType printAIXMSurface(AixmSurfaceType value){
        //output object
        com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType surfaceType = new com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType();

        if (value == null) {
            return new com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType();
        }

        // setting id
        surfaceType.setId(value.getId());

        //attributes extraction
        MultiPolygon multiPolygon = value.getMultiPolygon();

        if (multiPolygon == null) {
            return surfaceType;
        }

        // setting srsName
        surfaceType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getMultiPolygon().getSRID());

        for (int i = 0; i < multiPolygon.getNumGeometries(); i++) {
            Polygon polygon = (Polygon) multiPolygon.getGeometryN(i);
            List<Coordinate> exterior = Arrays.asList(polygon.getExteriorRing().getCoordinates());
            List<List<Coordinate>> interior = new ArrayList<>();
            for (int j = 0; j < polygon.getNumInteriorRing(); j++) {
                interior.add(Arrays.asList(polygon.getInteriorRingN(j).getCoordinates()));
            }
            PolygonPatchType patch = SurfaceGmlHelper.printPolygonPatch(exterior, interior);
            SurfacePatchArrayPropertyType patches = new SurfacePatchArrayPropertyType();
            patches.getAbstractSurfacePatch().add(new JAXBElement<PolygonPatchType>(new QName("http://www.opengis.net/gml/3.2", "PolygonPatch"), PolygonPatchType.class, patch));
            surfaceType.setPatches(new JAXBElement<SurfacePatchArrayPropertyType>(new QName("http://www.opengis.net/gml/3.2", "patches"), SurfacePatchArrayPropertyType.class, patches));
        }


        // setting horizontal accuracy
        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        surfaceType.setHorizontalAccuracy(valDistance);

        return surfaceType;
    }

    public static AixmElevatedSurfaceType parseAIXMElevatedSurface(ElevatedSurfaceType value) {
        AixmElevatedSurfaceType aixmElevatedSurface = elevatedAixmGeometryAttributesFactory(
            AixmElevatedSurfaceType.class,
            value.getId(),
            value.getHorizontalAccuracy(),
            value.getVerticalAccuracy(),
            value.getElevation(),
            value.getGeoidUndulation(),
            value.getVerticalDatum()
            );
        aixmElevatedSurface.setMultiPolygon(SurfaceGmlHelper.parseGMLsurface(value));

        return aixmElevatedSurface;
    }

    public static ElevatedSurfaceType printAIXMElevatedSurface(AixmElevatedSurfaceType value) {
        //output object
        ElevatedSurfaceType elevatedSurfaceType = new ElevatedSurfaceType();

        if (value == null) {
            return elevatedSurfaceType;
        }

        // setting id
        elevatedSurfaceType.setId(value.getId());

        //attributes extraction
        MultiPolygon multiPolygon = value.getMultiPolygon();

        if (multiPolygon == null) {
            return elevatedSurfaceType;
        }

        // setting srsName
        elevatedSurfaceType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getMultiPolygon().getSRID());

        for (int i = 0; i < multiPolygon.getNumGeometries(); i++) {
            Polygon polygon = (Polygon) multiPolygon.getGeometryN(i);
            List<Coordinate> exterior = Arrays.asList(polygon.getExteriorRing().getCoordinates());
            List<List<Coordinate>> interior = new ArrayList<>();
            for (int j = 0; j < polygon.getNumInteriorRing(); j++) {
                interior.add(Arrays.asList(polygon.getInteriorRingN(j).getCoordinates()));
            }
            PolygonPatchType patch = SurfaceGmlHelper.printPolygonPatch(exterior, interior);
            elevatedSurfaceType.getPatches().getValue().getAbstractSurfacePatch().add(new JAXBElement<PolygonPatchType>(new QName("http://www.opengis.net/gml/3.2", "PolygonPatch"), PolygonPatchType.class, patch));
        }

        // setting horizontal accuracy
        ValDistanceType valDistance = new ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedSurfaceType.setHorizontalAccuracy(valDistance);

        // setting vertical accuracy
        ValDistanceVerticalType valDistanceVertical = new ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedSurfaceType.setElevation(valDistanceVertical);

        // setting geoid undulation
        ValDistanceSignedType valDistanceSigned = new ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedSurfaceType.setGeoidUndulation(valDistanceSigned);

        // setting vertical datum
        CodeVerticalDatumType codeVerticalDatum = new CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedSurfaceType.setVerticalDatum(codeVerticalDatum);

        // setting vertical accuracy
        ValDistanceType valDistanceVerticalAccuracy = new ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedSurfaceType.setVerticalAccuracy(valDistanceVerticalAccuracy);

        return elevatedSurfaceType; 
    }
}
