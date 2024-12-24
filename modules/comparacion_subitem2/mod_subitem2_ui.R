mod_subitem2_ui <- function(id) {
  ns <- NS(id)
  box(title = "Subitem 2 - Gráfico de Líneas", width = 12,
      plotOutput(ns("line_plot"))
  )
}
