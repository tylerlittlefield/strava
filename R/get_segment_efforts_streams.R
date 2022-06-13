#' Get Segment Effort Streams
#'
#' Returns a set of streams for a segment effort completed by the authenticated
#' athlete. Requires read_all scope.
#'
#' @param id The identifier of the activity.
#' @param keys Desired stream types. May take one of the following values:
#' @param key_by_type Must be true.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept streams
#'
#' @export
get_segment_efforts_streams <- function(
    id,
    keys = NULL,
    key_by_type = TRUE,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("segment_efforts/%s/streams", id)

  strava(
    resource = resource,
    keys = keys,
    key_by_type = key_by_type,
    scope = scope,
    client = client
  )
}
