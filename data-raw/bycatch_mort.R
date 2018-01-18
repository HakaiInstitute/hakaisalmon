library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
bycatch_mort <- gs_read(db_wip, ws = "bycatch_mort")

write_csv(bycatch_mort, "data-raw/bycatch_mort.csv")
devtools::use_data(bycatch_mort, overwrite = TRUE)

