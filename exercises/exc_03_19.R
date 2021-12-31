suppressPackageStartupMessages(library(dplyr))
biopics <- readRDS("data/biopics.rds")

biopics_by_country <- biopics %>%
  filter(year_release ____ & year_release ____) %>%
  filter(!is.na(box_office)) %>%
  mutate(box_office_per_subject = ____)

summary(biopics_by_country)
