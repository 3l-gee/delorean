//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gml;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlType;
import jakarta.xml.bind.annotation.XmlValue;


/**
 * The simple type gml:UomIdentifer defines the syntax and value space of the unit of measure identifier.
 * 
 * <p>Java class for UomIdentifier simple type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <simpleType name="UomIdentifier">
 *   <union memberTypes=" {http://www.opengis.net/gml/3.2}UomSymbol {http://www.opengis.net/gml/3.2}UomURI">
 *   </union>
 * </simpleType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "UomIdentifier", propOrder = {
    "value"
})
public class UomIdentifier {

    /**
     * The simple type gml:UomIdentifer defines the syntax and value space of the unit of measure identifier.
     * 
     */
    @XmlValue
    protected String value;

    /**
     * The simple type gml:UomIdentifer defines the syntax and value space of the unit of measure identifier.
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
     * @see #getValue()
     */
    public void setValue(String value) {
        this.value = value;
    }

    public boolean isSetValue() {
        return (this.value!= null);
    }

}