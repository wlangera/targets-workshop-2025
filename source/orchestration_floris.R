# This could also be an R markdown file.

library(targets)
library(dplyr)
projroot <- rprojroot::find_root(rprojroot::is_rstudio_project)

# EXERCISE 1 --------------------------------------------------------------

dir.create(file.path(projroot, "source/my_pipeline"), recursive = TRUE)
use_targets(file.path(projroot, "source/my_pipeline/_targets.R"), overwrite = TRUE)

my_script <- file.path(projroot, "source/my_pipeline/_targets.R")
my_store <- file.path(projroot, "source/my_pipeline/_targets")

tar_make(
  script = my_script,
  store = my_store
)

tar_visnetwork(script = my_script, store = my_store)

tar_read(sprichplot, store = my_store)



