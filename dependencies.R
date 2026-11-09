# Packages used across the workshop sessions.
# This file is never run. It lists every package so that renv::init() and
# renv::snapshot() record all of them in renv.lock, including packages that
# the workbook itself does not load.

# Intro to R
library(tidyverse)
library(readxl)
library(janitor)
library(vroom)
library(data.table)
library(here)
library(skimr)
library(arsenal)
library(gtsummary)
library(patchwork)
library(ggrepel)
library(pheatmap)
library(usethis)
library(R.utils)
library(rmarkdown)
library(knitr)

# Single-cell session
library(Seurat)
library(harmony)
library(DirichletReg)
library(multtest)
library(presto)

# Installers
library(BiocManager)
library(remotes)
