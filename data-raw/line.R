## code to prepare `line` dataset goes here
line <-
  highcharter::hc_theme(
    colors = naccho.viz::colors,
    chart = list(
      backgroundColor = NULL),
    style = list(
      fontFamily = "Heebo"),
    title = list(
      style = list(
        color = naccho.viz::navy,
        fontFamily = "Heebo",
        fontWeight = "bold",
        fontSize = "20px")
    ),
    subtitle = list(
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontWeight = "400",
        fontSize = "15px")
    ),
    caption = list(
      style = list(
        color = naccho.viz::grey,
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
          color = naccho.viz::grey)
      ),
      title = list(
        style = list(
          color = naccho.viz::grey,
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
          color = naccho.viz::grey)
      ),
      title = list(
        align = "high",
        rotation = 0,
        offset = 14,
        -20,
        style = list(
          color = naccho.viz::grey,
          fontFamily = "Heebo",
          fontWeight = "700",
          fontSize = "14px")
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = naccho.viz::grey,
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
      color = naccho.viz::green
    )
  )

usethis::use_data(line, overwrite = TRUE)
