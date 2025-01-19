package com.aixm.delorean.core.helper.gis;

import java.math.BigDecimal;
import java.util.logging.Logger;

import org.locationtech.jts.geom.Point;

import com.aixm.delorean.core.org.gml.v_3_2.DirectPositionType;
import com.aixm.delorean.core.adapter.type.gis.AixmGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedGeometryType;
import com.aixm.delorean.core.adapter.type.gis.AixmCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedCurveType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmElevatedSurfaceType;
import com.aixm.delorean.core.adapter.type.gis.AixmPointType;
import com.aixm.delorean.core.adapter.type.gis.AixmSurfaceType;
import com.aixm.delorean.core.log.ConsoleLogger;
import com.aixm.delorean.core.log.LogLevel;

public class GisHelper {    
    
    public static AixmElevatedGeometryType parseElevatedGeometry(AixmElevatedGeometryType target,
        String id,
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType horizontalElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType verticalElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType elevationElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType geoidElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType verticalDatumElement) {

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

    public static AixmElevatedGeometryType parseElevatedGeometry(AixmElevatedGeometryType target,
        String id,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType horizontalElement,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType verticalElement,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceVerticalType elevationElement,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceSignedType geoidElement,
        com.aixm.delorean.core.schema.a5_1.aixm.CodeVerticalDatumType verticalDatumElement) {

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
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType horizontalElement) {

        T obj;
        if (target == AixmPointType.class) {
            obj = target.cast(new AixmPointType());
        } else if (target == AixmCurveType.class) {
            obj = target.cast(new AixmCurveType());
        } else if (target == AixmSurfaceType.class) {
            obj = target.cast(new AixmSurfaceType());
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "Unsupported target type: " + target.getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException();
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

    public static <T extends AixmGeometryType> T aixmGeometryAttributesFactory(
        Class<T> target,
        String id,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType horizontalElement) {

        T obj;
        if (target == AixmPointType.class) {
            obj = target.cast(new AixmPointType());
        } else if (target == AixmCurveType.class) {
            obj = target.cast(new AixmCurveType());
        } else if (target == AixmSurfaceType.class) {
            obj = target.cast(new AixmSurfaceType());
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "Unsupported target type: " + target.getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException();
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
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType horizontalElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType verticalElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType elevationElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType geoidElement,
        com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType verticalDatumElement) {

        T obj;
        if (target == AixmElevatedPointType.class) {
            obj = target.cast(new AixmElevatedPointType());
        } else if (target == AixmElevatedCurveType.class) {
            obj = target.cast(new AixmElevatedCurveType());
        } else if (target == AixmElevatedSurfaceType.class) {
            obj = target.cast(new AixmElevatedSurfaceType());
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "Unsupported target type: " + target.getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException();
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

    public static <T extends AixmElevatedGeometryType> T elevatedAixmGeometryAttributesFactory(
        Class<T> target,
        String id,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType horizontalElement,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType verticalElement,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceVerticalType elevationElement,
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceSignedType geoidElement,
        com.aixm.delorean.core.schema.a5_1.aixm.CodeVerticalDatumType verticalDatumElement) {

        T obj;
        if (target == AixmElevatedPointType.class) {
            obj = target.cast(new AixmElevatedPointType());
        } else if (target == AixmElevatedCurveType.class) {
            obj = target.cast(new AixmElevatedCurveType());
        } else if (target == AixmElevatedSurfaceType.class) {
            obj = target.cast(new AixmElevatedSurfaceType());
        } else {
            ConsoleLogger.log(LogLevel.FATAL, "Unsupported target type: " + target.getName(), new Exception().getStackTrace()[0]);
            throw new RuntimeException();
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
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        AixmPointType aixmPoint = aixmGeometryAttributesFactory(
            AixmPointType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy()
            );

        aixmPoint.setPoint(PointGmlHelper.parseGMLPoint(value));
        ConsoleLogger.log(LogLevel.DEBUG, "Aixmpoint : " + aixmPoint.toString(), new Exception().getStackTrace()[0]);
        return aixmPoint;
    }

    public static AixmPointType parseAIXMPoint (com.aixm.delorean.core.schema.a5_1.aixm.PointType value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        AixmPointType aixmPoint = aixmGeometryAttributesFactory(
            AixmPointType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy()
            );

        aixmPoint.setPoint(PointGmlHelper.parseGMLPoint(value));
        ConsoleLogger.log(LogLevel.DEBUG, "Aixmpoint : " + aixmPoint.toString(), new Exception().getStackTrace()[0]);
        return aixmPoint;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.PointType printAIXMPoint(AixmPointType value, com.aixm.delorean.core.schema.a5_1_1.aixm.PointType pointType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        if (value == null) {
            return new com.aixm.delorean.core.schema.a5_1_1.aixm.PointType();
        }

        //setting id
        pointType.setXmlId(value.getId());
    
        // setting direct position
        pointType.setPos(PointGmlHelper.printDirectPosition( value.getPoint()));

        //setting srsName
        pointType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getPoint().getSRID());

        //setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        pointType.setHorizontalAccuracy(valDistance);

        ConsoleLogger.log(LogLevel.DEBUG, "PointType : " + pointType.toString(), new Exception().getStackTrace()[0]);
        return pointType;
    }

    public static com.aixm.delorean.core.schema.a5_1.aixm.PointType printAIXMPoint(AixmPointType value, com.aixm.delorean.core.schema.a5_1.aixm.PointType pointType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        DirectPositionType pos = new DirectPositionType();

        if (value == null) {
            return new com.aixm.delorean.core.schema.a5_1.aixm.PointType();
        }

        //setting id
        pointType.setXmlId(value.getId());
    
        // setting direct position
        pointType.setPos(PointGmlHelper.printDirectPosition( value.getPoint()));

        //setting srsName
        pointType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getPoint().getSRID());

        //setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        pointType.setHorizontalAccuracy(valDistance);

        ConsoleLogger.log(LogLevel.DEBUG, "PointType : " + pointType.toString(), new Exception().getStackTrace()[0]);
        return pointType;
    }

    public static AixmElevatedPointType parseAIXMElevatedPoint (com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        AixmElevatedPointType aixmElevatedPoint = elevatedAixmGeometryAttributesFactory(
            AixmElevatedPointType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy(), 
            value.getVerticalAccuracy(), 
            value.getElevation(), 
            value.getGeoidUndulation(), 
            value.getVerticalDatum()
            );

        aixmElevatedPoint.setPoint(PointGmlHelper.parseGMLPoint(value));
        ConsoleLogger.log(LogLevel.DEBUG, "AixmElevatedPoint : " + aixmElevatedPoint.toString(), new Exception().getStackTrace()[0]);
        return aixmElevatedPoint;
    }

    public static AixmElevatedPointType parseAIXMElevatedPoint (com.aixm.delorean.core.schema.a5_1.aixm.ElevatedPointType value) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        AixmElevatedPointType aixmElevatedPoint = elevatedAixmGeometryAttributesFactory(
            AixmElevatedPointType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy(), 
            value.getVerticalAccuracy(), 
            value.getElevation(), 
            value.getGeoidUndulation(), 
            value.getVerticalDatum()
            );

        aixmElevatedPoint.setPoint(PointGmlHelper.parseGMLPoint(value));
        ConsoleLogger.log(LogLevel.DEBUG, "AixmElevatedPoint : " + aixmElevatedPoint.toString(), new Exception().getStackTrace()[0]);
        return aixmElevatedPoint;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType printAIXMElevatedPoint(AixmElevatedPointType value, com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedPointType elevatedPointType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        // Output object
        DirectPositionType pos = new DirectPositionType();

        if (value == null) {
            return elevatedPointType;
        }

        // setting id
        elevatedPointType.setXmlId(value.getId());

        // setting direct position
        elevatedPointType.setPos(PointGmlHelper.printDirectPosition( value.getPoint()));

        // setting srsName
        elevatedPointType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getPoint().getSRID());

        // setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedPointType.setHorizontalAccuracy(valDistance);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType valDistanceVertical = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedPointType.setElevation(valDistanceVertical);

        // setting geoid undulation
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType valDistanceSigned = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedPointType.setGeoidUndulation(valDistanceSigned);

        // setting vertical datum
        com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType codeVerticalDatum = new com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedPointType.setVerticalDatum(codeVerticalDatum);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType valDistanceVerticalAccuracy = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedPointType.setVerticalAccuracy(valDistanceVerticalAccuracy);

        ConsoleLogger.log(LogLevel.DEBUG, "ElevatedPointType : " + elevatedPointType.toString(), new Exception().getStackTrace()[0]);
        return elevatedPointType;
    }

    public static com.aixm.delorean.core.schema.a5_1.aixm.ElevatedPointType printAIXMElevatedPoint(AixmElevatedPointType value, com.aixm.delorean.core.schema.a5_1.aixm.ElevatedPointType elevatedPointType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        // Output object
        DirectPositionType pos = new DirectPositionType();

        if (value == null) {
            return elevatedPointType;
        }

        // setting id
        elevatedPointType.setXmlId(value.getId());

        // setting direct position
        elevatedPointType.setPos(PointGmlHelper.printDirectPosition( value.getPoint()));

        // setting srsName
        elevatedPointType.setSrsName("urn:ogc:def:crs:EPSG:" + value.getPoint().getSRID());

        // setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedPointType.setHorizontalAccuracy(valDistance);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceVerticalType valDistanceVertical = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedPointType.setElevation(valDistanceVertical);

        // setting geoid undulation
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceSignedType valDistanceSigned = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedPointType.setGeoidUndulation(valDistanceSigned);

        // setting vertical datum
        com.aixm.delorean.core.schema.a5_1.aixm.CodeVerticalDatumType codeVerticalDatum = new com.aixm.delorean.core.schema.a5_1.aixm.CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedPointType.setVerticalDatum(codeVerticalDatum);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType valDistanceVerticalAccuracy = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedPointType.setVerticalAccuracy(valDistanceVerticalAccuracy);

        ConsoleLogger.log(LogLevel.DEBUG, "ElevatedPointType : " + elevatedPointType.toString(), new Exception().getStackTrace()[0]);
        return elevatedPointType;
    }


    public static AixmCurveType parseAIXMCurve(com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType value) {
        AixmCurveType aixmCurve = aixmGeometryAttributesFactory(
            AixmCurveType.class,
            value.getXmlId(),
            value.getHorizontalAccuracy()
            );
        
        aixmCurve.setSegments(CurveGmlHelper.parseGMLcurve(value));

        return aixmCurve;
    }

    public static AixmCurveType parseAIXMCurve(com.aixm.delorean.core.schema.a5_1.aixm.CurveType value) {
        AixmCurveType aixmCurve = aixmGeometryAttributesFactory(
            AixmCurveType.class,
            value.getXmlId(),
            value.getHorizontalAccuracy()
            );
        
        aixmCurve.setSegments(CurveGmlHelper.parseGMLcurve(value));

        return aixmCurve;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType printAIXMCurve(AixmCurveType value, com.aixm.delorean.core.schema.a5_1_1.aixm.CurveType curveType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if (value == null) {
            return curveType;
        }

        //setting id
        curveType.setXmlId(value.getId());

        //setting segments
        curveType.setSegments(CurveGmlHelper.printCurveSegmentArrayPropertyType(value.getSegments()));

        //setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        curveType.setHorizontalAccuracy(valDistance);

        ConsoleLogger.log(LogLevel.DEBUG, "CurveType : " + curveType.toString(), new Exception().getStackTrace()[0]);
        return curveType;
    }

    public static com.aixm.delorean.core.schema.a5_1.aixm.CurveType printAIXMCurve(AixmCurveType value, com.aixm.delorean.core.schema.a5_1.aixm.CurveType curveType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if (value == null) {
            return curveType;
        }

        //setting id
        curveType.setXmlId(value.getId());

        //setting segments
        curveType.setSegments(CurveGmlHelper.printCurveSegmentArrayPropertyType(value.getSegments()));

        //setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        curveType.setHorizontalAccuracy(valDistance);

        ConsoleLogger.log(LogLevel.DEBUG, "CurveType : " + curveType.toString(), new Exception().getStackTrace()[0]);
        return curveType;
    }

    public static AixmElevatedCurveType parseAIXMElevatedCurve(com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType value) {
        AixmElevatedCurveType aixmElevatedCurve = elevatedAixmGeometryAttributesFactory(
            AixmElevatedCurveType.class,
            value.getXmlId(),
            value.getHorizontalAccuracy(),
            value.getVerticalAccuracy(),
            value.getElevation(),
            value.getGeoidUndulation(),
            value.getVerticalDatum()
            );
        aixmElevatedCurve.setSegments(CurveGmlHelper.parseGMLcurve(value));

        return aixmElevatedCurve;
    }

    public static AixmElevatedCurveType parseAIXMElevatedCurve(com.aixm.delorean.core.schema.a5_1.aixm.ElevatedCurveType value) {
        AixmElevatedCurveType aixmElevatedCurve = elevatedAixmGeometryAttributesFactory(
            AixmElevatedCurveType.class,
            value.getXmlId(),
            value.getHorizontalAccuracy(),
            value.getVerticalAccuracy(),
            value.getElevation(),
            value.getGeoidUndulation(),
            value.getVerticalDatum()
            );
        aixmElevatedCurve.setSegments(CurveGmlHelper.parseGMLcurve(value));

        return aixmElevatedCurve;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType printAIXMElevatedCurve(AixmElevatedCurveType value, com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedCurveType elevatedCurve) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if (value == null) {
            return elevatedCurve;
        }

        //setting id
        elevatedCurve.setXmlId(value.getId());

        //setting segments
        elevatedCurve.setSegments(CurveGmlHelper.printCurveSegmentArrayPropertyType(value.getSegments()));

        //setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedCurve.setHorizontalAccuracy(valDistance);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType valDistanceVertical = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedCurve.setElevation(valDistanceVertical);

        // setting geoid undulation
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType valDistanceSigned = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedCurve.setGeoidUndulation(valDistanceSigned);

        // setting vertical datum
        com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType codeVerticalDatum = new com.aixm.delorean.core.schema.a5_1_1.aixm.CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedCurve.setVerticalDatum(codeVerticalDatum);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType valDistanceVerticalAccuracy = new com.aixm.delorean.core.schema.a5_1_1.aixm.ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedCurve.setVerticalAccuracy(valDistanceVerticalAccuracy);

        ConsoleLogger.log(LogLevel.DEBUG, "CurveType : " + elevatedCurve.toString(), new Exception().getStackTrace()[0]);
        return elevatedCurve;
    }

    public static com.aixm.delorean.core.schema.a5_1.aixm.ElevatedCurveType printAIXMElevatedCurve(AixmElevatedCurveType value, com.aixm.delorean.core.schema.a5_1.aixm.ElevatedCurveType elevatedCurve) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if (value == null) {
            return elevatedCurve;
        }

        //setting id
        elevatedCurve.setXmlId(value.getId());

        //setting segments
        elevatedCurve.setSegments(CurveGmlHelper.printCurveSegmentArrayPropertyType(value.getSegments()));

        //setting horizontal accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType valDistance = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType();
        valDistance.setValue(value.getHorizontalAccuracy());
        valDistance.setUom(value.getHorizontalAccuracy_uom());
        valDistance.setNilReason(value.getHorizontalAccuracy_nilReason());
        elevatedCurve.setHorizontalAccuracy(valDistance);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceVerticalType valDistanceVertical = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceVerticalType();
        valDistanceVertical.setValue(value.getElevation() != null ? String.valueOf(value.getElevation().doubleValue()) : null);
        valDistanceVertical.setUom(value.getElevation_uom());
        valDistanceVertical.setNilReason(value.getElevation_nilReason());
        elevatedCurve.setElevation(valDistanceVertical);

        // setting geoid undulation
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceSignedType valDistanceSigned = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceSignedType();
        valDistanceSigned.setValue(value.getGeoidUndulation());
        valDistanceSigned.setUom(value.getGeoidUndulation_uom());
        valDistanceSigned.setNilReason(value.getGeoidUndulation_nilReason());
        elevatedCurve.setGeoidUndulation(valDistanceSigned);

        // setting vertical datum
        com.aixm.delorean.core.schema.a5_1.aixm.CodeVerticalDatumType codeVerticalDatum = new com.aixm.delorean.core.schema.a5_1.aixm.CodeVerticalDatumType();
        codeVerticalDatum.setValue(value.getVerticalDatum());
        codeVerticalDatum.setNilReason(value.getVerticalDatum_nilReason());
        elevatedCurve.setVerticalDatum(codeVerticalDatum);

        // setting vertical accuracy
        com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType valDistanceVerticalAccuracy = new com.aixm.delorean.core.schema.a5_1.aixm.ValDistanceType();
        valDistanceVerticalAccuracy.setValue(value.getVerticalAccuracy());
        valDistanceVerticalAccuracy.setUom(value.getVerticalAccuracy_uom());
        valDistanceVerticalAccuracy.setNilReason(value.getVerticalAccuracy_nilReason());
        elevatedCurve.setVerticalAccuracy(valDistanceVerticalAccuracy);

        ConsoleLogger.log(LogLevel.DEBUG, "CurveType : " + elevatedCurve.toString(), new Exception().getStackTrace()[0]);
        return elevatedCurve;
    }

   
    public static AixmSurfaceType parseAIXMSurface(com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType value) {
        AixmSurfaceType aixmSurface = aixmGeometryAttributesFactory(
            AixmSurfaceType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy()
            );
        aixmSurface.setExteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceExterior(value));
        aixmSurface.setInteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceInterior(value));

        return aixmSurface;
    }

    public static AixmSurfaceType parseAIXMSurface(com.aixm.delorean.core.schema.a5_1.aixm.SurfaceType value) {
        AixmSurfaceType aixmSurface = aixmGeometryAttributesFactory(
            AixmSurfaceType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy()
            );
        aixmSurface.setExteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceExterior(value));
        aixmSurface.setInteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceInterior(value));

        return aixmSurface;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType printAIXMSurface(AixmSurfaceType value, com.aixm.delorean.core.schema.a5_1_1.aixm.SurfaceType surfaceType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if (value == null) {
            return surfaceType;
        }

        //setting id
        surfaceType.setXmlId(value.getId());

        return surfaceType;
    }

    public static com.aixm.delorean.core.schema.a5_1.aixm.SurfaceType printAIXMSurface(AixmSurfaceType value, com.aixm.delorean.core.schema.a5_1.aixm.SurfaceType surfaceType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if(value == null) {
            return surfaceType;
        }
        
        //setting id
        surfaceType.setXmlId(value.getId());

        return surfaceType;
    }

    public static AixmElevatedSurfaceType parseAIXMElevatedSurface(com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType value) {
        AixmElevatedSurfaceType elevatedAixmSurface = elevatedAixmGeometryAttributesFactory(
            AixmElevatedSurfaceType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy(),
            value.getVerticalAccuracy(),
            value.getElevation(),
            value.getGeoidUndulation(),
            value.getVerticalDatum()
            );
        elevatedAixmSurface.setExteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceExterior(value));
        elevatedAixmSurface.setInteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceInterior(value));

        return elevatedAixmSurface;
    }

