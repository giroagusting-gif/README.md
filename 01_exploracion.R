library(tidyverse)
library(janitor)

datos <- read.csv(file.choose())

datos <- clean_names(datos)

glimpse(datos)

names(datos)

summary(datos)

colSums(is.na(datos))

sum(duplicated(datos))
