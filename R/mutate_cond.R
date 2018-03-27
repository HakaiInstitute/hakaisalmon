#' A condition mutate function
#'
#' This function allows you to mutate one 
#' @param .data Do you love cats? Defaults to TRUE.
#' @keywords conditional mutate
#' @export
#' @examples
#' mutate_cond()

mutate_cond <- function(.data, condition, ..., envir = parent.frame()) {
  condition <- eval(substitute(condition), .data, envir)
  .data[condition, ] <- .data[condition, ] %>% mutate(...)
  .data
}