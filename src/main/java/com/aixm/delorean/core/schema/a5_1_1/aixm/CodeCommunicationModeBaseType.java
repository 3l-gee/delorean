//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeCommunicationModeBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeCommunicationModeBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="HF"/>
 *     <enumeration value="VHF"/>
 *     <enumeration value="VDL1"/>
 *     <enumeration value="VDL2"/>
 *     <enumeration value="VDL4"/>
 *     <enumeration value="AMSS"/>
 *     <enumeration value="ADS_B"/>
 *     <enumeration value="ADS_B_VDL"/>
 *     <enumeration value="HFDL"/>
 *     <enumeration value="VHF_833"/>
 *     <enumeration value="UHF"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeCommunicationModeBaseType")
@XmlEnum
public enum CodeCommunicationModeBaseType {

    HF,
    VHF,
    VDL1,
    VDL2,
    VDL4,
    AMSS,
    ADS_B,
    ADS_B_VDL,
    HFDL,
    VHF_833,
    UHF;

    public String value() {
        return name();
    }

    public static CodeCommunicationModeBaseType fromValue(String v) {
        return valueOf(v);
    }

}