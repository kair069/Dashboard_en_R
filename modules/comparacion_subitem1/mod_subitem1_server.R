mod_subitem1_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$bar_plot <- renderPlot({
      barplot(c(10, 20, 30, 40), col = "blue", main = "Gráfico de Barras")
    })
  })
}
