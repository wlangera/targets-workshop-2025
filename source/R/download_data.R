# Download resources from frictionless data package on Zenodo
download_tabular_data <- function(record, resource) {
  require(frictionless)
  
  data_package <- read_package(
    paste0("https://zenodo.org/records/", record, "/files/datapackage.json")
  )
  
  return(read_resource(data_package, resource))
}

download_gpkg_data <- function(record, resource) {
  spatial_resource <- sf::st_read(
    paste0("https://zenodo.org/records/", record, "/files/", resource, ".gpkg"),
    quiet = TRUE
  )
  
  return(list(spatial_resource))
}
