library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
seine_data <- gs_read(db_wip, ws = "seine_data")

write_csv(seine_data, "data-raw/seine_data.csv")
devtools::use_data(seine_data, overwrite = TRUE)

