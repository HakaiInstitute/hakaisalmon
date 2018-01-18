library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
survey_data <- gs_read(db_wip, ws = "survey_data")

survey_data <- survey_data %>%
  mutate(sampling_week = as.numeric((yday(survey_date) + 4) %/% 7))

survey_data <- survey_data %>%
  mutate(sampling_week = recode_factor(survey_data$sampling_week, `18` = "May 5", `19` = "May 12" ,
                                       `20` = "May 19", `21` = "May 26", `22` = "June 2",
                                       `23` = "June 9", `24` = "June 16", `25` = "June 23",
                                       `26` = "June 30", `27` = "July 6", `28` = "July 13"))

seine_data <- gs_read(db_wip, ws = "seine_data")
survey_seines <- left_join(seine_data, survey_data, by = "survey_id")

fish_field_data <- gs_read(db_wip, ws = "fish_field_data")
fish_lab_data <- gs_read(db_wip, ws = "fish_lab_data")
fish_data <- left_join(fish_field_data, fish_lab_data, by = c("ufn", "semsp_id"))

survey_seines_fish <- left_join(fish_data, survey_seines, by = "seine_id")

write_csv(survey_seines_fish, "data-raw/survey_seines_fish.csv")
devtools::use_data(survey_seines_fish, overwrite = TRUE)

