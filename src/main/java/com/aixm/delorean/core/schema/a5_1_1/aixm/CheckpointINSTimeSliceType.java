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
 * <p>Java class for CheckpointINSTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="CheckpointINSTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}CheckpointINSPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractCheckpointINSExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractNavigationSystemCheckpointExtension"/>
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
@XmlType(name = "CheckpointINSTimeSliceType", propOrder = {
    "category",
    "upperLimit",
    "upperLimitReference",
    "lowerLimit",
    "lowerLimitReference",
    "altitudeInterpretation",
    "distance",
    "angle",
    "position",
    "airportHeliport",
    "annotation",
    "extension"
})
@Embeddable
public class CheckpointINSTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "category")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "category_nilreason"))
    })
    protected CodeCheckpointCategoryType category;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "upper_limit")),
        @AttributeOverride(name = "uom", column = @Column(name = "upper_limit_uom")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "upper_limit_nilreason"))
    })
    protected ValDistanceVerticalType upperLimit;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "upper_limit_reference")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "upper_limit_reference_nilreason"))
    })
    protected CodeVerticalReferenceType upperLimitReference;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "lower_limit")),
        @AttributeOverride(name = "uom", column = @Column(name = "lower_limit_uom")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "lower_limit_nilreason"))
    })
    protected ValDistanceVerticalType lowerLimit;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "lower_limit_reference")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "lower_limit_reference_nilreason"))
    })
    protected CodeVerticalReferenceType lowerLimitReference;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "altitude_interpretation")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "altitude_interpretation_nilreason"))
    })
    protected CodeAltitudeUseType altitudeInterpretation;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "distance")),
        @AttributeOverride(name = "uom", column = @Column(name = "distance_uom")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "distance_nilreason"))
    })
    protected ValDistanceType distance;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "angle")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "angle_nilreason"))
    })
    protected ValBearingType angle;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected ElevatedPointPropertyType position;
    @XmlElementRef(name = "airportHeliport", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<AirportHeliportPropertyType> airportHeliport;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected List<NotePropertyType> annotation;
    @Transient
    protected List<CheckpointINSTimeSliceType.Extension> extension;

    /**
     * Gets the value of the category property.
     * 
     * @return
     *     possible object is
     *     {@link CodeCheckpointCategoryType }
     *     
     */
    public CodeCheckpointCategoryType getCategory() {
        return category;
    }

    /**
     * Sets the value of the category property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeCheckpointCategoryType }
     *     
     */
    public void setCategory(CodeCheckpointCategoryType value) {
        this.category = value;
    }

    public boolean isSetCategory() {
        return (this.category!= null);
    }

    /**
     * Gets the value of the upperLimit property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public ValDistanceVerticalType getUpperLimit() {
        return upperLimit;
    }

    /**
     * Sets the value of the upperLimit property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public void setUpperLimit(ValDistanceVerticalType value) {
        this.upperLimit = value;
    }

    public boolean isSetUpperLimit() {
        return (this.upperLimit!= null);
    }

    /**
     * Gets the value of the upperLimitReference property.
     * 
     * @return
     *     possible object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public CodeVerticalReferenceType getUpperLimitReference() {
        return upperLimitReference;
    }

    /**
     * Sets the value of the upperLimitReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public void setUpperLimitReference(CodeVerticalReferenceType value) {
        this.upperLimitReference = value;
    }

    public boolean isSetUpperLimitReference() {
        return (this.upperLimitReference!= null);
    }

    /**
     * Gets the value of the lowerLimit property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public ValDistanceVerticalType getLowerLimit() {
        return lowerLimit;
    }

    /**
     * Sets the value of the lowerLimit property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public void setLowerLimit(ValDistanceVerticalType value) {
        this.lowerLimit = value;
    }

    public boolean isSetLowerLimit() {
        return (this.lowerLimit!= null);
    }

    /**
     * Gets the value of the lowerLimitReference property.
     * 
     * @return
     *     possible object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public CodeVerticalReferenceType getLowerLimitReference() {
        return lowerLimitReference;
    }

    /**
     * Sets the value of the lowerLimitReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public void setLowerLimitReference(CodeVerticalReferenceType value) {
        this.lowerLimitReference = value;
    }

    public boolean isSetLowerLimitReference() {
        return (this.lowerLimitReference!= null);
    }

    /**
     * Gets the value of the altitudeInterpretation property.
     * 
     * @return
     *     possible object is
     *     {@link CodeAltitudeUseType }
     *     
     */
    public CodeAltitudeUseType getAltitudeInterpretation() {
        return altitudeInterpretation;
    }

    /**
     * Sets the value of the altitudeInterpretation property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeAltitudeUseType }
     *     
     */
    public void setAltitudeInterpretation(CodeAltitudeUseType value) {
        this.altitudeInterpretation = value;
    }

    public boolean isSetAltitudeInterpretation() {
        return (this.altitudeInterpretation!= null);
    }

    /**
     * Gets the value of the distance property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceType }
     *     
     */
    public ValDistanceType getDistance() {
        return distance;
    }

    /**
     * Sets the value of the distance property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceType }
     *     
     */
    public void setDistance(ValDistanceType value) {
        this.distance = value;
    }

    public boolean isSetDistance() {
        return (this.distance!= null);
    }

    /**
     * Gets the value of the angle property.
     * 
     * @return
     *     possible object is
     *     {@link ValBearingType }
     *     
     */
    public ValBearingType getAngle() {
        return angle;
    }

    /**
     * Sets the value of the angle property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValBearingType }
     *     
     */
    public void setAngle(ValBearingType value) {
        this.angle = value;
    }

    public boolean isSetAngle() {
        return (this.angle!= null);
    }

    /**
     * Gets the value of the position property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public ElevatedPointPropertyType getPosition() {
        return position;
    }

    /**
     * Sets the value of the position property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public void setPosition(ElevatedPointPropertyType value) {
        this.position = value;
    }

    public boolean isSetPosition() {
        return (this.position!= null);
    }

    /**
     * Gets the value of the airportHeliport property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AirportHeliportPropertyType }{@code >}
     *     
     */
    public JAXBElement<AirportHeliportPropertyType> getAirportHeliport() {
        return airportHeliport;
    }

    /**
     * Sets the value of the airportHeliport property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AirportHeliportPropertyType }{@code >}
     *     
     */
    public void setAirportHeliport(JAXBElement<AirportHeliportPropertyType> value) {
        this.airportHeliport = value;
    }

    public boolean isSetAirportHeliport() {
        return (this.airportHeliport!= null);
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
     * {@link CheckpointINSTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<CheckpointINSTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractCheckpointINSExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractNavigationSystemCheckpointExtension"/>
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
        "abstractCheckpointINSExtension",
        "abstractNavigationSystemCheckpointExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractCheckpointINSExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        protected AbstractExtensionType abstractCheckpointINSExtension;
        @XmlElement(name = "AbstractNavigationSystemCheckpointExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        protected AbstractExtensionType abstractNavigationSystemCheckpointExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractCheckpointINSExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractCheckpointINSExtension() {
            return abstractCheckpointINSExtension;
        }

        /**
         * Sets the value of the abstractCheckpointINSExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractCheckpointINSExtension(AbstractExtensionType value) {
            this.abstractCheckpointINSExtension = value;
        }

        public boolean isSetAbstractCheckpointINSExtension() {
            return (this.abstractCheckpointINSExtension!= null);
        }

        /**
         * Gets the value of the abstractNavigationSystemCheckpointExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractNavigationSystemCheckpointExtension() {
            return abstractNavigationSystemCheckpointExtension;
        }

        /**
         * Sets the value of the abstractNavigationSystemCheckpointExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractNavigationSystemCheckpointExtension(AbstractExtensionType value) {
            this.abstractNavigationSystemCheckpointExtension = value;
        }

        public boolean isSetAbstractNavigationSystemCheckpointExtension() {
            return (this.abstractNavigationSystemCheckpointExtension!= null);
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
