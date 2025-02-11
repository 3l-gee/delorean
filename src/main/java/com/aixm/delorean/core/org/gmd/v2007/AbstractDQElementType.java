//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gmd.v2007;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.org.gco.v2007.AbstractObjectType;
import com.aixm.delorean.core.org.gco.v2007.CharacterStringPropertyType;
import com.aixm.delorean.core.org.gco.v2007.DateTimePropertyType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlSeeAlso;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for AbstractDQ_Element_Type complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AbstractDQ_Element_Type">
 *   <complexContent>
 *     <extension base="{http://www.isotc211.org/2005/gco}AbstractObject_Type">
 *       <sequence>
 *         <element name="nameOfMeasure" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="measureIdentification" type="{http://www.isotc211.org/2005/gmd}MD_Identifier_PropertyType" minOccurs="0"/>
 *         <element name="measureDescription" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" minOccurs="0"/>
 *         <element name="evaluationMethodType" type="{http://www.isotc211.org/2005/gmd}DQ_EvaluationMethodTypeCode_PropertyType" minOccurs="0"/>
 *         <element name="evaluationMethodDescription" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" minOccurs="0"/>
 *         <element name="evaluationProcedure" type="{http://www.isotc211.org/2005/gmd}CI_Citation_PropertyType" minOccurs="0"/>
 *         <element name="dateTime" type="{http://www.isotc211.org/2005/gco}DateTime_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="result" type="{http://www.isotc211.org/2005/gmd}DQ_Result_PropertyType" maxOccurs="2"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AbstractDQ_Element_Type", propOrder = {
    "nameOfMeasure",
    "measureIdentification",
    "measureDescription",
    "evaluationMethodType",
    "evaluationMethodDescription",
    "evaluationProcedure",
    "dateTime",
    "result"
})
@XmlSeeAlso({
    AbstractDQTemporalAccuracyType.class,
    AbstractDQThematicAccuracyType.class,
    AbstractDQPositionalAccuracyType.class,
    AbstractDQLogicalConsistencyType.class,
    AbstractDQCompletenessType.class
})
public abstract class AbstractDQElementType
    extends AbstractObjectType
{

    protected List<CharacterStringPropertyType> nameOfMeasure;
    protected MDIdentifierPropertyType measureIdentification;
    protected CharacterStringPropertyType measureDescription;
    protected DQEvaluationMethodTypeCodePropertyType evaluationMethodType;
    protected CharacterStringPropertyType evaluationMethodDescription;
    protected CICitationPropertyType evaluationProcedure;
    protected List<DateTimePropertyType> dateTime;
    @XmlElement(required = true)
    protected List<DQResultPropertyType> result;

    /**
     * Gets the value of the nameOfMeasure property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the nameOfMeasure property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getNameOfMeasure().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CharacterStringPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the nameOfMeasure property.
     */
    public List<CharacterStringPropertyType> getNameOfMeasure() {
        if (nameOfMeasure == null) {
            nameOfMeasure = new ArrayList<>();
        }
        return this.nameOfMeasure;
    }

    public boolean isSetNameOfMeasure() {
        return ((this.nameOfMeasure!= null)&&(!this.nameOfMeasure.isEmpty()));
    }

    public void unsetNameOfMeasure() {
        this.nameOfMeasure = null;
    }

    /**
     * Gets the value of the measureIdentification property.
     * 
     * @return
     *     possible object is
     *     {@link MDIdentifierPropertyType }
     *     
     */
    public MDIdentifierPropertyType getMeasureIdentification() {
        return measureIdentification;
    }

    /**
     * Sets the value of the measureIdentification property.
     * 
     * @param value
     *     allowed object is
     *     {@link MDIdentifierPropertyType }
     *     
     */
    public void setMeasureIdentification(MDIdentifierPropertyType value) {
        this.measureIdentification = value;
    }

    public boolean isSetMeasureIdentification() {
        return (this.measureIdentification!= null);
    }

    /**
     * Gets the value of the measureDescription property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getMeasureDescription() {
        return measureDescription;
    }

    /**
     * Sets the value of the measureDescription property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setMeasureDescription(CharacterStringPropertyType value) {
        this.measureDescription = value;
    }

    public boolean isSetMeasureDescription() {
        return (this.measureDescription!= null);
    }

    /**
     * Gets the value of the evaluationMethodType property.
     * 
     * @return
     *     possible object is
     *     {@link DQEvaluationMethodTypeCodePropertyType }
     *     
     */
    public DQEvaluationMethodTypeCodePropertyType getEvaluationMethodType() {
        return evaluationMethodType;
    }

    /**
     * Sets the value of the evaluationMethodType property.
     * 
     * @param value
     *     allowed object is
     *     {@link DQEvaluationMethodTypeCodePropertyType }
     *     
     */
    public void setEvaluationMethodType(DQEvaluationMethodTypeCodePropertyType value) {
        this.evaluationMethodType = value;
    }

    public boolean isSetEvaluationMethodType() {
        return (this.evaluationMethodType!= null);
    }

    /**
     * Gets the value of the evaluationMethodDescription property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getEvaluationMethodDescription() {
        return evaluationMethodDescription;
    }

    /**
     * Sets the value of the evaluationMethodDescription property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setEvaluationMethodDescription(CharacterStringPropertyType value) {
        this.evaluationMethodDescription = value;
    }

    public boolean isSetEvaluationMethodDescription() {
        return (this.evaluationMethodDescription!= null);
    }

    /**
     * Gets the value of the evaluationProcedure property.
     * 
     * @return
     *     possible object is
     *     {@link CICitationPropertyType }
     *     
     */
    public CICitationPropertyType getEvaluationProcedure() {
        return evaluationProcedure;
    }

    /**
     * Sets the value of the evaluationProcedure property.
     * 
     * @param value
     *     allowed object is
     *     {@link CICitationPropertyType }
     *     
     */
    public void setEvaluationProcedure(CICitationPropertyType value) {
        this.evaluationProcedure = value;
    }

    public boolean isSetEvaluationProcedure() {
        return (this.evaluationProcedure!= null);
    }

    /**
     * Gets the value of the dateTime property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the dateTime property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getDateTime().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DateTimePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the dateTime property.
     */
    public List<DateTimePropertyType> getDateTime() {
        if (dateTime == null) {
            dateTime = new ArrayList<>();
        }
        return this.dateTime;
    }

    public boolean isSetDateTime() {
        return ((this.dateTime!= null)&&(!this.dateTime.isEmpty()));
    }

    public void unsetDateTime() {
        this.dateTime = null;
    }

    /**
     * Gets the value of the result property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the result property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getResult().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DQResultPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the result property.
     */
    public List<DQResultPropertyType> getResult() {
        if (result == null) {
            result = new ArrayList<>();
        }
        return this.result;
    }

    public boolean isSetResult() {
        return ((this.result!= null)&&(!this.result.isEmpty()));
    }

    public void unsetResult() {
        this.result = null;
    }

}
