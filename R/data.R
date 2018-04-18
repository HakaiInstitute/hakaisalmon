#' Site, date, and other metadata associated with a survey
#'
#' A dataset containing variables collected from Juvenile Salmon Program site surveys
#'
#'
#' \describe{
#'   \item{ufn}{Universal Fish Number. For 2015 and 2016 fish, assigned to each specimen in the order they were processed in the lab. For 2017 fish, ufn was assigned in the order they were processed in the field.}
#'   \item{survey_id}{Primary key to: seine_data, ysi, ctd, zoop_tows. A unique survey ID assigned to every survey}
#'   \item{survey_date}{yyy-mm-dd. Date upon which a survey was conducted}
#'   \item{site_id}{unique identifier given for the geographic location of a survey}
#'   \item{region}{DI = Discovery Islands, JS = Johnstone Strait}
#'   \item{zone}{Ctegorization of the generalized migration route taken by outmigrating juvenile salmon (West, Central, or East for Discovery Islands; N or S for Johnstone Strait).}
#'   \item{site_name}{Chart name for the location of a survey site}
#'   \item{crew}{Full names of crew members}
#'   \item{precip}{Precipitation. none, light, moderate, or heavy. Subjective categorical representation of the amount of precipitation}
#'   \item{cloud_cover}{0, 25, 50, 75, or 100	Visual approximation of the amount of cloud cover overhead}
#'   \item{sea_state}{0, 1, 2, 3, 4, or 5. 0 = Sea-surface smooth and mirror like. 1 = Scaly ripples, no foam crests. 2 = Small wavelets, crests glassy, no breaking. 3 = Large wavelets, crests begin to break, scattered whitecaps. 4 = small waves 1–4 ft. becoming longer, numerous whiteaps. 5 = Moderate waves 4–8 ft. taking longer form, many whitecaps, some spray.}
#'   \item{wind_speed}{knots. 0, 0.1-5, 5-10, 10-15, 15-20, or 20-30. Estimated wind speed range observed on site}
#'   \item{wind_direction}{N, S, E, W, NE, NW, SE, or SW. Approximation of which way the wind is coming from}
#'   \item{tide_state}{high slack, low slack, flood, or ebb tide. Tidal state at the start of the survey}
#'   \item{survey_time_start}{hh:mm:ss 24-hour time of commencing visual survey for site activity}
#'   \item{survey_time_end}{hh:mm:ss 24-hour time of end of visual survey for site activity}
#'   \item{ctd_cast_id}{This is the primary key to join survey data to CTD data. It is an automatically-generated concatenation of Site Code, Date, and drop number}
#'   \item{zoop_sample_id}{Zooplankton Sample ID. The unique ID that identifies a zooplankton sample that is stored in a 250 mL PET jar}
#'   \item{secchi}{Metres. Secchi depth reading in metres (rounded to nearest 0.1 m)}
#'   \item{net_sets}{number of times the seine was deployed in a survey}
#'   \item{set_type}{This is a category for how or who the survey was conducted. Standard surveys can be used for the purpose of CPUE calculations, other categories should not be}
#'   \item{survey_comments}{field notes specific to survey conditions}
#'   \item{sampling_week}{A calculated value. Julian day (j) + 4 days for historical categorization purposes, integer divide by 7. (j + 4 / 7)}
#'
#' }
"survey_data"

