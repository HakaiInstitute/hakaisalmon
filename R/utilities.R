#' Download most recent field data set of observations from google
#'
#' Given a google workbook the function `salmon_event_occurrence_transform()` coerces
#' the Hakai JSP data standard file names to Darwin Core Archive observations
#'
#' @param percent The cumuative proportion of catch between 0 and 100 percent
#' @param date The julian date of capture
#'
#' @return
#' A dataframe with a date column and predicted cumulative proportion of catch
#' @export
#'
library(magrittr)
library(tidyverse)
url <- "https://docs.google.com/spreadsheets/d/1F04L3heVXck9Co6THrE8vMzuu3O4zq4NwxC8FJdL5Uk/"
new_survey_data <- googlesheets4::read_sheet(url,
                                             sheet = "survey_data")
new_seine_data <- googlesheets4::read_sheet(url,
                                            sheet = "seine_data")
new_fish_field_data <- googlesheets4::read_sheet(url,
                                                  sheet = "fish_field_data")
new_bycatch_mort <- googlesheets4::read_sheet(url,
                                              sheet = "bycatch_mort" )

sites <- googlesheets4::read_sheet(url,
                                   sheet = "sites")

survey_seines <- dplyr::right_join(new_survey_data, new_seine_data, by = "survey_id")

event <- tibble::tibble(eventID = survey_seines$seine_id,
                eventDate = lubridate::date(survey_seines$survey_date),
                decimalLatitude = survey_seines$lat,
                decimalLongitude = survey_seines$lon,
                geodeticDatum = "WGS84",
                minimumDepthInMeters = 0,
                maximumDepthInMeters = 9, # seine depth is 9 m
                samplingProtocol = "http://dx.doi.org/10.21966/1.566666", # This is the DOI for the Hakai Salmon Data Package that contains the sampling protocol, as well as the complete data package
                eventUncertaintyInMeters = 10
)

#TODO: Include bycatch data as well
# make table long first
seines_total_long <- survey_seines %>%
  select(seine_id,
         so_total,
         pi_total,
         cu_total,
         co_total,
         he_total,
         ck_total) %>%
  pivot_longer(-seine_id, names_to = "scientificName", values_to = "n")
seines_total_long$scientificName <-
  recode(
    seines_total_long$scientificName,
    so_total = "Oncorhynchus nerka",
    pi_total = "Oncorhynchus gorbuscha",
    cu_total = "Oncorhynchus keta",
    co_total = "Oncorhynchus kisutch",
    ck_total = "Oncorhynchus tshawytscha",
    he_total = "Clupea pallasii"
  )
seines_taken_long <- survey_seines %>%
  select(seine_id,
         so_taken,
         pi_taken,
         cu_taken,
         co_taken,
         he_taken,
         ck_taken) %>%
  pivot_longer(-seine_id, names_to = "scientificName", values_to = "n_taken")
seines_taken_long$scientificName <-
  recode(
    seines_taken_long$scientificName,
    so_taken = "Oncorhynchus nerka",
    pi_taken = "Oncorhynchus gorbuscha",
    cu_taken = "Oncorhynchus keta",
    co_taken = "Oncorhynchus kisutch",
    ck_taken = "Oncorhynchus tshawytscha",
    he_taken = "Clupea pallasii"
  )
## remove records that have already been assigned an ID
seines_long <-
  full_join(seines_total_long,
            seines_taken_long,
            by = c("seine_id", "scientificName")) %>%
  drop_na() %>%
  mutate(n_not_taken = n - n_taken) %>% #so_total includes the number taken so I subtract n_taken to get n_not_taken
  select(-n_taken, -n) %>%
  filter(n_not_taken > 0)

all_fish_caught <-
  seines_long[rep(seq.int(1, nrow(seines_long)), seines_long$n_not_taken), 1:3] %>%
  select(-n_not_taken) %>%
  mutate(
    prefix = "hakai-jsp-",
    suffix = 1:nrow(.),
    occurrenceID = paste0(prefix, suffix)
  ) %>%
  select(-prefix, -suffix)
#
# Change species names to full Scientific names
latin <-
  fct_recode(
    new_fish_field_data$species,
    "Oncorhynchus nerka" = "SO",
    "Oncorhynchus gorbuscha" = "PI",
    "Oncorhynchus keta" = "CU",
    "Oncorhynchus kisutch" = "CO",
    "Clupea pallasii" = "HE",
    "Oncorhynchus tshawytscha" = "CK"
  ) %>%
  as.character()
fish_retained_data <- new_fish_field_data %>%
  mutate(scientificName = latin) %>%
  select(-species) %>%
  mutate(prefix = "hakai-jsp-",
         occurrenceID = paste0(prefix, ufn)) %>%
  select(-prefix,
         -ufn,
         -fork_length_field,
         -weight_field)

occurrence <- bind_rows(all_fish_caught, fish_retained_data) %>%
  mutate(basisOfRecord = "HumanObservation",
         occurenceStatus = "present") %>%
  rename(eventID = seine_id)

#QC to do:
n_occurrences <- sum(new_seine_data$total_caught) #check numbers against each other

# Fix taxise WoRMS issues?
species_matched <- readxl::read_excel(here::here("species_matched.xls"))
occurrence <- left_join(occurrence, species_matched, by = c("scientificName" = "ScientificName")) %>%
  select(occurrenceID, basisOfRecord, scientificName, scientificNameID = AphiaID_accepted,  eventID, occurrenceStatus = occurenceStatus, Kingdom, Phylum, Class, Order, Family, Genus, Species) %>%
  mutate(scientificNameID = paste0("	urn:lsid:marinespecies.org:taxname:", scientificNameID))

write_csv(occurrence, here::here("2020_occurrence.csv"))
