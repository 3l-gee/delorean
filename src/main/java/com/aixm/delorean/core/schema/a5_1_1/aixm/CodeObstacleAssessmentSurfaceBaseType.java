//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlEnum;
import jakarta.xml.bind.annotation.XmlEnumValue;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CodeObstacleAssessmentSurfaceBaseType</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * <pre>{@code
 * <simpleType name="CodeObstacleAssessmentSurfaceBaseType">
 *   <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *     <enumeration value="40_TO_1"/>
 *     <enumeration value="72_TO_1"/>
 *     <enumeration value="MA"/>
 *     <enumeration value="FINAL"/>
 *     <enumeration value="PT_ENTRY_AREA"/>
 *     <enumeration value="PRIMARY"/>
 *     <enumeration value="SECONDARY"/>
 *     <enumeration value="ZONE1"/>
 *     <enumeration value="ZONE2"/>
 *     <enumeration value="ZONE3"/>
 *     <enumeration value="AREA1"/>
 *     <enumeration value="AREA2"/>
 *     <enumeration value="AREA3"/>
 *     <enumeration value="TURN_INITIATION"/>
 *     <enumeration value="TURN"/>
 *     <enumeration value="DER"/>
 *   </restriction>
 * </simpleType>
 * }</pre>
 * 
 */
@XmlType(name = "CodeObstacleAssessmentSurfaceBaseType")
@XmlEnum
public enum CodeObstacleAssessmentSurfaceBaseType {

    @XmlEnumValue("40_TO_1")
    VALUE_1("40_TO_1"),
    @XmlEnumValue("72_TO_1")
    VALUE_2("72_TO_1"),
    @XmlEnumValue("MA")
    VALUE_3("MA"),
    @XmlEnumValue("FINAL")
    VALUE_4("FINAL"),
    @XmlEnumValue("PT_ENTRY_AREA")
    VALUE_5("PT_ENTRY_AREA"),
    @XmlEnumValue("PRIMARY")
    VALUE_6("PRIMARY"),
    @XmlEnumValue("SECONDARY")
    VALUE_7("SECONDARY"),
    @XmlEnumValue("ZONE1")
    VALUE_8("ZONE1"),
    @XmlEnumValue("ZONE2")
    VALUE_9("ZONE2"),
    @XmlEnumValue("ZONE3")
    VALUE_10("ZONE3"),
    @XmlEnumValue("AREA1")
    VALUE_11("AREA1"),
    @XmlEnumValue("AREA2")
    VALUE_12("AREA2"),
    @XmlEnumValue("AREA3")
    VALUE_13("AREA3"),
    @XmlEnumValue("TURN_INITIATION")
    VALUE_14("TURN_INITIATION"),
    @XmlEnumValue("TURN")
    VALUE_15("TURN"),
    @XmlEnumValue("DER")
    VALUE_16("DER");
    private final String value;

    CodeObstacleAssessmentSurfaceBaseType(String v) {
        value = v;
    }

    /**
     * Gets the value associated to the enum constant.
     * 
     * @return
     *     The value linked to the enum.
     */
    public String value() {
        return value;
    }

    /**
     * Gets the enum associated to the value passed as parameter.
     * 
     * @param v
     *     The value to get the enum from.
     * @return
     *     The enum which corresponds to the value, if it exists.
     * @throws IllegalArgumentException
     *     If no value matches in the enum declaration.
     */
    public static CodeObstacleAssessmentSurfaceBaseType fromValue(String v) {
        for (CodeObstacleAssessmentSurfaceBaseType c: CodeObstacleAssessmentSurfaceBaseType.values()) {
            if (c.value.equals(v)) {
                return c;
            }
        }
        throw new IllegalArgumentException(v);
    }

}