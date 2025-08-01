% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_summarize_years.R
\name{fars_summarize_years}
\alias{fars_summarize_years}
\title{Count the number of observations by month and by year.}
\usage{
fars_summarize_years(years, path = ".")
}
\arguments{
\item{years}{A numeric or character vector (atomic or list) representing the years from which data must be read.}

\item{path}{An optional character indicating the directory the files can be found. Defaults to ".", denoting the current working directory.}
}
\value{
A tibble with observation counts. Colunmns are "MONTH" and the specified years for which there is data available.
}
\description{
This function takes a vector of years and returns a tibble with the years as columns and the months as rows.
The entries represent the number of counts by month and by year.
}
\note{
If the input vector contains a year on which there is no data available, the year will simply not be included in the output.
}
\examples{
fars_summarize_years(c(2013, 2014, 2015))
fars_summarize_years(c(2013, 2014, 2019))

}