    public static AixmElevatedSurfaceType parseAIXMElevatedSurface(com.aixm.delorean.core.schema.a5_1.aixm.ElevatedSurfaceType value) {
        AixmElevatedSurfaceType elevatedAixmSurface = elevatedAixmGeometryAttributesFactory(
            AixmElevatedSurfaceType.class, 
            value.getXmlId(), 
            value.getHorizontalAccuracy(),
            value.getVerticalAccuracy(),
            value.getElevation(),
            value.getGeoidUndulation(),
            value.getVerticalDatum()
            );
        elevatedAixmSurface.setExteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceExterior(value));
        elevatedAixmSurface.setInteriorlinestring(SurfaceGmlHelper.parseGMLsurfaceInterior(value));

        return elevatedAixmSurface;
    }

    public static com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType printAIXMElevatedSurface(AixmElevatedSurfaceType value, com.aixm.delorean.core.schema.a5_1_1.aixm.ElevatedSurfaceType elevatedSurfaceType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if (value == null) {
            return elevatedSurfaceType;
        }

        //setting id
        elevatedSurfaceType.setXmlId(value.getId());

        return elevatedSurfaceType;
    }

    public static com.aixm.delorean.core.schema.a5_1.aixm.ElevatedSurfaceType printAIXMElevatedSurface(AixmElevatedSurfaceType value, com.aixm.delorean.core.schema.a5_1.aixm.ElevatedSurfaceType elevatedSurfaceType) {
        ConsoleLogger.log(LogLevel.DEBUG, "start", new Exception().getStackTrace()[0]);
        //output object
        if (value == null) {
            return elevatedSurfaceType;
        }

        //setting id
        elevatedSurfaceType.setXmlId(value.getId());
        
        return elevatedSurfaceType;
    }
}
