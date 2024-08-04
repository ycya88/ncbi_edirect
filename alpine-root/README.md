# NCBI EDirect docker image

[Entrez Direct](https://www.ncbi.nlm.nih.gov/books/NBK179288/) command line applications in a Docker image.

Alpine Cloud builds for cloud-native automation. Not intended for production use.

## Quick start

Update latest image

```bash
docker pull ghcr.io/ycya88/ncbi-docker-alpine/edirect:latest
```

Quick interactive terminal

```bash
docker exec -it $(docker run -itd ghcr.io/ycya88/ncbi-docker-alpine/edirect:latest /bin/bash) /bin/bash
```

## Example usage

### Fetch a nucleotide sequence in FASTA format

```bash
docker run --rm -it ghcr.io/ycya88/ncbi-docker-alpine/edirect:latest /bin/bash -c "efetch -db nucleotide -id u00001 -format fasta"
docker run --rm -it ghcr.io/ycya88/ncbi-docker-alpine/edirect:latest /bin/bash -c "esearch -db nucleotide -query u00001 | efetch -format fasta"
```

### Check installation

```bash
docker run --rm -it ghcr.io/ycya88/ncbi-docker-alpine/edirect:latest /bin/bash -c "./installconfirm"
```
