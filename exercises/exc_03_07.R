suppressPackageStartupMessages(library(dplyr))
biopics <- readRDS("data/biopics.rds")

biopicsArt <- biopics %>%
  filter(____ %in% ____)

head(biopicsArt)