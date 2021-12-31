suppressPackageStartupMessages(library(dplyr))

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 데이터 구조 파악
glimpse(___)

# 어부여부별(fisherman) 돗수분포표 작성
fishdata %>% 
  select(___) %>% 
  mutate(___ = ifelse(fisherman == 1, "1.어부", "0.어부아님")) %>% 
  table() 

# 어부여부별(fisherman) 물고기 부위별(fishpart) 분할표 생성
fishdata %>% 
  select(___, ___) %>% 
  mutate(___ = ifelse(fisherman == 1, "어부", "어부아님")) %>% 
  mutate(___ = case_when(
    fishpart == 0 ~ "0.없음", 
    fishpart == 1 ~ "1.살코기만 섭취",
    fishpart == 2 ~ "2.살코기와 가끔 통째 섭취",
    fishpart == 3 ~ "3.통째 섭취")) %>% 
  table()


