# ----------------------------------------------------------
# Clase 05 - Script ejercicios de inferencia estadística
# Su nombre
# fecha
# Introducción al Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# LIBRERÍAS
library(UsingR)
library(ggplot2)
library(dplyr)
library(knitr)

# ESTUDIO DE CASO: RELACIÓN PADRES - HIJOS

head(father.son) # Exploramos

#  Ejercicio 1: 
# Realice una prueba de correlación para evaluar la siguiente hipótesis
# H0: r padres - hijos > 0 use alternative ="g".

#  Ejercicio 2: 
# Realice una prueba de correlación para evaluar la siguiente hipótesis
# H0: r padres - hijos < 0 use alternative ="l".


# ESTUDIO DE CASO: COMPARACIÓN TAMAÑO ENTRE SEXOS
# Simularemos 2 variables

Sexo <- rep(c("Male", "Female"), each=10)
Peso <- c(rnorm(10, 180, 10),rnorm(10, 140, 10))
animal <- data.frame(Sexo, Peso)

#  Ejercicio 3: Compare con H1: female > male usando alternative ="g".
# Realice una prueba de comparación de medias para evaluar la siguiente hipótesis
# female > male usando alternative ="g".


# Ejercicio 4: Compare con H1: female > male usando alternative ="g".
# Realice una prueba de comparación de medias para evaluar la siguiente hipótesis
# female < male usando alternative ="l".

# ESTUDIO DE CASO: FILETE EN PORCIONES

# Ejercicio 5
# Para una muestra aleatoria de 30 porciones con media igual a 805
set.seed(10)
filete <- rnorm(30,805) 

# Realice una prueba de t de 1 muestra.
# demuestre que las porciones son distintas de la media esperada de 800
Media <- 800

# Ejercicio 6
# Para una muestra aleatoria de 30 porciones con media igual a 800.1
set.seed(10)
filete <- rnorm(30,800.1) 

# Realice una prueba de t de 1 muestra.
# demuestre que las porciones NO son distintas de la media esperada de 800
Media <- 800




