//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeTaxiwayBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeTaxiwayBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="AIR"/>
 *     <enumeration value="GND"/>
 *     <enumeration value="EXIT"/>
 *     <enumeration value="FASTEXIT"/>
 *     <enumeration value="STUB"/>
 *     <enumeration value="TURN_AROUND"/>
 *     <enumeration value="PARALLEL"/>
 *     <enumeration value="BYPASS"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeTaxiwayBaseType")
@XmlEnum
public enum CodeTaxiwayBaseType {

    AIR,
    GND,
    EXIT,
    FASTEXIT,
    STUB,
    TURN_AROUND,
    PARALLEL,
    BYPASS;

    public String value() {
        return name();
    }

    public static CodeTaxiwayBaseType fromValue(String v) {
        return valueOf(v);
    }

}