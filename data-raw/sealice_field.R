library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
sealice_field <- gs_read(db_wip, ws = "sealice_field")

write_csv(sealice_field, "data-raw/sealice_field.csv")
devtools::use_data(sealice_field, overwrite = TRUE)

