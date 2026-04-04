#!/usr/bin/env Rscript

# Install packages from lockfile; always exits cleanly on failure
tryCatch(
  pak::lockfile_install(update = FALSE),
  error = function(cond) {
    message("Lockfile install failed:")
    message(conditionMessage(cond))
    NA
  }
)
