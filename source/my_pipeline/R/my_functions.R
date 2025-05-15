clean_birdcube <- function(bc) {
  bc |> filter(mincoordinateuncertaintyinmeters <= 1e4)
}

calculate_sprich <- function(cbc) {
  cbc |> 
    summarize(
      sprichness = n_distinct(specieskey),
      .by = mgrscode
    )
}

plot_sprich <- function(grid, spr) {
  grid |> 
    full_join(spr, join_by(mgrscode)) |> 
    ggplot(aes(fill = sprichness)) +
    geom_sf()
}