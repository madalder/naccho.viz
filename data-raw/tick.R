## code to prepare `tick` dataset goes here

tick <-
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
        color = naccho.viz::navy,
        fontFamily = "Heebo",
        fontWeight = "600",
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
      labels = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "22px",
          fontWeight = "bold",
          textOverflow = 'none',
          color = naccho.viz::grey)
      ),
      title = list(
        style = list(
          color = naccho.viz::navy,
          fontFamily = "Heebo",
          fontWeight = "400",
          fontSize = "15px")
      )
    ),
    yAxis = list(
      gridLineWidth = 12,
      gridLineColor = "#fff", # color of the grid lines
      gridZIndex = 4,
      lineWidth = 0, # horizontal line parallel on y-axis
      minorTicks = FALSE, # allows minor ticks if set to true
      tickWidth = 0,
      tickLength = 0,
      tickColor = naccho.viz::grey,
      tickmarkPlacement = "between",
      labels = list(
        enabled = FALSE
      ),
      title = list(
        align = "high",
        rotation = 0,
        offset = 14,
        y = -20,
        style = list(
          color = naccho.viz::navy,
          fontFamily = "Heebo",
          fontWeight = "500",
          fontSize = "15px")
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = naccho.viz::navy,
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
      color = naccho.viz::green
    ),
    plotOptions = list(
      bar = list(
        borderWidth = 0
      )
    )
  )



usethis::use_data(tick, overwrite = TRUE)
