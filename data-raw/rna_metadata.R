library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
rna_metadata <- gs_read(inventory, "rna_metadata")

write_csv(rna_metadata, "data-raw/rna_metadata.csv")
devtools::use_data(rna_metadata, overwrite = TRUE)


