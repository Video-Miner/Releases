FROM nvidia/cuda:12.0.0-base-ubuntu22.04

ENV NVIDIA_DRIVER_CAPABILITIES=all

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    psmisc \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Fetch the latest release version from GitHub API
RUN export LATEST_VERSION=$(curl -s https://api.github.com/repos/Video-Miner/Releases/releases/latest | jq -r .tag_name)

# Download and extract the latest Video Miner pool binary
RUN wget "https://github.com/Video-Miner/Releases/releases/download/$LATEST_VERSION/linux-videominer-$LATEST_VERSION.tar.gz" && \
    tar -xvf "linux-videominer-$LATEST_VERSION.tar.gz" && \
    rm "linux-videominer-$LATEST_VERSION.tar.gz" && \
    mv "./videominer" /usr/local/bin

# Set the entrypoint to start the Video Miner pool binary with command line arguments
ENTRYPOINT ["/usr/local/bin/videominer"]