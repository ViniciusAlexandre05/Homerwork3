# Limpeza de dados (pré processamento)
library(palmerpenguins)
penguins <- na.omit(penguins)

# Define o nome do arquivo
pdf("Graficos/Grafico_1.pdf", width = 8, height = 6)

# Gráfico de dispersão
plot(penguins$body_mass_g, penguins$bill_length_mm,
     main = "Massa Corporal vs Comprimento do Bico",
     xlab = "Massa Corporal (g)",
     ylab = "Comprimento do Bico (mm)",
     pch = 19, col = "darkblue")

# Fecha o pdf
dev.off()