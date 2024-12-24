mod_datos_ui <- function(id) {
  ns <- NS(id)
  tabItem(tabName = "datos",
          h2("Tabla de Datos"),
          box(DT::dataTableOutput(ns("table1")), width = 12)
  )
}

mod_datos_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$table1 <- DT::renderDataTable({
      head(airquality, 30)
    })
  })
}
