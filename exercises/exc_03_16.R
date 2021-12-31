suppressPackageStartupMessages(library(dplyr))
biopics <- readRDS("data/biopics.rds")

biopics_sorted <- biopics %>%
  arrange(____, ____)

head(biopics_sorted)