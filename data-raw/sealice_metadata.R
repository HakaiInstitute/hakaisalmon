library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
sealice_metadata <- gs_read(inventory, "sealice_metadata")

write_csv(sealice_metadata, "data-raw/sealice_metadata.csv")
devtools::use_data(sealice_metadata, overwrite = TRUE)


