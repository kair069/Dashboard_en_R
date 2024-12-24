mod_nuevo_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    # Función para generar un gráfico de dispersión 3D
    generate_scatter3d <- function(value) {
      plot_ly(
        x = ~rnorm(100, mean = value),
        y = ~rnorm(100, mean = value),
        z = ~rnorm(100, mean = value),
        type = 'scatter3d',
        mode = 'markers',
        marker = list(size = 5)
      )
    }
    
    # Función para generar un gráfico de superficie 3D
    generate_surface3d <- function(value) {
      x <- seq(-5, 5, length.out = 30)
      y <- seq(-5, 5, length.out = 30)
      z <- outer(x, y, function(x, y) sin(sqrt(x^2 + y^2)))
      
      plot_ly(
        x = x, y = y, z = z, 
        type = 'surface'
      )
    }
    
    # Función para generar un gráfico de barras 3D usando "bar3d" simulada
    generate_bar3d <- function(value) {
      x <- c(1, 2, 3, 4)
      y <- c(10, 11, 12, 13)
      z <- c(20, 21, 22, 23)
      
      plot_ly(
        x = x, y = y, z = z, 
        type = 'bar', 
        marker = list(color = 'rgb(158,202,225)', line = list(color = 'rgb(8,48,107)', width = 1.5))
      )
    }
    
    # Función para generar un gráfico de histograma 3D usando "histogram2d"
    generate_histogram3d <- function(value) {
      data <- rnorm(500, mean = value)
      
      plot_ly(
        x = data, y = data, 
        type = "histogram2d",
        nbinsx = 30, nbinsy = 30,
        colorscale = 'Viridis'
      ) 
    }
    
    # Renderizar los gráficos
    output$plot3d_1 <- renderPlotly({
      generate_scatter3d(input$slider_val)
    })
    
    output$plot3d_2 <- renderPlotly({
      generate_surface3d(input$slider_val)
    })
    
    output$plot3d_3 <- renderPlotly({
      generate_bar3d(input$slider_val)
    })
    
    output$plot3d_4 <- renderPlotly({
      generate_histogram3d(input$slider_val)
    })
    
    # Mostrar el valor del slider cuando se ajuste
    output$slider_output <- renderText({
      paste("Selected value is:", input$slider_val)
    })
    
    # Acción del botón (puedes agregar la lógica que desees)
    observeEvent(input$action_btn, {
      showModal(modalDialog(
        title = "Action Button Pressed",
        paste("You selected value:", input$slider_val)
      ))
    })
    
    # Tabla de datos (si la necesitas)
    output$table <- DT::renderDataTable({
      datatable(iris)
    })
  })
}
