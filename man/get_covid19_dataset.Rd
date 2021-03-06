% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_covid19_dataset.R
\name{get_covid19_dataset}
\alias{get_covid19_dataset}
\title{Get a Specific Covid19 Tidy Dataset}
\usage{
get_covid19_dataset(dataset)
}
\arguments{
\item{dataset}{The name of the dataset from \code{\link{get_covid19_data_info}}}
}
\value{
a tibble of data
}
\description{
Fetches a chosen tidy dataset from the covid19R catalogue
}
\examples{

nytimes_states <- get_covid19_dataset("covid19nytimes_states")

tail(nytimes_states)
}
