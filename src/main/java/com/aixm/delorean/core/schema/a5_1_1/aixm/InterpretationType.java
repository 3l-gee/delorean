//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for null</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType>
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="BASELINE"/>
 *     <enumeration value="SNAPSHOT"/>
 *     <enumeration value="TEMPDELTA"/>
 *     <enumeration value="PERMDELTA"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "")
@XmlEnum
public enum InterpretationType {

    BASELINE,
    SNAPSHOT,
    TEMPDELTA,
    PERMDELTA;

    public String value() {
        return name();
    }

    public static InterpretationType fromValue(String v) {
        return valueOf(v);
    }

}