#' Get Segment Streams
#'
#' Returns the given segment's streams. Requires read_all scope for private
#' segments.
#'
#' @param id The identifier of the activity.
#' @param keys Desired stream types. May take one of the following values:
#' @param key_by_type Must be true.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @export
get_segments_streams <- function(
    id,
    keys = NULL,
    key_by_type = TRUE,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("segments/%s/streams", id)

  resp <- strava(
    resource = resource,
    keys = keys,
    key_by_type = key_by_type,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_segments_streams", class(resp)))
}

is.strava_segments_streams <- function(x) {
  inherits(x, "strava_segments_streams")
}

#' @rdname tidy
#' @export
tidy.strava_segments_streams <- function(x, ...) {
  data <- tibble::enframe(x)
  split(data, data[["name"]]) %>%
    purrr::map(~ tidyr::unnest_wider(.x, "value")) %>%
    purrr::map(~ tidyr::unnest_longer(.x, "data", indices_include = FALSE)) %>%
    purrr::map(~ tidyr::unnest_longer(.x, "data", indices_include = FALSE))
}

