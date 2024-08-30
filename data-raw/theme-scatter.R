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
      fontSize = "20px"
    )
  ),
  subtitle = list(
    style = list(
      color = naccho.viz::grey,
      fontFamily = "Heebo",
      fontWeight = "400",
      fontSize = "15px"
    )
  ),
  caption = list(
    style = list(
      color = naccho.viz::grey,
      fontFamily = "Heebo",
      fontSize = "13px"
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
        fontSize = "12px",
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
        fontSize = "14px"
      )
    ),
    plotLines = list(
      color = naccho.viz::grey,
      width = 0.5,
      dashStyle = "dash",
      label = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "12px",
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
        fontSize = "12px",
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
        fontSize = "14px"
      )
    ),
    plotLines = list(
      color = naccho.viz::grey,
      width = 0.5,
      dashStyle = "dash",
      label = list(
        style = list(
          fontFamily = "Heebo",
          fontSize = "12px",
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
      fontSize = "15px",
      fontWeight = "normal"
    ),
    title = list(
      style = list(
        textDecoration = "none",
        fontFamily = "Heebo",
        fontSize = "16px"
      )
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
      lineHeight = "20px"
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
        fontSize = "16px"
      )
    )
  )
)



usethis::use_data(scatter, overwrite = TRUE)

