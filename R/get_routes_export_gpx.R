#' Export Route GPX
#'
#' Returns a GPX file of the route. Requires read_all scope for private routes.
#'
#' @param id The identifier of the route.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @examples
#' if (FALSE) {
#'   get_routes_export_gpx("2964569522013822534")
#' }
#'
#' @export
get_routes_export_gpx <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("routes/%s/export_gpx", id)

  strava(
    resource = resource,
    scope = scope,
    client = client,
    resp_body = "xml"
  )
}
