plot_presence <- function(data_cube, ref_grid) {
  require("ggplot2")
  observed <- n <- NULL

  # Join richness and reference grid
  joined_sf <- dplyr::full_join(data_cube, ref_grid, by = "mgrscode") |>
    sf::st_sf(sf_column_name = "geom", crs = sf::st_crs(ref_grid))

  # Calculate presence-absence
  presence_sf <- joined_sf |>
    dplyr::mutate(observed = !is.na(n)) |>
    dplyr::select("mgrscode", "observed", "geom")

  # Visualise result
  p <- ggplot(presence_sf) +
    geom_sf(aes(fill = observed)) +
    ggtitle(unique(data_cube$species)) +
    theme_minimal()

  return(p)
}
