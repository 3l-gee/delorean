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
 * <p>Java class for TerminalArrivalAreaTimeSlicePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="TerminalArrivalAreaTimeSlicePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}TerminalArrivalAreaTimeSlice"/>
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
@XmlType(name = "TerminalArrivalAreaTimeSlicePropertyType", propOrder = {
    "terminalArrivalAreaTimeSlice"
})
public class TerminalArrivalAreaTimeSlicePropertyType {

    @XmlElement(name = "TerminalArrivalAreaTimeSlice", required = true)
    protected TerminalArrivalAreaTimeSliceType terminalArrivalAreaTimeSlice;
    @XmlAttribute(name = "owns")
    protected Boolean owns;

    /**
     * Gets the value of the terminalArrivalAreaTimeSlice property.
     * 
     * @return
     *     possible object is
     *     {@link TerminalArrivalAreaTimeSliceType }
     *     
     */
    public TerminalArrivalAreaTimeSliceType getTerminalArrivalAreaTimeSlice() {
        return terminalArrivalAreaTimeSlice;
    }

    /**
     * Sets the value of the terminalArrivalAreaTimeSlice property.
     * 
     * @param value
     *     allowed object is
     *     {@link TerminalArrivalAreaTimeSliceType }
     *     
     */
    public void setTerminalArrivalAreaTimeSlice(TerminalArrivalAreaTimeSliceType value) {
        this.terminalArrivalAreaTimeSlice = value;
    }

    public boolean isSetTerminalArrivalAreaTimeSlice() {
        return (this.terminalArrivalAreaTimeSlice!= null);
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