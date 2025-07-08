drop materialized view if exists airspace.airspaceactivation_view cascade;
create materialized view airspace.airspaceactivation_view as
select
    airspace.airspaceactivation_pt.id,
    airspace.airspaceactivation_pt.nilreason AS airspaceactivation_nilreason,
    coalesce(cast(airspace.airspaceactivation.activity_value as varchar), '(' || airspace.airspaceactivation.activity_nilreason || ')') as activity,
    coalesce(cast(airspace.airspaceactivation.status_value as varchar), '(' || airspace.airspaceactivation.status_nilreason || ')') as status,
    jsonb_agg(DISTINCT shared_timesheet_view_jwvriy.*) AS timeinterval,
    jsonb_agg(DISTINCT notes_note_view_vpbulc.*) AS annotation,
    jsonb_agg(DISTINCT jsonb_build_object('id', organisation_organisationauthority_pt_djiino.id,
    'title', coalesce(cast(organisation_organisationauthority_pt_djiino.title AS varchar), '(' || organisation_organisationauthority_pt_djiino.nilreason[1] || ')'),
    'href', organisation_organisationauthority_pt_djiino.href)) AS specialdateauthority,
    jsonb_agg(DISTINCT jsonb_build_object('id', organisation_organisationauthority_pt_krhibn.id,
    'title', coalesce(cast(organisation_organisationauthority_pt_krhibn.title AS varchar), '(' || organisation_organisationauthority_pt_krhibn.nilreason[1] || ')'),
    'href', organisation_organisationauthority_pt_krhibn.href)) AS user,
    jsonb_agg(DISTINCT shared_airspacelayer_pt_lvbued.id) AS levels,
    jsonb_agg(DISTINCT shared_aircraftcharacteristic_pt_jmfkpo.id) AS aircraft
from airspace.airspaceactivation_pt 
inner join airspace.airspaceactivation on airspace.airspaceactivation_pt.airspaceactivation_id = airspace.airspaceactivation.id
left join master_join master_join_egaacj on airspace.airspaceactivation.id = master_join_egaacj.source_id
left join shared.timesheet_view shared_timesheet_view_jwvriy on master_join_egaacj.target_id = shared_timesheet_view_jwvriy.id
left join master_join master_join_jtdana on airspace.airspaceactivation.id = master_join_jtdana.source_id
left join notes.note_view notes_note_view_vpbulc on master_join_jtdana.target_id = notes_note_view_vpbulc.id
left join master_join master_join_tnarnn on airspace.airspaceactivation.id = master_join_tnarnn.source_id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_djiino on master_join_tnarnn.target_id = organisation_organisationauthority_pt_djiino.id
left join master_join master_join_qqsvdi on airspace.airspaceactivation.id = master_join_qqsvdi.source_id
left join shared.airspacelayer_pt shared_airspacelayer_pt_lvbued on master_join_qqsvdi.target_id = shared_airspacelayer_pt_lvbued.id
left join master_join master_join_orddea on airspace.airspaceactivation.id = master_join_orddea.source_id
left join organisation.organisationauthority_pt organisation_organisationauthority_pt_krhibn on master_join_orddea.target_id = organisation_organisationauthority_pt_krhibn.id
left join master_join master_join_smkhoj on airspace.airspaceactivation.id = master_join_smkhoj.source_id
left join shared.aircraftcharacteristic_pt shared_aircraftcharacteristic_pt_jmfkpo on master_join_smkhoj.target_id = shared_aircraftcharacteristic_pt_jmfkpo.id
group by
    airspace.airspaceactivation_pt.id,
    airspace.airspaceactivation_pt.nilreason,
    airspace.airspaceactivation.activity_value,
    airspace.airspaceactivation.activity_nilreason,
    airspace.airspaceactivation.status_value,
    airspace.airspaceactivation.status_nilreason;
create index on airspace.airspaceactivation_view (id);
-- drop materialized view if exists airspace.airspaceactivation_view cascade;
-- create materialized view airspace.airspaceactivation_view as
SELECT
    aa_pt.id,
    aa_pt.nilreason AS airspaceactivation_nilreason,
    COALESCE(CAST(aa.activity_value AS varchar), '(' || aa.activity_nilreason || ')') AS activity,
    COALESCE(CAST(aa.status_value AS varchar), '(' || aa.status_nilreason || ')') AS status,

    timeinterval.timeinterval,
    annotation.annotation,
    specialdateauthority.specialdateauthority,
    user_authority.user_authority,
    levels.levels,
    aircraft.aircraft

FROM airspace.airspaceactivation_pt aa_pt
JOIN airspace.airspaceactivation aa ON aa_pt.airspaceactivation_id = aa.id

-- timeinterval aggregation
LEFT JOIN LATERAL (
    SELECT jsonb_agg(DISTINCT tsv.*) AS timeinterval
    FROM master_join mj
    JOIN shared.timesheet_view tsv ON mj.target_id = tsv.id
    WHERE mj.source_id = aa.id
) AS timeinterval ON TRUE

-- annotation aggregation
LEFT JOIN LATERAL (
    SELECT jsonb_agg(DISTINCT nv.*) AS annotation
    FROM master_join mj
    JOIN notes.note_view nv ON mj.target_id = nv.id
    WHERE mj.source_id = aa.id
) AS annotation ON TRUE

-- specialdateauthority aggregation
LEFT JOIN LATERAL (
    SELECT jsonb_agg(DISTINCT jsonb_build_object(
        'id', oa.id,
        'title', COALESCE(CAST(oa.title AS varchar), '(' || oa.nilreason[1] || ')'),
        'href', oa.href
    )) AS specialdateauthority
    FROM master_join mj
    JOIN organisation.organisationauthority_pt oa ON mj.target_id = oa.id
    WHERE mj.source_id = aa.id
) AS specialdateauthority ON TRUE

-- user authority aggregation
LEFT JOIN LATERAL (
    SELECT jsonb_agg(DISTINCT jsonb_build_object(
        'id', oa.id,
        'title', COALESCE(CAST(oa.title AS varchar), '(' || oa.nilreason[1] || ')'),
        'href', oa.href
    )) AS user_authority
    FROM master_join mj
    JOIN organisation.organisationauthority_pt oa ON mj.target_id = oa.id
    WHERE mj.source_id = aa.id
) AS user_authority ON TRUE

-- levels aggregation
LEFT JOIN LATERAL (
    SELECT jsonb_agg(DISTINCT al.id) AS levels
    FROM master_join mj
    JOIN shared.airspacelayer_pt al ON mj.target_id = al.id
    WHERE mj.source_id = aa.id
) AS levels ON TRUE

-- aircraft aggregation
LEFT JOIN LATERAL (
    SELECT jsonb_agg(DISTINCT ac.id) AS aircraft
    FROM master_join mj
    JOIN shared.aircraftcharacteristic_pt ac ON mj.target_id = ac.id
    WHERE mj.source_id = aa.id
) AS aircraft ON TRUE

LIMIT 300;

-- create index on airspace.airspaceactivation_view (id);
