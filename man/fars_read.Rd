% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fars_read.R
\name{fars_read}
\alias{fars_read}
\title{Read accident data.}
\usage{
fars_read(filename)
}
\arguments{
\item{filename}{Filepath to an existing .csv file}
}
\value{
A tibble representing the data of the .csv file
}
\description{
This function reads a .csv file and returns the data as a tibble.
}
\note{
If the filename is not found, the function will raise an error: file '\if{html}{\out{<filename>}}' does not exist
}
\examples{
setwd("C:/Users/jef_m/Downloads/data")
fars_read(filename="accident_2013.csv.bz2")
fars_read(filename="accident_2014.csv.bz2")
fars_read(filename="accident_2019.csv.bz2")

}
