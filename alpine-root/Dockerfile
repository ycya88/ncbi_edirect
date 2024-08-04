# syntax=docker/dockerfile:1

# renovate: datasource=custom.ncbi depName=edirect
ARG EDIRECT_VERSION=22.4.20240802

# renovate: datasource=docker depName=alpine
ARG ALPINE_VERSION=3.20

FROM alpine:${ALPINE_VERSION} AS base

LABEL \
    org.opencontainers.image.description="NCBI EDirect tool for Entrez query and retrieval" \
    org.opencontainers.image.authors="ycya88@gmail.com" \
    org.opencontainers.image.url="https://hub.docker.com/r/ycya88/ncbi_edirect" \
    org.opencontainers.image.vendor="NCBI/NLM/NIH" \
    org.opencontainers.image.source="https://github.com/ycya88/ncbi_edirect" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.os="alpine"

# Install required packages
RUN apk update \
    && apk add --no-cache bash curl perl perl-xml-simple perl-libwww perl-net-mpd build-base coreutils \
    && rm -rf /var/cache/apk/*

FROM base AS build

WORKDIR /root/edirect

RUN sh -c "$(curl -fsSL https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"

COPY ./installconfirm /root

ENV PATH="/root/edirect:${PATH}"

# Clear and enable Alpine caching
RUN mkdir -p /var/cache/apk \
    && ln -s /var/cache/apk /etc/apk/cache \
    && rm -rf /var/cache/apk/*

USER root
