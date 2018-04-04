library(tidyverse)
library(lubridate)
library(googlesheets)
inventory <- gs_key("1Ti5gGvakA4DUTjCUZ_VYHULU_FJCK05-zdly5E80Tzs", lookup = FALSE, visibility = "private")
xm_metadata <- gs_read(inventory, "xm_metadata")

write_csv(xm_metadata, "data-raw/xm_metadata.csv")
devtools::use_data(xm_metadata, overwrite = TRUE)


