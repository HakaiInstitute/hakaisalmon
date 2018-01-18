library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
fa_metadata <- gs_read(inventory, "fa_metadata")

write_csv(fa_metadata, "data-raw/fa_metadata.csv")
devtools::use_data(fa_metadata, overwrite = TRUE)


