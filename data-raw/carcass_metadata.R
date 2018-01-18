library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
carcass_metadata <- gs_read(inventory, "carcass_metadata")

write_csv(carcass_metadata, "data-raw/carcass_metadata.csv")
devtools::use_data(carcass_metadata, overwrite = TRUE)


