-- View: ways_info
-- This view contains additional business information for way lines in the network

-- DROP VIEW ways_info;

CREATE OR REPLACE VIEW 
	ways_info 
AS 
SELECT 
	planet_osm_line.route, 
	planet_osm_line.osm_id, 
	planet_osm_line.name, 
	planet_osm_line.highway, 
	planet_osm_line.surface, 
	planet_osm_line.access, 
	planet_osm_line.sac_scale, 
	planet_osm_line.trail_visibility, 
	planet_osm_line.incline, 
	planet_osm_line.width, 
	planet_osm_line.smoothness, 
	planet_osm_line.sloped_curb, 
	planet_osm_line.lit, 
	planet_osm_line.foot, 
	planet_osm_line.bicycle, 
	planet_osm_line.horse, 
	planet_osm_line.bridge, 
	planet_osm_line.tunnel, 
	planet_osm_line.ramp, 
	planet_osm_line."ramp:wheelchair" AS ramp_wheelchair, 
	planet_osm_line."ramp:stroller" AS ramp_stroller, 
	planet_osm_line."ramp:bicycle" AS ramp_bicycle, 
	planet_osm_line.conveying, 
	planet_osm_line.z_order
FROM 
	planet_osm_line;
