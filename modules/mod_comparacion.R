mod_comparacion_ui <- function(id) {
  ns <- NS(id)
  tabItem(
    tabName = "comparacion",
    fluidRow(
      column(8,  # Cambié de 12 a 8
             box(title = "Boxplot de Ozone por Mes", width = NULL, solidHeader = TRUE, status = "primary",
                 plotOutput(ns("plot3"))
             )
      ),
      column(4,  # La segunda columna ocupa 4
             box(title = "Temperatura Promedio por Mes", width = NULL, solidHeader = TRUE, status = "warning",
                 plotOutput(ns("plot4"))
             )
      )
    ),
    fluidRow(
      column(12,  # Toda la fila ocupada por una columna
             box(title = "Estructura de la Data y Explicación", width = NULL, solidHeader = TRUE, status = "info",
                 height = "300px",  # Ajustar la altura aquí
                 p("A continuación se muestra una breve descripción de la estructura de los datos de la base 'airquality' utilizada en los gráficos anteriores."),
                 
                 p("La base de datos contiene información sobre calidad del aire, con variables como la concentración de ozono (Ozone) y la temperatura promedio (Temp)."),
                 
                 p("Estructura de los primeros registros de la base de datos:"),
                 verbatimTextOutput(ns("data_structure"))
             )
      )
    )
  )
}

mod_comparacion_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$plot3 <- renderPlot({
      boxplot(airquality$Ozone ~ airquality$Month, 
              main = "Boxplot de Ozone por Mes", col = "lightblue")
    })
    
    output$plot4 <- renderPlot({
      barplot(tapply(airquality$Temp, airquality$Month, mean),
              main = "Temperatura Promedio por Mes", col = "coral")
    })
    
    # Mostrar la estructura de la data
    output$data_structure <- renderPrint({
      head(airquality)  # Muestra los primeros registros de la data
    })
  })
}
