library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")

fish_lab_data <- gs_read(db_wip, ws = "fish_lab_data") %>%
  filter(fish_lab_qc_flag == "N")

write_csv(fish_lab_data, "data-raw/fish_lab_data.csv")
devtools::use_data(fish_lab_data, overwrite = TRUE)

