library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
fish_lab_data <- gs_read(db_wip, ws = "fish_lab_data")

write_csv(fish_lab_data, "data-raw/fish_lab_data.csv")
devtools::use_data(fish_lab_data, overwrite = TRUE)

