# Functions for summarizing migration dynamics

#' Cat function
#'
#' This function allows you to detrmine if you are a cool person
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples
#' cat_function()

cat_function <- function(love=TRUE){
  if(love==TRUE){
    print("I love cats!")
  }
  else {
    print("I am not a cool person.")
  }
}

#' On attach message
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to the Hakai Institute Juvenile Salmon Program R Package!")
}

