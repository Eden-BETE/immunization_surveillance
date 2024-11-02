library(shiny)

# UI for Page 1
page1_ui <- tabItem(
  tabName = "page1",
  fluidPage(
    titlePanel("Introduction"),
    fluidRow(
      column(width = 12,
             h2("Objectives"),
             p("Here you can outline the main objectives of your project. Describe what you aim to achieve with this dashboard and the significance of your work."),
             
             h2("Context"),
             p("Provide some background information about the project. Explain the context in which your work is situated and why it is important. Discuss any relevant data sources, methodologies, or theoretical frameworks that inform your work.")
      )
    )
  )
)

# Server logic for Page 1 (if needed)
page1_server <- function(input, output, session) {
  # Any server-side logic can go here (if needed)
}
