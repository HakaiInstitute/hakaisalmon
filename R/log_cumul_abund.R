#' Predict the cumulative proportion of catch for the purposes of estimating annual migration timing using a logistic growth equation
#'
#' @param percent The cumuative proportion of catch between 0 and 100 percent
#' @param date The julian date of capture
#'
#' @return
#' A dataframe with a date column and predicted cumulative proportion of catch
#' @export
#'
#' @examples
#' date <- 110:190
#' n <- rnorm(81, mean = 100, sd = 20)
#' df <- dplyr::tibble(date, percent)
#' df <- df %>% mutate(percent == cumsum(n / sum(n) * 100))
#' log_cumul_abund(df$date, df$percent)

log_cumul_abund <- function(percent, date){
  coefs <- coef(lm(logit(percent / 100) ~ date))
  phi2 <- coefs[1]
  phi3 <- coefs[2]
  wilson <- nls(percent ~ phi1 / (1 + exp(-(phi2 + phi3 * date))),
                start = list(phi1 = 100, phi2 = phi2, phi3 = phi3), trace = TRUE)
  min <- min(date, na.rm = T) - 7
  max <- max(date, na.rm = T) + 7
  phi1 <- 100
  phi2 <- coef(wilson)[2]
  phi3 <- coef(wilson)[3]
  x <- c(seq(min, to = max, by = 1))
  y <- phi1 / (1 + exp(-(phi2 + phi3 * x)))
  out <- data_frame(x, y)
  return(out)
}
