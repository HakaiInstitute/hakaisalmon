library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
stock_id <- gs_read(db_wip, ws = "stock_id")

write_csv(stock_id, "data-raw/stock_id.csv")
devtools::use_data(stock_id, overwrite = TRUE)

