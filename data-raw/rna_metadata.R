library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
rna_metadata <- gs_read(inventory, "rna_metadata")

write_csv(rna_metadata, "data-raw/rna_metadata.csv")
devtools::use_data(rna_metadata, overwrite = TRUE)


