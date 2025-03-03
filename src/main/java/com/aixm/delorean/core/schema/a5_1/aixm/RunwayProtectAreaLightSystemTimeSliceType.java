//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.AttributeOverrides;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for RunwayProtectAreaLightSystemTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="RunwayProtectAreaLightSystemTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1}RunwayProtectAreaLightSystemPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractRunwayProtectAreaLightSystemExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractGroundLightSystemExtension"/>
 *                 </choice>
 *                 <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *               </restriction>
 *             </complexContent>
 *           </complexType>
 *         </element>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RunwayProtectAreaLightSystemTimeSliceType", propOrder = {
    "emergencyLighting",
    "intensityLevel",
    "colour",
    "element",
    "availability",
    "annotation",
    "position",
    "lightedArea",
    "extension"
})
@Entity
@Table(name = "runwayprotectarealightsystem_ts", schema = "airport_heliport")
public class RunwayProtectAreaLightSystemTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "emergencylighting_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "emergencylighting_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType emergencyLighting;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "intensitylevel_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "intensitylevel_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeLightIntensityType intensityLevel;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "colour_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "colour_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeColourType colour;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwayprotectarealightsystem_ts_element", joinColumns = {
        @JoinColumn(name = "runwayprotectarealightsystem_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "lightelement_pt_id")
    })
    protected List<LightElementPropertyType> element;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwayprotectarealightsystem_ts_availability", joinColumns = {
        @JoinColumn(name = "runwayprotectarealightsystem_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "groundlightingavailability_pt_id")
    })
    protected List<GroundLightingAvailabilityPropertyType> availability;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwayprotectarealightsystem_ts_annotation", joinColumns = {
        @JoinColumn(name = "runwayprotectarealightsystem_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "position_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "position_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeProtectAreaSectionType position;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "lightedarea_id", referencedColumnName = "id")
    protected RunwayProtectAreaPropertyType lightedArea;
    @Transient
    protected List<RunwayProtectAreaLightSystemTimeSliceType.Extension> extension;

    /**
     * Gets the value of the emergencyLighting property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getEmergencyLighting() {
        return emergencyLighting;
    }

    /**
     * Sets the value of the emergencyLighting property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setEmergencyLighting(CodeYesNoType value) {
        this.emergencyLighting = value;
    }

    public boolean isSetEmergencyLighting() {
        return (this.emergencyLighting!= null);
    }

    /**
     * Gets the value of the intensityLevel property.
     * 
     * @return
     *     possible object is
     *     {@link CodeLightIntensityType }
     *     
     */
    public CodeLightIntensityType getIntensityLevel() {
        return intensityLevel;
    }

    /**
     * Sets the value of the intensityLevel property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeLightIntensityType }
     *     
     */
    public void setIntensityLevel(CodeLightIntensityType value) {
        this.intensityLevel = value;
    }

    public boolean isSetIntensityLevel() {
        return (this.intensityLevel!= null);
    }

    /**
     * Gets the value of the colour property.
     * 
     * @return
     *     possible object is
     *     {@link CodeColourType }
     *     
     */
    public CodeColourType getColour() {
        return colour;
    }

    /**
     * Sets the value of the colour property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeColourType }
     *     
     */
    public void setColour(CodeColourType value) {
        this.colour = value;
    }

    public boolean isSetColour() {
        return (this.colour!= null);
    }

    /**
     * Gets the value of the element property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the element property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getElement().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link LightElementPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the element property.
     */
    public List<LightElementPropertyType> getElement() {
        if (element == null) {
            element = new ArrayList<>();
        }
        return this.element;
    }

    public boolean isSetElement() {
        return ((this.element!= null)&&(!this.element.isEmpty()));
    }

    public void unsetElement() {
        this.element = null;
    }

    /**
     * Gets the value of the availability property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the availability property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAvailability().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link GroundLightingAvailabilityPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the availability property.
     */
    public List<GroundLightingAvailabilityPropertyType> getAvailability() {
        if (availability == null) {
            availability = new ArrayList<>();
        }
        return this.availability;
    }

    public boolean isSetAvailability() {
        return ((this.availability!= null)&&(!this.availability.isEmpty()));
    }

    public void unsetAvailability() {
        this.availability = null;
    }

    /**
     * Gets the value of the annotation property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the annotation property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAnnotation().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link NotePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the annotation property.
     */
    public List<NotePropertyType> getAnnotation() {
        if (annotation == null) {
            annotation = new ArrayList<>();
        }
        return this.annotation;
    }

    public boolean isSetAnnotation() {
        return ((this.annotation!= null)&&(!this.annotation.isEmpty()));
    }

    public void unsetAnnotation() {
        this.annotation = null;
    }

    /**
     * Gets the value of the position property.
     * 
     * @return
     *     possible object is
     *     {@link CodeProtectAreaSectionType }
     *     
     */
    public CodeProtectAreaSectionType getPosition() {
        return position;
    }

    /**
     * Sets the value of the position property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeProtectAreaSectionType }
     *     
     */
    public void setPosition(CodeProtectAreaSectionType value) {
        this.position = value;
    }

    public boolean isSetPosition() {
        return (this.position!= null);
    }

    /**
     * Gets the value of the lightedArea property.
     * 
     * @return
     *     possible object is
     *     {@link RunwayProtectAreaPropertyType }
     *     
     */
    public RunwayProtectAreaPropertyType getLightedArea() {
        return lightedArea;
    }

    /**
     * Sets the value of the lightedArea property.
     * 
     * @param value
     *     allowed object is
     *     {@link RunwayProtectAreaPropertyType }
     *     
     */
    public void setLightedArea(RunwayProtectAreaPropertyType value) {
        this.lightedArea = value;
    }

    public boolean isSetLightedArea() {
        return (this.lightedArea!= null);
    }

    /**
     * Gets the value of the extension property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the extension property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getExtension().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RunwayProtectAreaLightSystemTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<RunwayProtectAreaLightSystemTimeSliceType.Extension> getExtension() {
        if (extension == null) {
            extension = new ArrayList<>();
        }
        return this.extension;
    }

    public boolean isSetExtension() {
        return ((this.extension!= null)&&(!this.extension.isEmpty()));
    }

    public void unsetExtension() {
        this.extension = null;
    }


    /**
     * <p>Java class for anonymous complex type</p>.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.</p>
     * 
     * <pre>{@code
     * <complexType>
     *   <complexContent>
     *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       <choice>
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractRunwayProtectAreaLightSystemExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractGroundLightSystemExtension"/>
     *       </choice>
     *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
     *     </restriction>
     *   </complexContent>
     * </complexType>
     * }</pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "abstractRunwayProtectAreaLightSystemExtension",
        "abstractGroundLightSystemExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractRunwayProtectAreaLightSystemExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractrunwayprotectarealightsystemextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractRunwayProtectAreaLightSystemExtension;
        @XmlElement(name = "AbstractGroundLightSystemExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractgroundlightsystemextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractGroundLightSystemExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractRunwayProtectAreaLightSystemExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractRunwayProtectAreaLightSystemExtension() {
            return abstractRunwayProtectAreaLightSystemExtension;
        }

        /**
         * Sets the value of the abstractRunwayProtectAreaLightSystemExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractRunwayProtectAreaLightSystemExtension(AbstractExtensionType value) {
            this.abstractRunwayProtectAreaLightSystemExtension = value;
        }

        public boolean isSetAbstractRunwayProtectAreaLightSystemExtension() {
            return (this.abstractRunwayProtectAreaLightSystemExtension!= null);
        }

        /**
         * Gets the value of the abstractGroundLightSystemExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractGroundLightSystemExtension() {
            return abstractGroundLightSystemExtension;
        }

        /**
         * Sets the value of the abstractGroundLightSystemExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractGroundLightSystemExtension(AbstractExtensionType value) {
            this.abstractGroundLightSystemExtension = value;
        }

        public boolean isSetAbstractGroundLightSystemExtension() {
            return (this.abstractGroundLightSystemExtension!= null);
        }

        /**
         * Gets the value of the owns property.
         * 
         * @return
         *     possible object is
         *     {@link Boolean }
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
         *     {@link Boolean }
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

}
