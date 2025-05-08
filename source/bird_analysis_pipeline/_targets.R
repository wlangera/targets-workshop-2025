# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# Load packages required to define the pipeline:
library(targets)

# Set target options:
tar_option_set(
  packages = c("frictionless", "sf", "dplyr", "ggplot2")
)

# Load custom functions and small input objects into the R session:


# Write the pipeline, a list of target objects:
list(
  tar_target(file, file.path(data_path, "example_data.csv"), format = "file"),
  tar_target(data, get_data(file)),
  tar_target(model, fit_model(data)),
  tar_target(plot, plot_model(model, data))
)
