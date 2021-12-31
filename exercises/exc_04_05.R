suppressPackageStartupMessages(library(dplyr))
library(tidyr)
suppressPackageStartupMessages(library(readr))
health_code_example <- 
  read_csv("data/healthExample.csv", show_col_types = FALSE)

health_code_separated <- health_code_example %>%
  separate(
    col = ____, 
    into = c(____, ____), 
    sep = ____)
        
patients410 <- health_code_separated %>% 
  filter(HealthCode == ____)

patients410
