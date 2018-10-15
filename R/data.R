#' Site, date, and other metadata associated with a survey
#'
#' A dataset containing variables collected from Juvenile Salmon Program site surveys
#'
#'
#' \describe{
#'   \item{survey_id}{A unique alphanumeric code assigned to every survey. \strong{Primary key to}: \code{\link{seine_data}}, \code{\link{site_activity}}, \code{\link{ysi}}, \code{ctd_casts}, and \code{\link{zoop_tows}}.}
#'   \item{survey_date}{Date upon which a survey was conducted. \strong{Format}: \samp{yyyy-mm-dd}}
#'   \item{site_id}{A unique identifier given for the geographic location of a survey}
#'   \item{region}{General geographic zone of a site. \samp{DI} = Discovery Islands, \samp{JS} = Johnstone Strait}
#'   \item{zone}{Categorization of the generalized migration route taken by outmigrating juvenile salmon (\samp{West}, \samp{Central}, or \samp{East} for Discovery Islands; \samp{N} or \samp{S} for Johnstone Strait).}
#'   \item{site_name}{Chart name for the location of a survey site}
#'   \item{crew}{Full names of crew members}
#'   \item{precip}{Subjective categorical representation of the amount of precipitation. \strong{Categories}: \samp{none, light, moderate, heavy}}
#'   \item{cloud_cover}{Visual approximation of the \emph{percent} of cloud cover overhead. \strong{Categories}: \samp{0, 25, 50, 75, 100}}
#'   \item{sea_state}{\strong{Categories} describing surface conditions:
#'    \itemize{
#'     \item \samp{0} = Sea-surface smooth and mirror like.
#'     \item \samp{1} = Scaly ripples, no foam crests.
#'     \item \samp{2} = Small wavelets, crests glassy, no breaking.
#'     \item \samp{3} = Large wavelets, crests begin to break, scattered whitecaps.
#'     \item \samp{4} = small waves 1–4 ft. becoming longer, numerous whiteaps.
#'     \item \samp{5} = Moderate waves 4–8 ft. taking longer form, many whitecaps, some spray.
#'     }
#'     }
#'   \item{wind_speed}{Estimated wind speed range observed on site. \strong{Units}: knots. \strong{Categories}: \samp{0, 0.1-5, 5-10, 10-15, 15-20, 20-30.}}
#'   \item{wind_direction}{Approximation of which way the wind is coming from. \strong{Categories}: \samp{N, S, E, W, NE, NW, SE, SW.}}
#'   \item{tide_state}{Tidal state at the start of the survey. \strong{Categories}: \samp{high slack, low slack, flood, ebb tide.}}
#'   \item{survey_time_start}{24-hour time of commencing visual survey for site activity. \strong{Format}: \samp{hh:mm:ss}}
#'   \item{survey_time_end}{24-hour time of end of visual survey for site activity. \strong{Format}: \samp{hh:mm:ss}}
#'   \item{ctd_cast_id}{An automatically-generated concatenation of \code{site_id}, \code{survey_date}, and drop number. \strong{Primary key} to join \code{\link{survey_data}} to CTD data.}
#'   \item{zoop_sample_id}{The unique code that identifies a zooplankton sample that is stored in a 250 mL PET jar. \strong{Primary key} to join \code{\link{survey_data}} to \code{\link{zoop_tows}}.}
#'   \item{secchi}{Secchi depth reading. \strong{Units}: metres (rounded to nearest 0.1 m)}
#'   \item{net_sets}{The number of times the seine was deployed in a survey}
#'   \item{set_type}{How (or for whom) the survey was conducted. \samp{Standard} surveys can be used for the purpose of CPUE calculations; other categories (\samp{non-standard} or \samp{DFO} should be excluded.}
#'   \item{survey_comments}{Field notes specific to survey conditions}
#'   \item{sampling_week}{A calculated value. Julian day (j) + 4 days for historical categorization purposes, integer divide by 7. \eqn{j + 4 / 7}}
#'
#' }
"survey_data"


