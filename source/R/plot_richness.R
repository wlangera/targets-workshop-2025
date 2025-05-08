plot_richness <- function(data_cube, ref_grid) {
  joined_sf <- dplyr::left_join(data_cube, ref_grid, by = "mgrscode") |>
    sf::st_sf(sf_column_name = "geom", crs = sf::st_crs(ref_grid))
  
  
}