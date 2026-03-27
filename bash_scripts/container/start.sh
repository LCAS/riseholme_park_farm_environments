#!/usr/bin/env bash
# ------------------------------------------------------------
# Custom environment for TopFleets agent‑container
# ------------------------------------------------------------

#1
echo -e "\n\n\nRunnng apt update\n"
sudo apt-get update

#2
echo -e "\n\n\nSourcing /opt/ros/setup.bash\n"
source /opt/ros/humble/setup.bash

#3
echo -e "\n\n\nSet working directory to /home/ros/ros2_ws\n"
[ -d "$HOME/ros2_ws" ] && cd "$HOME/ros2_ws"

#4
echo -e "\n\n\nRunning ROSDep update and install\n\n"
rosdep update
rosdep install --from-paths src --ignore-src -r -y

#5
echo -e "\n\n\nHandle PyPi-only deps listed in setup.py\n\n"
find src -name setup.py -execdir pip install -e . \;


#6
echo -e "\n\n\nBuilding Colcon Workspace at /home/ros/ros2_ws\n\n"
colcon build --symlink-install

#7
echo -e "\n\n\nSourcing built workspace\n\n"
[ -f "$HOME/ros2_ws/install/setup.bash" ] && source "$HOME/ros2_ws/install/setup.bash"

#8
echo -e "\n\n\nCustomise ros logger\n\n"
export RCUTILS_CONSOLE_OUTPUT_FORMAT="{severity}: {message}"
export RCUTILS_COLORIZED_OUTPUT=1

#9
echo -e "\n\n\nLog some stats\n\n"
echo "---ls ws"
ls $HOME/ros2_ws/
echo "---ls $HOME/ros2_ws/src"
ls $HOME/ros2_ws/src
echo "---ls $HOME/ros2_ws/src/environment_common/environment_common"
ls $HOME/ros2_ws/src/environment_common/environment_common
echo "---"

#10
echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
echo -e "\n\n\nLaunching TopFleets Connection Script\n\n"
ros2 run environment_common fill_gaps.py
