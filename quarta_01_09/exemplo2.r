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


dados_rebanho <- readxl::read_xlsx(
  path = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela3939.xlsx",
  sheet = "Tabela",
  range = "A4:N234",
  col_names = c("variavel","cod_ibge","UF","Ano","bovino","bubalino","equino",
                "Suíno - total",	"Suíno - matrizes de suínos",
                "Caprino",	"Ovino",	"Galináceos - total",	"Galináceos - galinhas",
                "Codornas"
  ),
  na = c("-","...","..")
)
dados_rebanho <- dados_rebanho |>
  fill(variavel,cod_ibge, UF,.direction = "down")
head(dados_rebanho)
#seleção das colunas 
dados_rebanho_ovinos <- dados_rebanho |>
  dplyr::select(cod_ibge,UF,Ano,Ovino)

#Conversão em tabelas do tipo larga - variavel ano

dados_rebanho_ovinos_wider <-   tidyr::pivot_wider(dados_rebanho_ovinos,
                                                   names_from = "Ano",
                                                   values_from = "Ovino")
summary(dados_rebanho_ovinos_wider)

dados_rebanho_bovino_bubalino <- dados_rebanho |>
  dplyr::select(cod_ibge,UF,Ano,bovino,bubalino)
dados_rebanho_bovino_bubalino_wider <- tidyr::pivot_wider(
  dados_rebanho_bovino_bubalino,
  names_from = "Ano",
  values_from = c("bovino","bubalino")
)
