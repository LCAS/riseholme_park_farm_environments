#!/bin/sh
#================================================================
# HEADER
#================================================================
#% DESCRIPTION
#%    This is a source file to enable quick and simple access to
#%    maps and details about the selected environment through
#%    environment variable definitions.
#%
#================================================================
#- IMPLEMENTATION
#-    version         environment_template | environment.sh (1.0)
#-    author          James R. Heselden
#-    license         Apache License Version 2.0
#-
#================================================================
# END_OF_HEADER
#================================================================



#================================================================
# Compatibility Version ID
#================================================================
#% DESCRIPTION
#%    Used to determine latest version of environment_common
#%    in which this environment was tested and configured.
#%
#================================================================
export ENVIRONMENT_COMMON_LATEST_RELEASE='v1.0.0'



#================================================================
# Relative Full-Path Location to Config Directory
#================================================================
CONFIG_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
echo "Environment: $CONFIG_DIR"



#================================================================
# ROS2 Package Location to Config Directory
#================================================================
#if [ $(command -v rospack) ]; then
#    if [ $(ros2 pkg list | grep "^environment_template") ]; then
#        CONFIG_DIR=$(ros2 pkg prefix environment_template --share)/config/
#        CONFIG_DIR_METHOD="Loading path in ros2 package"
#    fi
#fi



#================================================================
# Source for Properties File
#================================================================
#% DESCRIPTION
#%    Source to the properties file for information about
#%    the environment to be loaded in from environment
#%    variables.
#%
#================================================================
export PROPERTIES_FILE="$CONFIG_DIR/properties.sh"
if [ -f "$PROPERTIES_FILE" ]; then source $PROPERTIES_FILE ; fi



#================================================================
# Filepath of the Datum File
#================================================================
#% DESCRIPTION
#%    Path to datum file used to define the tf connection
#%    between GNSS/RTK readings, and the world frame.
#%
#================================================================
export DATUM_FILE="$CONFIG_DIR/location/datum.yaml"
if [ ! -f "$DATUM_FILE" ]; then export DATUM_FILE="$CONFIG_DIR/location/datum_autogen.yaml" ; fi
if [ ! -f "$DATUM_FILE" ]; then export DATUM_FILE="" ; fi



#================================================================
# Filepath of the Topological Map File
#================================================================
#% DESCRIPTION
#%    Path to topological map file used to represent navigible
#%    paths through the environment.
#%
#================================================================
export TMAP_FILE="$CONFIG_DIR/topological/network.tmap2.yaml"
if [ ! -f "$TMAP_FILE" ]; then export TMAP_FILE="$CONFIG_DIR/topological/network_autogen.tmap2.yaml" ; fi
if [ ! -f "$TMAP_FILE" ]; then export TMAP_FILE="" ; fi



#================================================================
# Filepath of the NavGraph Map File
#================================================================
#% DESCRIPTION
#%    Path to NavGraph topological map, used to define paths
#%    for robot to navigate.
#%
#================================================================
export NAVGRAPH_FILE="$CONFIG_DIR/topological/navgraph.yaml"
if [ ! -f "$NAVGRAPH_FILE" ]; then export NAVGRAPH_FILE="$CONFIG_DIR/topological/navgraph_autogen.yaml" ; fi
if [ ! -f "$NAVGRAPH_FILE" ]; then export NAVGRAPH_FILE="" ; fi



#================================================================
# Filepath of the Probablistic Road Map File
#================================================================
#% DESCRIPTION
#%    Path to Probablistic Road Map, used to define paths
#%    for a robot to navigate.
#%
#================================================================
export PRM_FILE="$CONFIG_DIR/topological/prm_graph.yaml"
if [ ! -f "$PRM_FILE" ]; then export PRM_FILE="$CONFIG_DIR/topological/prm_graph.yaml" ; fi
if [ ! -f "$PRM_FILE" ]; then export PRM_FILE="" ; fi



#================================================================
# Filepath of the Points of Interest Map File
#================================================================
#% DESCRIPTION
#%    Path to OpenStreetMap XML file, used to define objects and
#%    their connections using GNSS frame of reference.
#%
#================================================================
export OSM_FILE="$CONFIG_DIR/topological/osm.xml"
if [ ! -f "$OSM_FILE" ]; then export OSM_FILE="$CONFIG_DIR/topological/osm_autogen.xml" ; fi
if [ ! -f "$OSM_FILE" ]; then export OSM_FILE="" ; fi



#================================================================
# Filepath of the Fiducial SLAM Marker Map
#================================================================
#% DESCRIPTION
#%    Path to map of Fiducial markers used for localisation,
#%    encoding information on pose, rotation and links, i.e:
#%    id x y z pan tilt roll variance numObservations links
#%
#================================================================
export FIDUCIAL_MAP_FILE="$CONFIG_DIR/world/fiducial_map.txt"
if [ ! -f "$FIDUCIAL_MAP_FILE" ]; then export FIDUCIAL_MAP_FILE="$CONFIG_DIR/world/fiducial_map_autogen.txt" ; fi
if [ ! -f "$FIDUCIAL_MAP_FILE" ]; then export FIDUCIAL_MAP_FILE="" ; fi



