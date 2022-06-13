#' Get Athlete Stats
#'
#' Returns the activity stats of an athlete. Only includes data from activities
#' set to Everyone visibilty.
#'
#' @param id The identifier of the athlete. Must match the authenticated athlete.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept athlete
#'
#' @export
get_athlete_stats <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("athletes/%s/stats", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
