library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
survey_data <- gs_read(db_wip, ws = "survey_data")

survey_data <- survey_data %>%
  mutate(sampling_week = as.numeric((yday(survey_date) + 4) %/% 7))

survey_data <- survey_data %>%
  mutate(sampling_week = recode_factor(survey_data$sampling_week, `18` = "May 5", `19` = "May 12" ,
                                       `20` = "May 19", `21` = "May 26", `22` = "June 2",
                                       `23` = "June 9", `24` = "June 16", `25` = "June 23",
                                       `26` = "June 30", `27` = "July 6", `28` = "July 13"))


write_csv(survey_data, "data-raw/survey_data.csv")
devtools::use_data(survey_data, overwrite = TRUE)

