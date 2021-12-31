suppressPackageStartupMessages(library(dplyr))
biopics <- readRDS("data/biopics.rds")

gender_box_office <- biopics %>% 
    filter(!is.na(box_office)) %>%
    group_by(subject_sex) %>% 
    summarize(mean_bo_by_gender = mean(box_office))

# gender_box_office의 앞부분 몇 건 조회
head(gender_box_office)
