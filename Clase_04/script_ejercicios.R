# ----------------------------------------------------------
# Clase 04 - Script ejercicios para manipulación de datos con tidyr y dplyr
# Dr. José Gallardo Matus
# 12 julio 2022
# Introducción al Análisis de datos con R para la Acuicultura..
# ----------------------------------------------------------

# Habilite librerías
library(readxl) # Para importar datos a R

library(dplyr) # Para manipular datos

library(ggplot2) # Para hacer gráficos

library(tidyr) # Para manipular datos

# EJERCICIO 1
# a) Importe la hoja 3 del set de datos Parasitos a R.
# b) Agrupe por Especie su objeto ordenado de parásitos y calcule n, promedio y desviación estándar.

# EJERCICIO 2
# a) Usando mutate() genere UNA variable derivada llamada log_par con el logaritmo del número de parásitos+1.
# b) Usando mutate() genere una variable derivada llamada log_peso con el logaritmo del peso.
# c) Realice un gráfico de puntos para visualizar la relación entre el log+1 de parásitos en función del logaritmo del peso.