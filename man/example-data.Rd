\docType{data}
\name{example-data}
\alias{example-data}
\alias{NetRep-data}
\alias{discovery_network}
\alias{discovery_data}
\alias{discovery_correlation}
\alias{module_labels}
\alias{test_network}
\alias{test_data}
\alias{test_correlation}
\title{Example data}
\format{
\describe{
  \item{"discovery_network"}{
     a \code{matrix} with 150 columns and 150 rows containing the network 
     edge weights encoding the interaction strength between each pair of
     genes in the \emph{discovery} dataset.
  }
  \item{"discovery_data"}{
     a \code{matrix} with 150 columns (genes) and 30 rows (samples) whose 
     entries correspond to the expression level of each gene in each sample
     in the \emph{discovery} dataset.
  }
  \item{"discovery_correlation"}{
     a \code{matrix} with 150 columns and 150 rows containing the 
     correlation-coefficients between each pair of genes calculated from the
     "discovery_data" \code{matrix}.
  }
  \item{\"module_labels"}{
     a named \code{vector} with 150 entries containing the module assignment
     for each gene as identified in the \emph{discovery} dataset.
  }  
  \item{"test_network"}{
     a \code{matrix} with 150 columns and 150 rows containing the network 
     edge weights encoding the interaction strength between each pair of
     genes in the \emph{test} dataset.
  }  
  \item{"test_data"}{
     a \code{matrix} with 150 columns (genes) and 30 rows (samples) whose 
     entries correspond to the expression level of each gene in each sample
     in the \emph{test} dataset.
  }
  \item{"test_correlation"}{
     a \code{matrix} with 150 columns and 150 rows containing the 
     correlation-coefficients between each pair of genes calculated from the
     "test_data" \code{matrix}.
  }
}

An object of class \code{matrix} (inherits from \code{array}) with 150 rows and 150 columns.

An object of class \code{matrix} (inherits from \code{array}) with 30 rows and 150 columns.

An object of class \code{matrix} (inherits from \code{array}) with 150 rows and 150 columns.

An object of class \code{numeric} of length 150.

An object of class \code{matrix} (inherits from \code{array}) with 150 rows and 150 columns.

An object of class \code{matrix} (inherits from \code{array}) with 30 rows and 150 columns.

An object of class \code{matrix} (inherits from \code{array}) with 150 rows and 150 columns.
}
\usage{
data("NetRep")
}
\description{
Example gene coexpression networks inferred from two independent datasets 
to demonstrate the usage of package functions.
}
\details{
The \link[=modulePreservation]{preservation of network modules} in a second
  dataset is quantified by measuring the preservation of topological
  properties between the \emph{discovery} and \emph{test} datasets. These 
  properties are calculated not only from the interaction networks inferred
  in each dataset, but also from the data used to infer those networks (e.g.
  gene expression data) as well as the correlation structure between 
  variables/nodes. Thus, all functions in the \code{NetRep} package have the 
  following arguments: 
  \describe{
    \item{\code{network}:}{
      a list of interaction networks, one for each dataset.
    }
    \item{\code{data}:}{
      a list of data matrices used to infer those networks, one for each 
      dataset.
    }
    \item{\code{correlation}:}{
     a list of matrices containing the pairwise correlation coefficients 
     between variables/nodes in each dataset.
    } 
    \item{\code{moduleAssignments}:}{
     a list of vectors, one for each \emph{discovery} dataset, containing 
     the module assignments for each node in that dataset.
    }
    \item{\code{modules}:}{
     a list of vectors, one vector for each \emph{discovery} dataset, containing
     the names of the modules from that dataset to analyse.  
    }
    \item{\code{discovery}:}{
      a vector indicating the names or indices of the previous arguments' 
      lists to use as the \emph{discovery} dataset(s) for the analyses.
    }
    \item{\code{test}:}{
      a list of vectors, one vector for each \emph{discovery} dataset, 
      containing the names or indices of the \code{network}, \code{data}, and 
      \code{correlation} argument lists to use as the \emph{test} dataset(s) 
      for the analysis of each \emph{discovery} dataset.
    }
  }
  This data is used to provide concrete examples of the usage of these 
  arguments in each package function.
}
\section{Simulation details}{

  The \emph{discovery} gene expression dataset (\code{"discovery_data"})
  containing 30 samples and 150 genes was simulated to contain four distinct
  modules of sizes 20, 25, 30, and 35 genes. Data for each module were
  simulated as:
  \deqn{
     G^{(w)}_{simulated} = E^{(w)} r_i + \sqrt{1 - r^2_i} \epsilon
   }
   Where \eqn{E^{(w)}} is the simulated module's \emph{summary vector}, 
   \eqn{r} is the simulated module's \emph{node contributions} for each gene,
   and \eqn{\epsilon} is the error term drawn from a standard normal 
   distribution. \eqn{E^{(w)}} and \eqn{r} were simulated by bootstrapping 
   (sampling with replacement) samples and genes from the corresponding 
   vectors in modules 63, 51, 57, and 50 discovered in the liver tissue gene 
   expression data from a 
   \href{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE2814}{publicly 
   available} mouse dataset (see reference \emph{(1)} for details on the 
   dataset and network discovery). The remaining 40 genes that were not part 
   of any module were simulated by randomly selecting 40 liver genes and 
   bootstrapping 30 samples and adding the noise term, \eqn{\epsilon}. A
   vector of module assignments was created ("module_labels") in which
   each gene was labelled with a number 1-4 corresponding to the module they
   were simulated to be coexpressed with, or a label of 0 for the for the 40
   "background" genes not participating in any module. The correlation
   structure ("discovery_correlation") was calculated as the Pearson's
   correlation coefficient between genes 
   (cor(discovery_data)). Edge weights in the
   interaction network ("discovery_network") were calculated as the
   absolute value of the correlation coefficient exponentiated to the power 5
   (abs(discovery_correlation)^5).
   
   An independent test dataset ("test_data") containing the same 150
   genes as the \emph{discovery} dataset but 30 different samples was
   simulated as above. Modules 1 and 4 (containing 20 and 35 genes
   respectively) were simulated to be preserved using the same equation
   above, where the \emph{summary vector} \eqn{E^{(w)}} was bootstrapped from
   the same liver modules (modules 63 and 50) as in the \emph{discovery} and
   with identical \emph{node contributions} \eqn{r} as in the
   \emph{discovery} dataset. Genes in modules 2 and 3 were simulated as
   "background" genes, \emph{i.e.} not preserved as described above. The
   correlation structure between genes in the \emph{test} dataset
   ("test_correlation") and the interaction network
   ("test_network") were calculated the same way as in the
   \emph{discovery} dataset.

   The random seed used for the simulations was 37.
}

\references{
\enumerate{
    \item{
     Ritchie, S.C., \emph{et al.}, \emph{A scalable permutation approach 
     reveals replication and preservation patterns of network modules in 
     large datasets}. Cell Systems. \strong{3}, 71-82 (2016).
    }
 }
}
\seealso{
\code{\link{modulePreservation}}, \code{\link{plotModule}}, and
  \code{\link{networkProperties}}.
}
\keyword{datasets}
