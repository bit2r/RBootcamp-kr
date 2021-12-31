suppressPackageStartupMessages(library(dplyr))
library(tidyr)
library(ggplot2)
fertilityTidy <- read.csv("data/fertility_tidy.csv")

fertilityMeanByCountry <- fertilityTidy %>%

# fertlityMeanByCountry를 조회합니다.
fertilityMeanByCountry

fertilityMeanByYear <- fertilityTidy %>%

# fertilityMeanByYear를 조회합니다.
fertilityMeanByYear
