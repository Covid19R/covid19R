
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid19R

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/covid19R)](https://CRAN.R-project.org/package=covid19R)
[![Travis build
status](https://travis-ci.org/Covid19R/covid19R.svg?branch=master)](https://travis-ci.org/Covid19R/covid19R)
<!-- badges: end -->

The goal of covid19R is to provide a single package that allows users to
access all of the tidy covid-19 datasets collected by data packages that
implement the covid19R tidy data standard. It provides access to
multiple data sets that meet a tidy data standard.

To learn more abou the Covid19R project, check [our extensive
documentation](https://covid19r.github.io/documentation) about data
standards, how to get your data added to this list, and more.

## Installation

<!--
You can install the released version of covid19R from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("covid19R")
```

-->

You can install the development version from
[github](http://github.com/) with:

``` r
remotes::install_github("covid19r/covid19r")
```

## Getting the Data Information

To see what datasets are available, use `get_covid19_data_info()`

``` r
library(covid19R)

data_info <- get_covid19_data_info()

head(data_info) %>% knitr::kable()
```

| data\_set\_name          | package\_name  | function\_to\_get\_data           | data\_details                                                                                                                                                                                                                                                     | data\_url                                                                             | license\_url                                                    | data\_types                                                                                                                                                                                                                                                                                                                                                  | location\_types                                | spatial\_extent | has\_geospatial\_info | get\_info\_passing | refresh\_status | last\_refresh\_update |
| :----------------------- | :------------- | :-------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------ | :-------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------- | :-------------- | :-------------------- | :----------------- | :-------------- | :-------------------- |
| covid19nytimes\_states   | covid19nytimes | refresh\_covid19nytimes\_states   | Open Source data from the New York Times on distribution of confirmed Covid-19 cases and deaths in the US States. For more, see <https://www.nytimes.com/article/coronavirus-county-data-us.html> or the readme at <https://github.com/nytimes/covid-19-data>.    | <https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv>      | <https://github.com/nytimes/covid-19-data/blob/master/LICENSE>  | cases\_total, deaths\_total                                                                                                                                                                                                                                                                                                                                  | state                                          | country         | FALSE                 | TRUE               | Passed          | 2020-05-04 16:08:36   |
| covid19nytimes\_counties | covid19nytimes | refresh\_covid19nytimes\_counties | Open Source data from the New York Times on distribution of confirmed Covid-19 cases and deaths in the US by County. For more, see <https://www.nytimes.com/article/coronavirus-county-data-us.html> or the readme at <https://github.com/nytimes/covid-19-data>. | <https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv>      | <https://github.com/nytimes/covid-19-data/blob/master/LICENSE>  | cases\_total, deaths\_total                                                                                                                                                                                                                                                                                                                                  | state                                          | country         | FALSE                 | TRUE               | Passed          | 2020-05-04 16:08:39   |
| covid19france            | covid19france  | refresh\_covid19france            | Open Source data from opencovid19-fr on distribution of confirmed Covid-19 cases and deaths in the US States. For more, see <https://github.com/opencovid19-fr/data>.                                                                                             | <https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv> | <https://github.com/opencovid19-fr/data/blob/master/LICENSE>    | confirmed, dead, icu, hospitalized, recovered, discovered                                                                                                                                                                                                                                                                                                    | county, region, country, overseas collectivity | country         | FALSE                 | TRUE               | Passed          | 2020-05-04 16:08:47   |
| CanadaC19\_cases         | CanadaC19      | refresh\_CanadaC19\_cases         | Open Source data from multiple public reporting data throughout Canada. For more, see <https://github.com/ishaberry/Covid19Canada>.                                                                                                                               | <https://raw.githubusercontent.com/ishaberry/Covid19Canada/master/cases.csv>          | <https://github.com/debusklaneml/CanadaC19/blob/master/LICENSE> | cases\_new                                                                                                                                                                                                                                                                                                                                                   | state                                          | state           | FALSE                 | TRUE               | Passed          | 2020-05-04 16:08:48   |
| covid19us                | covid19us      | refresh\_covid19us                | Open Source data from COVID Tracking Project on the distribution of Covid-19 cases and deaths in the US. For more, see <https://github.com/opencovid19-fr/data>.                                                                                                  | <https://covidtracking.com/api>                                                       | <https://github.com/aedobbyn/covid19us/blob/master/LICENSE.md>  | positive, negative, pending, hospitalized\_currently, hospitalized\_cumulative, in\_icu\_currently, in\_icu\_cumulative, on\_ventilator\_currently, on\_ventilator\_cumulative, recovered, death, hospitalized, total, total\_test\_results, death\_increase, hospitalized\_increase, negative\_increase, positive\_increase, total\_test\_results\_increase | state                                          | country         | FALSE                 | TRUE               | Passed          | 2020-05-04 16:08:50   |

## Accessing data

Once you have figured out what dataset you want, you can access it with
`get_covid19_dataset()`

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

nytimes_states <- get_covid19_dataset("covid19nytimes_states")
#> Parsed with column specification:
#> cols(
#>   date = col_date(format = ""),
#>   location = col_character(),
#>   location_type = col_character(),
#>   location_code = col_character(),
#>   location_code_type = col_character(),
#>   data_type = col_character(),
#>   value = col_double()
#> )

nytimes_states %>%
  filter(date == max(date)) %>%
  filter(data_type == "cases_total") %>%
  arrange(desc(value)) %>%
  head()
#> # A tibble: 6 x 7
#>   date       location location_type location_code location_code_t… data_type
#>   <date>     <chr>    <chr>         <chr>         <chr>            <chr>    
#> 1 2020-05-03 New York state         36            fips_code        cases_to…
#> 2 2020-05-03 New Jer… state         34            fips_code        cases_to…
#> 3 2020-05-03 Massach… state         25            fips_code        cases_to…
#> 4 2020-05-03 Illinois state         17            fips_code        cases_to…
#> 5 2020-05-03 Califor… state         06            fips_code        cases_to…
#> 6 2020-05-03 Pennsyl… state         42            fips_code        cases_to…
#> # … with 1 more variable: value <dbl>
```

## The covid19R Data Standard

While many data sets have their own unique additional columns (e.g.,
Latitude, Longitude, population, etc.), all datasets have the following
columns and are arranged in a long format:

  - date - The date in YYYY-MM-DD form
  - location - The name of the location as provided by the data source.
    The counties dataset provides county and state. They are combined
    and separated by a `,`, and can be split by `tidyr::separate()`, if
    you wish.
  - location\_type - The type of location using the covid19R controlled
    vocabulary. Nested locations are indicated by multiple location
    types being combined with a \`\_
  - location\_code - A standardized location code using a national or
    international standard. In this case, FIPS state or county codes.
    See
    <https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code>
    and <https://en.wikipedia.org/wiki/FIPS_county_code> for more
  - location\_code\_type The type of standardized location code being
    used according to the covid19R controlled vocabulary. Here we use
    `fips_code`
  - data\_type - the type of data in that given row. Includes
    `total_cases` and `total_deaths`, cumulative measures of both.
  - value - number of cases of each data type

## Vocabularies

The `location_type`, `location_code_type`, and `data_type` from datasets
and `spatial_extent` from the data info table all have their own
controlled vocabularies. Others might be introduced as the collection of
packages matures. To see the possible values of a standardized
vocabulary, use `get_covid19_controlled_vocab()`

``` r
get_covid19_controlled_vocab("location_type") %>%
  knitr::kable()
```

| location\_type | description                                                                   |
| :------------- | :---------------------------------------------------------------------------- |
| continent      | continental scale                                                             |
| country        | a country with soverign borders                                               |
| state          | a spatial area inside that country such as a state, province, canton, etc.    |
| county         | a spatial area demarcated within a state                                      |
| city           | a single municipality - the smallest spatial grain of government in a country |
| canton         | the cantons of Switzerland and Principality of Liechtenstein (FL)             |
