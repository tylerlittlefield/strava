strava <- function(resource, ..., scope, client, resp_body = "json") {
  params <- list(...)

  resp <- httr2::request("https://www.strava.com/api/v3") %>%
    httr2::req_url_path_append(resource) %>%
    httr2::req_url_query(!!!params) %>%
    httr2::req_user_agent("strava r pkg (https://github.com/tyluRp/strava)") %>%
    httr2::req_oauth_auth_code(
      client = client,
      auth_url = "http://www.strava.com/oauth/authorize",
      scope = scope
    ) %>%
    httr2::req_perform()

  switch (resp_body,
    "json" = httr2::resp_body_json(resp),
    "html" = httr2::resp_body_html(resp),
    "xml" = httr2::resp_body_xml(resp),
    "string" = httr2::resp_body_string(resp),
    "raw" = httr2::resp_body_raw(resp),
    stop("Unexpected resp_body provided", call. = FALSE)
  )
}
