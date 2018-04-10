#' A conditional mutate function that allows you to mutate a variable based on another
#'
#' @param .data, the data frame or tibble you want to mutate a column in
#' @param x The column you want to test for a logical condition
#' @param y The coloumn you want to mutate based on logic from column x
#' @keywords conditional mutate
#' @export
#' @examples
#' mutate_cond(df, x == 1, y == "c" )

mutate_cond <- function(.data, condition, ..., envir = parent.frame()) {
  condition <- eval(substitute(condition), .data, envir)
  .data[condition, ] <- .data[condition, ] %>% mutate(...)
  .data
}
