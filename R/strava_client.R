#' Create a strava client
#'
#' Strava uses [OAuth2](https://github.com/Kong/mashape-oauth/blob/master/FLOWS.md#oauth-2-three-legged)
#' for authentication to the V3 API. OAuth allows external applications to
#' request authorization to a user's data. It allows users to grant and revoke
#' API access on a per-application basis and keeps users' authentication details
#' safe. All developers need to [register their application](https://developers.strava.com/docs/getting-started/#account)
#' before getting started. A registered application will be assigned a client ID
#' and client secret. The secret is used for authentication and should never be
#' shared.
#'
#' @param id Client ID.
#' @param secret Client secret.
#' @param token_url Token URL.
#' @param name Client name.
#' @param ... Additional parameters passed to `httr2::oauth_client`.
#'
#' @concept helpers
#'
#' @seealso \url{https://developers.strava.com/docs/getting-started/}
#'
#' @examples
#' # strava client will pull environment variables by default
#' Sys.setenv(
#'   STRAVA_ID="123",
#'   STRAVA_SECRET="my_secret_code"
#' )
#'
#' strava_client()
#'
#' @export
strava_client <- function(
    id = Sys.getenv("STRAVA_ID"),
    secret = Sys.getenv("STRAVA_SECRET"),
    token_url = "https://www.strava.com/oauth/token",
    name = "strava-oauth",
    ...
) {
  httr2::oauth_client(
    id = id,
    secret = secret,
    token_url = token_url,
    name = name,
    ...
  )
}
