source("2.R")

# Define o nome do arquivo
pdf("Graficos/Grafico_3.pdf", width = 8, height = 6)

# Cálculo dos resíduos
residuos <- residuals(modelo)

# Representação gráfica dos resíduos
plot(predict(modelo), residuos,
    main = "Gráfico de Resíduos",
    xlab = "Valores Preditos (mm)",
    ylab = "Resíduos (mm)",
    pch = 19, col = "darkgreen")

# Referência do 0
abline(h = 0, col = "red", lty = 2)

# Cálculo do RMSE (Raiz do Erro Quadrático Médio)
rmse <- sqrt(mean(residuos^2))

# Coeficiente de determinação R2
r_quadrado <- summary(modelo)$r.squared

# Print
cat("RMSE:", rmse, "\nR2:", r_quadrado)

# Fecha o pdf
dev.off()