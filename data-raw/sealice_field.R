library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
sealice_field <- gs_read(db_wip, ws = "sealice_field")

write_csv(sealice_field, "data-raw/sealice_field.csv")
devtools::use_data(sealice_field, overwrite = TRUE)

