# Load the packages needed to define the pipeline
library(targets)
library(here)

# Declare packages that the targets themselves need, as well as other settings
tar_option_set(packages = c("readr", "dplyr", "ggplot2"))

# Load custom functions and small input objects into the R session
source(here("source", "R", "example_functions.R"))
data_path <- here("data")

# Write the pipeline: a list of target objects
list(
  tar_target(file, file.path(data_path, "example_data.csv"), format = "file"),
  tar_target(data, get_data(file)),
  tar_target(model, fit_model(data)),
  tar_target(plot, plot_model(model, data))
)