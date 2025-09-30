#Função que retorna o diretório atual de trabalho
getwd()
#Função que retorna um novo diretório de trabalho - modelo 1
setwd("C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R")
#Função que retorna um novo diretório de trabalho - modelo 2
setwd("C:/Users/orafa/OneDrive/Documents/Introdução ao R")

install.packages("readxl")
library(readxl)
### Exemplos de dados ###

a <- 2 ## Número inteiro
b <- 3.4 #Numero em ponto flutuante
c <- "Classe" #variável do tipo string
d <- "M" # Variável strig fator

## Exemplos de estruturas de dados ou objetos

## Vetor de inteiros
v1 <- c(1L, 52L, 25L, 75L, 78L)
print(v1); str(v1)

## Vetor de floats
v2 <- c(25.4, 85.4, 45, 96.785, 26)
print(v2); str(v2)

#Vetor de strings 
v3 <- c("Branco","Negros","Amarelo","Pardo","Indígena","Não Declarado")
print(v3); str(v3)

#Vetor de fatores
v4 <- c('M','F','M','F','M','M','F','F')
print(v4); str(v4)


### Exemplos de Matriz
m1 <- matrix(1:8)
print(m1); str(m1)

m2 <- matrix(1:8, nrow = 3, ncol =8 )
print(m2); str(m2)

# criando matriz por meio de vetores

vc1 <- c(1:6)
print(vc1); str(vc1)
vc2 <- c(7:12)
print(vc2); str(vc2)


mb1 <- rbind(vc1, vc2)
print(mb1); str(mb1)
mb2 <- cbind(vc1, vc2)
print(mb2); str(mb2)

print(mb1[1,1])

sexo <- c("M","F","M","F","M","F","M","F","M","F","F","M")
cor_raca <- c("BRANCO","PRETO","PARDO","BRANCO","PRETO","PARDO","BRANCO","PRETO","PARDO","BRANCO","PRETO","PARDO")

mb3<- rbind(sexo,cor_raca)
print(mb3); str(mb3)

mb4 <- cbind(sexo,cor_raca)
print(mb4); str(mb4)


pns <- readxl::read_xls(
  path = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\PNS_2019_Orientacao_Sexual_Autoidentificada_xls\\Tabela 1.4.2.xls",
  range = "A11:M43",
  col_names = c("GR e capitais", "total", "limite_inferior","limite_superior","total_heterossexual","limite_inferior",
                "limite_superior","total_homo_bi","limite_inferior","limite_superior","total_nr","limite_inferior","limite_superior")
)
save(pns, file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\dados_pns.RData")
load(file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\dados_pns.RData")
head(pns)




save(df,file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\dados_ficticios.RData")

dados_producao <- readr::read_delim(
  file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\tabela3940.csv",
  delim = ";",
  skip = 4,
  col_names = c("Tipo de Produto", "Unidade da Federação", "2013", "2014", "2015", 
                "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024"),
  col_types = "ccnnnnnnnnnnnn",
  na = c("-","...","..")
)

save(dados_producao,file = "C:\\Users\\orafa\\OneDrive\\Documents\\Introdução ao R\\dados_pesquisa_agricola_municipal.RData")
