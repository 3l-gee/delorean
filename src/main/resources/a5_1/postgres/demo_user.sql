ALTER USER demo WITH PASSWORD 'delorean';
GRANT CONNECT ON DATABASE sia TO demo;
GRANT USAGE ON SCHEMA aerial_refuelling TO demo;
GRANT USAGE ON SCHEMA airport_heliport TO demo;
GRANT USAGE ON SCHEMA airspace TO demo;
GRANT USAGE ON SCHEMA geometry TO demo;
GRANT USAGE ON SCHEMA holding TO demo;
GRANT USAGE ON SCHEMA navaids_points TO demo;
GRANT USAGE ON SCHEMA notes TO demo;
GRANT USAGE ON SCHEMA obstacles TO demo;
GRANT USAGE ON SCHEMA organisation TO demo;
GRANT USAGE ON SCHEMA procedure TO demo;
GRANT USAGE ON SCHEMA routes TO demo;
GRANT USAGE ON SCHEMA rules_procedures TO demo;
GRANT USAGE ON SCHEMA service TO demo;
GRANT USAGE ON SCHEMA shared TO demo;
GRANT USAGE ON SCHEMA surveillance TO demo;
-- GRANT USAGE ON SCHEMA qgis TO demo;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE qgis.qgis_projects TO demo;
GRANT SELECT ON TABLE qgis.qgis_projects TO demo;


DO
$$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT schemaname, matviewname
        FROM pg_matviews
    LOOP
        EXECUTE format(
            'GRANT SELECT ON TABLE %I.%I TO demo;',
            r.schemaname,
            r.matviewname
        );
    END LOOP;
END;
$$;
