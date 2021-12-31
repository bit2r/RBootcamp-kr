library(ggplot2)
gap1992 <- read.csv("data/gap1992.csv")

ggplot(gap1992, 
       aes(x = ___, 
           y = ___, 
           color = ___,
           size = ___
      )
    ) + 
  ___() +
  ggtitle("Gapminder for 1992")
