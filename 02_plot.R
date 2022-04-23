# MP Wikipedia Data Pageviews ----
# Phil Swatton
# University of Essex
# File 02: Visualise pageview data


## Packages
library(tidyverse)
library(treemap)


## Data
mps <- readRDS("data/mps_total.rds")
color <- data.frame(party2 = c("Conservative", "Labour", "SNP", "Lib Dems",
                               "Independent", "DUP", "Green",
                               "Plaid", "SDLP", "Sinn Féin", "Alliance"),
                    color = c("#00aeef", "#e4003b", "#FFF481", "#fbb347",
                              "#000000", "#19283E", "#6ab023",
                              "#215F55", "#006E51", "#247F3F", "#F4C72E"))
df <- left_join(mps, color) %>% arrange(views)
df$name2 <- df$name
df$name2[1:630] <- str_c(df$name2[1:630], str_c(rep("z",1000), collapse=""))# hacky trick to get treemap only to print labels for the top 20



# Treemap ----

jpeg("plots/tree.jpeg",
     width = 3000, height = 1863)
treemap(df,
        c("party2","name2"),
        vSize="views",
        type="color",
        vColor="color",

        border.col="#FFFFFF",
        border.lwds=c(4,2),

        title="UK MP Wikipedia Page Views by Party",
        fontsize.title=100,

        fontcolor.labels=c("#000000","#FFFFFF"),
        fontsize.labels=c(120,100),
        bg.labels="#FFFFFF",
        overlap.labels=0,
        lowerbound.cex.labels=0.5,
        align.labels=list(c("center","center"),c("left","top")))
dev.off()
