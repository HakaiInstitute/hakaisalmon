library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
ysi <- gs_read(db_wip, ws = "ysi")

write_csv(ysi, "data-raw/ysi.csv")
devtools::use_data(ysi, overwrite = TRUE)

