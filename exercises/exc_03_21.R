suppressPackageStartupMessages(library(dplyr))
library(ggplot2)
biopics <- readRDS("data/biopics.rds")

bPlot <- biopics %>%
  ____ %>%
  ____ %>%
  ggplot() +
  ____()

print(bPlot)
