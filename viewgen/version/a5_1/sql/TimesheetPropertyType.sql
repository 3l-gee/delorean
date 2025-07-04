-- Snowflake SQL : TimesheetPropertyType 

CREATE MATERIALIZED VIEW shared.timesheet_view AS
SELECT
shared.timesheet_pt.id,
jsonb_build_object(
	'timereference', COALESCE(shared.timesheet.timereference_value, '(' || shared.timesheet.timereference_nilreason || ')'),
	'startdate', COALESCE(shared.timesheet.startdate_value, '(' || shared.timesheet.startdate_nilreason || ')'),
	'enddate', COALESCE(shared.timesheet.enddate_value, '(' || shared.timesheet.enddate_nilreason || ')'),
	'day', COALESCE(shared.timesheet.day_value, '(' || shared.timesheet.day_nilreason || ')'),
	'daytil', COALESCE(shared.timesheet.daytil_value, '(' || shared.timesheet.daytil_nilreason || ')'),
	'starttime', COALESCE(shared.timesheet.starttime_value, '(' || shared.timesheet.starttime_nilreason || ')'),
	'startevent', COALESCE(shared.timesheet.startevent_value, '(' || shared.timesheet.startevent_nilreason || ')'),
	'starteventinterpretation', COALESCE(shared.timesheet.starteventinterpretation_value, '(' || shared.timesheet.starteventinterpretation_nilreason || ')'),
	'starttimerelativeevent', COALESCE(shared.timesheet.starttimerelativeevent_value || ' ' || shared.timesheet.starttimerelativeevent_uom, '(' || shared.timesheet.starttimerelativeevent_nilreason || ')'),
	'endtime', COALESCE(shared.timesheet.endtime_value, '(' || shared.timesheet.endtime_nilreason || ')'),
	'endevent', COALESCE(shared.timesheet.endevent_value, '(' || shared.timesheet.endevent_nilreason || ')'),
	'endeventinterpretation', COALESCE(shared.timesheet.endeventinterpretation_value, '(' || shared.timesheet.endeventinterpretation_nilreason || ')'),
	'endtimerelativeevent', COALESCE(shared.timesheet.endtimerelativeevent_value || ' ' || shared.timesheet.endtimerelativeevent_uom, '(' || shared.timesheet.endtimerelativeevent_nilreason || ')'),
	'daylightsavingadjust',COALESCE(shared.timesheet.daylightsavingadjust_value, '(' || shared.timesheet.daylightsavingadjust_nilreason || ')'),
	'excluded', COALESCE(shared.timesheet.excluded_value, '(' || shared.timesheet.excluded_nilreason || ')'),
	'annotations', COALESCE(jsonb_agg(notes.note_view.note), '[]'::jsonb)
)
FROM shared.timesheet_pt
INNER JOIN shared.timesheet ON shared.timesheet_pt.timesheet_id = shared.timesheet.id
LEFT JOIN master_join ON shared.timesheet.id = master_join.source_id
LEFT JOIN notes.note_view ON master_join.target_id = notes.note_view.id
GROUP BY
    shared.timesheet_pt.id,
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

CREATE INDEX ON shared.timesheet_view (id);