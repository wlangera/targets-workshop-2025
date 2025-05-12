# Filter data cube on coordinate uncertainty
filter_coord_uncertainty <- function(data_cube, max_uncertainty) {
  mincoordinateuncertaintyinmeters <- NULL #nolint: object_length_linter

  data_cube |>
    dplyr::filter(mincoordinateuncertaintyinmeters <= max_uncertainty)
}

# Count number of species
calculate_richness <- function(data_cube) {
  require(dplyr)
  species <- mgrscode <- NULL

  data_cube  |>
    # Count number of species
    dplyr::summarise(
      n_species = dplyr::n_distinct(species),
      .by = mgrscode
    )
}

# Filter data cube on year
filter_year <- function(data_cube, time_point) {
  year <- NULL

  data_cube |>
    dplyr::filter(year == time_point)
}
