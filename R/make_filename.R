#' Make a file name.
#'
#' This function takes a year and returns a character string that can be used as a filename for a .csv file.
#' The format of the returned filename is "accident_<year>.csv".
#'
#' @param year A numeric or character representing the year included in the filename
#' @param path An optional character indicating the directory the files can be found. Defaults to ".", denoting the current working directory.
#'
#' @return A character string representing the file name of an available file
#'
#' @note This function is not exported because it is a helper function for 'fars_read_years'.
#'
#' @examples
#' make_filename(2013)
#' make_filename(2014)
#' make_filename(2019)
#'
make_filename <- function(year, path=".") {
  year <- as.integer(year)
  file.path(path, sprintf("accident_%d.csv.bz2", year))
}
