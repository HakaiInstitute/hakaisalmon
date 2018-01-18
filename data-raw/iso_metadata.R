library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
iso_metadata <- gs_read(inventory, "iso_metadata")

write_csv(iso_metadata, "data-raw/iso_metadata.csv")
devtools::use_data(iso_metadata, overwrite = TRUE)


