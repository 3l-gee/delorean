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
 * <p>Java class for RoadTimeSlicePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="RoadTimeSlicePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}RoadTimeSlice"/>
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
@XmlType(name = "RoadTimeSlicePropertyType", propOrder = {
    "roadTimeSlice"
})
public class RoadTimeSlicePropertyType {

    @XmlElement(name = "RoadTimeSlice", required = true)
    protected RoadTimeSliceType roadTimeSlice;
    @XmlAttribute(name = "owns")
    protected Boolean owns;

    /**
     * Gets the value of the roadTimeSlice property.
     * 
     * @return
     *     possible object is
     *     {@link RoadTimeSliceType }
     *     
     */
    public RoadTimeSliceType getRoadTimeSlice() {
        return roadTimeSlice;
    }

    /**
     * Sets the value of the roadTimeSlice property.
     * 
     * @param value
     *     allowed object is
     *     {@link RoadTimeSliceType }
     *     
     */
    public void setRoadTimeSlice(RoadTimeSliceType value) {
        this.roadTimeSlice = value;
    }

    public boolean isSetRoadTimeSlice() {
        return (this.roadTimeSlice!= null);
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