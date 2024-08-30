## code to prepare `minimal` dataset goes here

minimal <-
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
      lineColor = naccho.viz::grey,
      lineWidth = 0,
      labels = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "20px",
          fontWeight = "bold",
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
      lineWidth = 0, # horizontal line parallel on y-axis
      minorTicks = FALSE, # allows minor ticks if set to true
      lineWidth = 0,
      tickWidth = 1,
      tickLength = 8,
      tickColor = naccho.viz::grey,
      tickmarkPlacement = "between",
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
        y = 25,
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
        fontWeight = "400",
        lineHeight = "18px")
    ),
    itemHoverStyle = list(
      color = naccho.viz::green
    ),
    plotOptions = list(
      series = list(
        pointPadding = 0,
        groupPadding = 0.2,
        borderWidth = 0
      )
    )
  )

usethis::use_data(minimal, overwrite = TRUE)
