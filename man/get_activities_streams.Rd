% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_activities_streams.R
\name{get_activities_streams}
\alias{get_activities_streams}
\title{Get Activity Streams}
\usage{
get_activities_streams(
  id,
  keys = NULL,
  key_by_type = TRUE,
  scope = "activity:read",
  client = strava_client()
)
}
\arguments{
\item{id}{The identifier of the activity.}

\item{keys}{Desired stream types. May take one of the following values:}

\item{key_by_type}{Must be true.}

\item{scope}{Authorization scope.}

\item{client}{Strava client. By default, assumes you have client credentials
stored in your \code{.Renviron} file.}
}
\description{
Returns the given activity's streams. Requires activity:read scope. Requires
activity:read_all scope for Only Me activities.
}
\concept{streams}
