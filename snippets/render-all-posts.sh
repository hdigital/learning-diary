#!/bin/bash

# sync local Python environment
uv sync --all-groups

# install R packages
Rscript -e "pak::lockfile_install(update = FALSE)"

# remove freeze folder for full rebuild
rm -rf _freeze

# render all posts
quarto render
