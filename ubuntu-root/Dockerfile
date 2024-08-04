# syntax=docker/dockerfile:1

# renovate: datasource=custom.ncbi depName=edirect
ARG EDIRECT_VERSION=22.4.20240802

# renovate: datasource=docker depName=ubuntu
ARG UBUNTU_VERSION=oracular-20240617

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

WORKDIR /root/edirect

RUN sh -c "$(curl -fsSL https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"

COPY ./installconfirm /root

ENV PATH="/root/edirect:${PATH}"

USER root
