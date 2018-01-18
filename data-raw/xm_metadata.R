library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
xm_metadata <- gs_read(inventory, "xm_metadata")

write_csv(xm_metadata, "data-raw/xm_metadata.csv")
devtools::use_data(xm_metadata, overwrite = TRUE)


