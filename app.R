# Load necessary libraries
install.packages('shinydashboard')  # Uncomment this if you haven't installed the package yet
library(shiny)
library(shinydashboard)

# Load the page
source("pages/Home.R") 
source("pages/Filtres.R") # Ensure this path is correct and points to your page1.R file

# User interface
ui <- dashboardPage(
  dashboardHeader(title = "Immunization_Surveillance"),
  
  # Sidebar navigation
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("dashboard")),
      menuItem("Filtres", tabName = "Filtres", icon = icon("dashboard"))
      # Remove other menu items for now
    )
  ),
  
  # Inside the dashboardBody() in app.R
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    tabItems(
      Home_ui, # Reference the Home UI
      Filtres_ui 
    )
  )
)

# Server logic
server <- function(input, output, session) {
  callModule(Home_server, "Home")
  callModule(Filtres_server,"Filtres")  # Call only the server for Page 1
}

# Launch the application
shinyApp(ui = ui, server = server)

#Abdou
#Borgia