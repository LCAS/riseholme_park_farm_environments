# Farm Details
export FARM_NAME='riseholme_park'

# Field Details
export FIELD_NAME='40_acre'
export FIELD_ID='7601'
export FIELD_TYPE='horticulture'

# Config Quick-References
CONF=$(ros2 pkg prefix environment_template)/share/environment_template/config

export DATUM_FILE="$CONF/location/datum.yaml"
if [ ! -f "$FILE" ]; then export DATUM_FILE="$CONF/location/datum_autogen.yaml" ; fi

export TMAP_FILE="$CONF/topological/network.tmap2.yaml"
if [ ! -f "$FILE" ]; then export TMAP_FILE="$CONF/topological/network_autogen.tmap2.yaml" ; fi
