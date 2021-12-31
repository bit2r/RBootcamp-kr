library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x = animal, y = weight, fill = animal)) + 
  # 박스 플롯과 바이올린 플롯을 서로 다른 레이어로 출력하세요.
  geom_boxplot() + 
  geom_violin()

