FROM gitpod/workspace-full

RUN sudo apt-get update && \
    sudo apt-get install gettext libncurses5 libxkbcommon0 libtinfo5 -y

USER gitpod

# ------------------------------------
# Install grain support
# ------------------------------------
RUN sudo curl -L --output /usr/local/bin/grain \
https://github.com/grain-lang/grain/releases/download/grain-v0.5.1/grain-linux-x64 \
&& sudo chmod +x /usr/local/bin/grain

# ------------------------------------
# Install Wasi Runtimes
# ------------------------------------
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -v 0.10.0 && \
    curl https://get.wasmer.io -sSfL | sh && \
    curl https://wasmtime.dev/install.sh -sSf | bash
