//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeNavigationEquipmentBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeNavigationEquipmentBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="DME"/>
 *     <enumeration value="VOR_DME"/>
 *     <enumeration value="DME_DME"/>
 *     <enumeration value="TACAN"/>
 *     <enumeration value="ILS"/>
 *     <enumeration value="MLS"/>
 *     <enumeration value="GNSS"/>
 *     <enumeration value="WAAS"/>
 *     <enumeration value="LORAN"/>
 *     <enumeration value="INS"/>
 *     <enumeration value="FMS"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeNavigationEquipmentBaseType")
@XmlEnum
public enum CodeNavigationEquipmentBaseType {

    DME,
    VOR_DME,
    DME_DME,
    TACAN,
    ILS,
    MLS,
    GNSS,
    WAAS,
    LORAN,
    INS,
    FMS;

    public String value() {
        return name();
    }

    public static CodeNavigationEquipmentBaseType fromValue(String v) {
        return valueOf(v);
    }

}