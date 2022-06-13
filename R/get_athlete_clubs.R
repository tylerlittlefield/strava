#' List Athlete Clubs
#'
#' Returns a list of the clubs whose membership includes the authenticated
#' athlete.
#'
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept athlete
#'
#' @export
get_athlete_clubs <- function(
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- "athlete/clubs"

  strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )
}
