% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exportUtilsDatamart.R
\name{getModelsFromDatamart}
\alias{getModelsFromDatamart}
\title{Retrieves ADM models from the ADM Datamart.}
\usage{
getModelsFromDatamart(conn, appliesToFilter = NULL, ruleNameFilter = NULL,
  applicationFilter = NULL, mostRecentOnly = T, verbose = T)
}
\arguments{
\item{conn}{Connection to the database}

\item{appliesToFilter}{Optional filter on the \code{AppliesTo} class. Can be a list, matching is exact.}

\item{ruleNameFilter}{Optional filter on the ADM rule name. Can be a list, matching is exact.}

\item{applicationFilter}{Optional filter on the application field. Can be a list, matching is exact.}

\item{mostRecentOnly}{Only return results for latest snapshot. Currently this works as a global filter, which is ok
because the snapshot agent will also snapshot all models wholesale. If and when that becomes more granular, we may
need to make this more subtle, so take the latest after grouping by pyconfigurationname, pyappliestoclass, pxapplication.}

\item{verbose}{Set to \code{TRUE} to show database queries.}
}
\value{
A \code{data.table} with the ADM model details. The names are lowercased so processing of the results is not dependent on DB type.
}
\description{
Reads either all or a selection of the ADM models stored in the ADM datamart into a \code{data.table}. Filters
can be passed in to select a particular \code{AppliesTo} classes, particular ADM rules or particular applications.
By default the method gets only the most recent snapshots but you can obtain the full history too, if available. To
prevent possible OOM errors reading the full table, the retrieval will be batched.
}
\examples{
\dontrun{models <- getModelsFromDatamart(conn)}
\dontrun{allModels <- getModelsFromDatamart(conn, mostRecentOnly = F)}
}
