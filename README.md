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

#### Required Tags
* [name] (http://wiki.openstreetmap.org/wiki/Key:name) - The name of the path 
* [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) - Determines whether the way is a bicycle, pedestrian, or vehicular route.
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [footway] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dfootway) - A pedestrian walking path or trail.  This is the normal tag for pedestrian traffic.
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [path] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dpath) - Generic non-vehicular way designation.  Should only be used if unable to determine if the way is normally a pedestrian or bicycle network.
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [footway] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dfootway) - A pedestrian walking path or trail.  This is the normal tag for pedestrian traffic.
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [cycleway] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dcycleway) - Seperate bicycle lane only used by bicycles.  This is not a multi-modal route.
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [steps] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dsteps) - Defines stairs or steps
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [elevator] (http://wiki.openstreetmap.org/wiki/Tag:highway=elevator) - Defines elevator or lift
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [access_ramp] (http://wiki.openstreetmap.org/wiki/Proposed_features/Access_Ramp) - Handicap Accessibility ramp
  * [highway] (http://wiki.openstreetmap.org/wiki/Key:highway) = [pedestrian] (http://wiki.openstreetmap.org/wiki/Tag:highway%3Dpedestrian) - A road or plaza that only supports pedestrian traffic. A pedestrian way could support a car and often do for deliveries after hours. Often around open street markets

* [surface] (http://wiki.openstreetmap.org/wiki/Key:surface) - The material used for the surface.  Choice of: 
  * paved
  * asphalt
  * cobblestone
  * sett (aka flat cobblestones)
  * concrete
  * paving\_stones
  * unpaved
  * compacted
  * dirt
  * fine_gravel
  * grass
  * gravel

* [access] (http://wiki.openstreetmap.org/wiki/Key:access) - Generic term for who has access to a way.
  * yes - Pubically Accessible to anyone.
  * private - Only accessible to owner.
  * no - No access to the public.
  * permissive - Open to the public at will of owner.
  * destination - Local traffic only.
  * agriculture - Only for agricultural access.
  * delivery - Only accessible for deliveries.  Service road as an example.
  * designation - A preferred route.
  * discouraged - Publically accessible, but discouraged.  A hiking trail behind through someones back yard as an example.
  * forestry - Only for forestry access.
  * customers - Only accessible to customers.

###### Like to have:
* [sac_scale] (http://wiki.openstreetmap.org/wiki/Key:sac_scale) - A bicycle route classification system. Choice of:
  * hiking
  * mountain_hiking
  * demanding_mountain_hiking

* [trail_visibility] (http://wiki.openstreetmap.org/wiki/Key:trail_visibility) - How well the path stands out from the surroundings.  Choice of: 
  * no
  * horrible
  * bad
  * intermediate
  * good
  * excellent
* [incline] (http://wiki.openstreetmap.org/wiki/Key:incline) - The percent incline or decline for the way.
* [width] (http://wiki.openstreetmap.org/wiki/Key:width) - The width of the path in meters
* [smoothness] (http://wiki.openstreetmap.org/wiki/Key:smoothness) - A classification scheme regarding the physical usability of a way for wheeled vehicles, particularly regarding surface regularity/flatness. Choice of: 
  * impassable
  * very_horrible
  * horrible
  * very_bad
  * bad
  * intermediate
  * good
  * excellent
* [sloped_curb] (http://wiki.openstreetmap.org/wiki/Key:sloped_curb) - The percent incline of the curb cutout.  AKA wheelchair ramps
* [lit] (http://wiki.openstreetmap.org/wiki/Lit) - Determines whether the path is lit with lamps at night. Choice of:
  * Yes
  * No
* foot - Determines whether pedestrians have access. Choice of: 
  * Yes
  * No
* bicycles - Determines whether pedestrians have access. Choice of: 
  * Yes
  * No
* horses - Determines whether horses have access. Choice of: 
  * Yes
  * No
* [bridge] (http://wiki.openstreetmap.org/wiki/Bridge) - Determines whether the segment is a bridge.  Choice Of:
  * Yes
  * No
* [tunnel] (http://wiki.openstreetmap.org/wiki/Tunnel) - Determines whether the segment is a tunnel.  Choice Of:
  * Yes
  * No
* [ramp] (http://wiki.openstreetmap.org/wiki/Key:ramp#Ramps) - Defines whether the way is ramp. Choice of:
  * Yes
  * No
* ramp:wheelchair - A wheelchair accessible ramp. Choice of:
  * Yes
  * No
* ramp:stroller - A ramp with stairs down the middle. Choice of:
  * Yes
  * No
* ramp:bicycle - A ramp on the side of a flight of steps for bicycles. Choice of:
  * Yes
  * No
* [conveying] (http://wiki.openstreetmap.org/wiki/Key:conveying) - Defines escalators and moving walkways. Choice of:
   * Yes - The way is an escalator or moving walkway in the digitized direction
   * Forward - The way is an escalator or moving walkway in the digitized direction
   * Backward - The way is an escalator or moving walkway in the *opposite* of the digitized direction
   * Reversible - The way is an escalator or moving walkway moves in either direction
  
