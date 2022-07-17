# ----------------------------------------------------------
# Clase 04 - Script Manipulación de datos con tidyr y dplyr
# Dr. José Gallardo Matus, Dra. María Angélica Rueda, Ing. Carlos Gutierrez
# 12 julio 2022
# Introducción al Análisis de datos con R para la Acuicultura..
# ----------------------------------------------------------

# Habilita librerías
library(readxl) # Para importar datos a R

library(tidyr) # Para manipular datos

library(dplyr) # Para manipular datos

library(ggplot2) # Para hacer gráficos

# LIBRERÍA TIDYR: EL OPERADOR PIPE (TUBERÍA).

# tidyr usa el operador pipe %>% como una tubería para enlazar un data.frame con una o más funciones.

x <- rnorm(5)
y <- rnorm(5)
dat <- data.frame(x,y)
dat
max(dat) 
dat %>% max
dat %>% arrange(y) # Ordena filas de un data.frame por el valor de alguna columna


# LIBRERÍA DPLYR: MANIPULAR DATOS

# Importar datos dity
tidy_data <- read_excel("Peces.xlsx", sheet = 3)

# FUNCIÓN SELECT()
# Permite extraer o seleccionar variables/columnas específicas de un data.frame.
select(tidy_data, Especie, Sexo)

# FUNCIÓN SELECT() CON PIPE
tidy_data %>% select(Especie, Sexo)

# FUNCIÓN FILTER() CON PIPE
# **filter()**: Para filtrar desde una tabla de datos un subconjunto de filas.
# Ej. solo un nivel de de un factor, observaciones que cumplen algún criterio (ej. > 20).
tidy_data %>% filter(Sexo == "Macho")

# MÚLTIPLES FUNCIONES Y TUBERÍAS
tidy_data %>% select(Especie, Sexo, Peso) %>% 
  filter(Sexo == "Macho")

# FUNCIÓN SUMMARIZE()
tidy_data %>% select(Especie, Sexo, Peso) %>% 
          summarize(n = n(), 
                    Promedio_Peso = mean(Peso), 
                    Maximo_Peso = max(Peso))

# FUNCIÓN SUMMARIZE() removiendo NA
tidy_data %>% select(Especie, Sexo, Peso) %>% 
  summarize(n = n(), 
            Promedio_Peso = mean(Peso, na.rm=T), 
            Maximo_Peso = max(Peso, na.rm=T))

# FUNCIÓN SUMMARIZE() + GROUP_BY()
# Permite agrupar filas con base a los niveles de alguna variable o factor.
tidy_data %>% group_by(Especie) %>% 
          summarize(n = n(), 
            Promedio_Peso = mean(Peso, na.rm=T), 
            Maximo_Peso = max(Peso, na.rm=T))

# EJERCICIO 1 - ver script_ejercicios.R - grupal

# FUNCIÓN MUTATE()
# Permite calcular nuevas variables "derivadas", ej. proporciones, tasas, log.
tidy_data <- read_excel("Peces.xlsx", sheet = 3, na="NA") 

tidy_data %>% select(Especie, Peso, Parasitos) %>%
  mutate(Densidad_parasitos = Parasitos/Peso)
tidy_data

# EJERCICIO 2 - ver script_ejercicios.R - individual

# GRÁFICA DE DISPERSIÓN CON GGPLOT2

tidy_data %>% ggplot(aes(x=Peso, y=Parasitos, color=Sexo))+
  geom_point(size=2)+
  labs(x= "Peso(g)", y= "Número de parásitos")+
  theme_bw()

# EJERCICIO 3 - ver script_ejercicios.R - individual
