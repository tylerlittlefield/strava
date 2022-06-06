#' Get Equipment
#'
#' Returns an equipment using its identifier.
#'
#' @param id The identifier of the gear.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @export
get_gear <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("gear/%s", id)

  strava(
    resource = resource,
    scope = scope,
    client = client
  )
}
