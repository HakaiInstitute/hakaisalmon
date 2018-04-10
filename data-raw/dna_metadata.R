library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
dna_metadata <- gs_read(inventory, "dna_metadata")

write_csv(dna_metadata, "data-raw/dna_metadata.csv")
devtools::use_data(dna_metadata, overwrite = TRUE)


