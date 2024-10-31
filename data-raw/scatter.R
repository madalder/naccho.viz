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
      fontSize = "3vmin"
    )
  ),
  subtitle = list(
    style = list(
      color = naccho.viz::grey,
      fontFamily = "Heebo",
      fontWeight = "400",
      fontSize = "2.5vmin"
    )
  ),
  caption = list(
    style = list(
      color = naccho.viz::grey,
      fontFamily = "Heebo",
      fontSize = "2.2vmin"
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
        fontSize = "2vmin",
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
        fontSize = "2.2vmin"
      )
    ),
    plotLines = list(
      color = naccho.viz::grey,
      width = 0.5,
      dashStyle = "dash",
      label = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "2vmin",
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
        fontSize = "2vmin",
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
        fontSize = "2.2vmin"
      )
    ),
    plotLines = list(
      color = naccho.viz::grey,
      width = 0.5,
      dashStyle = "dash",
      label = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "2vmin",
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
      fontSize = "2vmin",
      fontWeight = "normal"
    ),
    title = list(
      style = list(
        textDecoration = "none",
        fontFamily = "Heebo",
        fontSize = "2.2vmin"
      )
    )
  ),
  tooltip = list(
    padding = 10,
    borderRadius = 20,
    backgroundColor = "#fff",
    style = list(
      fontFamily = "Heebo",
      fontSize = "2vmin",
      fontWeight = "600",
      lineHeight = "1.5vmin"
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
        fontSize = "2vmin"
      )
    )
  )
)



usethis::use_data(scatter, overwrite = TRUE)

