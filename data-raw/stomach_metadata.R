library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
stomach_metadata <- gs_read(inventory, "stomach_metadata")

write_csv(stomach_metadata, "data-raw/stomach_metadata.csv")
devtools::use_data(stomach_metadata, overwrite = TRUE)


