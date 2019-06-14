library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)

server <- function(input, output) {
  
  output$table1 <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    (input$file1)
    
    # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    validate(
      need(input$file1 != "", label = "data set")
    )
    
    df <- read.csv(input$file1$datapath,
                   header = input$header,
                   sep = input$sep,
                   quote = input$quote)
    
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }
    
  })
  
  #Input systems in Sidebar
  output$menu <- renderMenu({
    sidebarMenu(
    # Input: Select a file ----
    fileInput("file1", "Choose File",
              multiple = FALSE,
              accept = c("text/csv",
                         "text/comma-separated-values,text/plain",
                         ".csv"),
              ),
    
    tags$hr(),

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
                 selected = '"'),
    
    tags$hr(),
    
    # Input: Select number of rows to display ----
    radioButtons("disp", "Display",
                 choices = c(Head = "head",
                             All = "all"),
                 selected = "head")
      )
    })
  
  output$bar1 <- renderPlot({
    (input$file1)


    # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    validate(
    need(input$file1 != "", label = "data set")
    )
  
      df <- read.csv(input$file1$datapath,
                     header = T,
                     sep = input$sep,
                     quote = input$quote)
    
    ggplot(df, aes(x=student,y=num, fill = sub)) +
      geom_bar(stat='identity', position = 'dodge', colour = "black", width=.8)
    # + facet_wrap(~ sub)
  })
  
  
  output$kor <- renderPlot({
    validate(
      need(input$file1 != "", label = "data set")
    )
    
    df <- read.csv(input$file1$datapath,
                   header = T,
                   sep = input$sep,
                   quote = input$quote)
    
    # ggplot(df, aes(x=student, y=num, fill=sub)) + geom_bar(stat = 'identity', colour="black") + facet_wrap(~ sub)
    df%>%
      filter(sub=="국어")%>%
      ggplot(aes(student, num))+
      geom_bar(stat='identity', fill='red')
  })
  
  output$eng <- renderPlot({
    validate(
      need(input$file1 != "", label = "data set")
    )
    
    df <- read.csv(input$file1$datapath,
                   header = T,
                   sep = input$sep,
                   quote = input$quote)
    
    df%>%
      filter(sub=="영어")%>%
      ggplot(aes(student, num))+
      geom_bar(stat='identity', fill='orange')
  })
  
  
  output$math <- renderPlot({
    validate(
      need(input$file1 != "", label = "data set")
    )
    
    df <- read.csv(input$file1$datapath,
                   header = T,
                   sep = input$sep,
                   quote = input$quote)
  
    df%>%
      filter(sub=="수학")%>%
      ggplot(aes(student, num))+
      geom_bar(stat='identity', fill='blue')
  })
  
  output$classPlot <- renderPlot({
    validate(
      need(input$file1 != "", label = "data set")
    )
    
    df <- read.csv(input$file1$datapath,
                   header = T,
                   sep = input$sep,
                   quote = input$quote)
    
    # df%>%
    #   filter(sub == "국어")%>%
      ggplot(df, aes(x=class, y=num, group=class)) +
      geom_boxplot() +
      scale_x_continuous(breaks=c(1,2))
  })
}