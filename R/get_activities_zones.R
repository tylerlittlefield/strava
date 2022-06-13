#' Get Activity Zones
#'
#' Summit Feature. Returns the zones of a given activity. Requires
#' activity:read for Everyone and Followers activities. Requires
#' activity:read_all for Only Me activities.
#'
#' @param id The identifier of the activity.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept activities
#'
#' @export
get_activities_zones <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("activities/%s/zones", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
