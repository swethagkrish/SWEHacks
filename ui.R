library(R.utils)
library(ggplot2)
library(dplyr)
library(plotly)
library(shiny)
library(shinythemes)

my_ui <- fluidPage(mainPanel(
  #plotlyOutput("piechart"),
  plotlyOutput("barchart")
), sidebarPanel(uiOutput("Company"))) 
shinyUI(my_ui)