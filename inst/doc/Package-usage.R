## ---- include = FALSE--------------------------------------------------------------
knitr::opts_chunk$set(fig.align = "center")
old_options <- options(scipen = 6, width = 85)

## ----results = "hide"--------------------------------------------------------------
# Save the path to the initial directory for later clean-up
old_dir <- getwd()
# Create a directory to put the fasta files for this example
dir.create("concatipede_test")
# Set it as the working directory
setwd("concatipede_test")
# Copy the example fasta files shipped with the package into that directory
example_files = list.files(system.file("extdata", package="concatipede"), full.names = TRUE)
file.copy(from = example_files, to = getwd())

## ----message = FALSE---------------------------------------------------------------
library(concatipede)
library(tidyverse)
find_fasta()

## ----------------------------------------------------------------------------------
concatipede_prepare(out = "seqnames")

## ---- echo=FALSE, results="hide", message=FALSE, warning =FALSE--------------------
# load the libraries without having any message printed
library(DT)
library(tidyverse)

## ----message = FALSE---------------------------------------------------------------
concatipede(filename = "Macrobiotidae_seqnames.xlsx", out = "Macrobiotidae_4genes", excel.sheet = 1)

## ---- echo=FALSE, fig.width = 10, fig.height = 3, message = FALSE------------------
old_par <- par(mar=c(1,12,1,1))
image(concatipede(filename = "Macrobiotidae_seqnames.xlsx",out="Macrobiotidae_4genes",excel.sheet = 1),cex=0.5)

## ----message = FALSE---------------------------------------------------------------
concatipede(filename = "Macrobiotidae_seqnames.xlsx",out="Macrobiotus_4genes",excel.sheet = 2)

## ---- echo=FALSE, fig.width = 10, fig.height = 1.5, message = FALSE----------------
par(mar=c(1,12,1,1))
image(concatipede(filename = "Macrobiotidae_seqnames.xlsx",out="Macrobiotus_4genes",excel.sheet = 2),cex=0.5)

## ----message = FALSE---------------------------------------------------------------
concatipede(filename = "Macrobiotidae_seqnames.xlsx",out="Macrobiotidae_COI",excel.sheet = 3)

## ---- echo=FALSE, fig.width = 10, fig.height = 3, message = FALSE------------------
par(mar=c(1,12,1,1))
image(concatipede(filename = "Macrobiotidae_seqnames.xlsx",out="Macrobiotidae_COI",excel.sheet = 3),cex=0.5)

## ----------------------------------------------------------------------------------
genbank.table = get_genbank_table(filename = "Macrobiotidae_seqnames.xlsx", excel.sheet = 1)

## ---- echo=FALSE-------------------------------------------------------------------
get_genbank_table(filename = "Macrobiotidae_seqnames.xlsx", excel.sheet = 1) %>% datatable(extensions = 'Buttons',
            options = list(dom = 'Blfrtip',
                           rownames = F,
                           buttons = c('excel'),
                           scrollX=TRUE,
                           lengthMenu = list(c(nrow(.),25,50,-1),
                                             c(nrow(.),25,50,"All"))))

## ----eval = FALSE------------------------------------------------------------------
#  rename_sequences(filename = "Macrobiotidae_seqnames.xlsx", excel.sheet = 1, marker_names = c("COI","ITS2","LSU","SSU"))

## ---- fig.width = 10, fig.height = 3, message = FALSE------------------------------
find_fasta() %>%
  concatipede_prepare() %>%
  write_xl("template.xlsx") %>%
  auto_match_seqs() %>%
  write_xl("template_automatched.xlsx") %>%
  concatipede() %>%
  write_fasta("merged-seqs.fasta") %>%
  image(cex=0.3)

## ----------------------------------------------------------------------------------
# Clean-up: go back to initial directory
setwd(old_dir)

## ----echo = FALSE-------------------------------------------------------------
# Invisible clean-up
par(old_par)
options(old_options)

