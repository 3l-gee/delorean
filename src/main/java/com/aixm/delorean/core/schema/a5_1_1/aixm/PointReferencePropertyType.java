//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PointReferencePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="PointReferencePropertyType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMPropertyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}PointReference"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PointReferencePropertyType", propOrder = {
    "pointReference"
})
public class PointReferencePropertyType
    extends AbstractAIXMPropertyType
{

    @XmlElement(name = "PointReference", required = true)
    protected PointReferenceType pointReference;

    /**
     * Gets the value of the pointReference property.
     * 
     * @return
     *     possible object is
     *     {@link PointReferenceType }
     *     
     */
    public PointReferenceType getPointReference() {
        return pointReference;
    }

    /**
     * Sets the value of the pointReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link PointReferenceType }
     *     
     */
    public void setPointReference(PointReferenceType value) {
        this.pointReference = value;
    }

    public boolean isSetPointReference() {
        return (this.pointReference!= null);
    }

}