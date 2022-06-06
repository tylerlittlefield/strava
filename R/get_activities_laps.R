#' List Activity Laps
#'
#' Returns the laps of an activity identified by an identifier. Requires
#' activity:read for Everyone and Followers activities. Requires
#' activity:read_all for Only Me activities.
#'
#' @param id The identifier of the activity.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @export
get_activities_laps <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("activities/%s/laps", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
