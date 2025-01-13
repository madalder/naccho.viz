## code to prepare `butterfly` dataset goes here

butterfly <-
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
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontWeight = "400",
        fontSize = "1.8em")
    ),
    caption = list(
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontSize = "1.8vmin")
    ),
    xAxis = list(
      lineColor = naccho.viz::grey,
      gridLineWidth = 0,
      lineWidth = 0,
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
          color = naccho.viz::grey,
          fontFamily = "Heebo",
          fontWeight = "400",
          fontSize = "2vmin")
      )
    ),
    yAxis = list(
      gridLineWidth = 0,
      gridLineColor = "#E0E0E0", # color of the grid lines
      lineWidth = .5, # horizontal line parallel on y-axis
      lineColor = naccho.viz::grey,
      minorTicks = FALSE, # allows minor ticks if set to true
      tickWidth = .8,
      tickLength = 2,
      tickColor = "#E0E0E0",
      tickmarkPlacement = "between",
      labels = list(
        style = list(
          padding = "0.5em",
          fontFamily = "Heebo",
          fontSize = "2vmin",
          fontWeight = "normal",
          color = naccho.viz::grey)
      ),
      title = list(
        align = "low",
        rotation = 0,
        offset = 0,
        x = -10,
        y = 35,
        style = list(
          color = naccho.viz::grey,
          fontFamily = "Heebo",
          fontWeight = "700",
          fontSize = "2vmin")
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = naccho.viz::grey,
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
      borderRadius = 0,
      borderWidth = 0,
      backgroundColor = "#fff",
      style = list(
        fontFamily = "Heebo",
        fontWeight = "600",
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

usethis::use_data(butterfly, overwrite = TRUE)
