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
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlSeeAlso;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PointType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="PointType">
 *   <complexContent>
 *     <extension base="{http://www.opengis.net/gml/3.2}PointType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}PointPropertyGroup"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PointType", propOrder = {
    "horizontalAccuracy",
    "annotation"
})
@XmlSeeAlso({
    ElevatedPointType.class
})
public class PointType
    extends com.aixm.delorean.core.schema.a5_1_1.org.gml.PointType
{

    @XmlElementRef(name = "horizontalAccuracy", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ValDistanceType> horizontalAccuracy;
    @XmlElement(nillable = true)
    protected List<NotePropertyType> annotation;

    /**
     * Gets the value of the horizontalAccuracy property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public JAXBElement<ValDistanceType> getHorizontalAccuracy() {
        return horizontalAccuracy;
    }

    /**
     * Sets the value of the horizontalAccuracy property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ValDistanceType }{@code >}
     *     
     */
    public void setHorizontalAccuracy(JAXBElement<ValDistanceType> value) {
        this.horizontalAccuracy = value;
    }

    public boolean isSetHorizontalAccuracy() {
        return (this.horizontalAccuracy!= null);
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

}