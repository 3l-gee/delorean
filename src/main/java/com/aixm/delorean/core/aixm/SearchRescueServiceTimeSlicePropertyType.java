//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.aixm;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for SearchRescueServiceTimeSlicePropertyType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="SearchRescueServiceTimeSlicePropertyType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element ref="{http://www.aixm.aero/schema/5.1.1}SearchRescueServiceTimeSlice"/>
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
@XmlType(name = "SearchRescueServiceTimeSlicePropertyType", propOrder = {
    "searchRescueServiceTimeSlice"
})
public class SearchRescueServiceTimeSlicePropertyType {

    @XmlElement(name = "SearchRescueServiceTimeSlice", required = true)
    protected SearchRescueServiceTimeSliceType searchRescueServiceTimeSlice;
    @XmlAttribute(name = "owns")
    protected Boolean owns;

    /**
     * Gets the value of the searchRescueServiceTimeSlice property.
     * 
     * @return
     *     possible object is
     *     {@link SearchRescueServiceTimeSliceType }
     *     
     */
    public SearchRescueServiceTimeSliceType getSearchRescueServiceTimeSlice() {
        return searchRescueServiceTimeSlice;
    }

    /**
     * Sets the value of the searchRescueServiceTimeSlice property.
     * 
     * @param value
     *     allowed object is
     *     {@link SearchRescueServiceTimeSliceType }
     *     
     */
    public void setSearchRescueServiceTimeSlice(SearchRescueServiceTimeSliceType value) {
        this.searchRescueServiceTimeSlice = value;
    }

    public boolean isSetSearchRescueServiceTimeSlice() {
        return (this.searchRescueServiceTimeSlice!= null);
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