//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeSegmentPathBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeSegmentPathBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="AF"/>
 *     <enumeration value="HF"/>
 *     <enumeration value="HA"/>
 *     <enumeration value="HM"/>
 *     <enumeration value="IF"/>
 *     <enumeration value="PI"/>
 *     <enumeration value="PT"/>
 *     <enumeration value="TF"/>
 *     <enumeration value="CA"/>
 *     <enumeration value="CD"/>
 *     <enumeration value="CI"/>
 *     <enumeration value="CR"/>
 *     <enumeration value="CF"/>
 *     <enumeration value="DF"/>
 *     <enumeration value="FA"/>
 *     <enumeration value="FC"/>
 *     <enumeration value="FT"/>
 *     <enumeration value="FM"/>
 *     <enumeration value="VM"/>
 *     <enumeration value="FD"/>
 *     <enumeration value="VR"/>
 *     <enumeration value="VD"/>
 *     <enumeration value="VI"/>
 *     <enumeration value="VA"/>
 *     <enumeration value="RF"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeSegmentPathBaseType")
@XmlEnum
public enum CodeSegmentPathBaseType {

    AF,
    HF,
    HA,
    HM,
    IF,
    PI,
    PT,
    TF,
    CA,
    CD,
    CI,
    CR,
    CF,
    DF,
    FA,
    FC,
    FT,
    FM,
    VM,
    FD,
    VR,
    VD,
    VI,
    VA,
    RF;

    public String value() {
        return name();
    }

    public static CodeSegmentPathBaseType fromValue(String v) {
        return valueOf(v);
    }

}