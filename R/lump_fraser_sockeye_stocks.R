#' Lump Fraser River sockeye stocks produced by CBayes at PBS, based on regions according to Chrys Neville
#'
#' @param stock_1 The column containing the stock category you want to collapse
#'
#' @return
#' A vector of lumped fraser stocks
#' @export
#'
lump_fraser_sockeye_stocks <- function(stock_1) {
  as.factor(stock_1)
    forcats::fct_collapse(stock_1,
                          Early_Stuart = c("DRIFTWOOD", "NARROWS", "DUST", "BIVOUAC", "ROSSETTE",
                                           "SINTA", "PORTER_CR", "FORFAR", "BLACKWATER", "GLUSKIE",
                                           "PAULA", "FELIX", "KYNOCK", "HUDSON_BAY", "SANDPOINT",
                                           "FIVEMILE", "EARLY STUART"),
                          Chilliwack = c("CHILLIW_LAKE", "DOLLYVARDEN_CR"),
                          Pitt = c("PITT"),
                          Nadina_Gates_Bowron_Nahatlatch = c("NADINA", "GATES_CR", "BOWRON",
                                                             "NAHATLATCH"),
                          Early_Thompson = c("SEYMOUR", "SCOTCH", "EAGLE", "U_ADAMS", "CAYENNE",
                                             "FENNEL", "EARLY THOMPSON"),
                          Harrison_Widgeon = c("HARRISON", "WIDGEON_SLOUGH"),
                          Late_Stuart_Stellako = c("MIDDLE", "PINCHI_CR", "TACHIE", "STELLAKO",
                                                   "KUZKWA_CR", "LATE STUART"),
                          Chilko = c("CHILKO", "CHILKO-NORTH", "CHILKO_SOUTH"),
                          Quesnel = c("L_HORSEFLY", "U_HORSEFLY", "HORSEFLY", "MCKINLEY",
                                      "MITCHELL", "WASKO_CR", "BLUE_LEAD_CK", "QUESNEL_DECEPT",
                                      "QUESNEL_HORSEF", "QUESNEL_MITCHE", "ROARING", "QUESNEL"),
                          Raft_North_Thompson = c("RAFT", "THOMPSON_N"),
                          Birkenhead_Big_Silver = c("BIRKENHEAD", "BIG_SILVER"),
                          Late_Shuswap_Portage = c("EAGLE_L", "LITTLE", "L_SHUSWAP", "MIDDLESHUSWAP",
                                                   "L_ADAMS", "PORTAGE_CR", "LATE SHUSWAP", "SHUSWAP"),
                          Weaver_Cultus = c("WEAVER", "CULTUS_LAKE")
    )
}
