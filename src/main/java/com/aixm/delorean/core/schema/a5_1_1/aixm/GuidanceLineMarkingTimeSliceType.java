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
 * <p>Java class for GuidanceLineMarkingTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GuidanceLineMarkingTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}GuidanceLineMarkingPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractGuidanceLineMarkingExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractMarkingExtension"/>
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
@XmlType(name = "GuidanceLineMarkingTimeSliceType", propOrder = {
    "markingICAOStandard",
    "condition",
    "element",
    "annotation",
    "markedGuidanceLine",
    "extension"
})
@Embeddable
public class GuidanceLineMarkingTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "marking_icao_standard")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "marking_icao_standard_nilreason"))
    })
    protected CodeYesNoType markingICAOStandard;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "condition")),
        @AttributeOverride(name = "nilReason", column = @Column(name = "condition_nilreason"))
    })
    protected CodeMarkingConditionType condition;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected List<MarkingElementPropertyType> element;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    protected List<NotePropertyType> annotation;
    @XmlElementRef(name = "markedGuidanceLine", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    @Transient
    protected JAXBElement<GuidanceLinePropertyType> markedGuidanceLine;
    @Transient
    protected List<GuidanceLineMarkingTimeSliceType.Extension> extension;

    /**
     * Gets the value of the markingICAOStandard property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getMarkingICAOStandard() {
        return markingICAOStandard;
    }

    /**
     * Sets the value of the markingICAOStandard property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setMarkingICAOStandard(CodeYesNoType value) {
        this.markingICAOStandard = value;
    }

    public boolean isSetMarkingICAOStandard() {
        return (this.markingICAOStandard!= null);
    }

    /**
     * Gets the value of the condition property.
     * 
     * @return
     *     possible object is
     *     {@link CodeMarkingConditionType }
     *     
     */
    public CodeMarkingConditionType getCondition() {
        return condition;
    }

    /**
     * Sets the value of the condition property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeMarkingConditionType }
     *     
     */
    public void setCondition(CodeMarkingConditionType value) {
        this.condition = value;
    }

    public boolean isSetCondition() {
        return (this.condition!= null);
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
     * {@link MarkingElementPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the element property.
     */
    public List<MarkingElementPropertyType> getElement() {
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
     * Gets the value of the markedGuidanceLine property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link GuidanceLinePropertyType }{@code >}
     *     
     */
    public JAXBElement<GuidanceLinePropertyType> getMarkedGuidanceLine() {
        return markedGuidanceLine;
    }

    /**
     * Sets the value of the markedGuidanceLine property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link GuidanceLinePropertyType }{@code >}
     *     
     */
    public void setMarkedGuidanceLine(JAXBElement<GuidanceLinePropertyType> value) {
        this.markedGuidanceLine = value;
    }

    public boolean isSetMarkedGuidanceLine() {
        return (this.markedGuidanceLine!= null);
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
     * {@link GuidanceLineMarkingTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<GuidanceLineMarkingTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractGuidanceLineMarkingExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractMarkingExtension"/>
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
        "abstractGuidanceLineMarkingExtension",
        "abstractMarkingExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractGuidanceLineMarkingExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        protected AbstractExtensionType abstractGuidanceLineMarkingExtension;
        @XmlElement(name = "AbstractMarkingExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        protected AbstractExtensionType abstractMarkingExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractGuidanceLineMarkingExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractGuidanceLineMarkingExtension() {
            return abstractGuidanceLineMarkingExtension;
        }

        /**
         * Sets the value of the abstractGuidanceLineMarkingExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractGuidanceLineMarkingExtension(AbstractExtensionType value) {
            this.abstractGuidanceLineMarkingExtension = value;
        }

        public boolean isSetAbstractGuidanceLineMarkingExtension() {
            return (this.abstractGuidanceLineMarkingExtension!= null);
        }

        /**
         * Gets the value of the abstractMarkingExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractMarkingExtension() {
            return abstractMarkingExtension;
        }

        /**
         * Sets the value of the abstractMarkingExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractMarkingExtension(AbstractExtensionType value) {
            this.abstractMarkingExtension = value;
        }

        public boolean isSetAbstractMarkingExtension() {
            return (this.abstractMarkingExtension!= null);
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
