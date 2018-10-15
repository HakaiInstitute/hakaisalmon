#' Lump Fraser River sockeye stocks produced by CBayes at PBS, based on regions according to Chrys Neville
#'
#' @param stock_1 The column containing the stock category you want to collapse
#'
#' @return
#' A vector of lumped fraser stocks
#' @export
#'
#' @examples
#' lumped_stocks <- df %>%
#'   mutate(lumped = lump_fraser_sockeye_stocks(stock_1))
lump_fraser_sockeye_stocks <- function(stock_1) {
  as.factor(stock_1) %>%
    forcats::fct_collapse(stock_1,
                          Early_Stuart = c("Driftwood", "Narrows", "Dust", "Bivouac", "Rossette",
                                           "Sinta", "Porter_Cr", "Forfar", "Blackwater", "Gluskie",
                                           "Paula", "Felix", "Kynock", "Hudson_Bay", "Sandpoint",
                                           "FiveMile", "early stuart"),
                          Chilliwack = c("Chilliw_lake", "DollyVarden_Cr"),
                          Pitt = c("Pitt"),
                          Nadina_Gates_Bowron_Nahatlatch = c("Nadina", "Gates_Cr", "Bowron",
                                                             "Nahatlatch"),
                          Early_Thompson = c("Seymour", "Scotch", "Eagle", "U_Adams", "Cayenne",
                                             "Fennell", "early thompson"),
                          Harrison_Widgeon = c("Harrison", "WidgeonSlough"),
                          Late_Stuart_Stellako = c("Middle", "Pinchi_Cr", "Tachie", "Stellako",
                                                   "Kuzkwa_Cr", "late stuart"),
                          Chilko = c("Chilko", "Chilko-North", "Chilko_south"),
                          Quesnel = c("L_Horsefly", "U_Horsefly", "Horsefly", "McKinley",
                                      "Mitchell", "Wasko_Cr", "Blue_Lead_Ck", "Quesnel_Decept",
                                      "Quesnel_Horsef", "Quesnel_Mitche", "Roaring", "quesnel", "Quesnel"),
                          Raft_North_Thompson = c("Raft", "Thompson_N"),
                          Birkenhead_Big_Silver = c("Birkenhead", "Big_Silver"),
                          Late_Shuswap_Portage = c("Eagle_L", "Little", "L_Shuswap", "MiddleShuswap",
                                                   "L_Adams", "Portage_Cr", "late shuswap", "shuswap"),
                          Weaver_Cultus = c("Weaver", "Cultus_Lake")
    )
}
