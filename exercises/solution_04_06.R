library(tidyr)
library(dplyr)
library(ggplot2)
fertilityTidy <- read.csv("data/fertility_tidy.csv")

fertilityMeanByCountry <- fertilityTidy %>% 
  group_by(Country) %>% 
  summarize(meanCountryRate = mean(fertilityRate))
    
# fertlityMeanByCountry를 조회합니다.
fertilityMeanByCountry
        
fertilityMeanByYear <- fertilityTidy %>% 
  group_by(Year) %>% 
  summarize(meanYearRate = mean(fertilityRate))
        
# fertilityMeanByYear를 조회합니다.
fertilityMeanByYear
