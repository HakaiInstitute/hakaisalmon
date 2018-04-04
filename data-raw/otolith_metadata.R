library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
otolith_metadata <- gs_read(inventory, "otolith_metadata")

write_csv(otolith_metadata, "data-raw/otolith_metadata.csv")
devtools::use_data(otolith_metadata, overwrite = TRUE)


