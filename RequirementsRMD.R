# =========================
# Requirements.R
# =========================
# This script installs all packages required for the RMD Main_analysis_script
# It installs CRAN, Bioconductor, and GitHub packages if not already installed,
# then loads them for use.

# -------------------------
# Helper function to install missing packages
# -------------------------
install_if_missing <- function(pkg, repo = "CRAN") {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message("Installing ", pkg, " from ", repo)
    if (repo == "CRAN") {
      install.packages(pkg)
    } else if (repo == "Bioconductor") {
      if (!requireNamespace("BiocManager", quietly = TRUE))
        install.packages("BiocManager")
      BiocManager::install(pkg)
    } else if (repo == "GitHub") {
      if (!requireNamespace("remotes", quietly = TRUE))
        install.packages("remotes")
      remotes::install_github(pkg)
    }
  }
}

# -------------------------
# CRAN packages
# -------------------------
cran_pkgs <- c("Seurat", "tidyverse", "devtools", "dplyr", "forcats",
               "ggplot2", "igraph", "tidyr")
for (pkg in cran_pkgs) install_if_missing(pkg, repo = "CRAN")

# -------------------------
# Bioconductor packages
# -------------------------
bioc_pkgs <- c("STRINGdb", "org.Hs.eg.db", "clusterProfiler", "biomaRt")
for (pkg in bioc_pkgs) install_if_missing(pkg, repo = "Bioconductor")

# -------------------------
# GitHub packages
# -------------------------
github_pkgs <- c("mojaveazure/seurat-disk", "immunogenomics/presto")
for (pkg in github_pkgs) install_if_missing(pkg, repo = "GitHub")

# -------------------------
# Load all packages
# -------------------------
library(biomaRt)
library(clusterProfiler)
library(dplyr)
library(forcats)
library(ggplot2)
library(igraph)
library(org.Hs.eg.db)
library(RCy3)
library(Seurat)
library(SeuratDisk)
library(STRINGdb)
library(tidyr)
library(tidyverse)