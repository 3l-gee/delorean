//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.schema.a5_1.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.AttributeOverrides;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for GroundTrafficControlServiceTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="GroundTrafficControlServiceTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1}GroundTrafficControlServicePropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractGroundTrafficControlServiceExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractTrafficSeparationServiceExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1}AbstractServiceExtension"/>
 *                 </choice>
 *                 <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
 *               </restriction>
 *             </complexContent>
 *           </complexType>
 *         </element>
 *       </sequence>
 *     </extension>
 *   </complexContent>
 * </complexType>
 * }</pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GroundTrafficControlServiceTimeSliceType", propOrder = {
    "flightOperations",
    "rank",
    "compliantICAO",
    "aixmName",
    "location",
    "serviceProvider",
    "callSign",
    "radioCommunication",
    "groundCommunication",
    "availability",
    "annotation",
    "radarAssisted",
    "dataLinkEnabled",
    "dataLinkChannel",
    "type",
    "clientAirport",
    "extension"
})
@Entity
@Table(name = "groundtrafficcontrolservice_ts", schema = "service")
public class GroundTrafficControlServiceTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "flightoperations_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "flightoperations_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeFlightDestinationType flightOperations;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "rank_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "rank_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeFacilityRankingType rank;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "complianticao_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "complianticao_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType compliantICAO;
    @XmlElement(name = "name", nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "name_value", length = 60, columnDefinition = "TEXT", nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "name_nilreason", length = 255, nullable = true, unique = false))
    })
    protected TextNameType aixmName;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    protected ElevatedPointPropertyType location;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "serviceprovider_id", referencedColumnName = "id")
    protected UnitPropertyType serviceProvider;
    @XmlElement(name = "call-sign", nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "groundtrafficcontrolservice_ts_call-sign", joinColumns = {
        @JoinColumn(name = "groundtrafficcontrolservice_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "callsigndetail_pt_id")
    })
    protected List<CallsignDetailPropertyType> callSign;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "groundtrafficcontrolservice_ts_radiocommunication", joinColumns = {
        @JoinColumn(name = "groundtrafficcontrolservice_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "radiocommunicationchannel_pt_id")
    })
    protected List<RadioCommunicationChannelPropertyType> radioCommunication;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "groundtrafficcontrolservice_ts_groundcommunication", joinColumns = {
        @JoinColumn(name = "groundtrafficcontrolservice_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "contactinformation_pt_id")
    })
    protected List<ContactInformationPropertyType> groundCommunication;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "groundtrafficcontrolservice_ts_availability", joinColumns = {
        @JoinColumn(name = "groundtrafficcontrolservice_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "serviceoperationalstatus_pt_id")
    })
    protected List<ServiceOperationalStatusPropertyType> availability;
    @XmlElement(nillable = true)
    @OneToMany(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinTable(name = "groundtrafficcontrolservice_ts_annotation", joinColumns = {
        @JoinColumn(name = "groundtrafficcontrolservice_ts_id")
    }, inverseJoinColumns = {
        @JoinColumn(name = "note_pt_id")
    })
    protected List<NotePropertyType> annotation;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "radarassisted_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "radarassisted_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType radarAssisted;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "datalinkenabled_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "datalinkenabled_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeYesNoType dataLinkEnabled;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "datalinkchannel_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "datalinkchannel_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeCommunicationChannelType dataLinkChannel;
    @XmlElement(nillable = true)
    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "value", column = @Column(name = "type_value", length = 255, nullable = true, unique = false)),
        @AttributeOverride(name = "nilReason", column = @Column(name = "type_nilreason", length = 255, nullable = true, unique = false))
    })
    protected CodeServiceGroundControlType type;
    @XmlElement(nillable = true)
    @OneToOne(cascade = {
        CascadeType.ALL
    }, fetch = FetchType.EAGER)
    @JoinColumn(name = "clientairport_id", referencedColumnName = "id")
    protected AirportHeliportPropertyType clientAirport;
    @Transient
    protected List<GroundTrafficControlServiceTimeSliceType.Extension> extension;

    /**
     * Gets the value of the flightOperations property.
     * 
     * @return
     *     possible object is
     *     {@link CodeFlightDestinationType }
     *     
     */
    public CodeFlightDestinationType getFlightOperations() {
        return flightOperations;
    }

    /**
     * Sets the value of the flightOperations property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeFlightDestinationType }
     *     
     */
    public void setFlightOperations(CodeFlightDestinationType value) {
        this.flightOperations = value;
    }

    public boolean isSetFlightOperations() {
        return (this.flightOperations!= null);
    }

    /**
     * Gets the value of the rank property.
     * 
     * @return
     *     possible object is
     *     {@link CodeFacilityRankingType }
     *     
     */
    public CodeFacilityRankingType getRank() {
        return rank;
    }

    /**
     * Sets the value of the rank property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeFacilityRankingType }
     *     
     */
    public void setRank(CodeFacilityRankingType value) {
        this.rank = value;
    }

    public boolean isSetRank() {
        return (this.rank!= null);
    }

    /**
     * Gets the value of the compliantICAO property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getCompliantICAO() {
        return compliantICAO;
    }

    /**
     * Sets the value of the compliantICAO property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setCompliantICAO(CodeYesNoType value) {
        this.compliantICAO = value;
    }

    public boolean isSetCompliantICAO() {
        return (this.compliantICAO!= null);
    }

    /**
     * Gets the value of the aixmName property.
     * 
     * @return
     *     possible object is
     *     {@link TextNameType }
     *     
     */
    public TextNameType getAixmName() {
        return aixmName;
    }

    /**
     * Sets the value of the aixmName property.
     * 
     * @param value
     *     allowed object is
     *     {@link TextNameType }
     *     
     */
    public void setAixmName(TextNameType value) {
        this.aixmName = value;
    }

    public boolean isSetAixmName() {
        return (this.aixmName!= null);
    }

    /**
     * Gets the value of the location property.
     * 
     * @return
     *     possible object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public ElevatedPointPropertyType getLocation() {
        return location;
    }

    /**
     * Sets the value of the location property.
     * 
     * @param value
     *     allowed object is
     *     {@link ElevatedPointPropertyType }
     *     
     */
    public void setLocation(ElevatedPointPropertyType value) {
        this.location = value;
    }

    public boolean isSetLocation() {
        return (this.location!= null);
    }

    /**
     * Gets the value of the serviceProvider property.
     * 
     * @return
     *     possible object is
     *     {@link UnitPropertyType }
     *     
     */
    public UnitPropertyType getServiceProvider() {
        return serviceProvider;
    }

    /**
     * Sets the value of the serviceProvider property.
     * 
     * @param value
     *     allowed object is
     *     {@link UnitPropertyType }
     *     
     */
    public void setServiceProvider(UnitPropertyType value) {
        this.serviceProvider = value;
    }

    public boolean isSetServiceProvider() {
        return (this.serviceProvider!= null);
    }

    /**
     * Gets the value of the callSign property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the callSign property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getCallSign().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CallsignDetailPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the callSign property.
     */
    public List<CallsignDetailPropertyType> getCallSign() {
        if (callSign == null) {
            callSign = new ArrayList<>();
        }
        return this.callSign;
    }

    public boolean isSetCallSign() {
        return ((this.callSign!= null)&&(!this.callSign.isEmpty()));
    }

    public void unsetCallSign() {
        this.callSign = null;
    }

    /**
     * Gets the value of the radioCommunication property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the radioCommunication property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getRadioCommunication().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RadioCommunicationChannelPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the radioCommunication property.
     */
    public List<RadioCommunicationChannelPropertyType> getRadioCommunication() {
        if (radioCommunication == null) {
            radioCommunication = new ArrayList<>();
        }
        return this.radioCommunication;
    }

    public boolean isSetRadioCommunication() {
        return ((this.radioCommunication!= null)&&(!this.radioCommunication.isEmpty()));
    }

    public void unsetRadioCommunication() {
        this.radioCommunication = null;
    }

    /**
     * Gets the value of the groundCommunication property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the groundCommunication property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getGroundCommunication().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ContactInformationPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the groundCommunication property.
     */
    public List<ContactInformationPropertyType> getGroundCommunication() {
        if (groundCommunication == null) {
            groundCommunication = new ArrayList<>();
        }
        return this.groundCommunication;
    }

    public boolean isSetGroundCommunication() {
        return ((this.groundCommunication!= null)&&(!this.groundCommunication.isEmpty()));
    }

    public void unsetGroundCommunication() {
        this.groundCommunication = null;
    }

    /**
     * Gets the value of the availability property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the availability property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAvailability().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ServiceOperationalStatusPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the availability property.
     */
    public List<ServiceOperationalStatusPropertyType> getAvailability() {
        if (availability == null) {
            availability = new ArrayList<>();
        }
        return this.availability;
    }

    public boolean isSetAvailability() {
        return ((this.availability!= null)&&(!this.availability.isEmpty()));
    }

    public void unsetAvailability() {
        this.availability = null;
    }

    /**
     * Gets the value of the annotation property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the annotation property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getAnnotation().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link NotePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the annotation property.
     */
    public List<NotePropertyType> getAnnotation() {
        if (annotation == null) {
            annotation = new ArrayList<>();
        }
        return this.annotation;
    }

    public boolean isSetAnnotation() {
        return ((this.annotation!= null)&&(!this.annotation.isEmpty()));
    }

    public void unsetAnnotation() {
        this.annotation = null;
    }

    /**
     * Gets the value of the radarAssisted property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getRadarAssisted() {
        return radarAssisted;
    }

    /**
     * Sets the value of the radarAssisted property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setRadarAssisted(CodeYesNoType value) {
        this.radarAssisted = value;
    }

    public boolean isSetRadarAssisted() {
        return (this.radarAssisted!= null);
    }

    /**
     * Gets the value of the dataLinkEnabled property.
     * 
     * @return
     *     possible object is
     *     {@link CodeYesNoType }
     *     
     */
    public CodeYesNoType getDataLinkEnabled() {
        return dataLinkEnabled;
    }

    /**
     * Sets the value of the dataLinkEnabled property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeYesNoType }
     *     
     */
    public void setDataLinkEnabled(CodeYesNoType value) {
        this.dataLinkEnabled = value;
    }

    public boolean isSetDataLinkEnabled() {
        return (this.dataLinkEnabled!= null);
    }

    /**
     * Gets the value of the dataLinkChannel property.
     * 
     * @return
     *     possible object is
     *     {@link CodeCommunicationChannelType }
     *     
     */
    public CodeCommunicationChannelType getDataLinkChannel() {
        return dataLinkChannel;
    }

    /**
     * Sets the value of the dataLinkChannel property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeCommunicationChannelType }
     *     
     */
    public void setDataLinkChannel(CodeCommunicationChannelType value) {
        this.dataLinkChannel = value;
    }

    public boolean isSetDataLinkChannel() {
        return (this.dataLinkChannel!= null);
    }

    /**
     * Gets the value of the type property.
     * 
     * @return
     *     possible object is
     *     {@link CodeServiceGroundControlType }
     *     
     */
    public CodeServiceGroundControlType getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link CodeServiceGroundControlType }
     *     
     */
    public void setType(CodeServiceGroundControlType value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the clientAirport property.
     * 
     * @return
     *     possible object is
     *     {@link AirportHeliportPropertyType }
     *     
     */
    public AirportHeliportPropertyType getClientAirport() {
        return clientAirport;
    }

    /**
     * Sets the value of the clientAirport property.
     * 
     * @param value
     *     allowed object is
     *     {@link AirportHeliportPropertyType }
     *     
     */
    public void setClientAirport(AirportHeliportPropertyType value) {
        this.clientAirport = value;
    }

    public boolean isSetClientAirport() {
        return (this.clientAirport!= null);
    }

    /**
     * Gets the value of the extension property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the extension property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getExtension().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link GroundTrafficControlServiceTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<GroundTrafficControlServiceTimeSliceType.Extension> getExtension() {
        if (extension == null) {
            extension = new ArrayList<>();
        }
        return this.extension;
    }

    public boolean isSetExtension() {
        return ((this.extension!= null)&&(!this.extension.isEmpty()));
    }

    public void unsetExtension() {
        this.extension = null;
    }


    /**
     * <p>Java class for anonymous complex type</p>.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.</p>
     * 
     * <pre>{@code
     * <complexType>
     *   <complexContent>
     *     <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       <choice>
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractGroundTrafficControlServiceExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractTrafficSeparationServiceExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1}AbstractServiceExtension"/>
     *       </choice>
     *       <attGroup ref="{http://www.opengis.net/gml/3.2}OwnershipAttributeGroup"/>
     *     </restriction>
     *   </complexContent>
     * </complexType>
     * }</pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "abstractGroundTrafficControlServiceExtension",
        "abstractTrafficSeparationServiceExtension",
        "abstractServiceExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractGroundTrafficControlServiceExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractgroundtrafficcontrolserviceextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractGroundTrafficControlServiceExtension;
        @XmlElement(name = "AbstractTrafficSeparationServiceExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstracttrafficseparationserviceextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractTrafficSeparationServiceExtension;
        @XmlElement(name = "AbstractServiceExtension")
        @OneToOne(cascade = {
            CascadeType.ALL
        }, fetch = FetchType.EAGER)
        @JoinColumn(name = "abstractserviceextension_id", referencedColumnName = "id")
        protected AbstractExtensionType abstractServiceExtension;
        @XmlAttribute(name = "owns")
        @Transient
        protected Boolean owns;

        /**
         * Gets the value of the abstractGroundTrafficControlServiceExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractGroundTrafficControlServiceExtension() {
            return abstractGroundTrafficControlServiceExtension;
        }

        /**
         * Sets the value of the abstractGroundTrafficControlServiceExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractGroundTrafficControlServiceExtension(AbstractExtensionType value) {
            this.abstractGroundTrafficControlServiceExtension = value;
        }

        public boolean isSetAbstractGroundTrafficControlServiceExtension() {
            return (this.abstractGroundTrafficControlServiceExtension!= null);
        }

        /**
         * Gets the value of the abstractTrafficSeparationServiceExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractTrafficSeparationServiceExtension() {
            return abstractTrafficSeparationServiceExtension;
        }

        /**
         * Sets the value of the abstractTrafficSeparationServiceExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractTrafficSeparationServiceExtension(AbstractExtensionType value) {
            this.abstractTrafficSeparationServiceExtension = value;
        }

        public boolean isSetAbstractTrafficSeparationServiceExtension() {
            return (this.abstractTrafficSeparationServiceExtension!= null);
        }

        /**
         * Gets the value of the abstractServiceExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractServiceExtension() {
            return abstractServiceExtension;
        }

        /**
         * Sets the value of the abstractServiceExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractServiceExtension(AbstractExtensionType value) {
            this.abstractServiceExtension = value;
        }

        public boolean isSetAbstractServiceExtension() {
            return (this.abstractServiceExtension!= null);
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

}
