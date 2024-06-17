#' Logo
#'
#' Add logo to exported charts.
#'
#' @param hc a highcharter chart
#' @param path path to logo
#' @param top top margin of logo
#' @param left left margin of logo
#' @param width width of logo
#' @param height height of logo
#'
#' @export
#' @examples
#'
#' library(naccho.viz)
#' library(highcharter)
#'
#'     highchart() |>
#'       hc_xAxis(categories = month.abb) |>
#'       hc_add_series(name = "Tokyo", data = sample(1:12)) |>
#'       hc_exporting(
#'         enabled = TRUE, # always enabled
#'         filename = "custom-file-name"
#'         ) |>
#'       add_logo(
#'         "https://github.com/lindsayjorgenson.png",
#'         width = 10L,
#'         height = 10L
#'       )
#'
add_logo <- function(hc,
                     path,
                     top = 80L,
                     left = 10L,
                     width = 100L,
                     height = 100L){
  if(missing(path))
    stop("path is required")

  hc$x$hc_opts$chart$events <- list(
    load = htmlwidgets::JS(
      sprintf("function() {
          if (!this.options.chart.forExport) return;
          this.renderer.image('%s', %s, %s, %s, %s).add();
        }",
              path,
              top,
              left,
              width,
              height
      )
    ),
    beforePrint = htmlwidgets::JS(
      sprintf("function() {
          let img = this.renderer.image('%s', %s, %s, %s, %s).add();
          img.addClass('image');
        }",
              path,
              top,
              left,
              width,
              height
      )
    ),
    afterPrint = htmlwidgets::JS("function(){
      $('.hc-image').hide();
    }")
  )

  hc
}
