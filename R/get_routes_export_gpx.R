#' Export Route GPX
#'
#' Returns a GPX file of the route. Requires `read_all` scope for private
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
#'   gpx <- get_routes_export_gpx("2964569522013822534")
#'   tidy(gpx)
#' }
#'
#' @export
get_routes_export_gpx <- function(
    id,
    scope = "read",
    client = strava_client()
) {
  resource <- sprintf("routes/%s/export_gpx", id)

  resp <- strava(
    resource = resource,
    scope = scope,
    client = client,
    resp_body = "xml"
  )

  structure(resp, class = c("strava_routes_export_gpx", class(resp)))
}

is.strava_routes_export_gpx <- function(x) {
  inherits(x, "strava_routes_export_gpx")
}

#' @rdname tidy
#' @export
tidy.strava_routes_export_gpx <- function(x, ...) {
  x <- xml2::as_list(x)[["gpx"]][["trk"]]

  structure(
    tibble::tibble(
      ele = unlist(lapply(x$trkseg, "[[", "ele"), use.names = FALSE),
      lat = unlist(lapply(x$trkseg, attr, "lat"), use.names = FALSE),
      lon = unlist(lapply(x$trkseg, attr, "lon"), use.names = FALSE)
    ),
    route_name = unlist(x$name),
    route_link = attr(x$link, "href"),
    route_type = unlist(x$type)
  )
}
