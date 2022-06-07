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
    keys_by_type = TRUE,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("segments/%s/streams", id)

  strava(
    resource = resource,
    keys = keys,
    keys_by_type = keys_by_type,
    scope = scope,
    client = client
  )
}

