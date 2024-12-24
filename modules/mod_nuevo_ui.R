library(shiny)
library(miniUI)
library(plotly)
library(DT)

mod_nuevo_ui <- function(id) {
  ns <- NS(id)
  tagList(
    # Contenedor principal para los gráficos
    fluidRow(
      box(
        title = "Gráficos 3D", status = "primary", solidHeader = TRUE, width = 12,
        tabsetPanel(
          tabPanel("Gráfico de Dispersión 3D", 
                   plotlyOutput(ns("plot3d_1"))
          ),
          tabPanel("Gráfico de Superficie 3D", 
                   plotlyOutput(ns("plot3d_2"))
          ),
          tabPanel("Gráfico de Barras 3D", 
                   plotlyOutput(ns("plot3d_3"))
          ),
          tabPanel("Histograma 3D", 
                   plotlyOutput(ns("plot3d_4"))
          )
        )
      )
    ),
    # Slider para seleccionar valores y otras interacciones
    sliderInput(ns("slider_val"), "Selecciona un valor", min = 0, max = 10, value = 5),
    textOutput(ns("slider_output"))
  )
}
