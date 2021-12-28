library(dplyr)
biopics <- readRDS("data/biopics.rds")

# 이 filter 구문 끝에 비교 연산 표현식을 추가하세요.
crimeFilms <- filter(biopics, year_release > 1980 & 
    type_of_subject == "Criminal" & person_of_color == FALSE)

# crimeFilms이 몇 건인지 보이세요.
nrow(crimeFilms)
