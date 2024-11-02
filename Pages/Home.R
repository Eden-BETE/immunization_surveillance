library(shiny)

# UI for Page 1
Home_ui <- tabItem(
  tabName = "Home",
  fluidPage(
    # Change titlePanel to a div with custom styling
    div(style = "font-size: 36px; font-weight: bold; color: black; text-align: center; 
             margin-bottom: 20px; background-color: #f5f5dc; 
             border: 2px solid #d9d9d9; padding: 10px; border-radius: 8px;",
    h1("Immunization Surveillance Dashboard")
    ),

    
    fluidRow(
      column(width = 12,
            h2("Project Context"),
            p(class = "contexte", style="font-size: 15px;", "In an increasingly interconnected world, global health remains a critical issue, particularly regarding vaccination. Vaccines play a vital role in preventing infectious diseases, thereby reducing morbidity and mortality worldwide. However, significant disparities exist in vaccination coverage rates between countries and regions, influenced by socio-economic, political, and cultural factors.
              This project aims to analyze data provided by the World Health Organization (WHO) and UNICEF, known as WUENIC (WHO and UNICEF Estimates of National Immunization Coverage). By using this data, we seek to create an interactive dashboard that allows users to visualize and explore vaccination coverage rates across different geographic and temporal scales."),
             
            h2("Objectives"),
            p(style="font-size: 15px", "Provide some background information about the project. Explain the context in which your work is situated and why it is important. Discuss any relevant data sources, methodologies, or theoretical frameworks that inform your work."),
            tags$ul(style="font-size: 15px",
              tags$li("Assess Vaccination Coverage: Analyze global vaccination coverage rates, identify regions with low coverage, and understand trends over time."),
              tags$li("Raise Awareness: Provide an educational platform to inform the public about the importance of vaccination and the disparities that exist."),
              tags$li("Facilitate Decision-Making: Offer policymakers, researchers, and healthcare professionals analytical tools to support their efforts in improving vaccination programs."),
              tags$li("Encourage Community Engagement: Promote discussions around vaccination challenges and potential solutions to encourage better vaccination coverage worldwide.")
            ),

            h2("Terminology and Abreviations"),
            p(""),
            tags$ul( style = "font-size: 15px",
              tags$li("WUENIC (WHO and UNICEF Estimates of National Immunization Coverage): Annual estimates of national vaccination coverage produced by WHO and UNICEF, based on a review of data submitted by Member States, including administrative data and survey results."),
              tags$li("WHO (World Health Organization): A specialized agency of the United Nations responsible for coordinating international health efforts."),
              tags$li("UNICEF (United Nations Children's Fund): A United Nations agency dedicated to the protection and promotion of children's rights worldwide, including child health and vaccination."),
              tags$li("Vaccination Coverage: The percentage of the target population that has received a specific vaccine. Coverage is essential for achieving herd immunity and protecting vulnerable populations."),
              tags$li("Herd Immunity: The indirect protection from infectious disease that occurs when a sufficient proportion of a population is immunized, thereby reducing the spread of the disease."),
             )
      )
    )
  )
)

# Server logic for Page 1 (if needed)
Home_server <- function(input, output, session) {
  # Any server-side logic can go here (if needed)
}
