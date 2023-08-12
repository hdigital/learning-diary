# get packages used in project folder
deps <- unique(renv::dependencies()[["Package"]])

# install project packages
pak::pkg_install(deps, ask = FALSE)

# create lock file of versions for all packages
# renv::snapshot()
