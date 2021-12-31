library(ggplot2)
pets <- read.csv("data/pets.csv")

# pets에서 유효한 변수를 찾아 fill에 매핑합니다.
ggplot(pets, aes(x = animal, fill = ___)) + 
  geom_bar(color = "black")
