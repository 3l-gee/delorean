//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for VisualGlideSlopeIndicatorType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="VisualGlideSlopeIndicatorType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractGroundLightSystemType">
 *       <sequence>
 *         <element name="timeSlice" type="{http://www.aixm.aero/schema/5.1.1}VisualGlideSlopeIndicatorTimeSlicePropertyType" maxOccurs="unbounded"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "VisualGlideSlopeIndicatorType", propOrder = {
    "timeSlice"
})
public class VisualGlideSlopeIndicatorType
    extends AbstractGroundLightSystemType
{

    @XmlElement(required = true)
    protected List<VisualGlideSlopeIndicatorTimeSlicePropertyType> timeSlice;

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
     * {@link VisualGlideSlopeIndicatorTimeSlicePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the timeSlice property.
     */
    public List<VisualGlideSlopeIndicatorTimeSlicePropertyType> getTimeSlice() {
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