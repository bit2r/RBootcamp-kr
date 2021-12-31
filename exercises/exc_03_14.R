suppressPackageStartupMessages(library(dplyr))
biopics <- readRDS("data/biopics.rds")

gender_box_office <- biopics %>% 
    filter(____) %>%
    group_by(____) %>% 
    summarize(mean_bo_by_gender = ____)
    
# gender_box_office의 앞부분 몇 건 조회
head(gender_box_office)
