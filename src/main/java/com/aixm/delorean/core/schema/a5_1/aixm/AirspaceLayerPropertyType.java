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
 * <p>Java class for AirspaceLayerPropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AirspaceLayerPropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1}AirspaceLayer"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AirspaceLayerPropertyType", propOrder = {
    "airspaceLayer"
})
@Entity
@Table(name = "airspacelayer_pt", schema = "shared")
public class AirspaceLayerPropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "AirspaceLayer", required = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "airspacelayer_id", referencedColumnName = "id")
    protected AirspaceLayerType airspaceLayer;

    /**
     * Gets the value of the airspaceLayer property.
     * 
     * @return
     *     possible object is
     *     {@link AirspaceLayerType }
     *     
     */
    public AirspaceLayerType getAirspaceLayer() {
        return airspaceLayer;
    }

    /**
     * Sets the value of the airspaceLayer property.
     * 
     * @param value
     *     allowed object is
     *     {@link AirspaceLayerType }
     *     
     */
    public void setAirspaceLayer(AirspaceLayerType value) {
        this.airspaceLayer = value;
    }

    public boolean isSetAirspaceLayer() {
        return (this.airspaceLayer!= null);
    }

}
