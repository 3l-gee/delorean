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
 * <p>Java class for UnitDependencyPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="UnitDependencyPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}UnitDependency"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "UnitDependencyPropertyType", propOrder = {
    "unitDependency"
})
@Entity
@Table(name = "unitdependency_pt", schema = "organisation")
public class UnitDependencyPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "UnitDependency", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "unitdependency_id", referencedColumnName = "id")
    protected UnitDependencyType unitDependency;

    /**
     * Gets the value of the unitDependency property.
     * 
     * @return
     *     possible object is
     *     {@link UnitDependencyType }
     *     
     */
    public UnitDependencyType getUnitDependency() {
        return unitDependency;
    }

    /**
     * Sets the value of the unitDependency property.
     * 
     * @param value
     *     allowed object is
     *     {@link UnitDependencyType }
     *     
     */
    public void setUnitDependency(UnitDependencyType value) {
        this.unitDependency = value;
    }

    public boolean isSetUnitDependency() {
        return (this.unitDependency!= null);
    }

}
