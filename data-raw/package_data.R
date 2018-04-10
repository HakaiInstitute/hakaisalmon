library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_key("1hTC60Nc60k23rMMzcV9clPo4mcR1iqQYgKR2zD6nOfQ", lookup = FALSE, visibility = "private")
package_data <- gs_read(db_wip, ws = "package_data")

write_csv(package_data, "data-raw/package_data.csv")
devtools::use_data(package_data, overwrite = TRUE)

