
#' NACCHO Single Line Graph
#'
#' @param data the data frame to create the map.
#' @param x_variable object; from the data frame, ideally a character.
#' @param y_variable numeric; from the data frame.
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::colors.
#' @param x_label character string; label for the x-axis.
#' @param y_label character string; label for the y-axis.
#' @param y_max numeric; the maximun value of the y-axis, defaults to 100.
#' @param y_format character string; format for the y-axis numbers, defaults to "{value:,.0f}". This is used to adjust decimals or add characters after the number. Examples follow. "{value}%" add a % sign and does not specify decimals. "{value:.1f}" specifies one decimal point. "{value:,.0f}" specifies one decimal and adds a comma every three values. "{value}%" adds a percent sign. You can also add words to the value by doing the following: "{value} words here".
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param tooltip character string; text and values to appear in the tooltip, use {point.xx} to call a value from the data frame, where xx is a specific column.
#' @param select_theme hc_theme, must be a defined hc_theme.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A line graph from highcharter.
#' @export
#'
#' @examples
#' test_data <- data.frame(
#'   year = c(2019, 2022),
#'   value = c(150, 200)
#' )
#'
#' # if the x-axis value is a numeric year, all the in-between years will
#' # display on the x-axis unless the value is transformed to a factor. To
#' # transform to a factor, use the example below:
#'
#' test_data$year <- factor(test_data$year)
#'
#'
#' create_single_line(
#'   data = test_data,
#'   x_variable = "year",
#'   y_variable = "value",
#'   x_label = "Year",
#'   y_label = "Number",
#'   y_max = 250,
#'   tooltip = "{point.value}"
#' )
#'
#'
create_single_line <- function(data,
                               x_variable,
                               y_variable,
                               my_colors = naccho.viz::colors,
                               x_label,
                               y_label,
                               y_max = NULL,
                               y_format = "{value:,.0f}",
                               title_text = "",
                               subtitle_text = "",
                               caption_text = "",
                               tooltip,
                               select_theme = naccho.viz::line,
                               allow_export = TRUE,
                               accessible_desc = "") {

  hc <- highcharter::highchart() %>%
    highcharter::hc_add_series(
      type = "line",
      data = data,
      highcharter::hcaes(
        x = .data[[x_variable]],
        y = .data[[y_variable]],
        name = .data[[x_variable]]
      )
    ) %>%
    highcharter::hc_add_dependency(
      name = "modules/accessibility.js"
    ) %>%
    highcharter::hc_plotOptions(
      series = list(
        marker = list(
          enabled = TRUE # gives a marker on each line data point
        )
      ),
      line = list(
        lineWidth = 4 # Set the desired line thickness
      ),
      accessibility = list(
        enabled = TRUE,
        description = accessible_desc,
        keyboardNavigation = list(
          enabled = TRUE
        )
      )
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
    ) %>%
    highcharter::hc_xAxis(
      title = list(text = x_label), # x-axis label
      categories = unique(as.list(data[[x_variable]]))
    ) %>%
    highcharter::hc_yAxis(
      title = list(text = y_label), # y-axis label
      max = y_max,
      min = 0,
      labels = list(
        format = y_format
      )
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
      margin = 20
    ) %>%
    highcharter::hc_legend(
      enabled = FALSE # enabled legend
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
          menuItems = c(
            # "printChart",
            # "separator",
            "downloadPNG",
            "downloadJPEG",
            "downloadPDF",
            "downloadSVG",
            # "separator",
            "downloadCSV",
            "downloadXLS",
            "openInCloud")
        )
      )
    )

  return(hc)
}




#' NACCHO Grouped Line Graph
#'
#' @param data the data frame to create the map.
#' @param x_variable object; from the data frame, ideally a character.
#' @param y_variable numeric; from the data frame.
#' @param x_group character object; from the data frame.
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::colors.
#' @param x_label character string; label for the x-axis.
#' @param y_label character string; label for the y-axis.
#' @param y_max numeric; the maximun value of the y-axis, defaults to 100.
#' @param y_format character string; format for the y-axis numbers, defaults to "{value:,.0f}". This is used to adjust decimals or add characters after the number. Examples follow. "{value}%" add a % sign and does not specify decimals. "{value:.1f}" specifies one decimal point. "{value:,.0f}" specifies one decimal and adds a comma every three values. "{value}%" adds a percent sign. You can also add words to the value by doing the following: "{value} words here".
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param tooltip character string; text and values to appear in the tooltip, use {point.xx} to call a value from the data frame, where xx is a specific column.
#' @param legend_enable boolean, TRUE or FALSE, where TRUE enables the legend. Defaults to FALSE.
#' @param legend_title character string; title of the legend, defaults to nothing unless defined.
#' @param select_theme hc_theme, must be a defined hc_theme.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A line graph from highcharter.
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


#' create_grouped_line(
#'   data = test_data,
#'   x_variable = "year",
#'   y_variable = "value",
#'   x_group = "bender",
#'   y_label = "Number",
#'   x_label = "Year",
#'   y_max = 250,
#'   legend_enable = TRUE,
#'   legend_title = "Bender Type",
#'   tooltip =
#'     "Bender: {point.bender} <br>
#'  Value: {point.value}"
#' )
#'
create_grouped_line <- function(data,
                               x_variable,
                               y_variable,
                               x_group,
                               my_colors = naccho.viz::colors,
                               x_label,
                               y_label,
                               y_max = NULL,
                               y_format = "{value:,.0f}",
                               title_text = "",
                               subtitle_text = "",
                               caption_text = "",
                               tooltip,
                               legend_enable = TRUE,
                               legend_title = "Category",
                               select_theme = naccho.viz::line,
                               allow_export = TRUE,
                               accessible_desc = "") {

  hc <- highcharter::highchart() %>%
    highcharter::hc_add_series(
      type = "line",
      data = data,
      highcharter::hcaes(
        x = .data[[x_variable]],
        y = .data[[y_variable]],
        name = .data[[x_variable]],
        group = .data[[x_group]]
      )
    ) %>%
    highcharter::hc_add_dependency(
      name = "modules/accessibility.js"
    ) %>%
    highcharter::hc_plotOptions(
      series = list(
        marker = list(
          enabled = TRUE # gives a marker on each line data point
        )
      ),
      line = list(
        lineWidth = 4 # Set the desired line thickness
      ),
      accessibility = list(
        enabled = TRUE,
        description = accessible_desc,
        keyboardNavigation = list(
          enabled = TRUE
        )
      )
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
    ) %>%
    highcharter::hc_xAxis(
      title = list(text = x_label), # x-axis label
      categories = unique((data[[x_variable]]))
    ) %>%
    highcharter::hc_yAxis(
      title = list(text = y_label), # y-axis label
      maxPadding = .09,
      endOnTick = FALSE,
      max = y_max,
      min = 0,
      labels = list(
        format = y_format
      )
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
      margin = 20
    ) %>%
    highcharter::hc_tooltip(
      pointFormat = tooltip,
      useHTML = TRUE
    ) %>%
    highcharter::hc_add_theme(
      select_theme
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
          menuItems = c(
            # "printChart",
            # "separator",
            "downloadPNG",
            "downloadJPEG",
            "downloadPDF",
            "downloadSVG",
            # "separator",
            "downloadCSV",
            "downloadXLS",
            "openInCloud")
        )
      )
    )

  return(hc)
} # closes highcharter function for line graphs

