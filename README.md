# [Immunization Surveillance Dashboard 💉](https://nl79p3-bete-ga0lle.shinyapps.io/immunization_surveillance/)

## Overview
The Immunization Surveillance Dashboard is an interactive web application built with R Shiny that visualizes global vaccination coverage data from WHO and UNICEF (WUENIC - WHO and UNICEF Estimates of National Immunization Coverage). This tool allows users to explore vaccination rates across different countries, years, and vaccine types through an intuitive interface.

## 🎯 Features
- Interactive world map visualization of vaccination coverage
- Time series data spanning 23 years
- Coverage data for 16 different vaccines/antigens
- Data for 195 countries worldwide
- User-friendly interface with filtering options
- Detailed country-specific information

## 📋 Prerequisites
- R (version 4.0.0 or higher)
- RStudio (recommended for development)

## 🔧 Required R Packages
```R
- shiny
- shinydashboard
- shinyWidgets
- sf
- tidyverse
- leaflet
- htmlwidgets
```

## 🚀 Installation & Setup

1. Clone the repository:
```bash
git clone [https://github.com/Eden-BETE/immunization_surveillance.git]
cd immunization-surveillance
```

2. Install required R packages:
```R
install.packages(c("shiny", "shinydashboard", "shinyWidgets", "sf", "tidyverse", "leaflet", "htmlwidgets"))
```

3. Ensure your project structure is organized as follows:
```
immunization-surveillance/
├── app.R
├── www/
│   └── style.css
├── Pages/
│   ├── Home.R
│   └── Map.R
└── data/
    ├── combined_vaccine_coverage.csv
    └── world_map.json
```

## 🏃‍♂️ Running the Application

### Local Development
1. Open RStudio
2. Open the `app.R` file
3. Click 'Run App' or execute:
```R
shiny::runApp()
```

### Deployment
To deploy on Shiny Server or shinyapps.io:
1. Ensure all dependencies are properly listed
2. Set CRAN mirror in app.R:
```R
options(repos = c(CRAN = "https://cran.r-project.org"))
```
3. Follow the deployment instructions for your hosting platform

## 📊 Data Sources
- WHO and UNICEF Estimates of National Immunization Coverage (WUENIC)
- World geographical data (GeoJSON format)

## 🔍 Features Details

### Home Page
- Project context and objectives
- Key statistics and metrics
- Terminology and abbreviations
- Global overview cards

### Map View
- Interactive choropleth map
- Year selection dropdown
- Vaccine type selector
- Coverage percentage legend
- Country-specific popups with detailed information

## 📝 License
This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Authors
* [<b>Eden BETE</b>](https://github.com/Eden-BETE)
* [<b>Abdou DOSSOU</b>](https://github.com/Abd2k27)
* [<b>Martinien Borgia Decherubin Miemo</b>](https://github.com/borgiamiemo)
* Christelle

## 🙏 Acknowledgments
- World Health Organization (WHO)
- UNICEF

## 📞 Contact
* Eden BETE :  Mail[eden.bete.etu@univ-lille.fr]

---
**Note**: Keep your data files and dependencies up to date for optimal performance.
