# --------------------------------------------------------------
# Clase 09 - Script Regresión Logística
# Dr. José Gallardo Matus & Dra. Angélica Rueda Calderón
# 30 julio 2022
# Introducción al Análisis de datos con R para la Acuicultura.
# --------------------------------------------------------------

# Habilitar librerías
library(readxl)
library(ggplot2)
library(car)
library(lmtest)
library(dplyr)
library(ggpmisc)
library(kableExtra)

# Importa base de datos
maduracion <- read_excel("Maturation.xlsx")

# Generar una base de datos con las variables de interes
maduracion <- maduracion%>% 
  select("Fish","Genotype","Gonad","Maturation")

# Calcula las medidas resumen de cada variable de la base de datos
summary(maduracion)

# Tema para agrandar tamaño de letra en los ejes del gráfico

My_Theme = theme(
  axis.title.x = element_text(size = 20),
  axis.text.x = element_text(size = 20),
  axis.title.y = element_text(size = 20),
  axis.text.y = element_text(size = 20))

# Ajusta el modelo de regresión logística simple
mod_logit <- glm(Maturation ~ Gonad, 
                 family= binomial, data = maduracion)

# Da el resumen del modelo ajustado
summary(mod_logit)

# Hace diagrama de dispersión con recta de ajuste logístico.

r <- ggplot(data = maduracion, aes(x = Gonad, y = Maturation)) +
  geom_point(aes(color = as.factor(Maturation)), shape = 1) + 
  theme(axis.text.x = element_text(size = 10,face="bold",colour="black"))+
  theme(axis.text.y = element_text(size = 10,face="bold",colour="black"))+
  stat_function(fun = function(x){predict(mod_logit,
                                          newdata = data.frame(Gonad = x),
                                          type = "response")}) +
  theme_bw() +
  labs(title = "Regresión logística", x="Peso de gónada",
       y = "Probabilidad de Maduración") +
  theme(legend.position = "none")+
  theme(panel.border=element_blank(), axis.line=element_line())
r+My_Theme

#Predecir si un salmón madura o no para un peso de gónada de 4
Prob.mad_4 <- data.frame(Gonad=4)
Prediccion_logis_4 <- predict(mod_logit, Prob.mad_4, type = "response")
Prediccion_logis_4 <- data.frame(Prediccion_logis_4)
colnames(Prediccion_logis_4) <- c("Probabilidad de maduración")
Prediccion_logis_4

#Predecir si un salmón madura o no para un peso de gónada de 8
Prob.mad_8 <- data.frame(Gonad=8)
Prediccion_logis_8 <- predict(mod_logit, Prob.mad_8, type = "response")
Prediccion_logis_8 <- data.frame(Prediccion_logis_8)
colnames(Prediccion_logis_8) <- c("Probabilidad de maduración")
Prediccion_logis_8

# Para mostrar las predicciones en formato tabla
Peso_Gonada <- c(4,8)
tabla1 <- rbind(Prediccion_logis_4,Prediccion_logis_8)
tabla <- data.frame(Peso_Gonada,tabla1)
colnames(tabla) <- c("Peso de Gónada", "Predicción")
rownames(tabla) <- NULL
kbl(tabla,align='cccc',
    linesep=c("","","","","",""), 
    caption = "Predicciones de maduración según el peso de la gónada.")

# Calcular el cociente de chances de la regresión logística
OR_def <-exp(cbind(OR = coef(mod_logit), 
                   confint(mod_logit)))

OR_def %>% kable(digits = 3)
