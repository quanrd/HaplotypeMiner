% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genotype_filter.R
\name{genotype_filter}
\alias{genotype_filter}
\title{Filter SNP data}
\usage{
genotype_filter(snp_data, chrom, center_pos, max_distance_to_gene = 10^9,
  max_missing_threshold = NULL, max_het_threshold = NULL,
  min_alt_threshold = NULL, min_allele_count = NULL, verbose = TRUE)
}
\arguments{
\item{snp_data}{A list of data pertaining so SNP markers and having at least
elements \code{Markers} and \code{Genotypes}. A more detailed account of
the contents of this object can be found in the documentation for functions
\code{\link{read_hapmap}} and \code{\link{read_vcf}}.}

\item{chrom}{A character of length one. The name of the chromosome for which
markers should be kept.}

\item{center_pos}{A numeric of length one. The central position (in base pairs)
of the gene of interest.}

\item{max_distance_to_gene}{A numeric of length one. The maximum distance
(in base pairs) between \code{center_pos} and the position of a marker
for this marker to be kept in the analysis.}

\item{max_missing_threshold}{A numeric of length one between 0 and 1, or
\code{NULL}. If \code{NULL} (default), no such filter is applied. Otherwise,
all markers with a missing data rate over this value are removed.}

\item{max_het_threshold}{A numeric of length one between 0 and 1, or
\code{NULL}. If \code{NULL} (default), no such filter is applied. Otherwise,
all markers with a heterozygosity rate over this value are
removed.}

\item{min_alt_threshold}{A numeric of length one between 0 and 1, or
\code{NULL}. If \code{NULL} (default), no such filter is applied. Otherwise,
all markers with a minor allele frequency below this value are removed.}

\item{min_allele_count}{A positive numeric value, or \code{NULL}. If
\code{NULL} (default), no such filter is applied. Otherwise, all markers
with a minor allele count below this threshold are removed.}

\item{verbose}{Logical. Should information regarding the filtering process
be printed to screen? Defaults to TRUE.}
}
\value{
A list containing 3 or 4 elements depending on the \code{snp_data}
  object used as input :

  \itemize{
    \item{Genotypes}{An object of class \code{snpMatrix} containing the
      genotypes corresponding to the various markers for every individual.
      This is essentially a subset of \code{snp_data$Genotypes} that
      contains only markers that have been selected.}
    \item{Markers}{A \code{data.frame} containing metadata relative to the
      genotyped markers. This is essentially a subset of
      \code{snp_data$Markers} that contains only markers that have been
      selected.}
    \item{Filters}{A list of eight integer vectors indicating how many
      markers remained following different filtering steps : (1) the total
      number of markers, (2) the number of markers located on the chromosome
      of interest, (3) the number of markers located close enough to the
      central gene position, (4) the number of biallelic markers, (5) the
      number of markers passing the missing data filter, (6) the number of
      markers passing the heterozygosity filter, (7) the number of markers
      passing the MAF filter, and (8) the number of markers passing the MAC
      filter. All these numbers are the number of markers remaining after
      every preceding step and not the absolute number of markers passing
      this filter.}
    \item{VCF}{If a VCF element was present in the initial \code{snp_data}
      object, this element is a subset of it containing only the markers
      remaining following filtering.}
  }
}
\description{
This function applies different filters on SNP data so as to generate as
set of markers suitable for haplotype analysis. Although the function can
be called separately for filtering purposes, it was thought and designed
specifically for the needs of package \code{HaplotypeMiner} and might not suit
the needs of the general. See section \code{Details} for a discussion of
the different mandatory and optional filters applied by this function.
}
\details{
\code{genotype_filter} applies automaticaly three filters to the
\code{snp_data} object provided as an argument. These filters are applied
both when the function is used separately and when used internally inside
a call to \code{\link{haplo_selection}}. The three filters are :

\itemize{
\item{chrom} {Only markers lying on the chromosome of interest are kept
  for further analysis.}
\item{distance} {Only markers less than \code{max_distance_to_gene} base pairs
  away from the central position of interest (usually the center of the gene
  for which haplotypes are beign generated) are kept for further analysis. The
  value of this distance is 1 Gb by default, which should mean that all
  markers on a given chromosome are kept by default (a more sensible
  default value could be used).}
\item{multiallelism} {Markers that are not biallelic (i.e. either triallelic
  or tetraallelic) are automatically removed from the dataset as package
  \code{HaplotypeMiner} does not know how to handle these markers yet.}
}

Other filters are optional and are not applied by default, although is is
recommended that users do apply these filters either prior to the analysis,
externally to package \code{HaplotypeMiner}, or as part of the analysis pipeline
implemented by function \code{\link{haplo_selection}}. These four filters
are :

\itemize{
  \item{Missing data} {Markers harbouring a missing data rate higher than
    \code{max_missing_threshold} can be selectively removed during the
    analysis.}
  \item{Heterozygosity} {Markers harbouring a heterozygosity rate higher
    than \code{max_het_threshold} can be selectively removed during the
    analysis. This may not be relevant for species found in the while, but
    is relevant e.g. for crop species which are expected to by homozygous
    at all loci.}
  \item{Minor allele frequency} {Markers harbouring a minor
    allele frequency (MAF) lower than \code{min_alt_treshold} can be selectively
    removed from the analysis.}
  \item{Minor allele count} {Markers harbouring a minor allele count (MAC)
    lower than \code{min_allele_count} can be selectively removed from the
    analysis.}
}
}
\examples{
NULL

}
