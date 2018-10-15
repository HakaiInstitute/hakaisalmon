library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key('1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs', visibility = "private", lookup = FALSE)
sample_container_inventory <- gs_read(inventory, "sample_container_inventory")

write_csv(sample_container_inventory, "data-raw/sample_container_inventory.csv")
devtools::use_data(sample_container_inventory, overwrite = TRUE)


