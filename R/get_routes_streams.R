#' Get Route Streams
#'
#' Returns the given route's streams. Requires read_all scope for private
#' routes.
#'
#' @param id The identifier of the route.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept routes
#'
#' @examples
#' if (FALSE) {
#'   get_routes_streams("2964569522013822534")
#' }
#'
#' @export
get_routes_streams <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("routes/%s/streams", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
