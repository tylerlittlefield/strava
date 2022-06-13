#' List Club Activities
#'
#' Retrieve recent activities from members of a specific club. The authenticated
#' athlete must belong to the requested club in order to hit this endpoint.
#' Pagination is supported. Athlete profile visibility is respected for all
#' activities.
#'
#' @param id The identifier of the club.
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept clubs
#'
#' @export
get_clubs_activities <- function(
    id,
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("clubs/%s/activities", id)

  strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )
}
