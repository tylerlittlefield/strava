#' Create a strava client
#'
#' @param id Client ID. By default, attempts to pull ID from .Renviron file.
#' @param secret Client secret By default, attempts to pull ID from .Renviron file.
#' @param token_url Token URL. Should not need to be changed.
#' @param name Client name. By default, 'strava-oauth' but you can name it whatever.
#'
#' @examples
#' if (FALSE) {
#'   strava_client()
#' }
#'
#' @export
strava_client <- function(
    id = Sys.getenv("STRAVA_ID"),
    secret = Sys.getenv("STRAVA_SECRET"),
    token_url = "https://www.strava.com/oauth/token",
    name = "strava-oauth"
) {
  httr2::oauth_client(
    id = id,
    secret = secret,
    token_url = token_url,
    name = name
  )
}
