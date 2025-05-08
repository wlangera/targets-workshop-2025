# Filter data cube on coordinate uncertainty
filter_coord_uncertainty <- function(data_cube, max_uncertainty) {
  mincoordinateuncertaintyinmeters <- NULL

  data_cube |>
    dplyr::filter(mincoordinateuncertaintyinmeters <= max_uncertainty)
}

# Join datasets
