# Load packages required to define the pipeline:
library(targets)
library(here)

# Set target options:
tar_option_set(
  packages = c("frictionless", "sf", "ggplot2", "dplyr") 
)

source(here("source", "R", "challenge1_sanne_functions.R"))

list(
  tar_target(
    birds, get_data("https://zenodo.org/records/15211029/files/datapackage.json", "bird_cube_belgium_mgrs10")
  ),
  tar_target(
    mgrs10_belgium, sf::st_read(
      "https://zenodo.org/records/15211029/files/mgrs10_refgrid_belgium.gpkg",
      quiet = TRUE)
  ),
  tar_target(
    birds_filtered, prepare_data(birds)
  ),
  tar_target(
    species_richness, calc_richness(birds_filtered)
  ),
  tar_target(
    plot, plot_richness(species_richness, mgrs10_belgium)
  )
)
