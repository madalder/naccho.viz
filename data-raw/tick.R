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
        fontSize = "3vmin")
    ),
    subtitle = list(
      style = list(
        color = naccho.viz::navy,
        fontFamily = "Heebo",
        fontWeight = "600",
        fontSize = "2.5vmin")
    ),
    caption = list(
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontSize = "1.8vmin")
    ),
    xAxis = list(
      lineColor = naccho.viz::grey,
      labels = list(
        style = list(
          padding = "0.5em",
          fontFamily = "Heebo",
          fontSize = "2vmin",
          fontWeight = "bold",
          textOverflow = 'none',
          color = naccho.viz::grey)
      ),
      title = list(
        style = list(
          color = naccho.viz::navy,
          fontFamily = "Heebo",
          fontWeight = "400",
          fontSize = "2vmin")
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
          fontSize = "2vmin")
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = naccho.viz::navy,
        fontSize = "2vmin",
        fontWeight = "normal",
        color = "#666"),
      title = list(
        style = list(
          textDecoration = "none",
          fontFamily = "Heebo",
          fontSize = "2vmin")
      )
    ),
    tooltip = list(
      padding = 10,
      borderRadius = 20,
      backgroundColor = "#fff",
      style = list(
        fontFamily = "Heebo",
        fontSize = "1em",
        lineHeight = "1.1em")
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
