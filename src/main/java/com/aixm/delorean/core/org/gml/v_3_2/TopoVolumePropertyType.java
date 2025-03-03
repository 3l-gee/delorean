//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gml.v_3_2;

import jakarta.persistence.Transient;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for TopoVolumePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="TopoVolumePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element ref="{http://www.opengis.net/gml/3.2}TopoVolume"/>
 *       </sequence>
 *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TopoVolumePropertyType", propOrder = {
    "topoVolume"
})
public class TopoVolumePropertyType {

    /**
     * gml:TopoVolume represents a homogeneous topological expression, a set of directed topologic solids, which if realised are isomorphic to a geometric solid primitive. The intended use of gml:TopoVolume is to appear within a solid feature to express the structural and geometric relationships of this solid feature to other features via the shared solid definitions.
     * 
     */
    @XmlElement(name = "TopoVolume", required = true)
    protected TopoVolumeType topoVolume;
    @XmlAttribute(name = "owns")
    @Transient
    protected java.lang.Boolean owns;

    /**
     * gml:TopoVolume represents a homogeneous topological expression, a set of directed topologic solids, which if realised are isomorphic to a geometric solid primitive. The intended use of gml:TopoVolume is to appear within a solid feature to express the structural and geometric relationships of this solid feature to other features via the shared solid definitions.
     * 
     * @return
     *     possible object is
     *     {@link TopoVolumeType }
     *     
     */
    public TopoVolumeType getTopoVolume() {
        return topoVolume;
    }

    /**
     * Sets the value of the topoVolume property.
     * 
     * @param value
     *     allowed object is
     *     {@link TopoVolumeType }
     *     
     * @see #getTopoVolume()
     */
    public void setTopoVolume(TopoVolumeType value) {
        this.topoVolume = value;
    }

    public boolean isSetTopoVolume() {
        return (this.topoVolume!= null);
    }

    /**
     * Gets the value of the owns property.
     * 
     * @return
     *     possible object is
     *     {@link java.lang.Boolean }
     *     
     */
    public boolean isOwns() {
        if (owns == null) {
            return false;
        } else {
            return owns;
        }
    }

    /**
     * Sets the value of the owns property.
     * 
     * @param value
     *     allowed object is
     *     {@link java.lang.Boolean }
     *     
     */
    public void setOwns(boolean value) {
        this.owns = value;
    }

    public boolean isSetOwns() {
        return (this.owns!= null);
    }

    public void unsetOwns() {
        this.owns = null;
    }

}
