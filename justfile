# show 'just' recipes (default)
default:
  just --list

alias pf := push-force

## Recipes 'just' — https://just.systems/man/en/chapter_20.html

# initialize Codespace
init-codespace: init-local
  cp .vscode/settings.json.dev .vscode/settings.json
  # Rscript -e "pak::lockfile_install(update = FALSE)"

# initialize local environment
init-local:
  uv sync --all-extras
  uv run pre-commit install --allow-missing-config
  uv run nbdev_install_hooks

# lint and format code
lint:
  Rscript -e "styler::style_dir(exclude_dirs = c('.venv')); lintr::lint_dir()"
  uv run ruff format .
  uv run ruff check --fix .
  uv run pre-commit run --all-files

# create new post
post:
  uv run snippets/create-post.py

# render and publish page
publish:
  quarto publish gh-pages --no-prompt
  git push origin gh-pages
  git push origin main

# push Git and force updates
push-force:
  git push --force-with-lease

# pull Git and force updates
pull-force branch:
  git fetch --all
  git reset --soft origin/{{branch}}
  @echo "Creating backup with 'git stash'"
  git stash --message "pull-force stash backup"
  git reset --hard origin/{{branch}}
