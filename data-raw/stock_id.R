library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
stock_id <- gs_read(db_wip, ws = "stock_id")

write_csv(stock_id, "data-raw/stock_id.csv")
devtools::use_data(stock_id, overwrite = TRUE)

