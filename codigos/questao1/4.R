dados <- c(0.99, 2.31, 10.85, 6.15, 10.81, 3.72, 5.75, 4.15, 9.27, 7.84,
           2.31, 10.85, 6.15, 1.81, 3.72, 5.75, 10.40, 10.04, 4.15, 9.27)

# Definir parametros basicos
n <- length(dados) # Tamanho da amostra
soma_x <- sum(dados) # Total da soma
lambda_hat <- n / soma_x  # Valor do MLE calculado no item 3

# Definir a funcao de Log-Verossimilhanca
log_verossimilhanca <- function(l) {
  return(n * log(l) - l * soma_x)
}

# Intervalo de valores para lambda ao redor do MLE para o grafico
vetor_lambda <- seq(0.01, 0.4, length.out = 1000)
valores_log_v <- log_verossimilhanca(vetor_lambda)

# Construir o grafico
plot(vetor_lambda, valores_log_v, type = "l", col = "blue", lwd = 2,
     xlab = expression(lambda), ylab = expression(ell(lambda)))

# Indicar o valor do MLE no grafico
abline(v = lambda_hat, col = "red", lty = 2) # Linha vertical no MLE
points(lambda_hat, log_verossimilhanca(lambda_hat), col = "red", pch = 19) # Ponto no topo

# Adicionar legenda
legend("bottomright", legend = c(expression(ell(lambda)), paste("MLE: ", round(lambda_hat, 4))),
       col = c("blue", "red"), lty = c(1, 2), pch = c(NA, 19))