library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
site_activity <- gs_read(db_wip, ws = "site_activity")

write_csv(site_activity, "data-raw/site_activity.csv")
devtools::use_data(site_activity, overwrite = TRUE)

