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
        sidebarMenu(
            # menuItem("HOME", tabName="home", icon = icon("home")),
            # menuItem("CHART", tabname="chart", icon =icon("chart-line"))
            menuItemOutput("inputfile")
            # menuItemOutput("inputchkbox"),
            # menuItemOutput("inputradio"),
            # menuItemOutput("inputnumber"),
        )
    ),
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "home",
        # Boxes need to be put in a row (or column)
                fluidRow(
                    colomn = 2,
                box(
                    # Horizontal line ----
                    # tags$hr(),
                    # 
                    # Input: Checkbox if file has header ----
                    checkboxInput("header", "Header", TRUE),
                    
                    # Input: Select separator ----
                    radioButtons("sep", "Separator",
                                 choices = c(Comma = ",",
                                             Semicolon = ";",
                                             Tab = "\t"),
                                 selected = ","),
                    
                    # Input: Select quotes ----
                    radioButtons("quote", "Quote",
                                 choices = c(None = "",
                                             "Double Quote" = '"',
                                             "Single Quote" = "'"),
                                 selected = '"')
                    ),
                box(
                    # 
                    # Input: Select number of rows to display ----
                    radioButtons("disp", "Display",
                                 choices = c(Head = "head",
                                             All = "all"),
                                 selected = "head")
                    
                    )
                )
                
                # box(
                #     title = "Controls",
                #     sliderInput("slider", "Number of observations:", 1, 100, 50)
                # ),
                
            ),
            tabItem(tabName="chart",
                h2("Chart here")
            )
        )
    )
)