#' Location information for all sample storage containers
#'
#' A dataset containing location information for the bulk storage of biological samples obtain from fish caught by the Juvenile Salmon Program
#'
#'
#' \describe{
#'  \item{container_id}{The string that uniquely identifies the box, book,
#'  tray, etc. in which a sample is stored. Its format is "B" followed by the
#'  two (or three)-character sample type code, and then a number to uniquely
#'  identify the box within its sample type (Example: "BFA12"). In some
#'  instances, a species code may precede the number (where boxes were only
#'  unique on a species-level, e.g. "BFASO1"). The only exception is for fin
#'  clips, which are stored on Whatman sheets, and have the container ID format
#'  "DW" or "JW" followed by a number, where "D" identifies samples
#'  collected in the Discovery Islands, and "J" denotes Johnstone Strait.}
#'  \item{container_type}{The type of samples being stored in the container}
#'  \item{storage_medium}{The medium in which a tissue sample is being preserved. For example, DNA is stored in 95% ethanol, while sea lice may be stored in either formalin or glycerol, depending on the pupose of the sample}
#'  \item{current_location}{Physical location or building in which the sample container exists, e.g. "Quadra Prep Lab" or "UBC"}
#'  \item{storage_unit}{Identity of the freezer or dry shelving unit in which a sample container is being stored}
#'  \item{storage_tier_1}{The first organizational tier of storage for the sample container, e.g. "Shelf 1" or "Group Box 1"}
#'  \item{storage_tier_2}{The second organizational tier of storage for the sample container, within the first organizational tier, e.g. "Tray 1"}
#'  \item{shipping_container}{Number of a box containing a group of sample containers to be shipped from Hakai}
#'  \item{date_shipped}{Date when a shipment of samples was sent out from Hakai}
#'  \item{shipped_to}{Destination of the shipping container}
#'  \item{date_received}{Date when a shipment of samples was received}
#'  \item{expecting_return}{Whether or not it is expected that shipped samples are to be returned to Hakai}
#'  \item{date_returned}{Date when processed samples have been returned to Hakai for storage}
#'
#'  }
"sample_container_inventory"

#' Storage information for RNA samples
#'
#' Metadata associated with tissue samples obtained from fish caught by the
#' Juvenile Salmon Program, for use in RNA:DNA ratio analysis and viral disease
#' states. The following tissue types are collected: muscle, gill, brain, spleen,
#' liver, heart, and kidney
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The sample_location value (detailed below). This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the tray in which sets of sample vials are stored.}
#'  \item{container_cell}{The row (A-H) and column (1-12) in which a sample is stored in its container}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"rna_metadata"

#' Storage information for fatty acid samples
#'
#' Metadata associated with muscle tissue samples obtained from fish caught by the
#' Juvenile Salmon Program, for use in fatty acid analysis.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the box in which sets of sample vials are stored.}
#'  \item{container_cell}{The cell in which a vial is stored in the sample box}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"fa_metadata"

#' Storage information for isotope samples
#'
#' Metadata associated with muscle tissue samples obtained from fish caught by the Juvenile Salmon Program, for use in stable isotope analysis.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the box in which sets of sample vials are stored.}
#'  \item{container_cell}{The cell in which a vial is stored in the sample box}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"iso_metadata"

#' Storage information for additional muscle tissue samples
#'
#' Metadata associated with muscle tissue samples obtained from fish caught by the Juvenile Salmon Program, to be kept as backup tissue stored in -80C.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the box in which sets of sample vials are stored.}
#'  \item{container_cell}{The cell in which a vial is stored in the sample box}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"xm_metadata"

#' Storage information for DNA samples
#'
#' Metadata associated with liver or muscle tissue samples obtained from fish caught by the
#' Juvenile Salmon Program, for use in genetic stock ID analysis.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the box in which sets of sample vials are stored.}
#'  \item{container_cell}{The cell in which a vial is stored in the sample box}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"dna_metadata"

#' Storage information for stomach samples
#'
#' Metadata associated with stomach samples obtained from fish caught by the Juvenile Salmon Program, for use in gut content analysis.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the tray in which sets of sample vials are stored.}
#'  \item{container_cell}{Vials within a stomach tray are not tracked, so values are "NA"}
#'  \item{sample_location}{A concatenation of container_id and container_cell. Functionally, it is the same as container_id due to cell locations not being tracked for stomach samples.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged.}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"stomach_metadata"

#' Storage information for otolith samples
#'
#' Metadata associated with otolithss obtained from fish caught by the Juvenile Salmon Program, for use in ageing and microchemistry.
#'
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the box in which sets of sample vials are stored.}
#'  \item{container_cell}{The cell in which a vial is stored in the sample box}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"otolith_metadata"

#' Storage information for sea louse samples
#'
#' Metadata associated with sea lice (\emph{Caligus clemensi} and \emph{Lepeophtheirus salmonis}) obtained from fish caught by the Juvenile Salmon Program, for use in identification and microbiome studies.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample (or species of louse) being collected.}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected. The prefix "SSL" indicates a mix of both species and of all life stages are stored in one vial. "SLC" indicates the vial contains motile \emph{Caligus} lice only, and "SLL" indicates motile \emph{Lepeophtheirus} lice only.}
#'  \item{container_id}{The string that uniquely identifies the box in which sets of sample vials are stored.}
#'  \item{container_cell}{The cell in which a vial is stored in the sample box}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"sealice_metadata"

