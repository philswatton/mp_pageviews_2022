# MP Wikipedia Data Pageviews ----
# Phil Swatton
# University of Essex
# File 01: Obtain pageview data


## Packages
library(tidyverse)
library(httr)
library(legislatoR)




# Obtain MP wikipedia page title ----

uk_core <- get_core("gbr")
uk_political <- get_political("gbr")
uk_mps <- left_join(uk_core, uk_political, by=c("pageid"="pageid"))



#
str <- str_c("https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/",
             "Boris_Johnson",
             "/daily/2022010100/2022042200")
