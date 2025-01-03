FROM rocker/tidyverse:4.4

WORKDIR /home/rstudio

# Install Linux dependencies (required for Python, R, Quarto)
RUN apt-get -y update && apt-get install -y --no-install-recommends \
  curl \
  gdebi-core \
  python3 \
  python3-dev \
  python3-pip \
  python3-venv \
  python-is-python3

# Install Quarto
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN quarto install tinytex

# Install R packages with 'pak'
RUN install2.r pak
COPY pkg.lock .
RUN R -e 'pak::lockfile_install()'

# Install Python packages with 'uv'
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY pyproject.toml uv.lock ./
RUN uv sync
