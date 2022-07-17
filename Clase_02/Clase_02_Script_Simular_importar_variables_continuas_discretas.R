# -------------------------------------------------------------------------
# Clase 02 - Importar y simular variables aleatorias continuas y discretas
# Dr. José Gallardo y Dra. María Angélica Rueda Calderón
# 09 Julio 2022
# Curso Introducción al Análisis de datos con R para la Acuicultura.
# -------------------------------------------------------------------------

# Habilita paquetes para importar/exportar datos
library(xlsx)
library(readr)
library(readxl)

# Habilita paquetes para simular algunas variables aleatorias
library(Rlab)

# ¿Qué tipos de distribuciones hay en R?

help(Distributions)

# ¿Cómo importar datos datos a R? (Formatos .txt, .csv, .xlsx)

# Importa base de datos en formato .txt

datos_txt <- read.delim("/cloud/project/datos.txt")

# Importa base de datos en formato .csv

datos_csv <- read_csv("datos.csv")

# Importa base de datos en formato .xlsx

datos_xlsx <- read_excel("datos.xlsx")


# VARIABLES CUANTITATIVAS CONTINUAS
# Simular base de datos con variable aleatoria continua con distribución normal paso a paso
set.seed(1) #semilla para fijar resultados cada vez que se corre la simulación
Animal <- seq(1:100)
Talla <- rnorm(100, 77, 5)
Peso <- rnorm(100, 6078, 1190)
Sexo <- sample(c("Hembra","Macho"), size = 100, replace = TRUE)
datos <- data.frame(Animal, Talla, Peso, Sexo)

## Ejercicio: Individual
# Explore y grafique el objeto "datos" con summary(), hist(), boxplot()
# plot()


# VARIABLES CUANTITATIVAS DISCRETAS

# Simular variable tipo Bernoulli
# Simular un ensayo Bernoulli por ejemplo seleccionar un camarón con síndrome de mancha blanca
set.seed(1) # semilla para fijar resultados cada vez que se corre la simulación
rbern(1, 0.65)

# Simular 100 ensayos Bernoulli (muestras independientes)
set.seed(1)
rbern(100, 0.65)

# Simular variable que se distribuye Binomial
# Simular número de parásitos por pez
set.seed(1)
rbinom(100,8,0.5)

# Como gráficar la distribución de variable aleatoria discreta con distribución binomial (probabilidad de éxito p=0.5)
set.seed(1)
x <- 0:12
prob <- dbinom(x,12,0.5)
barplot(prob,col = "coral",ylim = c(0,0.3),names.arg=x, main="Distribución Binomial")

# Como gráficar la distribución de variable aleatoria discreta con distribución binomial (probabilidad de éxito p=0.8)
set.seed(1)
x <- 0:12
prob <- dbinom(x,12,0.8)
barplot(prob,col = "deepskyblue4",ylim = c(0,0.3),names.arg=x, main="Distribución Binomial")

# Como gráficar la distribución de variable aleatoria discreta con distribución binomial (probabilidad de éxito p=0.2)
set.seed(1)
x <- 0:12
prob <- dbinom(x,12,0.2)
barplot(prob,col = "darkolivegreen3",ylim = c(0,0.3),names.arg=x, main="Distribución Binomial")


# Simular base de datos con variable aleatoria discretas y variables categóricas paso a paso
set.seed(1)
Animal <- seq(1:100)
Madurez <- rbern(100, 0.65)
inf_caligus <- rbinom(100,8,0.6) 
Sexo <- sample(c("Hembra","Macho"), size = 100, replace = TRUE)
Nivel_cataratas <- sample(c("Alto","Medio","Bajo"), size = 100, replace = TRUE)

datos_all <- data.frame(Animal,Madurez, inf_caligus, Sexo, Nivel_cataratas)

# Exportar objeto datos_all en formato .txt, .csv y .xlsx

write.table(x = datos_all, file = "datos_new.txt", sep = "\t", row.names = FALSE, col.names = TRUE)

write.csv(x = datos_all, file = "datos_new.csv", row.names = FALSE)

write.xlsx(datos_all, "datos_new.xlsx", sheetName = "Base_datos", col.names = TRUE, row.names = FALSE)

## Ejercicio: En grupos
# Importa base de datos llamada datos_all.xlsx
# Observe las variables y defina cuales deben transformarse a factor Use as.factor()
# Luego de transformar explore con summary().
# Use table() para explorar las variables categóricas, intente una y dos variables la vez (ej. madurez y Sexo).
# Use barplot() para observar la información de parásitos (caligus). Debe crear objeto con tabla resumen de la variable antes de graficar.
