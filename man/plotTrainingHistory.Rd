% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{plotTrainingHistory}
\alias{plotTrainingHistory}
\title{Plot training history of a trained DigitalDLSorter Deep Neural Network model}
\usage{
plotTrainingHistory(
  object,
  title = "History of metrics during training",
  metrics = NULL
)
}
\arguments{
\item{object}{\code{\linkS4class{DigitalDLSorter}} object with
\code{trained.model} slot.}

\item{title}{Title of plot.}

\item{metrics}{Which metrics to plot. If it is equal to \code{NULL} (by
default), all metrics available on \code{\linkS4class{DigitalDLSorterDNN}}
object will be plotted.}
}
\description{
Plot training history of a trained DigitalDLSorter Deep Neural Network model.
}
\seealso{
\code{\link{trainDigitalDLSorterModel}}
\code{\link{deconvDigitalDLSorterObj}}
}
