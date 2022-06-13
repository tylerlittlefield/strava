#' List Activity Kudoers
#'
#' Returns the athletes who kudoed an activity identified by an identifier.
#' Requires `activity:read` for Everyone and Followers activities. Requires
#' `activity:read_all` for Only Me activities.
#'
#' @param id The identifier of the activity.
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @returns
#' An array of [SummaryAthlete](https://developers.strava.com/docs/reference/#api-models-SummaryAthlete) objects.
#'
#' @concept activities
#'
#' @examples
#' if (FALSE) {
#'   get_activities_kudos(7255352296)
#' }
#'
#' # example response
#' tidy(strava_data$activities_kudos)
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

  resp <- strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_activities_kudos", class(resp)))
}

is.strava_activities_kudos <- function(x) {
  inherits(x, "strava_activities_kudos")
}

#' @rdname tidy
#' @export
tidy.strava_activities_kudos <- function(x, ...) {
  x %>%
    map(tibble::as_tibble) %>%
    bind_rows()
}