#' Storage information for scale samples
#'
#' Metadata associated with scale samples obtained from fish caught by the Juvenile Salmon Program.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The sample_location value (detailed below). This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the book in which scales have been placed.}
#'  \item{container_cell}{The cell in which a scale sample has been placed in the scale book}
#'  \item{sample_location}{A concatenation of container_id and container_cell, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same sample_location value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"scale_metadata"

#' Storage information for fish carcass samples
#'
#' Metadata associated with carcass and carcass samples obtained for fish caught by the Juvenile Salmon Program.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The sample_location value (detailed below). This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the bag in which carcasses have been placed.}
#'  \item{container_cell}{Carcasses in a bag are not tracked, so the value is "NA"}
#'  \item{sample_location}{A concatenation of container_id and container_cell. Functionally, it is the same as container_id due to cell locations not being tracked for carcasses.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged.}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"carcass_metadata"

#' Storage information for fin clip samples
#'
#' Metadata associated with fin clip samples obtained from fish caught by the Juvenile Salmon Program, for use in genetic stock ID analysis
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Its format is "U" followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected.}
#'  \item{sample_id}{The ID of the cell in which the fin clip is placed. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the Whatman sheet in which fin clips have been placed.}
#'  \item{container_cell}{Not applicable}
#'  \item{sample_location}{A concatenation of container_id and container_cell. Functionally, it is the same as container_id}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged.}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
"finclip_metadata"

#' Time, location, and catch effort of sets
#'
#' A dataset containing variables collected from Juvenile Salmon Program seines
#'
#' \describe{
#'  \item{seine_id}{Unique ID assigned to each seine conducted}
#'  \item{survey_id}{A unique survey ID assigned to every survey. A survey ID may be associated with multiple seines.}
#'  \item{set_number}{The order in which the seine was deployed in a survey. "NA" if no sets were performed}
#'  \item{set_type}{whether the set was conducted upon an observed school of fish or in a random area where surface activity wasn't targetted. "NA" means we conducted a visual survey for surface activity but did not detect any fish.}
#'  \item{time_searching}{Only recorded in 2015/2016: length of time visually searching for fish before setting the net.}
#'  \item{set_time}{Bunt time, i.e., when the trailing sternward end of the seine is tied onto the boat and a school of fish has been concentrated within the seine}
#'  \item{lat}{Location of fish capture}
#'  \item{long}{Location of fish capture}
#'  \item{so_taken}{Number of sockeye salmon retained in a seine.}
#'  \item{so_total}{Total number of sockeye caught in a seine.}
#'  \item{pi_taken}{Number of pink salmon retained in a seine.}
#'  \item{pi_total}{Total number of pink salmon caught in a seine. "NA" = individuals of this species were not enumerated}
#'  \item{cu_taken}{Number of chum salmon retained in a seine.}
#'  \item{cu_total}{Total number of chum salmon caught in a seine. "NA" = individuals of this species were not enumerated}
#'  \item{co_taken}{Number of coho salmon retained in a seine.}
#'  \item{co_total}{Total number of coho salmon caught in a seine. "NA" = individuals of this species were not enumerated}
#'  \item{he_taken}{Number of herring retained in a seine.}
#'  \item{he_total}{Total number of herring caught in a seine. "NA" = individuals of this species were not enumerated}
#'  \item{ck_taken}{Number of chinook salmon  retained in a seine.}
#'  \item{ck_total}{Total number of chinook salmon  caught in a seine. "NA" = individuals of this species were not enumerated}
#'  \item{preservation_status}{"0" = one or more samples from this seine were improperly preserved in the dewar (dewar likely thawed, warming up the samples and degrading their quality). "1" = all samples were properly preserved.}
#'  \item{fish_retained}{"Yes" = at least 1 fish had been retained from the seine. "No" = no fish retained (seine either failed to capture fish, or no fish were taken from a seine)}
#'  \item{collection_protocol}{"SEMSP" refers to standard Hakai field protocol. "DFO" refers to collection aboard the Nordic Queen purse seiner. "SJUBC" refers to Sam James UBC for diel feeding study fish collection. "GM" refers to Gideon Mordecai for fish that were targeted for collection because they appeared sick.}
#'  \item{seine_comments}{Comments related to the seine}
#'
#' }
"seine_data"

