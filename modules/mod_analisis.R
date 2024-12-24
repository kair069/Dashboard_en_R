mod_analisis_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "analisis",
    h2("Análisis de Datos"),
    
    # Primera fila
    fluidRow(
      box(plotOutput(ns("plot1")), width = 6),  # Columna 1
      box(plotOutput(ns("plot2")), width = 6)   # Columna 2
    ),
    
    # Segunda fila (agregar más contenido si es necesario)
    fluidRow(
      box(plotOutput(ns("plot3")), width = 6),  # Columna 1 en la segunda fila
      box(plotOutput(ns("plot4")), width = 6)   # Columna 2 en la segunda fila
    )
  )
}


mod_analisis_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$plot1 <- renderPlot({
      hist(airquality$Ozone, main = "Histograma de Ozone", col = "skyblue", xlab = "Ozone")
    })
    
    output$plot2 <- renderPlot({
      plot(airquality$Wind, airquality$Temp, 
           main = "Dispersión Wind vs Temp", 
           col = "orange", xlab = "Wind", ylab = "Temp")
    })
  })
}
