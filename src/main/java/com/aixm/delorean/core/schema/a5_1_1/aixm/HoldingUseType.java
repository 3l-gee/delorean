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
 * <p>Java class for HoldingUseType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="HoldingUseType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMObjectType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}HoldingUsePropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractHoldingUseExtension"/>
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
@XmlType(name = "HoldingUseType", propOrder = {
    "holdingUse",
    "instruction",
    "instructedAltitude",
    "instructionAltitudeReference",
    "annotation",
    "theHoldingPattern",
    "extension"
})
@Entity
@Table(name = "holdinguse", schema = "procedure")
public class HoldingUseType
    extends AbstractAIXMObjectType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "holdinguse_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "holdinguse_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeHoldingUseType holdingUse;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "instruction_value", length = 10000, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "instruction_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextInstructionType instruction;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "instructedaltitude_value", length = 255, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "uom", column = @Column(name = "instructedaltitude_uom", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "instructedaltitude_nilreason", length = 255, nullable = true, unique = false))
    })
    protected ValDistanceVerticalType instructedAltitude;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "instructionaltitudereference_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "instructionaltitudereference_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeVerticalReferenceType instructionAltitudeReference;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "holdinguse_annotation", joinColumns = {
        @JoinColumn(name = "holdinguse_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "theholdingpattern_id", referencedColumnName = "id")
    protected HoldingPatternPropertyType theHoldingPattern;
    @Transient
    protected List<HoldingUseType.Extension> extension;

    /**
     * Gets the value of the holdingUse property.
     * 
     * @return
     *     possible object is
     *     {@link CodeHoldingUseType }
     *     
     */
    public CodeHoldingUseType getHoldingUse() {
        return holdingUse;
    }

    /**
     * Sets the value of the holdingUse property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeHoldingUseType }
     *     
     */
    public void setHoldingUse(CodeHoldingUseType value) {
        this.holdingUse = value;
    }

    public boolean isSetHoldingUse() {
        return (this.holdingUse!= null);
    }

    /**
     * Gets the value of the instruction property.
     * 
     * @return
     *     possible object is
     *     {@link TextInstructionType }
     *     
     */
    public TextInstructionType getInstruction() {
        return instruction;
    }

    /**
     * Sets the value of the instruction property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextInstructionType }
     *     
     */
    public void setInstruction(TextInstructionType value) {
        this.instruction = value;
    }

    public boolean isSetInstruction() {
        return (this.instruction!= null);
    }

    /**
     * Gets the value of the instructedAltitude property.
     * 
     * @return
     *     possible object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public ValDistanceVerticalType getInstructedAltitude() {
        return instructedAltitude;
    }

    /**
     * Sets the value of the instructedAltitude property.
     * 
     * @param value
     *     allowed object is
     *     {@link ValDistanceVerticalType }
     *     
     */
    public void setInstructedAltitude(ValDistanceVerticalType value) {
        this.instructedAltitude = value;
    }

    public boolean isSetInstructedAltitude() {
        return (this.instructedAltitude!= null);
    }

    /**
     * Gets the value of the instructionAltitudeReference property.
     * 
     * @return
     *     possible object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public CodeVerticalReferenceType getInstructionAltitudeReference() {
        return instructionAltitudeReference;
    }

    /**
     * Sets the value of the instructionAltitudeReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeVerticalReferenceType }
     *     
     */
    public void setInstructionAltitudeReference(CodeVerticalReferenceType value) {
        this.instructionAltitudeReference = value;
    }

    public boolean isSetInstructionAltitudeReference() {
        return (this.instructionAltitudeReference!= null);
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
     * Gets the value of the theHoldingPattern property.
     * 
     * @return
     *     possible object is
     *     {@link HoldingPatternPropertyType }
     *     
     */
    public HoldingPatternPropertyType getTheHoldingPattern() {
        return theHoldingPattern;
    }

    /**
     * Sets the value of the theHoldingPattern property.
     * 
     * @param value
     *     allowed object is
     *     {@link HoldingPatternPropertyType }
     *     
     */
    public void setTheHoldingPattern(HoldingPatternPropertyType value) {
        this.theHoldingPattern = value;
    }

    public boolean isSetTheHoldingPattern() {
        return (this.theHoldingPattern!= null);
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
     * {@link HoldingUseType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<HoldingUseType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractHoldingUseExtension"/>
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
        "abstractHoldingUseExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractHoldingUseExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractholdinguseextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractHoldingUseExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractHoldingUseExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractHoldingUseExtension() {
            return abstractHoldingUseExtension;
        }

        /**
         * Sets the value of the abstractHoldingUseExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractHoldingUseExtension(AbstractExtensionType value) {
            this.abstractHoldingUseExtension = value;
        }

        public boolean isSetAbstractHoldingUseExtension() {
            return (this.abstractHoldingUseExtension!= null);
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
