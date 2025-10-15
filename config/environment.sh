# Farm Details
export FARM_NAME='riseholme_park'

# Field Details
export FIELD_NAME='riseholme_hall_east'
export FIELD_ID='0'
export FIELD_TYPE='building'

# Config Quick-References
CONF=$(ros2 pkg prefix environment_template)/share/environment_template/config

export MAP_FILE="$CONF/metric/map/map.yaml"
if [ ! -f "$MAP_FILE" ]; then export MAP_FILE="$CONF/metric/map_autogen/map.yaml" ; fi

export TMAP_FILE="$CONF/topological/network.tmap2.yaml"
if [ ! -f "$TMAP_FILE" ]; then export TMAP_FILE="$CONF/topological/network_autogen.tmap2.yaml" ; fi
