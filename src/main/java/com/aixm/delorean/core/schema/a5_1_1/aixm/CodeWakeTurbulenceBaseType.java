//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeWakeTurbulenceBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeWakeTurbulenceBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="LOW"/>
 *     <enumeration value="MEDIUM"/>
 *     <enumeration value="HIGH"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeWakeTurbulenceBaseType")
@XmlEnum
public enum CodeWakeTurbulenceBaseType {

    LOW,
    MEDIUM,
    HIGH;

    public String value() {
        return name();
    }

    public static CodeWakeTurbulenceBaseType fromValue(String v) {
        return valueOf(v);
    }

}