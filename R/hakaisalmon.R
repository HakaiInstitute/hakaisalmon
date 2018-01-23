#'hakaisalmon: Hakai Institute Juvenile Salmon Program data
#'
#'The hakaisalmon package is primarily a data package that contains the most up
#'to date versions of the Hakai Institute Juvenile Salmon Program (JSP) data.
#'
#'@section Usage: The purpose of this package is to make it easy to interact
#'  with JSP data. All program data is loaded into memory upon calling
#'  `library(hakaisalmon). You will not see datatables as objects in your
#'  environment but to demonstrate that the data is loaded into memory begin to
#'  type `survey` in your script you should see several JSP data tables pop up
#'  in the tab completion window.
#'
#'  All the tables from the program database are available indvidually (not
#'  joined) here. However, some of the more common joins have already be
#'  completed here. The common joins available are:
#'
#'  \itemize{ \item `survey_seines` - Joins survey and seine data \item
#'  `fish_data` - Joins fish_field_data with fish_lab_data \item
#'  `survey_seines_fish` - Joins survey_seines with fish_data \item
#'  `survey_seines_fish_stock_id` - Joins survey_seines_fish with stock_id }
#'
#'  If you wish to join other tables you can do so using the dplyr::left_join
#'  function. If this is something you have to do often, consider including your
#'  custom join in this package by contacting the maintainer.
#'
#'  The tables in this package follow a relational database structure. To see a
#'  visual depiction of the database structure see
#'  \href{https://drive.google.com/open?id=1CovY6zr-LYYP5MsUHSynxsFDTPc7_KEO}{this
#'   entity-relationship-diagram}.
#'
#'  A full list of the tables in this datapackage and descriptions of their
#'  variables can be found
#'  \href{https://docs.google.com/spreadsheets/d/10UYCrwYDBDPTFauyy2GvckCCKBc3pGT1O4WcvuB48rs/edit#gid=1094153037}{here}.
#'
#'
#'
#'
#'
#'@section Contribution: I appreciate feedback on how this package can better
#'  fulfill your needs. If you have custom functions that apply to JSP data,
#'  consider including them in this package. Contributing is best done using
#'  GitHUB, through the fork and pull-request model. Otherwise email requests
#'  are encouraged.
#'
#'
#'
#'@section Permissions and Updates:
#'
#'  This is a private package, and the user token you generated to install this
#'  package must not be shared. This package contains the most current data
#'  available. There is currently no effort to release versions of this package
#'  or to assign a DOI to cite this package. This package will be updated
#'  continually as new data are added. While the data in this package has been
#'  thoroughly QC'd it is not meant for pubclication. Citable datapackages are
#'  available for that.
#'
#'  To ensure you have the most up to date data available while using this
#'  package, remember to regularly update it using the same procedure you used
#'  to install it for the first time.
#'
#'@section To update: \itemize{ \item Go to  https://github.com/settings/tokens
#'  \item click `Generate New Token` \item click the box next to `repo` and;
#'  \item scroll down to click generate new token \item copy the token \item
#'  return to the R console and type:
#'  devtools::install_github('hakaiinstitute/hakaisalmon', auth_token = "PASTE
#'  YOUR TOKEN HERE") }
#'
#'@section Maintainer: Brett.Johnson@hakai.org
#'
#'@docType package
#'@name hakaisalmon
NULL

