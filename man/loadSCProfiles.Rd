% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadData.R
\name{loadSCProfiles}
\alias{loadSCProfiles}
\title{Create a \code{\linkS4class{DigitalDLSorter}} object from single-cell RNA-seq
data}
\usage{
loadSCProfiles(
  single.cell.data,
  cell.ID.column,
  gene.ID.column,
  name.dataset.h5,
  min.counts = 0,
  min.cells = 0,
  fun.aggregate = "sum",
  file.backend = NULL,
  name.dataset.backend = NULL,
  compression.level = NULL,
  chunk.dims = NULL,
  block.processing = FALSE,
  verbose = TRUE,
  project = "DigitalDLSorterProject"
)
}
\arguments{
\item{single.cell.data}{If data is provided from files,
\code{single.cell.real} must be a vector with file paths of three elements:
single-cell counts, cells metadata and genes metadata. If data is provided
from a \code{\linkS4class{SingleCellExperiment}} object, single-cell counts
must be present in \code{assay} slot, cells metadata in \code{colData} slot
and genes metadata in \code{rowData} slot.}

\item{cell.ID.column}{Name or number of the column in cells metadata
corresponding to cell names in expression matrix.}

\item{gene.ID.column}{Name or number of the column in genes metadata
corresponding to the names used for features/genes.}

\item{name.dataset.h5}{Name of data set if HDF5 file is provided.}

\item{min.counts}{Minimum gene counts to filter (0 by default).}

\item{min.cells}{Minimum of cells with more than min.counts (0 by default).}

\item{fun.aggregate}{In case of duplicated genes, it is possible to set the
function used for aggregating them. Allowed functions: \code{'sum'},
\code{'mean'}, \code{'median'}. Note that this functionality only works
when data are provided from a mtx file (sparse matrices) that allows
duplicated rownames. Otherwise, R does not allow duplicated rownames.}

\item{file.backend}{Valid file path where to store loaded data as HDF5 file.
If provided, data is stored in HDF5 files as back-end by using
\pkg{DelayedArray} and \pkg{HDF5Array} packages instead of
loaded in memory. This is suitable for situations where you have big
amounts of data that cannot be allocated in memory. Note that operations on
this data will be carried out by blocks (i.e subsets of determined size),
which can lead to longer execution times. \code{NULL} by default.}

\item{name.dataset.backend}{Name of the dataset in the HDF5 file that will be
used. Note that it cannot exist. If \code{NULL} (by default), a random
datset name will be used.}

\item{compression.level}{The compression level used if \code{file.backend} is
provided. It is an integer value between 0 (no compression) and 9 (highest
and slowest compression). See
\code{?\link[HDF5Array]{getHDF5DumpCompressionLevel}} from
\pkg{HDF5Array} package for more information.}

\item{chunk.dims}{Specifies dimensions that HDF5 chunk will have. If
\code{NULL}, the default value is a vector of two items: the number of
genes considered by \code{\linkS4class{DigitalDLSorter}} object during the
simulation and only one sample in order to increase the read times in the
following steps. Greater number of columns written in each chunk can lead
to longer read times.}

\item{block.processing}{Boolean indicating if data should be treated as
blocks (only if data are provided as HDF5 file). \code{FALSE} by default.
Note that to use this functionality is suitable for cases where is not
possible to allocate data in memory and therefore execution times will be
longer.}

\item{verbose}{Show informative messages during the execution. \code{TRUE} by
default.}

\item{project}{Name of the project for \code{\linkS4class{DigitalDLSorter}}
object.}
}
\value{
A \code{\linkS4class{DigitalDLSorter}} object with single-cell
RNA-seq data provided loaded in single.cell.real slot
}
\description{
Create a \code{\linkS4class{DigitalDLSorter}} object from single-cell RNA-seq
data using files (formats allowed: tsv, tsv.gz, mtx (sparse matrix) and hdf5)
or using a \code{\linkS4class{SingleCellExperiment}} object. Data will be
stored in \code{single.cell.real} slot. Provided data must be composed of
three pieces of information: \itemize{ \item Single-cell counts: genes in
rows and cells in columns. \item Cells metadata: annotations (columns) for
each cell (rows). \item Genes metadata: annotations (columns) for each gene
(rows). } If data is provided from files, \code{single.cell.real} argument
must be a vector of three elements ordered so that the first file corresponds
to count matrix, the second to cells metadata and the latter to genes
metadata. On the other hand, if data is provided as
\code{\linkS4class{SingleCellExperiment}}, the object must contain
single-cell counts in \code{assay} slot, cells metadata in \code{colData}
slot and genes metadata in \code{rowData}. Data must be provided without any
transformation (e.g. log-transformation) and raw counts are preferred.
}
\details{
This data can be used to simulate new single-cell profiles using the
ZINB-WaVE framework with \code{\link{estimateZinbwaveParams}} function. In
this way it is possible to increase the signal of cell types which are
underrepresented in the original data set. If this step is not neccesary,
these profiles will be used directly to simulate bulk RNA-seq samples with
known composition.
}
\examples{
sc.chung.breast <- single.cell.real(DDLSLi)
DDLSChungSmall <- loadSCProfiles(
  single.cell.data = sc.chung.breast,
  cell.ID.column = "Cell_ID",
  gene.ID.column = "external_gene_name",
  min.cells = 0,
  min.counts = 0,
  project = "Chung_example"
)

}
\seealso{
\code{\link{estimateZinbwaveParams}}
\code{\link{generateBulkCellMatrix}}
}
