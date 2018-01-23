#' On attach message
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(c(cat(crayon::cyan("Welcome to the Hakai Institute Juvenile Salmon Program R Package.\nType "))),
                        cat(crayon::bgCyan("?hakaisalmon")),
cat(crayon::cyan(" to read package documentation.")))
}



