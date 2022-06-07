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
#' @export
get_segments <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("segments/%s", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
