library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
sealice_metadata <- gs_read(inventory, "sealice_metadata")

write_csv(sealice_metadata, "data-raw/sealice_metadata.csv")
devtools::use_data(sealice_metadata, overwrite = TRUE)


