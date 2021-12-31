suppressPackageStartupMessages(library(dplyr))
library(ggplot2)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 총 수은의 분포 출력
ggplot(fishdata, aes(x = ___, y = ___)) + 
  geom_boxplot() +
  stat_summary(fun = "mean", geom = "point", pch = 3, color = "red")
