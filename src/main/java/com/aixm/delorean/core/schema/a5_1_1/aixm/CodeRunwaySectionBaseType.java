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
 * <p>Java class for CodeRunwaySectionBaseType simple type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <simpleType name="CodeRunwaySectionBaseType">
 *   <union>
 *     <simpleType>
 *       <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *         <enumeration value="TDZ"/>
 *         <enumeration value="AIM"/>
 *         <enumeration value="CL"/>
 *         <enumeration value="EDGE"/>
 *         <enumeration value="THR"/>
 *         <enumeration value="DESIG"/>
 *         <enumeration value="AFT_THR"/>
 *         <enumeration value="DTHR"/>
 *         <enumeration value="END"/>
 *         <enumeration value="TWY_INT"/>
 *         <enumeration value="RPD_TWY_INT"/>
 *         <enumeration value="1_THIRD"/>
 *         <enumeration value="2_THIRD"/>
 *         <enumeration value="3_THIRD"/>
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
@XmlType(name = "CodeRunwaySectionBaseType", propOrder = {
    "value"
})
public class CodeRunwaySectionBaseType {

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