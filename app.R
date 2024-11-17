# Charger les bibliothèques nécessaires
install.packages('shinydashboard') # nolint
install.packages('shinyWidgets') # nolint
install.packages("sf")
install.packages("tidyverse")
install.packages("leaflet")
library(shiny)
library(shinydashboard)
# app.R
install.packages("htmlwidgets")
library(htmlwidgets)

library(sf)
library(tidyverse)
library(leaflet)
library(shinyWidgets)


# Load the pages
source("Pages/Home.R") 
source("Pages/Map.R")

# Interface utilisateur
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

# Logique serveur
server <- function(input, output, session) {
  # Call home server
  home_server(input, output, session)
  
  # Call map server directly (not as a module)
  map_server(input, output, session)
}

# Lancer l'application
shinyApp(ui = ui, server = server)
