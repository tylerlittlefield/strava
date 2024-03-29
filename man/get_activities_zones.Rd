% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_activities_zones.R
\name{get_activities_zones}
\alias{get_activities_zones}
\title{Get Activity Zones}
\usage{
get_activities_zones(id, scope = "activity:read", client = strava_client())
}
\arguments{
\item{id}{The identifier of the activity.}

\item{scope}{Authorization scope.}

\item{client}{Strava client. By default, assumes you have client credentials
stored in your \code{.Renviron} file.}
}
\description{
Summit Feature. Returns the zones of a given activity. Requires
activity:read for Everyone and Followers activities. Requires
activity:read_all for Only Me activities.
}
\concept{activities}
