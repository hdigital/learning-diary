# install 'pak' to use modern package installer
if (!"pak" %in% installed.packages()) {
  install.packages("pak", repos = getOption("repos")[[1]])
}

# get packages used in project folder
deps <- unique(renv::dependencies()[["Package"]])

# install project packages
pak::pkg_install(deps, ask = FALSE)

# upgrade all project packages
# pak::pkg_install(deps, ask = FALSE, upgrade = TRUE)

# create lock file of versions for all packages
# renv::snapshot()
