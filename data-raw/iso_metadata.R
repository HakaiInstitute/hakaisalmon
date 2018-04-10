library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
iso_metadata <- gs_read(inventory, "iso_metadata")

write_csv(iso_metadata, "data-raw/iso_metadata.csv")
devtools::use_data(iso_metadata, overwrite = TRUE)


