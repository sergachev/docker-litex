FROM lerwys/iverilog

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
RUN wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py && \
    python3 litex_setup.py init install
