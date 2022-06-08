#' Explore segments
#'
#' Returns the top 10 segments matching a specified query.
#'
#' @param bounds 	The latitude and longitude for two points describing a
#' rectangular boundary for the search: (southwest corner latitutde, southwest
#' corner longitude, northeast corner latitude, northeast corner longitude)
#' @param activity_type Desired activity type. May take one of the following
#' values: `running`, `riding`
#' @param min_cat The minimum climbing category.
#' @param max_cat The maximum climbing category.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @examples
#' if (FALSE) {
#'   get_segments_explore(
#'     bounds = "33.8651,-118.8450,34.2065,-118.1886",
#'     activity_type = "riding"
#'   )
#' }
#'
#' # example response
#' tidy(strava_data$segments_explore)
#'
#' @export
get_segments_explore <- function(
    bounds = NULL,
    activity_type = NULL,
    min_cat = NULL,
    max_cat = NULL,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- "segments/explore"

  resp <- strava(
    resource = resource,
    bounds = bounds,
    activity_type = activity_type,
    min_cat = min_cat,
    max_cat = max_cat,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_segments_explore", class(resp)))
}

is.strava_segments_explore <- function(x) {
  inherits(x, "strava_segments_explore")
}

#' @rdname tidy
#' @export
tidy.strava_segments_explore <- function(x, ...) {
  tibble::enframe(x)["value"] %>%
    tidyr::unnest_longer("value", indices_include = FALSE) %>%
    tidyr::unnest_wider("value") %>%
    tidyr::unnest_longer("start_latlng", indices_include = FALSE) %>%
    tidyr::unnest_longer("end_latlng", indices_include = FALSE)
}
