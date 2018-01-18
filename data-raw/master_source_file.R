file_sources = list.files(path = "~/Documents/Projects/hakaisalmon/data-raw",
                          pattern="*.R$")

sapply(file_sources, source, .GlobalEnv)

source
