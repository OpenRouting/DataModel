CREATE ROLE readonly;
GRANT USAGE ON SCHEMA public TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;

GRANT USAGE ON SCHEMA routing TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA routing TO readonly;

GRANT USAGE ON SCHEMA osm TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA osm TO readonly;
BEGIN;
CREATE ROLE "geoservice" WITH LOGIN ENCRYPTED PASSWORD 'geoservice' IN ROLE readonly;
COMMIT;
