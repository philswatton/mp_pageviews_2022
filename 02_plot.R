# MP Wikipedia Data Pageviews ----
# Phil Swatton
# University of Essex
# File 02: Visualise pageview data


## Packages
library(tidyverse)
library(treemap)


## Data
mps <- readRDS("data/mps_total.rds")
color <- data.frame(party2 = c("Conservative", "Labour", "SNP", "Liberal Democrats",
                               "Independent", "DUP", "Green",
                               "Plaid Cymru", "SDLP", "Sinn Féin", "Alliance"),
                    color = c("#00aeef", "#e4003b", "#FFF481", "#fbb347",
                              "#000000", "#19283E", "#6ab023",
                              "#215F55", "#006E51", "#247F3F", "#F4C72E"))
df <- left_join(mps, color)




# Treemap ----
treemap(df,
        c("party2","name"),
        vSize="views",
        type="color",
        vColor="color",
        border.col="#FFFFFF",

        title="UK MP Wikipedia Page Views by Party",

        fontcolor.labels=c("#000000","#FFFFFF"),
        bg.labels="#FFFFFF",
        # overlap.labels=0,
        align.labels=list(c("center","center"),c("left","top")))
