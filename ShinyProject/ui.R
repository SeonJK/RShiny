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
library(ggplot2)
library(dplyr)

# Define UI for application that draws a histogram
ui <- dashboardPage(
    skin = "green",
    dashboardHeader(title = "SEON"),
    dashboardSidebar(
        sidebarMenuOutput("menu")
    ),
    dashboardBody(
       tabBox(
            height="500px", width = "300px",
            selected = "Table",
           tabPanel("Table", tableOutput("table1"),
                    style="overflow-y:scroll; max-height: 400px"),
           tabPanel("Bar", plotOutput("bar1"))
        ),
       
       tags$hr(),
       
       tabBox(title="과목별 비교",
           width="300px",
           selected="국어",
           tabPanel("국어", plotOutput("kor")),
           tabPanel("영어", plotOutput("eng")),
           tabPanel("수학", plotOutput("math"))
       ),
       
       tags$hr(),
       
       box(title="반별 비교",
           width="300px",
           plotOutput("classPlot"))
    )
)

