suppressPackageStartupMessages(library(dplyr))

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 단순 선형회귀 모델 적합
fit_univariate <- lm(___ ~ ___, data = fishdata)

# 독립변수 fisherman, weight, fishmlwk의 다중 선형회귀 모델 적합 
fit_multiple <- lm(___ ~ ___, data = fishdata)

# 결과 확인하기
summary(fit_univariate)
summary(fit_multiple)
