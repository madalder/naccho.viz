#' NACCHO Single Item Chart
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
          symbol = "square"
        )
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





#' NACCHO Icon Item Chart
#'
#' @param data the data frame to create the map.
#' @param y_variable numeric; from the data frame.
#' @param item_group character object; from the data frame.
#' @param marker_icon character object that corresponds to fontawesome icons; defaults to person.
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
#' @param color_one hex value or named color, first color.
#' @param color_two hex value or named color, second color.
#' @param color_thee hex value or named color, third color.
#' @param color_four hex value or named color, fourth color.
#' @param color_five hex value or named color, fifth color.
#'
#' @return an item chart with a font awesome icon.
#' @export
#'
#' @examples
#' test_data <- base::data.frame(
#'   value = c(6, 4),
#'   bender = c("Fire Bender", "Water Bender")
#' )

#' create_icon_item(
#'   data = test_data,
#'   y_variable = "value",
#'   item_group = "bender",
#'   legend_enable = TRUE,
#'   legend_title = "Bender Type",
#'   tooltip =
#'     "{point.value}%"
#' )

create_icon_item <- function(
    data,
    y_variable,
    item_group,
    marker_icon = "person",
    title_text = "",
    subtitle_text = "",
    caption_text = "",
    caption_align = "center",
    legend_enable = FALSE,
    legend_title = "",
    tooltip,
    select_theme = naccho.viz::naccho_minimal_theme,
    allow_export = TRUE,
    accessible_desc = "",
    color_one = naccho.viz::naccho_teal,
    color_two = naccho.viz::naccho_green,
    color_thee = naccho.viz::naccho_blue,
    color_four = naccho.viz::naccho_pink,
    color_five = naccho.viz::naccho_orange
) {


  n <- dplyr::n_distinct(data[[item_group]])

  if (n == 1) {

    stop("Error, there must be at least two levels in item_group")

  } else if (n == 2) {

    level_one <- paste(data[[item_group]][1])
    level_two <- paste(data[[item_group]][2])

    data[[item_group]] <- factor(data[[item_group]], levels=c(level_one, level_two))

    data <- data %>%
      dplyr::group_by(!!rlang::sym(item_group)) %>%
      dplyr::mutate(color = dplyr::case_when(!!rlang::sym(item_group) == level_one ~ color_one,
                                             !!rlang::sym(item_group) == level_two ~ color_two))

  } else if (n == 3) {

    level_one <- paste(data[[item_group]][1])
    level_two <- paste(data[[item_group]][2])
    level_three <- paste(data[[item_group]][3])

    data[[item_group]] <- factor(data[[item_group]], levels=c(level_one, level_two, level_three))

    data <- data %>%
      dplyr::group_by(!!rlang::sym(item_group)) %>%
      dplyr::mutate(color = dplyr::case_when(!!rlang::sym(item_group) == level_one ~ color_one,
                                             !!rlang::sym(item_group) == level_two ~ color_two,
                                             !!rlang::sym(item_group) == level_three ~ color_three))

  } else if (n == 4) {

    level_one <- paste(data[[item_group]][1])
    level_two <- paste(data[[item_group]][2])
    level_three <- paste(data[[item_group]][3])
    level_four <- paste(data[[item_group]][4])

    data[[item_group]] <- factor(data[[item_group]], levels=c(level_one, level_two, level_three, level_four))

    data <- data %>%
      dplyr::group_by(!!rlang::sym(item_group)) %>%
      dplyr::mutate(color = dplyr::case_when(!!rlang::sym(item_group) == level_one ~ color_one,
                                             !!rlang::sym(item_group) == level_two ~ color_two,
                                             !!rlang::sym(item_group) == level_three ~ color_three,
                                             !!rlang::sym(item_group) == level_four ~ color_four))

  } else if (n == 5) {

    level_one <- paste(data[[item_group]][1])
    level_two <- paste(data[[item_group]][2])
    level_three <- paste(data[[item_group]][3])
    level_four <- paste(data[[item_group]][4])
    level_five <- paste(data[[item_group]][5])

    data[[item_group]] <- factor(data[[item_group]], levels=c(level_one, level_two, level_three, level_four, level_five))

    data <- data %>%
      dplyr::group_by(!!rlang::sym(item_group)) %>%
      dplyr::mutate(color = dplyr::case_when(!!rlang::sym(item_group) == level_one ~ color_one,
                                             !!rlang::sym(item_group) == level_two ~ color_two,
                                             !!rlang::sym(item_group) == level_three ~ color_three,
                                             !!rlang::sym(item_group) == level_four ~ color_four,
                                             !!rlang::sym(item_group) == level_five ~ color_five))

  } else {

    stop("Error, requires between 2 and 5 levels in item_group")

  }

  data <- data %>%
    dplyr::mutate(
      icon = marker_icon,
      uri = purrr::map2_chr(icon, color, ~ naccho.viz::icon_symbol(.x, fill = .y)),
      marker = purrr::map(uri, ~ list(symbol = stringr::str_glue("url({data_uri})", data_uri = .x)))
    )

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
    highcharter::hc_plotOptions(
      accessibility = list(
        enabled = TRUE,
        description = accessible_desc,
        keyboardNavigation = list(
          enabled = TRUE
        )
      ),
      series = list(
        point = list(
          events =
            list(
              legendItemClick =
                highcharter::JS(
                  "function(e) {e.preventDefault() }"
                )
            )
        )
      )
    ) %>%
    highcharter::hc_colors(
      dplyr::pull(data, color)
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
