library(shiny)
shinyServer(function(input, output) {
        d <- reactive({
                dist <- switch(input$dataset,
                               norm = rnorm,
                               unif = runif,
                               lnorm = rlnorm,
                               exp = rexp,
                               rnorm)
                dist(input$n)
        
        
})
        output$plot <- renderPlot({
                dist <- input$dist
                n <- input$n
                
                hist(d(),
                     main = paste("r", dist, "(", n, ")", sep = ""),
                     col = "#75AADB", border = "white")
        })
        
        # Generate a summary of the data ----
        output$summary <- renderPrint({
                summary(d())
        })
        
        # Generate an HTML table view of the data ----
        output$table <- renderTable({
                d()
        })
        
})