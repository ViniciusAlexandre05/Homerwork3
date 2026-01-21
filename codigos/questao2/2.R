source("1.R")

# Define o nome do arquivo
pdf("Graficos/Grafico_2.pdf", width = 8, height = 6)

# Definição das variáveis
x <- penguins$body_mass_g
y <- penguins$bill_length_mm

# Cálculo manual dos parâmetros
beta1_manual <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)
beta0_manual <- mean(y) - beta1_manual * mean(x)

# Ajuste do modelo com o comando lm()
modelo <- lm(bill_length_mm ~ body_mass_g, data = penguins)

# Gráfico de dispersão
    plot(penguins$body_mass_g, penguins$bill_length_mm,
        main = "Massa Corporal vs Comprimento do Bico",
        xlab = "Massa Corporal (g)",
        ylab = "Comprimento do Bico (mm)",
        pch = 19, col = "darkblue")

# Adição da reta de regressão ao gráfico
abline(modelo, col = "red", lwd = 2)

# Para comparação
coefs_R <- coef(modelo)

# Print
cat("Manual:\n", "Coeficiente Angular -> ", beta1_manual,"\nIntercepto -> ", beta0_manual);
cat("Valores Calculados pelo R:\n", "Coeficiente Angular -> ", coefs_R[2], "\n", "Intercepto -> ", coefs_R[1], "\n")

# Fecha o pdf
dev.off()