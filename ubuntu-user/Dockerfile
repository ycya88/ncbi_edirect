# syntax=docker/dockerfile:1

# renovate: datasource=custom.ncbi depName=edirect
ARG EDIRECT_VERSION=22.4.20240802

# renovate: datasource=docker depName=ubuntu
ARG UBUNTU_VERSION=24.04

FROM ubuntu:${UBUNTU_VERSION} AS base

LABEL \
    org.opencontainers.image.description="NCBI EDirect tool for Entrez query and retrieval" \
    org.opencontainers.image.authors="ycya88@gmail.com" \
    org.opencontainers.image.url="https://hub.docker.com/r/ycya88/ncbi_edirect" \
    org.opencontainers.image.vendor="NCBI/NLM/NIH" \
    org.opencontainers.image.source="https://github.com/ycya88/ncbi_edirect" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.os="ubuntu"

# Install required packages
RUN apt-get -y -m update \
    && apt-get install -y curl libxml-simple-perl libwww-perl libnet-perl build-essential \
    && rm -rf /var/lib/apt/lists/*

FROM base AS build

ARG username=docker
ARG grpname=docker

RUN groupadd ${grpname} \
    && useradd --no-log-init -r -g ${grpname} ${username} \
    && mkdir -vp /home/${username} \
    && chown -Rc ${username}:${grpname} /home/${username}

USER ${username}
WORKDIR /home/${username}

RUN sh -c "$(curl -fsSL https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"

COPY --chown=${username}:${grpname} installconfirm /home/${username}/

ENV PATH="/home/${username}/edirect:${PATH}"
ENV EMAIL=docker@ncbi.nlm.nih.gov

CMD ["/bin/bash"]
