-- Locate user defined point on network
-- Author: Christopher Fricke
-- License: MIT

-- DROP FUNCTION routing.get_waypoint(geometry);
CREATE OR REPLACE FUNCTION routing.get_waypoint(test_geom geometry) RETURNS int AS $$
    SELECT id::integer FROM routing.way_vertices ORDER BY the_geom <-> test_geom LIMIT 1;;
$$ LANGUAGE SQL;
