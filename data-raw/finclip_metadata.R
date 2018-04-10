library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
finclip_metadata <- gs_read(inventory, "finclip_metadata")

write_csv(finclip_metadata, "data-raw/finclip_metadata.csv")
devtools::use_data(finclip_metadata, overwrite = TRUE)


