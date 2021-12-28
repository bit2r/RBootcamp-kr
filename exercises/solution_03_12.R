library(dplyr)
biopics <- readRDS("data/biopics.rds")

# 코드 1
biopics %>% 
  filter(year_release > 1998) %>% 
  head()

# 코드 2
biopics %>% 
  mutate(isNewer = year_release > 1998) %>% 
  head()