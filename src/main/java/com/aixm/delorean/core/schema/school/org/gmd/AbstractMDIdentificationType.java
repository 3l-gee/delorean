//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.school.org.gmd;

import java.util.ArrayList;
import java.util.List;
import com.aixm.delorean.core.schema.school.org.gco.AbstractObjectType;
import com.aixm.delorean.core.schema.school.org.gco.CharacterStringPropertyType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlSeeAlso;
import jakarta.xml.bind.annotation.XmlType;


/**
 * Basic information about data
 * 
 * <p>Java class for AbstractMD_Identification_Type complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AbstractMD_Identification_Type">
 *   <complexContent>
 *     <extension base="{http://www.isotc211.org/2005/gco}AbstractObject_Type">
 *       <sequence>
 *         <element name="citation" type="{http://www.isotc211.org/2005/gmd}CI_Citation_PropertyType"/>
 *         <element name="abstract" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType"/>
 *         <element name="purpose" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" minOccurs="0"/>
 *         <element name="credit" type="{http://www.isotc211.org/2005/gco}CharacterString_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="status" type="{http://www.isotc211.org/2005/gmd}MD_ProgressCode_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="pointOfContact" type="{http://www.isotc211.org/2005/gmd}CI_ResponsibleParty_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="resourceMaintenance" type="{http://www.isotc211.org/2005/gmd}MD_MaintenanceInformation_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="graphicOverview" type="{http://www.isotc211.org/2005/gmd}MD_BrowseGraphic_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="resourceFormat" type="{http://www.isotc211.org/2005/gmd}MD_Format_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="descriptiveKeywords" type="{http://www.isotc211.org/2005/gmd}MD_Keywords_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="resourceSpecificUsage" type="{http://www.isotc211.org/2005/gmd}MD_Usage_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="resourceConstraints" type="{http://www.isotc211.org/2005/gmd}MD_Constraints_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *         <element name="aggregationInfo" type="{http://www.isotc211.org/2005/gmd}MD_AggregateInformation_PropertyType" maxOccurs="unbounded" minOccurs="0"/>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AbstractMD_Identification_Type", propOrder = {
    "citation",
    "_abstract",
    "purpose",
    "credit",
    "status",
    "pointOfContact",
    "resourceMaintenance",
    "graphicOverview",
    "resourceFormat",
    "descriptiveKeywords",
    "resourceSpecificUsage",
    "resourceConstraints",
    "aggregationInfo"
})
@XmlSeeAlso({
    MDDataIdentificationType.class,
    MDServiceIdentificationType.class
})
public abstract class AbstractMDIdentificationType
    extends AbstractObjectType
{

    @XmlElement(required = true)
    protected CICitationPropertyType citation;
    @XmlElement(name = "abstract", required = true)
    protected CharacterStringPropertyType _abstract;
    protected CharacterStringPropertyType purpose;
    protected List<CharacterStringPropertyType> credit;
    protected List<MDProgressCodePropertyType> status;
    protected List<CIResponsiblePartyPropertyType> pointOfContact;
    protected List<MDMaintenanceInformationPropertyType> resourceMaintenance;
    protected List<MDBrowseGraphicPropertyType> graphicOverview;
    protected List<MDFormatPropertyType> resourceFormat;
    protected List<MDKeywordsPropertyType> descriptiveKeywords;
    protected List<MDUsagePropertyType> resourceSpecificUsage;
    protected List<MDConstraintsPropertyType> resourceConstraints;
    protected List<MDAggregateInformationPropertyType> aggregationInfo;

    /**
     * Gets the value of the citation property.
     * 
     * @return
     *     possible object is
     *     {@link CICitationPropertyType }
     *     
     */
    public CICitationPropertyType getCitation() {
        return citation;
    }

    /**
     * Sets the value of the citation property.
     * 
     * @param value
     *     allowed object is
     *     {@link CICitationPropertyType }
     *     
     */
    public void setCitation(CICitationPropertyType value) {
        this.citation = value;
    }

    /**
     * Gets the value of the abstract property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getAbstract() {
        return _abstract;
    }

    /**
     * Sets the value of the abstract property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setAbstract(CharacterStringPropertyType value) {
        this._abstract = value;
    }

    /**
     * Gets the value of the purpose property.
     * 
     * @return
     *     possible object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public CharacterStringPropertyType getPurpose() {
        return purpose;
    }

    /**
     * Sets the value of the purpose property.
     * 
     * @param value
     *     allowed object is
     *     {@link CharacterStringPropertyType }
     *     
     */
    public void setPurpose(CharacterStringPropertyType value) {
        this.purpose = value;
    }

    /**
     * Gets the value of the credit property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the credit property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getCredit().add(newItem);
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
     *     The value of the credit property.
     */
    public List<CharacterStringPropertyType> getCredit() {
        if (credit == null) {
            credit = new ArrayList<>();
        }
        return this.credit;
    }

    /**
     * Gets the value of the status property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the status property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getStatus().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDProgressCodePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the status property.
     */
    public List<MDProgressCodePropertyType> getStatus() {
        if (status == null) {
            status = new ArrayList<>();
        }
        return this.status;
    }

    /**
     * Gets the value of the pointOfContact property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the pointOfContact property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getPointOfContact().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CIResponsiblePartyPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the pointOfContact property.
     */
    public List<CIResponsiblePartyPropertyType> getPointOfContact() {
        if (pointOfContact == null) {
            pointOfContact = new ArrayList<>();
        }
        return this.pointOfContact;
    }

    /**
     * Gets the value of the resourceMaintenance property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the resourceMaintenance property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getResourceMaintenance().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDMaintenanceInformationPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the resourceMaintenance property.
     */
    public List<MDMaintenanceInformationPropertyType> getResourceMaintenance() {
        if (resourceMaintenance == null) {
            resourceMaintenance = new ArrayList<>();
        }
        return this.resourceMaintenance;
    }

    /**
     * Gets the value of the graphicOverview property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the graphicOverview property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getGraphicOverview().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDBrowseGraphicPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the graphicOverview property.
     */
    public List<MDBrowseGraphicPropertyType> getGraphicOverview() {
        if (graphicOverview == null) {
            graphicOverview = new ArrayList<>();
        }
        return this.graphicOverview;
    }

    /**
     * Gets the value of the resourceFormat property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the resourceFormat property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getResourceFormat().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDFormatPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the resourceFormat property.
     */
    public List<MDFormatPropertyType> getResourceFormat() {
        if (resourceFormat == null) {
            resourceFormat = new ArrayList<>();
        }
        return this.resourceFormat;
    }

    /**
     * Gets the value of the descriptiveKeywords property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the descriptiveKeywords property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getDescriptiveKeywords().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDKeywordsPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the descriptiveKeywords property.
     */
    public List<MDKeywordsPropertyType> getDescriptiveKeywords() {
        if (descriptiveKeywords == null) {
            descriptiveKeywords = new ArrayList<>();
        }
        return this.descriptiveKeywords;
    }

    /**
     * Gets the value of the resourceSpecificUsage property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the resourceSpecificUsage property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getResourceSpecificUsage().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDUsagePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the resourceSpecificUsage property.
     */
    public List<MDUsagePropertyType> getResourceSpecificUsage() {
        if (resourceSpecificUsage == null) {
            resourceSpecificUsage = new ArrayList<>();
        }
        return this.resourceSpecificUsage;
    }

    /**
     * Gets the value of the resourceConstraints property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the resourceConstraints property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getResourceConstraints().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDConstraintsPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the resourceConstraints property.
     */
    public List<MDConstraintsPropertyType> getResourceConstraints() {
        if (resourceConstraints == null) {
            resourceConstraints = new ArrayList<>();
        }
        return this.resourceConstraints;
    }

    /**
     * Gets the value of the aggregationInfo property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the aggregationInfo property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAggregationInfo().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MDAggregateInformationPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the aggregationInfo property.
     */
    public List<MDAggregateInformationPropertyType> getAggregationInfo() {
        if (aggregationInfo == null) {
            aggregationInfo = new ArrayList<>();
        }
        return this.aggregationInfo;
    }

}
