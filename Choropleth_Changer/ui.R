shinyUI(fluidPage(theme = shinytheme("united"),
  dashboardPage( skin = 'green',
    dashboardHeader(title = 'Opioid Overdoses', titleWidth = 200),
    dashboardSidebar(tags$blockquote('"New numbers Thursday from the Centers for Disease Control and Prevention show that drug overdoses killed more than 70,000 Americans in 2017, a record. Overdose deaths are higher than deaths from H.I.V., car crashes or gun violence at their peaks. The data also show that the increased deaths correspond strongly with the use of synthetic opioids known as fentanyls.

                                     Since 2013, the number of overdose deaths associated with fentanyls and similar drugs has grown to more than 28,000, from 3,000. Deaths involving fentanyls increased more than 45 percent in 2017 alone." Source: New York Times')),
    dashboardBody(
       fluidRow(
         tags$head( 
           tags$style(HTML(".main-fluidrow { font-size: 20px; }")) 
         ),
         box(
          title = "Year", skin = 'black', status = "primary", solidHeader = TRUE,
          "Select a year to see the opioid death rate by state", width = 3,
          sliderInput( "year", label = "Year", sep = '', ticks = FALSE,
                  min = 2006, max= 2016,
                  value = 2006, step= 1)),
         
        fluidRow(
          box(
            title = "Opioids Death Rate Map by Year",status = "primary", solidHeader = TRUE,
            plotlyOutput("plot", height = 800, width = 1000), width = 9)))))))



