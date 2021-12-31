suppressPackageStartupMessages(library(dplyr))
library(ggplot2)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# x-축은 weight, y-축은 total_mercury인 산점도를 그리되,
# 점의 색상은 범주형 변수인 fisherman를 사용합니다.
ggplot(fishdata, aes(___, ___, color = ___)) + 
  ___

# x-축은 fishmlwk, y-축은 total_mercury인 산점도를 그리되,
# 점의 색상은 범주형 변수인 fisherman를 사용합니다.
ggplot(fishdata,aes(___, ___, color = ___)) + 
  ___

