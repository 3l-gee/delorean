//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeTransponderBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeTransponderBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="MODE_1"/>
 *     <enumeration value="MODE_2"/>
 *     <enumeration value="MODE_3A"/>
 *     <enumeration value="MODE_4"/>
 *     <enumeration value="MODE_5"/>
 *     <enumeration value="MODE_C"/>
 *     <enumeration value="MODE_S"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeTransponderBaseType")
@XmlEnum
public enum CodeTransponderBaseType {

    MODE_1,
    MODE_2,
    MODE_3A,
    MODE_4,
    MODE_5,
    MODE_C,
    MODE_S;

    public String value() {
        return name();
    }

    public static CodeTransponderBaseType fromValue(String v) {
        return valueOf(v);
    }

}