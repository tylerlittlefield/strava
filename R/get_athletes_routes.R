#' List Athlete Routes
#'
#' Returns a list of the routes created by the authenticated athlete. Private
#' routes are filtered out unless requested by a token with read_all scope.
#'
#' @param id The identifier of the athlete. Must match the authenticated athlete.
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept routes
#'
#' @export
get_athletes_routes <- function(
    id,
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("athletes/%s/routes", id)

  strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )
}
