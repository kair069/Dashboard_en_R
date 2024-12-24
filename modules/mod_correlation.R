mod_correlation_ui <- function(id) {
  ns <- NS(id)  # Crear un namespace único para evitar colisiones de ID
  tagList(
    h3("Matriz de Correlación"),
    plotOutput(ns("correlation_plot"))  # El gráfico de correlación debe tener un ID único
  )
}




mod_correlation_server <- function(input, output, session) {
  output$correlation_plot <- renderPlot({
    # Ejemplo: Usamos el dataset mtcars para la matriz de correlación
    data <- mtcars  # Asegúrate de reemplazarlo por tus propios datos
    corr_matrix <- cor(data)  # Calcula la matriz de correlación
    
    # Usa corrplot para visualizar la matriz de correlación
    if (requireNamespace("corrplot", quietly = TRUE)) {
      corrplot::corrplot(corr_matrix, method = "circle")  # Cambia el método si lo prefieres
    } else {
      # Si no tienes el paquete corrplot, puedes hacer otro tipo de gráfico
      heatmap(corr_matrix)  # Usar heatmap si corrplot no está disponible
    }
  })
}


