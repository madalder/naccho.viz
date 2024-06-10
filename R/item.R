#' NACCHO Item Chart
#'
#' @description
#' Create an accessible stacked bar chart (vertical or horizontal) using a NACCHO theme and the {highcharter} package.
#'
#' @param data the data frame to create the map.
#' @param y_variable numeric; from the data frame.
#' @param item_group character object; from the data frame.
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::naccho_colors.
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param caption_align character string; options include "left", "center", or "right" where the default is "center".
#' @param legend_enable boolean, TRUE or FALSE, where TRUE enables the legend. Defaults to FALSE.
#' @param legend_title character string; title of the legend, defaults to nothing unless defined.
#' @param tooltip character string; text and values to appear in the tooltip, use {point.xx} to call a value from the data frame, where xx is a specific column.
#' @param select_theme hc_theme, must be a defined hc_theme. Options from within this package include naccho.viz::naccho_minimal_theme and naccho_normal.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A column or bar chart from highcharter.
#' @export
#'
#' @examples
#' test_data <- base::data.frame(
#'   value = c(65, 11, 24),
#'   bender = c("Fire Bender", "Water Bender", "Air Bender")
#' )

#' test_data <-
#'  within(test_data, bender <- factor(bender, levels=c("Air Bender", "Water Bender", "Fire Bender")))

#' test_data <- test_data %>%
#'   dplyr::arrange(bender)


#' create_single_item(
#'   data = test_data,
#'   y_variable = "value",
#'   item_group = "bender",
#'   legend_enable = TRUE,
#'   legend_title = "Bender Type",
#'   tooltip =
#'     "{point.value}%"
#' )

create_single_item <- function(
    data,
    y_variable,
    item_group,
    my_colors = naccho.viz::naccho_colors,
    title_text = "",
    subtitle_text = "",
    caption_text = "",
    caption_align = "center",
    legend_enable = FALSE,
    legend_title = "",
    tooltip,
    select_theme = naccho.viz::naccho_minimal_theme,
    allow_export = TRUE,
    accessible_desc = ""
) {

  hc <-
    highcharter::hchart(
      data,
      type = "item",
      highcharter::hcaes(
        y = .data[[y_variable]],
        label = .data[[item_group]],
        name = .data[[item_group]]
      ),
      layout = "horizontal",
      showInLegend = TRUE
    ) %>%
    highcharter::hc_add_dependency(
      name = "modules/accessibility.js"
    ) %>%
    highcharter::hc_chart(
      width = 100
    ) %>%
    highcharter::hc_plotOptions(
      accessibility = list(
        enabled = TRUE,
        description = accessible_desc,
        keyboardNavigation = list(
          enabled = TRUE
        )
      ),
      series = list(
        marker = list(
          symbol = 'square'
        ),
        rows = 20
      )
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
    ) %>%
    highcharter::hc_chart(
      inverted = TRUE
    ) %>%
    highcharter::hc_title(
      text = title_text, # title text
      margin = 40,
      widthAdjust = -60
    ) %>%
    highcharter::hc_subtitle(
      text = subtitle_text # text under title
    ) %>%
    highcharter::hc_caption(
      text = caption_text, # source and data notes
      useHTML = TRUE,
      margin = 20,
      align = caption_align
    ) %>%
    highcharter::hc_legend(
      enabled = legend_enable, # enabled legend
      reversed = TRUE,
      layout = "horizontal",
      align = "center",
      verticalAlign = "bottom",
      itemMarginBottom = 3,
      itemMarginTop = 3,
      margin = 22,
      title = list(
        text = legend_title
      )
    ) %>%
    highcharter::hc_tooltip(
      pointFormat = tooltip,
      useHTML = TRUE
    ) %>%
    highcharter::hc_add_theme(
      select_theme
    ) %>%
    highcharter::hc_exporting(
      enabled = allow_export,
      accessibility = list(
        enabled = TRUE
      ),
      formAttributes = list(
        target = "_blank" # opens in new window
      ),
      sourceHeight = 700, # sets height of download
      sourceWidth = 1200, # sets width of download
      allowHTML = TRUE,
      url = "https://exporter.opifex.org", #serve owned by John Coene
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = naccho.viz::naccho_teal,
          symbolStroke = naccho.viz::naccho_teal,
          menuItems = c("printChart",
                        "separator",
                        "downloadPNG",
                        "downloadJPEG",
                        "downloadPDF",
                        "downloadSVG",
                        "separator",
                        "downloadCSV",
                        "downloadXLS",
                        "openInCloud")
        )
      )
    )
  return(hc)
}
