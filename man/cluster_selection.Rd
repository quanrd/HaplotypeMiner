% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cluster_selection.R
\name{cluster_selection}
\alias{cluster_selection}
\title{Selecting marker clusters according to filtering criteria}
\usage{
cluster_selection(snp_data, center_pos, ld_threshold = 0.5,
  max_pair_distance = 10^10, max_marker_distance = 10^10)
}
\arguments{
\item{snp_data}{A list describing snp_data and containing at least two items :
\itemize{
\item{Markers} {A data.frame containing metadata regarding the markers to be
selected, as output by functions \code{\link{read_hapmap}} and \code{\link{read_vcf}}
}.
\item{LD} {A square matrix containing linkage disequilibrum measures (could be either
R2, R2v, R2s or R2vs) between all gene pairs.}
}}

\item{center_pos}{A numeric of length one. The central position of the gene of interest.}

\item{ld_threshold}{A numeric between 0 and 1. The minimum LD value to pass the filter. Defaults to 0.5.}

\item{max_pair_distance}{A numeric of length one. The maximum distance (in base pairs)
between two markers in a pair for markers in that pair to be selected.}

\item{max_marker_distance}{A numeric of length one. The maximum distance (in
base pairs) between the marker and the gene center for a marker to be selected.}
}
\value{
A list similar to that provided as input, but with a subset of markers
  that passed the filters.
}
\description{
This function selects marker clusters to be used for haplotype generation.
Clusters are selecte based on three different analysis criteria : high enough
linkage disequilibrium between marker pairs (parameter \code{ld_threshold}),
proximity between markers in a pair (parameter \code{max_pair_distance}),
and proximity between markers and gene center position (parameter
\code{max_marker_distance}).
}
\details{
This function is meant for internal package use only. It is called by function
\code{\link{haplo_selection}} in the final stage of marker selection.
}
\examples{
NULL

}
