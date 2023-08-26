# install post packages
Rscript snippets/packages-install.R
python3 -m pip install -r snippets/requirements-posts.txt

# remove freeze folder for full rebuild
rm -r _freeze

# render all posts
quarto render
