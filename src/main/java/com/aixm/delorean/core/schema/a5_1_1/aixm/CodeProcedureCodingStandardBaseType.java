//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeProcedureCodingStandardBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeProcedureCodingStandardBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="PANS_OPS"/>
 *     <enumeration value="ARINC_424_15"/>
 *     <enumeration value="ARINC_424_18"/>
 *     <enumeration value="ARINC_424_19"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeProcedureCodingStandardBaseType")
@XmlEnum
public enum CodeProcedureCodingStandardBaseType {

    PANS_OPS,
    ARINC_424_15,
    ARINC_424_18,
    ARINC_424_19;

    public String value() {
        return name();
    }

    public static CodeProcedureCodingStandardBaseType fromValue(String v) {
        return valueOf(v);
    }

}