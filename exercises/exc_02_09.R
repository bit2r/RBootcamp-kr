library(ggplot2)
pets <- read.csv("data/pets.csv")

ggplot(pets, aes(x = ageCategory, fill = ____)) + 
  # 다음에는 어떤 인수값을 넣어야 할까요?
  geom_bar(position = ____) +
  facet_wrap(facets = ____, scale = ____)
