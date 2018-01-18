library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
finclip_metadata <- gs_read(inventory, "finclip_metadata")

write_csv(finclip_metadata, "data-raw/finclip_metadata.csv")
devtools::use_data(finclip_metadata, overwrite = TRUE)


