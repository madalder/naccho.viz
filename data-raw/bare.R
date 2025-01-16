## code to prepare `bare` dataset goes here

bare <-
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
        fontSize = "calc(12px + .2em + .75vmin)")
    ),
    subtitle = list(
      style = list(
        color = naccho.viz::navy,
        fontFamily = "Heebo",
        fontWeight = "600",
        fontSize = "calc(10px + .167em + .625vmin)")
    ),
    caption = list(
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontSize = "calc(7.2px + .12em + .45vmin)")
    ),
    xAxis = list(
      lineColor = "#fff",
      lineWidth = 0,
      labels = list(
        style = list(
          padding = "0.5em",
          fontFamily = "Heebo",
          fontSize = "calc(8px + .133em + .5vmin)",
          fontWeight = "bold",
          textOverflow = 'none',
          color = naccho.viz::grey)
      ),
      title = list(
        style = list(
          color = naccho.viz::navy,
          fontFamily = "Heebo",
          fontWeight = "400",
          fontSize = "calc(8px + .133em + .5vmin)")
      )
    ),
    yAxis = list(
      gridLineWidth = 0,
      gridLineColor = "#fff", # color of the grid lines
      minorTicks = FALSE, # allows minor ticks if set to true
      lineWidth = 0,
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
          fontSize = "calc(8px + .133em + .5vmin)")
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = naccho.viz::navy,
        fontSize = "calc(8px + .133em + .5vmin)",
        fontWeight = "normal",
        color = "#666"),
      title = list(
        style = list(
          textDecoration = "none",
          fontFamily = "Heebo",
          fontSize = "calc(8px + .133em + .5vmin)")
      )
    ),
    tooltip = list(
      padding = 10,
      borderRadius = 20,
      backgroundColor = "#fff",
      style = list(
        fontFamily = "Heebo",
        fontSize = "calc(10px + .1vw + .2em)",
        lineHeight = "calc((10px + .1vw + .2em) * 1.3)")
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

usethis::use_data(bare, overwrite = TRUE)
