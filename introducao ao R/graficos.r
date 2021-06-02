#Usaremos o dataframe Cars93 da biblioteca MASS
edit(Cars93)


#histograma
hist(Cars93$Price)
xlab = "Price (x $1,000)"
xlim = c(0,70)

main = "Price of 93 Models of 1993 Cars"

#HISTOGRAMA
#com probability igual a True, podemos mostrar as densidades ou melhor as
#probabilidades de cada barra em vez de ser apenas um quantitativo. Com break, 
#mudamos algumas caracteristicas da quantidade de barras e com o a aplicacao de
#das linhas de densidade aplicadas a coluna da qual estou analisando, podemos 
#visualizar melhor a distribuicao das informacoes que nos lembram quase uma 
#distribuicao de sino a esquerda (assimetrica)

hist(Cars93$Price, xlab = xlab, xlim = c(0,70), ylim = c(0,0.1),
     main = main,breaks = 12, probability = TRUE,
     col = c("blue", "red", "gray", "green","orange","purple"))

lines(density(Cars93$Price))


#GRAFICO DE BARRAS

barplot(table(Cars93$Type),main = "Tipos de Carros mais comuns em 93",
        ylim= c(0,25), xlab = "Tipos de carro", ylab= "Frequência",
        axis.lty = "solid", space = 0.05)

#GRAFICO DE PIZZA

pie(table(Cars93$Type))



#GRAFICO DE PONTOS
#nele a variavel independente esta no eixo y e nao no X.
dotchart(table(Cars93$Type), main = "Grafico de Pontos - Tipos de Carro",
         ylab = "Tipo", xlab="Frequência")

help("dotchart")



#GRAFICO DE BARRAS AGRUPADAS
#para esse grafico, vamos usar dadso do Departamento de Comercio dos EUA
#com um resumo das receitas do espaco comercial no inicio dos anos 90

rev.values <- c(1000,1300,1300,1100,1400,800,1200,1500,1850,
                2330,860,1300,1400,1600,1970,570,380,450,465,580,
                155,190,210,250,300)

#informando quantas linhas ou colunas, a matriz tera e quais os valores
# carregar na matriz linha a linha

space.rev <- matrix(rev.values, nrow = 5, byrow = T)
space.rev

#fornecendo nome as colunas e linhas da matriz

colnames(space.rev) <-c("1990","1991","1992","1993","1994")
rownames(space.rev)<- c("Commercial Satellites Delivered",
"Satellite Services","Satellite Ground Equipment",
"Commercial Launches","Remote Sensing Data")

space.rev

color.names = c("#1B9E77", "#D95F02", "#7570B3", "#E7298A","#66A61E" )

barplot(space.rev, beside = T, xlab = "Year", ylab = "Revenue(X $1000)",
        col = color.names, ylim = c(0,3000), axis.lty = "solid",
        main = "Receitas do Espaço Comercial nos EUA 1990-
1994 (Em Milhões de Dólares)")

#adicionando a legenda agora, onde os primeiros valores sao para
# a posicao, rownames selecionando a tabela e pegando os rotulos
#cex usado para determinar tamanho dos caracteres no texto
#bty = "n" nao cria uma caixa ao redor das legendas, mas com "o" podemos por
legend(1,2300, rownames(space.rev), cex = 0.7, fill = color.names,
       bty = "n")


#DIAGRAMA DE DISPERSAO

#Para visualizar o relacionamento entre potência e MPG (km/l) para dirigir na
#cidade

plot(Cars93$Horsepower, Cars93$MPG.city, xlab = "HORSEPOWER",
     ylab = "MPG CITY", main = "MPG CITY VS HORSEPOWER")

#outra forma de fazer isso eh usando a dependencia (~)
plot(Cars93$MPG.city ~ Cars93$Horsepower,
     xlab="Horsepower",ylab="MPG City",
     main ="MPG City vs
      Horsepower", pch = 16, col = color.names)


#MATRIZ DO DIAGRAMA DE DISPERSÃO

#podemos visualizar relacionamentos entre mais de duas variaveis
#na diagonal temos os relacionamentos entre as mesmas variaveis  duas 
#vezes.

car.subset <- subset(Cars93, select = c(MPG.city, Price, Horsepower))

head(car.subset)


pairs(car.subset, col = c("red", "blue"), pch = 16, 
      main = "MATRIZ DO DIAGRAMA DE DISPERSÃO")




#DIAGRAMA DE CAIXA

#usaremos agora para mostrar que HorsePower eh a variavel dependente e
#Cylinders eh a variavel independente
boxplot(Cars93$Horsepower ~ Cars93$Cylinders, xlab = "Cylinders",
        ylab = "HorsePower", main = "Dispersão de HorsePower por Cylinders")


#outra forma de fazer
boxplot(data = Cars93, Horsepower ~ Cylinders, xlab = "Cylinders",
        ylab = "HorsePower", main = "Dispersão de HorsePower por Cylinders")




