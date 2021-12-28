library(dplyr)
biopics <- readRDS("data/biopics.rds")

# 여기에 filter 구문을 입력하세요.
crimeMovies <- filter(biopics, type_of_subject == "Criminal")

# crime 영화가 몇 건인지 확인하세요.
nrow(crimeMovies)
