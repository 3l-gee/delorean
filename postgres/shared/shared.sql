CREATE OR REPLACE VIEW shared.timesheet_view AS
SELECT
shared.timesheet_pt.id,
    jsonb_build_object(
	  'xml_id', shared.timesheet.xml_id,
       'timereference_value', shared.timesheet.timereference_value,
       'timereference_nilreason', shared.timesheet.timereference_nilreason,
       'startdate_value', shared.timesheet.startdate_value,
       'startdate_nilreason', shared.timesheet.startdate_nilreason,
       'enddate_value', shared.timesheet.enddate_value,
       'enddate_nilreason', shared.timesheet.enddate_nilreason,
       'day_value', shared.timesheet.day_value,
       'day_nilreason', shared.timesheet.day_nilreason,
       'daytil_value', shared.timesheet.daytil_value,
       'daytil_nilreason', shared.timesheet.daytil_nilreason,
       'starttime_value', shared.timesheet.starttime_value,
       'starttime_nilreason', shared.timesheet.starttime_nilreason,
       'startevent_value', shared.timesheet.startevent_value,
       'startevent_nilreason', shared.timesheet.startevent_nilreason,
       'starteventinterpretation_value', shared.timesheet.starteventinterpretation_value,
       'starteventinterpretation_nilreason', shared.timesheet.starteventinterpretation_nilreason,
       'endtime_value', shared.timesheet.endtime_value,
       'endtime_nilreason', shared.timesheet.endtime_nilreason,
       'endevent_value', shared.timesheet.endevent_value,
       'endevent_nilreason', shared.timesheet.endevent_nilreason,
       'endeventinterpretation_value', shared.timesheet.endeventinterpretation_value,
       'endeventinterpretation_nilreason', shared.timesheet.endeventinterpretation_nilreason,
       'daylightsavingadjust_value', shared.timesheet.daylightsavingadjust_value,
       'daylightsavingadjust_nilreason', shared.timesheet.daylightsavingadjust_nilreason,
       'excluded_value', shared.timesheet.excluded_value,
       'excluded_nilreason', shared.timesheet.excluded_nilreason,
       'starttimerelativeevent_value', shared.timesheet.starttimerelativeevent_value,
       'starttimerelativeevent_uom', shared.timesheet.starttimerelativeevent_uom,
       'starttimerelativeevent_nilreason', shared.timesheet.starttimerelativeevent_nilreason,
       'endtimerelativeevent_value', shared.timesheet.endtimerelativeevent_value,
       'endtimerelativeevent_uom', shared.timesheet.endtimerelativeevent_uom,
       'endtimerelativeevent_nilreason', shared.timesheet.endtimerelativeevent_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
    ) AS timesheet
FROM shared.timesheet_pt
INNER JOIN shared.timesheet
ON shared.timesheet_pt.timesheet_id = shared.timesheet.id
LEFT JOIN timesheet_annotation
ON shared.timesheet.id = timesheet_annotation.timesheet_id
LEFT JOIN notes.note_view
ON timesheet_annotation.note_pt_id = notes.note_view.id
GROUP BY
    shared.timesheet_pt.id,
    shared.timesheet.xml_id,
    shared.timesheet.timereference_value,
    shared.timesheet.timereference_nilreason,
    shared.timesheet.startdate_value,
    shared.timesheet.startdate_nilreason,
    shared.timesheet.enddate_value,
    shared.timesheet.enddate_nilreason,
    shared.timesheet.day_value,
    shared.timesheet.day_nilreason,
    shared.timesheet.daytil_value,
    shared.timesheet.daytil_nilreason,
    shared.timesheet.starttime_value,
    shared.timesheet.starttime_nilreason,
    shared.timesheet.startevent_value,
    shared.timesheet.startevent_nilreason,
    shared.timesheet.starteventinterpretation_value,
    shared.timesheet.starteventinterpretation_nilreason,
    shared.timesheet.endtime_value,
    shared.timesheet.endtime_nilreason,
    shared.timesheet.endevent_value,
    shared.timesheet.endevent_nilreason,
    shared.timesheet.endeventinterpretation_value,
    shared.timesheet.endeventinterpretation_nilreason,
    shared.timesheet.daylightsavingadjust_value,
    shared.timesheet.daylightsavingadjust_nilreason,
    shared.timesheet.excluded_value,
    shared.timesheet.excluded_nilreason,
    shared.timesheet.starttimerelativeevent_value,
    shared.timesheet.starttimerelativeevent_uom,
    shared.timesheet.starttimerelativeevent_nilreason,
    shared.timesheet.endtimerelativeevent_value,
    shared.timesheet.endtimerelativeevent_uom,
    shared.timesheet.endtimerelativeevent_nilreason;

