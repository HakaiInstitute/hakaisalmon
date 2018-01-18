library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
seine_data <- gs_read(db_wip, ws = "seine_data")

write_csv(seine_data, "data-raw/seine_data.csv")
devtools::use_data(seine_data, overwrite = TRUE)