#' Time, location, and catch effort of sets
#'
#' A dataset containing variables collected from Juvenile Salmon Program seines
#'
#' \describe{
#'  \item{seine_id}{A unique ID assigned to each seine conducted within a survey. \strong{Primary key to}: \code{\link{fish_field_data}}, \code{\link{bycatch_mort}}.}
#'  \item{survey_id}{A unique alphanumeric code assigned to every survey. A survey ID may be associated with multiple seines. \strong{Foreign key} to \code{\link{survey_data}}.}
#'  \item{set_number}{The order in which the seine(s) was/were deployed in a survey}
#'  \item{set_type}{Denotes whether the set was conducted upon an observed school of fish or in a random area where surface activity wasn't targetted. \samp{NA} means we conducted a visual survey for surface activity but did not set upon any fish.}
#'  \item{time_searching}{Length of time visually searching for fish before setting the net (only recorded in 2015/2016). \strong{Units:} minutes}
#'  \item{set_time}{Bunt time, i.e., when the trailing sternward end of the seine is tied onto the boat and a school of fish has been concentrated within the seine. \strong{Format:} hh:mm:ss}
#'  \item{lat}{Location of fish capture. \strong{Format:} decimal degrees}
#'  \item{long}{Location of fish capture. \strong{Format:} decimal degrees}
#'  \item{so_taken}{Number of sockeye salmon retained in a seine.}
#'  \item{so_total}{Total number of sockeye caught in a seine.}
#'  \item{pi_taken}{Number of pink salmon retained in a seine.}
#'  \item{pi_total}{Total number of pink salmon caught in a seine. \samp{NA} = individuals of this species were not enumerated}
#'  \item{cu_taken}{Number of chum salmon retained in a seine.}
#'  \item{cu_total}{Total number of chum salmon caught in a seine. \samp{NA} = individuals of this species were not enumerated}
#'  \item{co_taken}{Number of coho salmon retained in a seine.}
#'  \item{co_total}{Total number of coho salmon caught in a seine. \samp{NA} = individuals of this species were not enumerated}
#'  \item{he_taken}{Number of herring retained in a seine.}
#'  \item{he_total}{Total number of herring caught in a seine. \samp{NA} = individuals of this species were not enumerated}
#'  \item{ck_taken}{Number of chinook salmon  retained in a seine.}
#'  \item{ck_total}{Total number of chinook salmon  caught in a seine. \samp{NA} = individuals of this species were not enumerated}
#'  \item{preservation_status}{\samp{0} = one or more samples from this seine were improperly preserved in the dewar (dewar likely thawed, warming up the samples and degrading their quality). \samp{1} = all samples were properly preserved.}
#'  \item{fish_retained}{\samp{yes} = at least 1 fish had been retained from the seine. \samp{no} = no fish retained (seine either failed to capture fish, or no fish were taken from a seine)}
#'  \item{collection_protocol}{The decision-making guidelines that dictate how fish were sampled in the field. \strong{Categories:}
#'   \itemize{
#'    \item \samp{SEMSP} = standard Hakai field protocol.
#'    \samp{DFO} = collection aboard the Nordic Queen purse seiner.
#'    \samp{SJUBC} = Sam James UBC for diel feeding study fish collection.
#'    \samp{GM} = Gideon Mordecai for fish that were targeted for collection because they appeared sick.
#'    }
#'    }
#'  \item{seine_comments}{Comments related to the seine}
#'
#' }
"seine_data"


#' Fish surface activty observed during survey transects
#'
#' Before seining, a visual transect 1 nm in length was conducted to quantify the abundance of fish surface activity
#'
#' \describe{
#'  \item{survey_id}{A unique alphanumeric code assigned to every survey. \strong{Foreign key} to \code{\link{survey_data}}.}
#'  \item{school_number}{A sequential number assigned to a discrete group of surface activity that we considered a school of fish}
#'  \item{school_sliders}{The number of individual surface events that "slid" out the water in this school. \strong{Categories:} \samp{0, 1, 10, 100, 1000}}
#'  \item{school_poppers}{The number of individual surface events that "popped" out the water in this school. \strong{Categories:} \samp{0, 1, 10, 100, 1000}}
#'  \item{school_dimpling}{The number of individual surface events that looked like simpling in this school. \strong{Categories:} \samp{0, 1, 10, 100, 1000}}
#'
#'  }
"site_activity"


