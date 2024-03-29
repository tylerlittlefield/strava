% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_activities_laps.R
\name{get_activities_laps}
\alias{get_activities_laps}
\title{List Activity Laps}
\usage{
get_activities_laps(id, scope = "activity:read", client = strava_client())
}
\arguments{
\item{id}{The identifier of the activity.}

\item{scope}{Authorization scope.}

\item{client}{Strava client. By default, assumes you have client credentials
stored in your \code{.Renviron} file.}
}
\description{
Returns the laps of an activity identified by an identifier. Requires
activity:read for Everyone and Followers activities. Requires
activity:read_all for Only Me activities.
}
\concept{activities}
