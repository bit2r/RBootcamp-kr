suppressPackageStartupMessages(library(dplyr))

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 어부 여부별 평균과 표준편차 계산
fishdata %>%
  group_by(___) %>%
  summarize(mean_total_mercury = ___, 
            sd_total_mercury = ___)
