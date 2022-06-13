#' Code to prepare `strava_data` dataset goes here. This dataset is primarily
#' used for documentation purposes. Because the authentication process cannot be
#' done in a non-interactive setting, I compile example datasets here that are
#' then used in the packages docs. This also helps me easily check if the
#' functions still work.

# ------------------------------------------------------------------------------
#' Segments
# ------------------------------------------------------------------------------

# get_segments
segments <- get_segments(1089965)

# get_segments_streams
segments_streams <- get_segments_streams(1089965)

# get_segments_starred
segments_starred <- get_segments_starred()

# get_segments_explore
segments_explore <- get_segments_explore(
  bounds = "33.8651,-118.8450,34.2065,-118.1886",
  activity_type = "riding"
)

# get_segment_efforts
segment_efforts <- get_segment_efforts(10561790)

# get_segment_efforts_streams
# get_segment_efforts_streams(10561790)

# get_segment_efforts_by_id
# get_segment_efforts_by_id(10561790)

# ------------------------------------------------------------------------------
#' Routes
# ------------------------------------------------------------------------------

# get_routes
routes <- get_routes("2964569522013822534")

# get_routes_streams
routes_streams <- get_routes_streams("2964569522013822534")

# get_routes_export_tcx
routes_export_tcx <- get_routes_export_tcx("2964569522013822534")

# get_routes_export_gpx
routes_export_gpx <- get_routes_export_gpx("2964569522013822534")

# ------------------------------------------------------------------------------
#' Gear
# ------------------------------------------------------------------------------

# get_gear
gear <- get_gear("b10826293")

# ------------------------------------------------------------------------------
#' Activities
# ------------------------------------------------------------------------------

activities <- get_activities(7255352296)
activities_comments <- get_activities_comments(7148393860)
activities_kudos <- get_activities_kudos(7255352296)

# ------------------------------------------------------------------------------
#' Compile all datasets into a single list for easy access
# ------------------------------------------------------------------------------

strava_data <- list(
  segments = segments,
  segments_streams = segments_streams,
  segments_starred = segments_starred,
  segments_explore = segments_explore,
  segment_efforts = segment_efforts,
  routes = routes,
  routes_streams = routes_streams,
  routes_export_tcx = routes_export_tcx,
  routes_export_gpx = routes_export_gpx,
  gear = gear,
  activities = activities,
  activities_comments = activities_comments,
  activities_kudos = activities_kudos
)

usethis::use_data(strava_data, overwrite = TRUE)
