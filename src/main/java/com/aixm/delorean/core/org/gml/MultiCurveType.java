//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gml;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for MultiCurveType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="MultiCurveType">
 *   <complexContent>
 *     <extension base="{http://www.opengis.net/gml/3.2}AbstractGeometricAggregateType">
 *       <sequence>
 *         <element ref="{http://www.opengis.net/gml/3.2}curveMember" maxOccurs="unbounded" minOccurs="0"/>
 *         <element ref="{http://www.opengis.net/gml/3.2}curveMembers" minOccurs="0"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MultiCurveType", propOrder = {
    "curveMember",
    "curveMembers"
})
public class MultiCurveType
    extends AbstractGeometricAggregateType
{

    protected List<CurvePropertyType> curveMember;
    /**
     * This property element contains a list of curves. The order of the elements is significant and shall be preserved when processing the array.
     * 
     */
    protected CurveArrayPropertyType curveMembers;

    /**
     * Gets the value of the curveMember property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the curveMember property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getCurveMember().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CurvePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the curveMember property.
     */
    public List<CurvePropertyType> getCurveMember() {
        if (curveMember == null) {
            curveMember = new ArrayList<>();
        }
        return this.curveMember;
    }

    public boolean isSetCurveMember() {
        return ((this.curveMember!= null)&&(!this.curveMember.isEmpty()));
    }

    public void unsetCurveMember() {
        this.curveMember = null;
    }

    /**
     * This property element contains a list of curves. The order of the elements is significant and shall be preserved when processing the array.
     * 
     * @return
     *     possible object is
     *     {@link CurveArrayPropertyType }
     *     
     */
    public CurveArrayPropertyType getCurveMembers() {
        return curveMembers;
    }

    /**
     * Sets the value of the curveMembers property.
     * 
     * @param value
     *     allowed object is
     *     {@link CurveArrayPropertyType }
     *     
     * @see #getCurveMembers()
     */
    public void setCurveMembers(CurveArrayPropertyType value) {
        this.curveMembers = value;
    }

    public boolean isSetCurveMembers() {
        return (this.curveMembers!= null);
    }

}