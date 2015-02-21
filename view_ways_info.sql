-- View: ways_info
-- This view contains additional business information for way lines in the network

-- DROP VIEW ways_info;

 SELECT planet_osm_line.osm_id,
        CASE
            WHEN NOT (planet_osm_line.access = ANY (ARRAY['no'::text, 'private'::text, 'agriculture'::text, 'forestry'::text, 'dicouraged'::text])) THEN false
            ELSE true
        END AS public,
        CASE
            WHEN planet_osm_line.bicycle = 'yes'::text OR planet_osm_line.highway = 'cycleway'::text THEN true
            ELSE false
        END AS bicycle,
        CASE
            WHEN planet_osm_line.foot = 'yes'::text OR (planet_osm_line.highway = ANY (ARRAY['pedestrian'::text, 'footway'::text, 'path'::text, 'access_ramp'::text, 'elevator'::text, 'steps'::text])) THEN true
            ELSE false
        END AS foot,
        CASE
            WHEN planet_osm_line.horse = 'yes'::text THEN true
            ELSE false
        END AS horse,
        CASE
            WHEN planet_osm_line.oneway = 'yes'::text THEN true
            ELSE false
        END AS oneway,
        CASE
            WHEN planet_osm_line.lit = 'yes'::text THEN true
            ELSE false
        END AS lit,
        CASE
            WHEN planet_osm_line.ramp = 'yes'::text THEN true
            ELSE false
        END AS ramp,
        CASE
            WHEN planet_osm_line."ramp:wheelchair" = 'yes'::text THEN true
            ELSE false
        END AS ramp_wheelchair,
        CASE
            WHEN planet_osm_line."ramp:stroller" = 'yes'::text THEN true
            ELSE false
        END AS ramp_stroller,
        CASE
            WHEN planet_osm_line."ramp:bicycle" = 'yes'::text THEN true
            ELSE false
        END AS ramp_bicycle,
        CASE
            WHEN planet_osm_line.conveying = 'yes'::text THEN 'FT'::text
            WHEN planet_osm_line.conveying = 'forward'::text THEN 'FT'::text
            WHEN planet_osm_line.conveying = 'backward'::text THEN 'TF'::text
            WHEN planet_osm_line.conveying = 'reversible'::text THEN 'B'::text
            ELSE 'B'::text
        END AS conveying,
        CASE
            WHEN planet_osm_line.bridge = 'yes'::text THEN true
            ELSE false
        END AS bridge,
        CASE
            WHEN planet_osm_line.covered = 'yes'::text THEN true
            ELSE false
        END AS covered,
    planet_osm_line.highway,
    planet_osm_line.route,
    planet_osm_line.surface,
    planet_osm_line.width,
    planet_osm_line.sac_scale,
    planet_osm_line.trail_visibility,
    planet_osm_line.incline,
    planet_osm_line.smoothness,
    planet_osm_line.sloped_curb
   FROM planet_osm_line;
