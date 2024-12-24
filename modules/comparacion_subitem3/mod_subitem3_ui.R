mod_subitem3_ui <- function(id) {
  ns <- NS(id)
  box(title = "Subitem 3 - Gráfico de Pastel", width = 12,
      plotOutput(ns("pie_plot"))
  )
}
