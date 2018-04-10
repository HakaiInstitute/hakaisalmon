library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
stomach_metadata <- gs_read(inventory, "stomach_metadata")

write_csv(stomach_metadata, "data-raw/stomach_metadata.csv")
devtools::use_data(stomach_metadata, overwrite = TRUE)


