
<!-- README.md is generated from README.Rmd. Please edit that file -->

# strava

<!-- badges: start -->
<!-- badges: end -->

The goal of strava is to access the strava API from R.

## Authenticate

First, create an API application from your personal strava account, read
more here: <https://developers.strava.com/docs/getting-started/>

Then store the following credentials in your `.Renviron` file that you
can find with `usethis::edit_r_environ`:

-   `STRAVA_ID`
-   `STRAVA_SECRET`

Refresh your R session and make a request:

``` r
library(strava)

if (interactive()) athlete_activities()
```

The first time you make a request, you will be asked to authorize. After
authorization, the token will be cached in memory for future requests in
the current session. If you wish to store the token across multiple
sessions, you can store it on your computer with:

``` r
athlete_activities(cache_disk = TRUE)
#> # A tibble: 86 × 52
#>    resource_state athlete$id name           distance moving_time elapsed_time
#>             <int>      <int> <chr>             <dbl>       <int>        <int>
#>  1              2   97088920 Morning Ride     11796.        3510         4001
#>  2              2   97088920 Morning Ride     56930.        8218         9489
#>  3              2   97088920 Afternoon Ride   20080.        2867         3131
#>  4              2   97088920 Morning Ride     20256.        3071         3420
#>  5              2   97088920 Morning Ride     11782.        3765         4510
#>  6              2   97088920 Afternoon Ride   27359.        4265         4705
#>  7              2   97088920 Lunch Ride       21056         3067         3705
#>  8              2   97088920 Lunch Ride       63017.        9048        10655
#>  9              2   97088920 Afternoon Ride   20195.        3031         3148
#> 10              2   97088920 Afternoon Ride   20321.        3029         3517
#> # … with 76 more rows, and 47 more variables: athlete$resource_state <int>,
#> #   total_elevation_gain <dbl>, type <chr>, workout_type <int>, id <dbl>,
#> #   start_date <chr>, start_date_local <chr>, timezone <chr>, utc_offset <dbl>,
#> #   location_city <lgl>, location_state <lgl>, location_country <chr>,
#> #   achievement_count <int>, kudos_count <int>, comment_count <int>,
#> #   athlete_count <int>, photo_count <int>, map <df[,3]>, trainer <lgl>,
#> #   commute <lgl>, manual <lgl>, private <lgl>, visibility <chr>, …
```
