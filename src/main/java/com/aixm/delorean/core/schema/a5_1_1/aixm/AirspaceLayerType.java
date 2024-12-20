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
 * <p>Java class for AirspaceLayerType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AirspaceLayerType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMObjectType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}AirspaceLayerPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractAirspaceLayerExtension"/>
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
@XmlType(name = "AirspaceLayerType", propOrder = {
    "upperLimit",
    "upperLimitReference",
    "lowerLimit",
    "lowerLimitReference",
    "altitudeInterpretation",
    "discreteLevelSeries",
    "annotation",
    "extension"
})
@Embeddable
public class AirspaceLayerType
    extends AbstractAIXMObjectType
{

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
    @XmlElementRef(name = "discreteLevelSeries", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<StandardLevelColumnPropertyType> discreteLevelSeries;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected List<NotePropertyType> annotation;
    @Transient
    protected List<AirspaceLayerType.Extension> extension;

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
     * Gets the value of the discreteLevelSeries property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link StandardLevelColumnPropertyType }{@code >}
     *     
     */
    public JAXBElement<StandardLevelColumnPropertyType> getDiscreteLevelSeries() {
        return discreteLevelSeries;
    }

    /**
     * Sets the value of the discreteLevelSeries property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link StandardLevelColumnPropertyType }{@code >}
     *     
     */
    public void setDiscreteLevelSeries(JAXBElement<StandardLevelColumnPropertyType> value) {
        this.discreteLevelSeries = value;
    }

    public boolean isSetDiscreteLevelSeries() {
        return (this.discreteLevelSeries!= null);
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
     * {@link AirspaceLayerType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<AirspaceLayerType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractAirspaceLayerExtension"/>
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
        "abstractAirspaceLayerExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractAirspaceLayerExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        protected AbstractExtensionType abstractAirspaceLayerExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractAirspaceLayerExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractAirspaceLayerExtension() {
            return abstractAirspaceLayerExtension;
        }

        /**
         * Sets the value of the abstractAirspaceLayerExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractAirspaceLayerExtension(AbstractExtensionType value) {
            this.abstractAirspaceLayerExtension = value;
        }

        public boolean isSetAbstractAirspaceLayerExtension() {
            return (this.abstractAirspaceLayerExtension!= null);
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
