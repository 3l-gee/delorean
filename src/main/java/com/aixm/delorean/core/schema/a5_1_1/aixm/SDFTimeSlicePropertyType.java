//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for SDFTimeSlicePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="SDFTimeSlicePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}SDFTimeSlice"/>
 *       </sequence>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SDFTimeSlicePropertyType", propOrder = {
    "sdfTimeSlice"
})
public class SDFTimeSlicePropertyType {

    @XmlElement(name = "SDFTimeSlice", required = true)
    protected SDFTimeSliceType sdfTimeSlice;
    @XmlAttribute(name = "owns")
    protected Boolean owns;

    /**
     * Gets the value of the sdfTimeSlice property.
     * 
     * @return
     *     possible object is
     *     {@link SDFTimeSliceType }
     *     
     */
    public SDFTimeSliceType getSDFTimeSlice() {
        return sdfTimeSlice;
    }

    /**
     * Sets the value of the sdfTimeSlice property.
     * 
     * @param value
     *     allowed object is
     *     {@link SDFTimeSliceType }
     *     
     */
    public void setSDFTimeSlice(SDFTimeSliceType value) {
        this.sdfTimeSlice = value;
    }

    public boolean isSetSDFTimeSlice() {
        return (this.sdfTimeSlice!= null);
    }

    /**
     * Gets the value of the owns property.
     * 
     * @return
     *     possible object is
     *     {@link Boolean }
     *     
     */
    public boolean isOwns() {
        if (owns == null) {
            return false;
        } else {
            return owns;
        }
    }

    /**
     * Sets the value of the owns property.
     * 
     * @param value
     *     allowed object is
     *     {@link Boolean }
     *     
     */
    public void setOwns(boolean value) {
        this.owns = value;
    }

    public boolean isSetOwns() {
        return (this.owns!= null);
    }

    public void unsetOwns() {
        this.owns = null;
    }

}