library(tidyverse)
library(lubridate)
library(googlesheets)
db_wip <- gs_title('Database WIP')
package_data <- gs_read(db_wip, ws = "package_data")

write_csv(package_data, "data-raw/package_data.csv")
devtools::use_data(package_data, overwrite = TRUE)

