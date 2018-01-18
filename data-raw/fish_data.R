library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
fish_field_data <- gs_read(db_wip, ws = "fish_field_data")
fish_lab_data <- gs_read(db_wip, ws = "fish_lab_data")

fish_data <- left_join(fish_field_data, fish_lab_data, by = c("ufn", "semsp_id"))

write_csv(fish_data, "data-raw/fish_data.csv")
devtools::use_data(fish_data, overwrite = TRUE)

