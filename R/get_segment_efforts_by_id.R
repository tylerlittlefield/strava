#' Get Segment Effort
#'
#' Returns a segment effort from an activity that is owned by the authenticated
#' athlete. Requires subscription.
#'
#' @param id The identifier of the segment effort.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept segment efforts
#'
#' @export
get_segment_efforts_by_id <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("segment_efforts/%s", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}

