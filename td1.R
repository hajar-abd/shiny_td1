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

# Load data 
# ----------------------------------------------------------------------------

# load hospital_stay.csv and hospital.csv
# print the structure (str) in the terminal

# User Interface
# ----------------------------------------------------------------------------

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("TD 1 - Printing records according to a filter"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            # insert a selectInput component printing the hospitals labels
            # the id of the componant is "select_hospital"
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            # insert a tableOutput compponant with the id "selected_hospital_stay"
        )
    )

# Server
# ----------------------------------------------------------------------------

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$selected_hospital_stay <- renderTable({
        
        #filter the hospital stay according to the hospital label selected in the interface
        # select the fields "hospital_stay_id", "admission_date", "discharge_date", "hospital"
        # return the data frame
        
        return(df)

    })
}


# Web application
# ----------------------------------------------------------------------------

# Run the application 
shinyApp(ui = ui, server = server)
