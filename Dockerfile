FROM osrf/ros:galactic-desktop

# upgrade to latest rolling
RUN apt-get update && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

# After apt install sudo
RUN echo 'ALL ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Necessary dependencies for zero-copy demo
RUN apt-get update && apt-get install -y --no-install-recommends \
        tmux \
        wget \
        python3-pip && \
    pip3 install --no-cache-dir tmuxp \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://github.com/ClementTsang/bottom/releases/download/0.6.6/bottom_0.6.6_amd64.deb && \
    dpkg -i bottom_0.6.6_amd64.deb

COPY env.sh /etc/profile.d/ade_env.sh
COPY entrypoint /ade_entrypoint
ENTRYPOINT ["/ade_entrypoint"]
CMD ["/bin/sh", "-c", "trap 'exit 147' TERM; tail -f /dev/null & while wait ${!}; [ $? -ge 128 ]; do true; done"]
