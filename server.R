library(dplyr)
library(plotly)
library(shiny)
library(stringr)

data <- read.csv("GD.csv", stringsAsFactors = FALSE)
my_server <- function(input, output, session) {
  Company <- data$Company
  output$Company <- renderUI({
  selectInput("Company", h3("Select a Company"), Company)
  })
  # output$piechart <- renderPlotly ({ 
  #   fillColors <- c("Women" = "lightpink", "Men" = "lightblue1")
  #   Company <- filter(data, Company == input$Company)
  #   plot_ly(data, labels = c("Men", "Women"), values = c(Company$Women, Company$Men), type = 'pie') %>%
  #     layout(title = paste0('Gender Representation by Company', input$Company),
  #            xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
  #            yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)) 
  # 
  #   })
  
  output$barchart <- renderPlotly({ 
    C <- filter(data, Company == input$Company)
    Races <- c("White", "Black", "Latinx", "Asian", "Other")
    Percentage <- c(C$White, C$Black, C$Latinx, C$Asian, C$Other)
    plot_ly(data, x = ~Races, y = ~Percentage, type = 'bar')
  })
  #output$barchart 
  # output$
} 
shinyServer(my_server)