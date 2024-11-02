# Load necessary libraries
install.packages('shinydashboard')  # Uncomment this if you haven't installed the package yet
library(shiny)
library(shinydashboard)

# Load the page
source("pages/page1.R")  # Ensure this path is correct and points to your page1.R file

# User interface
ui <- dashboardPage(
  dashboardHeader(title = "Mon Dashboard Multi-pages"),
  
  # Sidebar navigation
  dashboardSidebar(
    sidebarMenu(
      menuItem("Page 1", tabName = "page1", icon = icon("dashboard"))
      # Remove other menu items for now
    )
  ),
  
  # Dashboard body
  dashboardBody(
    tabItems(
      page1_ui  # Reference only Page 1 UI
    )
  )
)

# Server logic
server <- function(input, output, session) {
  callModule(page1_server, "page1")  # Call only the server for Page 1
}

# Launch the application
shinyApp(ui = ui, server = server)