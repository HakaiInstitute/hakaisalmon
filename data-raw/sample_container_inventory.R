library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
sample_container_inventory <- gs_read(inventory, "sample_container_inventory")

write_csv(sample_container_inventory, "data-raw/sample_container_inventory.csv")
devtools::use_data(sample_container_inventory, overwrite = TRUE)


