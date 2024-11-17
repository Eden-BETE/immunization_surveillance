#Chargement répertoire------

getwd()
setwd("C:/Users/Miemo Borgia/Git/immunization_surveillance/Unicef Databases")

#Chargement librairies------

library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)
library(shiny)
library(shinydashboard)

#Chargement des fichiers------

bcg= read.csv("BCG.csv")
dtp1= read.csv("DTP1.csv")
dtp3=read.csv("DTP3.csv")
hepb3=read.csv("HEPB3.csv")
hepbb=read.csv("HEPBB.csv")
hib3=read.csv("HIB3.csv")
ipv1=read.csv("IPV1.csv")
ipv2=read.csv("IPV2.csv")
mcv1=read.csv("MCV1.csv")
mcv2=read.csv("MCV2.csv")
menga=read.csv("MENGA.csv")
pcv3=read.csv("PCV3.csv")
pol3=read.csv("POL3.csv")
rcv1=read.csv("RCV1.csv")
regional_global=read.csv("regional_global.csv")
rotac=read.csv("ROTAC.csv")
yfv=read.csv("YFV.csv")

#Data management------

#Pivoter les colonnes en lignes et retirer les "X" devant les années

bcg_long = bcg %>%
  pivot_longer(cols = starts_with("X20"),     # Sélectionner les colonnes d'années (2000 à 2023)
               names_to = "annee",           # Nouvelle colonne pour les années
               values_to = "taux_couverture") # Nouvelle colonne pour les valeurs de taux de couverture

bcg_long = bcg_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))  # Enlever le "X" et convertir en numérique

dtp1_long = dtp1 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

dtp1_long = dtp1_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

dtp3_long = dtp3 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

dtp3_long = dtp3_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

hepb3_long = hepb3 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

hepb3_long = hepb3_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

hepbb_long = hepbb %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

hepbb_long = hepbb_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

hib3_long = hib3 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

hib3_long = hib3_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

ipv1_long = ipv1 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

ipv1_long = ipv1_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

ipv2_long = ipv2 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

ipv2_long = ipv2_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

mcv1_long = mcv1 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

mcv1_long = mcv1_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

mcv2_long = mcv2 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

mcv2_long = mcv2_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

menga_long = menga %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

menga_long = menga_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

pcv3_long = pcv3 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

pcv3_long = pcv3_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

pol3_long = pol3 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

pol3_long = pol3_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

rcv1_long = rcv1 %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

rcv1_long = rcv1_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

regional_global=regional_global %>%
  rename(annee=year)

rotac_long = rotac %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

rotac_long = rotac_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

yfv_long = yfv %>%
  pivot_longer(cols = starts_with("X20"),     
               names_to = "annee",           
               values_to = "taux_couverture")

yfv_long = yfv_long %>%
  mutate(annee = as.numeric(gsub("X", "", annee)))

#Création d'une fonction pour transformer les années et taux en numérique-----

convertir_colonnes <- function(data) {
  data %>%
    mutate(
      annee = as.numeric(annee),            
      taux_couverture = as.numeric(taux_couverture) 
    )
}

bcg_long = bcg_long%>% convertir_colonnes()
dtp1_long = dtp1_long%>% convertir_colonnes()
dtp3_long=dtp3_long%>% convertir_colonnes()
hepb3_long=hepb3_long%>% convertir_colonnes()
hepbb_long=hepbb_long%>% convertir_colonnes()
hib3_long=hib3_long%>% convertir_colonnes()
ipv1_long=ipv1_long%>% convertir_colonnes()
ipv2_long=ipv2_long%>% convertir_colonnes()
mcv1_long=mcv1_long%>% convertir_colonnes()
mcv2_long=mcv2_long%>% convertir_colonnes()
menga_long=menga_long%>% convertir_colonnes()
pcv3_long=pcv3_long%>% convertir_colonnes()
pol3_long=pol3_long%>% convertir_colonnes()
rcv1_long=rcv1_long%>% convertir_colonnes()
rotac_long=rotac_long%>% convertir_colonnes()
yfv_long=yfv_long%>% convertir_colonnes()
str(regional_global)
str(rcv1_long)

regional_global=  regional_global %>%
  mutate(
    annee = as.numeric(annee),            
    coverage = as.numeric(coverage) 
  )

regional_global = rename(regional_global, taux_couverture = coverage)

# Fusion de tous les tableaux après modifications
all_vaccines_long = bind_rows(
  bcg_long, dtp1_long, dtp3_long, hepb3_long, hepbb_long, hib3_long,
  ipv1_long, ipv2_long, mcv1_long, mcv2_long, menga_long, pcv3_long,
  pol3_long, rcv1_long, rotac_long, yfv_long
)

# Graphique de tendance par vaccin et par pays

ggplot(all_vaccines_long %>% filter(vaccine == "BCG", country %in% c("France", "Germany")), 
       aes(x = annee, y = taux_couverture, color = country)) +
  geom_line(linewidth = 2) +
  labs(title = "Comparaison des taux de couverture (BCG)",
       x = "Année", y = "Taux de couverture (%)",
       color = "Pays") +
  theme_minimal()

# Graphique de tendance pour comparaion tendance d'un vaccin pour un pays avec l'évolution de la tendance mondiale

global_data = regional_global %>% filter(region == "Global", vaccine == "BCG")

ggplot() +
  geom_line(data = all_vaccines_long %>% filter(vaccine == "BCG", country == "France"), 
            aes(x = annee, y = taux_couverture, color = "France")) +
  geom_line(data = global_data, 
            aes(x = annee, y = taux_couverture, color = "Mondial")) +
  labs(title = "Comparaison : France vs. Taux mondial (BCG)",
       x = "Année", y = "Taux de couverture (%)",
       color = "Légende") +
  theme_minimal()
