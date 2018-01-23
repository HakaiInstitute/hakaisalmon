# This file will re-write the dataset for the hakaisalmon R package by
# downloading the most current data from the program WIP database on
# google sheets. This is available so that one can easily work with the most
# current program data

# Remember to first delete all old .rda files in /data folder otherwise they
# become corrupt. (Deleting, commiting, pushing, and then rebuilding worked
#last time.
file_sources = list.files(("~/Documents/Projects/hakaisalmon/data-raw"),
                         pattern ="*.R$", full.names=TRUE,
                         ignore.case=TRUE)

for (f in file_sources) {
  source(f)
  Sys.sleep(30) # Have to include a pause so google doesnt get too many requests
}
