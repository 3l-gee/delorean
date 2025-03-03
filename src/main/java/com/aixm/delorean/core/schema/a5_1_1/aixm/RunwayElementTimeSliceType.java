//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

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
 * <p>Java class for RunwayElementTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="RunwayElementTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}RunwayElementPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractRunwayElementExtension"/>
 *                 </sequence>
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
@XmlType(name = "RunwayElementTimeSliceType", propOrder = {
    "type",
    "length",
    "width",
    "gradeSeparation",
    "surfaceProperties",
    "associatedRunway",
    "extent",
    "annotation",
    "availability",
    "extension"
})
@Entity
@Table(name = "runwayelement_ts", schema = "airport_heliport")
public class RunwayElementTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "type_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "type_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeRunwayElementType type;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "length_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "length_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "length_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType length;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "width_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "width_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "width_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType width;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "gradeseparation_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "gradeseparation_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeGradeSeparationType gradeSeparation;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "surfaceproperties_id", referencedColumnName = "id")
    protected SurfaceCharacteristicsPropertyType surfaceProperties;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwayelement_ts_associatedrunway", joinColumns = {
        @JoinColumn(name = "runwayelement_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "runway_pt_id")
    })
    protected List<RunwayPropertyType> associatedRunway;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "extent_id", referencedColumnName = "id")
    protected ElevatedSurfacePropertyType extent;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwayelement_ts_annotation", joinColumns = {
        @JoinColumn(name = "runwayelement_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwayelement_ts_availability", joinColumns = {
        @JoinColumn(name = "runwayelement_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "manoeuvringareaavailability_pt_id")
    })
    protected List<ManoeuvringAreaAvailabilityPropertyType> availability;
    @Transient
    protected List<RunwayElementTimeSliceType.Extension> extension;

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link CodeRunwayElementType }
     *     
     */
    public CodeRunwayElementType getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeRunwayElementType }
     *     
     */
    public void setType(CodeRunwayElementType value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the length property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getLength() {
        return length;
    }

    /**
     * Sets the value of the length property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setLength(ValDistanceType value) {
        this.length = value;
    }

    public boolean isSetLength() {
        return (this.length!= null);
    }

    /**
     * Gets the value of the width property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getWidth() {
        return width;
    }

    /**
     * Sets the value of the width property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setWidth(ValDistanceType value) {
        this.width = value;
    }

    public boolean isSetWidth() {
        return (this.width!= null);
    }

    /**
     * Gets the value of the gradeSeparation property.
     * 
     * @return
     *     possible object is
     *     {@link CodeGradeSeparationType }
     *     
     */
    public CodeGradeSeparationType getGradeSeparation() {
        return gradeSeparation;
    }

    /**
     * Sets the value of the gradeSeparation property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeGradeSeparationType }
     *     
     */
    public void setGradeSeparation(CodeGradeSeparationType value) {
        this.gradeSeparation = value;
    }

    public boolean isSetGradeSeparation() {
        return (this.gradeSeparation!= null);
    }

    /**
     * Gets the value of the surfaceProperties property.
     * 
     * @return
     *     possible object is
     *     {@link SurfaceCharacteristicsPropertyType }
     *     
     */
    public SurfaceCharacteristicsPropertyType getSurfaceProperties() {
        return surfaceProperties;
    }

    /**
     * Sets the value of the surfaceProperties property.
     * 
     * @param value
     *     allowed object is
     *     {@link SurfaceCharacteristicsPropertyType }
     *     
     */
    public void setSurfaceProperties(SurfaceCharacteristicsPropertyType value) {
        this.surfaceProperties = value;
    }

    public boolean isSetSurfaceProperties() {
        return (this.surfaceProperties!= null);
    }

    /**
     * Gets the value of the associatedRunway property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the associatedRunway property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAssociatedRunway().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RunwayPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the associatedRunway property.
     */
    public List<RunwayPropertyType> getAssociatedRunway() {
        if (associatedRunway == null) {
            associatedRunway = new ArrayList<>();
        }
        return this.associatedRunway;
    }

    public boolean isSetAssociatedRunway() {
        return ((this.associatedRunway!= null)&&(!this.associatedRunway.isEmpty()));
    }

    public void unsetAssociatedRunway() {
        this.associatedRunway = null;
    }

    /**
     * Gets the value of the extent property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedSurfacePropertyType }
     *     
     */
    public ElevatedSurfacePropertyType getExtent() {
        return extent;
    }

    /**
     * Sets the value of the extent property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedSurfacePropertyType }
     *     
     */
    public void setExtent(ElevatedSurfacePropertyType value) {
        this.extent = value;
    }

    public boolean isSetExtent() {
        return (this.extent!= null);
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
     * {@link ManoeuvringAreaAvailabilityPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the availability property.
     */
    public List<ManoeuvringAreaAvailabilityPropertyType> getAvailability() {
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
     * {@link RunwayElementTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<RunwayElementTimeSliceType.Extension> getExtension() {
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
     *       <sequence>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractRunwayElementExtension"/>
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
    @XmlType(name = "", propOrder = {
        "abstractRunwayElementExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractRunwayElementExtension", required = true)
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractrunwayelementextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractRunwayElementExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractRunwayElementExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractRunwayElementExtension() {
            return abstractRunwayElementExtension;
        }

        /**
         * Sets the value of the abstractRunwayElementExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractRunwayElementExtension(AbstractExtensionType value) {
            this.abstractRunwayElementExtension = value;
        }

        public boolean isSetAbstractRunwayElementExtension() {
            return (this.abstractRunwayElementExtension!= null);
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
