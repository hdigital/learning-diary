# show 'just' recipes (default)
default:
  just --list


## Recipes 'just' — https://just.systems/man/en/chapter_20.html

# create environment to render all posts
init-all: init-local
  uv sync --all-groups
  Rscript -e "pak::lockfile_install(update = FALSE)"
  quarto install tinytex

# initialize Codespace
init-codespace: init-local
  cp .vscode/settings.json.dev .vscode/settings.json

# initialize local environment
init-local:
  uv sync
  uv run pre-commit install --allow-missing-config
  uv run nbdev_install_hooks

# lint and format code
lint:
  Rscript -e "styler::style_dir(exclude_dirs = c('.venv')); lintr::lint_dir()"
  uv run ruff format .
  uv run ruff check --fix .
  uv run typos --write-changes .
  uv run pre-commit run --all-files

# create new post
post:
  uv run snippets/create-post.py

# render and publish page
publish:
  quarto publish gh-pages --no-prompt
  git push origin gh-pages
  git push origin main

# update all packages (py/R)
update-all: update-py
  ./snippets/r-packages-update.R

# update Python packages
update-py:
  uv tree --outdated --depth 1
  uv lock --upgrade
  uv sync
  uv run -- pre-commit autoupdate
  uv run -- pre-commit run --all-files
