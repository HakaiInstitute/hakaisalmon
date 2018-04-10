library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
fa_metadata <- gs_read(inventory, "fa_metadata")

write_csv(fa_metadata, "data-raw/fa_metadata.csv")
devtools::use_data(fa_metadata, overwrite = TRUE)


