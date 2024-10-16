//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for NavaidTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="NavaidTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}NavaidPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractNavaidExtension"/>
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
@XmlType(name = "NavaidTimeSliceType", propOrder = {
    "type",
    "designator",
    "aixmName",
    "flightChecked",
    "purpose",
    "signalPerformance",
    "courseQuality",
    "integrityLevel",
    "touchDownLiftOff",
    "navaidEquipment",
    "location",
    "runwayDirection",
    "servedAirport",
    "availability",
    "annotation",
    "extension"
})
public class NavaidTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElementRef(name = "type", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeNavaidServiceType> type;
    @XmlElementRef(name = "designator", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeNavaidDesignatorType> designator;
    @XmlElementRef(name = "name", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<TextNameType> aixmName;
    @XmlElementRef(name = "flightChecked", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeYesNoType> flightChecked;
    @XmlElementRef(name = "purpose", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeNavaidPurposeType> purpose;
    @XmlElementRef(name = "signalPerformance", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeSignalPerformanceILSType> signalPerformance;
    @XmlElementRef(name = "courseQuality", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeCourseQualityILSType> courseQuality;
    @XmlElementRef(name = "integrityLevel", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeIntegrityLevelILSType> integrityLevel;
    @XmlElement(nillable = true)
    @Valid
    @Size(min = 0)
    protected List<TouchDownLiftOffPropertyType> touchDownLiftOff;
    @XmlElement(nillable = true)
    @Valid
    @Size(min = 0)
    protected List<NavaidComponentPropertyType> navaidEquipment;
    @XmlElementRef(name = "location", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ElevatedPointPropertyType> location;
    @XmlElement(nillable = true)
    @Valid
    @Size(min = 0)
    protected List<RunwayDirectionPropertyType> runwayDirection;
    @XmlElement(nillable = true)
    @Valid
    @Size(min = 0)
    protected List<AirportHeliportPropertyType> servedAirport;
    @XmlElement(nillable = true)
    @Valid
    @Size(min = 0)
    protected List<NavaidOperationalStatusPropertyType> availability;
    @XmlElement(nillable = true)
    @Valid
    @Size(min = 0)
    protected List<NotePropertyType> annotation;
    @Valid
    @Size(min = 0)
    protected List<NavaidTimeSliceType.Extension> extension;

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeNavaidServiceType }{@code >}
     *     
     */
    public JAXBElement<CodeNavaidServiceType> getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeNavaidServiceType }{@code >}
     *     
     */
    public void setType(JAXBElement<CodeNavaidServiceType> value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the designator property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeNavaidDesignatorType }{@code >}
     *     
     */
    public JAXBElement<CodeNavaidDesignatorType> getDesignator() {
        return designator;
    }

    /**
     * Sets the value of the designator property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeNavaidDesignatorType }{@code >}
     *     
     */
    public void setDesignator(JAXBElement<CodeNavaidDesignatorType> value) {
        this.designator = value;
    }

    public boolean isSetDesignator() {
        return (this.designator!= null);
    }

    /**
     * Gets the value of the aixmName property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link TextNameType }{@code >}
     *     
     */
    public JAXBElement<TextNameType> getAIXMName() {
        return aixmName;
    }

    /**
     * Sets the value of the aixmName property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link TextNameType }{@code >}
     *     
     */
    public void setAIXMName(JAXBElement<TextNameType> value) {
        this.aixmName = value;
    }

    public boolean isSetAIXMName() {
        return (this.aixmName!= null);
    }

    /**
     * Gets the value of the flightChecked property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public JAXBElement<CodeYesNoType> getFlightChecked() {
        return flightChecked;
    }

    /**
     * Sets the value of the flightChecked property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public void setFlightChecked(JAXBElement<CodeYesNoType> value) {
        this.flightChecked = value;
    }

    public boolean isSetFlightChecked() {
        return (this.flightChecked!= null);
    }

    /**
     * Gets the value of the purpose property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeNavaidPurposeType }{@code >}
     *     
     */
    public JAXBElement<CodeNavaidPurposeType> getPurpose() {
        return purpose;
    }

    /**
     * Sets the value of the purpose property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeNavaidPurposeType }{@code >}
     *     
     */
    public void setPurpose(JAXBElement<CodeNavaidPurposeType> value) {
        this.purpose = value;
    }

    public boolean isSetPurpose() {
        return (this.purpose!= null);
    }

    /**
     * Gets the value of the signalPerformance property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeSignalPerformanceILSType }{@code >}
     *     
     */
    public JAXBElement<CodeSignalPerformanceILSType> getSignalPerformance() {
        return signalPerformance;
    }

    /**
     * Sets the value of the signalPerformance property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeSignalPerformanceILSType }{@code >}
     *     
     */
    public void setSignalPerformance(JAXBElement<CodeSignalPerformanceILSType> value) {
        this.signalPerformance = value;
    }

    public boolean isSetSignalPerformance() {
        return (this.signalPerformance!= null);
    }

    /**
     * Gets the value of the courseQuality property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeCourseQualityILSType }{@code >}
     *     
     */
    public JAXBElement<CodeCourseQualityILSType> getCourseQuality() {
        return courseQuality;
    }

    /**
     * Sets the value of the courseQuality property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeCourseQualityILSType }{@code >}
     *     
     */
    public void setCourseQuality(JAXBElement<CodeCourseQualityILSType> value) {
        this.courseQuality = value;
    }

    public boolean isSetCourseQuality() {
        return (this.courseQuality!= null);
    }

    /**
     * Gets the value of the integrityLevel property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeIntegrityLevelILSType }{@code >}
     *     
     */
    public JAXBElement<CodeIntegrityLevelILSType> getIntegrityLevel() {
        return integrityLevel;
    }

    /**
     * Sets the value of the integrityLevel property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeIntegrityLevelILSType }{@code >}
     *     
     */
    public void setIntegrityLevel(JAXBElement<CodeIntegrityLevelILSType> value) {
        this.integrityLevel = value;
    }

    public boolean isSetIntegrityLevel() {
        return (this.integrityLevel!= null);
    }

    /**
     * Gets the value of the touchDownLiftOff property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the touchDownLiftOff property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getTouchDownLiftOff().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link TouchDownLiftOffPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the touchDownLiftOff property.
     */
    public List<TouchDownLiftOffPropertyType> getTouchDownLiftOff() {
        if (touchDownLiftOff == null) {
            touchDownLiftOff = new ArrayList<>();
        }
        return this.touchDownLiftOff;
    }

    public boolean isSetTouchDownLiftOff() {
        return ((this.touchDownLiftOff!= null)&&(!this.touchDownLiftOff.isEmpty()));
    }

    public void unsetTouchDownLiftOff() {
        this.touchDownLiftOff = null;
    }

    /**
     * Gets the value of the navaidEquipment property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the navaidEquipment property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getNavaidEquipment().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link NavaidComponentPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the navaidEquipment property.
     */
    public List<NavaidComponentPropertyType> getNavaidEquipment() {
        if (navaidEquipment == null) {
            navaidEquipment = new ArrayList<>();
        }
        return this.navaidEquipment;
    }

    public boolean isSetNavaidEquipment() {
        return ((this.navaidEquipment!= null)&&(!this.navaidEquipment.isEmpty()));
    }

    public void unsetNavaidEquipment() {
        this.navaidEquipment = null;
    }

    /**
     * Gets the value of the location property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ElevatedPointPropertyType }{@code >}
     *     
     */
    public JAXBElement<ElevatedPointPropertyType> getLocation() {
        return location;
    }

    /**
     * Sets the value of the location property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ElevatedPointPropertyType }{@code >}
     *     
     */
    public void setLocation(JAXBElement<ElevatedPointPropertyType> value) {
        this.location = value;
    }

    public boolean isSetLocation() {
        return (this.location!= null);
    }

    /**
     * Gets the value of the runwayDirection property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the runwayDirection property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getRunwayDirection().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RunwayDirectionPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the runwayDirection property.
     */
    public List<RunwayDirectionPropertyType> getRunwayDirection() {
        if (runwayDirection == null) {
            runwayDirection = new ArrayList<>();
        }
        return this.runwayDirection;
    }

    public boolean isSetRunwayDirection() {
        return ((this.runwayDirection!= null)&&(!this.runwayDirection.isEmpty()));
    }

    public void unsetRunwayDirection() {
        this.runwayDirection = null;
    }

    /**
     * Gets the value of the servedAirport property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the servedAirport property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getServedAirport().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link AirportHeliportPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the servedAirport property.
     */
    public List<AirportHeliportPropertyType> getServedAirport() {
        if (servedAirport == null) {
            servedAirport = new ArrayList<>();
        }
        return this.servedAirport;
    }

    public boolean isSetServedAirport() {
        return ((this.servedAirport!= null)&&(!this.servedAirport.isEmpty()));
    }

    public void unsetServedAirport() {
        this.servedAirport = null;
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
     * {@link NavaidOperationalStatusPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the availability property.
     */
    public List<NavaidOperationalStatusPropertyType> getAvailability() {
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
     * {@link NavaidTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<NavaidTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractNavaidExtension"/>
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
        "abstractNavaidExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractNavaidExtension", required = true)
        @NotNull
        @Valid
        protected AbstractExtensionType abstractNavaidExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractNavaidExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractNavaidExtension() {
            return abstractNavaidExtension;
        }

        /**
         * Sets the value of the abstractNavaidExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractNavaidExtension(AbstractExtensionType value) {
            this.abstractNavaidExtension = value;
        }

        public boolean isSetAbstractNavaidExtension() {
            return (this.abstractNavaidExtension!= null);
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
