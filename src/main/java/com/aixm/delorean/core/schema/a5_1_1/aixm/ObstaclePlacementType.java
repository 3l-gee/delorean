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
 * <p>Java class for ObstaclePlacementType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="ObstaclePlacementType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMObjectType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}ObstaclePlacementPropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractObstaclePlacementExtension"/>
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
@XmlType(name = "ObstaclePlacementType", propOrder = {
    "obstacleBearing",
    "obstacleDistance",
    "pointType",
    "obstaclePlacement",
    "annotation",
    "extension"
})
public class ObstaclePlacementType
    extends AbstractAIXMObjectType
{

    @XmlElementRef(name = "obstacleBearing", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValBearingType> obstacleBearing;
    @XmlElementRef(name = "obstacleDistance", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValDistanceType> obstacleDistance;
    @XmlElementRef(name = "pointType", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<TextNameType> pointType;
    @XmlElementRef(name = "obstaclePlacement", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeSideType> obstaclePlacement;
    @XmlElement(nillable = true)
    protected List<NotePropertyType> annotation;
    protected List<ObstaclePlacementType.Extension> extension;

    /**
     * Gets the value of the obstacleBearing property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValBearingType }{@code >}
     *     
     */
    public JAXBElement<ValBearingType> getObstacleBearing() {
        return obstacleBearing;
    }

    /**
     * Sets the value of the obstacleBearing property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValBearingType }{@code >}
     *     
     */
    public void setObstacleBearing(JAXBElement<ValBearingType> value) {
        this.obstacleBearing = value;
    }

    public boolean isSetObstacleBearing() {
        return (this.obstacleBearing!= null);
    }

    /**
     * Gets the value of the obstacleDistance property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public JAXBElement<ValDistanceType> getObstacleDistance() {
        return obstacleDistance;
    }

    /**
     * Sets the value of the obstacleDistance property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public void setObstacleDistance(JAXBElement<ValDistanceType> value) {
        this.obstacleDistance = value;
    }

    public boolean isSetObstacleDistance() {
        return (this.obstacleDistance!= null);
    }

    /**
     * Gets the value of the pointType property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link TextNameType }{@code >}
     *     
     */
    public JAXBElement<TextNameType> getPointType() {
        return pointType;
    }

    /**
     * Sets the value of the pointType property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link TextNameType }{@code >}
     *     
     */
    public void setPointType(JAXBElement<TextNameType> value) {
        this.pointType = value;
    }

    public boolean isSetPointType() {
        return (this.pointType!= null);
    }

    /**
     * Gets the value of the obstaclePlacement property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeSideType }{@code >}
     *     
     */
    public JAXBElement<CodeSideType> getObstaclePlacement() {
        return obstaclePlacement;
    }

    /**
     * Sets the value of the obstaclePlacement property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeSideType }{@code >}
     *     
     */
    public void setObstaclePlacement(JAXBElement<CodeSideType> value) {
        this.obstaclePlacement = value;
    }

    public boolean isSetObstaclePlacement() {
        return (this.obstaclePlacement!= null);
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
     * {@link ObstaclePlacementType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<ObstaclePlacementType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractObstaclePlacementExtension"/>
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
        "abstractObstaclePlacementExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractObstaclePlacementExtension")
        protected AbstractExtensionType abstractObstaclePlacementExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractObstaclePlacementExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractObstaclePlacementExtension() {
            return abstractObstaclePlacementExtension;
        }

        /**
         * Sets the value of the abstractObstaclePlacementExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractObstaclePlacementExtension(AbstractExtensionType value) {
            this.abstractObstaclePlacementExtension = value;
        }

        public boolean isSetAbstractObstaclePlacementExtension() {
            return (this.abstractObstaclePlacementExtension!= null);
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