# ----------------------------------------------------------
# Clase 05 - Script Solución ejercicios para manipulación de datos con tidyr y dplyr
# Dr. José Gallardo Matus
# 19 abril 2022
# Diplomado en Análisis de datos con R para la Acuicultura..
# ----------------------------------------------------------

# Habilite librerías
library(readxl) # Para importar datos a R

library(dplyr) # Para manipular datos

library(ggplot2) # Para hacer gráficos

library(tidyr) # Para manipular datos

# EJERCICIO 1
# a) Importe la hoja 1 del set de datos Parasitos a R.
Tidy_Parasitos <-read_excel("Parasitos.xlsx",sheet = 3, na="NA")

# b) Agrupe por Especie su objeto ordenado de parásitos y calcule n, promedio y desviación estándar.

Mean_sd_par<-Tidy_Parasitos %>% group_by(Especie) %>% 
  summarize(N = n(), 
            Promedio_Parasitos = mean(Parasitos, na.rm=T), 
            SD_Parasitos = sd(Parasitos, na.rm=T))
Mean_sd_par

# EJERCICIO 2
# a) Usando mutate() genere UNA variable derivada llamada log_par con el logaritmo del número de parásitos+1.
# b) Usando mutate() genere una variable derivada llamada log_peso con el logaritmo del peso.

tidy_all<-read_excel("Parasitos.xlsx",sheet = "tidy",na="NA")
tidy_all
Tidy_All<-tidy_all %>% mutate(log_par = log10(Parasitos+1)) %>% mutate(log_peso = log10(Peso))

# c) Realice un gráfico de puntos para visualizar la relación entre el log+1 de parásitos en función del logaritmo del peso.

ggplot(Tidy_All, aes(x=log_peso, y=log_par, color=Sexo))+
  geom_point(size=2)+
  labs(x= "Log(10) Peso(g)", y= "Log(10) Número de parásitos")+
  theme_gray()

