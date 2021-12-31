suppressPackageStartupMessages(library(dplyr))
library(broom)
library(ggplot2)

fishdata <- read.csv("data/fisherman_mercury_modified.csv") %>%
  mutate(fisherman = factor(fisherman))

# 여기에 두 모델이 있습니다.
fit_univariate <- lm(total_mercury ~ fisherman, data = fishdata)
fit_multiple <-
  lm(total_mercury ~ fisherman + weight + fishmlwk, data = fishdata)

# 개별 관측치 레벨(행별로)로 예측된 데이터와 관련 정보
fit_multiple_augment <- augment(fit_multiple)
fit_univariate_augment <- augment(fit_univariate)

# 두 모델을 묶습니다.
augmented_data <- bind_rows("univariate" = fit_univariate_augment,
                            "multiple" = fit_multiple_augment,
                            .id = "model")

# 총 수은(x-축)과 예측값 (y-축)의 산점도로 fishmlwk로 색상과 fisherman로 포인트의 심볼 표현
ggplot(augmented_data,
       aes(
         x = total_mercury,
         y = .fitted,
         color = fishmlwk,
         shape = fisherman
       )) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  facet_wrap(~model)
