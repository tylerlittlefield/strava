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

  strava(
    resource = resource,
    bounds = bounds,
    activity_type = activity_type,
    min_cat = min_cat,
    max_cat = max_cat,
    scope = scope,
    client = client
  )
}
