# install post packages
Rscript snippets/packages-install.R
uv pip install -r snippets/requirements-posts.txt

# remove freeze folder for full rebuild
rm -r _freeze

# render all posts
quarto render
