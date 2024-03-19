# show 'just' recipes (default)
default:
  just --list

alias pf := push-force

## Recipes 'just' — https://just.systems/man/en/chapter_20.html

# initialize Codespace
codespace-init: venv
  cp .vscode/settings.json.dev .vscode/settings.json
  . .venv/bin/activate; pre-commit install --allow-missing-config
  . .venv/bin/activate; nbdev_install_hooks

# update Python packages
pip-update:
  uv pip compile --generate-hashes -U -o requirements.txt requirements.in
  uv pip sync requirements.txt

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

# recreate Python environment
venv:
  uv venv
  uv pip sync requirements.txt
