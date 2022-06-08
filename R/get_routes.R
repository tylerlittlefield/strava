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

  resp <- strava(
    resource = resource,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_routes", class(resp)))
}

is.strava_routes <- function(x) {
  inherits(x, "strava_routes")
}

#' @rdname tidy
#' @export
tidy.strava_routes <- function(x, ...) {
  list(
    athlete = tibble::as_tibble(as.list(unlist(x[["athlete"]]))),
    map = tibble::as_tibble(as.list(unlist(x[["map"]]))),
    map_urls = tibble::as_tibble(as.list(unlist(x[["map_urls"]]))),
    segments = x[["segments"]] %>%
      tibble::enframe("segment", "value") %>%
      tidyr::unnest_wider("value") %>%
      tidyr::unnest_longer("start_latlng", indices_include = FALSE) %>%
      tidyr::unnest_longer("end_latlng", indices_include = FALSE)
  )
}
