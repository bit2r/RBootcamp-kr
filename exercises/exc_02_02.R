library(ggplot2)
pets <- read.csv("data/pets.csv")

## 동물 이름별로 건수 세고, 막대 그래프의 기둥을 건수 크기로 채웁니다. 
## theme()는 텍스트의 라벨이 겹치지 않도록 출력 각도를 조정할 수 있습니다.
ggplot(pets, aes(x= -----)) + geom_bar() + 
    ## 더 나은 가독성을 취해서 x-축 텍스트에 각도를 부여합니다.
    theme(axis.text.x = element_text(angle=45))
