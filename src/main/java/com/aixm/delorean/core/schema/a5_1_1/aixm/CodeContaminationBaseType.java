//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlType;
import jakarta.xml.bind.annotation.XmlValue;


/**
 * <p>Java class for CodeContaminationBaseType simple type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <simpleType name="CodeContaminationBaseType">
 *   <union>
 *     <simpleType>
 *       <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *         <enumeration value="NONE"/>
 *         <enumeration value="DAMP"/>
 *         <enumeration value="WATER"/>
 *         <enumeration value="FROST"/>
 *         <enumeration value="DRY_SNOW"/>
 *         <enumeration value="WET_SNOW"/>
 *         <enumeration value="SLUSH"/>
 *         <enumeration value="ICE"/>
 *         <enumeration value="COMPACT_SNOW"/>
 *         <enumeration value="RUT"/>
 *         <enumeration value="ASH"/>
 *         <enumeration value="SAND"/>
 *         <enumeration value="OIL"/>
 *         <enumeration value="RUBBER"/>
 *         <enumeration value="GRAS"/>
 *       </restriction>
 *     </simpleType>
 *     <simpleType>
 *       <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *         <pattern value="OTHER(:(\w|_){1,58})?"/>
 *       </restriction>
 *     </simpleType>
 *   </union>
 * </simpleType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CodeContaminationBaseType", propOrder = {
    "value"
})
public class CodeContaminationBaseType {

    @XmlValue
    protected String value;

    /**
     * Gets the value of the value property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getValue() {
        return value;
    }

    /**
     * Sets the value of the value property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setValue(String value) {
        this.value = value;
    }

    public boolean isSetValue() {
        return (this.value!= null);
    }

}