#' Species bycatch and mortalities from sets
#'
#' A dataset species bycatch and accidental fish mortality attributed to seines conducted by the Juvenile Salmon Program
#'
#' \describe{
#'  \item{seine_id}{A unique ID assigned to each seine conducted within a survey. \strong{Foreign key} to \code{\link{seine_data}}.}
#'  \item{bm_species}{First two letters of the first two words of the common name of the fish (example: \samp{TISC} = Tide-pool Sculpin)}
#'  \item{bm_status}{Whether the species was part of a seine bycatch or a mortality as a result of being held in the net. \strong{B} = Bycatch, strong{M} = Mort}
#'  \item{bm_ageclass}{The approximate age of the fish. \samp{Y} = young-of-year, \samp{J} = juvenile, \samp{A} = adult}
#'  \item{bm_count}{The number of individuals of the species that was either \samp{bycatch} or \samp{mort}ality}
#'
#' }
"bycatch_mort"


#' Biological measurements and metadata associated with fish caught in the field
#'
#' A dataset containing variables collected from field measurements of fish collected by the Juvenile Salmon Program
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. \strong{Primary key to}: \code{\link{fish_lab_data}}, \code{\link{sealice_field}}, and \code{\link{sealice_lab_motiles}}.
#'   \itemize{
#'    \item Joining to \code{\link{fish_lab_data}} by \code{UFN} will filter out fish that haven't been dissected, because un-dissected fish that were caught in 2015 and 2016 do not have a UFN. To retain un-dissected fish when joining to \code{\link{fish_lab_data}} use \code{semsp_id}.
#'    }
#'    }
#'  \item{semsp_id}{A unique ID for every fish retained that was a concatenation of \code{survey_date}, \code{site_id}, \code{species}, and order the fish was pulled out of the net. In 2017 this was method was abandonded, and instead we assigned seine IDs and UFNs to uniquely identify seines and fish}
#'  \item{seine_id}{A unique ID assigned to each seine conducted within a survey. \strong{Foreign key} to \code{\link{seine_data}}.}
#'  \item{species}{The species of fish collected. \samp{SO} = Sockeye, \samp{PI} = Pink, \samp{CU} = Chum, \samp{CO} = Coho, \samp{HE} = Herring, \samp{CK} = Chinook}
#'  \item{package_id}{An alphanumeric code used to identify the package (aka. "bundle") that a fish was grouped with in the field, and then subsequently stored with in the freezer until it was dissected. \strong{Foreign key} to \code{\link{package_data}}}
#'  \item{fish_time_out}{Time that the fish was euthanized after being taken out of the seine. In conjunction with \code{fish_time_dewar} you can calculate the handling time of the fish before being flash frozen in liquid nitrogen. \strong{Format}: \samp{hh:mm:ss}}
#'  \item{fish_dewar}{Time that the fish was put into the liquid nitrogen dry shipper. In conjunction with \code{fish_time_dewar} you can calculate the handling time of the fish before being flash frozen in liquid nitrogen. \strong{Format}: \samp{hh:mm:ss}}
#'  \item{fork_length_field}{The fork length of the fish measured while in the field using a 15 cm flexible ruler. \strong{Units:} millimetres}
#'  \item{height_field}{The height of the fish measured perpendicular to the lateral line from the anterior insertion of the dorsal fin to the ventral side of the fish. \strong{Units:} millimetres}
#'  \item{weight_field}{The weight of the fish measured in the field using a spring scale. \strong{Units:} grams. Precision is +/- 1 g}
#'  \item{analysis_planned}{The type of analysis the fish is to undergo (or has underwent). \samp{Field loused only} = fish are not retained, and therefore have no SEMSP ID or package ID for inventory.}
#'  \item{dissection_status}{Whether or not the fish had been dissected at the time the data package was released}
#'
#' }
"fish_field_data"


