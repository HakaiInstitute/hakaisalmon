library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
otolith_metadata <- gs_read(inventory, "otolith_metadata")

write_csv(otolith_metadata, "data-raw/otolith_metadata.csv")
devtools::use_data(otolith_metadata, overwrite = TRUE)


