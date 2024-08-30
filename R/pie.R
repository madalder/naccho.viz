#' NACHCO Pie Chart
#'
#' @param data the data frame to create the map.
#' @param variable object; from the data frame, ideally a character or factor.
#' @param value numeric; from the data frame.
#' @param my_colors vector or character string; one character or a vector of characters, which must be defined hex values. Defaults to naccho.viz::naccho_colors.
#' @param data_format character string; format for the y-axis numbers, defaults to "{value:,.0f}". This is used to adjust decimals or add characters after the number. Examples follow. "{value}%" add a % sign and does not specify decimals. "{value:.1f}" specifies one decimal point. "{value:,.0f}" specifies one decimal and adds a comma every three values. "{value}%" adds a percent sign. You can also add words to the value by doing the following: "{value} words here".
#' @param title_text character string; title of the visualization. Defaults to nothing.
#' @param subtitle_text character string; subtitle to appear underneath the title. Defaults to nothing.
#' @param caption_text character string; source and data notes to appear underneath the figure. Defaults to nothing.
#' @param label_size character such as "13px", defaults to 13px.
#' @param legend_enable boolean, TRUE or FALSE, where TRUE enables the legend. Defaults to FALSE.
#' @param allow_export boolean, TRUE or FALSE, where true allows the visualization to be exported.
#' @param accessible_desc character string; alternative text description of the figure for screen readers.
#'
#' @return A pie chart.
#' @export
#'
#' @examples
#'
#' test_data <- data.frame(
#'  avatar = c("Aang", "Korra", "Kyoshi"),
#'  n = c(33, 23, 44)
#' )

#' create_pie(
#'  data = test_data,
#'  variable = "avatar",
#'  value = "n"
#' )
#'
#'
create_pie <- function(data,
                       variable,
                       value,
                       my_colors = naccho.viz::naccho_colors,
                       data_format = "{value:.0f}%",
                       title_text = "",
                       subtitle_text = NULL,
                       caption_text = NULL,
                       label_size = "15px",
                       legend_enable = FALSE,
                       allow_export = TRUE,
                       accessible_desc = "") {

  data <- data %>%
    dplyr::mutate(perc = !!rlang::sym(value)) %>%
    dplyr::mutate(cat = !!rlang::sym(variable))

  hc <- highcharter::highchart() %>%
    highcharter::hc_add_series(
      type = "pie",
      data = data,
      highcharter::hcaes(
        .data[[variable]],
        .data[[value]]
      ),
      borderColor = "#020202",
      borderWidth = .15,
    ) %>%
    highcharter::hc_add_dependency(
      name = "modules/accessibility.js"
    ) %>%
    highcharter::hc_plotOptions(
      pie =
        list(
          innerSize = "70%", # Set the inner size for the donut effect
          allowPointSelect = TRUE, # Enable point selection on the chart
          cursor = "pointer", # Set cursor style for selectable points
          dataLabels = list(
            enabled = TRUE,
            format = "{point.perc}%",
            overflow = TRUE,
            distance = 5,
            padding = 2,
            style = list(
              color = naccho.viz::naccho_grey,
              fontFamily = "Heebo",
              fontWeight = "500",
              fontSize = label_size)
          ), # Disable data labels on the slices
          showInLegend = legend_enable # Show legend for the chart
        ),
        accessibility = list(
          enabled = TRUE,
          description = accessible_desc,
          keyboardNavigation = list(
            enabled = TRUE
          )
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
      margin = 20,
      align = "center"
    ) %>%
    highcharter::hc_colors(
      colors = my_colors
    ) %>%
    # tooltip information
    highcharter::hc_tooltip(
      useHTML = TRUE,
      headerFormat = "",
      pointFormat = "<div style='text-align: center;'>
                    {point.cat}<br>
                    <b>{point.perc}%</b></div>",
      # positioner = JS(
      #   "function () {
      #         xp =  this.chart.chartWidth/2 - this.label.width/2
      #         yp =  this.chart.chartHeight/2 - this.label.height/2
      #   return { x: xp, y: yp };
      # }"
      # ),
      shadow = FALSE
    ) %>%
    # adding the theme
    highcharter::hc_add_theme(
      naccho.viz::minimal
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
