# ──────────────────────────────
# 1. Base – ROS 2 Humble
# ──────────────────────────────
FROM osrf/ros:humble-desktop-full

# before any 'apt-get update' that touches ros2-testing
RUN apt-get update && apt-get install -y --no-install-recommends gnupg2 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654

RUN echo "deb http://packages.ros.org/ros2-testing/ubuntu $(lsb_release -cs) main" \
    | tee /etc/apt/sources.list.d/ros2-testing.list

ARG  DEBIAN_FRONTEND=noninteractive
ARG  USERNAME=ros
ARG  UID=1000
ARG  GID=1000

# ──────────────────────────────
# 2. Non‑root user with sudo
# ──────────────────────────────

RUN apt-get update && apt-get install -y sudo git \
    && addgroup --gid ${GID} ${USERNAME} \
    && adduser  --uid ${UID} --gid ${GID} --disabled-password --gecos "" ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && addgroup dialout || true && usermod -a -G dialout ${USERNAME}

# ──────────────────────────────
# 3. Empty workspace skeleton for submodules
#    (sources come in as volumes at run‑time)
# ──────────────────────────────

ENV WS=/home/${USERNAME}/ros2_ws
RUN mkdir -p ${WS}/src \
    && chown -R ${USERNAME}:${USERNAME} ${WS}

# Load environment template config
COPY .. ${WS}/src/environment_template
#environment_template

# Load environment common config
ENV ENVCOMMON_URL=https://github.com/LCAS/environment_common.git
RUN git clone --depth 1 ${ENVCOMMON_URL} ${WS}/src/environment_common

# ──────────────────────────────
# 4. Empty directory for storing bash scripts
#    (sources come in as volumes at run‑time)
# ──────────────────────────────
ENV BASH_SCRIPTS=/home/${USERNAME}/bash_scripts
RUN mkdir -p ${BASH_SCRIPTS} \
    && chown -R ${USERNAME}:${USERNAME} ${BASH_SCRIPTS}

# Load local bash scripts
COPY ../bash_scripts/container ${BASH_SCRIPTS}

# ──────────────────────────────
# 6. Toolchain + rosdep
#    (still running as root)
# ──────────────────────────────

# 1. Core build & ROS helpers
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo git build-essential \
    python3 python3-pip \
    python3-colcon-common-extensions \
    python3-rosdep python3-rosdep-modules && \
    rm -rf /var/lib/apt/lists/*

# 2. Convenience CLI tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nano tmux \
    curl unzip \
    htop net-tools tree && \
    rm -rf /var/lib/apt/lists/*

# 3. Extra ROS debs used by your workspace
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ros-humble-ament-cmake-core \
    && \
    rm -rf /var/lib/apt/lists/*

# 4. Python pip installs
ARG PIP_DEFAULT_TIMEOUT=100
ARG PIP_RETRIES=5
ENV PIP_DEFAULT_TIMEOUT=$PIP_DEFAULT_TIMEOUT \
    PIP_RETRIES=$PIP_RETRIES

RUN python3 -m pip install --no-cache-dir --upgrade \
    pip wheel \
    setuptools==58.2.0 \
    packaging==24.2

# ──────────────────────────────
# 7. Drop privileges
# ──────────────────────────────

USER ${USERNAME}
WORKDIR /home/${USERNAME}

# ──────────────────────────────
# 8. Friendly hook:
# ──────────────────────────────

RUN echo 'source ~/ros2_ws/src/environment_template/config/environment.sh' >> /home/${USERNAME}/.bashrc

# ──────────────────────────────
# 9. Default shell
# ──────────────────────────────

CMD ["bash", "-l", "-c", "/home/ros/bash_scripts/start.sh"]
