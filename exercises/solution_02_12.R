library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x = animal, y = weight, fill = animal)) + 
  # 다음에 무엇을 입력해야 할까요?
  geom_violin()