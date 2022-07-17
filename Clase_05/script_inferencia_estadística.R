# ----------------------------------------------------------
# Clase 05 - Script inferencia estadística
# Dr. José Gallardo matus
# 17 julio 2022
# Introducción al Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# LIBRERÍAS
library(UsingR)
library(ggplot2)
library(dplyr)
library(knitr)

# ESTUDIO DE CASO: RELACIÓN PADRES - HIJOS

head(father.son) # Exploramos

# Configuramos tema para ajustar tamaño de los ejes
My_Theme = theme(
  axis.title.x = element_text(size = 18),
  axis.text.x = element_text(size = 18),
  axis.title.y = element_text(size = 18),
  axis.text.y = element_text(size = 18))

# Primera capa correlación
ggplot(data = father.son) +
  geom_point(aes(x = fheight, y = sheight))

# Cambia formato de símbolos
ggplot(data = father.son) +
  geom_point(aes(x = fheight, y = sheight),
             col = 'darkblue',
             size = 2,
             alpha = 1/2)

# Agrega linea de regresión
ggplot(data = father.son) +
  geom_point(aes(x = fheight, y = sheight),
             col = 'darkblue',
             size = 2,
             alpha = 1/2) + 
  geom_smooth(aes(x = fheight, y = sheight), method = 'lm')+
  labs( x="Tamaño padres", y="Tamaño hijos") + My_Theme

# Cambia etiquetas y tamaño de los ejes
ggplot(data = father.son) +
  geom_point(aes(x = fheight, y = sheight),
             col = 'darkblue',
             size = 2,
             alpha = 1/2) + 
  geom_smooth(aes(x = fheight, y = sheight), method = 'lm')+
  labs( x="Tamaño padres", y="Tamaño hijos") + My_Theme

#  **Pearson's product-moment correlation**

help("cor.test")

# Hipótesis  
# $H_0$ : rho = 0 ausencia de correlación.      
# $H_1$ : rho distinto de 0 existencia de correlación.

cor.test(father.son$fheight, father.son$sheight,
         alternative = "two.side",
         method = c("pearson"))

# ESTUDIO DE CASO: COMPARACIÓN TAMAÑO ENTRE SEXOS
# Simularemos 2 variables

Sexo <- rep(c("Male", "Female"), each=10)
Peso <- c(rnorm(10, 180, 10),rnorm(10, 140, 10))
animal <- data.frame(Sexo, Peso)

# Primera boxplot
ggplot(animal, aes(x=Sexo, y=Peso))+
  geom_boxplot()

# Colorea cada caja
ggplot(animal, aes(x=Sexo, y=Peso, fill=Sexo))+
  geom_boxplot()

# Elimina leyenda y agranda ejes
ggplot(animal, aes(x=Sexo, y=Peso, fill=Sexo))+
  geom_boxplot()+
  My_Theme+theme(legend.position='none')

# **Two Sample t-test**
help(t.test)

# Hipótesis**  
# H_0 : mu_1 = mu_2.  
# H_1 : mu_1 distinto mu_2  
  
t.test(Peso ~ Sexo, animal, alternative = c("two.sided"), var.equal=TRUE)


# ESTUDIO DE CASO: FILETE EN PORCIONES
# Se desea evaluar si las porciones de filete de salmón que produce una máquina
# son en promedio los 800 gramos que dice el empaque final.
# Producir más significaría una perdida y menos una perdida para el cliente.

# Este ejemplo corresponde a una prueba t de una muestra. 
# Se utiliza para determinar si la media de una población es diferente 
# de un valor específico.

set.seed(10)
# Creación de una muestra aleatoria de 30 porciones con media superior a la deseada 810
filete <- rnorm(30,810) 

# media deseada.
Media <- 800

# Comparación de la media muestral con la media deseada
test <- t.test(filete, mu=Media) 

print(test)
