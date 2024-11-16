# Map.R
# Remove install.packages() from here as it's redundant when packages are already installed

library(shiny)
library(leaflet)
library(tidyverse)
library(sf)
library(htmlwidgets)  # Ensure htmlwidgets is explicitly loaded

# Load data
data <- read.csv("/Users/edenbete/Documents/immunization_surveillance/data/combined_vaccine_coverage.csv")
world_map <- st_read("/Users/edenbete/Documents/immunization_surveillance/data/world_map.json")

# UI for the Map tab
map_ui <- tabItem(
    tabName = "Map",
    fluidPage(
        h2("Interactive Vaccine Coverage Map"),
        sidebarLayout(
            sidebarPanel(
                selectInput("selected_year", "Select Year:", 
                           choices = sort(unique(data$year), decreasing = TRUE)),
                selectInput("selected_vaccine", "Select Vaccine:", 
                           choices = unique(data$vaccine)),
                verbatimTextOutput("debug_info")
            ),
            mainPanel(
                leafletOutput("map", height = "600px")
            )
        )
    )
)

# Server logic for the Map tab
map_server <- function(input, output, session) {
    # Create filtered data
    filtered_data <- reactive({
        data %>%
            filter(year == input$selected_year,
                  vaccine == input$selected_vaccine)
    })
    
    # Join map data with filtered data
    map_data <- reactive({
        world_map %>%
            left_join(filtered_data(), by = c("id" = "iso3"))
    })
    
  
    
    # Render map
    output$map <- renderLeaflet({
        # Create color palette
        pal <- colorNumeric(
            palette = "YlOrRd",
            domain = c(0, 100),
            na.color = "#808080"
        )
        
        # Create the map
        leaflet(map_data()) %>%
            addTiles() %>%
            addPolygons(
                fillColor = ~pal(coverage),
                weight = 1,
                opacity = 1,
                color = "white",
                fillOpacity = 0.7,
                highlight = highlightOptions(
                    weight = 2,
                    color = "#666",
                    fillOpacity = 0.7,
                    bringToFront = TRUE
                ),
                popup = ~paste0(
                    "<strong>", name, "</strong><br>",
                    "Coverage: ", 
                    ifelse(is.na(coverage), 
                           "No data", 
                           paste0(round(coverage, 1), "%"))
                )
            ) %>%
            addLegend(
                position = "bottomright",
                pal = pal,
                values = c(0, 100),
                title = "Coverage (%)",
                na.label = "No data"
            ) %>%
            setView(lng = 0, lat = 20, zoom = 2)
    })
}
