#' On attach message
onAttach <- function() {
  packageStartupMessage(c(cat(crayon::cyan("Welcome to the Hakai Institute Juvenile Salmon Program R Package.\nType "))),
                        cat(crayon::bgCyan("?hakaisalmon")),
                        cat(crayon::cyan(" to read package documentation.")))
  my_theme <- ggplot2::theme_gray(base_size = 14)
  ggplot2::theme_set(my_theme)
}



