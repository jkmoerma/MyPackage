#' Make multiple file names.
#'
#' This function takes a vector of years and returns a list of tibbles representing the data for the specified year.
#'
#' @param years A numeric or character vector (atomic or list) representing the years from which data must be read.
#' @param path An optional character indicating the directory the files can be found. Defaults to ".", denoting the current working directory.
#'
#' @return A list of filenames.
#'
#' @note This function applies the function 'make_filename' and fetches the according data from a vector of inputs using 'lapply'.
#' If a year is not found in the input of years, the function will raise a warning: "invalid year: <year>". The return list entry for that year will be NULL.
#'
#' @importFrom dplyr mutate select
#' @importFrom tidyr `%>%`
#'
#' @examples
#' fars_read_years(c(2013, 2014, 2015))
#' fars_read_years(c(2013, 2014, 2019))
#'
#' @export
#'
fars_read_years <- function(years, path=".") {
  lapply(years, function(year) {
    file <- make_filename(year, path=path)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
