globalVariables(".data")


#' NACCHO Single Bar Chart
#'
#' @description
#' Create an accessible single bar chart (vertical or horizontal) using a NACCHO theme and the {highcharter} package.
#'
#' @param data the data frame to create the map.
#' @param type character string; must be "column" or "bar", where "column" displays vertically and "bar" displays horizontally.
#' @param x_variable object; from the data frame, ideally a character.
#' @param y_variable numeric; from the data frame.
#' @param tick_amount numeric; sets the number of ticks, defaults to 6.
#' @param color_bars boolean, TRUE or FALSE, where TRUE results in each bar being a different color.
#' @param y_label character string; label for the y-axis.
#' @param y_max numeric; the maximun value of the y-axis, defaults to 100.
#' @param y_format character string; format for the y-axis numbers, defaults to "{value:,.0f}". This is used to adjust decimals or add characters after the number. Examples follow. "{value}%" add a % sign and does not specify decimals. "{value:.1f}" specifies one decimal point. "{value:,.0f}" specifies one decimal and adds a comma every three values. "{value}%" adds a percent sign. You can also add words to the value by doing the following: "{value} words here".
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::naccho_colors.
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param caption_align character string; options include "left", "center", or "right" where the default is "center".
#' @param legend_enable boolean, TRUE or FALSE, where TRUE enables the legend. Defaults to FALSE.
#' @param legend_title character string; title of the legend, defaults to nothing unless defined.
#' @param tooltip character string; text and values to appear in the tooltip, use {point.xx} to call a value from the data frame, where xx is a specific column.
#' @param select_theme hc_theme, must be a defined hc_theme. Options from within this package include naccho.viz::minimal and naccho_normal.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A column or bar chart from highcharter.
#' @export
#'
#' @examples
#' test_data <- data.frame(
#'   year = c("2019", "2022"),
#'   value = c(150, 200)
#' )
#'
#' create_single_bar(
#'   data = test_data,
#'   x_variable = "year",
#'   y_variable = "value",
#'   y_label = "Number",
#'   y_max = 250,
#'   tooltip = "{point.value}"
#' )
#'

