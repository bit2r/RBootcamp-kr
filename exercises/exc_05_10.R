suppressPackageStartupMessages(library(dplyr))
library(broom)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 여기 모형이 있습니다.
fit_multiple <-
  lm(total_mercury ~ fisherman + weight + fishmlwk, data = fishdata)

# R^2는 어디에 있나요? 모델 집계 목록을 다시 한번 보세요. 
names(summary(fit_multiple))

# R^2 이름으로 조회합니다.
___$___

# 혹은 glance를 사용할 수 있습니다.
# 실습 환경상의 특성으로 인해 결과를 나눠서 출력합니다.
glance(___)[, 1:7]
glance(___)[, 8:13]

# 그리고, R^2만 선택합니다.
glance(___) %>% select(___)

