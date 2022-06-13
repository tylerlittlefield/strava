#' List Activity Comments
#'
#' Returns the comments on the given activity. Requires `activity:read` for
#' Everyone and Followers activities. Requires `activity:read_all` for Only Me
#' activities.
#'
#' @param id The identifier of the activity.
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @returns
#' 	An array of [Comment](https://developers.strava.com/docs/reference/#api-models-Comment) objects.
#'
#' @concept activities
#'
#' @examples
#' if (FALSE) {
#'   get_activities_comments(7148393860)
#' }
#'
#' # example response
#' tidy(strava_data$activities_comments)
#'
#' @export
get_activities_comments <- function(
    id,
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("activities/%s/comments", id)

  resp <- strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_activities_comments", class(resp)))
}

is.strava_activities_comments <- function(x) {
  inherits(x, "strava_activities_comments")
}

#' @rdname tidy
#' @export
tidy.strava_activities_comments <- function(x, ...) {
  tibble::as_tibble(as.list(unlist(x)))
}
