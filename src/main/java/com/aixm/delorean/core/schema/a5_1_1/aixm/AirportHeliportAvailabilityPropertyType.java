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
 * <p>Java class for AirportHeliportAvailabilityPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AirportHeliportAvailabilityPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}AirportHeliportAvailability"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AirportHeliportAvailabilityPropertyType", propOrder = {
    "airportHeliportAvailability"
})
@Embeddable
public class AirportHeliportAvailabilityPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "AirportHeliportAvailability", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected AirportHeliportAvailabilityType airportHeliportAvailability;

    /**
     * Gets the value of the airportHeliportAvailability property.
     * 
     * @return
     *     possible object is
     *     {@link AirportHeliportAvailabilityType }
     *     
     */
    public AirportHeliportAvailabilityType getAirportHeliportAvailability() {
        return airportHeliportAvailability;
    }

    /**
     * Sets the value of the airportHeliportAvailability property.
     * 
     * @param value
     *     allowed object is
     *     {@link AirportHeliportAvailabilityType }
     *     
     */
    public void setAirportHeliportAvailability(AirportHeliportAvailabilityType value) {
        this.airportHeliportAvailability = value;
    }

    public boolean isSetAirportHeliportAvailability() {
        return (this.airportHeliportAvailability!= null);
    }

}
