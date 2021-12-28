library(dplyr)
biopics <- readRDS("data/biopics.rds")

# 여기에 mutate()을 사용해서 race_and_gender 변수를 파생하세요. 
biopics2 <- mutate(biopics, race_and_gender = paste(subject_race, subject_sex))

# head()로 biopics2의 앞 부분 몇 건을 조회합니다.
head(biopics2)
