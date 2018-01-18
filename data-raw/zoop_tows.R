library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
zoop_tows <- gs_read(db_wip, ws = "zoop_tows")

write_csv(zoop_tows, "data-raw/zoop_tows.csv")
devtools::use_data(zoop_tows, overwrite = TRUE)

