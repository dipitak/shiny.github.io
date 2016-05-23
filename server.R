library(shiny)
library(datasets)

hpData <- mtcars
hpData$am <- factor(hpData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("hp ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("hp ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=hpData)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$hpBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = hpData
            )
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$hpPlot <- renderPlot({
    with(hpData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })

})
