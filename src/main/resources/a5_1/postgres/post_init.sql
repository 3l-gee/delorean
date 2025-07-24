-- Required schema for QGIS project
CREATE SCHEMA IF NOT EXISTS qgis;

-- Stores QGIS project files, their metadata, and names
CREATE TABLE IF NOT EXISTS qgis.qgis_projects (
    name text NOT NULL PRIMARY KEY,
    metadata jsonb,
    content bytea -- Binary QGIS project file
);

-- 'master_join' is a flexible, generic join table used to represent relationships between entities.
-- Remove all foreign key constraints from master_join to enable dynamic linking via a single table.
DO $$
DECLARE
    constraint_record RECORD;
BEGIN
    FOR constraint_record IN
        SELECT conname
        FROM pg_constraint
        WHERE conrelid = 'master_join'::regclass
          AND contype = 'f'
    LOOP
        EXECUTE format('ALTER TABLE master_join DROP CONSTRAINT %I', constraint_record.conname);
    END LOOP;
END $$;

DO $$
DECLARE
    constraint_record RECORD;
BEGIN
    FOR constraint_record IN
        SELECT conname
        FROM pg_constraint
        WHERE conrelid = 'master_join_geometry'::regclass
          AND contype = 'f'
    LOOP
        EXECUTE format('ALTER TABLE master_join_geometry DROP CONSTRAINT %I', constraint_record.conname);
    END LOOP;
END $$;

-- Add indexes to speed up lookups on the master_join table.
CREATE INDEX IF NOT EXISTS idx_master_join_source_id ON master_join(source_id);
CREATE INDEX IF NOT EXISTS idx_master_join_target_id ON master_join(target_id);
CREATE INDEX IF NOT EXISTS idx_master_join_geometry_source_id ON master_join_geometry(source_id);
CREATE INDEX IF NOT EXISTS idx_master_join_geometry_target_id ON master_join_geometry(target_id);
