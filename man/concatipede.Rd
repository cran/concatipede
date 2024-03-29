% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/concatipede.R
\name{concatipede}
\alias{concatipede}
\title{Concatenate alignments}
\usage{
concatipede(
  df = NULL,
  filename = NULL,
  format = c("fasta", "nexus", "phylip"),
  dir,
  plotimg = FALSE,
  out = NULL,
  remove.gaps = TRUE,
  write.outputs = TRUE,
  save.partitions = TRUE,
  excel.sheet = 1
)
}
\arguments{
\item{df}{The user-defined correspondence table, as a data frame or equivalent. This is used only if no \code{filename} argument is provided.}

\item{filename}{Filename of input correspondence table. Alternatively, if no filename is provided, the user can provide their own correspondence table as the \code{df} argument.}

\item{format}{a string specifying in what formats you want the alignment}

\item{dir}{Optional, path to the directory containing the fasta files. This argument has an effect only if fasta files names are taken from the columns of the \code{df} argument, and that \code{df} does not have an attribute \code{dir_name} itself. If no \code{dir} is provided and \code{df} does not have a \code{dir_name} attribute, the current working directory is ued with a warning.}

\item{plotimg}{Logical, save a graphical representation of the alignment in pdf format. Default: FALSE.}

\item{out}{specify outputs filenames}

\item{remove.gaps}{Logical, remove gap only columns. Useful if not using all sequences in the alignments. Default: TRUE.}

\item{write.outputs}{Logical, save concatenated alignment, partitions position table and graphical representation. If FALSE it overrides plotimg. Default: TRUE.}

\item{save.partitions}{Logical, save in the concatenated alignmeent directory a text file with partitions limits for the concatenated alignment. Default: TRUE.}

\item{excel.sheet}{specify what sheet from the excel spreadsheet has to be read. Either a string (the name of a sheet), or an integer (the position of the sheet).}
}
\value{
The concatenated alignment (invisibly if \code{out} is not NULL).
}
\description{
This function concatenate sequences from alignments present in the working directory based on a correspondence table and saves the output in a new directory
}
\examples{
dir <- system.file("extdata", package = "concatipede")
z <- concatipede(filename = paste0(dir,"/Macrobiotidae_seqnames.xlsx"), dir = dir,
                 write.outputs = FALSE)
z

}
