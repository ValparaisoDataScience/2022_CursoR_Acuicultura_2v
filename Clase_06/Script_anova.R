# ----------------------------------------------------------
# Clase 06 - Script Anova y posteriores
# Dr. José Gallardo Matus
# 23 julio 2022
# Introducción al Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# ESTUDIO DE CASO: TRUCHA ARCOIRIS

# Importa datos
my_data <- read_csv("truchas_cepas.csv", 
                          col_types = cols(Dieta = col_factor(levels = c("Dieta 1", "Dieta 2", "Dieta 3"))))

# Tabla de freuencia
table(my_data$Dieta)

# Realiza gráfica ggplot2
ggplot(my_data, aes(x=Dieta,y=Peso,fill=Dieta))+
  geom_boxplot()+
  theme(legend.position="none")+
  labs(x="Dietas",y="Peso (g)")


# ANOVA DE UNA VÍA
res.aov <- lm(Peso ~ Dieta, data = my_data)
anova(res.aov)

# COMPARACIONES MULTIPLES
fit_anova <- aov(res.aov)
tk <- TukeyHSD(fit_anova)


# ESTUDIO DE CASO: TILAPIA

# Importa datos
my_data1 <- read_csv("tilapia_interacion.csv", 
                     col_types = cols(Salinidad = col_factor(levels = c("Agua de mar", "Agua dulce")), 
                                      Temperatura = col_factor(levels = c("25","30","35"))))

my_data1

# Tabla de freuencia
table(my_data1$Salinidad, my_data1$Temperatura)

# Realiza gráfica ggplot2
my_data1%>% 
  ggplot(aes(x=Temperatura,y=Peso,fill=Salinidad))+
  geom_boxplot()+
  labs(x="Temperatura",y="Peso (g)")+
  scale_x_discrete(labels = c('25ºC','30ºC','35ºC'))

# ANOVA DE DOS VÍAS
res.aov2 <- lm(Peso ~ Temperatura * Salinidad,
      data = my_data1)
anova(res.aov2)
