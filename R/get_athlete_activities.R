#' List Athlete Activities
#'
#' Returns the activities of an athlete for a specific identifier. Requires
#' activity:read. Only Me activities will be filtered out unless requested by a
#' token with activity:read_all.
#'
#' @param before An epoch timestamp to use for filtering activities that have
#' taken place before a certain time.
#' @param after An epoch timestamp to use for filtering activities that have
#' taken place after a certain time.
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept athlete
#'
#' @examples
#' if (FALSE) {
#'   get_athlete_activities()
#' }
#'
#' @export
get_athlete_activities <- function(
    before = NULL,
    after = NULL,
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- "athlete/activities"

  strava(
    resource = resource,
    before = before,
    after = after,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )
}
