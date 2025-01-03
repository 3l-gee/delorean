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
 * <p>Java class for ReflectorPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="ReflectorPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}Reflector"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ReflectorPropertyType", propOrder = {
    "reflector"
})
@Embeddable
public class ReflectorPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "Reflector", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected ReflectorType reflector;

    /**
     * Gets the value of the reflector property.
     * 
     * @return
     *     possible object is
     *     {@link ReflectorType }
     *     
     */
    public ReflectorType getReflector() {
        return reflector;
    }

    /**
     * Sets the value of the reflector property.
     * 
     * @param value
     *     allowed object is
     *     {@link ReflectorType }
     *     
     */
    public void setReflector(ReflectorType value) {
        this.reflector = value;
    }

    public boolean isSetReflector() {
        return (this.reflector!= null);
    }

}
