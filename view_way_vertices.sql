SELECT ways_vertices_pgr.*
FROM 
	routing.ways_vertices_pgr,
	routing.ways
WHERE ways_vertices_pgr.id in (ways.source, ways.target)
