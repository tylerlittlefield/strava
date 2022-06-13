#' Tidy a strava response
#'
#' Strava responses are typically returned in the form of a list. This function
#' will make the response _tidy_ by transforming it into a flat table.
#'
#' @param x A response from any `get_` functions.
#' @param ... Ignore.
#'
#' @concept helpers
#'
#' @export
tidy <- function(x, ...) UseMethod("tidy")
