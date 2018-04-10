library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
sealice_lab_motiles <- gs_read(db_wip, ws = "sealice_lab_motiles")

write_csv(sealice_lab_motiles, "data-raw/sealice_lab_motiles.csv")
devtools::use_data(sealice_lab_motiles, overwrite = TRUE)

