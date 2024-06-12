globalVariables(c("icon", "color",  "uri"))

#' Item Icon Helper
#'
#' @param name Name of the icon, corresponds to marker_icon.
#' @param ... Additional arguments.
#'
#' @return Adds an icon to a dataframe for use with an item chart.
#' @export
#'
#' @examples
#' data <- data.frame(
#'   x = c(3, 5),
#'   color = c("green", "blue")
#' )
#' data <- data %>%
#'   dplyr::mutate(
#'   icon = "person",
#'   uri = purrr::map2_chr(icon, color, ~ icon_symbol(.x, fill = .y)),
#'   marker = purrr::map(uri, ~ list(symbol = stringr::str_glue("url({data_uri})", data_uri = .x)))
#'   )
#'
icon_symbol <- function(name, ...) {
  file <- tempfile(fileext = ".png")
  fontawesome::fa_png(name, file = file, ...)
  knitr::image_uri(file)
}




