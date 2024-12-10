## code to prepare `scatter` dataset goes here

scatter <- highcharter::hc_theme(
  colors = naccho.viz::colors,
  chart = list(
    backgroundColor = NULL
  ),
  title = list(
    style = list(
      color = naccho.viz::navy,
      fontFamily = "Heebo",
      fontWeight = "700",
      fontSize = "2em"
    )
  ),
  subtitle = list(
    style = list(
      color = naccho.viz::grey,
      fontFamily = "Heebo",
      fontWeight = "400",
      fontSize = "1.8em"
    )
  ),
  caption = list(
    style = list(
      color = naccho.viz::grey,
      fontFamily = "Heebo",
      fontSize = "1.2em"
    )
  ),
  xAxis = list(
    min = 0,
    lineColor = naccho.viz::light,
    gridLineWidth = 0.5,
    gridLineColor = "white",
    lineWidth = 0.5,
    tickWidth = 0.5,
    tickLength = 8,
    labels = list(
      style = list(
        fontFamily = "Heebo",
        fontSize = "1.4em",
        fontWeight = "300",
        textOverflow = "none",
        color = naccho.viz::grey
      )
    ),
    title = list(
      align = "right",
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontWeight = "600",
        fontSize = "1.5em"
      )
    ),
    plotLines = list(
      color = naccho.viz::grey,
      width = 0.5,
      dashStyle = "dash",
      label = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "1.4em",
          fontWeight = "300",
          textOverflow = "none",
          color = naccho.viz::grey
        )
      )
    )
  ),
  yAxis = list(
    min = 0,
    lineColor = naccho.viz::light,
    gridLineWidth = 0.5,
    gridLineColor = "white",
    lineWidth = 0.5,
    tickWidth = 0.5,
    tickLength = 8,
    tickColor = naccho.viz::light,
    labels = list(
      style = list(
        fontFamily = "Heebo",
        fontSize = "1.4em",
        fontWeight = "300",
        textOverflow = "none",
        color = naccho.viz::grey
      )
    ),
    title = list(
      align = "high",
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontWeight = "600",
        fontSize = "1.5em"
      )
    ),
    plotLines = list(
      color = naccho.viz::grey,
      width = 0.5,
      dashStyle = "dash",
      label = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "1.4em",
          fontWeight = "300",
          textOverflow = "none",
          color = naccho.viz::grey
        )
      )
    )
  ),
  legend = list(
    itemStyle = list(
      fontFamily = "Heebo",
      color = naccho.viz::grey,
      fontSize = "1.4em",
      fontWeight = "normal"
    ),
    title = list(
      style = list(
        textDecoration = "none",
        fontFamily = "Heebo",
        fontSize = "1.5em"
      )
    )
  ),
  tooltip = list(
    padding = 10,
    borderRadius = 20,
    backgroundColor = "#fff",
    style = list(
      fontFamily = "Heebo",
      fontSize = "1.4em",
      fontWeight = "600",
      lineHeight = "1.2em"
    )
  ),
  plotOptions = list(
    series = list(
      pointPadding = 0,
      groupPadding = 0.2,
      borderWidth = 0
    )
  ),
  series = list(
    type = "scatter",
    dataLabels = list(
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontSize = "1.2em"
      )
    )
  )
)


usethis::use_data(scatter, overwrite = TRUE)
