suppressPackageStartupMessages(library(dplyr))
library(tidyr)
library(stringr)
dem_score <- read.csv("data/dem_score.csv")

gatheredData <- dem_score %>% 
  pivot_longer(cols = -country, 
               names_to = "year",
               values_to = "score") %>%
  mutate(year=str_replace(year, "X", ""))

spreadData <- gatheredData %>% 
  pivot_wider(names_from = "----",
              values_from = "----")

# 행의 수와 열의 수를 조회합니다. 
dim(spreadData)

# 앞의 몇건에 대해서 첫 8개 컬럼만 출력합니다.
head(spreadData[, 1:8])
