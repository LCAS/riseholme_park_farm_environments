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
export ENVIRONMENT_COMMON_LATEST_RELEASE='v1.0.1'



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
#%    Path to datum file or path to the autogen file if the
#%    supplied version does is not given or empty if the
#%    autogen version does not exist.
#%
#================================================================
export DATUM_FILE="$CONFIG_DIR/location/datum.yaml"
if [ ! -f "$DATUM_FILE" ]; then export DATUM_FILE="$CONFIG_DIR/location/datum_autogen.yaml" ; fi
if [ ! -f "$DATUM_FILE" ]; then export DATUM_FILE="" ; fi



#================================================================
# Filepath of the Topological Map File
#================================================================
#% DESCRIPTION
#%    Path to topological map file or path to the autogen
#%    version if the supplied version is not given or
#%    empty if the autogen version does not exist.
#%
#================================================================
export TMAP_FILE="$CONFIG_DIR/topological/network.tmap2.yaml"
if [ ! -f "$TMAP_FILE" ]; then export TMAP_FILE="$CONFIG_DIR/topological/network_autogen.tmap2.yaml" ; fi
if [ ! -f "$TMAP_FILE" ]; then export TMAP_FILE="" ; fi



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
if [ ! -f "$POI_FILE" ]; then export POI_FILE="$CONFIG_DIR/world/poi.tmap2.yaml" ; fi
if [ ! -f "$POI_FILE" ]; then export POI_FILE="" ; fi



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
#%    move_base or the autogen version if the supplied
#%    version is not given or empty if the autogen version
#%    does not exist.
#%
#================================================================
export COSTMAP_YAML_FILE="$CONFIG_DIR/metric/map/map.yaml"
if [ ! -f "$COSTMAP_YAML_FILE" ]; then export COSTMAP_YAML_FILE="$CONFIG_DIR/metric/map/map_autogen.yaml" ; fi
if [ ! -f "$COSTMAP_YAML_FILE" ]; then export COSTMAP_YAML_FILE="" ; fi


