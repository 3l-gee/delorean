//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for DirectFlightPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="DirectFlightPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractDirectFlight"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DirectFlightPropertyType", propOrder = {
    "abstractDirectFlight"
})
public class DirectFlightPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElementRef(name = "AbstractDirectFlight", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class)
    protected JAXBElement<? extends AbstractDirectFlightType> abstractDirectFlight;

    /**
     * Gets the value of the abstractDirectFlight property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AbstractDirectFlightType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DirectFlightClassType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DirectFlightSegmentType }{@code >}
     *     
     */
    public JAXBElement<? extends AbstractDirectFlightType> getAbstractDirectFlight() {
        return abstractDirectFlight;
    }

    /**
     * Sets the value of the abstractDirectFlight property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AbstractDirectFlightType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DirectFlightClassType }{@code >}
     *     {@link JAXBElement }{@code <}{@link DirectFlightSegmentType }{@code >}
     *     
     */
    public void setAbstractDirectFlight(JAXBElement<? extends AbstractDirectFlightType> value) {
        this.abstractDirectFlight = value;
    }

    public boolean isSetAbstractDirectFlight() {
        return (this.abstractDirectFlight!= null);
    }

}