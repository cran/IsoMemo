## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(IsoMemo)
getDatabaseList() # returns a character format of list of database names linked to the API call

## ----explore data-------------------------------------------------------------
df = getData(db="IntChron",category = "Location")
# see latitude and longitude of each site
head(df)

## ----all data-----------------------------------------------------------------
# ALL_DATA = getData()
# print(nrow(ALL_DATA)) # check how many rows
# levels(ALL_DATA$source) # check all the database sources are there

## ----descriptives-------------------------------------------------------------
getDatabaseList() # tells what database are currently published

df1 = getData('LiVES')
summary(df1)

## ----hist---------------------------------------------------------------------
hist(df1$d15N)

## ----regression---------------------------------------------------------------
df1 <- na.omit(df1)
lm(d13C~d15N,data=df1)


