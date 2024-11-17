# Charger les bibliothèques nécessaires
install.packages('shinydashboard') # nolint
install.packages('shinyWidgets') # nolint
library(shiny)
library(shinydashboard)
library(shinyWidgets)

# Charger la page
source("./Pages/Home.R")

# Interface utilisateur
ui <- dashboardPage(
  dashboardHeader(title = "Immunization_Surveillance"),

  # Barre latérale
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "Home", icon = icon("dashboard"))
    )
  ),
  
  # Dans dashboardBody()
  dashboardBody(

    # UI pour la page d'accueil
    home_ui
  )
)

# Logique serveur
server <- function(input, output, session) {
  callModule(home_server, "Home") # Appeler uniquement le serveur pour la Page 1
}

# Lancer l'application
shinyApp(ui = ui, server = server)