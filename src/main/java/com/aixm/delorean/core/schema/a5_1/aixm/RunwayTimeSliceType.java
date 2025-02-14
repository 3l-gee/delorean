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
 * <p>Java class for RunwayTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="RunwayTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1}RunwayPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractRunwayExtension"/>
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
@XmlType(name = "RunwayTimeSliceType", propOrder = {
    "designator",
    "type",
    "nominalLength",
    "lengthAccuracy",
    "nominalWidth",
    "widthAccuracy",
    "widthShoulder",
    "lengthStrip",
    "widthStrip",
    "lengthOffset",
    "widthOffset",
    "abandoned",
    "surfaceProperties",
    "associatedAirportHeliport",
    "overallContaminant",
    "annotation",
    "areaContaminant",
    "extension"
})
@Entity
@Table(name = "runway_ts", schema = "airport_heliport")
public class RunwayTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "designator_value", length = 16, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "designator_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextDesignatorType designator;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "type_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "type_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeRunwayType type;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "nominallength_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "nominallength_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "nominallength_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType nominalLength;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "lengthaccuracy_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "lengthaccuracy_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "lengthaccuracy_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType lengthAccuracy;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "nominalwidth_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "nominalwidth_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "nominalwidth_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType nominalWidth;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "widthaccuracy_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "widthaccuracy_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "widthaccuracy_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType widthAccuracy;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "widthshoulder_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "widthshoulder_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "widthshoulder_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType widthShoulder;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "lengthstrip_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "lengthstrip_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "lengthstrip_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType lengthStrip;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "widthstrip_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "widthstrip_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "widthstrip_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType widthStrip;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "lengthoffset_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "lengthoffset_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "lengthoffset_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceSignedType lengthOffset;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "widthoffset_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "widthoffset_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "widthoffset_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceSignedType widthOffset;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "abandoned_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "abandoned_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType abandoned;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "surfaceproperties_id", referencedColumnName = "id")
    protected SurfaceCharacteristicsPropertyType surfaceProperties;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "associatedairportheliport_id", referencedColumnName = "id")
    protected AirportHeliportPropertyType associatedAirportHeliport;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runway_ts_overallcontaminant", joinColumns = {
        @JoinColumn(name = "runway_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "runwaycontamination_pt_id")
    })
    protected List<RunwayContaminationPropertyType> overallContaminant;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runway_ts_annotation", joinColumns = {
        @JoinColumn(name = "runway_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runway_ts_areacontaminant", joinColumns = {
        @JoinColumn(name = "runway_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "runwaysectioncontamination_pt_id")
    })
    protected List<RunwaySectionContaminationPropertyType> areaContaminant;
    @Transient
    protected List<RunwayTimeSliceType.Extension> extension;

    /**
     * Gets the value of the designator property.
     * 
     * @return
     *     possible object is
     *     {@link TextDesignatorType }
     *     
     */
    public TextDesignatorType getDesignator() {
        return designator;
    }

    /**
     * Sets the value of the designator property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextDesignatorType }
     *     
     */
    public void setDesignator(TextDesignatorType value) {
        this.designator = value;
    }

    public boolean isSetDesignator() {
        return (this.designator!= null);
    }

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link CodeRunwayType }
     *     
     */
    public CodeRunwayType getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeRunwayType }
     *     
     */
    public void setType(CodeRunwayType value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the nominalLength property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getNominalLength() {
        return nominalLength;
    }

    /**
     * Sets the value of the nominalLength property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setNominalLength(ValDistanceType value) {
        this.nominalLength = value;
    }

    public boolean isSetNominalLength() {
        return (this.nominalLength!= null);
    }

    /**
     * Gets the value of the lengthAccuracy property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getLengthAccuracy() {
        return lengthAccuracy;
    }

    /**
     * Sets the value of the lengthAccuracy property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setLengthAccuracy(ValDistanceType value) {
        this.lengthAccuracy = value;
    }

    public boolean isSetLengthAccuracy() {
        return (this.lengthAccuracy!= null);
    }

    /**
     * Gets the value of the nominalWidth property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getNominalWidth() {
        return nominalWidth;
    }

    /**
     * Sets the value of the nominalWidth property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setNominalWidth(ValDistanceType value) {
        this.nominalWidth = value;
    }

    public boolean isSetNominalWidth() {
        return (this.nominalWidth!= null);
    }

    /**
     * Gets the value of the widthAccuracy property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getWidthAccuracy() {
        return widthAccuracy;
    }

    /**
     * Sets the value of the widthAccuracy property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setWidthAccuracy(ValDistanceType value) {
        this.widthAccuracy = value;
    }

    public boolean isSetWidthAccuracy() {
        return (this.widthAccuracy!= null);
    }

    /**
     * Gets the value of the widthShoulder property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getWidthShoulder() {
        return widthShoulder;
    }

    /**
     * Sets the value of the widthShoulder property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setWidthShoulder(ValDistanceType value) {
        this.widthShoulder = value;
    }

    public boolean isSetWidthShoulder() {
        return (this.widthShoulder!= null);
    }

    /**
     * Gets the value of the lengthStrip property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getLengthStrip() {
        return lengthStrip;
    }

    /**
     * Sets the value of the lengthStrip property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setLengthStrip(ValDistanceType value) {
        this.lengthStrip = value;
    }

    public boolean isSetLengthStrip() {
        return (this.lengthStrip!= null);
    }

    /**
     * Gets the value of the widthStrip property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getWidthStrip() {
        return widthStrip;
    }

    /**
     * Sets the value of the widthStrip property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setWidthStrip(ValDistanceType value) {
        this.widthStrip = value;
    }

    public boolean isSetWidthStrip() {
        return (this.widthStrip!= null);
    }

    /**
     * Gets the value of the lengthOffset property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceSignedType }
     *     
     */
    public ValDistanceSignedType getLengthOffset() {
        return lengthOffset;
    }

    /**
     * Sets the value of the lengthOffset property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceSignedType }
     *     
     */
    public void setLengthOffset(ValDistanceSignedType value) {
        this.lengthOffset = value;
    }

    public boolean isSetLengthOffset() {
        return (this.lengthOffset!= null);
    }

    /**
     * Gets the value of the widthOffset property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceSignedType }
     *     
     */
    public ValDistanceSignedType getWidthOffset() {
        return widthOffset;
    }

    /**
     * Sets the value of the widthOffset property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceSignedType }
     *     
     */
    public void setWidthOffset(ValDistanceSignedType value) {
        this.widthOffset = value;
    }

    public boolean isSetWidthOffset() {
        return (this.widthOffset!= null);
    }

    /**
     * Gets the value of the abandoned property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getAbandoned() {
        return abandoned;
    }

    /**
     * Sets the value of the abandoned property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setAbandoned(CodeYesNoType value) {
        this.abandoned = value;
    }

    public boolean isSetAbandoned() {
        return (this.abandoned!= null);
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
     * Gets the value of the associatedAirportHeliport property.
     * 
     * @return
     *     possible object is
     *     {@link AirportHeliportPropertyType }
     *     
     */
    public AirportHeliportPropertyType getAssociatedAirportHeliport() {
        return associatedAirportHeliport;
    }

    /**
     * Sets the value of the associatedAirportHeliport property.
     * 
     * @param value
     *     allowed object is
     *     {@link AirportHeliportPropertyType }
     *     
     */
    public void setAssociatedAirportHeliport(AirportHeliportPropertyType value) {
        this.associatedAirportHeliport = value;
    }

    public boolean isSetAssociatedAirportHeliport() {
        return (this.associatedAirportHeliport!= null);
    }

    /**
     * Gets the value of the overallContaminant property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the overallContaminant property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getOverallContaminant().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RunwayContaminationPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the overallContaminant property.
     */
    public List<RunwayContaminationPropertyType> getOverallContaminant() {
        if (overallContaminant == null) {
            overallContaminant = new ArrayList<>();
        }
        return this.overallContaminant;
    }

    public boolean isSetOverallContaminant() {
        return ((this.overallContaminant!= null)&&(!this.overallContaminant.isEmpty()));
    }

    public void unsetOverallContaminant() {
        this.overallContaminant = null;
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
     * Gets the value of the areaContaminant property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the areaContaminant property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAreaContaminant().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RunwaySectionContaminationPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the areaContaminant property.
     */
    public List<RunwaySectionContaminationPropertyType> getAreaContaminant() {
        if (areaContaminant == null) {
            areaContaminant = new ArrayList<>();
        }
        return this.areaContaminant;
    }

    public boolean isSetAreaContaminant() {
        return ((this.areaContaminant!= null)&&(!this.areaContaminant.isEmpty()));
    }

    public void unsetAreaContaminant() {
        this.areaContaminant = null;
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
     * {@link RunwayTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<RunwayTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractRunwayExtension"/>
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
        "abstractRunwayExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractRunwayExtension", required = true)
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractrunwayextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractRunwayExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractRunwayExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractRunwayExtension() {
            return abstractRunwayExtension;
        }

        /**
         * Sets the value of the abstractRunwayExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractRunwayExtension(AbstractExtensionType value) {
            this.abstractRunwayExtension = value;
        }

        public boolean isSetAbstractRunwayExtension() {
            return (this.abstractRunwayExtension!= null);
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
