# Günther, Martin---
# Matrikelnr.8119146
#******************************************************
# Aufgabe 5
#******************************************************

#a

#geg
# k = 30
# a =10+2 log n
# n [1:100]

# set seed analog Blatt 10 A2 für Reproduzierbarkeit

set.seed(72)


n_werte <- seq(1, 100, length.out = 30) #k=30 gleichmäßig verteilte Werte
#zwischen 1 und 100

#Ai berechnen
ai_werte <- 10 + 2 * log(n_werte)
# rnorm(k, Erwartungswert, varianz nicht quadriert) 
ai_values <- ai_werte + rnorm(30, mean = 0, sd = sqrt(1/2))

# Ausgabe der Ai-Werte
print(ai_values)


#b

# Wertetabelle für alle Punkte erstellen unter Nutzung von Sequenz
n_seq <- seq(1, 100, length.out = 100)
a_seq <- 10 + 2 * log(n_seq)

# Erstellen der Grafik
plot(n_seq, a_seq, type = "l", col = "blue", lwd = 3, 
     main = "n/a Kurve, überlagert mit Streudiagramm",
     xlab = "n", ylab = "a")
points(n_werte, ai_values, col = "red", pch = 15)




# Aufräumen ----
#***************
rm(list = ls())
