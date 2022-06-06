#' Get Route
#'
#' Returns a route using its identifier. Requires read_all scope for private routes.
#'
#' @param id The identifier of the route.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @export
get_routes <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("routes/%s", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
