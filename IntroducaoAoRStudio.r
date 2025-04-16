# Atribuição de valores e visualização
x <- 10
x
y = 15
y

# Tipos de objetos
## Vetores
x1 <- c(1, 3, 6) # Função "c" de concatenar
x1
x1[2] # Seleciona a posição em colchetes
x1[2] <- 10 # Realiza uma troca de valor na posição entre colchetes
x1

# Realizar sequências
x2 <- seq(0, 1, by=0.1) # Faz sequência de 0 a 1 com passo de 0.1
x2
help(seq) # Ajuda em determinada função

# Função de repetição
x3 <- rep(2,5) # Repete 5 vezes o valor 2
x3
?rep # Outra forma de chamar a função de ajuda

# Matrizes
m1 <- matrix(1:9, byrow = F, nrow = 3) # "byrow" determina se o preenchimento é por linha (T) ou por coluna (F)
m1
m2 <- matrix(1:9, byrow = T, nrow = 3)
m2
m3 <- diag(3) # Matriz de tamanho 3x3 diagonal
m3
a <- c(4, 6, 8, 2, 10, 12, 18, 14, 6, 8, 12, 14)
m4 <- matrix(a, nrow = 4, ncol = 3, byrow = T)
m4

# Operações com Matrizes
m1*m2 # Multiplicação termo a termo
(m1)%*%(m2) # Multiplicação de matrizes

# Verificar endereço atual de trabalho
getwd()

# Lendo dados de um arquivo de texto
# header = T: A primeira linha contém os nomes das colunas da tabela
# Em read.csv2(), o default é:
# Separador de colunas = ";" e separador de casas decimais = ","

dados <- read.csv2("/home/joao.zampoli/Downloads/Tabela_Questionario_Aula.csv")
dados

# Informação resumida
summary(dados)

# Mostra o cabeçalho
names(dados)

# Distribuição de frequências - variável qualitativa
# Imprime na tela a coluna deste cabeçalho
dados$est_civil
dados$idade_ano

# Frequência Absoluta
fa <- table(dados$est_civil)
fa

# Frequência Relativa
fr <- prop.table(fa)
fr

# round: deixar o número racional com 2 casas decimais
fr <- round(fr,2)
fr

# Frequência Acumulada
fac <- cumsum(fr)
fac

# Montando a tabela (cbind organiza por colunas e rbind por linhas)
Tabela <- cbind(fa, fr, fac, porcent=100*fr)
Tabela