#' Biological measurements and metadata associated with fish dissected in the lab
#'
#' A dataset containing variables collected from laboratory dissections of fish caught in the field by the Juvenile Salmon Program. A subset of \code{\link{fish_field_data}}
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. \strong{Primary key to}: \code{\link{fish_field_data}}, \code{\link{sealice_field}}, and \code{\link{sealice_lab_motiles}}.}
#'  \item{semsp_id}{A unique ID for every fish retained that was a concatenation of \code{survey_date}, \code{site_id}, \code{species}, and order the fish was pulled out of the net. In 2017 this was method was abandonded, and instead we assigned seine IDs and UFNs to uniquely identify seines and fish}
#'  \item{date_processed}{The date the fish was processed (dissected) in the lab. Blank infers the fish has not be dissected yet. \strong{Format:} \samp{yyyy-mm-dd}}
#'  \item{cwt}{Fish were scanned using a handheld CWT read. \samp{none} = no tag detected. \samp{cwt} = coded wire tag detected}
#'  \item{adipose}{\samp{none} = adipose is not clipped. \samp{AD} = adipose fin was clipped}
#'  \item{weight}{weight of the fish measured in the lab using Pro Scout scales. \strong{Units:} grams. 0.1 g precision}
#'  \item{standard_length}{The length of the fish measured from the tip of the snout to the caudal peduncle where scales give way to caudal fin rays. \strong{Units:} millimetres}
#'  \item{fork_length}{The length of the fish meadured from the tip of the snout to the fork of the caudal fin. \strong{Units:} millimetres}
#'  \item{photo_number}{Photos of abnormal looking fish were taken. The name of the photo file in the photo database. The file name is also the UFN of the fish.}
#'  \item{comments_protocol}{Comments related to deviations to standard dissection protocols}
#'  \item{comments_fish_health_lab}{Comments to describe any abnormal/unique observations about the \emph{fish itself} (e.g. lesions, non-louse parasites, tissue discolouration, scale loss, etc.)}
#'  \item{dissector}{The initials of the technician who performed the dissection}
#'  \item{dissection_protocol}{\strong{Categories} used to describe the general lab dissection workflow performed on a fish:
#'   \itemize{
#'    \item \samp{Full work-up 1} = procedure for 2015 & 2016 samples (One RNA sample each taken from muscle, gill, brain, spleen, liver, heart, and head kidney; fatty acid, stable isotope, DNA (if no fin clips were taken in the field), stomach, otolith, and scales).
#'    \item \samp{Full work-up 2} = procedure for all samples effective Oct. 2017 (One RNA sample each taken from muscle, gill, brain, spleen, liver, heart, and head kidney; fatty acid, stable isotope, extra muscle stored at -80 degrees Celcius, DNA (if no fin clips were taken in the field), stomach, otolith, and scales).
#'    \item \samp{Full work-up 3} = procedure for fish subsampled for compound specific stable isotope analysis (by David Costalago, Feb. 2018). All samples taken as in full work-up 2, with the addition of a second isotope sample taken.
#'    \item \samp{Work-up excluding cold samples} = full work-up 1 without RNA, fatty acid, or stable isotope samples taken.
#'    \item \samp{Irregular work-up} = processing with at least one sample type not taken (e.g. no RNA, no DNA, etc.).
#'    \item \samp{Lice enumeration only - in lab} = fish was inspected for sea lice only and did not undergo dissection. Lengths and weight recorded.
#'    \item \samp{-20 work up 1} = procedure for dissecting fish that have been previously stored at -20 before dissection. No RNA samples, no fatty acid samples, no extra muscle sample, no sea-lice retention. Reduced sterilization between fish to scrubbing and ethanoling direct contact surfaces with 95% ethanol. Otherwise the same as Full work-up 2.
#'    }
#'    }
#'  \item{fish_lab_qc_data}{The initials of the technician who quality checked the data}
#'  \item{fish_lab_qc_flag}{\samp{yes} = one or more columns has an unresolvable error in data entry (not pertaining to the physical quality of the sample). \samp{no} = no issues with data quality}
#'  \item{fish_lab_flag_reason}{Explains why the fish has been flagged}
#'  \item{fish_lab_qc_log}{Describes any action taken by QC to address and resolve flagged issues.}
#'  \item{lice_collection_protocol}{The protocol that was followed to collect sealice from the fish. \strong{Categories:}
#'   \itemize{
#'    \item \samp{lab_motiles_cryo} = only motile sea lice were collected
#'    \item \samp{lab_fine_2015} = all life stages, sexes, and species of sea lice were collected (only in 2015)
#'    \item \samp{not_collected} = no sea lice were collected
#'    }
#'    }
#'  \item{lice_id_protocol}{The protocol that was followed for identifying sea lice in the lab. \strong{Categories:}
#'   \itemize{
#'    \item \samp{lportner_fine} = fine-scale identification of all sea lice and life stages that were obtained under
#'    \item \samp{lab_motiles} = identification of only motile stages of sea lice
#'    }
#'    }
#' }
"fish_lab_data"


