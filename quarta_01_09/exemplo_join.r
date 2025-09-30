getwd()
setwd("C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R")
install.packages("tydir")
install.packages("dplyr")
install.packages("readr")
install.packages("readxl")
install.packages("tidyverse")
library(readr)
library(readxl)
library(tidyr)
library(dplyr)
library(tidyverse)

dados_obitos <- readr::read_delim(
  file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\mortalidade_cor_raca.csv",
  delim = ";",
  locale = readr::locale(encoding = "Latin1"),
  skip = 4,
  n_max = 31-4,
  col_names = c("UF","BRANCA","PRETA","AMARELA","PARDA","INDIGENA","IGNORADO","TOTAL"),
  na = c("-"),
)
### Separação de o código e o nome da UF

dados_obitos <- dados_obitos |>
  tidyr::separate(UF, into = c("COD_UF","UF_NOME"), sep = " ", extra = "merge")


### Base de dados 

head(dados_obitos)

### Conversão para inteiro

dados_obitos$COD_UF <- as.double(dados_obitos$COD_UF)
head(dados_obitos)

### População do Brasil em 2022

populacao_2022 <- readxl::read_xlsx(
  path = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\pop_2022.xlsx",
  sheet = "Tabela",
  range = "A5:I31",
  col_names = c("COD_UF","UF","Ano","pop_total","pop_branca","pop_preta","pop_amarela",
                "pop_parda","pop_indigena"),
  na = c("-")
)

head(populacao_2022)
populacao_2022$COD_UF <- as.double(populacao_2022$COD_UF)
head(populacao_2022)

taxa_mortalidade <- dplyr::inner_join(populacao_2022, 
                                      dados_obitos,
                                      by = c("COD_UF","UF" = "UF_NOME"))
head(taxa_mortalidade)

taxa_mortalidade <- taxa_mortalidade |>
  dplyr::mutate(taxa_total = (TOTAL/pop_total)*1000) |>
  dplyr::mutate(taxa_brancos = (BRANCA/pop_branca)*1000) |>
  dplyr::mutate(taxa_negros = (PRETA/pop_preta)*1000) |>
  dplyr::mutate(taxa_amarelos = (AMARELA/pop_amarela)*1000) |>
  dplyr::mutate(taxa_indigena = (INDIGENA/pop_indigena)*1000) |>
  dplyr::mutate(taxa_pardos = (PARDA/pop_parda)*1000)

head(taxa_mortalidade)
