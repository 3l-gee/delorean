//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.school;

import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for implementationAixmPoint complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="implementationAixmPoint">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *         <element name="aixmPoint" type="{}AixmPointPropertyType"/>
 *         <element name="name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         <element name="id" type="{http://www.w3.org/2001/XMLSchema}long"/>
 *       </sequence>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "implementationAixmPoint", propOrder = {
    "aixmPoint",
    "name",
    "id"
})
@Entity
@Table(name = "impl_aixm_point")
public class ImplementationAixmPoint {

    @XmlElement(required = true)
    @Embedded
    protected AixmPointPropertyType aixmPoint;
    @XmlElement(required = true)
    @Column(name = "name")
    protected String name;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    protected long id;

    /**
     * Gets the value of the aixmPoint property.
     * 
     * @return
     *     possible object is
     *     {@link AixmPointPropertyType }
     *     
     */
    public AixmPointPropertyType getAixmPoint() {
        return aixmPoint;
    }

    /**
     * Sets the value of the aixmPoint property.
     * 
     * @param value
     *     allowed object is
     *     {@link AixmPointPropertyType }
     *     
     */
    public void setAixmPoint(AixmPointPropertyType value) {
        this.aixmPoint = value;
    }

    /**
     * Gets the value of the name property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the value of the name property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setName(String value) {
        this.name = value;
    }

    /**
     * Gets the value of the id property.
     * 
     */
    public long getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     */
    public void setId(long value) {
        this.id = value;
    }

}