FROM lerwys/iverilog

ENV LITEX_VERSION 0116b2b7088fcc9b072ef42ea957d6e7ee527f12

# LABEL \
#       com.github.lerwys.docker.dockerfile="Dockerfile" \
#       com.github.lerwys.vcs-type="Git" \
#       com.github.lerwys.vcs-url="https://github.com/lerwys/docker-litex.git"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
    apt-get install -y  --no-install-recommends \
        git \
        python3 \
        python3-setuptools \
        wget \
        tar \
        automake \
        autoconf \
        make \
        gzip \
        ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /litex
RUN wget https://raw.githubusercontent.com/enjoy-digital/litex/${LITEX_VERSION}/litex_setup.py && \
    python3 litex_setup.py init install
