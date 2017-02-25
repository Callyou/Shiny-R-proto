#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dtplyr)

# Define UI for application that draws a plot
ui <- fluidPage(
  # Application title
  headerPanel("Choisissez une saison a visualiser"),

  actionButton(inputId = "saison1",
                 label="Saison 1"),

  actionButton(inputId = "saison2",
               label="Saison 2"),

  actionButton(inputId = "saison3",
               label="Saison 3"),

  actionButton(inputId = "saison4",
               label="Saison 4"),

  actionButton(inputId = "tout",
               label="Tout"),
  hr(),
  titlePanel("Moyenne des notes du jury selon la moyenne des distances par athlete par saison", windowTitle = "Moyenne des notes du jury selon la moyenne des distances par athlete par saison"),

  plotOutput("plot")
)

server <- function(input, output) {
 
  v <- reactiveValues(data = NULL)
  
  observeEvent(input$saison1, {
    v$data <- ggplot(ath1, aes(y=mdist_p, x= mjudges, label=name, color=N))+ geom_text()
  })
  
  observeEvent(input$saison2, {
    v$data <- ggplot(ath2, aes(y=mdist_p, x= mjudges, label=name, color=N))+ geom_text()
  })  
  
  observeEvent(input$saison3, {
    v$data <- ggplot(ath3, aes(y=mdist_p, x= mjudges, label=name, color=N))+ geom_text()
  })  
  
  observeEvent(input$saison4, {
    v$data <- ggplot(ath4, aes(y=mdist_p, x= mjudges, label=name, color=N))+ geom_text()
  })  
  
  observeEvent(input$tout, {
    v$data <- ggplot(ath, aes(y=mdist_p, x= mjudges, label=name, color=N))+ geom_text()
  })  
  
  output$plot <- renderPlot({
    if (is.null(v$data)) return()
    (v$data)
  })
}

shinyApp(ui = ui , server =server)

