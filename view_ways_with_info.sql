-- View: routing.ways_with_info

-- DROP VIEW routing.ways_with_info;

CREATE OR REPLACE VIEW routing.ways_with_info AS 
 SELECT ways.gid,
    ways.source,
    ways.target,
    st_length(ways.the_geom::geography, true) AS length,
    ways.the_geom,
    way_info.osm_id,
    way_info.public,
    way_info.bicycle,
    way_info.foot,
    way_info.horse,
    way_info.oneway,
    way_info.lit,
    way_info.ramp,
    way_info.ramp_wheelchair,
    way_info.ramp_stroller,
    way_info.ramp_bicycle,
    way_info.conveying,
    way_info.bridge,
    way_info.covered,
    way_info.highway,
    way_info.route,
    way_info.surface,
    way_info.width,
    way_info.sac_scale,
    way_info.trail_visibility,
    way_info.incline,
    way_info.smoothness,
    way_info.sloped_curb
   FROM routing.ways,
    routing.way_info
  WHERE ways.osm_id = way_info.osm_id;

ALTER TABLE routing.ways_with_info
  OWNER TO postgres;
GRANT ALL ON TABLE routing.ways_with_info TO postgres;
GRANT SELECT ON TABLE routing.ways_with_info TO readonly;
