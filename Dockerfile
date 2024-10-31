FROM quay.io/raywen/esp-idf:v5.3.1
MAINTAINER Raymond Wen

ENV MATTER_VERSION v1.3

ENV ESP_ROOT_DIR /opt/
WORKDIR ${ESP_ROOT_DIR}

RUN pwd

RUN apt-get install -y git gcc g++ pkg-config libssl-dev libdbus-1-dev libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev python3-pip unzip libgirepository1.0-dev libcairo2-dev
RUN git clone -b release/${MATTER_VERSION} --depth 1 https://github.com/espressif/esp-matter.git
RUN cd esp-matter && git submodule update --init --depth 1
RUN cd esp-matter/connectedhomeip/connectedhomeip && ./scripts/checkout_submodules.py --platform esp32 linux --shallow
RUN cd esp-matter && ./install.sh
