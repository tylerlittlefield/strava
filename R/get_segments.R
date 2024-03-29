#' Get Segment
#'
#' Returns the specified segment. read_all scope required in order to retrieve
#' athlete-specific segment information, or to retrieve private segments.
#'
#' @param id The identifier of the segment.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept segments
#'
#' @examples
#' if (FALSE) {
#'   get_segments(1089965)
#' }
#'
#' # example response
#' tidy(strava_data$segments)
#'
#' @export
get_segments <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("segments/%s", id)

  resp <- strava(
    resource = resource,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_segments", class(resp)))
}

is.strava_segments <- function(x) {
  inherits(x, "strava_segments")
}

#' @rdname tidy
#' @export
tidy.strava_segments <- function(x, ...) {
  tibble::as_tibble(as.list(unlist(x)))
}
