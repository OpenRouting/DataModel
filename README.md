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

##### Cycleway
* highway = [cycleway] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dcycleway) - Seperate bicycle lane only used by bicycles.  This is not a multi-modal route.

##### Steps
* highway = [steps] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dsteps) - Defines stairs or steps


##### Pedestrian
* highway = [pedestrian] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dpedestrian) - A road or plaza that only supports pedestrian traffic. A pedestrian way could support a car and often do for deliveries after hours. Often around open street markets

##### Path
* highway = [path] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dpath) - Generic non-vehicular way designation.  Should only be used if unable to determine if the way is normally a pedestrian or bicycle network.




