mod_subitem2_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$line_plot <- renderPlot({
      plot(c(1, 2, 3, 4), c(10, 20, 30, 40), type = "o", col = "green", 
           main = "Gráfico de Líneas")
    })
  })
}
