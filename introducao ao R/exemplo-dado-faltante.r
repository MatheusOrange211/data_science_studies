#em R, os valores faltantes sao representados por NA. Em um primeiro momento
#tentar representar a media de um conjunto de dados que contenham dados faltantes
#nao sera possivel. Para remover os dados faltantes, aplicamos na.rm = TRUE

d <- c(1,7,89,45,NA, 59)
mean(d, na.rm = TRUE)

# Verifica o conjunto de dados faltantes, usa-se Is.na(variavel)
is.na(d) #retorna false, false, false, true, false ...

#variancia em R
var(d,na.rm = TRUE)


#criando uma funcao propria em R - soma dos quadrados de 3 numeros

sumsofquares <- function(x, y, z){ #argumentos
  sumsq <- sum(c(x^2,y^2,z^2))   #potenciacao dos valores a 2, e soma
  return(sumsq) #retorno do resultado
}

sumsofquares(45,98,153)