create_single_bar <- function(
    data,
    type = "column",
    x_variable,
    y_variable,
    tick_amount = 6,
    color_bars = FALSE,
    y_label,
    y_max = 100,
    y_format = "{value:,.0f}",
    my_colors = naccho.viz::naccho_colors,
    title_text = "",
    subtitle_text = "",
    caption_text = "",
    caption_align = "center",
    legend_enable = FALSE,
    legend_title = "",
    tooltip,
    select_theme = naccho.viz::minimal,
    allow_export = TRUE,
    accessible_desc = ""
    ) {

  hcoptslang <- getOption("highcharter.lang")
  hcoptslang$thousandsSep <- ","

  # replace G with B for billions
  hcoptslang$numericSymbols <- c( " k", " m", " b" ,"t", "P" ,"E")
  options(highcharter.lang = hcoptslang)

  hc <-
    highcharter::hchart(
      data,
      type = type,
      highcharter::hcaes(
        x = .data[[x_variable]],
        y = .data[[y_variable]]
      ),
      colorByPoint = color_bars
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
      )
    ) %>%
    highcharter::hc_xAxis(
      title = list(text = "") # x-axis label
    ) %>%
    highcharter::hc_yAxis(
      title = list(text = y_label), # y-axis label
      max = y_max,
      tickAmount = tick_amount,
      min = 0,
      labels = list(
        format = y_format
      )
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
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
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = naccho.viz::teal,
          symbolStroke = naccho.viz::teal,
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


#' NACCHO Stacked Bar Chart
#'
#' @description
#' Create an accessible stacked bar chart (vertical or horizontal) using a NACCHO theme and the {highcharter} package.
#'
#' @param data the data frame to create the map.
#' @param type character string; must be "column" or "bar", where "column" displays vertically and "bar" displays horizontally.
#' @param x_variable object; from the data frame, ideally a character.
#' @param y_variable numeric; from the data frame.
#' @param x_group character object; from the data frame.
#' @param tick_amount numeric; sets the number of ticks, defaults to 6.
#' @param color_bars boolean, TRUE or FALSE, where TRUE results in each bar being a different color.
#' @param y_label character string; label for the y-axis.
#' @param y_max numeric; the maximun value of the y-axis, defaults to 100.
#' @param y_format character string; format for the y-axis numbers, defaults to "{value:,.0f}". This is used to adjust decimals or add characters after the number. Examples follow. "{value}%" add a % sign and does not specify decimals. "{value:.1f}" specifies one decimal point. "{value:,.0f}" specifies one decimal and adds a comma every three values. "{value}%" adds a percent sign. You can also add words to the value by doing the following: "{value} words here".
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::naccho_colors.
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param caption_align character string; options include "left", "center", or "right" where the default is "center".
#' @param legend_enable boolean, TRUE or FALSE, where TRUE enables the legend. Defaults to FALSE.
#' @param legend_title character string; title of the legend, defaults to nothing unless defined.
#' @param tooltip character string; text and values to appear in the tooltip, use {point.xx} to call a value from the data frame, where xx is a specific column.
#' @param select_theme hc_theme, must be a defined hc_theme. Options from within this package include naccho.viz::minimal and naccho_normal.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A column or bar chart from highcharter.
#' @export
#'
#' @examples
#' test_data <- base::data.frame(
#'   year = c("2019", "2022", "2019", "2022"),
#'   value = c(150, 200, 20, 30),
#'   bender = c("Fire Bender", "Fire Bender", "Water Bender", "Water Bender")
#' )

#' test_data <-
#' within(test_data, bender <- factor(bender, levels=c("Water Bender", "Fire Bender")))

#' test_data <- test_data %>%
#'   dplyr::arrange(bender)


#' create_stacked_bar(
#'   data = test_data,
#'   my_colors = c(naccho.viz::green, naccho.viz::teal),
#'   x_variable = "year",
#'   y_variable = "value",
#'   x_group = "bender",
#'   y_label = "Number",
#'   y_max = 250,
#'   legend_enable = TRUE,
#'   legend_title = "Bender Type",
#'   tooltip =
#'     "Bender: {point.bender} <br>
#'  Value: {point.value}"
#' )

create_stacked_bar <- function(
    data,
    type = "column",
    x_variable,
    y_variable,
    x_group,
    tick_amount = 6,
    color_bars = FALSE,
    y_label,
    y_max = 100,
    y_format = "{value:,.0f}",
    my_colors = naccho.viz::naccho_colors,
    title_text = "",
    subtitle_text = "",
    caption_text = "",
    caption_align = "center",
    legend_enable = FALSE,
    legend_title = "",
    tooltip,
    select_theme = naccho.viz::minimal,
    allow_export = TRUE,
    accessible_desc = ""
) {

  hcoptslang <- getOption("highcharter.lang")
  hcoptslang$thousandsSep <- ","

  # replace G with B for billions
  hcoptslang$numericSymbols <- c( " k", " m", " b" ,"t", "P" ,"E")
  options(highcharter.lang = hcoptslang)

  hc <-
    highcharter::hchart(
      data,
      type = type,
      highcharter::hcaes(
        x = .data[[x_variable]],
        y = .data[[y_variable]],
        group = .data[[x_group]]
      ),
      stacking = "normal"
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
      )
    ) %>%
    highcharter::hc_xAxis(
      title = list(text = "") # x-axis label
    ) %>%
    highcharter::hc_yAxis(
      title = list(text = y_label), # y-axis label
      max = y_max,
      tickAmount = tick_amount,
      min = 0,
      labels = list(
        format = y_format
      )
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
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
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = naccho.viz::teal,
          symbolStroke = naccho.viz::teal,
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





#' NACCHO Grouped Bar Chart
#'
#' @description
#' Create an accessible grouped bar chart (vertical or horizontal) using a NACCHO theme and the {highcharter} package.
#'
#' @param data the data frame to create the map.
#' @param type character string; must be "column" or "bar", where "column" displays vertically and "bar" displays horizontally.
#' @param x_variable object; from the data frame, ideally a character.
#' @param y_variable numeric; from the data frame.
#' @param x_group character object; from the data frame.
#' @param tick_amount numeric; sets the number of ticks, defaults to 6.
#' @param color_bars boolean, TRUE or FALSE, where TRUE results in each bar being a different color.
#' @param y_label character string; label for the y-axis.
#' @param y_max numeric; the maximun value of the y-axis, defaults to 100.
#' @param y_format character string; format for the y-axis numbers, defaults to "{value:,.0f}". This is used to adjust decimals or add characters after the number. Examples follow. "{value}%" add a % sign and does not specify decimals. "{value:.1f}" specifies one decimal point. "{value:,.0f}" specifies one decimal and adds a comma every three values. "{value}%" adds a percent sign. You can also add words to the value by doing the following: "{value} words here".
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::naccho_colors.
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param caption_align character string; options include "left", "center", or "right" where the default is "center".
#' @param legend_enable boolean, TRUE or FALSE, where TRUE enables the legend. Defaults to FALSE.
#' @param legend_title character string; title of the legend, defaults to nothing unless defined.
#' @param legend_reverse boolean, TRUE or FALSE, where TRUE reverses the legend.
#' @param tooltip character string; text and values to appear in the tooltip, use {point.xx} to call a value from the data frame, where xx is a specific column.
#' @param select_theme hc_theme, must be a defined hc_theme. Options from within this package include naccho.viz::minimal and naccho_normal.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A column or bar chart from highcharter.
#' @export
#'
#' @examples
#' test_data <- base::data.frame(
#'   year = c("2019", "2022", "2019", "2022"),
#'   value = c(150, 200, 20, 30),
#'   bender = c("Fire Bender", "Fire Bender", "Water Bender", "Water Bender")
#' )

#' test_data <-
#' within(test_data, bender <- factor(bender, levels=c("Water Bender", "Fire Bender")))

#' test_data <- test_data %>%
#'   dplyr::arrange(bender)


#' create_grouped_bar(
#'   data = test_data,
#'   type = "bar",
#'   my_colors = c(naccho.viz::green, naccho.viz::teal),
#'   x_variable = "year",
#'   y_variable = "value",
#'   x_group = "bender",
#'   y_label = "Number",
#'   y_max = 250,
#'   legend_enable = TRUE,
#'   legend_title = "Bender Type",
#'   tooltip =
#'     "Bender: {point.bender} <br>
#'  Value: {point.value}"
#' )

create_grouped_bar <- function(
    data,
    type = "column",
    x_variable,
    y_variable,
    x_group,
    tick_amount = 6,
    color_bars = FALSE,
    y_label,
    y_max = 100,
    y_format = "{value:,.0f}",
    my_colors = naccho.viz::naccho_colors,
    title_text = "",
    subtitle_text = "",
    caption_text = "",
    caption_align = "center",
    legend_enable = FALSE,
    legend_title = "",
    legend_reverse = FALSE,
    tooltip,
    select_theme = naccho.viz::minimal,
    allow_export = TRUE,
    accessible_desc = ""
) {

  hcoptslang <- getOption("highcharter.lang")
  hcoptslang$thousandsSep <- ","

  # replace G with B for billions
  hcoptslang$numericSymbols <- c( " k", " m", " b" ,"t", "P" ,"E")
  options(highcharter.lang = hcoptslang)

  hc <-
    highcharter::hchart(
      data,
      type = type,
      highcharter::hcaes(
        x = .data[[x_variable]],
        y = .data[[y_variable]],
        group = .data[[x_group]]
      )
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
      )
    ) %>%
    highcharter::hc_xAxis(
      title = list(text = "") # x-axis label
    ) %>%
    highcharter::hc_yAxis(
      title = list(text = y_label), # y-axis label
      max = y_max,
      tickAmount = tick_amount,
      min = 0,
      labels = list(
        format = y_format
      )
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
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
      reversed = legend_reverse,
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
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = naccho.viz::teal,
          symbolStroke = naccho.viz::teal,
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




#' NACCHO Tick Bar Chart
#'
#' @description
#' Create an accessible ticked bar chart (horizontal) using a NACCHO theme and the {highcharter} package.
#'
#' @param data the data frame to create the map.
#' @param type character string; must be "column" or "bar", where "column" displays vertically and "bar" displays horizontally.
#' @param x_variable object; from the data frame, ideally a character.
#' @param y_variable numeric; from the data frame.
#' @param x_group character object; from the data frame.
#' @param size numeric; controls width of figure, defaults to 400.
#' @param y_format character string; format for the y-axis numbers, defaults to "{value:,.0f}". This is used to adjust decimals or add characters after the number. Examples follow. "{value}%" add a % sign and does not specify decimals. "{value:.1f}" specifies one decimal point. "{value:,.0f}" specifies one decimal and adds a comma every three values. "{value}%" adds a percent sign. You can also add words to the value by doing the following: "{value} words here".
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::naccho_colors.
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param caption_align character string; options include "left", "center", or "right" where the default is "center".
#' @param select_theme select a theme, defaults to naccho.viz::tick.
#' @param enable_labels boolean, TRUE or FALSE, where FALSE removes labels.
#' @param reverse boolean, TRUE or FALSE, where TRUE reverses the figure.
#' @param tooltip character string; text and values to appear in the tooltip, use {point.xx} to call a value from the data frame, where xx is a specific column.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A ticked chart from highcharter.
#' @export
#'
#' @examples
#' test_data <- base::data.frame(
#'   action = c("Expanded", "Reduced", "No Change", "Expanded", "Reduced", "No Change"),
#'   value = c(6.5, 1.1, 2.4, 3.5, 8.9, 7.6),
#'   display = c(1, 1, 1, 0, 0, 0)
#' )
#'
#' test_data <-
#' within(test_data, action <- factor(action, levels=c("Expanded", "Reduced", "No Change")))
#'
#' test_data <- test_data %>%
#'  dplyr::arrange(action)


#' create_tick_bar(
#'   data = test_data,
#'  x_variable = "action",
#'   y_variable = "value",
#'  x_group = "display",
#'  tooltip = "Value: {point.value} <br> "
#' )


create_tick_bar <- function(
    data,
    type = "bar",
    x_variable,
    y_variable,
    x_group,
    size = 400,
    y_format = "{value:,.0f}",
    my_colors = c(naccho.viz::naccho_offwhite, naccho.viz::teal),
    title_text = "",
    subtitle_text = "",
    caption_text = "",
    caption_align = "center",
    enable_labels = TRUE,
    select_theme = naccho.viz::tick,
    reverse = FALSE,
    tooltip,
    allow_export = TRUE,
    accessible_desc = ""
) {

  hc <-
    highcharter::hchart(
      data,
      type = type,
      highcharter::hcaes(
        x = .data[[x_variable]],
        y = .data[[y_variable]],
        group = .data[[x_group]]
      ),
      stacking = "normal"
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
      )
    ) %>%
    highcharter::hc_xAxis(
      title = list(text = ""), # x-axis label
      reversed = reverse,
      labels = list(
        enabled = enable_labels
      )
    ) %>%
    highcharter::hc_yAxis(
      title = list(text = ""), # y-axis label
      max = 10,
      tickAmount = 11,
      min = 0,
      labels = list(
        format = y_format,
        enabled = FALSE
      ),
      reversed = reverse
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
    ) %>%
    highcharter::hc_title(
      text = title_text, # title text
      margin = 40,
      widthAdjust = -60
    ) %>%
    highcharter::hc_size(
      width = size
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
      enabled = FALSE
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
      buttons = list(
        contextButton = list(
          symbol = "menu",
          symbolStrokeWidth = 2,
          symbolFill = naccho.viz::teal,
          symbolStroke = naccho.viz::teal,
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

