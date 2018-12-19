server <- function(input,output) {

# Define server logic required to draw a histogram
output$plot <- renderPlotly({
  # specify some map projection/options
  
  # filter overdoses_shiny based on Year
  data <- overdoses %>% 
    filter(Year == input$year)
  
  l <- list(color = toRGB("white"), width = 2)
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = FALSE,
    lakecolor = toRGB('white')
  )
  plot_geo(data, locationmode = 'USA-states') %>%
    add_trace(
      z = ~Opioid_Death_Rate, locations = ~Abbrev,zmin = 0, zmax = 43,
      colors = 'Greens'
    ) %>%
    colorbar(title = "    Deaths \nPer 100000") %>%
    layout(
      geo = g)
})
output$click <- renderPrint({
  d <- event_data("plotly_hover")
  if (is.null(d)) "Hover over a state" else d
})

}
