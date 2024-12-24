# Definir la interfaz de usuario (UI) para el ítem "Modelos"
mod_modelos_ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    titlePanel("Modelos"),
    sidebarLayout(
      sidebarPanel(
        # Control de entrada para seleccionar el modelo
        selectInput(ns("modelo"), "Seleccionar Modelo:", 
                    choices = c("Regresión Lineal", "Regresión Polinómica", "Modelo Logístico"))
      ),
      mainPanel(
        # Aquí se mostrarán los resultados del modelo seleccionado
        verbatimTextOutput(ns("modelo_resumen")),
        plotOutput(ns("modelo_plot"))
      )
    )
  )
}


# Definir la lógica del servidor para el ítem "Modelos"
mod_modelos_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # Cargar la base de datos "mtcars"
    data("mtcars")
    
    # Modelos a generar
    modelo_lineal <- lm(mpg ~ wt + hp, data = mtcars)  # Modelo lineal simple
    modelo_polinomico <- lm(mpg ~ poly(wt, 2) + hp, data = mtcars)  # Modelo polinómico
    modelo_logistico <- glm(vs ~ wt + hp, data = mtcars, family = binomial)  # Modelo Logístico
    
    # Renderizar resumen del modelo seleccionado
    output$modelo_resumen <- renderPrint({
      modelo_seleccionado <- input$modelo
      if (modelo_seleccionado == "Regresión Lineal") {
        summary(modelo_lineal)
      } else if (modelo_seleccionado == "Regresión Polinómica") {
        summary(modelo_polinomico)
      } else if (modelo_seleccionado == "Modelo Logístico") {
        summary(modelo_logistico)
      }
    })
    
    # Mostrar gráficos basados en el modelo seleccionado
    output$modelo_plot <- renderPlot({
      modelo_seleccionado <- input$modelo
      if (modelo_seleccionado == "Regresión Lineal") {
        plot(mtcars$wt, mtcars$mpg, main = "Regresión Lineal", 
             xlab = "Peso (wt)", ylab = "Millas por Galón (mpg)")
        abline(modelo_lineal, col = "blue")
      } else if (modelo_seleccionado == "Regresión Polinómica") {
        plot(mtcars$wt, mtcars$mpg, main = "Regresión Polinómica", 
             xlab = "Peso (wt)", ylab = "Millas por Galón (mpg)")
        lines(sort(mtcars$wt), predict(modelo_polinomico, newdata = data.frame(wt = sort(mtcars$wt))), col = "red")
      } else if (modelo_seleccionado == "Modelo Logístico") {
        plot(mtcars$wt, mtcars$vs, main = "Modelo Logístico", 
             xlab = "Peso (wt)", ylab = "Variable dependiente (vs)")
        curve(predict(modelo_logistico, newdata = data.frame(wt = x), type = "response"), 
              add = TRUE, col = "green")
      }
    })
    
  })
}
