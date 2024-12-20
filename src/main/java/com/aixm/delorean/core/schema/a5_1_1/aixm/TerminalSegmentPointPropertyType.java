//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Embeddable;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToOne;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for TerminalSegmentPointPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="TerminalSegmentPointPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}TerminalSegmentPoint"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TerminalSegmentPointPropertyType", propOrder = {
    "terminalSegmentPoint"
})
@Embeddable
public class TerminalSegmentPointPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "TerminalSegmentPoint", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected TerminalSegmentPointType terminalSegmentPoint;

    /**
     * Gets the value of the terminalSegmentPoint property.
     * 
     * @return
     *     possible object is
     *     {@link TerminalSegmentPointType }
     *     
     */
    public TerminalSegmentPointType getTerminalSegmentPoint() {
        return terminalSegmentPoint;
    }

    /**
     * Sets the value of the terminalSegmentPoint property.
     * 
     * @param value
     *     allowed object is
     *     {@link TerminalSegmentPointType }
     *     
     */
    public void setTerminalSegmentPoint(TerminalSegmentPointType value) {
        this.terminalSegmentPoint = value;
    }

    public boolean isSetTerminalSegmentPoint() {
        return (this.terminalSegmentPoint!= null);
    }

}
