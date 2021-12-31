suppressPackageStartupMessages(library(dplyr))
biopics <- readRDS("data/biopics.rds")

threeVarTable <- biopics %>% 
  select(____, ____, ____)

head(threeVarTable)