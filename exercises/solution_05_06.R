suppressPackageStartupMessages(library(dplyr))
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

fishTtest <- t.test(total_mercury ~ fisherman, data = fishdata)

# 여기에 tidy()를 사용합니다.
tidyTtest <- tidy(fishTtest)

# glimpse()로 결과를 구조를 확인합니다.
glimpse(tidyTtest)

# p-value를 추출합니다.
tidyTtest$p.value
