# Courbes_Evolution.R

# Charger les données
donnees <- read.csv("data/donnees_vaccination.csv")

# Interface utilisateur
courbes_evolution_ui <- tabItem(
  tabName = "Courbes_Evolution",
  fluidPage(
    titlePanel("Évolution de la couverture vaccinale (2000-2023)"),
    sidebarLayout(
      sidebarPanel(
        selectInput("pays", "Sélectionnez un ou plusieurs pays :", 
                    choices = unique(donnees$country), 
                    selected = unique(donnees$country)[1], 
                    multiple = TRUE),
        selectInput("vaccin", "Sélectionnez un vaccin :", 
                    choices = unique(donnees$vaccine), 
                    selected = unique(donnees$vaccine)[1])
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Évolution par pays", plotOutput("graphPays")),
          tabPanel("Comparaison avec la tendance mondiale", plotOutput("graphComparaison"))
        )
      )
    )
  )
)

# Logique serveur
courbes_evolution_server <- function(input, output) {
  output$graphPays <- renderPlot({
    donnees_filtrees <- donnees %>%
      filter(!is.na(taux_couverture), country %in% input$pays, vaccine == input$vaccin)
    
    ggplot(donnees_filtrees, aes(x = annee, y = taux_couverture, color = country)) +
      geom_line(linewidth = 1) +
      labs(title = paste("Évolution de la couverture vaccinale pour le vaccin :", input$vaccin),
           x = "Année", y = "Taux de couverture (%)") +
      theme_minimal()
  })
  
  output$graphComparaison <- renderPlot({
    donnees_pays <- donnees %>%
      filter(!is.na(taux_couverture), country %in% input$pays, vaccine == input$vaccin)
    
    tendance_mondiale <- donnees %>%
      filter(!is.na(taux_couverture), vaccine == input$vaccin) %>%
      group_by(annee) %>%
      summarise(taux_couverture = mean(taux_couverture, na.rm = TRUE)) %>%
      mutate(country = "Tendance mondiale")
    
    donnees_combinees <- bind_rows(donnees_pays, tendance_mondiale)
    
    ggplot(donnees_combinees, aes(x = annee, y = taux_couverture, color = country)) +
      geom_line(aes(linetype = country), linewidth = 1) +
      scale_linetype_manual(values = c(rep("solid", length(unique(donnees_pays$country))), "dashed")) +
      labs(title = paste("Comparaison pour le vaccin :", input$vaccin),
           x = "Année", y = "Taux de couverture (%)",
           color = "Légende", linetype = "Légende") +
      theme_minimal()
  })
}
