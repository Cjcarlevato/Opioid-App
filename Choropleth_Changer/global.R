library(shinydashboard)
library(leaflet)
library(ggmap)
library(plotly)
library(tidyverse)
library(ggplot2)
library(shinythemes)

# state_abbrev <- read_csv('Data/overdoses.csv') %>% select(State, Abbrev)
# overdoses <- read_csv('Data/overdose_full.csv') %>% inner_join(state_abbrev)
overdoses <- readRDS('Data/overdoses.RDS')

states <- as.data.frame(overdoses) %>% 
  select(State) %>% 
  unique

states <- sort(states$State)

years <- as.data.frame(overdoses) %>% 
  select(Year) %>% 
  unique

years <- sort(years$Year)