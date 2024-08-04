#!/usr/bin/env bash

curl -fsSL https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/versions/ | \
sed -n 's|.*href="[^"]*">\([^<]*\)/</a>.*|\1|p' | \
sort -n | \
tail -n 1
