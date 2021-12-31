library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x = ageCategory, fill = animal)) + 
  # 다음에는 어떤 인수값을 넣어야 할까요?
  geom_bar(position = "fill") +
  facet_wrap(facets = ~shotsCurrent, scale = "free_x")