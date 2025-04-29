# nolint start
# Functions for example pipeline
get_data <- function(file) {
  data_set <- read_csv(file, col_types = cols())
  data_set[complete.cases(data_set), ]
}

fit_model <- function(data) {
  lm(Ozone ~ Temp, data) |>
    coefficients()
}

plot_model <- function(model, data) {
  ggplot(data) +
    geom_point(aes(x = Temp, y = Ozone)) +
    geom_abline(intercept = model[1], slope = model[2])
}
# nolint end
