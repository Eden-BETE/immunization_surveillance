
install.packages("shinydashboard")
library(shinydashboard)
# app.R
install.packages("htmlwidgets")
library(htmlwidgets)

library(shiny)
library(sf)
library(tidyverse)
library(leaflet)

# Load the pages
source("Pages/Home.R") 
source("Pages/Map.R")

# User interface
ui <- dashboardPage(
  dashboardHeader(title = "Immunization Surveillance"),
  
  # Sidebar navigation
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("dashboard")),
      menuItem("Map", tabName = "Map", icon = icon("globe"))
    )
  ),
  
  # Dashboard body
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    tabItems(
      home_ui,  # UI from Home.R
      map_ui    # UI from Map.R
    )
  )
)

# Server logic
server <- function(input, output, session) {
  # Call home server
  home_server(input, output, session)
  
  # Call map server directly (not as a module)
  map_server(input, output, session)
}

# Launch the application
shinyApp(ui = ui, server = server)
