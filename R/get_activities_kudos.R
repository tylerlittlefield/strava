#' List Activity Kudoers
#'
#' Returns the athletes who kudoed an activity identified by an identifier.
#' Requires activity:read for Everyone and Followers activities. Requires
#' activity:read_all for Only Me activities.
#'
#' @param id The identifier of the activity.
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept activities
#'
#' @export
get_activities_kudos <- function(
    id,
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("activities/%s/kudos", id)

  strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )
}
