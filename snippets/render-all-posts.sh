# install post packages
Rscript -e "pak::lockfile_install(update = FALSE)"
uv pip install -r snippets/requirements-posts.txt

# remove freeze folder for full rebuild
rm -r _freeze

# render all posts
quarto render
