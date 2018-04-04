library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
bycatch_mort <- gs_read(db_wip, ws = "bycatch_mort")

write_csv(bycatch_mort, "data-raw/bycatch_mort.csv")
devtools::use_data(bycatch_mort, overwrite = TRUE)

