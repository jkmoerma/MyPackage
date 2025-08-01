#' Read accident data.
#'
#' This function reads a .csv file and returns the data as a tibble.
#'
#' @param filename Filepath to an existing .csv file
#'
#' @return A tibble representing the data of the .csv file
#'
#' @note If the filename is not found, the function will raise an error: file '<filename>' does not exist
#'
#' @importFrom dplyr tbl_df
#' @importFrom readr read_csv
#'
#' @examples
#' setwd("C:/Users/jef_m/Downloads/data")
#' fars_read(filename="accident_2013.csv.bz2")
#' fars_read(filename="accident_2014.csv.bz2")
#' fars_read(filename="accident_2019.csv.bz2")
#'
#' @export
#'
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
