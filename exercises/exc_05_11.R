suppressPackageStartupMessages(library(dplyr))
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 여기에 두 모델이 있습니다.
fit_univariate <- lm(total_mercury ~ fisherman, data = fishdata)
fit_multiple <-
  lm(total_mercury ~ fisherman + weight + fishmlwk, data = fishdata)

# 모델을 잘 정리합니다.
fit_univariate_tidy <- ____
  
fit_multiple_tidy <- ____
  
# 두 모델을 묶습니다.
both_tidy <- bind_rows("univariate" = ___,
                       "multiple" = ___,
                       .id = "model")
both_tidy

# glance로 개별 모델 정보를 한 줄로 묶습니다.
both_glance <- bind_rows(
  "univariate" = glance(___),
  "multiple" = glance(___),
  .id = "model"
)

# 실습 환경상의 특성으로 인해 결과를 나눠서 출력합니다.
# both_glance
both_glance[, 1:7]
both_glance[, 8:13]

# 어부 여부의 공변량 정보만 출력합니다.
both_tidy %>% ___(term == ___)
