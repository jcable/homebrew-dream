# Working in the Dev Container

Open this repository in a devcontainer using VS Code:

- In Command Palette: `Dev Containers: Reopen in Container` (or `Remote-Containers: Reopen in Container`).

Quick verification and build commands to run inside the container:

```bash
# Verify CMake is available
cmake --version

# Create an out-of-source build directory and configure with Ninja
mkdir -p build
cmake -S . -B build -G Ninja
cmake --build build -j
```

If this project requires Qt qmake or other build steps, use the normal project-specific build flow (e.g., `qmake && make`).

To run graphical (Qt) applications from inside the container, either run the container with access to your host X server (eg. `-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix`) or use the Remote - Containers / Dev Container UI features that support GUI forwarding. You may also need to allow connections with `xhost +local:root` on the host.

If you run into missing packages or tools, please open an issue or ask here and I'll update the devcontainer config.
