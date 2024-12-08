package com.aixm.delorean.core.helper.time;

import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractTimeGeometricPrimitiveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractTimePrimitiveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.AbstractTimeTopologyPrimitiveType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeEdgeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeInstantPropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeInstantType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeNodeType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePeriodType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePositionType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimePrimitivePropertyType;
import com.aixm.delorean.core.schema.a5_1_1.org.gml.TimeIndeterminateValueType;

import jakarta.xml.bind.JAXBElement;

import java.time.Instant;
import java.time.format.DateTimeParseException;
import java.util.List;

import com.aixm.delorean.core.adapter.type.time.AixmTimeSliceType;

public class TimeSliceHelper {

    public AixmTimeSliceType parseValidTime(TimePrimitivePropertyType validTime){
        if (validTime != null) {
            JAXBElement<? extends AbstractTimePrimitiveType> abstractTimePrimitive = validTime.getAbstractTimePrimitive();
            if (abstractTimePrimitive.getValue() instanceof AbstractTimeGeometricPrimitiveType) {
                return parseAbstractTimeGeometricPrimitiveType((AbstractTimeGeometricPrimitiveType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof AbstractTimePrimitiveType) {
                return parseAbstractTimePrimitiveType((AbstractTimePrimitiveType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof AbstractTimeTopologyPrimitiveType) {
                return parseAbstractTimeTopologyPrimitiveType((AbstractTimeTopologyPrimitiveType) abstractTimePrimitive.getValue());

            } else if (abstractTimePrimitive.getValue() instanceof TimeEdgeType) {
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

    public TimePrimitivePropertyType printValidTime(AixmTimeSliceType aixmTime){
        return null;

    }

    public AixmTimeSliceType parseFeatureLifetime(TimePrimitivePropertyType lifeTime){
        return null;

    }

    public TimePrimitivePropertyType printFeatureLifetime(AixmTimeSliceType aixmTime){
        return null;

    }

    public AixmTimeSliceType parseAbstractTimeGeometricPrimitiveType (AbstractTimeGeometricPrimitiveType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public AixmTimeSliceType parseAbstractTimePrimitiveType (AbstractTimePrimitiveType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public AixmTimeSliceType parseAbstractTimeTopologyPrimitiveType (AbstractTimeTopologyPrimitiveType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public AixmTimeSliceType parseTimeEdgeType (TimeEdgeType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public AixmTimeSliceType parseTimeInstantType (TimeInstantType v){
        TimePositionType timePosition = v.getTimePosition();
        // return timePosition;
        return null;
    }

    public AixmTimeSliceType parseTimeNodeType (TimeNodeType v){
        throw new IllegalArgumentException("Unsupoorted type" + v.getClass().getName());
    }

    public AixmTimeSliceType parseTimePeriodType (TimePeriodType v){

        TimePositionType beginPosition = v.getBeginPosition();
        TimePositionType endPosition = v.getEndPosition(); 

        String beginString = beginPosition.getValue().isEmpty() ? null : beginPosition.getValue().get(0);
        String endString = endPosition.getValue().isEmpty() ? null : endPosition.getValue().get(0);

        TimeIndeterminateValueType beginIndeterminate = beginPosition.getIndeterminatePosition();
        TimeIndeterminateValueType endIndeterminate = endPosition.getIndeterminatePosition();

        Instant begin = parseTimeString(beginString);   
        Instant end = parseTimeString(endString);

        AixmTimeSliceType aixmTime = new AixmTimeSliceType();

        if (beginPosition == null && endPosition == null) {

        } else if (beginPosition == null && endPosition != null) {

        } else if (beginPosition != null && endPosition == null) {

        } else if (endPosition != null && beginPosition != null) {

        }


        return null;
    }

    public Instant parseTimeString(String timeString) {
        // Regex to match ISO 8601 format with optional fractional seconds and timezone offset
        String iso8601Regex = "^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}(?:\\.\\d+)?([+-]\\d{2}:\\d{2}|Z)?$";

        // Check if the string matches the ISO 8601 format
        if (timeString.matches(iso8601Regex)) {
            try {
                return Instant.parse(timeString);
            } catch (DateTimeParseException e) {
                throw new IllegalArgumentException("Invalid time string", e);
            }
        } else if (timeString == null || timeString.isEmpty()) {
            return null;
        } else {
            throw new IllegalArgumentException("Invalid time string");
        }
    }

}
