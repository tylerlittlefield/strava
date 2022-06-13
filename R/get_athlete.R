#' Get Authenticated Athlete
#'
#' Returns the currently authenticated athlete. Tokens with profile:read_all
#' scope will receive a detailed athlete representation; all others will
#' receive a summary representation.
#'
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept athlete
#'
#' @export
get_athlete <- function(
    scope = "activity:read",
    client = strava_client()
) {
  resource <- "athlete"

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
