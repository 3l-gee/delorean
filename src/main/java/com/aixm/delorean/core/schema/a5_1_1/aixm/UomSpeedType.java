//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for UomSpeedType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="UomSpeedType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="KM_H"/>
 *     <enumeration value="KT"/>
 *     <enumeration value="MACH"/>
 *     <enumeration value="M_MIN"/>
 *     <enumeration value="FT_MIN"/>
 *     <enumeration value="M_SEC"/>
 *     <enumeration value="FT_SEC"/>
 *     <enumeration value="MPH"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "UomSpeedType")
@XmlEnum
public enum UomSpeedType {

    KM_H,
    KT,
    MACH,
    M_MIN,
    FT_MIN,
    M_SEC,
    FT_SEC,
    MPH;

    public String value() {
        return name();
    }

    public static UomSpeedType fromValue(String v) {
        return valueOf(v);
    }

}