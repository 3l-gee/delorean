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
import jakarta.persistence.Embeddable;
import jakarta.persistence.Embedded;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Transient;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for RadioFrequencyAreaTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="RadioFrequencyAreaTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}RadioFrequencyAreaPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractRadioFrequencyAreaExtension"/>
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
@XmlType(name = "RadioFrequencyAreaTimeSliceType", propOrder = {
    "type",
    "angleScallop",
    "signalType",
    "equipmentRadar",
    "equipmentPrecisionApproachRadar",
    "equipmentFrequency",
    "equipmentSpecialNavigationStation",
    "equipmentNavaidEquipment",
    "sector",
    "extent",
    "annotation",
    "extension"
})
@Embeddable
public class RadioFrequencyAreaTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "type")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "type_nilreason"))
    })
    protected CodeRadioFrequencyAreaType type;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "angle_scallop")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "angle_scallop_nilreason"))
    })
    protected ValAngleType angleScallop;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "signal_type")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "signal_type_nilreason"))
    })
    protected CodeRadioSignalType signalType;
    @XmlElementRef(name = "equipment_radar", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<SecondarySurveillanceRadarPropertyType> equipmentRadar;
    @XmlElementRef(name = "equipment_precisionApproachRadar", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<PrecisionApproachRadarPropertyType> equipmentPrecisionApproachRadar;
    @XmlElementRef(name = "equipment_frequency", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<RadioCommunicationChannelPropertyType> equipmentFrequency;
    @XmlElementRef(name = "equipment_specialNavigationStation", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<SpecialNavigationStationPropertyType> equipmentSpecialNavigationStation;
    @XmlElementRef(name = "equipment_navaidEquipment", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<NavaidEquipmentPropertyType> equipmentNavaidEquipment;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected List<CircleSectorPropertyType> sector;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected List<SurfacePropertyType> extent;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected List<NotePropertyType> annotation;
    @Transient
    protected List<RadioFrequencyAreaTimeSliceType.Extension> extension;

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link CodeRadioFrequencyAreaType }
     *     
     */
    public CodeRadioFrequencyAreaType getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeRadioFrequencyAreaType }
     *     
     */
    public void setType(CodeRadioFrequencyAreaType value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the angleScallop property.
     * 
     * @return
     *     possible object is
     *     {@link ValAngleType }
     *     
     */
    public ValAngleType getAngleScallop() {
        return angleScallop;
    }

    /**
     * Sets the value of the angleScallop property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValAngleType }
     *     
     */
    public void setAngleScallop(ValAngleType value) {
        this.angleScallop = value;
    }

    public boolean isSetAngleScallop() {
        return (this.angleScallop!= null);
    }

    /**
     * Gets the value of the signalType property.
     * 
     * @return
     *     possible object is
     *     {@link CodeRadioSignalType }
     *     
     */
    public CodeRadioSignalType getSignalType() {
        return signalType;
    }

    /**
     * Sets the value of the signalType property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeRadioSignalType }
     *     
     */
    public void setSignalType(CodeRadioSignalType value) {
        this.signalType = value;
    }

    public boolean isSetSignalType() {
        return (this.signalType!= null);
    }

    /**
     * Gets the value of the equipmentRadar property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link SecondarySurveillanceRadarPropertyType }{@code >}
     *     
     */
    public JAXBElement<SecondarySurveillanceRadarPropertyType> getEquipmentRadar() {
        return equipmentRadar;
    }

    /**
     * Sets the value of the equipmentRadar property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link SecondarySurveillanceRadarPropertyType }{@code >}
     *     
     */
    public void setEquipmentRadar(JAXBElement<SecondarySurveillanceRadarPropertyType> value) {
        this.equipmentRadar = value;
    }

    public boolean isSetEquipmentRadar() {
        return (this.equipmentRadar!= null);
    }

    /**
     * Gets the value of the equipmentPrecisionApproachRadar property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link PrecisionApproachRadarPropertyType }{@code >}
     *     
     */
    public JAXBElement<PrecisionApproachRadarPropertyType> getEquipmentPrecisionApproachRadar() {
        return equipmentPrecisionApproachRadar;
    }

    /**
     * Sets the value of the equipmentPrecisionApproachRadar property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link PrecisionApproachRadarPropertyType }{@code >}
     *     
     */
    public void setEquipmentPrecisionApproachRadar(JAXBElement<PrecisionApproachRadarPropertyType> value) {
        this.equipmentPrecisionApproachRadar = value;
    }

    public boolean isSetEquipmentPrecisionApproachRadar() {
        return (this.equipmentPrecisionApproachRadar!= null);
    }

    /**
     * Gets the value of the equipmentFrequency property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link RadioCommunicationChannelPropertyType }{@code >}
     *     
     */
    public JAXBElement<RadioCommunicationChannelPropertyType> getEquipmentFrequency() {
        return equipmentFrequency;
    }

    /**
     * Sets the value of the equipmentFrequency property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link RadioCommunicationChannelPropertyType }{@code >}
     *     
     */
    public void setEquipmentFrequency(JAXBElement<RadioCommunicationChannelPropertyType> value) {
        this.equipmentFrequency = value;
    }

    public boolean isSetEquipmentFrequency() {
        return (this.equipmentFrequency!= null);
    }

    /**
     * Gets the value of the equipmentSpecialNavigationStation property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link SpecialNavigationStationPropertyType }{@code >}
     *     
     */
    public JAXBElement<SpecialNavigationStationPropertyType> getEquipmentSpecialNavigationStation() {
        return equipmentSpecialNavigationStation;
    }

    /**
     * Sets the value of the equipmentSpecialNavigationStation property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link SpecialNavigationStationPropertyType }{@code >}
     *     
     */
    public void setEquipmentSpecialNavigationStation(JAXBElement<SpecialNavigationStationPropertyType> value) {
        this.equipmentSpecialNavigationStation = value;
    }

    public boolean isSetEquipmentSpecialNavigationStation() {
        return (this.equipmentSpecialNavigationStation!= null);
    }

    /**
     * Gets the value of the equipmentNavaidEquipment property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link NavaidEquipmentPropertyType }{@code >}
     *     
     */
    public JAXBElement<NavaidEquipmentPropertyType> getEquipmentNavaidEquipment() {
        return equipmentNavaidEquipment;
    }

    /**
     * Sets the value of the equipmentNavaidEquipment property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link NavaidEquipmentPropertyType }{@code >}
     *     
     */
    public void setEquipmentNavaidEquipment(JAXBElement<NavaidEquipmentPropertyType> value) {
        this.equipmentNavaidEquipment = value;
    }

    public boolean isSetEquipmentNavaidEquipment() {
        return (this.equipmentNavaidEquipment!= null);
    }

    /**
     * Gets the value of the sector property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the sector property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getSector().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CircleSectorPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the sector property.
     */
    public List<CircleSectorPropertyType> getSector() {
        if (sector == null) {
            sector = new ArrayList<>();
        }
        return this.sector;
    }

    public boolean isSetSector() {
        return ((this.sector!= null)&&(!this.sector.isEmpty()));
    }

    public void unsetSector() {
        this.sector = null;
    }

    /**
     * Gets the value of the extent property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the extent property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getExtent().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link SurfacePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the extent property.
     */
    public List<SurfacePropertyType> getExtent() {
        if (extent == null) {
            extent = new ArrayList<>();
        }
        return this.extent;
    }

    public boolean isSetExtent() {
        return ((this.extent!= null)&&(!this.extent.isEmpty()));
    }

    public void unsetExtent() {
        this.extent = null;
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
     * {@link RadioFrequencyAreaTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<RadioFrequencyAreaTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractRadioFrequencyAreaExtension"/>
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
        "abstractRadioFrequencyAreaExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractRadioFrequencyAreaExtension", required = true)
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        protected AbstractExtensionType abstractRadioFrequencyAreaExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractRadioFrequencyAreaExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractRadioFrequencyAreaExtension() {
            return abstractRadioFrequencyAreaExtension;
        }

        /**
         * Sets the value of the abstractRadioFrequencyAreaExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractRadioFrequencyAreaExtension(AbstractExtensionType value) {
            this.abstractRadioFrequencyAreaExtension = value;
        }

        public boolean isSetAbstractRadioFrequencyAreaExtension() {
            return (this.abstractRadioFrequencyAreaExtension!= null);
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
