//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gml.v_3_2;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlList;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GridEnvelopeType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GridEnvelopeType">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element name="low" type="{http://www.opengis.net/gml/3.2}integerList"/>
 *         <element name="high" type="{http://www.opengis.net/gml/3.2}integerList"/>
 *       </sequence>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GridEnvelopeType", propOrder = {
    "low",
    "high"
})
public class GridEnvelopeType {

    @XmlList
    @XmlElement(required = true)
    protected List<BigInteger> low;
    @XmlList
    @XmlElement(required = true)
    protected List<BigInteger> high;

    /**
     * Gets the value of the low property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the low property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getLow().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link BigInteger }
     * </p>
     * 
     * 
     * @return
     *     The value of the low property.
     */
    public List<BigInteger> getLow() {
        if (low == null) {
            low = new ArrayList<>();
        }
        return this.low;
    }

    public boolean isSetLow() {
        return ((this.low!= null)&&(!this.low.isEmpty()));
    }

    public void unsetLow() {
        this.low = null;
    }

    /**
     * Gets the value of the high property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the high property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getHigh().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link BigInteger }
     * </p>
     * 
     * 
     * @return
     *     The value of the high property.
     */
    public List<BigInteger> getHigh() {
        if (high == null) {
            high = new ArrayList<>();
        }
        return this.high;
    }

    public boolean isSetHigh() {
        return ((this.high!= null)&&(!this.high.isEmpty()));
    }

    public void unsetHigh() {
        this.high = null;
    }

}