#' Species bycatch and mortalities from sets
#'
#' A dataset species bycatch and accidental fish mortality attributed to seines conducted by the Juvenile Salmon Program
#'
#' \describe{
#'  \item{seine_id}{Unique ID assigned to each seine conducted}
#'  \item{bm_species}{First two letters of the first two words of the common name of the fish. Example "TISC" = Tide-pool Sculpin. Was either a part of seine bycatch, or died during holding in net}
#'  \item{bm_status}{Whether the species was a bycatch or a mortality}
#'  \item{bm_ageclass}{The approximate age of the fish. Y = young-of-year, J = juvenile, A = adult}
#'  \item{bm_count}{The number of individuals of the species that was either bycatch or mortality}
#'
#' }
"bycatch_mort"

#' Biological measurements and metadata associated with fish caught in the field
#'
#' A dataset containing variables collected from field measurements of fish collected by the Juvenile Salmon Program
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. Joining to fish_lab data by UFN will filter out fish that haven't been dissected, because un-dissected fish do no have a UFN. To retain un-dissected fish when joining to fish_lab_data use SEMSP ID.}
#'  \item{semsp_id}{A concatenation of date, site, species, and order the fish was pulled out of the net was used to uniquely identify the fish. In 2017 this was method was abandonded, and instead we assigned seine IDs and UFNs to uniquely identify seines and fish}
#'  \item{seine_id}{Unique ID assigned to each seine conducted}
#'  \item{species}{The species of fish collected. SO = Sockeye, PI = Pink, CU = Chum, CO = Coho, HE = Herring, CK = Chinook}
#'  \item{package_id}{Unique identifier to identify the package (aka bundle) that a fish was grouped with in the field, and then subsequently stored with in the freezer until it was dissected}
#'  \item{fish_time_out}{Time that the fish was euthanized after being taken out of the seine. In conjunction with fis_time_dewar you an calculate the handling time of the fish before being flash frozen in liquid nitrogenh}
#'  \item{fish_dewar}{Time that the fish was put into the liquid nitrogen dry shipper. In conjunction with fish_time_dewar you an calculate the handling time of the fish before being flash frozen in liquid nitrogen}
#'  \item{fork_length_field}{The fork length of the fish measured while in the field using a 15 cm flexible ruler}
#'  \item{height_field}{The height of the fish measured perpendicular to the lateral line from the anterior insertion of the dorsal fin to the ventral side of the fish}
#'  \item{weight_field}{The weight of the fish measured in the field using a spring scale. Precision is +/- 1 g}
#'  \item{analysis_planned}{The type of analysis the fish is to undergo (or has underwent). "Field loused only" fish are not retained, and therefore have no SEMSP ID or package ID for inventory.}
#'  \item{dissection_status}{Whether or not the fish had been dissected at the time the data package was released}
#'
#' }
"fish_field_data"

