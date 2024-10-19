#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# ----------------------------------------------------------------------------

# Load packages
# ----------------------------------------------------------------------------
library(shiny)
library(dplyr)
library(lubridate)

# Load data 
# ----------------------------------------------------------------------------

hospital_stay_raw <- read.csv2("data/hospital_stay.csv")
hospital_raw <- read.csv2("data/hospital.csv")
str(hospital_stay_raw) 

hospital_stay = hospital_stay_raw %>%
  merge(hospital_raw, by = "hospital_id") %>%
  mutate(admission_date = as.character(ymd(admission_date)), 
       discharge_date = as.character(ymd(discharge_date)))

# User Interface
# ----------------------------------------------------------------------------

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("TD 1 - Printing records according to a filter"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          selectInput(
            inputId = "select_hospital",
            "Unit",
            choices = c(hospital_raw$hospital)
          )
            ),

        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("selected_hospital_stay")
        )
    )
)

# Server
# ----------------------------------------------------------------------------

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$selected_hospital_stay <- renderTable({
      hospital_stay %>%
        filter(hospital == input$select_hospital) %>% 
        select(hospital_id, admission_date, discharge_date, hospital) 
        


    })
}


# Web application
# ----------------------------------------------------------------------------

# Run the application 
shinyApp(ui = ui, server = server)
