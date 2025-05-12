# targets workshop BMK (2025)

[Langeraert, Ward![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0002-5900-8109)[^aut][^INBO]
European Union's Horizon Europe Research and Innovation Programme (ID No 101059592)[^fnd]

[^fnd]: funder
[^aut]: author
[^INBO]: Research Institute for Nature and Forest (INBO), Herman Teirlinckgebouw, Havenlaan 88 PO Box 73, B-1000 Brussels, Belgium

Workshop of {[targets](https://books.ropensci.org/targets/)} R package for team BMK (INBO, 2025).

The slides are provided in `slides/slides.qmd`.
They can be rendered using different tools as explained [here](https://quarto.org/docs/get-started/hello/rstudio.html#rendering).

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
