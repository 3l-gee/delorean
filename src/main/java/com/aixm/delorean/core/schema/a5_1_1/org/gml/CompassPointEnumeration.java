//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gml;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * These directions are necessarily approximate, giving direction with a precision of 22.5°. It is thus generally unnecessary to specify the reference frame, though this may be detailed in the definition of a GML application language.
 * 
 * <p>Java class for CompassPointEnumeration</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CompassPointEnumeration">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="N"/>
 *     <enumeration value="NNE"/>
 *     <enumeration value="NE"/>
 *     <enumeration value="ENE"/>
 *     <enumeration value="E"/>
 *     <enumeration value="ESE"/>
 *     <enumeration value="SE"/>
 *     <enumeration value="SSE"/>
 *     <enumeration value="S"/>
 *     <enumeration value="SSW"/>
 *     <enumeration value="SW"/>
 *     <enumeration value="WSW"/>
 *     <enumeration value="W"/>
 *     <enumeration value="WNW"/>
 *     <enumeration value="NW"/>
 *     <enumeration value="NNW"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CompassPointEnumeration")
@XmlEnum
public enum CompassPointEnumeration {

    N,
    NNE,
    NE,
    ENE,
    E,
    ESE,
    SE,
    SSE,
    S,
    SSW,
    SW,
    WSW,
    W,
    WNW,
    NW,
    NNW;

    public String value() {
        return name();
    }

    public static CompassPointEnumeration fromValue(String v) {
        return valueOf(v);
    }

}