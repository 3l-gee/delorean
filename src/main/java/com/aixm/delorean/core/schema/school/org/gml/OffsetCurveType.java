//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.school.org.gml;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for OffsetCurveType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="OffsetCurveType">
 *   <complexContent>
 *     <extension base="{http://www.opengis.net/gml/3.2}AbstractCurveSegmentType">
 *       <sequence>
 *         <element name="offsetBase" type="{http://www.opengis.net/gml/3.2}CurvePropertyType"/>
 *         <element name="distance" type="{http://www.opengis.net/gml/3.2}LengthType"/>
 *         <element name="refDirection" type="{http://www.opengis.net/gml/3.2}VectorType" minOccurs="0"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "OffsetCurveType", propOrder = {
    "offsetBase",
    "distance",
    "refDirection"
})
public class OffsetCurveType
    extends AbstractCurveSegmentType
{

    @XmlElement(required = true)
    protected CurvePropertyType offsetBase;
    @XmlElement(required = true)
    protected LengthType distance;
    protected VectorType refDirection;

    /**
     * Gets the value of the offsetBase property.
     * 
     * @return
     *     possible object is
     *     {@link CurvePropertyType }
     *     
     */
    public CurvePropertyType getOffsetBase() {
        return offsetBase;
    }

    /**
     * Sets the value of the offsetBase property.
     * 
     * @param value
     *     allowed object is
     *     {@link CurvePropertyType }
     *     
     */
    public void setOffsetBase(CurvePropertyType value) {
        this.offsetBase = value;
    }

    /**
     * Gets the value of the distance property.
     * 
     * @return
     *     possible object is
     *     {@link LengthType }
     *     
     */
    public LengthType getDistance() {
        return distance;
    }

    /**
     * Sets the value of the distance property.
     * 
     * @param value
     *     allowed object is
     *     {@link LengthType }
     *     
     */
    public void setDistance(LengthType value) {
        this.distance = value;
    }

    /**
     * Gets the value of the refDirection property.
     * 
     * @return
     *     possible object is
     *     {@link VectorType }
     *     
     */
    public VectorType getRefDirection() {
        return refDirection;
    }

    /**
     * Sets the value of the refDirection property.
     * 
     * @param value
     *     allowed object is
     *     {@link VectorType }
     *     
     */
    public void setRefDirection(VectorType value) {
        this.refDirection = value;
    }

}