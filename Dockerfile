FROM docker.io/library/node:24-alpine

RUN apk add --no-cache \
    bash \
    git \
    ripgrep \
    fd \
    build-base \
    python3 \
    py3-pip \
    uv \
    openjdk21-jdk \
    perl \
    curl \
    tmux \
    wget

# Install the Pi coding agent
RUN npm install -g @earendil-works/pi-coding-agent

# Lock down network activity (Disable telemetry, version checks, and binary downloads)
ENV PI_OFFLINE=1
ENV PI_SKIP_VERSION_CHECK=1
ENV PI_TELEMETRY=0

# Set the working directory where your code will be mounted
WORKDIR /workspace

# Pi runs as the default entrypoint
ENTRYPOINT ["pi"]
