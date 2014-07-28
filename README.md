#Data Model
This repository defines the schema design of the open routing database.

The open routing database is built on PostgreSQL, PostGIS, and PGRouting to define routing for pedestrian networks.  Other transportation modes may be added in the future, but currently only pedestrian networks are supported.




## Requirements
* [PostgreSQL] (http://www.postgresql.org)
* [PostGIS] (http://www.postgis.us)
* [PGRouting] (http://pgrouting.org)

## Installation

Nothing is done yet!


## OSM wiki links

* [Wheel Chair Tags] (http://wiki.openstreetmap.org/wiki/Wheelchair_routing)
* [Telenav Tags] (http://wiki.openstreetmap.org/wiki/OSM_tags_for_routing/Telenav)


## Data Model


### Ways
Ways are linear features that represent paths, roads, and highways.

#### Way Types Required Tags

##### Footway
* highway = [footway] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dfootway) - A pedestrian walking path or trail.  This is the normal tag for pedestrian traffic.
* [surface] (http://wiki.openstreetmap.org/wiki/Key:surface) - Choice of paved, asphalt, cobblestone, sett (aka flat cobblestones), concrete, paving\_stones, unpaved, compacted, dirt, fine_gravel, grass, gravel

##### Cycleway
* highway = [cycleway] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dcycleway) - Seperate bicycle lane only used by bicycles.  This is not a multi-modal route.
* [surface] (http://wiki.openstreetmap.org/wiki/Key:surface) - Choice of paved, asphalt, cobblestone, sett (aka flat cobblestones), concrete, paving\_stones, unpaved, compacted, dirt, fine_gravel, grass, gravel

##### Steps
* highway = [steps] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dsteps) - Defines stairs or steps


##### Pedestrian
* [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [pedestrian] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dpedestrian) - A road or plaza that only supports pedestrian traffic. A pedestrian way could support a car and often do for deliveries after hours. Often around open street markets
* [surface] (http://wiki.openstreetmap.org/wiki/Key:surface) - Choice of paved, asphalt, cobblestone, sett (aka flat cobblestones), concrete, paving\_stones, unpaved, compacted, dirt, fine_gravel, grass, gravel

##### Path
* [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [path] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dpath) - Generic non-vehicular way designation.  Should only be used if unable to determine if the way is normally a pedestrian or bicycle network.
* [surface] (http://wiki.openstreetmap.org/wiki/Key:surface) - The material used for the surface.  Choice of: paved, asphalt, cobblestone, sett (aka flat cobblestones), concrete, paving\_stones, unpaved, compacted, dirt, fine_gravel, grass, gravel
* [name] (http://wiki.openstreetmap.org/wiki/Key:name) - The name of the path 

###### Like to have:
* [sac_scale] (http://wiki.openstreetmap.org/wiki/Key:sac_scale) - A bicycle route classification system. Choice of: hiking, mountain_hiking, demanding_mountain_hiking)
* [trail_visibility] (http://wiki.openstreetmap.org/wiki/Key:trail_visibility) - How well the path stands out from the surroundings.  Choice of: no, horrible, bad, intermediate, good, excellent
* [incline] (http://wiki.openstreetmap.org/wiki/Key:incline) - The percent incline or decline for the way.
* [width] (http://wiki.openstreetmap.org/wiki/Key:width) - The width of the path in meters
* [smoothness] (http://wiki.openstreetmap.org/wiki/Key:smoothness) - A classification scheme regarding the physical usability of a way for wheeled vehicles, particularly regarding surface regularity/flatness. Choice of: impassable, very_horrible, horrible, very_bad, bad, intermediate, good, excellent
* [sloped_curb] (http://wiki.openstreetmap.org/wiki/Key:sloped_curb) - The percent incline of the curb cutout.  AKA wheelchair ramps
* [lit] (http://wiki.openstreetmap.org/wiki/Lit) - Determines whether the path is lit with lamps at night. Choice of: Yes, No
* foot - Determines whether pedestrians have access. Choice of: Yes, No
* bicycles - Determines whether pedestrians have access. Choice of: Yes, No
* horses - Determines whether horses have access. Choice of: Yes, No




