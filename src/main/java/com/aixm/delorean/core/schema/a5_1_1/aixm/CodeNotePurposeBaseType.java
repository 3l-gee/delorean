//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeNotePurposeBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeNotePurposeBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="DESCRIPTION"/>
 *     <enumeration value="REMARK"/>
 *     <enumeration value="WARNING"/>
 *     <enumeration value="DISCLAIMER"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeNotePurposeBaseType")
@XmlEnum
public enum CodeNotePurposeBaseType {

    DESCRIPTION,
    REMARK,
    WARNING,
    DISCLAIMER;

    public String value() {
        return name();
    }

    public static CodeNotePurposeBaseType fromValue(String v) {
        return valueOf(v);
    }

}