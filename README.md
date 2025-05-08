# targets workshop BMK (2025)

Workshop of {[targets](https://books.ropensci.org/targets/)} R package INBO 2025.

## Which packages to install for completing the exercises.

To work on the exercises, install the following packages.

```r
install.packages(c("targets", "tarchetypes", "frictionless", "here"))
```

The following packages are suggested for data handling and visualisation.

```r
install.packages(c("sf", "dplyr", "ggplot2"))
```

## Useful links to complete the exercises

**1.** In the exercises, we will load the example data from the **b3data** data package.
How to do this is explained in the README of [this repo](https://github.com/b-cubed-eu/b3data-scripts).

**2.** {targets} R package documentation ([link](https://docs.ropensci.org/targets/)).

**3.** {tarchetypes} R package documentation ([link](https://docs.ropensci.org/tarchetypes/)).

## Coding style and spelling

Within this repository, you can check coding style and spelling using the [checklist](https://github.com/inbo/checklist) package:

```r
# Check coding style
checklist::check_lintr()

# Check spelling
checklist::check_spelling()
```
