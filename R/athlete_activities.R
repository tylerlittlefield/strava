#' List Athlete Activities
#'
#' Returns the activities of an athlete for a specific identifier. Requires
#' activity:read. Only Me activities will be filtered out unless requested by a
#' token with activity:read_all.
#'
#' @param client Strava client. By default, assumes you have client credentials
#' stored in your `.Renviron` file.
#' @param before An epoch timestamp to use for filtering activities that have
#' taken place before a certain time.
#' @param after An epoch timestamp to use for filtering activities that have
#' taken place after a certain time.
#' @param page Page number. Defaults to 1.
#' @param per_page Number of items per page. Defaults to 30.
#' @param ... Additional parameters for `httr2::req_oauth_auth_code`.
#'
#' @examples
#' if (FALSE) {
#'   athlete_activities()
#' }
#'
#' @export
athlete_activities <- function(
    client = strava_client(),
    before = NULL,
    after = NULL,
    page = 1,
    per_page = 30,
    ...
) {
  httr2::request("https://www.strava.com/api/v3/athlete/activities") %>%
    httr2::req_user_agent("strava r pkg: (https://github.com/tyluRp)") %>%
    httr2::req_url_query(per_page = 100) %>%
    httr2::req_oauth_auth_code(
      client = client,
      auth_url = "http://www.strava.com/oauth/authorize",
      scope = "activity:read",
      ...
    ) %>%
    httr2::req_perform() %>%
    httr2::resp_body_json(simplifyVector = TRUE) %>%
    tibble::as_tibble()
}