CREATE OR REPLACE VIEW shared.postaladdress_view AS
SELECT
shared.postaladdress_pt.id,
    jsonb_build_object(
	   'xml_id', shared.postaladdress.xml_id,
       'deliverypoint_value', shared.postaladdress.deliverypoint_value,
       'deliverypoint_nilreason', shared.postaladdress.deliverypoint_nilreason,
       'city_value', shared.postaladdress.city_value,
       'city_nilreason', shared.postaladdress.city_nilreason,
       'administrativearea_value', shared.postaladdress.administrativearea_value,
       'administrativearea_nilreason', shared.postaladdress.administrativearea_nilreason,
       'postalcode_value', shared.postaladdress.postalcode_value,
       'postalcode_nilreason', shared.postaladdress.postalcode_nilreason,
       'country_value', shared.postaladdress.country_value,
       'country_nilreason', shared.postaladdress.country_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb), 
		'timesheet', COALESCE(jsonb_agg(shared.timesheet_view.timesheet), '[]'::jsonb)
    ) AS postaladdress
FROM shared.postaladdress_pt
INNER JOIN shared.postaladdress
ON shared.postaladdress_pt.postaladdress_id = shared.postaladdress.id
LEFT JOIN postaladdress_timeinterval
ON shared.postaladdress.id = postaladdress_timeinterval.postaladdress_id
LEFT JOIN shared.timesheet_view
ON postaladdress_timeinterval.timesheet_pt_id = shared.timesheet_view.id
LEFT JOIN postaladdress_annotation
ON shared.postaladdress_pt.id = postaladdress_annotation.postaladdress_id
LEFT JOIN notes.note_view
ON postaladdress_annotation.note_pt_id = notes.note_view.id
-- LEFT JOIN postaladdress_specialdateauthority
-- ON postaladdress_id / organisationauthority_pt_id
GROUP BY
    shared.postaladdress_pt.id,
    shared.postaladdress.xml_id,
    shared.postaladdress.deliverypoint_value,
    shared.postaladdress.deliverypoint_nilreason,
    shared.postaladdress.city_value,
    shared.postaladdress.city_nilreason,
    shared.postaladdress.administrativearea_value,
    shared.postaladdress.administrativearea_nilreason,
    shared.postaladdress.postalcode_value,
    shared.postaladdress.postalcode_nilreason,
    shared.postaladdress.country_value,
    shared.postaladdress.country_nilreason;

CREATE OR REPLACE VIEW shared.contactinformation_view AS
SELECT
shared.contactinformation_pt.id,
    jsonb_build_object(
	   'xml_id', shared.contactinformation.xml_id,
       'name_value', shared.contactinformation.name_value,
       'name_nilreason', shared.contactinformation.name_nilreason,
       'title_value', shared.contactinformation.title_value,
       'title_nilreason', shared.contactinformation.title_nilreason,
		'postaladdress',  COALESCE(jsonb_agg(shared.postaladdress_view.postaladdress), '[]'::jsonb),
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
    ) AS contactinformation
FROM shared.contactinformation_pt
INNER JOIN shared.contactinformation
	ON shared.contactinformation_pt.contactinformation_id = shared.contactinformation.id
LEFT JOIN contactinformation_address
ON shared.contactinformation.id = contactinformation_address.contactinformation_id
LEFT JOIN shared.postaladdress_view
ON contactinformation_address.postaladdress_pt_id = shared.postaladdress_view.id
LEFT JOIN contactinformation_annotation
ON shared.contactinformation.id = contactinformation_annotation.contactinformation_id
LEFT JOIN notes.note_view
ON contactinformation_annotation.note_pt_id = notes.note_view.id 
GROUP BY
    shared.contactinformation_pt.id,
    shared.contactinformation.xml_id,
    shared.contactinformation.name_value,
    shared.contactinformation.name_nilreason,
    shared.contactinformation.title_value,
    shared.contactinformation.title_nilreason;

CREATE OR REPLACE VIEW shared.onlinecontact_view AS
SELECT 
shared.onlinecontact_pt.id,
    jsonb_build_object(
	   'xml_id', shared.onlinecontact.xml_id,
       'network_value', shared.onlinecontact.network_value,
       'network_nilreason', shared.onlinecontact.network_nilreason,
       'linkage_value', shared.onlinecontact.linkage_value,
       'linkage_nilreason', shared.onlinecontact.linkage_nilreason,
       'protocol_value', shared.onlinecontact.protocol_value,
       'protocol_nilreason', shared.onlinecontact.protocol_nilreason,
       'email_value', shared.onlinecontact.email_value,
       'email_nilreason', shared.onlinecontact.email_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb), 
		'timesheet', COALESCE(jsonb_agg(shared.timesheet_view.timesheet), '[]'::jsonb)
    ) AS onlinecontact
