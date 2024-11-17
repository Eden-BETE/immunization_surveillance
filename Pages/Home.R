library(shiny)

tags$head(tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Space+Mono&display=swap"))
tags$head(tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Montserrat+Alternates&display=swap"))
tags$head(tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Amita:wght@400&display=swap"))
tags$head(
  tags$link(
    rel = "stylesheet",
    href = "https://fonts.googleapis.com/css2?family=Amita:wght@400;700&family=Montserrat+Alternates:wght@400;700&family=Space+Mono:wght@400;700&display=swap"
  )
)



# UI for Page 1
home_ui <- tabItem(
  tabName = "Home",
  fluidPage(
    includeCSS("www/style.css"),

    # Custom Title Panel with CSS Class
    div(h1(class = "title-panel", "Immunization Surveillance Dashboard")),
    fluidRow(
      # Première colonne : Textes contextuels
      column(
        width = 9, # 50% de la largeur
        h2(class = "context-title", "Project Context 💊"),
        p(
          class = "context-text",
          "In an increasingly interconnected world, global health remains a critical issue, particularly regarding vaccination. Vaccines play a vital role in preventing infectious diseases, thereby reducing morbidity and mortality worldwide. However, significant disparities exist in vaccination coverage rates between countries and regions, influenced by socio-economic, political, and cultural factors.
          This project aims to analyze data provided by the World Health Organization (WHO) and UNICEF, known as WUENIC (WHO and UNICEF Estimates of National Immunization Coverage). By using this data, we seek to create an interactive dashboard that allows users to visualize and explore vaccination coverage rates across different geographic and temporal scales."
        ),
        h2(class = "objectives-title", "Objectives 🎯"),
        p(
          class = "objectives-text",
          "Provide some background information about the project. Explain the context in which your work is situated and why it is important. Discuss any relevant data sources, methodologies, or theoretical frameworks that inform your work."
        ),
        tags$ul(
          class = "objectives-text",
          tags$li("Assess Vaccination Coverage: Analyze global vaccination coverage rates, identify regions with low coverage, and understand trends over time."),
          tags$li("Raise Awareness: Provide an educational platform to inform the public about the importance of vaccination and the disparities that exist."),
          tags$li("Facilitate Decision-Making: Offer policymakers, researchers, and healthcare professionals analytical tools to support their efforts in improving vaccination programs."),
          tags$li("Encourage Community Engagement: Promote discussions around vaccination challenges and potential solutions to encourage better vaccination coverage worldwide.")
        ),
        h2(class = "terminology-title", "Terminology and Abbreviations ⛑️"),
        tags$ul(
          class = "terminology-list",
          tags$li(strong("WUENIC (WHO and UNICEF Estimates of National Immunization Coverage):"), "Annual estimates of national vaccination coverage produced by WHO and UNICEF, based on a review of data submitted by Member States, including administrative data and survey results."),
          tags$li(strong("WHO (World Health Organization):"), " A specialized agency of the United Nations responsible for coordinating international health efforts."),
          tags$li(strong("UNICEF (United Nations Children's Fund):"), " A United Nations agency dedicated to the protection and promotion of children's rights worldwide, including child health and vaccination."),
          tags$li(strong("Vaccination Coverage:"), " The percentage of the target population that has received a specific vaccine. Coverage is essential for achieving herd immunity and protecting vulnerable populations."),
          tags$li(strong("Herd Immunity:"), " The indirect protection from infectious disease that occurs when a sufficient proportion of a population is immunized, thereby reducing the spread of the disease.")
        )
      ),

      # Deuxième colonne : Titre et cartes alignées verticalement
      column(
        width = 3,
        h2(class = "global_view", "Global View 🪐"),
        div(
          style = "display: flex; flex-direction: column; gap: 15px; margin-top: 20px;",
          div(
            class = "card",
            style = "display: flex; flex-direction: column; align-items: center; justify-content: center; background-color: #fff; border-radius: 15px; padding: 20px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);",
            div(
              style = "font-size: 2.5rem; font-weight: bold; color: rgb(0, 155, 182);",
              "195"
            ),
            div(
              style = "font-size: 1rem; font-weight: bold; color: black; text-align: center; margin-top: 10px;",
              "COUNTRIES IN THE DATABASE."
            )
          ),
          div(
            class = "card",
            style = "display: flex; flex-direction: column; align-items: center; justify-content: center; background-color: #fff; border-radius: 15px; padding: 20px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);",
            div(
              style = "font-size: 2.5rem; font-weight: bold; color: rgb(0, 155, 182);",
              "16"
            ),
            div(
              style = "font-size: 1rem; font-weight: bold; color: black; text-align: center; margin-top: 10px;",
              "MONITORED ANTIGENS OR  VACCINES."
            )
          ),
          div(
            class = "card",
            style = "display: flex; flex-direction: column; align-items: center; justify-content: center; background-color: #fff; border-radius: 15px; padding: 20px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);",
            div(
              style = "font-size: 2.5rem; font-weight: bold; color: rgb(0, 155, 182);",
              "23"
            ),
            div(
              style = "font-size: 1rem; font-weight: bold; color: black; text-align: center; margin-top: 10px;",
              "YEARS COVERED BY THE DATA."
            )
          ),
        )
      )
    )
  )
)

# Server logic for Page 1 (if needed)
home_server <- function(input, output, session) {
  # Any server-side logic can go here (if needed)
}
