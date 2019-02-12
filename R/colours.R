#' hakai scale fill
#'
#' @export
#' @name scale_fill_hakai
#' @author Brett Johnson
#' @title Hakai scale fill for ggplot2
#' @examples
#' scale_fill_hakai(theme="hakai")
scale_fill_hakai <- function(theme="hakai", hakai_key = list(
  hakai = c("#aa1f25",
            "#78B7C5",
            "#346257",
            "#EBCC2A",
            "#a58457",
            "#94911c",
            "#6699c5",
            "#c7e64b")

)) {

  scale_fill_manual(values=hakai_key[[theme]])

}
#' hakai scale color
#'
#' @export
#' @name scale_colour_hakai
#' @author Brett Johnson
#' @title Hakai scale colour for ggplot2
#' @examples
#' scale_colour_hakai(theme="hakai")
scale_colour_hakai <- function(theme="hakai",
                               hakai_key = list(
                                 hakai = c(
                                   "#aa1f25",
                                   "#78B7C5",
                                   "#346257",
                                   "#EBCC2A",
                                   "#a58457",
                                   "#94911c",
                                   "#6699c5",
                                   "#c7e64b"
                                 )

)) {

  scale_color_manual(values=hakai_key[[theme]])

}

# hakaicolours
#' Vectors of colors for figures
#'
#' Creates different vectors of related colors that may be useful for figures.
#'
#' @param palette Character string indicating a palette of colors.
#' @return Vector of character strings representing the chosen palette of colors.
#' @export
#' @importFrom grDevices rgb2hsv

hcolours <- function(palette = c("hakai",
                                "pal2"
                                ))
{



  hakai <- c('hakai_red'   = "#aa1f25",
             'sky_blue'    = "#78B7C5",
             'chum_green'  = "#346257",
             'sun_yellow'  = "#EBCC2A",
             'arid_tan'    = "#a58457",
             'nereo_green' = "#94911c",
             'sea_blue'    = "#6699c5",
             'marna_fluoro'= "#c7e64b"
  )

  pal2 <- c('blue_yonder'    = "#3E71A8",
            ## 'mustard'        = "#FEF735",
            'arctic_lime'    = "#CEFF1A",
            ## 'dark_byzantium' = "#5F3659",
            'mardi_gras'     = "#870E75",
            ## 'vivid_gamboge'  = "#FE9300",
            'safety_orange'  = "#FE6900",
            'tiffany_blue'   = "#0BB19F")


  switch(match.arg(palette),
         hakai = hakai
         )
}
# display.hcolors
#' Display hcolors
#'
#' displays the discrete hcolors palettes
#'
#' @param palette Character string indicating a palette of colors.
#' @export
#' @importFrom grDevices rgb2hsv
#' @importFrom graphics image
#' @importFrom graphics text
#' @importFrom graphics par
#' @examples
#' display_hakai_colours()

display_hakai_colours <- function(palette = c("hakai"))
{
  palette <- match.arg(palette)
  hcols   <- hcolours(palette)
  cnames  <- names(hcols)
  n       <- length(hcols)
  image(1:n, 1, as.matrix(1:n),
        col  = hcols,
        xlab = "", ylab = "",
        xaxt = "n", yaxt = "n", bty = "n")
  text(1:n, par("usr")[1] - 0.025,
       srt = 45, adj = 0.5,
       labels = cnames, xpd = TRUE)
}
