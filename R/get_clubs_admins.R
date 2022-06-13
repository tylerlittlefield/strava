#' List Club Administrators
#'
#' Returns a list of the administrators of a given club.
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
get_clubs_admins <- function(
    id,
    page = 1,
    per_page = 30,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("clubs/%s/admins", id)

  strava(
    resource = resource,
    page = page,
    per_page = per_page,
    scope = scope,
    client = client
  )
}
