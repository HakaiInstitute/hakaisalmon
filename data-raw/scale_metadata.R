library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
scale_metadata <- gs_read(inventory, "scale_metadata")

write_csv(scale_metadata, "data-raw/scale_metadata.csv")
devtools::use_data(scale_metadata, overwrite = TRUE)


