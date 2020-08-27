
# cspsreports

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

The goal of the {cspsreports} package is to create PDF reports from your Civil Service People Survey (CSPS) microdata.

Find the [Civil Service People Survey on GOV.UK](https://www.gov.uk/government/collections/civil-service-people-surveys).

The package is a work in progress with no guarantees. 

## Installation

You can install the development version of {cspsreports} from GitHub.

To install:

``` r
install.packages("remotes")  # if not already installed
remotes::install_github("co-analysis/cspsreports")
```

This assumes you've added a GitHub personal access token (PAT) to your .Renviron. Run `usethis::browse_github_pat()` to open the browser and generate an auth token, then `usethis::edit_r_environ()` to open the .Renviron file. Add the token on a new line in the form `GITHUB_PAT=<your token>`, save and restart R. Learn more from the [Happy Git with R](https://happygitwithr.com/github-pat.html) book.

## Use

Section to be completed.

## Contributing

Please note that the {cspsreports} project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

Cabinet Office users, please adhere to [the co-analysis Git and GitHub code of conduct and usage policy](https://docs.google.com/document/d/1CuNgKla1BwSVOmGkPmsq0S-OM4emP-iXrgnm7EeILWM/edit?usp=sharing).

Please [file an issue](https://github.com/co-analysis/csstatsbulletin/issues) where possible and provide meaningful commentary in any commits and pull requests.

## Copyright

Copyright (c) 2020 Crown Copyright (Cabinet Office).

The code in this repository is released under the MIT license as per [The GDS Way](https://gds-way.cloudapps.digital/manuals/licensing.html#use-mit).
