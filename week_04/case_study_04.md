Case Study 04
================
Fatimo Biobaku
September 29, 2020

## Load packages

``` r
library(tidyverse)
```

    ## -- Attaching packages ----------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.2     v purrr   0.3.4
    ## v tibble  3.0.3     v dplyr   1.0.2
    ## v tidyr   1.1.2     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.5.0

    ## -- Conflicts -------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(nycflights13)
```

## View data and join relevant tables

``` r
view(flights)
view(airlines)
view(airports)
view(weather)
view(planes)

flight_2 <- flights %>%
  select(origin, dest, distance) %>%
  left_join(airports, by = c("dest"="faa"))
```

## Select relevant data and arrange the distance column in descending order for easy visualization of the maximum distance

``` r
flight_2 %>%
  select(origin, dest, distance, name) %>%
  arrange(desc(distance)) %>%
  slice(1L) %>%
  select(name)
```

    ## # A tibble: 1 x 1
    ##   name         
    ##   <chr>        
    ## 1 Honolulu Intl

*The name of the farthest destination airport: Honolulu International*
