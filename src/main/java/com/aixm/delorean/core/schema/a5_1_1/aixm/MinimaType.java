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
 * <p>Java class for MinimaType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="MinimaType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMObjectType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}MinimaPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractMinimaExtension"/>
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
@XmlType(name = "MinimaType", propOrder = {
    "altitude",
    "altitudeCode",
    "altitudeReference",
    "height",
    "militaryHeight",
    "radioHeight",
    "heightCode",
    "heightReference",
    "visibility",
    "militaryVisibility",
    "mandatoryRVR",
    "remoteAltimeterMinima",
    "adjustmentINOP",
    "annotation",
    "extension"
})
@Entity
@Table(name = "minima", schema = "procedure")
public class MinimaType
    extends AbstractAIXMObjectType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "altitude_value", length = 255, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "altitude_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "altitude_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceVerticalType altitude;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "altitudecode_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "altitudecode_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeMinimumAltitudeType altitudeCode;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "altitudereference_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "altitudereference_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeVerticalReferenceType altitudeReference;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "height_value", length = 255, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "height_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "height_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceVerticalType height;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "militaryheight_value", length = 255, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "militaryheight_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "militaryheight_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceVerticalType militaryHeight;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "radioheight_value", length = 255, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "radioheight_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "radioheight_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceVerticalType radioHeight;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "heightcode_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "heightcode_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeMinimumHeightType heightCode;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "heightreference_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "heightreference_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeHeightReferenceType heightReference;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "visibility_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "visibility_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "visibility_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType visibility;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "militaryvisibility_value", length = 255, columnDefinition = "DECIMAL", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "militaryvisibility_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "militaryvisibility_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceType militaryVisibility;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "mandatoryrvr_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "mandatoryrvr_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType mandatoryRVR;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "remotealtimeterminima_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "remotealtimeterminima_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType remoteAltimeterMinima;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "minima_adjustmentinop", joinColumns = {
        @JoinColumn(name = "minima_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "equipmentunavailableadjustment_pt_id")
    })
    protected List<EquipmentUnavailableAdjustmentPropertyType> adjustmentINOP;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "minima_annotation", joinColumns = {
        @JoinColumn(name = "minima_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @Transient
    protected List<MinimaType.Extension> extension;

    /**
     * Gets the value of the altitude property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public ValDistanceVerticalType getAltitude() {
        return altitude;
    }

    /**
     * Sets the value of the altitude property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public void setAltitude(ValDistanceVerticalType value) {
        this.altitude = value;
    }

    public boolean isSetAltitude() {
        return (this.altitude!= null);
    }

    /**
     * Gets the value of the altitudeCode property.
     * 
     * @return
     *     possible object is
     *     {@link CodeMinimumAltitudeType }
     *     
     */
    public CodeMinimumAltitudeType getAltitudeCode() {
        return altitudeCode;
    }

    /**
     * Sets the value of the altitudeCode property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeMinimumAltitudeType }
     *     
     */
    public void setAltitudeCode(CodeMinimumAltitudeType value) {
        this.altitudeCode = value;
    }

    public boolean isSetAltitudeCode() {
        return (this.altitudeCode!= null);
    }

    /**
     * Gets the value of the altitudeReference property.
     * 
     * @return
     *     possible object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public CodeVerticalReferenceType getAltitudeReference() {
        return altitudeReference;
    }

    /**
     * Sets the value of the altitudeReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public void setAltitudeReference(CodeVerticalReferenceType value) {
        this.altitudeReference = value;
    }

    public boolean isSetAltitudeReference() {
        return (this.altitudeReference!= null);
    }

    /**
     * Gets the value of the height property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public ValDistanceVerticalType getHeight() {
        return height;
    }

    /**
     * Sets the value of the height property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public void setHeight(ValDistanceVerticalType value) {
        this.height = value;
    }

    public boolean isSetHeight() {
        return (this.height!= null);
    }

    /**
     * Gets the value of the militaryHeight property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public ValDistanceVerticalType getMilitaryHeight() {
        return militaryHeight;
    }

    /**
     * Sets the value of the militaryHeight property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public void setMilitaryHeight(ValDistanceVerticalType value) {
        this.militaryHeight = value;
    }

    public boolean isSetMilitaryHeight() {
        return (this.militaryHeight!= null);
    }

    /**
     * Gets the value of the radioHeight property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public ValDistanceVerticalType getRadioHeight() {
        return radioHeight;
    }

    /**
     * Sets the value of the radioHeight property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public void setRadioHeight(ValDistanceVerticalType value) {
        this.radioHeight = value;
    }

    public boolean isSetRadioHeight() {
        return (this.radioHeight!= null);
    }

    /**
     * Gets the value of the heightCode property.
     * 
     * @return
     *     possible object is
     *     {@link CodeMinimumHeightType }
     *     
     */
    public CodeMinimumHeightType getHeightCode() {
        return heightCode;
    }

    /**
     * Sets the value of the heightCode property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeMinimumHeightType }
     *     
     */
    public void setHeightCode(CodeMinimumHeightType value) {
        this.heightCode = value;
    }

    public boolean isSetHeightCode() {
        return (this.heightCode!= null);
    }

    /**
     * Gets the value of the heightReference property.
     * 
     * @return
     *     possible object is
     *     {@link CodeHeightReferenceType }
     *     
     */
    public CodeHeightReferenceType getHeightReference() {
        return heightReference;
    }

    /**
     * Sets the value of the heightReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeHeightReferenceType }
     *     
     */
    public void setHeightReference(CodeHeightReferenceType value) {
        this.heightReference = value;
    }

    public boolean isSetHeightReference() {
        return (this.heightReference!= null);
    }

    /**
     * Gets the value of the visibility property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getVisibility() {
        return visibility;
    }

    /**
     * Sets the value of the visibility property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setVisibility(ValDistanceType value) {
        this.visibility = value;
    }

    public boolean isSetVisibility() {
        return (this.visibility!= null);
    }

    /**
     * Gets the value of the militaryVisibility property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getMilitaryVisibility() {
        return militaryVisibility;
    }

    /**
     * Sets the value of the militaryVisibility property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setMilitaryVisibility(ValDistanceType value) {
        this.militaryVisibility = value;
    }

    public boolean isSetMilitaryVisibility() {
        return (this.militaryVisibility!= null);
    }

    /**
     * Gets the value of the mandatoryRVR property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getMandatoryRVR() {
        return mandatoryRVR;
    }

    /**
     * Sets the value of the mandatoryRVR property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setMandatoryRVR(CodeYesNoType value) {
        this.mandatoryRVR = value;
    }

    public boolean isSetMandatoryRVR() {
        return (this.mandatoryRVR!= null);
    }

    /**
     * Gets the value of the remoteAltimeterMinima property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getRemoteAltimeterMinima() {
        return remoteAltimeterMinima;
    }

    /**
     * Sets the value of the remoteAltimeterMinima property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setRemoteAltimeterMinima(CodeYesNoType value) {
        this.remoteAltimeterMinima = value;
    }

    public boolean isSetRemoteAltimeterMinima() {
        return (this.remoteAltimeterMinima!= null);
    }

    /**
     * Gets the value of the adjustmentINOP property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the adjustmentINOP property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAdjustmentINOP().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link EquipmentUnavailableAdjustmentPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the adjustmentINOP property.
     */
    public List<EquipmentUnavailableAdjustmentPropertyType> getAdjustmentINOP() {
        if (adjustmentINOP == null) {
            adjustmentINOP = new ArrayList<>();
        }
        return this.adjustmentINOP;
    }

    public boolean isSetAdjustmentINOP() {
        return ((this.adjustmentINOP!= null)&&(!this.adjustmentINOP.isEmpty()));
    }

    public void unsetAdjustmentINOP() {
        this.adjustmentINOP = null;
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
     * {@link MinimaType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<MinimaType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractMinimaExtension"/>
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
        "abstractMinimaExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractMinimaExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractminimaextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractMinimaExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractMinimaExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractMinimaExtension() {
            return abstractMinimaExtension;
        }

        /**
         * Sets the value of the abstractMinimaExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractMinimaExtension(AbstractExtensionType value) {
            this.abstractMinimaExtension = value;
        }

        public boolean isSetAbstractMinimaExtension() {
            return (this.abstractMinimaExtension!= null);
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