#' Enumeration of sea lice found on fish in the field
#'
#' A dataset containing counts of sea lice (\emph{Caligus clemensi} and \emph{Lepeophtheirus salmonis}) and body abnormalities found on fish collected in the field by the Juvenile Salmon Program
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. \strong{Foreign key to}: \code{\link{fish_field_data}}.}
#'  \item{cal_cope_field}{Field enumeration of \emph{C. clemensi} (Cal.) sea lice, copepodid life stage}
#'  \item{lep_cope_field}{Field enumeration of \emph{L. salmonis} (Lep.) sea lice, copepodid life stage}
#'  \item{chal_a_field}{Field enumeration of combined Cal. and Lep. sea lice, chalimus A life stage}
#'  \item{chal_b_field}{Field enumeration of combined Cal. and Lep. sea lice, chalimus B life stage}
#'  \item{cal_mot_field}{Field enumeration of motile Cal. sea lice, combined pre-adult and adult life stages and both sexes (non-gravid females only)}
#'  \item{cgf_field}{Field enumeration of gravid Cal. sea lice}
#'  \item{lpam_field}{Field enumeration of Lep. sea lice, pre-adult males}
#'  \item{lpaf_field}{Field enumeration of Lep. sea lice, pre-adult females}
#'  \item{lam_field}{Field enumeration of Lep. sea lice, adult males}
#'  \item{laf_field}{Field enumeration of Lep. sea lice, adult females (non-gravid)}
#'  \item{lgf_field}{Field enumeration of gravid Lep. female sea lice}
#'  \item{unid_cope_field}{Field enumeration of unidentifiable Cal. or Lep. sea lice, copepodid life stage}
#'  \item{unid_chal_field}{Field enumeration of unidentifiable Cal. or Lep. sea lice, chalimus A and B life stages}
#'  \item{chal_scar}{Number of sea louse chalimus scars on the fish's body}
#'  \item{mot_scar}{Number of motile sea louse scars on the fish's body}
#'  \item{pred_scar}{Number of predator scars on the fish's body}
#'  \item{hemorrhaging}{Number of hemorrhaging areas on the fish's body}
#'  \item{eroded_gill_plate}{Number of eroded gill plates}
#'  \item{grazed_gill_plate}{Number of grazed gill plates}
#'  \item{mate_guarding}{Number of sea lice exhibiting mate guarding activity}
#'  \item{pinched_belly}{Number of occurences of a pinched belly on the fish}
#'  \item{comments_fish_health_field}{Description of locations of observed body abnormalities and deformities}
#'  \item{licing_protocol_field}{The protocol that was followed for identifying sea lice in the field. \strong{Categories:}
#'   \itemize{
#'    \item \samp{salmoncoast_allstages} = fine-scale identification of all sea lice and life stages
#'    \item \samp{salmoncoast_motiles} = identification of only motile stages of sea lice
#'    }}
#'
#' }
"sealice_field"

