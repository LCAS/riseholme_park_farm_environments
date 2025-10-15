# Field Details
export FIELD_NAME='bullock_close'
export FIELD_ID='2930'
export FIELD_TYPE='pasture'

# Config Quick-References
CONF=$(ros2 pkg prefix environment_template)/share/environment_template/config

export DATUM_FILE="$CONF/location/datum.yaml"
if [ ! -f "$FILE" ]; then export DATUM_FILE="$CONF/location/datum_autogen.yaml" ; fi

export TMAP_FILE="$CONF/topological/network.tmap2.yaml"
if [ ! -f "$FILE" ]; then export TMAP_FILE="$CONF/topological/network_autogen.tmap2.yaml" ; fi

