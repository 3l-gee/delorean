//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GroundLightingAvailabilityPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GroundLightingAvailabilityPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}GroundLightingAvailability"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GroundLightingAvailabilityPropertyType", propOrder = {
    "groundLightingAvailability"
})
@Entity
@Table(name = "groundlightingavailability_pt", schema = "airport_heliport")
public class GroundLightingAvailabilityPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "GroundLightingAvailability", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "groundlightingavailability_id", referencedColumnName = "id")
    protected GroundLightingAvailabilityType groundLightingAvailability;

    /**
     * Gets the value of the groundLightingAvailability property.
     * 
     * @return
     *     possible object is
     *     {@link GroundLightingAvailabilityType }
     *     
     */
    public GroundLightingAvailabilityType getGroundLightingAvailability() {
        return groundLightingAvailability;
    }

    /**
     * Sets the value of the groundLightingAvailability property.
     * 
     * @param value
     *     allowed object is
     *     {@link GroundLightingAvailabilityType }
     *     
     */
    public void setGroundLightingAvailability(GroundLightingAvailabilityType value) {
        this.groundLightingAvailability = value;
    }

    public boolean isSetGroundLightingAvailability() {
        return (this.groundLightingAvailability!= null);
    }

}
