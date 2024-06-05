naccho_minimal <-
  highcharter::hc_theme(
    colors = main_colors,
    chart = list(
      backgroundColor = NULL),
    style = list(
      fontFamily = "Heebo"),
    title = list(
      style = list(
        color = blue,
        fontFamily = "Heebo",
        fontWeight = "bold",
        fontSize = "20px")
    ),
    subtitle = list(
      style = list(
        color = blue,
        fontFamily = "Heebo",
        fontSize = "14px")
    ),
    caption = list(
      style = list(
        color = grey,
        fontFamily = "Heebo",
        fontSize = "13px")
    ),
    xAxis = list(
      lineColor = grey,
      labels = list(
        x = -50,
        style = list(
          fontFamily = "Heebo",
          fontSize = "22px",
          fontWeight = "bold",
          textOverflow = 'none',
          color = grey)
      ),
      title = list(
        style = list(
          color = blue,
          fontFamily = "Heebo",
          fontWeight = "400",
          fontSize = "15px")
      )
    ),
    yAxis = list(
      gridLineWidth = 0,
      gridLineColor = "#666", # color of the grid lines
      lineWidth = 0, # horizontal line parallel on y-axis
      minorTicks = FALSE, # allows minor ticks if set to true
      lineWidth = 1,
      tickWidth = 1,
      tickLength = 8,
      tickColor = grey,
      tickmarkPlacement = "between",
      labels = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "20px",
          fontWeight = "normal",
          color = grey)
      ),
      title = list(
        align = "high",
        rotation = 0,
        offset = 14,
        y = 25,
        style = list(
          color = blue,
          fontFamily = "Heebo",
          fontWeight = "500",
          fontSize = "15px")
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = blue,
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
        lineHeight = "20px")
    ),
    itemHoverStyle = list(
      color = green)
  )
