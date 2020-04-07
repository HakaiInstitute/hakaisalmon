#' Predict the cumulative proportion of catch for the purposes of estimating annual migration timing using a logistic growth equation
#'
#' @param percent The cumuative proportion of catch between 0 and 100 percent
#' @param date The julian date of capture
#'
#' @return
#' A dataframe with a date column and predicted cumulative proportion of catch
#' @export
#'

log_cumul_abund <- function(percent, date){
  coefs <- stats::coef(stats::lm(logit(percent / 100) ~ date))
  phi2 <- coefs[1]
  phi3 <- coefs[2]
  wilson <- stats::nls(percent ~ phi1 / (1 + exp(-(phi2 + phi3 * date))),
                start = list(phi1 = 100, phi2 = phi2, phi3 = phi3), trace = TRUE)
  min <- min(date, na.rm = T)
  max <- max(date, na.rm = T)
  phi1 <- 100
  phi2 <- stats::coef(wilson)[2]
  phi3 <- stats::coef(wilson)[3]
  x <- c(seq(min, to = max, by = 1))
  y <- phi1 / (1 + exp(-(phi2 + phi3 * x)))
  out <- data.frame(x, y)
  return(out)
}
