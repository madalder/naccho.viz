## code to prepare `naccho_line_theme` dataset goes here
naccho_line_theme <-
  highcharter::hc_theme(
    colors = naccho.viz::naccho_colors,
    chart = list(
      backgroundColor = NULL),
    style = list(
      fontFamily = "Heebo"),
    title = list(
      style = list(
        color = naccho.viz::naccho_blue,
        fontFamily = "Heebo",
        fontWeight = "bold",
        fontSize = "20px")
    ),
    subtitle = list(
      style = list(
        color = naccho.viz::naccho_grey,
        fontFamily = "Heebo",
        fontWeight = "400",
        fontSize = "15px")
    ),
    caption = list(
      style = list(
        color = naccho.viz::naccho_grey,
        fontFamily = "Heebo",
        fontSize = "13px")
    ),
    xAxis = list(
      lineWidth = 0,
      lineColor = "#666",
      tickWidth = 1,
      tickLength = 5,
      tickColor = "#666",
      tickmarkPlacement = "on",
      labels = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "17px",
          fontWeight = "600",
          textOverflow = 'none',
          color = naccho.viz::naccho_grey)
      ),
      title = list(
        style = list(
          color = naccho.viz::naccho_grey,
          fontFamily = "Heebo",
          fontWeight = "400",
          fontSize = "15px")
      )
    ),
    yAxis = list(
      gridLineWidth = 0,
      gridLineColor = "#666", # color of the grid lines
      minorTicks = FALSE, # allows minor ticks if set to true
      lineWidth = 0,
      tickWidth = 1,
      tickLength = 5,
      tickColor = "#666",
      tickmarkPlacement = "on",
      labels = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "15px",
          fontWeight = "normal",
          color = naccho.viz::naccho_grey)
      ),
      title = list(
        align = "high",
        rotation = 0,
        offset = 14,
        y = 25,
        style = list(
          color = naccho.viz::naccho_grey,
          fontFamily = "Heebo",
          fontWeight = "700",
          fontSize = "14px")
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = naccho.viz::naccho_grey,
        fontSize = "17px",
        fontWeight = "normal",
        color = "#666"),
      title = list(
        style = list(
          textDecoration = "none",
          fontFamily = "Heebo",
          fontSize = "16px")
      )
    ),
    tooltip = list(
      padding = 10,
      borderRadius = 20,
      backgroundColor = "#fff",
      style = list(
        fontFamily = "Heebo",
        fontSize = "16px",
        fontWeight = "600",
        lineHeight = "20px")
    ),
    itemHoverStyle = list(
      color = naccho.viz::naccho_green
    )
  )

use_data(naccho_line_theme, overwrite = TRUE, internal = TRUE)

save(naccho_line_theme, file = "data/naccho_line_theme.rda")
