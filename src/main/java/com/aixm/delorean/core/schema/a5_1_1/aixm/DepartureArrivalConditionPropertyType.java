//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for DepartureArrivalConditionPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="DepartureArrivalConditionPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}DepartureArrivalCondition"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DepartureArrivalConditionPropertyType", propOrder = {
    "departureArrivalCondition"
})
public class DepartureArrivalConditionPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "DepartureArrivalCondition", required = true)
    protected DepartureArrivalConditionType departureArrivalCondition;

    /**
     * Gets the value of the departureArrivalCondition property.
     * 
     * @return
     *     possible object is
     *     {@link DepartureArrivalConditionType }
     *     
     */
    public DepartureArrivalConditionType getDepartureArrivalCondition() {
        return departureArrivalCondition;
    }

    /**
     * Sets the value of the departureArrivalCondition property.
     * 
     * @param value
     *     allowed object is
     *     {@link DepartureArrivalConditionType }
     *     
     */
    public void setDepartureArrivalCondition(DepartureArrivalConditionType value) {
        this.departureArrivalCondition = value;
    }

    public boolean isSetDepartureArrivalCondition() {
        return (this.departureArrivalCondition!= null);
    }

}