//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for FASDataBlockType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="FASDataBlockType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMObjectType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}FASDataBlockPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractFASDataBlockExtension"/>
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
@XmlType(name = "FASDataBlockType", propOrder = {
    "horizontalAlarmLimit",
    "verticalAlarmLimit",
    "thresholdCourseWidth",
    "lengthOffset",
    "crcRemainder",
    "operationType",
    "serviceProviderSBAS",
    "approachPerformanceDesignator",
    "routeIndicator",
    "referencePathDataSelector",
    "referencePathIdentifier",
    "codeICAO",
    "annotation",
    "extension"
})
public class FASDataBlockType
    extends AbstractAIXMObjectType
{

    @XmlElementRef(name = "horizontalAlarmLimit", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValAlarmLimitType> horizontalAlarmLimit;
    @XmlElementRef(name = "verticalAlarmLimit", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValAlarmLimitType> verticalAlarmLimit;
    @XmlElementRef(name = "thresholdCourseWidth", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValDistanceType> thresholdCourseWidth;
    @XmlElementRef(name = "lengthOffset", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValDistanceType> lengthOffset;
    @XmlElementRef(name = "CRCRemainder", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValHexType> crcRemainder;
    @XmlElementRef(name = "operationType", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<NoSequenceType> operationType;
    @XmlElementRef(name = "serviceProviderSBAS", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<NoSequenceType> serviceProviderSBAS;
    @XmlElementRef(name = "approachPerformanceDesignator", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<NoSequenceType> approachPerformanceDesignator;
    @XmlElementRef(name = "routeIndicator", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeRouteIndicatorType> routeIndicator;
    @XmlElementRef(name = "referencePathDataSelector", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<NoSequenceType> referencePathDataSelector;
    @XmlElementRef(name = "referencePathIdentifier", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeReferencePathIdentifierType> referencePathIdentifier;
    @XmlElementRef(name = "codeICAO", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeICAOCountryType> codeICAO;
    @XmlElement(nillable = true)
    protected List<NotePropertyType> annotation;
    protected List<FASDataBlockType.Extension> extension;

    /**
     * Gets the value of the horizontalAlarmLimit property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValAlarmLimitType }{@code >}
     *     
     */
    public JAXBElement<ValAlarmLimitType> getHorizontalAlarmLimit() {
        return horizontalAlarmLimit;
    }

    /**
     * Sets the value of the horizontalAlarmLimit property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValAlarmLimitType }{@code >}
     *     
     */
    public void setHorizontalAlarmLimit(JAXBElement<ValAlarmLimitType> value) {
        this.horizontalAlarmLimit = value;
    }

    public boolean isSetHorizontalAlarmLimit() {
        return (this.horizontalAlarmLimit!= null);
    }

    /**
     * Gets the value of the verticalAlarmLimit property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValAlarmLimitType }{@code >}
     *     
     */
    public JAXBElement<ValAlarmLimitType> getVerticalAlarmLimit() {
        return verticalAlarmLimit;
    }

    /**
     * Sets the value of the verticalAlarmLimit property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValAlarmLimitType }{@code >}
     *     
     */
    public void setVerticalAlarmLimit(JAXBElement<ValAlarmLimitType> value) {
        this.verticalAlarmLimit = value;
    }

    public boolean isSetVerticalAlarmLimit() {
        return (this.verticalAlarmLimit!= null);
    }

    /**
     * Gets the value of the thresholdCourseWidth property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public JAXBElement<ValDistanceType> getThresholdCourseWidth() {
        return thresholdCourseWidth;
    }

    /**
     * Sets the value of the thresholdCourseWidth property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public void setThresholdCourseWidth(JAXBElement<ValDistanceType> value) {
        this.thresholdCourseWidth = value;
    }

    public boolean isSetThresholdCourseWidth() {
        return (this.thresholdCourseWidth!= null);
    }

    /**
     * Gets the value of the lengthOffset property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public JAXBElement<ValDistanceType> getLengthOffset() {
        return lengthOffset;
    }

    /**
     * Sets the value of the lengthOffset property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public void setLengthOffset(JAXBElement<ValDistanceType> value) {
        this.lengthOffset = value;
    }

    public boolean isSetLengthOffset() {
        return (this.lengthOffset!= null);
    }

    /**
     * Gets the value of the crcRemainder property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValHexType }{@code >}
     *     
     */
    public JAXBElement<ValHexType> getCRCRemainder() {
        return crcRemainder;
    }

    /**
     * Sets the value of the crcRemainder property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValHexType }{@code >}
     *     
     */
    public void setCRCRemainder(JAXBElement<ValHexType> value) {
        this.crcRemainder = value;
    }

    public boolean isSetCRCRemainder() {
        return (this.crcRemainder!= null);
    }

    /**
     * Gets the value of the operationType property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public JAXBElement<NoSequenceType> getOperationType() {
        return operationType;
    }

    /**
     * Sets the value of the operationType property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public void setOperationType(JAXBElement<NoSequenceType> value) {
        this.operationType = value;
    }

    public boolean isSetOperationType() {
        return (this.operationType!= null);
    }

    /**
     * Gets the value of the serviceProviderSBAS property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public JAXBElement<NoSequenceType> getServiceProviderSBAS() {
        return serviceProviderSBAS;
    }

    /**
     * Sets the value of the serviceProviderSBAS property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public void setServiceProviderSBAS(JAXBElement<NoSequenceType> value) {
        this.serviceProviderSBAS = value;
    }

    public boolean isSetServiceProviderSBAS() {
        return (this.serviceProviderSBAS!= null);
    }

    /**
     * Gets the value of the approachPerformanceDesignator property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public JAXBElement<NoSequenceType> getApproachPerformanceDesignator() {
        return approachPerformanceDesignator;
    }

    /**
     * Sets the value of the approachPerformanceDesignator property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public void setApproachPerformanceDesignator(JAXBElement<NoSequenceType> value) {
        this.approachPerformanceDesignator = value;
    }

    public boolean isSetApproachPerformanceDesignator() {
        return (this.approachPerformanceDesignator!= null);
    }

    /**
     * Gets the value of the routeIndicator property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeRouteIndicatorType }{@code >}
     *     
     */
    public JAXBElement<CodeRouteIndicatorType> getRouteIndicator() {
        return routeIndicator;
    }

    /**
     * Sets the value of the routeIndicator property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeRouteIndicatorType }{@code >}
     *     
     */
    public void setRouteIndicator(JAXBElement<CodeRouteIndicatorType> value) {
        this.routeIndicator = value;
    }

    public boolean isSetRouteIndicator() {
        return (this.routeIndicator!= null);
    }

    /**
     * Gets the value of the referencePathDataSelector property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public JAXBElement<NoSequenceType> getReferencePathDataSelector() {
        return referencePathDataSelector;
    }

    /**
     * Sets the value of the referencePathDataSelector property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link NoSequenceType }{@code >}
     *     
     */
    public void setReferencePathDataSelector(JAXBElement<NoSequenceType> value) {
        this.referencePathDataSelector = value;
    }

    public boolean isSetReferencePathDataSelector() {
        return (this.referencePathDataSelector!= null);
    }

    /**
     * Gets the value of the referencePathIdentifier property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeReferencePathIdentifierType }{@code >}
     *     
     */
    public JAXBElement<CodeReferencePathIdentifierType> getReferencePathIdentifier() {
        return referencePathIdentifier;
    }

    /**
     * Sets the value of the referencePathIdentifier property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeReferencePathIdentifierType }{@code >}
     *     
     */
    public void setReferencePathIdentifier(JAXBElement<CodeReferencePathIdentifierType> value) {
        this.referencePathIdentifier = value;
    }

    public boolean isSetReferencePathIdentifier() {
        return (this.referencePathIdentifier!= null);
    }

    /**
     * Gets the value of the codeICAO property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeICAOCountryType }{@code >}
     *     
     */
    public JAXBElement<CodeICAOCountryType> getCodeICAO() {
        return codeICAO;
    }

    /**
     * Sets the value of the codeICAO property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeICAOCountryType }{@code >}
     *     
     */
    public void setCodeICAO(JAXBElement<CodeICAOCountryType> value) {
        this.codeICAO = value;
    }

    public boolean isSetCodeICAO() {
        return (this.codeICAO!= null);
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
     * {@link FASDataBlockType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<FASDataBlockType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractFASDataBlockExtension"/>
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
        "abstractFASDataBlockExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractFASDataBlockExtension")
        protected AbstractExtensionType abstractFASDataBlockExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractFASDataBlockExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractFASDataBlockExtension() {
            return abstractFASDataBlockExtension;
        }

        /**
         * Sets the value of the abstractFASDataBlockExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractFASDataBlockExtension(AbstractExtensionType value) {
            this.abstractFASDataBlockExtension = value;
        }

        public boolean isSetAbstractFASDataBlockExtension() {
            return (this.abstractFASDataBlockExtension!= null);
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