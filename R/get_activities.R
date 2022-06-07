#' Get Activity
#'
#' Returns the given activity that is owned by the authenticated athlete.
#' Requires activity:read for Everyone and Followers activities. Requires
#' activity:read_all for Only Me activities.
#'
#' @param id The identifier of the activity.
#' @param include_all_efforts To include all segments efforts.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @returns
#' The activity's detailed representation. An instance of
#' [DetailedActivity](https://developers.strava.com/docs/reference/#api-models-DetailedActivity).
#'
#' @examples
#' if (FALSE) {
#'   get_activities(7255352296)
#' }
#'
#' @export
get_activities <- function(
    id,
    include_all_efforts = NULL,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("activities/%s", id)

  strava(
    resource = resource,
    include_all_efforts = include_all_efforts,
    scope = scope,
    client = client
  )
}
