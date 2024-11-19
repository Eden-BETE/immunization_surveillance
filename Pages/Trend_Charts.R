# Courbes_Evolution.R

# Charger les données
donnees <- read.csv("data/donnees_vaccination.csv")

# Interface utilisateur
trend_charts_ui <- tabItem(
  tabName = "Trend_Charts",
  fluidPage(
    titlePanel("Trends in Vaccination Coverage (2000-2023)"),
    sidebarLayout(
      sidebarPanel(
        selectInput("pays", "Select one or more countries:", 
                    choices = unique(donnees$country), 
                    selected = unique(donnees$country)[1], 
                    multiple = TRUE),
        selectInput("vaccin", "Select a vaccine :", 
                    choices = unique(donnees$vaccine), 
                    selected = unique(donnees$vaccine)[1])
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Trends per country", plotOutput("graphPays")),
          tabPanel("Comparison with global trend", plotOutput("graphComparaison"))
        )
      )
    )
  )
)

# Logique serveur
trend_charts_server <- function(input, output) {
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
      labs(title = paste("Comparison for the vaccine :", input$vaccin),
           x = "Année", y = "Taux de couverture (%)",
           color = "Légende", linetype = "Légende") +
      theme_minimal()
  })
}
