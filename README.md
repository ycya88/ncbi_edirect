# NCBI EDirect Docker Images

[![Schedule Update Check (edirect)](https://github.com/ycya88/ncbi_edirect/actions/workflows/edirect_schedule.yml/badge.svg)](https://github.com/ycya88/ncbi_edirect/actions/workflows/edirect_schedule.yml)

This repository provides Docker images for the NCBI EDirect command-line applications.

## Overview

The EDirect tools offer a suite of command-line applications for accessing and querying NCBI databases. This Docker image simplifies the setup and usage of these tools.

**Docker Hub Repository:** [ycya88/ncbi_edirect](https://hub.docker.com/r/ycya88/ncbi_edirect)

The Docker image defaults to:
- **Base Image:** Ubuntu
- **Mode:** User

Default tags include `latest` and specific EDirect version tags.

## Quick Start

### Update to the Latest Image

To pull the latest image:

```bash
docker pull ycya88/ncbi_edirect:latest
```

### Interactive Terminal

To start an interactive terminal session:

```bash
docker exec -it $(docker run -itd ycya88/ncbi_edirect:latest /bin/bash) /bin/bash
```

### Example Usage

Fetch a Nucleotide Sequence in FASTA Format

To fetch a nucleotide sequence by ID:

```bash
docker run --rm -it ycya88/ncbi_edirect:latest /bin/bash -c "efetch -db nucleotide -id u00001 -format fasta"
```

To search and fetch a nucleotide sequence:

```bash
docker run --rm -it ycya88/ncbi_edirect:latest /bin/bash -c "esearch -db nucleotide -query u00001 | efetch -format fasta"
```

### Check Installation

To verify the installation:

```bash
docker run --rm -it ycya88/ncbi_edirect:latest /bin/bash -c "./installconfirm"
```

## Reference

https://github.com/ncbi/docker
