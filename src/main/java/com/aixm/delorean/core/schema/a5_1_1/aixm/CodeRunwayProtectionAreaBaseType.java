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
 * <p>Java class for CodeRunwayProtectionAreaBaseType simple type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <simpleType name="CodeRunwayProtectionAreaBaseType">
 *   <union>
 *     <simpleType>
 *       <restriction base="{http://www.w3.org/2001/XMLSchema}string">
 *         <enumeration value="CWY"/>
 *         <enumeration value="RESA"/>
 *         <enumeration value="OFZ"/>
 *         <enumeration value="IOFZ"/>
 *         <enumeration value="POFZ"/>
 *         <enumeration value="ILS"/>
 *         <enumeration value="VGSI"/>
 *         <enumeration value="STOPWAY"/>
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
@XmlType(name = "CodeRunwayProtectionAreaBaseType", propOrder = {
    "value"
})
public class CodeRunwayProtectionAreaBaseType {

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