#================================================================
# Filepath of the Points of Interest Map File
#================================================================
#% DESCRIPTION
#%    Path to tmap2 file used to encode information on
#%    locations of interest, to be extended with information
#%    on actions to perform at said locations.
#%
#================================================================
export POI_FILE="$CONFIG_DIR/world/poi.tmap2.yaml"
if [ ! -f "$POI_FILE" ]; then export POI_FILE="$CONFIG_DIR/world/poi_autogen.tmap2.yaml" ; fi
if [ ! -f "$POI_FILE" ]; then export POI_FILE="" ; fi



#================================================================
# Filepath of the Points of Interest (SIMPLE) Map File
#================================================================
#% DESCRIPTION
#%    Path to a simple yaml identifying points of interest
#%    with simple points wrt the grid.
#%
#================================================================
export POI_SIMPLE_FILE="$CONFIG_DIR/world/poi_simple.yaml"
if [ ! -f "$POI_SIMPLE_FILE" ]; then export POI_SIMPLE_FILE="$CONFIG_DIR/world/poi_simple_autogen.yaml" ; fi
if [ ! -f "$POI_SIMPLE_FILE" ]; then export POI_SIMPLE_FILE="" ; fi



#================================================================
# Filepath of the OpenRMF World File
#================================================================
#% DESCRIPTION
#%    Path to OpenRMF world file. Used for compatibility with
#%    the OpenRMF multi-robot simulator.
#%
#================================================================
export OPENRMF_WORLD_FILE="$CONFIG_DIR/world/openrmf.yaml"
if [ ! -f "$OPENRMF_WORLD_FILE" ]; then export OPENRMF_WORLD_FILE="$CONFIG_DIR/world/openrmf_autogen.yaml" ; fi
if [ ! -f "$OPENRMF_WORLD_FILE" ]; then export OPENRMF_WORLD_FILE="" ; fi



#================================================================
# Filepath of the Gazebo World XML File
#================================================================
#% DESCRIPTION
#%    Path to gazebo world xml file or path to the autogen
#%    version if the supplied version is not given or
#%    empty if the autogen version does not exist.
#%
#================================================================
export GAZEBO_WORLD_FILE="$CONFIG_DIR/world/gazebo.world.xml"
if [ ! -f "$GAZEBO_WORLD_FILE" ]; then export GAZEBO_WORLD_FILE="$CONFIG_DIR/world/gazebo_autogen.world.xml" ; fi
if [ ! -f "$GAZEBO_WORLD_FILE" ]; then export GAZEBO_WORLD_FILE="" ; fi



#================================================================
# Custom models for use with Gazebo World file
#================================================================
#% DESCRIPTION
#%    This is used to add any custom models included within
#%    the environment, to the gazebo reference library. This
#%    is completed only on the condition wherein there is
#%    more than just the .placeholder file present in the
#%    directory.
#%
#================================================================
export GAZEBO_CUSTOM_MODELS="$CONFIG_DIR/world/custom_models/"
non_hidden_file_count=$(ls -l "$GAZEBO_CUSTOM_MODELS" | grep -v "^\." | wc -l)
if [ "$non_hidden_file_count" -gt 1 ]; then export GAZEBO_MODEL_PATH="$GAZEBO_MODEL_PATH:$GAZEBO_CUSTOM_MODELS" ; fi



#================================================================
# Filepath of the Costmap YAML Configuration File
#================================================================
#% DESCRIPTION
#%    Path to costmap yaml configuration for use with
#%    move_base or nav2. For use with general navigation
#%    and obstacle avoidance.
#%
#================================================================
export COSTMAP_YAML_FILE="$CONFIG_DIR/metric/map/map.yaml"
if [ ! -f "$COSTMAP_YAML_FILE" ]; then export COSTMAP_YAML_FILE="$CONFIG_DIR/metric/map/map_autogen.yaml" ; fi
if [ ! -f "$COSTMAP_YAML_FILE" ]; then export COSTMAP_YAML_FILE="" ; fi



#================================================================
# Filepath of the NoGo Costmap YAML Configuration File
#================================================================
#% DESCRIPTION
#%    Path to nogo costmap yaml configuration for use with
#%    move_base and nav2. Used to explicitly express obstacles
#%    beyond the visible range of the lidar.
#%
#================================================================
export NOGO_COSTMAP_YAML_FILE="$CONFIG_DIR/metric/nogo/map.yaml"
if [ ! -f "$NOGO_COSTMAP_YAML_FILE" ]; then export NOGO_COSTMAP_YAML_FILE="$CONFIG_DIR/metric/nogo/map_autogen.yaml" ; fi
if [ ! -f "$NOGO_COSTMAP_YAML_FILE" ]; then export NOGO_COSTMAP_YAML_FILE="" ; fi
