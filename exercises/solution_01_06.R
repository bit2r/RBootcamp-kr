library(ggplot2)
gap1992 <- read.csv("data/gap1992.csv")

ggplot(gap1992, aes(x = log(gdpPercap), y = lifeExp, color=continent)) +
## 여기에 코드를 추가합니다.
  geom_line() + geom_point()
