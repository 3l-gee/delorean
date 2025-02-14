//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1.aixm;

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
 * <p>Java class for HoldingUsePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="HoldingUsePropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1}HoldingUse"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "HoldingUsePropertyType", propOrder = {
    "holdingUse"
})
@Entity
@Table(name = "holdinguse_pt", schema = "procedure")
public class HoldingUsePropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "HoldingUse", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "holdinguse_id", referencedColumnName = "id")
    protected HoldingUseType holdingUse;

    /**
     * Gets the value of the holdingUse property.
     * 
     * @return
     *     possible object is
     *     {@link HoldingUseType }
     *     
     */
    public HoldingUseType getHoldingUse() {
        return holdingUse;
    }

    /**
     * Sets the value of the holdingUse property.
     * 
     * @param value
     *     allowed object is
     *     {@link HoldingUseType }
     *     
     */
    public void setHoldingUse(HoldingUseType value) {
        this.holdingUse = value;
    }

    public boolean isSetHoldingUse() {
        return (this.holdingUse!= null);
    }

}
