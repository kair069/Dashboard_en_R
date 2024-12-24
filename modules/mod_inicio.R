library(shiny)
library(shinydashboard)
library(plotly)

mod_inicio_ui <- function(id) {
  ns <- NS(id)
  tabItem(tabName = "inicio",
          h2("Bienvenido al Dashboard"),
          box(title = "Información", status = "primary", solidHeader = TRUE, width = 12,
              "Este es un dashboard básico creado con Shiny y shinydashboard."
          ),
          
          # Primera fila con 4 KPIs
          fluidRow(
            column(3,  # Cada KPI ocupa 3 de los 12 espacios (4 KPIs)
                   infoBox(
                     title = "KPI 1",  # Título agregado
                     value = "150", 
                     subtitle = "Descripción del KPI 1", 
                     icon = icon("chart-line"),
                     color = "aqua",
                     width = NULL
                   )
            ),
            column(3,
                   infoBox(
                     title = "KPI 2",  # Título agregado
                     value = "85%", 
                     subtitle = "Descripción del KPI 2", 
                     icon = icon("check-circle"),
                     color = "green",
                     width = NULL
                   )
            ),
            column(3,
                   infoBox(
                     title = "KPI 3",  # Título agregado
                     value = "32", 
                     subtitle = "Descripción del KPI 3", 
                     icon = icon("bullseye"),
                     color = "orange",
                     width = NULL
                   )
            ),
            column(3,
                   infoBox(
                     title = "KPI 4",  # Título agregado
                     value = "1200", 
                     subtitle = "Descripción del KPI 4", 
                     icon = icon("clock"),
                     color = "red",
                     width = NULL
                   )
            )
          ),
          
          # Segunda fila con un box para detalles adicionales
          fluidRow(
            column(12,
                   box(title = "Detalles adicionales",status="primary", width = NULL, solidHeader = TRUE,
                       p("Aquí puedes agregar más información o detalles adicionales sobre los KPIs y la estructura de la data.")
                   )
            )
          ),
          
          # Tercera fila con gráfico interactivo y slider
          fluidRow(
            column(12,
                   box(title = "Gráfico Interactivo con Slider", width = NULL, solidHeader = TRUE, status = "info",
                       sliderInput(ns("slider"), 
                                   "Selecciona el número de observaciones:", 
                                   min = 1, 
                                   max = nrow(cars),  # Usamos el número de filas de cars
                                   value = 30),
                       plotlyOutput(ns("interactive_plot"))
                   )
            )
          )
  )
}

mod_inicio_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # Datos para el gráfico interactivo (utilizamos cars)
    data <- cars
    
    # Renderizar el gráfico interactivo
    output$interactive_plot <- renderPlotly({
      # Seleccionamos las primeras 'n' observaciones según el slider
      plot_data <- data[1:input$slider, ]
      
      plot_ly(plot_data, x = ~speed, y = ~dist, type = 'scatter', mode = 'lines+markers') %>%
        layout(title = "Relación entre velocidad y distancia de frenado",
               xaxis = list(title = "Velocidad (mph)"),
               yaxis = list(title = "Distancia de frenado (ft)"))
    })
    
  })
}


