suppressPackageStartupMessages(library(dplyr))

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# t-검정으로 어부와 어부가 아닌 그룹간의 총 수은의 평균의 비교합니다.
# 힌트: 인수로 모델 수식(model formula)을 사용합니다. ?t.test로 도움말을 참고하세요.
t.test(total_mercury ~ fisherman, data = fishdata)
