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
            h2("Context"),
            p(class = "contexte", "In an increasingly interconnected world, global health remains a critical issue, particularly regarding vaccination. Vaccines play a vital role in preventing infectious diseases, thereby reducing morbidity and mortality worldwide. However, significant disparities exist in vaccination coverage rates between countries and regions, influenced by socio-economic, political, and cultural factors.
              This project aims to analyze data provided by the World Health Organization (WHO) and UNICEF, known as WUENIC (WHO and UNICEF Estimates of National Immunization Coverage). By using this data, we seek to create an interactive dashboard that allows users to visualize and explore vaccination coverage rates across different geographic and temporal scales."),
             
            h2("Objectives"),
            p("Provide some background information about the project. Explain the context in which your work is situated and why it is important. Discuss any relevant data sources, methodologies, or theoretical frameworks that inform your work."),
            tags$ul(
              tags$li("Assess Vaccination Coverage: Analyze global vaccination coverage rates, identify regions with low coverage, and understand trends over time.")
            ),

            h2("Terminology and Abreviations"),
            p(""),
            tags$ul(
              tags$li("BCG: percentage of births who received one dose of Bacillus Calmette Guerin vaccine."),
              tags$li("DTP1 / DTP3: percentage of surviving infants who received the 1st / 3rd dose, respectively, of diphtheria and tetanus toxoid with pertussis containing vaccine."),
              tags$li("Pol3: percentage of surviving infants who received the 3rd dose of polio containing vaccine. May be either oral or inactivated polio vaccine."),
              tags$li("YFV: percentage of surviving infants who received one dose of yellow fever vaccine in countries where YFV is part of the national immunization schedule for children or is recommended in at risk areas; coverage estimates are annualized for the entire cohort of surviving infants.")
             )
      )
    )
  )
)

# Server logic for Page 1 (if needed)
Home_server <- function(input, output, session) {
  # Any server-side logic can go here (if needed)
}