FROM
shared.onlinecontact_pt
INNER JOIN shared.onlinecontact
ON shared.onlinecontact_pt.onlinecontact_id = shared.onlinecontact.id
LEFT JOIN onlinecontact_timeinterval
ON shared.onlinecontact.id = onlinecontact_timeinterval.onlinecontact_id
LEFT JOIN shared.timesheet_view
ON onlinecontact_timeinterval.timesheet_pt_id = shared.timesheet_view.id
LEFT JOIN onlinecontact_annotation
ON shared.onlinecontact.id = onlinecontact_annotation.onlinecontact_id
LEFT JOIN notes.note_view
ON onlinecontact_annotation.note_pt_id = notes.note_view.id
-- LEFT JOIN onlinecontact_specialdateauthority
-- ON onlinecontact_id / organisationauthority_pt_id
GROUP BY
    shared.onlinecontact_pt.id,
    shared.onlinecontact.xml_id,
    shared.onlinecontact.network_value,
    shared.onlinecontact.network_nilreason,
    shared.onlinecontact.linkage_value,
    shared.onlinecontact.linkage_nilreason,
    shared.onlinecontact.protocol_value,
    shared.onlinecontact.protocol_nilreason,
    shared.onlinecontact.email_value,
    shared.onlinecontact.email_nilreason;

CREATE OR REPLACE VIEW shared.telephonecontact_view AS
SELECT
'id', shared.telephonecontact_pt.id,
    jsonb_build_object(
		'xml_id', shared.telephonecontact.xml_id,
       'voice_value', shared.telephonecontact.voice_value,
       'voice_nilreason', shared.telephonecontact.voice_nilreason,
       'facsimile_value', shared.telephonecontact.facsimile_value,
       'facsimile_nilreason', shared.telephonecontact.facsimile_nilreason,
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb), 
		'timesheet', COALESCE(jsonb_agg(shared.timesheet_view.timesheet), '[]'::jsonb)
    ) AS telephonecontact
FROM
shared.telephonecontact_pt
INNER JOIN shared.telephonecontact
ON shared.telephonecontact_pt.telephonecontact_id = shared.telephonecontact.id
LEFT JOIN telephonecontact_timeinterval
ON shared.telephonecontact.id = telephonecontact_timeinterval.telephonecontact_id
LEFT JOIN shared.timesheet_view
ON telephonecontact_timeinterval.timesheet_pt_id = shared.timesheet_view.id
LEFT JOIN telephonecontact_annotation
ON shared.telephonecontact.id = telephonecontact_annotation.telephonecontact_id
LEFT JOIN notes.note_view
ON telephonecontact_annotation.note_pt_id = notes.note_view.id
-- LEFT JOIN telephonecontact_specialdateauthority
-- ON telephonecontact_id / organisationauthority_pt_id
GROUP BY
    shared.telephonecontact_pt.id,
    shared.telephonecontact.xml_id,
    shared.telephonecontact.voice_value,
    shared.telephonecontact.voice_nilreason,
    shared.telephonecontact.facsimile_value,
    shared.telephonecontact.facsimile_nilreason;


CREATE OR REPLACE VIEW shared.contactinformation_view AS
SELECT
shared.contactinformation_pt.id,
    jsonb_build_object(
	   'xml_id', shared.contactinformation.xml_id,
       'name_value', shared.contactinformation.name_value,
       'name_nilreason', shared.contactinformation.name_nilreason,
       'title_value', shared.contactinformation.title_value,
       'title_nilreason', shared.contactinformation.title_nilreason,
		'postaladdress',  COALESCE(jsonb_agg(shared.postaladdress_view.postaladdress), '[]'::jsonb),
		'note', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb),
		'onlinecontact', COALESCE(jsonb_agg(shared.onlinecontact_view.onlinecontact), '[]'::jsonb),
		'telephonecontact', COALESCE(jsonb_agg(shared.telephonecontact_view.telephonecontact), '[]'::jsonb)
    ) AS contactinformation
FROM shared.contactinformation_pt
INNER JOIN shared.contactinformation
	ON shared.contactinformation_pt.contactinformation_id = shared.contactinformation.id
LEFT JOIN contactinformation_address
ON shared.contactinformation.id = contactinformation_address.contactinformation_id
LEFT JOIN shared.postaladdress_view
ON contactinformation_address.postaladdress_pt_id = shared.postaladdress_view.id
LEFT JOIN contactinformation_annotation
ON shared.contactinformation.id = contactinformation_annotation.contactinformation_id
LEFT JOIN notes.note_view
ON contactinformation_annotation.note_pt_id = notes.note_view.id
LEFT JOIN contactinformation_networknode
ON shared.contactinformation.id = contactinformation_networknode.contactinformation_id
LEFT JOIN shared.onlinecontact_view
ON contactinformation_networknode.onlinecontact_pt_id = shared.onlinecontact_view.id
LEFT JOIN contactinformation_phonefax
ON shared.contactinformation.id = contactinformation_phonefax.contactinformation_id
LEFT JOIN shared.telephonecontact_view
ON contactinformation_phonefax.telephonecontact_pt_id = shared.telephonecontact_view.id
GROUP BY
    shared.contactinformation_pt.id,
    shared.contactinformation.xml_id,
    shared.contactinformation.name_value,
    shared.contactinformation.name_nilreason,
    shared.contactinformation.title_value,
    shared.contactinformation.title_nilreason;




    