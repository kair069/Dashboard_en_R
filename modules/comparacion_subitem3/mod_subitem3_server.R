mod_subitem3_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$pie_plot <- renderPlot({
      pie(c(10, 20, 30, 40), labels = c("A", "B", "C", "D"), col = c("red", "blue", "green", "yellow"), 
          main = "Gráfico de Pastel")
    })
  })
}
