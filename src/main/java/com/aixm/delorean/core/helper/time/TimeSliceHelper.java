package com.aixm.delorean.core.helper.time;

import com.aixm.delorean.core.adapter.type.time.AixmTimeSliceType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractTimeGeometricPrimitiveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractTimePrimitiveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractTimeTopologyPrimitiveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeEdgeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeInstantType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeNodeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePeriodType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePrimitivePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeIndeterminateValueType;

import jakarta.xml.bind.JAXBElement;

import java.time.Instant;
import java.time.format.DateTimeParseException;

public class TimeSliceHelper {

    public static AixmTimeSliceType parseValidTime(TimePrimitivePropertyType validTime){
        if (validTime != null) {
            JAXBElement<? extends AbstractTimePrimitiveType> abstractTimePrimitive = validTime.getAbstractTimePrimitive();
            if (abstractTimePrimitive.getValue() instanceof TimeEdgeType) {
                return parseTimeEdgeType((TimeEdgeType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof TimeInstantType) {
                return parseTimeInstantType((TimeInstantType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof TimeNodeType) {
                return parseTimeNodeType((TimeNodeType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof TimePeriodType) {
                return parseTimePeriodType((TimePeriodType) abstractTimePrimitive.getValue());

            } else {
                throw new IllegalArgumentException("Unsupported type " + abstractTimePrimitive.getValue().getClass().getName());
            }
        }
        throw new IllegalArgumentException("ValidTime cannot be null");
    }

    public static TimePrimitivePropertyType printValidTime(AixmTimeSliceType aixmTime){
        TimePrimitivePropertyType validTime = new TimePrimitivePropertyType();
        TimePeriodType timePeriod = printTimePeriodType(aixmTime);
        JAXBElement<TimePeriodType> timePeriodElement = new JAXBElement<>(null, TimePeriodType.class, timePeriod);
        validTime.setAbstractTimePrimitive(timePeriodElement);
        return validTime;
    }

    public static AixmTimeSliceType parseFeatureLifetime(TimePrimitivePropertyType lifeTime){
        if (lifeTime != null) {
            JAXBElement<? extends AbstractTimePrimitiveType> abstractTimePrimitive = lifeTime.getAbstractTimePrimitive();
            if (abstractTimePrimitive.getValue() instanceof TimeEdgeType) {
                return parseTimeEdgeType((TimeEdgeType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof TimeInstantType) {
                return parseTimeInstantType((TimeInstantType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof TimeNodeType) {
                return parseTimeNodeType((TimeNodeType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof TimePeriodType) {
                return parseTimePeriodType((TimePeriodType) abstractTimePrimitive.getValue());

            } else {
                throw new IllegalArgumentException("Unsupported type " + abstractTimePrimitive.getValue().getClass().getName());
            }
        }
        throw new IllegalArgumentException("ValidTime cannot be null");

    }

    public static TimePrimitivePropertyType printFeatureLifetime(AixmTimeSliceType aixmTime){
        TimePrimitivePropertyType lifeTime = new TimePrimitivePropertyType();
        TimePeriodType timePeriod = printTimePeriodType(aixmTime);
        JAXBElement<TimePeriodType> timePeriodElement = new JAXBElement<>(null, TimePeriodType.class, timePeriod);
        lifeTime.setAbstractTimePrimitive(timePeriodElement);
        return lifeTime;

    }

    public static AixmTimeSliceType parseAbstractTimeGeometricPrimitiveType (AbstractTimeGeometricPrimitiveType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public static AixmTimeSliceType parseAbstractTimePrimitiveType (AbstractTimePrimitiveType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public static AixmTimeSliceType parseAbstractTimeTopologyPrimitiveType (AbstractTimeTopologyPrimitiveType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public static AixmTimeSliceType parseTimeEdgeType (TimeEdgeType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public static AixmTimeSliceType parseTimeInstantType (TimeInstantType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public static AixmTimeSliceType parseTimeNodeType (TimeNodeType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public static AixmTimeSliceType parseTimePeriodType (TimePeriodType v){
        TimePositionType beginPosition = v.getBeginPosition();
        TimePositionType endPosition = v.getEndPosition(); 

        String beginString = beginPosition.getValue().isEmpty() ? null : beginPosition.getValue().get(0);
        String endString = endPosition.getValue().isEmpty() ? null : endPosition.getValue().get(0);

        TimeIndeterminateValueType beginIndeterminate = beginPosition.getIndeterminatePosition();
        TimeIndeterminateValueType endIndeterminate = endPosition.getIndeterminatePosition();

        Instant begin = parseTimeString(beginString);   
        Instant end = parseTimeString(endString);

        AixmTimeSliceType aixmTime = new AixmTimeSliceType();

        if (begin == null && end == null) {
            throw new IllegalArgumentException("Invalid time period " + v.getClass().getName());

        } else if (begin == null && end != null) {
            throw new IllegalArgumentException("Invalid time period " + v.getClass().getName());

        } else if (begin != null && end == null) {
            aixmTime.setBeginPosition(begin);
            aixmTime.setEndPosition((parseTimeIndeterminateValueType(endIndeterminate)));
            return aixmTime;

        } else if (begin != null && end != null) {
            aixmTime.setBeginPosition(begin);
            aixmTime.setEndPosition(end);
            return aixmTime;
        }

        return null;
    }

    public static TimePeriodType printTimePeriodType (AixmTimeSliceType v){
        TimePeriodType timePeriod = new TimePeriodType();
        TimePositionType beginPosition = new TimePositionType();
        TimePositionType endPosition = new TimePositionType();

        beginPosition.getValue().add(v.getBeginPosition() == null ? null : v.getBeginPosition().toString());
        beginPosition.setIndeterminatePosition(printTimeIndeterminateValueType(v.getBeginPosition()));

        endPosition.getValue().add(v.getEndPosition() == null ? null : v.getEndPosition().toString());
        endPosition.setIndeterminatePosition(printTimeIndeterminateValueType(v.getEndPosition()));

        timePeriod.setBeginPosition(beginPosition);
        timePeriod.setEndPosition(endPosition);

        return timePeriod;
    }


    public static Instant parseTimeIndeterminateValueType (TimeIndeterminateValueType v){
        if (v == TimeIndeterminateValueType.AFTER) {
            throw new IllegalArgumentException("Unsupported type " + v.getClass().getName());
        } else if (v == TimeIndeterminateValueType.BEFORE) {
            throw new IllegalArgumentException("Unsupported type " + v.getClass().getName());
        } else if (v == TimeIndeterminateValueType.NOW) {
            throw new IllegalArgumentException("Unsupported type " + v.getClass().getName());
        } else if (v == TimeIndeterminateValueType.UNKNOWN) {
            return null;
        } else {
            throw new IllegalArgumentException("Unsupported type " + v.getClass().getName());
        }
    }

    public static TimeIndeterminateValueType printTimeIndeterminateValueType (Instant v){
        if (v == null) {
            return TimeIndeterminateValueType.UNKNOWN;
        } else {
            throw new IllegalArgumentException("Unsupported type " + v.getClass().getName());
        }
    }

    public static Instant parseTimeString(String timeString) {
        // Return null for null or empty strings
        if (timeString == null || timeString.isEmpty()) {
            return null;
        }
    
        // Regex to match ISO 8601 format with optional fractional seconds and timezone offset
        // Format: YYYY-MM-DDTHH:mm:ss[.fractionalSeconds][Z|±HH:mm]
        String iso8601Regex = "^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}(?:\\.\\d+)?([+-]\\d{2}:\\d{2}|Z)?$";
    
        // Validate and parse the string
        if (timeString.matches(iso8601Regex)) {
            try {
                return Instant.parse(timeString);
            } catch (DateTimeParseException e) {
                throw new IllegalArgumentException("Invalid time string format", e);
            }
        }
    
        // If regex doesn't match, throw an exception
        throw new IllegalArgumentException("Invalid time string format");
    }

}
