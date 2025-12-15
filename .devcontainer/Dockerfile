FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# Install common build dependencies used by this project and make
# apt operations non-interactive and cleanup to keep the image small.
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        ninja-build \
        pkg-config \
        git \
        ca-certificates \
        libhamlib-dev \
        libpulse-dev \
        libqwt-qt5-dev \
        libfftw3-dev \
        libopus-dev \
        libsndfile-dev \
        libspeexdsp-dev \
        libfdk-aac-dev \
        libqt5gui5 \
        libqt5widgets5 \
        qtbase5-dev \
        qtbase5-dev-tools \
        qt5-qmake \
    && rm -rf /var/lib/apt/lists/*