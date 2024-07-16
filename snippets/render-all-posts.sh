#!/bin/bash

# remove existing Python environment
rm -rf .venv

# create and sync local Python environment
python -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt

# install post packages
Rscript -e "pak::lockfile_install(update = FALSE)"
python -m pip install -r snippets/requirements-posts.txt

# remove freeze folder for full rebuild
rm -rf _freeze

# render all posts
quarto render
