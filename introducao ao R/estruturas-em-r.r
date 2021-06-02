#Vetores
x <- c("Maria", "Karol","Valentina")
y <- c(1,5,9)

#vetor logico, onde T (true) e F (False) funcionam como abreviacoes
z <- c(T,F,T,F,T,F,T)


#criar uma sequencia de 10 a 30
y <- seq(10, 30) # ou y <- seq(10,30,2) pulando de 2 em 2

#para criar um vetor de valores repetidos, use o rep
repetidos <- c(2,3,5)
repetidos <- rep(repetidos,5) #repita 5 vezes
repetidos

#posso combinar o segundo argumento com outro vetor. Assim com (1,4,7)
#eu posso repetir o primeiro valor uma vez, o segundo 4x, e o terceiro 7x
x <- c(1,4,7)
repetidos2 <- c(1,0,2)
repetidos <- rep(repetidos2,times = x)
repetidos

#MATRIZES

num_matrix <- seq(5,100,5)
dim(num_matrix) <- c(5,4)  #transformando o vetor em uma matrix 5x4
num_matrix
t(num_matrix)    #transpor a matriz


#outra maneira de criar uma matriz (admito que eh ruim de lembrar)
num_matrix2 <- matrix(seq(5,100,5), nrow=5)
num_matrix2

#com o argumento byrow = T, o R preenche a matriz por linhas
num_matrix3 <- matrix(seq(5,100,5), nrow = 5, byrow = T)
num_matrix3

num_matrix3[5,4]


#FATORES

#Fator é o termo usado no R para uma variavel nominal(ou variavel categorica)

#nesse exemplo, cada valor representa um tipo de cor de olho
eye_color <- c(2,2,4,1,5,5,5,6,1,3,6,3,1,4)

#transformando eye_color em uma fator
feye_color <- factor(eye_color)

#atribuindo niveis ao fator
levels(feye_color) <- c("amber", "blue", "brown", "gray", "green", "hazel")

feye_color



#LISTAS

#listas sao uma colecao de objetos que nao sao necessariamente do mesmo tipo

empathy_score <- c(15,21,45,32,61,74,53,92,83,22,67,55,42,44)

eyes_and_empathy <- list(eyes_code = eye_color, eyes = feye_color,
                         empathy = empathy_score)


#imprimindo cada componente da lista
eyes_and_empathy$eyes_code



#DATAFRAMES

e <- data.frame(eye_color, feye_color, empathy_score)
e
edit(e) #abre uma janela na qual posso editar os dados igual um excel


#nossa missao agora eh verificar a media das pontuacoes de empatia para pessoas
#com olhos azuis em comparacao com pessoas com olhos verdes e com olhos  cor de mel

#extraimos as pontuacoes de empatia para cada cor de olho e criamos vetores
e.blue <- e$empathy_score[e$feye_color == "blue"]
e.green <- e$empathy_score[e$feye_color == "green"]
e.hazel <- e$empathy_score[e$feye_color== "hazel"]

#vetor de medias
e.averages <- c(mean(e.blue), mean(e.green), mean(e.hazel))

#usamos agora o length() para criar um vetor do numero de pontuacoes em 
#cada grupo de cor de olho
e.amounts <- c(length(e.blue), length(e.green),length(e.hazel))

#vetor de cores
colors<- c("blue", "green","hazel")


#criando o dataframe e juntando tudo (criando suas colunas e seus nomes)
e.averages.frame <- data.frame(color = colors, average = e.averages,
                               n = e.amounts)

e.averages.frame


#MANIPULANDO DATAFRAMES DO R
#instalando o pacote MASS temos acesso ao dataframe

#Ele contém dados de peso
#de 72 jovens mulheres que são pacientes com anorexia. Cada paciente fez um
#dos três tipos de terapia.Usando o edit posso ver o dataframe como se fosse um excel


edit(anorexia)
# vendo a diferenca de pesos com as colunas prewt(peso antes) e postwt(peso depois)
anorexia$Postwt-anorexia$Prewt

#test-t (teste t de Student - teste de hipotese)
#usa conceitos estatísticos para rejeitar ou não uma hipótese nula quando a
#estatística de teste (t ) segue uma distribuição t de Student
t.test(anorexia$Postwt-anorexia$Prewt, mu = 0)





#o que temos em R é o uso do til (~) que funciona para o estudo e manipu-
#lamento das variavaveis dependentes e independentes. Um exemplo de funcao
#em R de como isso funciona

#function(dependent_var ~ independent_var, data = data_frame)

#leia-se "~" como "eh dependente de"

#podemos aplicar um exemplo com o dataframe. Para analisar a eficacia das 3
#terapias de anorexia, usaremos a ANALISE DE VARIANCIA. pra isso, usamos
#a funcao aov()
aov(anorexia$Postwt-anorexia$Prewt ~ anorexia$Treat, data = anorexia)






#LENDO E ESCREVENDO

#para ler um arquivo: read.<format>("file name", arg1, arg2...)
#para escrever um arquivo: write.<format>(dataframe, "filename", arg1,arg2...)


#PLANILHAS

#precisamos baixar o pacote xlsx
#pra chamar -> variavel <- read.xlsx("caminho", sheetName="sheet1")

#para escrever em uma planilha: write.xlsx(anorexia, "camninho pra salvar")
install.packages("xlsx")
library("xlsx")
#write.xlsx(anorexia,"C:/Users/Usuario/Documents/matheus/linguagem r/anorexia.xlsx")


#ARQUIVOS CSV
#read.csv("caminho")


#ARQUIVOS DE TEXTO

#read.table("caminho", header=TRUE)
# header= TRUE -> a primeira linha do arquivo contem os cabecalhos das colunas
#para escrever, use write.table(anorexia, "caminho", quote = FALSE , sep ="\t")
#quotes false garante que nao aparecam aspas e o sep delimita as tabulacoes
write.table(anorexia, "C:/Users/Usuario/Documents/matheus/linguagem r/anorexia.txt"
            , quote=FALSE, sep="\t")

