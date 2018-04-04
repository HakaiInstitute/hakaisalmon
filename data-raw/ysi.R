library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
ysi <- gs_read(db_wip, ws = "ysi")

write_csv(ysi, "data-raw/ysi.csv")
devtools::use_data(ysi, overwrite = TRUE)

