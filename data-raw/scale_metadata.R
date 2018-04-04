library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
scale_metadata <- gs_read(inventory, "scale_metadata")

write_csv(scale_metadata, "data-raw/scale_metadata.csv")
devtools::use_data(scale_metadata, overwrite = TRUE)


