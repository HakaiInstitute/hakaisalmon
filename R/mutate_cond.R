#' A conditional mutate function that allows you to mutate a variable based on another
#'
#' @param .data, variable to test for logical equality, variable you want to mutate
#' @keywords conditional mutate
#' @export
#' @examples
#' df <- as.data.frame(x = c(1,2,3), y = c(a,b,c))
#' mutate_cond(df, x == 1, y == "c" )

mutate_cond <- function(.data, condition, ..., envir = parent.frame()) {
  condition <- eval(substitute(condition), .data, envir)
  .data[condition, ] <- .data[condition, ] %>% mutate(...)
  .data
}
