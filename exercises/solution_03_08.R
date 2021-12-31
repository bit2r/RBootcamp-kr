suppressPackageStartupMessages(library(dplyr))
biopics <- readRDS("data/biopics.rds")

filteredBiopics <- filter(biopics, !is.na(box_office))

# biopics의 데이터 건수를 조회합니다.
nrow(biopics)
# filteredBiopics의 데이터 건수를 조회합니다.
nrow(filteredBiopics)
