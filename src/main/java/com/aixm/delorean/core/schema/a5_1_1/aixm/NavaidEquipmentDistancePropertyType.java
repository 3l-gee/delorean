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
 * <p>Java class for NavaidEquipmentDistancePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="NavaidEquipmentDistancePropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}NavaidEquipmentDistance"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "NavaidEquipmentDistancePropertyType", propOrder = {
    "navaidEquipmentDistance"
})
@Entity
@Table(name = "navaidequipmentdistance_pt", schema = "airport_heliport")
public class NavaidEquipmentDistancePropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "NavaidEquipmentDistance", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "navaidequipmentdistance_id", referencedColumnName = "id")
    protected NavaidEquipmentDistanceType navaidEquipmentDistance;

    /**
     * Gets the value of the navaidEquipmentDistance property.
     * 
     * @return
     *     possible object is
     *     {@link NavaidEquipmentDistanceType }
     *     
     */
    public NavaidEquipmentDistanceType getNavaidEquipmentDistance() {
        return navaidEquipmentDistance;
    }

    /**
     * Sets the value of the navaidEquipmentDistance property.
     * 
     * @param value
     *     allowed object is
     *     {@link NavaidEquipmentDistanceType }
     *     
     */
    public void setNavaidEquipmentDistance(NavaidEquipmentDistanceType value) {
        this.navaidEquipmentDistance = value;
    }

    public boolean isSetNavaidEquipmentDistance() {
        return (this.navaidEquipmentDistance!= null);
    }

}
