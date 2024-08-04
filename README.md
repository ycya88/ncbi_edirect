# NCBI ncbi-edirect docker images

[![Schedule Update Check (edirect)](https://github.com/ycya88/ncbi-edirect/actions/workflows/edirect_schedule.yml/badge.svg)](https://github.com/ycya88/ncbi-edirect/actions/workflows/edirect_schedule.yml)

[Entrez Direct](https://www.ncbi.nlm.nih.gov/books/NBK179288/) command line applications in a Docker image.

NCBI edirect in Alpine for cloud-native automation use cases. Not intended for production use. 

https://hub.docker.com/r/ycya88/ncbi_edirect

## Quick start

Update latest image

```bash
docker pull ycya88/ncbi_edirect:latest
```

Quick interactive terminal

```bash
docker exec -it $(docker run -itd ycya88/ncbi_edirect:latest /bin/bash) /bin/bash
```

## Example usage

### Fetch a nucleotide sequence in FASTA format

```bash
docker run --rm -it ycya88/ncbi_edirect:latest /bin/bash -c "efetch -db nucleotide -id u00001 -format fasta"
docker run --rm -it ycya88/ncbi_edirect:latest /bin/bash -c "esearch -db nucleotide -query u00001 | efetch -format fasta"
```

### Check installation

```bash
docker run --rm -it ycya88/ncbi_edirect:latest /bin/bash -c "./installconfirm"
```

## Reference

https://github.com/ncbi/docker
