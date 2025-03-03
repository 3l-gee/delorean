//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for UsageConditionPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="UsageConditionPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractUsageCondition"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "UsageConditionPropertyType", propOrder = {
    "abstractUsageCondition"
})
@Entity
@Table(name = "usagecondition_pt", schema = "airport_heliport")
public class UsageConditionPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElementRef(name = "AbstractUsageCondition", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class)
    @Transient
    protected JAXBElement<? extends AbstractUsageConditionType> abstractUsageCondition;

    /**
     * Gets the value of the abstractUsageCondition property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AbstractUsageConditionType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AirportHeliportUsageType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ApronAreaUsageType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ManoeuvringAreaUsageType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractUsageConditionType> getAbstractUsageCondition() {
        return abstractUsageCondition;
    }

    /**
     * Sets the value of the abstractUsageCondition property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AbstractUsageConditionType }{@code >}
     *     {@link JAXBElement }{@code <}{@link AirportHeliportUsageType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ApronAreaUsageType }{@code >}
     *     {@link JAXBElement }{@code <}{@link ManoeuvringAreaUsageType }{@code >}
     *     
     */
    public void setAbstractUsageCondition(JAXBElement<? extends AbstractUsageConditionType> value) {
        this.abstractUsageCondition = value;
    }

    public boolean isSetAbstractUsageCondition() {
        return (this.abstractUsageCondition!= null);
    }

}
