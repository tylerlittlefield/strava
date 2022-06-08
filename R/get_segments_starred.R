#' List Starred Segments
#'
#' List of the authenticated athlete's starred segments. Private segments are
#' filtered out unless requested by a token with read_all scope.
#'
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @export
get_segments_starred <- function(
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- "segments/starred"

  resp <- strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_segments_starred", class(resp)))
}

is.strava_segments_starred <- function(x) {
  inherits(x, "strava_segments_starred")
}

#' @rdname tidy
#' @export
tidy.strava_segments_starred <- function(x, ...) {
  tibble::as_tibble(as.list(unlist(x)))
}
