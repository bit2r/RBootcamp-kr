suppressPackageStartupMessages(library(dplyr))
library(tidyr)
library(ggplot2)
MouseBalanceTimeSeries <- read.csv("data/mouse.csv", row.names = 1)

gatheredMouse <- MouseBalanceTimeSeries %>% 
  pivot_longer(____) %>%
  filter(!is.na(time)) %>% 
  # measurementStatus를 두개의 변수로 분리
  separate(____)

ggplot(gatheredMouse, aes(x = intervention, y = time)) + 
  geom_boxplot()
