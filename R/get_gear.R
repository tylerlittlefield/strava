#' Get Equipment
#'
#' Returns an equipment using its identifier.
#'
#' @param id The identifier of the gear.
#' @param scope Authorization scope.
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#'
#' @concept gear
#'
#' @examples
#' if (FALSE) {
#'   get_gear("b10826293")
#' }
#'
#' # example response
#' tidy(strava_data$gear)
#'
#' @export
get_gear <- function(
    id,
    scope = "activity:read",
    client = strava_client()
) {
  resource <- sprintf("gear/%s", id)

  resp <- strava(
    resource = resource,
    scope = scope,
    client = client
  )

  structure(resp, class = c("strava_gear", class(resp)))
}

is.strava_gear <- function(x) {
  inherits(x, "strava_gear")
}

#' @rdname tidy
#' @export
tidy.strava_gear <- function(x, ...) {
  tibble::as_tibble(as.list(unlist(x)))
}
