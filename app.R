install.packages('shinydashboard')
library(shiny)
library(shinydashboard)

# Chargement des fichiers de chaque page
source("pages/page1.R")
source("pages/page2.R")
source("pages/page3.R")

# Interface utilisateur
ui <- dashboardPage(
  dashboardHeader(title = "Mon Dashboard Multi-pages"),
  
  # Barre latérale de navigation
  dashboardSidebar(
    sidebarMenu(
      menuItem("Page 1", tabName = "page1", icon = icon("dashboard")),
      menuItem("Page 2", tabName = "page2", icon = icon("chart-line")),
      menuItem("Page 3", tabName = "page3", icon = icon("table"))
    )
  ),
  
  # Corps du tableau de bord
  dashboardBody(
    tabItems(
      page1_ui,
      page2_ui,
      page3_ui
    )
  )
)

# Logique du serveur
server <- function(input, output, session) {
  callModule(page1_server, "page1")
  callModule(page2_server, "page2")
  callModule(page3_server, "page3")
}

# Lancement de l'application
shinyApp(ui = ui, server = server)