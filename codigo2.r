### criando um dataframe com vetores
getwd()
setwd("C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R")
install.packages("readr")
library(readr)
idades <- c(25,26,27,22,23,24,30,35,36,40,44,48,37,36,32)
str(idades)
sexo <- c("M","F","F","M","M","F","M","F","F","F","F","M","M","F","F")
str(sexo)
cor_raca <- c("BRANCA","PRETO","PARDO","AMARELA","INDIGENA","BRANCA","PRETO","PARDO","AMARELA","INDIGENA",
             "BRANCA","PRETO","PARDO","AMARELA","INDIGENA")
str(cor_raca)
primeiro_dataframe <- data.frame(
  idades = idades,
  sexo = sexo,
  cor_raca = cor_raca
)
print(primeiro_dataframe); str(primeiro_dataframe)
segundo_dataframe <- data.frame(
  capitais = c("Cuiabá","Campo Grande","Goiânia","Brasília"),
  estados = c("Mato Grosso","Mato Grosso do Sul","Goiás","Distrito Federal"),
  populacao_2022 = c(3552,2797,7300,3130),
  populacao_2023 = c(3590,2824,7388,3168),
  populacao_2024 = c(3628,2851,7474,3204)
)
print(segundo_dataframe); str(segundo_dataframe)


dados <- readr::read_csv2(
  "C:/Users/orafa/OneDrive/Documents/Introdução ao R/microdados_censo_da_educacao_superior_2024/microdados_censo_da_educacao_superior_2024/dados/MICRODADOS_CADASTRO_CURSOS_2024.CSV"
)
save(dados, file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\MICRODADOS_CADASTRO_CURSOS_2024_EM_R.RData")


getwd()
setwd("C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R")

install.packages("readr")
library(readr)


populacao_2022 <- read.csv(file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela9605.csv")
head(populacao_2022)

tabela_3460 <- read.csv2("C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela3460.csv")
head(tabela_3460)


populacao_entre_censos <- readr::read_delim(
  file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela9756.csv",
  delim = ";",
  skip = 4,
  n_max = 202-4,
  col_names = c("Unidade da Federação","Cor_Raça","2010","2022"),
  col_types = "ccnn",
  na = c("-","..","...")
)


getwd()
setwd("C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R")

install.packages("readr")
library(readr)

dados <- readr::read_delim(
  file = "dados.txt",
  delim = "\t",
  col_names = c("nome", "idade", "cidade"),
  col_types = "cci",
  skip = 1
)

dados_pib <- readr::read_delim(
  file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela6784.tsv",
  delim = "\t",
  skip = 3,
  n_max = 8,
  col_names = c("UF","variavel","2018","2019","2020","2021","2022"),
  col_types = "ccnnnnn"
)

tabela_9600 <- readr::read_delim(
  file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela9600.tsv",
  delim = "\t",
  skip = 4,
  n_max = 268-4,
  col_names = c("UF","OBS1","OBS2","Total","ADM Pública","Entidades Empresariais","Entidades sem fins Lucrativos",
                "Sem Informação"),
  col_types = "cccnnnnn",
  na = c("-")
)


install.packages("readxl")
library(readxl)


dados <- readxl::read_xlsx(
  path = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabelas_2017_2018_xls\\Tabela 9b.xlsx",
  sheet = "Tabela 9b",
  range = "A6:I33",
  col_names = c("UF","Proporção","IPM-CR","moradia","Serviços Públicos","Saúde e Alimentação","Educação",
                "Serviços Financeiros","Transporte e Lazer"),
  
  na = c("-")
)

tabela_6750 <-  readxl::read_xlsx(
  path = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela6750.xlsx",
  sheet = "Tabela",
  range = "A5:E1390",
  col_names = c("UF","caracteristicas","variavel","cor ou raça", "total"),
  na = c("-")
)



















