% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/01-getData.R
\name{getFields}
\alias{getFields}
\title{Get field mapping table}
\usage{
getFields(mapping = "IsoMemo", colnamesAPI = FALSE)
}
\arguments{
\item{mapping}{(character) Optionally, provide a specific mapping in order to obtain a list
of databases only for that mapping. Check available mapping ids with getMappings()}

\item{colnamesAPI}{(logical) Optionally, return a dataframe with the column names as they come
from the 'IsoMemo' API}
}
\value{
A data frame that describes data field name, data type, and domain category
}
\description{
Get field mapping table
}
