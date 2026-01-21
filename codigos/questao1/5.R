# Dados da amostra
dados <- c(0.99, 2.31, 10.85, 6.15, 10.81, 3.72, 5.75, 4.15, 9.27, 7.84,
           2.31, 10.85, 6.15, 1.81, 3.72, 5.75, 10.40, 10.04, 4.15, 9.27)

# Calculo do Lambda 
# O MLE de lambda para a exponencial e 1 / media
lambda_mle <- 1 / mean(dados)


# Item (a) Tempo medio de vida estimado
tempo_medio <- mean(dados) # Assim como definido na fundamentacao

tempo_medio # Apresenta o valor

# Item (b) P(X > 5) com a funcao de distribuiccao acumulada pexp
# lower.tail = FALSE calcula diretamente a probabilidade de ser MAIOR que 5
prob <- pexp(5, rate = lambda_mle, lower.tail = FALSE) 

prob # Apresenta o valor
