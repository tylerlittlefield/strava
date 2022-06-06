#' Export Route TCX
#'
#' Returns a TCX file of the route. Requires read_all scope for private routes.
#'
#' @param id The identifier of the route.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @export
get_routes_export_tcx <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("routes/%s/export_tcx", id)

  strava(
    resource = resource,
    scope = scope,
    client = client,
    resp_body = "xml"
  )
}
