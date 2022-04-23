# MP Pageviews 2022

This is the repository for the MP's page views blog post on my website. You can read the blog post [at this link](https://philswatton.github.io/2022/04/24/mp-pageviews.html).

## Scripts

Script 01 collects the data from the `legislatoR` R package and the Wikipedia API. Script 02 uses this data to create a treemap plot using the `treemap` R package.

## Data

The data folder contains the dataframes created in script 01. `mps_total.rds` is the data frame containing aggregated view counts for 2022. `mps_tscs.rds` contains a TSCS dataframe of view counts for the same MPs for each day in 2022. `views.rds` is the output from the Wikimedia API organised into a dataframe format.