#' Identification of sea lice collected from fish in the lab in 2015 from lice collection protocol *lab_fine_2015*
#'
#' A dataset containing detailed sea lice taxonomic identification
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. \strong{Foreign key to}: \code{\link{fish_lab_data}}.}
#'  \item{date_liced}{The date the lice were identified.}
#'  \item{lab_count_fine_no_id}{The number of lice collected that the dissecting technician recorded when the lice were originally collected}
#'  \item{lab_count_fine_total}{The total number of lice that the louse identifier counted in the sample vial}
#'  \item{lep_cop}{\emph{Lepeophtheirus salmonis} copepodite.}
#'  \item{lep_cunifer_cop}{\emph{Lepeophtheirus cunifer} copepodite.}
#'  \item{lep_chal_a}{\emph{Lepeophtheirus salmonis} chalimus A.}
#'  \item{lep_chal_b}{\emph{Lepeophtheirus salmonis} chalimus B.}
#'  \item{lep_pa_m_1}{\emph{Lepeophtheirus salmonis} pre-adult male stage 1.}
#'  \item{lep_pa_m_2}{\emph{Lepeophtheirus salmonis} pre-adult male stage 2.}
#'  \item{lep_pa_f_1}{\emph{Lepeophtheirus salmonis} pre-adult female stage 1.}
#'  \item{lep_pa_f_2}{\emph{Lepeophtheirus salmonis} pre-adult female stage 2.}
#'  \item{lep_pa_unid}{\emph{Lepeophtheirus salmonis} pre-adult unidentified stage of sex.}
#'  \item{lep_a_m}{\emph{Lepeophtheirus salmonis} adult male.}
#'  \item{lep_a_f}{\emph{Lepeophtheirus salmonis} adult female.}
#'  \item{lep_grav_f}{\emph{Lepeophtheirus salmonis} gravid female.}
#'  \item{cal_cop}{\emph{Caligus clemensi} copepodite.}
#'  \item{cal_chal_a_1}{\emph{Caligus clemensi} chalimus A stage 1.}
#'  \item{cal_chal_a_2}{\emph{Caligus clemensi} chalimus A stage 2.}
#'  \item{cal_chal_b_3}{\emph{Caligus clemensi} chalimus B stage 3.}
#'  \item{cal_chal_b_4_f}{\emph{Caligus clemensi} chalimus B stage 4 female.}
#'  \item{cal_chal_b_4_m}{\emph{Caligus clemensi} chalimus B stage 4 male.}
#'  \item{cal_chal_4_unid}{\emph{Caligus clemensi} chalimus B stage 4 unidentified sex.}
#'  \item{cal_chal_a_unid}{\emph{Caligus clemensi} chalimus A unidentified sex.}
#'  \item{cal_chal_b_unid}{\emph{Caligus clemensi} chalimus B unidentified sex.}
#'  \item{cal_pa_m}{\emph{Caligus clemensi} pre-adult male.}
#'  \item{cal_pa_f}{\emph{Caligus clemensi} pre-adult female.}
#'  \item{cal_grav_f}{\emph{Caligus clemensi} gravid female.}
#'  \item{cal_mot_unid}{Motile \emph{Caligus clemensi}.}
#'  \item{unid_louse}{Unidentified louse}
#'  \item{sealice_comments}{Comments pertaining to sealice ID}
#'  }
"sealice_lab_finescale"


#' Enumeration of sea lice found on fish in the lab
#'
#' A dataset containing counts of motile sea lice (\emph{Caligus clemensi} and \emph{Lepeophtheirus salmonis}) found on lab-dissected fish collected by the Juvenile Salmon Program
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. \strong{Foreign key to}: \code{\link{fish_lab_data}}.}
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
#' }
"sealice_lab_motiles"


#' Inventory and other metadata associated with packages of fish caught from seines
#'
#' A dataset containing variables describing the contents and location of packages of fish caught in Juvenile Salmon Program surveys
#'
#' \describe{
#' \item{package_id}{The alphanumeric string that uniquely identifies a package of fish. \strong{Primary key} to \code{\link{fish_field_data}}.}
#' \item{seine_id}{Unique ID assigned to each seine conducted \strong{Foreign key} to \code{\link{seine_data}}.}
#' \item{pkg_species}{The species of fish within a package. \samp{SO} = Sockeye, \samp{PI} = Pink, \samp{CU} = Chum, \samp{CO} = Coho, \samp{HE} = Herring, \samp{CK} = Chinook}
#' \item{number_of_fish}{Number of fish within a package}
#' \item{field_liced_status}{\samp{Y} = fish received lice enumeration in the field prior to packaging. \samp{N} = lice enumeration had not been performed}
#' \item{pkg_time_out}{Time the first fish of the package was taken out of the net and euthanized. \strong{Format:} \samp{hh:mm:ss}}
#' \item{pkg_time_dewar}{Time the full package was placed in the dewar for preservation. \strong{Format:} \samp{hh:mm:ss}}
#' \item{pkg_comments}{Notes regarding the contents or nature of the package}
#'
#' }
"package_data"


