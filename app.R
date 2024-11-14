# Load necessary libraries
install.packages('shinydashboard')  # Uncomment this if you haven't installed the package yet
library(shiny)
library(shinydashboard)

# Load the page
source("Pages/Home.R") 

# User interface
ui <- dashboardPage(
  dashboardHeader(title = "Immunization_Surveillance"),
  
  # Sidebar navigation
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("dashboard"))
      
      # Remove other menu items for now
    )
  ),
  
  # Inside the dashboardBody() in app.R
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    tabItems(
      home_ui # Reference the Home UI
      
    )
  )
)

# Server logic
server <- function(input, output, session) {
  callModule(home_server, "Home")
    # Call only the server for Page 1
}

# Launch the application
shinyApp(ui = ui, server = server)

