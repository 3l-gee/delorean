//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.org.gco;

import com.aixm.delorean.core.org.gmd.AbstractDQElementType;
import com.aixm.delorean.core.org.gmd.AbstractDQResultType;
import com.aixm.delorean.core.org.gmd.AbstractDSAggregateType;
import com.aixm.delorean.core.org.gmd.AbstractEXGeographicExtentType;
import com.aixm.delorean.core.org.gmd.AbstractMDContentInformationType;
import com.aixm.delorean.core.org.gmd.AbstractMDIdentificationType;
import com.aixm.delorean.core.org.gmd.AbstractMDSpatialRepresentationType;
import com.aixm.delorean.core.org.gmd.AbstractRSReferenceSystemType;
import com.aixm.delorean.core.org.gmd.CIAddressType;
import com.aixm.delorean.core.org.gmd.CICitationType;
import com.aixm.delorean.core.org.gmd.CIContactType;
import com.aixm.delorean.core.org.gmd.CIDateType;
import com.aixm.delorean.core.org.gmd.CIOnlineResourceType;
import com.aixm.delorean.core.org.gmd.CIResponsiblePartyType;
import com.aixm.delorean.core.org.gmd.CISeriesType;
import com.aixm.delorean.core.org.gmd.CITelephoneType;
import com.aixm.delorean.core.org.gmd.DQDataQualityType;
import com.aixm.delorean.core.org.gmd.DQScopeType;
import com.aixm.delorean.core.org.gmd.DSAssociationType;
import com.aixm.delorean.core.org.gmd.DSDataSetType;
import com.aixm.delorean.core.org.gmd.EXExtentType;
import com.aixm.delorean.core.org.gmd.EXTemporalExtentType;
import com.aixm.delorean.core.org.gmd.EXVerticalExtentType;
import com.aixm.delorean.core.org.gmd.LILineageType;
import com.aixm.delorean.core.org.gmd.LIProcessStepType;
import com.aixm.delorean.core.org.gmd.LISourceType;
import com.aixm.delorean.core.org.gmd.MDAggregateInformationType;
import com.aixm.delorean.core.org.gmd.MDApplicationSchemaInformationType;
import com.aixm.delorean.core.org.gmd.MDBrowseGraphicType;
import com.aixm.delorean.core.org.gmd.MDConstraintsType;
import com.aixm.delorean.core.org.gmd.MDDigitalTransferOptionsType;
import com.aixm.delorean.core.org.gmd.MDDimensionType;
import com.aixm.delorean.core.org.gmd.MDDistributionType;
import com.aixm.delorean.core.org.gmd.MDDistributorType;
import com.aixm.delorean.core.org.gmd.MDExtendedElementInformationType;
import com.aixm.delorean.core.org.gmd.MDFormatType;
import com.aixm.delorean.core.org.gmd.MDGeometricObjectsType;
import com.aixm.delorean.core.org.gmd.MDIdentifierType;
import com.aixm.delorean.core.org.gmd.MDKeywordsType;
import com.aixm.delorean.core.org.gmd.MDMaintenanceInformationType;
import com.aixm.delorean.core.org.gmd.MDMediumType;
import com.aixm.delorean.core.org.gmd.MDMetadataExtensionInformationType;
import com.aixm.delorean.core.org.gmd.MDMetadataType;
import com.aixm.delorean.core.org.gmd.MDPortrayalCatalogueReferenceType;
import com.aixm.delorean.core.org.gmd.MDRangeDimensionType;
import com.aixm.delorean.core.org.gmd.MDReferenceSystemType;
import com.aixm.delorean.core.org.gmd.MDRepresentativeFractionType;
import com.aixm.delorean.core.org.gmd.MDStandardOrderProcessType;
import com.aixm.delorean.core.org.gmd.MDUsageType;
import com.aixm.delorean.core.org.gmd.PTFreeTextType;
import com.aixm.delorean.core.org.gmd.PTLocaleType;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlID;
import jakarta.xml.bind.annotation.XmlSchemaType;
import jakarta.xml.bind.annotation.XmlSeeAlso;
import jakarta.xml.bind.annotation.XmlType;
import jakarta.xml.bind.annotation.adapters.CollapsedStringAdapter;
import jakarta.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * <p>Java class for AbstractObject_Type complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AbstractObject_Type">
 *   <complexContent>
 *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       <sequence>
 *       </sequence>
 *       <attGroup ref="{http://www.isotc211.org/2005/gco}ObjectIdentification"/>
 *     </restriction>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AbstractObject_Type")
@XmlSeeAlso({
    EXVerticalExtentType.class,
    EXExtentType.class,
    EXTemporalExtentType.class,
    AbstractEXGeographicExtentType.class,
    MDIdentifierType.class,
    MDReferenceSystemType.class,
    AbstractRSReferenceSystemType.class,
    CIResponsiblePartyType.class,
    CICitationType.class,
    CIAddressType.class,
    CIOnlineResourceType.class,
    CIContactType.class,
    CITelephoneType.class,
    CIDateType.class,
    CISeriesType.class,
    MDDimensionType.class,
    AbstractMDSpatialRepresentationType.class,
    MDGeometricObjectsType.class,
    MDExtendedElementInformationType.class,
    MDMetadataExtensionInformationType.class,
    AbstractMDContentInformationType.class,
    MDRangeDimensionType.class,
    MDApplicationSchemaInformationType.class,
    MDPortrayalCatalogueReferenceType.class,
    MDConstraintsType.class,
    MDMediumType.class,
    MDDigitalTransferOptionsType.class,
    MDStandardOrderProcessType.class,
    MDDistributorType.class,
    MDDistributionType.class,
    MDFormatType.class,
    MDMaintenanceInformationType.class,
    MDBrowseGraphicType.class,
    AbstractMDIdentificationType.class,
    MDRepresentativeFractionType.class,
    MDUsageType.class,
    MDKeywordsType.class,
    DSAssociationType.class,
    MDAggregateInformationType.class,
    LIProcessStepType.class,
    LISourceType.class,
    LILineageType.class,
    AbstractDQResultType.class,
    AbstractDQElementType.class,
    DQDataQualityType.class,
    DQScopeType.class,
    PTFreeTextType.class,
    PTLocaleType.class,
    MDMetadataType.class,
    DSDataSetType.class,
    AbstractDSAggregateType.class,
    TypeNameType.class,
    MemberNameType.class,
    MultiplicityType.class,
    MultiplicityRangeType.class
})
public abstract class AbstractObjectType {

    @XmlAttribute(name = "id")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    @XmlSchemaType(name = "ID")
    protected String id;
    @XmlAttribute(name = "uuid")
    protected String uuid;

    /**
     * Gets the value of the id property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setId(String value) {
        this.id = value;
    }

    public boolean isSetId() {
        return (this.id!= null);
    }

    /**
     * Gets the value of the uuid property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUuid() {
        return uuid;
    }

    /**
     * Sets the value of the uuid property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUuid(String value) {
        this.uuid = value;
    }

    public boolean isSetUuid() {
        return (this.uuid!= null);
    }

}