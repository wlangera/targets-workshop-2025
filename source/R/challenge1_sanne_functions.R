get_data <- function(data_file, resource) {
  data <- frictionless::read_package(data_file)
  read_resource(data, resource)
}

prepare_data <- function(data) {
  data_filtered <-
    data %>% 
    dplyr::filter(mincoordinateuncertaintyinmeters <= 10000) %>%
    dplyr::filter(year == 2020)
  return(data_filtered)
}

calc_richness <- function(data_filtered) {
  richness <- data_filtered %>%
    dplyr::summarise(
      richness = dplyr::n_distinct(data_filtered), .by = mgrscode
    )
  return(richness)
}

vis_richness <- function(richness, grid) {
  richness %>%
    dplyr::full_join(grid, by = "mgrscode") %>%
    sf::st_sf(sf_column_name = "geom", crs = sf::st_crs(grid)) 
    ggplot2::ggplot() +
    ggplot2::geom_sf(aes(fill = richness)) +
    ggplot2::scale_fill_viridis_c() +
    ggplot2::theme_minimal() +
    ggplot2::labs(title = "Species richness per grid cell")
}

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
# 
# Challenge 2
# Biodiversity building blocks for policy
# Build further on your pipeline from Challenge 1
# Filter the data
# 2020
# Top 20 species that occur in most grid cells
# Use dynamic branching to create presence-absence plots for each species separately
# Add the plots in your external R Markdown report