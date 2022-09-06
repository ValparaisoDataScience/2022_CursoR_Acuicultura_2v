# ----------------------------------------------------------
# Clase 06 - Script Pruebas no paramétricas
# Coloque su nombre
# 23 julio 2022
# Introducción al Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# Ejercicio 1
# PRUEBA DE HIPÓTESIS DE CORRELACIÓN
# datos de parásitos para diferentes pesos de peces.
Peso <- c(942,101,313,800)
Parasitos <- c(13,14,18,10)

# Elabore la hipótesis nula para la correlacion entre peso y parásitos.
# Elabore y prueba la hipótesis alternativa de correlacion positiva entre peso y parásitos.
# Elabore y pruebe la hipótesis alternativa de correlacion negativa entre peso y parásitos.

# Ejercicio 2
# COMPARACIÓN DE MÚLTIPLES MUESTRAS INDEPENDIENTES
# ESTUDIO DE CASO: CRECIMIENTO DE COPEPODOS
# PRUEBA DE KRUSKAL - WALLIS
# En el siguiente experimento se desea evaluar el efecto de 3 diferentes
# medios de cultivo (NUTRI: Nutrilake; GUILL Guillard; MONO: Monoammonuim Phosphate)
# sobre el tiempo medio generacional de la microalga *Chaetoceros muelleri*
# como alimento para la producción de copépodos.

d0 <- c(9,8,9,8) # day0
d4 <- c(7,7,6,8) # day4 
d8 <- c(6,5,5,6) # day8

# Realice una gráfica de boxplot para el set de datos propuesto.
# Elabore la hipótesis nula y una hipóteis alternativa para la prueba de kruskal wallis.
# Realice la prueba de Kruskal wallis con R para el set de datos propuesto.
