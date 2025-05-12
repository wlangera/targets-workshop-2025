get_top_species <- function(data_cube, top_n) {
  species <- n_cells <- NULL

  data_cube |>
    # Count number of grid cells per species
    dplyr::count(species, name = "n_cells") %>%
    # Get top species
    dplyr::slice_max(n_cells, n = top_n) %>%
    dplyr::pull(species)
}
