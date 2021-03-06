% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_dependencies.R
\name{get_dependencies}
\alias{get_dependencies}
\title{Searches for external packages and adds them to the Imports field in the description}
\usage{
get_dependencies(path = getwd(), just_packages = FALSE)
}
\arguments{
\item{path}{location of individual file or directory where to search for scripts.}

\item{just_packages}{just give back a character vector of the found packages.}
}
\description{
Scans script files (.R, .Rmd, .Rnw, .Rpres, etc.) for external package dependencies indicated by
\code{library()}, \code{require()} or \code{::} and adds those packages to the Imports field in
the package DESCRIPTION.
}