#' Biological measurements and metadata associated with fish dissected in the lab
#'
#' A dataset containing variables collected from laboratory dissections of fish caught in the field by the Juvenile Salmon Program. A subset of \code{\link{fish_field_data}}
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish.}
#'  \item{semsp_id}{A concatenation of date, site, species, and order the fish was pulled out of the net was used to uniquely identify the fish. In 2017 this was method was abandonded, and instead we assigned seine IDs and UFNs to uniquely identify seines and fish}
#'  \item{date_processed}{The date the fish was processed (dissected) in the lab. Blank infers the fish has not be dissected yet}
#'  \item{cwt}{Fish were scanned using a handheld CWT read. "none" = no coded wire tag detected}
#'  \item{adipose}{"none" = adipose is not clipped. "AD" = adipose fin was clipped}
#'  \item{weight}{weight of the fish measured in the lab using Pro Scout scales with 0.1 g precision}
#'  \item{standard_length}{The length of the fish measured from the tip of the snout to the caudal peduncle where scales give way to caudal fin rays}
#'  \item{fork_length}{The length of the fish meadured from the tip of the snout to the fork of the caudal fin}
#'  \item{photo_number}{Photos of abnormal looking fish were taken. The name of the photo file in the photo database. The file name is also the UFN of the fish.}
#'  \item{comments_protocol}{Comments related to deviations to standard dissection protocols }
#'  \item{comments_fish_health_lab}{Comments to describe any abnormal/unique observations about the *fish itself* (e.g. lesions, non-louse parasites, _tissue discolouration_, scale loss, etc.)}
#'  \item{dissector}{The initials of the technician who performed the dissection}
#'  \item{dissection_protocol}{\strong{Full work-up 1}: procedure for 2015 & 2016 samples
#'  (One RNA sample each taken from muscle, gill, brain, spleen, liver, heart,
#'  and head kidney; fatty acid, stable isotope, DNA (if no fin clips were taken
#'  in the field), stomach, otolith, and scales). \strong{Full work-up 2}: procedure for
#'  all samples effective Oct. 2017 (One RNA sample each taken from muscle,
#'  gill, brain, spleen, liver, heart, and head kidney; fatty acid, stable
#'  isotope, EXTRA MUSCLE STORED AT -80, DNA (if no fin clips were taken in the
#'  field), stomach, otolith, and scales). \strong{Full work-up 3}: procedure for fish
#'  subsampled for compound specific stable isotope analysis (by David
#'  Costalago, Feb. 2018). All samples taken as in full work-up 2, with the
#'  addition of a second isotope sample taken. \strong{Work-up excluding cold samples}:
#'  full work-up 1 without RNA, fatty acid, or stable isotope samples taken.
#'  \strong{Irregular work-up}: processing with at least one sample type not taken (e.g.
#'  no RNA, no DNA, etc.). \strong{Lice enumeration only - in lab}: fish was inspected
#'  for sea lice only and did not undergo dissection. Lengths and weight
#'  recorded. \strong{-20 work up 1}: procedure for dissecting fish that have been
#'  previously stored at -20 before dissection. No RNA samples, no fatty acid
#'  samples, no extra muscle sample, no sea-lice retention. Reduced
#'  sterilization between fish to scrubbing and ethanoling direct contact
#'  surfaces with 95% ethanol. Otherwise the same as Full work-up 2.}
#'  \item{fish_lab_qc_data}{The initials of the technician who quality checked the data}
#'  \item{fish_lab_qc_flag}{"Yes" - one or more columns has an unresolvable error in data entry (not pertaining to the physical quality of the sample)}
#'  \item{fish_lab_flag_reason}{Explains why the fish has been flagged}
#'  \item{fish_lab_qc_log}{Describes any action taken by QC to address and resolve flagged issues.}
#'
#' }
"fish_lab_data"

#' Enumeration of sea lice found on fish in the field
#'
#' A dataset containing counts of sea lice (\emph{Caligus clemensi} and \emph{Lepeophtheirus salmonis}) and body abnormalities found on fish collected in the field by the Juvenile Salmon Program
#'
#' \describe{
#' \item{ufn}{The alphanumeric string that uniquely identifies a fish.}
#' \item{cal_cope_field}{Field enumeration of \emph{C. clemensi} (Cal.) sea lice, copepodid life stage}
#' \item{lep_cope_field}{Field enumeration of \emph{L. salmonis} (Lep.) sea lice, copepodid life stage}
#' \item{chal_a_field}{Field enumeration of combined Cal. and Lep. sea lice, chalimus A life stage}
#' \item{chal_b_field}{Field enumeration of combined Cal. and Lep. sea lice, chalimus B life stage}
#' \item{cal_mot_field}{Field enumeration of motile Cal. sea lice, combined pre-adult and adult life stages and both sexes (non-gravid females only)}
#' \item{cgf_field}{Field enumeration of gravid Cal. sea lice}
#' \item{lpam_field}{Field enumeration of Lep. sea lice, pre-adult males}
#' \item{lpaf_field}{Field enumeration of Lep. sea lice, pre-adult females}
#' \item{lam_field}{Field enumeration of Lep. sea lice, adult males}
#' \item{laf_field}{Field enumeration of Lep. sea lice, adult females (non-gravid)}
#' \item{lgf_field}{Field enumeration of gravid Lep. female sea lice}
#' \item{unid_cope_field}{Field enumeration of unidentifiable Cal. or Lep. sea lice, copepodid life stage}
#' \item{unid_chal_field}{Field enumeration of unidentifiable Cal. or Lep. sea lice, chalimus A and B life stages}
#' \item{chal_scar}{Number of sea louse chalimus scars on fish body}
#' \item{mot_scar}{Number of motile sea louse scars on fish body}
#' \item{pred_scar}{Number of predator scars on fish body}
#' \item{hemorrhaging}{Number of hemorrhaging areas on fish body}
#' \item{eroded_gill_plate}{Number of eroded gill plates}
#' \item{grazed_gill_plate}{Number of grazed gill plates}
#' \item{mate_guarding}{Number of sea lice exhibiting mate guarding activity}
#' \item{pinched_belly}{Number of occurences of a pinched belly on a fish}
#' \item{comments_fish_health_field}{Description of locations of observed body abnormalities and deformities}
#' \item{licing_protocol_field}{The protocol that was followed for identifying sea lice in the field.}
#'
#' }
"sealice_field"

