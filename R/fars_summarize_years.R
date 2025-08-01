#' Count the number of observations by month and by year.
#'
#' This function takes a vector of years and returns a tibble with the years as columns and the months as rows.
#' The entries represent the number of counts by month and by year.
#'
#' @inheritParams fars_read_years
#'
#' @return A tibble with observation counts. Colunmns are "MONTH" and the specified years for which there is data available.
#'
#' @note If the input vector contains a year on which there is no data available, the year will simply not be included in the output.
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr `%>%` spread
#'
#' @examples
#' fars_summarize_years(c(2013, 2014, 2015))
#' fars_summarize_years(c(2013, 2014, 2019))
#'
#' @export
#'
fars_summarize_years <- function(years, path = ".") {
  dat_list <- fars_read_years(years, path=path)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = dplyr::n()) %>%
    tidyr::spread(year, n)
}
