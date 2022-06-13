#' Get Zones
#'
#' Returns the the authenticated athlete's heart rate and power zones. Requires
#' profile:read_all.
#'
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept athlete
#'
#' @export
get_athlete_zones <- function(
    scope = "profile:read_all",
    client = strava_client()
) {
  resource <- "athlete/zones"

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
