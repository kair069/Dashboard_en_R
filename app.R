library(shiny)
library(shinydashboard)
library(DT)

# Cargar módulos
source("modules/mod_inicio.R")
source("modules/mod_analisis.R")
source("modules/mod_datos.R")
source("modules/mod_comparacion.R")
source("modules/modelos/mod_modelos.R")

source("modules/comparacion_subitem1/mod_subitem1_ui.R")
source("modules/comparacion_subitem1/mod_subitem1_server.R")

source("modules/comparacion_subitem2/mod_subitem2_ui.R")
source("modules/comparacion_subitem2/mod_subitem2_server.R")

source("modules/comparacion_subitem3/mod_subitem3_ui.R")
source("modules/comparacion_subitem3/mod_subitem3_server.R")
source("modules/mod_nuevo_ui.R")
source("modules/mod_nuevo_server.R")




# Definir UI
ui <- dashboardPage(
  
  skin = "purple",
  dashboardHeader(title = "Estadisticas",
                  
                  dropdownMenu(type = "messages",
                               messageItem(
                                 from = "Sales Dept",
                                 message = "Sales are steady this month."
                               ),
                               messageItem(
                                 from = "New User",
                                 message = "How do I register?",
                                 icon = icon("question"),
                                 time = "13:45"
                               ),
                               messageItem(
                                 from = "Support",
                                 message = "The new server is ready.",
                                 icon = icon("life-ring"),
                                 time = "2014-12-01"
                               )
                  ),

                  dropdownMenu(type = "notifications",
                               notificationItem(
                                 text = "5 new users today",
                                 icon = icon("users")
                               ),
                               notificationItem(
                                 text = "12 items delivered",
                                 icon = icon("truck"),
                                 status = "success"
                               ),
                               notificationItem(
                                 text = "Server load at 86%",
                                 icon = icon("exclamation-triangle"),
                                 status = "warning"
                               )
                  )




                  ),

  dashboardSidebar(
    width = 230,


    sidebarMenu(
      menuItem("Inicio", tabName = "inicio", icon = icon("dashboard")),
      menuItem("Análisis", tabName = "analisis", icon = icon("chart-line")),
      menuItem("Datos", tabName = "datos", icon = icon("table")),
      menuItem("Comparación", tabName = "comparacion", icon = icon("columns")),
      # Agregar el nuevo ítem al sidebar
      menuItem("Nuevo Módulo", tabName = "nuevo", icon = icon("plus-square")),
      # Nuevo ítem principal "Modelos" sin subítems
      menuItem("Modelos", tabName = "modelos", icon = icon("cogs")),
      menuItem("Source code", icon = icon("file-code-o"),
               href = "https://github.com/rstudio/shinydashboard/"),

      # Ítem principal con subítems
      menuItem("Comparación", tabName = "comparacion", icon = icon("columns"),
               menuSubItem("Subitem 1", tabName = "subitem1", icon = icon("bar-chart")),
               menuSubItem("Subitem 2", tabName = "subitem2", icon = icon("line-chart")),
               menuSubItem("Subitem 3", tabName = "subitem3", icon = icon("pie-chart"))
      )
    )
  ),

  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
      tags$script(src = "script.js")
    ),
    tabItems(
      mod_inicio_ui("inicio"),
      mod_analisis_ui("analisis"),
      mod_datos_ui("datos"),
      mod_comparacion_ui("comparacion"),
      # Agregar el tabItem correspondiente al dashboardBody
      tabItem(tabName = "nuevo",
              mod_nuevo_ui("nuevo_ui")
      ),

      tabItem(tabName = "modelos",
              mod_modelos_ui("modelos_ui")
      ),

      tabItem(tabName = "subitem1",
              mod_subitem1_ui("subitem1_ui")
      ),
      tabItem(tabName = "subitem2",
              mod_subitem2_ui("subitem2_ui")
      ),
      tabItem(tabName = "subitem3",
              mod_subitem3_ui("subitem3_ui")
      )
    )
  )
)

# Definir servidor
server <- function(input, output, session) {
  mod_inicio_server("inicio")
  mod_analisis_server("analisis")
  mod_datos_server("datos")
  mod_modelos_server("modelos_ui")
  mod_nuevo_server("nuevo_ui")

  mod_comparacion_server("comparacion")
  mod_subitem1_server("subitem1_ui")
  mod_subitem2_server("subitem2_ui")
  mod_subitem3_server("subitem3_ui")
}

# Correr la aplicación
shinyApp(ui = ui, server = server)

# library(shiny)
# library(shinydashboard)
# library(DT)
# 
# # Cargar módulos
# source("modules/mod_inicio.R")
# source("modules/mod_analisis.R")
# source("modules/mod_datos.R")
# source("modules/mod_comparacion.R")
# source("modules/modelos/mod_modelos.R")
# 
# source("modules/comparacion_subitem1/mod_subitem1_ui.R")
# source("modules/comparacion_subitem1/mod_subitem1_server.R")
# 
# source("modules/comparacion_subitem2/mod_subitem2_ui.R")
# source("modules/comparacion_subitem2/mod_subitem2_server.R")
# 
# source("modules/comparacion_subitem3/mod_subitem3_ui.R")
# source("modules/comparacion_subitem3/mod_subitem3_server.R")
# source("modules/mod_nuevo_ui.R")
# source("modules/mod_nuevo_server.R")
# 
# # Definir UI con Navbar
# ui <- navbarPage(
#   title = "Mi Dashboard en Shiny",
#   
#   # Menú de navegación con pestañas
#   tabPanel("Inicio", mod_inicio_ui("inicio")),
#   tabPanel("Análisis", mod_analisis_ui("analisis")),
#   tabPanel("Datos", mod_datos_ui("datos")),
#   
#   # Nuevo Módulo
#   tabPanel("Nuevo Módulo", mod_nuevo_ui("nuevo_ui")),
#   
#   # Modelos
#   tabPanel("Modelos", mod_modelos_ui("modelos_ui")),
#   
#   # Comparación con submenús
#   navbarMenu("Comparación",
#              tabPanel("Subitem 1", mod_subitem1_ui("subitem1_ui")),
#              tabPanel("Subitem 2", mod_subitem2_ui("subitem2_ui")),
#              tabPanel("Subitem 3", mod_subitem3_ui("subitem3_ui"))
#   ),
#   
#   # Agregar un enlace de código fuente
#   tabPanel("Source code", 
#            tags$a(href = "https://github.com/rstudio/shinydashboard", 
#                   "Shiny Dashboard Source Code"))
# )
# 
# # Definir servidor
# server <- function(input, output, session) {
#   mod_inicio_server("inicio")
#   mod_analisis_server("analisis")
#   mod_datos_server("datos")
#   mod_modelos_server("modelos_ui")
#   mod_nuevo_server("nuevo_ui")
#   
#   mod_comparacion_server("comparacion")
#   mod_subitem1_server("subitem1_ui")
#   mod_subitem2_server("subitem2_ui")
#   mod_subitem3_server("subitem3_ui")
# }
# 
# # Correr la aplicación
# shinyApp(ui = ui, server = server)

