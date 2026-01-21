# Código do item 1 para aquisição das amostras pré processadas
source("1.R")

# Código do item 2 para aquisição do modelo com lm()
source("2.R")

# Define o nome do arquivo
pdf("Graficos/Grafico_4.pdf", width = 8, height = 6)

# Copia do dataset para adição da amostra fabricada
penguins_outlier <- penguins

# Introdução da amostra fabricada
penguins_outlier$body_mass_g[1] <- 10000

# Novo modelo linear considerando outlier
modelo_outlier <- lm(bill_length_mm ~ body_mass_g, data = penguins_outlier)

# Métricas para comparação
residuos_out <- residuals(modelo_outlier)
rmse_out <- sqrt(mean(residuos_out^2))
r2_out <- summary(modelo_outlier)$r.squared

# Visualização
plot(penguins_outlier$body_mass_g, penguins_outlier$bill_length_mm,
     main = "Impacto de Outlier na Regressão",
     xlab = "Massa Corporal (g)", ylab = "Comprimento do Bico (mm)",
     pch = 19, col = "darkblue")

# Reta original do modelo e Reta com Outlier
abline(modelo, col = "blue", lwd = 2, lty = 2)
abline(modelo_outlier, col = "red", lwd = 2)

legend("bottomright", legend=c("Original", "Com Outlier"), col=c("blue", "red"), lty=c(2, 1), lwd=2)