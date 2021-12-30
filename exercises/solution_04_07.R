library(tidyr)
library(dplyr)
library(ggplot2)
MouseBalanceTimeSeries <- read.csv("data/mouse.csv", row.names = 1)

gatheredMouse <- MouseBalanceTimeSeries %>% 
  pivot_longer(cols = -mouseID, 
               names_to = "measurementStatus", 
               values_to = "time") %>% 
  filter(!is.na(time)) %>% 
  # measurementStatus를 두개의 변수로 분리
  separate(measurementStatus, 
           c("intervention", "replicate"), 
           sep = "Treat")

ggplot(gatheredMouse, aes(x = intervention, y = time)) + 
  geom_boxplot()
