# parent image — R version specified to pin packages (see 'rocker-versioned2')
# https://cran.r-project.org/doc/manuals/r-release/NEWS.html
FROM rocker/tidyverse:4.3.1

WORKDIR /home/rstudio

# install Linux dependencies (required for Python, R, Quarto)
RUN apt-get -y update && apt-get install -y --no-install-recommends \
    curl \
    gdebi-core \
    python3 \
    python3-dev \
    python3-pip \
    python-is-python3

# install R packages — development tools and code style
RUN install2.r lintr pak renv styler

# install R packages — data analysis
RUN install2.r \
    ggeffects \
    patchwork \
    reactable \
    rmarkdown \
    skimr

# install Quarto
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN install2.r markdown reticulate
RUN quarto install tinytex

# install Python packages
COPY requirements.txt .

RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt
