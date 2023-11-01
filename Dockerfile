FROM nvidia/cuda:11.8.0-base-ubuntu22.04

ENV	NVIDIA_DRIVER_CAPABILITIES=all

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*

# Download and extract the Video Miner pool binary
RUN wget https://github.com/Video-Miner/Releases/releases/download/go-livepeer-0.5.38_videominer-1.2.3-5344efd4/linux-videominer-go-livepeer-0.5.38_videominer-1.2.3-5344efd4.tar.gz && \
    tar -xvf linux-videominer-go-livepeer-0.5.38_videominer-1.2.3-5344efd4.tar.gz && \
    rm linux-videominer-go-livepeer-0.5.38_videominer-1.2.3-5344efd4.tar.gz && \
    mv ./videominer /usr/local/bin

# Set the entrypoint to start the Video Miner pool binary with command line arguments
ENTRYPOINT ["/usr/local/bin/videominer"]
