plot_richness <- function(richness_cube, ref_grid) {
  require("ggplot2")
  n_species <- NULL

  # Join richness and reference grid
  joined_sf <- dplyr::full_join(richness_cube, ref_grid, by = "mgrscode") |>
    sf::st_sf(sf_column_name = "geom", crs = sf::st_crs(ref_grid))

  # Visualise result
  p <- ggplot(joined_sf) +
    geom_sf(aes(fill = n_species)) +
    theme_minimal()

  return(p)
}
