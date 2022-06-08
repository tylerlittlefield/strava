#' List Segment Efforts
#'
#' Returns a set of the authenticated athlete's segment efforts for a given
#' segment. Requires subscription.
#'
#' @param segment_id The identifier of the segment.
#' @param start_date_local ISO 8601 formatted date time.
#' @param end_date_local ISO 8601 formatted date time.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @examples
#' if (FALSE) {
#'   get_segment_efforts(10561790)
#' }
#'
#' # example response
#' tidy(strava_data$segment_efforts)
#'
#' @export
get_segment_efforts <- function(
    segment_id,
    start_date_local = NULL,
    end_date_local = NULL,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- "segment_efforts"

  resp <- strava(
    resource = resource,
    segment_id = segment_id,
    start_date_local = start_date_local,
    end_date_local = end_date_local,
    per_page = per_page,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_segment_efforts", class(resp)))
}

is.strava_segment_efforts <- function(x) {
  inherits(x, "strava_segment_efforts")
}

#' @rdname tidy
#' @export
tidy.strava_segment_efforts <- function(x, ...) {
  x %>%
    map(~ tibble::as_tibble(as.list(unlist(.x)))) %>%
    bind_rows()
}
