FROM nvidia/cuda:12.0.0-cudnn8-runtime-ubuntu20.04

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    psmisc \
    curl \
    jq \
    clang-12 clang-tools-12 lld-12 autoconf git python pciutils gcc-multilib libgcc-8-dev-arm64-cross gcc-mingw-w64-x86-64 \
    && rm -rf /var/lib/apt/lists/*

# Fetch latest release version from GitHub API
RUN export LATEST_VERSION=$(curl -s https://api.github.com/repos/Video-Miner/Releases/releases/latest | jq -r .tag_name) && wget https://github.com/Video-Miner/Releases/releases/download/${LATEST_VERSION}/linux-videominer-${LATEST_VERSION}.tar.gz && \
    tar -xvf linux-videominer-${LATEST_VERSION}.tar.gz && \
    rm linux-videominer-${LATEST_VERSION}.tar.gz && \
    mv ./videominer /usr/local/bin

ENV	NVIDIA_DRIVER_CAPABILITIES=all \
	CPATH="/usr/local/cuda/include" \
	LIBRARY_PATH="/usr/local/cuda/lib64"

RUN	ldconfig

# Set the entrypoint to start the Video Miner pool binary with command line arguments
ENTRYPOINT ["/usr/local/bin/videominer"]