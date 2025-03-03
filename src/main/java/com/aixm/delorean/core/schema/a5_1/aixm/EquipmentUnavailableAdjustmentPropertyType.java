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
 * <p>Java class for EquipmentUnavailableAdjustmentPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="EquipmentUnavailableAdjustmentPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1}EquipmentUnavailableAdjustment"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EquipmentUnavailableAdjustmentPropertyType", propOrder = {
    "equipmentUnavailableAdjustment"
})
@Entity
@Table(name = "equipmentunavailableadjustment_pt", schema = "procedure")
public class EquipmentUnavailableAdjustmentPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "EquipmentUnavailableAdjustment", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "equipmentunavailableadjustment_id", referencedColumnName = "id")
    protected EquipmentUnavailableAdjustmentType equipmentUnavailableAdjustment;

    /**
     * Gets the value of the equipmentUnavailableAdjustment property.
     * 
     * @return
     *     possible object is
     *     {@link EquipmentUnavailableAdjustmentType }
     *     
     */
    public EquipmentUnavailableAdjustmentType getEquipmentUnavailableAdjustment() {
        return equipmentUnavailableAdjustment;
    }

    /**
     * Sets the value of the equipmentUnavailableAdjustment property.
     * 
     * @param value
     *     allowed object is
     *     {@link EquipmentUnavailableAdjustmentType }
     *     
     */
    public void setEquipmentUnavailableAdjustment(EquipmentUnavailableAdjustmentType value) {
        this.equipmentUnavailableAdjustment = value;
    }

    public boolean isSetEquipmentUnavailableAdjustment() {
        return (this.equipmentUnavailableAdjustment!= null);
    }

}
