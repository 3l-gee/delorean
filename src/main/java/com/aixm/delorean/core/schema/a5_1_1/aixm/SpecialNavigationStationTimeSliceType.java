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
 * <p>Java class for SpecialNavigationStationTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="SpecialNavigationStationTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}SpecialNavigationStationPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <sequence>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractSpecialNavigationStationExtension"/>
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
@XmlType(name = "SpecialNavigationStationTimeSliceType", propOrder = {
    "aixmName",
    "type",
    "frequency",
    "emission",
    "systemChain",
    "responsibleOrganisation",
    "position",
    "availability",
    "annotation",
    "extension"
})
public class SpecialNavigationStationTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElementRef(name = "name", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<TextNameType> aixmName;
    @XmlElementRef(name = "type", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeSpecialNavigationStationType> type;
    @XmlElementRef(name = "frequency", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValFrequencyType> frequency;
    @XmlElementRef(name = "emission", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeRadioEmissionType> emission;
    @XmlElementRef(name = "systemChain", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<SpecialNavigationSystemPropertyType> systemChain;
    @XmlElementRef(name = "responsibleOrganisation", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<AuthorityForSpecialNavigationStationPropertyType> responsibleOrganisation;
    @XmlElementRef(name = "position", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ElevatedPointPropertyType> position;
    @XmlElement(nillable = true)
    protected List<SpecialNavigationStationStatusPropertyType> availability;
    @XmlElement(nillable = true)
    protected List<NotePropertyType> annotation;
    protected List<SpecialNavigationStationTimeSliceType.Extension> extension;

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
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeSpecialNavigationStationType }{@code >}
     *     
     */
    public JAXBElement<CodeSpecialNavigationStationType> getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeSpecialNavigationStationType }{@code >}
     *     
     */
    public void setType(JAXBElement<CodeSpecialNavigationStationType> value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the frequency property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValFrequencyType }{@code >}
     *     
     */
    public JAXBElement<ValFrequencyType> getFrequency() {
        return frequency;
    }

    /**
     * Sets the value of the frequency property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValFrequencyType }{@code >}
     *     
     */
    public void setFrequency(JAXBElement<ValFrequencyType> value) {
        this.frequency = value;
    }

    public boolean isSetFrequency() {
        return (this.frequency!= null);
    }

    /**
     * Gets the value of the emission property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeRadioEmissionType }{@code >}
     *     
     */
    public JAXBElement<CodeRadioEmissionType> getEmission() {
        return emission;
    }

    /**
     * Sets the value of the emission property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeRadioEmissionType }{@code >}
     *     
     */
    public void setEmission(JAXBElement<CodeRadioEmissionType> value) {
        this.emission = value;
    }

    public boolean isSetEmission() {
        return (this.emission!= null);
    }

    /**
     * Gets the value of the systemChain property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link SpecialNavigationSystemPropertyType }{@code >}
     *     
     */
    public JAXBElement<SpecialNavigationSystemPropertyType> getSystemChain() {
        return systemChain;
    }

    /**
     * Sets the value of the systemChain property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link SpecialNavigationSystemPropertyType }{@code >}
     *     
     */
    public void setSystemChain(JAXBElement<SpecialNavigationSystemPropertyType> value) {
        this.systemChain = value;
    }

    public boolean isSetSystemChain() {
        return (this.systemChain!= null);
    }

    /**
     * Gets the value of the responsibleOrganisation property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link AuthorityForSpecialNavigationStationPropertyType }{@code >}
     *     
     */
    public JAXBElement<AuthorityForSpecialNavigationStationPropertyType> getResponsibleOrganisation() {
        return responsibleOrganisation;
    }

    /**
     * Sets the value of the responsibleOrganisation property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link AuthorityForSpecialNavigationStationPropertyType }{@code >}
     *     
     */
    public void setResponsibleOrganisation(JAXBElement<AuthorityForSpecialNavigationStationPropertyType> value) {
        this.responsibleOrganisation = value;
    }

    public boolean isSetResponsibleOrganisation() {
        return (this.responsibleOrganisation!= null);
    }

    /**
     * Gets the value of the position property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ElevatedPointPropertyType }{@code >}
     *     
     */
    public JAXBElement<ElevatedPointPropertyType> getPosition() {
        return position;
    }

    /**
     * Sets the value of the position property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ElevatedPointPropertyType }{@code >}
     *     
     */
    public void setPosition(JAXBElement<ElevatedPointPropertyType> value) {
        this.position = value;
    }

    public boolean isSetPosition() {
        return (this.position!= null);
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
     * {@link SpecialNavigationStationStatusPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the availability property.
     */
    public List<SpecialNavigationStationStatusPropertyType> getAvailability() {
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
     * {@link SpecialNavigationStationTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<SpecialNavigationStationTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractSpecialNavigationStationExtension"/>
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
        "abstractSpecialNavigationStationExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractSpecialNavigationStationExtension", required = true)
        protected AbstractExtensionType abstractSpecialNavigationStationExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractSpecialNavigationStationExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractSpecialNavigationStationExtension() {
            return abstractSpecialNavigationStationExtension;
        }

        /**
         * Sets the value of the abstractSpecialNavigationStationExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractSpecialNavigationStationExtension(AbstractExtensionType value) {
            this.abstractSpecialNavigationStationExtension = value;
        }

        public boolean isSetAbstractSpecialNavigationStationExtension() {
            return (this.abstractSpecialNavigationStationExtension!= null);
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