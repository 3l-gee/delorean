//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for RunwayCentrelinePointType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="RunwayCentrelinePointType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMFeatureType">
 *       <sequence>
 *         <element name="timeSlice" type="{http://www.aixm.aero/schema/5.1.1}RunwayCentrelinePointTimeSlicePropertyType" maxOccurs="unbounded"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RunwayCentrelinePointType", propOrder = {
    "timeSlice"
})
@Entity
@Table(name = "runwaycentrelinepoint", schema = "airport_heliport")
public class RunwayCentrelinePointType
    extends AbstractAIXMFeatureType
{

    @XmlElement(required = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "runwaycentrelinepoint_timeslice", joinColumns = {
        @JoinColumn(name = "runwaycentrelinepoint_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "runwaycentrelinepoint_tsp_id")
    })
    protected List<RunwayCentrelinePointTimeSlicePropertyType> timeSlice;

    /**
     * Gets the value of the timeSlice property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the timeSlice property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getTimeSlice().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RunwayCentrelinePointTimeSlicePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the timeSlice property.
     */
    public List<RunwayCentrelinePointTimeSlicePropertyType> getTimeSlice() {
        if (timeSlice == null) {
            timeSlice = new ArrayList<>();
        }
        return this.timeSlice;
    }

    public boolean isSetTimeSlice() {
        return ((this.timeSlice!= null)&&(!this.timeSlice.isEmpty()));
    }

    public void unsetTimeSlice() {
        this.timeSlice = null;
    }

}
