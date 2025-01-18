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
        fontWeight = "bold"
        # ,
        # fontSize = "calc(12px + .2em + .75vmin)"
        )
    ),
    subtitle = list(
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo",
        fontWeight = "400"
        # ,
        # fontSize = "calc(10px + .167em + .625vmin)"
        )
    ),
    caption = list(
      style = list(
        color = naccho.viz::grey,
        fontFamily = "Heebo"
        # ,
        # fontSize = "calc(7.2px + .12em + .45vmin)"
        )
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
          padding = "0.5em",
          fontFamily = "Heebo",
          # fontSize = "calc(8px + .133em + .5vmin)",
          fontWeight = "600",
          textOverflow = 'none',
          color = naccho.viz::grey)
      ),
      title = list(
        style = list(
          color = naccho.viz::grey,
          fontFamily = "Heebo",
          fontWeight = "400"
          # ,
          # fontSize = "calc(8px + .133em + .5vmin)"
          )
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
          padding = "0.5em",
          fontFamily = "Heebo",
          # fontSize = "calc(8px + .133em + .5vmin)",
          fontWeight = "normal",
          color = naccho.viz::grey)
      ),
      title = list(
        align = "high",
        rotation = 0,
        offset = 14,
        y = -20,
        style = list(
          color = naccho.viz::grey,
          fontFamily = "Heebo",
          fontWeight = "700"
          # ,
          # fontSize = "calc(8px + .133em + .5vmin)"
          )
      )
    ),
    legend = list(
      itemStyle = list(
        fontFamily = "Heebo",
        color = naccho.viz::grey,
        # fontSize = "calc(8px + .133em + .5vmin)",
        fontWeight = "normal",
        color = "#666"),
      title = list(
        style = list(
          textDecoration = "none",
          fontFamily = "Heebo"
          # ,
          # fontSize = "calc(8px + .133em + .5vmin)"
          )
      )
    ),
    tooltip = list(
      padding = 10,
      borderRadius = 20,
      backgroundColor = "#fff",
      style = list(
        fontFamily = "Heebo"
        # ,
        # fontSize = "calc(10px + .1vw + .2em)",
        # lineHeight = "calc((10px + .1vw + .2em) * 1.3)"
        )
    ),
    itemHoverStyle = list(
      color = naccho.viz::green
    )
  )

usethis::use_data(line, internal = TRUE, overwrite = TRUE)
usethis::use_data(line, overwrite = TRUE)
