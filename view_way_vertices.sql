-- View: routing.way_vertices

-- DROP VIEW routing.way_vertices;

CREATE OR REPLACE VIEW routing.way_vertices AS 
 SELECT DISTINCT ways_vertices_pgr.id,
    ways_vertices_pgr.cnt,
    ways_vertices_pgr.chk,
    ways_vertices_pgr.ein,
    ways_vertices_pgr.eout,
    ways_vertices_pgr.the_geom
   FROM routing.ways_vertices_pgr,
    routing.ways_with_info
  WHERE ways_vertices_pgr.id = ways_with_info.target OR ways_vertices_pgr.id = ways_with_info.source;

ALTER TABLE routing.way_vertices
  OWNER TO postgres;
GRANT ALL ON TABLE routing.way_vertices TO postgres;
GRANT SELECT ON TABLE routing.way_vertices TO readonly;