#' Temperature and salinity data
#'
#' A dataset containing oceanographic variables collected from Juvenile Salmon Program site surveys with a YSI Pro30 multiparameter meter
#'
#' \describe{
#'  \item{survey_id}{A unique alphanumeric code assigned to every survey. \strong{Foreign key to}: \code{\link{survey_data}}.}
#'  \item{line_out_depth}{The depth at which the measurement was taken. \strong{Units:} metres}
#'  \item{temperature}{Temperature. \strong{Units:} degrees celcius}
#'  \item{salinity}{Salinity. \strong{Units:} parts per thousand}
#'  \item{ysi_gather_lat}{The geopgraphical latitude of measurement gathered by the electronic tablet. \strong{Units:} decimal degrees}
#'  \item{ysi_gather_long}{The geopgraphical longitude of measurement gathered by the electronic tablet. \strong{Units:} decimal degrees}
#'
#' }
"ysi"


#' Zooplankton tow metadata
#'
#' A dataset containing variables collected from horizontal zooplankton tows during Juvenile Salmon Program site surveys
#'
#' \describe{
#'  \item{survey_id}{A unique alphanumeric code assigned to every survey. \strong{Foreign key to}: \code{\link{survey_data}}.}
#'  \item{sample_id}{A unique sample ID assigned and labelled onto every 250 mL PET jar that resulted from the zoop tow}
#'  \item{zoop_tow_gather_lat}{The geopgraphical latitude of measurement gathered by the electronic tablet. \strong{Units:} decimal degrees}
#'  \item{zoop_tow_gather_long}{The geopgraphical longitude of measurement gathered by the electronic tablet. \strong{Units:} decimal degrees}
#'  \item{tow_start_time}{The 24-hour time the zooplankton tow began. \strong{Format:} \samp{hh:mm:ss}}
#'  \item{tow_end_time}{The 24-hour time the zooplankton tow ended. \strong{Format:} \samp{hh:mm:ss}}
#'  \item{tow_duration}{The duration of the zooplakton tow. \strong{Units:} minutes}
#'  \item{flow_meter}{The serial number of the flowmeter}
#'  \item{flowmeter_in}{The revolution count of the flowmeter before begining the tow}
#'  \item{flowmeter_out}{The revolution count of the flowmeter after finishing the tow}
#'  \item{revolutions}{The number of revolutions of the flowmeter that occured during the tow. The difference between \code{flowmeter_in} and \code{flowmeter_out}.}
#'  \item{volume}{The volume of water sampled taking in to account on the flowmeter count, the calibration coefficient of the flowmeter, and the size of the net.}
#'  \item{modelled_volume}{A modelled estimate of the volume sampled. Early season in 2015 the flowmeter was not working, so volume was modeled based on tow duration and secchi depth. The R script of this model is available upon request}
#'  \item{quality_level}{\samp{Raw} infers there is no way to check the quality of the data and no guarantee of accuracy is possible, use at your own risk. \samp{Technician} infers that the data has passed an initial QA/QC level}
#'  \item{quality_log}{Comments regarding the Quality level}
#'
#' }
"zoop_tows"


#' Probable genetic stocks associated a fish
#'
#' A dataset containing the results of genetic stock ID analyses performed on DNA samples collected from fish caught by the Juvenile Salmon Program.
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish}
#'  \item{semsp_id}{A unique ID for every fish retained that was a concatenation of \code{survey_date}, \code{site_id}, \code{species}, and order the fish was pulled out of the net. In 2017 this was method was abandonded, and instead we assigned seine IDs and UFNs to uniquely identify seines and fish}
#'  \item{sample_id}{The alphanumeric string that uniquely identifies a sample. This enables results to be linked back to the sample and fish from which it was collected. \strong{Format}: \samp{'S'} followed by a sequence of letter and numbers.}
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


