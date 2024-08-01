# Günther, Martin---
# Matrikelnr.8119146
#******************************************************
# Aufgabe 4
#******************************************************

#a
# Die Formel lautet      Hi,j = 1 / (i + j - 1)

# b
i <- 4
j <- 4


Hij <- 1 / (row(matrix(1, i, j)) + col(matrix(1, i, j)) - 1)# Erstellen der Matrix

#Test der Ausgabe:
print(Hij)


#c
# nur n
# analog zu b
n <- 4
Hn <- 1 / (row(matrix(1, n, n)) + col(matrix(1, n, n)) - 1)
print(Hn)
 


# Aufräumen ----
#***************
rm(list = ls())
