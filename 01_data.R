# MP Wikipedia Data Pageviews ----
# Phil Swatton
# University of Essex
# File 01: Obtain pageview data


## Packages
library(tidyverse)
library(lubridate)
library(httr)
library(jsonlite)
library(legislatoR)




# Obtain MP data including wikipedia page title ----

uk_core <- get_core("gbr")
uk_political <- get_political("gbr")
mps <- left_join(uk_core, uk_political, by=c("pageid"="pageid")) %>%
  filter(session_start == "2019-12-12")





# Obtain page view data ----

# Function for querying wikipedia API
wiki_api <- function(title) {

  # Construct api query
  query <- str_c("https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/",
                 title,
                 "/daily/2022010100/2022042200")

  # GET request
  response <- GET(query)

  # Convert output to dataframe
  json <- rawToChar(response$content)
  out <- fromJSON(json) %>% `[[`("items")

  # Sleep
  Sys.sleep(10)

  # Return
  return(out)

}

# loop
views <- map_dfr(mps$wikititle, wiki_api)

# save - avoid pinging wikipedia over and over again
saveRDS(views, "data/views.rds")




# Construct datasets ----

# TSCS