#' Location information for all sample storage containers
#'
#' A dataset containing location information for the bulk storage of biological samples obtain from fish caught by the Juvenile Salmon Program
#'
#'
#' \describe{
#'  \item{container_id}{The string that uniquely identifies the box, book, tray, etc. in which a sample is stored. \strong{Format:} \samp{B} followed by the two (or three)-character sample type code, and then a number to uniquely identify the box within its sample type (e.g. \samp{"BFA12"}).
#'   \itemize{
#'    \item In some instances, a species code may precede the number (where boxes were only unique on a species-level, e.g. \samp{"BFASO1"}).
#'    \item The only exception is for fin clips, which are stored on Whatman sheets. For samples from 2015-2017, Whatman sheets had the \code{container_id} format \samp{'DW'} or \samp{'JW'} followed by a number, where \samp{'D'} identifies samples collected in the Discovery Islands, and \samp{'J'} denotes Johnstone Strait.
#'    }
#'    }
#'  \item{container_type}{The type of samples being stored in the container}
#'  \item{storage_medium}{The medium in which a tissue sample is being preserved. \strong{Categories}: \samp{frozen -80, frozen -20, formalin, dry, whatman sheet, 95 percent non-denatured ethanol}}
#'  \item{current_location}{Physical location or building in which the sample container exists, e.g. \samp{"Quadra Prep Lab"} or \samp{"UBC"}}
#'  \item{storage_unit}{Identity of the freezer or dry shelving unit in which a sample container is being stored}
#'  \item{storage_tier_1}{The first organizational tier of storage for the sample container, e.g. samp{"Shelf 1"} or \samp{"Group Box 1"}}
#'  \item{storage_tier_2}{The second organizational tier of storage for the sample container, within the first organizational tier, e.g. \samp{"Tray 1"}}
#'  \item{shipping_container}{Number of a box containing a group of sample containers to be shipped from Hakai}
#'  \item{date_shipped}{Date when a shipment of samples was sent out from Hakai. \strong{Format:} \samp{yyyy-mm-dd}}
#'  \item{shipped_to}{Destination of the shipping container}
#'  \item{date_received}{Date when a shipment of samples was received. \strong{Format:} \samp{yyyy-mm-dd}}
#'  \item{expecting_return}{Whether or not it is expected that shipped samples are to be returned to Hakai}
#'  \item{date_returned}{Date when processed samples have been returned to Hakai for storage. \strong{Format:} \samp{yyyy-mm-dd}}
#'
#'  }
"sample_container_inventory"

#' Storage information for RNA samples
#'
#' Metadata associated with tissue samples obtained from fish caught by the Juvenile Salmon Program, for use in RNA:DNA ratio analysis and viral disease states. The following tissue types are collected: muscle, gill, brain, spleen, liver, heart, and kidney
#'
#' \describe{
#'  \item{ufn}{The alphanumeric string that uniquely identifies a fish. \strong{Foreign key} to \code{\link{fish_lab_data}}. \strong{Format:} \samp{'U'} followed by a sequence of numbers.}
#'  \item{sample_type}{The type of sample being collected. \strong{Categories:} \samp{RNA, fatty acid, isotope, muscle, DNA, stomach, otolith, scale, fin clip, carcass, sealice, sealice_cal, sealice_lep}}
#'  \item{sample_id}{The \code{sample_location} value (detailed below). This enables results to be linked back to the sample and fish from which it was collected.}
#'  \item{container_id}{The string that uniquely identifies the tray in which sets of sample vials are stored.}
#'  \item{container_cell}{The row (A-H) and column (1-12) in which a sample is stored in its container}
#'  \item{sample_location}{A concatenation of \code{container_id} and \code{container_cell}, which forms a unique location code for the purposes of identifying potential duplicate entries during qa/qc.}
#'  \item{comments_sample}{Comments regarding notable characteristics/properties of the particular sample}
#'  \item{sample_status}{Results status of the sample}
#'  \item{sample_qc_flag}{Indicates whether there is a qc error for the sample's metadata (not quality of the actual sample)}
#'  \item{sample_flag_reason}{Describes why the sample has been flagged. For example, two samples sharing the same \code{sample_location} value}
#'  \item{sample_qc_log}{Log of changes to any sample metadata during qa/qc}
#'
#' }