#' Enumeration of sea lice found on fish in the lab
#'
#' A dataset containing counts of motile sea lice (\emph{Caligus clemensi} and \emph{Lepeophtheirus salmonis}) found on lab-dissected fish collected by the Juvenile Salmon Program
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish.}
#'  \item{cm_lab}{Lab enumeration of \emph{C. clemensi} (Cal.) and \emph{L. salmonis} (Lep.) sea lice, adult and pre-adult males}
#'  \item{cpaf_lab}{Lab enumeration of Cal. sea lice, pre-adult females}
#'  \item{caf_lab}{Lab enumeration of Cal. sea lice, adult females (non-gravid)}
#'  \item{cgf_lab}{Lab enumeration of gravid Cal. sea lice}
#'  \item{lgf_lab}{Lab enumeration of gravid Lep. sea lice}
#'  \item{laf_lab}{Lab enumeration of Lep. sea lice, adult females (non-gravid)}
#'  \item{lpaf_lab}{Lab enumeration of Lep. sea lice, pre-adult females (both first and second stages)}
#'  \item{lpam_lab}{Lab enumeration of Lep. sea lice, pre-adult males (both first and second stages)}
#'  \item{lam_lab}{Lab enumeration of Lep. sea lice, adult males}
#'  \item{ucal_lab}{Lab enumeration Cal. sea lice, unidentifiable sex/life stage}
#'  \item{ulep_lab}{Lab enumeration Lep. sea lice, unidentifiable sex/life stage}
#'  \item{lab_count_no_id}{The number of lice that were picked off a fish and put into a formalin sample. This count includes all life stages, species and sex of sea lice. Counting the number of lice like this occured in 2015.}
#'  \item{lice_collection_protocol}{The protocol that was followed to collect sealice from the fish}
#'  \item{lice_id_protocol}{The protocol that was followed for identifying sea lice in the lab.}
#'
#' }
"sealice_lab_motiles"

#' Inventory and other metadata associated with packages of fish caught from seines
#'
#' A dataset containing variables describing the contents and location of packages of fish caught in Juvenile Salmon Program surveys
#'
#' \describe{
#' \item{package_id}{The alphanumeric string that uniquely identifies a package of fish}
#' \item{seine_id}{Unique ID assigned to each seine conducted}
#' \item{pkg_species}{The species of fish within a package.}
#' \item{number_of_fish}{Number of fish within a package}
#' \item{field_liced_status}{Whether fish received lice enumeration in the field prior to packaging, or no lice enumeration has been performed}
#' \item{pkg_time_out}{Time the first fish of the package was taken out of the net and euthanized}
#' \item{pkg_time_dewar}{Time the full package was placed in the dewar for preservation}
#' \item{pkg_comments}{Notes regarding the contents or nature of the package}
#'
#' }
"package_data"

#' Temperature and salinity data
#'
#' A dataset containing oceanographic variables collected from Juvenile Salmon Program site surveys with a YSI Pro30 multiparameter meter
#'
#' \describe{
#'  \item{survey_id}{A unique alphanumeric code assigned to every survey}
#'  \item{line_out_depth}{The depth at which the measurement was taken (in metres)}
#'  \item{temperature}{Temperature in degrees celcius}
#'  \item{salinity}{Salinity in parts per thousand}
#'  \item{ysi_gather_lat}{The geopgraphical latitude of measurement gathered by the electronic tablet}
#'  \item{ysi_gather_long}{The geopgraphical longitude of measurement gathered by the electronic tablet}
#' }
#'
"ysi"

