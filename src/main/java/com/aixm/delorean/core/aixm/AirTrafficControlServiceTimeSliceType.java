//
// This file was generated by the Eclipse Implementation of JAXB, v4.0.5 
// See https://eclipse-ee4j.github.io/jaxb-ri 
// Any modifications to this file will be lost upon recompilation of the source schema. 
//


package com.aixm.delorean.core.aixm;

import java.util.ArrayList;
import java.util.List;
import jakarta.xml.bind.JAXBElement;
import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlAttribute;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementRef;
import jakarta.xml.bind.annotation.XmlType;


/**
 * <p>Java class for AirTrafficControlServiceTimeSliceType complex type</p>.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.</p>
 * 
 * <pre>{@code
 * <complexType name="AirTrafficControlServiceTimeSliceType">
 *   <complexContent>
 *     <extension base="{http://www.aixm.aero/schema/5.1.1}AbstractAIXMTimeSliceType">
 *       <sequence>
 *         <group ref="{http://www.aixm.aero/schema/5.1.1}AirTrafficControlServicePropertyGroup"/>
 *         <element name="extension" maxOccurs="unbounded" minOccurs="0">
 *           <complexType>
 *             <complexContent>
 *               <restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 <choice>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractAirTrafficControlServiceExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractTrafficSeparationServiceExtension"/>
 *                   <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractServiceExtension"/>
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
@XmlType(name = "AirTrafficControlServiceTimeSliceType", propOrder = {
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
    "clientAirspace",
    "clientRoute",
    "clientProcedure",
    "clientHolding",
    "clientAerialRefuelling",
    "aircraftLocator",
    "extension"
})
public class AirTrafficControlServiceTimeSliceType
    extends AbstractAIXMTimeSliceType
{

    @XmlElementRef(name = "flightOperations", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeFlightDestinationType> flightOperations;
    @XmlElementRef(name = "rank", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeFacilityRankingType> rank;
    @XmlElementRef(name = "compliantICAO", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeYesNoType> compliantICAO;
    @XmlElementRef(name = "name", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<TextNameType> aixmName;
    @XmlElementRef(name = "location", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<ElevatedPointPropertyType> location;
    @XmlElementRef(name = "serviceProvider", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<UnitPropertyType> serviceProvider;
    @XmlElement(name = "call-sign", nillable = true)
    protected List<CallsignDetailPropertyType> callSign;
    @XmlElement(nillable = true)
    protected List<RadioCommunicationChannelPropertyType> radioCommunication;
    @XmlElement(nillable = true)
    protected List<ContactInformationPropertyType> groundCommunication;
    @XmlElement(nillable = true)
    protected List<ServiceOperationalStatusPropertyType> availability;
    @XmlElement(nillable = true)
    protected List<NotePropertyType> annotation;
    @XmlElementRef(name = "radarAssisted", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeYesNoType> radarAssisted;
    @XmlElementRef(name = "dataLinkEnabled", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeYesNoType> dataLinkEnabled;
    @XmlElementRef(name = "dataLinkChannel", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeCommunicationChannelType> dataLinkChannel;
    @XmlElementRef(name = "type", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<CodeServiceATCType> type;
    @XmlElement(nillable = true)
    protected List<AirportHeliportPropertyType> clientAirport;
    @XmlElement(nillable = true)
    protected List<AirspacePropertyType> clientAirspace;
    @XmlElement(nillable = true)
    protected List<RoutePortionPropertyType> clientRoute;
    @XmlElement(nillable = true)
    protected List<ProcedurePropertyType> clientProcedure;
    @XmlElement(nillable = true)
    protected List<HoldingPatternPropertyType> clientHolding;
    @XmlElement(nillable = true)
    protected List<AerialRefuellingPropertyType> clientAerialRefuelling;
    @XmlElementRef(name = "aircraftLocator", namespace = "http://www.aixm.aero/schema/5.1.1", type = JAXBElement.class, required = false)
    protected JAXBElement<DirectionFinderPropertyType> aircraftLocator;
    protected List<AirTrafficControlServiceTimeSliceType.Extension> extension;

    /**
     * Gets the value of the flightOperations property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link CodeFlightDestinationType }{@code >}
     *     
     */
    public JAXBElement<CodeFlightDestinationType> getFlightOperations() {
        return flightOperations;
    }

    /**
     * Sets the value of the flightOperations property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeFlightDestinationType }{@code >}
     *     
     */
    public void setFlightOperations(JAXBElement<CodeFlightDestinationType> value) {
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
     *     {@link JAXBElement }{@code <}{@link CodeFacilityRankingType }{@code >}
     *     
     */
    public JAXBElement<CodeFacilityRankingType> getRank() {
        return rank;
    }

    /**
     * Sets the value of the rank property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeFacilityRankingType }{@code >}
     *     
     */
    public void setRank(JAXBElement<CodeFacilityRankingType> value) {
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
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public JAXBElement<CodeYesNoType> getCompliantICAO() {
        return compliantICAO;
    }

    /**
     * Sets the value of the compliantICAO property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public void setCompliantICAO(JAXBElement<CodeYesNoType> value) {
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
     *     {@link JAXBElement }{@code <}{@link TextNameType }{@code >}
     *     
     */
    public JAXBElement<TextNameType> getAIXMName() {
        return aixmName;
    }

    /**
     * Sets the value of the aixmName property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link TextNameType }{@code >}
     *     
     */
    public void setAIXMName(JAXBElement<TextNameType> value) {
        this.aixmName = value;
    }

    public boolean isSetAIXMName() {
        return (this.aixmName!= null);
    }

    /**
     * Gets the value of the location property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link ElevatedPointPropertyType }{@code >}
     *     
     */
    public JAXBElement<ElevatedPointPropertyType> getLocation() {
        return location;
    }

    /**
     * Sets the value of the location property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link ElevatedPointPropertyType }{@code >}
     *     
     */
    public void setLocation(JAXBElement<ElevatedPointPropertyType> value) {
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
     *     {@link JAXBElement }{@code <}{@link UnitPropertyType }{@code >}
     *     
     */
    public JAXBElement<UnitPropertyType> getServiceProvider() {
        return serviceProvider;
    }

    /**
     * Sets the value of the serviceProvider property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link UnitPropertyType }{@code >}
     *     
     */
    public void setServiceProvider(JAXBElement<UnitPropertyType> value) {
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
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public JAXBElement<CodeYesNoType> getRadarAssisted() {
        return radarAssisted;
    }

    /**
     * Sets the value of the radarAssisted property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public void setRadarAssisted(JAXBElement<CodeYesNoType> value) {
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
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public JAXBElement<CodeYesNoType> getDataLinkEnabled() {
        return dataLinkEnabled;
    }

    /**
     * Sets the value of the dataLinkEnabled property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeYesNoType }{@code >}
     *     
     */
    public void setDataLinkEnabled(JAXBElement<CodeYesNoType> value) {
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
     *     {@link JAXBElement }{@code <}{@link CodeCommunicationChannelType }{@code >}
     *     
     */
    public JAXBElement<CodeCommunicationChannelType> getDataLinkChannel() {
        return dataLinkChannel;
    }

    /**
     * Sets the value of the dataLinkChannel property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeCommunicationChannelType }{@code >}
     *     
     */
    public void setDataLinkChannel(JAXBElement<CodeCommunicationChannelType> value) {
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
     *     {@link JAXBElement }{@code <}{@link CodeServiceATCType }{@code >}
     *     
     */
    public JAXBElement<CodeServiceATCType> getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link CodeServiceATCType }{@code >}
     *     
     */
    public void setType(JAXBElement<CodeServiceATCType> value) {
        this.type = value;
    }

    public boolean isSetType() {
        return (this.type!= null);
    }

    /**
     * Gets the value of the clientAirport property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the clientAirport property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getClientAirport().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link AirportHeliportPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the clientAirport property.
     */
    public List<AirportHeliportPropertyType> getClientAirport() {
        if (clientAirport == null) {
            clientAirport = new ArrayList<>();
        }
        return this.clientAirport;
    }

    public boolean isSetClientAirport() {
        return ((this.clientAirport!= null)&&(!this.clientAirport.isEmpty()));
    }

    public void unsetClientAirport() {
        this.clientAirport = null;
    }

    /**
     * Gets the value of the clientAirspace property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the clientAirspace property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getClientAirspace().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link AirspacePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the clientAirspace property.
     */
    public List<AirspacePropertyType> getClientAirspace() {
        if (clientAirspace == null) {
            clientAirspace = new ArrayList<>();
        }
        return this.clientAirspace;
    }

    public boolean isSetClientAirspace() {
        return ((this.clientAirspace!= null)&&(!this.clientAirspace.isEmpty()));
    }

    public void unsetClientAirspace() {
        this.clientAirspace = null;
    }

    /**
     * Gets the value of the clientRoute property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the clientRoute property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getClientRoute().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RoutePortionPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the clientRoute property.
     */
    public List<RoutePortionPropertyType> getClientRoute() {
        if (clientRoute == null) {
            clientRoute = new ArrayList<>();
        }
        return this.clientRoute;
    }

    public boolean isSetClientRoute() {
        return ((this.clientRoute!= null)&&(!this.clientRoute.isEmpty()));
    }

    public void unsetClientRoute() {
        this.clientRoute = null;
    }

    /**
     * Gets the value of the clientProcedure property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the clientProcedure property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getClientProcedure().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ProcedurePropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the clientProcedure property.
     */
    public List<ProcedurePropertyType> getClientProcedure() {
        if (clientProcedure == null) {
            clientProcedure = new ArrayList<>();
        }
        return this.clientProcedure;
    }

    public boolean isSetClientProcedure() {
        return ((this.clientProcedure!= null)&&(!this.clientProcedure.isEmpty()));
    }

    public void unsetClientProcedure() {
        this.clientProcedure = null;
    }

    /**
     * Gets the value of the clientHolding property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the clientHolding property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getClientHolding().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link HoldingPatternPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the clientHolding property.
     */
    public List<HoldingPatternPropertyType> getClientHolding() {
        if (clientHolding == null) {
            clientHolding = new ArrayList<>();
        }
        return this.clientHolding;
    }

    public boolean isSetClientHolding() {
        return ((this.clientHolding!= null)&&(!this.clientHolding.isEmpty()));
    }

    public void unsetClientHolding() {
        this.clientHolding = null;
    }

    /**
     * Gets the value of the clientAerialRefuelling property.
     * 
     * <p>This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the clientAerialRefuelling property.</p>
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * </p>
     * <pre>
     * getClientAerialRefuelling().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link AerialRefuellingPropertyType }
     * </p>
     * 
     * 
     * @return
     *     The value of the clientAerialRefuelling property.
     */
    public List<AerialRefuellingPropertyType> getClientAerialRefuelling() {
        if (clientAerialRefuelling == null) {
            clientAerialRefuelling = new ArrayList<>();
        }
        return this.clientAerialRefuelling;
    }

    public boolean isSetClientAerialRefuelling() {
        return ((this.clientAerialRefuelling!= null)&&(!this.clientAerialRefuelling.isEmpty()));
    }

    public void unsetClientAerialRefuelling() {
        this.clientAerialRefuelling = null;
    }

    /**
     * Gets the value of the aircraftLocator property.
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link DirectionFinderPropertyType }{@code >}
     *     
     */
    public JAXBElement<DirectionFinderPropertyType> getAircraftLocator() {
        return aircraftLocator;
    }

    /**
     * Sets the value of the aircraftLocator property.
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link DirectionFinderPropertyType }{@code >}
     *     
     */
    public void setAircraftLocator(JAXBElement<DirectionFinderPropertyType> value) {
        this.aircraftLocator = value;
    }

    public boolean isSetAircraftLocator() {
        return (this.aircraftLocator!= null);
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
     * {@link AirTrafficControlServiceTimeSliceType.Extension }
     * </p>
     * 
     * 
     * @return
     *     The value of the extension property.
     */
    public List<AirTrafficControlServiceTimeSliceType.Extension> getExtension() {
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
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractAirTrafficControlServiceExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractTrafficSeparationServiceExtension"/>
     *         <element ref="{http://www.aixm.aero/schema/5.1.1}AbstractServiceExtension"/>
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
        "abstractAirTrafficControlServiceExtension",
        "abstractTrafficSeparationServiceExtension",
        "abstractServiceExtension"
    })
    public static class Extension {

        @XmlElement(name = "AbstractAirTrafficControlServiceExtension")
        protected AbstractExtensionType abstractAirTrafficControlServiceExtension;
        @XmlElement(name = "AbstractTrafficSeparationServiceExtension")
        protected AbstractExtensionType abstractTrafficSeparationServiceExtension;
        @XmlElement(name = "AbstractServiceExtension")
        protected AbstractExtensionType abstractServiceExtension;
        @XmlAttribute(name = "owns")
        protected Boolean owns;

        /**
         * Gets the value of the abstractAirTrafficControlServiceExtension property.
         * 
         * @return
         *     possible object is
         *     {@link AbstractExtensionType }
         *     
         */
        public AbstractExtensionType getAbstractAirTrafficControlServiceExtension() {
            return abstractAirTrafficControlServiceExtension;
        }

        /**
         * Sets the value of the abstractAirTrafficControlServiceExtension property.
         * 
         * @param value
         *     allowed object is
         *     {@link AbstractExtensionType }
         *     
         */
        public void setAbstractAirTrafficControlServiceExtension(AbstractExtensionType value) {
            this.abstractAirTrafficControlServiceExtension = value;
        }

        public boolean isSetAbstractAirTrafficControlServiceExtension() {
            return (this.abstractAirTrafficControlServiceExtension!= null);
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