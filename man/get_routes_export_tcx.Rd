% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_routes_export_tcx.R
\name{get_routes_export_tcx}
\alias{get_routes_export_tcx}
\title{Export Route TCX}
\usage{
get_routes_export_tcx(id, scope = "activity:read", client = strava_client())
}
\arguments{
\item{id}{The identifier of the route.}

\item{scope}{Authorization scope.}

\item{client}{Strava client. By default, assumes you have client credentials
stored in your \code{.Renviron} file.}
}
\description{
Returns a TCX file of the route. Requires read_all scope for private routes.
}
\examples{
if (FALSE) {
  get_routes_export_tcx("2964569522013822534")
}

}
\concept{routes}
