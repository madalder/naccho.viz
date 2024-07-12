## code to prepare `basic_theme` dataset goes here

basic_theme <-
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
      lineColor = "#E0E0E0",
      gridLineWidth = 1,
      gridLineColor = "#E0E0E0", # color of the grid lines
      lineWidth = 1,
      labels = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "17px",
          fontWeight = "bold",
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
      gridLineColor = "#E0E0E0", # color of the grid lines
      lineWidth = 0, # horizontal line parallel on y-axis
      minorTicks = FALSE, # allows minor ticks if set to true
      tickWidth = 1,
      tickLength = 8,
      tickColor = naccho.viz::naccho_grey,
      tickmarkPlacement = "between",
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
    ),
    plotOptions = list(
      series = list(
        pointPadding = 0,
        groupPadding = 0.2,
        borderWidth = 0
      )
    )
  )

use_data(basic_theme, overwrite = TRUE, internal = TRUE)

save(basic_theme, file = "data/basic_theme.rda")

