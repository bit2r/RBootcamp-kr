library(dplyr)
biopics <- readRDS("data/biopics.rds")

gender_box_office <- biopics %>% 
    filter(----) %>%
    group_by(----) %>% 
    summarize(mean_bo_by_gender = ----)
    
## gender_box_office의 앞부분 몇 건 조회
head(gender_box_office)
