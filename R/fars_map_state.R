#' Map the yearly accidents of a state
#'
#' This function fetches the location data of accident that happened in a state in a certain year.
#' It returns a map displaying the spatial distribution of the accidents.
#'
#' @param state.num A numeric representing the state number
#' @inheritParams make_filename
#'
#' @return A map of the specified state with accident locations represented as dots.
#'
#' @note If the specified state number or the year is not represented in the data the function raises an error.
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @examples
#' fars_map_state(4, 2013)
#' fars_map_state(3, 2013)
#' fars_map_state(4, 2019)
#'
#' @export
#'
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
