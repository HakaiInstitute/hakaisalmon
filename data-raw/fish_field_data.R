library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
fish_field_data <- gs_read(db_wip, ws = "fish_field_data")

write_csv(fish_field_data, "data-raw/fish_field_data.csv")
devtools::use_data(fish_field_data, overwrite = TRUE)

