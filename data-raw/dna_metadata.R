library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_title('SEMSP Sample Inventory')
dna_metadata <- gs_read(inventory, "dna_metadata")

write_csv(dna_metadata, "data-raw/dna_metadata.csv")
devtools::use_data(dna_metadata, overwrite = TRUE)


