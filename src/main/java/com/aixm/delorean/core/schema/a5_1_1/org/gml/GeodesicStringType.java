//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.org.gml;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElements;
import jakarta.xml.bind.annotation.XmlSeeAlso;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GeodesicStringType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GeodesicStringType">
 *   <complexContent>
 *     <extension base="{http://www.opengis.net/gml/3.2}AbstractCurveSegmentType">
 *       <choice>
 *         <element ref="{http://www.opengis.net/gml/3.2}posList"/>
 *         <group ref="{http://www.opengis.net/gml/3.2}geometricPositionGroup" maxOccurs="unbounded" minOccurs="2"/>
 *       </choice>
 *       <attribute name="interpolation" type="{http://www.opengis.net/gml/3.2}CurveInterpolationType" fixed="geodesic" />
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GeodesicStringType", propOrder = {
    "posList",
    "geometricPositionGroup"
})
@XmlSeeAlso({
    GeodesicType.class
})
public class GeodesicStringType
    extends AbstractCurveSegmentType
{

    protected DirectPositionListType posList;
    /**
     * GML supports two different ways to specify a geometric position: either by a direct position (a data type) or a point (a geometric object).
     * pos elements are positions that are "owned" by the geometric primitive encapsulating this geometric position.
     * pointProperty elements contain a point that may be referenced from other geometry elements or reference another point defined elsewhere (reuse of existing points).
     * 
     */
    @XmlElements({
        @XmlElement(name = "pos", type = DirectPositionType.class),
        @XmlElement(name = "pointProperty", type = PointPropertyType.class)
    })
    protected List<Object> geometricPositionGroup;
    @XmlAttribute(name = "interpolation")
    public static final CurveInterpolationType INTERPOLATION = CurveInterpolationType.GEODESIC;

    /**
     * Gets the value of the posList property.
     * 
     * @return
     *     possible object is
     *     {@link DirectPositionListType }
     *     
     */
    public DirectPositionListType getPosList() {
        return posList;
    }

    /**
     * Sets the value of the posList property.
     * 
     * @param value
     *     allowed object is
     *     {@link DirectPositionListType }
     *     
     */
    public void setPosList(DirectPositionListType value) {
        this.posList = value;
    }

    public boolean isSetPosList() {
        return (this.posList!= null);
    }

    /**
     * GML supports two different ways to specify a geometric position: either by a direct position (a data type) or a point (a geometric object).
     * pos elements are positions that are "owned" by the geometric primitive encapsulating this geometric position.
     * pointProperty elements contain a point that may be referenced from other geometry elements or reference another point defined elsewhere (reuse of existing points).
     * 
     * Gets the value of the geometricPositionGroup property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the geometricPositionGroup property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getGeometricPositionGroup().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DirectPositionType }
     * {@link PointPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the geometricPositionGroup property.
     */
    public List<Object> getGeometricPositionGroup() {
        if (geometricPositionGroup == null) {
            geometricPositionGroup = new ArrayList<>();
        }
        return this.geometricPositionGroup;
    }

    public boolean isSetGeometricPositionGroup() {
        return ((this.geometricPositionGroup!= null)&&(!this.geometricPositionGroup.isEmpty()));
    }

    public void unsetGeometricPositionGroup() {
        this.geometricPositionGroup = null;
    }

}