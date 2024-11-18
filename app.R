# app.R

# Charger les bibliothèques nécessaires
library(shiny)
library(shinydashboard)
library(sf)
library(tidyverse)
library(leaflet)
library(dplyr)
library(shinyWidgets)
library(htmlwidgets)

# Charger les pages
source("Pages/Home.R")
source("Pages/Courbes_Evolution.R")
source("Pages/Map.R")

# Interface utilisateur
ui <- dashboardPage(
  dashboardHeader(title = "Immunization Surveillance"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("dashboard")),
       menuItem("Courbes Evolution", tabName = "Courbes_Evolution", icon = icon("chart-line")),
      menuItem("Map", tabName = "Map", icon = icon("globe"))
     
    )
  ),
  dashboardBody(
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
    tabItems(
      home_ui,
      courbes_evolution_ui,
      map_ui
       # Ajouter la nouvelle page UI
    )
  )
)

# Logique serveur
server <- function(input, output, session) {
  home_server(input, output, session)
  courbes_evolution_server(input, output)  # Appeler la logique serveur
  map_server(input, output, session)
  
}

# Lancer l'application
shinyApp(ui = ui, server = server)