#' Zooplankton tow metadata
#'
#' A dataset containing variables collected from horizontal zooplankton tows during Juvenile Salmon Program site surveys
#'
#' \describe{
#'  \item{survey_id}{A unique alphanumeric code assigned to every survey}
#'  \item{sample_id}{A unique sample ID assigned and labelled onto every 250 mL PET jar that resulted from the zoop tow}
#'  \item{zoop_tow_gather_lat}{The geopgraphical latitude of measurement gathered by the electronic tablet}
#'  \item{zoop_tow_gather_long}{The geopgraphical longitude of measurement gathered by the electronic tablet}
#'  \item{tow_start_time}{The 24-hour time the zooplankton tow began}
#'  \item{tow_end_time}{The 24-hour time the zooplankton tow ended}
#'  \item{tow_duration}{The duration of the zooplakton tow, in minutes}
#'  \item{flow_meter}{The serial number of the flowmeter}
#'  \item{flowmeter_in}{The revolution count of the flowmeter before begining the tow}
#'  \item{flowmeter_out}{The revolution count of the flowmeter after finishing the tow}
#'  \item{revolutions}{The number of revolutions of the flowmeter that occured during the tow. The difference between \code{\link{flowmeter_in}} and \code{\link{flowmeter_out}}}
#'  \item{volume}{The volume of water sampled taking in to account on the flowmeter count, the calibration coefficient of the flowmeter, and the size of the net. }
#'  \item{modelled_volume}{A modelled estimate of the volume sampled. Early season in 2015 the flowmeter was not working, so volume was modeled based on tow duration and secchi depth. The R script of this model is available upon request}
#'  \item{quality_level}{Raw infers there is no way to check the quality of the data and no guarantee of accuracy is possible, use at your own risk. Technician infers that the data has passed an initial QA/QC level}
#'  \item{quality_log}{Comments regarding the Quality level}
#'
#' }
"zoop_tows"

#' Probably genetic stocks associated a fish
#'
#' A dataset containing the results of genetic stock ID analyses performed on DNA samples collected from fish caught by the Juvenile Salmon Program.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish}
#'  \item{semsp_id}{A concatenation of date, site, species, and order the fish was pulled out of the net was used to uniquely identify the fish. In 2017 this was method was abandonded, and instead we assigned seine IDs and UFNs to uniquely identify seines and fish}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{stock_1}{The genetic stock assigned with the highest probability}
#'  \item{region_1}{The region associated with Stock 1}
#'  \item{prob_1}{The probablilty the fish originates from Stock 1}
#'  \item{stock_2}{The genetic stock assigned with the second highest probability}
#'  \item{region_2}{The region associated with stock 2}
#'  \item{prob_2}{The probablilty the fish originates from stock 2}
#'  \item{stock_3}{The genetic stock assigned with the third highest probability}
#'  \item{region_3}{The region associated with stock 3}
#'  \item{prob_3}{The probablilty the fish originates from stock 3}
#'  \item{stock_4}{The genetic stock assigned with the fourth highest probability}
#'  \item{region_4}{The region associated with stock 4}
#'  \item{prob_4}{The probablilty the fish originates from stock 4}
#'  \item{stock_5}{The genetic stock assigned with the fifth highest probability}
#'  \item{region_5}{The region associated with stock 5}
#'  \item{prob_5}{The probablilty the fish originates from stock 5}
#'
#' }
"stock_id"

#' Fish surface activty observed during survey transects
#'
#' Before seining, a visual transect 1 nm in length was conducted to quantify the abundance of fish surface activity
#'
#' \describe{
#'  \item{survey_id}{Primary key to survey_data. A unique alphanumeric code assigned to every survey}
#'  \item{school_number}{A sequential number assigned to a discrete group of surface activity that we considered a school of fish}
#'  \item{school_sliders}{The number of individual surface events that "slid" out the water in this school. \strong{Categories:} 0, 1, 10, 100, 1000}
#'  \item{school_poppers}{The number of individual surface events that "popped" out the water in this school. \strong{Categories:} 0, 1, 10, 100, 1000}
#'  \item{school_dimpling}{The number of individual surface events that looked like simpling in this school. \strong{Categories:} 0, 1, 10, 100, 1000}
#'
#'  }
"site_activity"
