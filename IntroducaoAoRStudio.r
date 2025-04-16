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

# Distribuição de frequências - Variável quantitativa discreta
# Frequência absoluta
fa <- table(dados$filhos)
fa

# Frequência Relativa
fr <- prop.table(fa)
fr

# round: Deixando o número racional com 2 casas decimais
fr <- round(fr, 2)
fr

# Frequência Acumulada
fac <- cumsum(fr)
fac

# Montando a tabela (cbind organiza por colunas e rbind por linhas)
Tabela <- cbind(fa, fr, fac, porcent=100*fr)
Tabela

# Agora fazendo o mesmo com Salário
# Frequência Absoluta
fa <- table(dados$salario)
fa

# Frequência Relativa
fr <- prop.table(fa)
fr

# round: Arredonda o número para 2 casas decimais
fr <- round(fr,2)
fr

# Frequência Acumulada
fac <- cumsum(fr)
fac

# Montando a tabela com os dados
Tabela <- cbind(fa, fr, fac, porcent = 100*fr)
Tabela

# Os dados ficam muito separados, é necessário realizar tratamento de dados
# Distribuição de frequẽncia - Variável quantitativa contínua (CLASSES)
range(dados$salario)
nclass.Sturges(dados$salario)
# cut: divide a variável nos intervalos especificados
# l = 7: fornece 6 intervalos
# Frequência Absoluta
fa <- table(cut(dados$salario, seq(4, 23.30, l = 7)))
fa
fa <- table(cut(dados$salario, seq(3.9, 23.30, l = 7))) # 3.9 é necessário pois ele não contará o salário = 4 se a sequência começar exatamente em 4
fa
# Frequência relativa
fr <- prop.table(fa)
fr

# round: deixando o número racional com 2 casas decimais
fr <- round(fr, 2)
fr

fac <- cumsum(fr)
fac

Tabela <- cbind(fa, fr, fac)
Tabela

# Tabelas de Contingência
cont <- table(dados$est_civil, dados$instrucao)
cont

# Gráfico em Barras (lembrando que table é contagem: fabs)
par(mfrow = c(1,2)) # janela de plot multipainel (1 linha e 2 colunas)
barplot(table(dados$filhos), main = "Número de Filhos")
barplot(table(dados$filhos), main = "Número de Filhos", col = "red")

# Gráfico de Pizza
par(mfrow = c(1,2))
pie(table(dados$instrucao), main="Instrução")
pie(table(dados$procedencia), main="Procedência")

# Histograma
par(mfrow = c(1,3))
hist(dados$salario)
hist(dados$salario, nclass = 5)
hist(dados$salario, nclass = 5, col = "blue", main = "Salário", freq=F) 
# Freq = F: Coloca a densidade ao invés da quantidade de frequência do Histograma

# BoxPlots
par(mfrow = c(1,3))
boxplot(dados$salario, main = "Salário")
boxplot(dados$idade_ano, main = "Idade")
boxplot(dados$filhos, main = "Filhos")

# Medidas - Resumo
mean(dados$salario)
median(dados$salario)
quantile(dados$salario)
var(dados$salario)
sd(dados$salario)
IQR(dados$salario)
summary(dados$salario)
