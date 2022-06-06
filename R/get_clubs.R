#' Get Club
#'
#' Returns a given club using its identifier.
#'
#' @param id The identifier of the club.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @export
get_clubs <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("clubs/%s", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
