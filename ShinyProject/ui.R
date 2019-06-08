#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
    skin = "green",
    dashboardHeader(title = "SEON"),
    dashboardSidebar(
        sidebarMenuOutput("menu")
    ),
    dashboardBody(
       
    )
)

