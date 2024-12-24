mod_subitem1_ui <- function(id) {
  ns <- NS(id)
  box(title = "Subitem 1 - Gráfico de Barras", width = 12,
      plotOutput(ns("bar_plot"))
  )
}
