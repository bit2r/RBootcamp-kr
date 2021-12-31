suppressPackageStartupMessages(library(dplyr))

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 어부 여부별 평균과 표준편차 계산
fishdata %>%
  group_by(fisherman) %>%
  summarize(mean_total_mercury = mean(total_mercury), 
            sd_total_mercury = sd(total_mercury))
