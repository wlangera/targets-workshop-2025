# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# Load packages required to define the pipeline:
library(targets)
library(here)

# Set target options:
tar_option_set(
  packages = c("frictionless", "sf", "dplyr", "ggplot2")
)

# Load custom functions and small input objects into the R session:
source(here("source", "R", "download_data.R"))
source(here("source", "R", "prepare_data.R"))

# Write the pipeline, a list of target objects:
list(
  tar_target(
    bird_cube_belgium,
    download_tabular_data(
      record = 15211029,
      resource = "bird_cube_belgium_mgrs10"
    )
  ),
  tar_target(
    mgrs10_refgrid,
    download_gpkg_data(
      record = 15211029,
      resource = "mgrs10_refgrid_belgium"
    )
  ),
  tar_target(
    filtered_bird_cube,
    filter_coord_uncertainty(
      data_cube = bird_cube_belgium,
      max_uncertainty = 100000
    )
  )
)
