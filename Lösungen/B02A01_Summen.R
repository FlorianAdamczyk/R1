### Blatt 2, Aufgabe 1: Vektorisierte Summationen u. a.
### R 4.3.3, 9.5.2024
###****************************************************

# a) Potenzen von 1/2 ----
#*************************
# Meine Parameterwahl:
N <- 50

# Berechnung von 1/2^i für i = 0, ..., N:
potenzen.von.ein.halb <- 1/2^(0:N)

# Hinweis: Zur Operator-Präzedenz siehe ?Syntax!


# Die kumulativen Summen S_n = \sum_{i=0}^n 1/2^i
# für n = 0, ...., N:
(Sn <- cumsum(potenzen.von.ein.halb))

# Erhöhung der *dargestellten* Rechengenauigkeit in
# Form der Anzahl ausgedruckter signifikanter Ziffern:
print(Sn, digits = 17)

# Beachte: Maximum für digit: 22 (siehe ?print.default)

# Frage: An welches Paradoxon mit einem griech. Held
# und einer Schildkröte erinnert Sie das Beobachtete?
  

# b) Binomialwahrscheinlichkeiten ----
#*************************************
# Meine Parameterwahl:
n <- 12
p <- 0.1

# Offenbar sind die hier zu berechenenden
# W_i = (n \atop i) p^i (1 - p)^{n-i} für i = 0, ..., n
# die Wahrscheinlichkeiten der Bin(n, p)-Verteilung und
# der Faktor (n \atop i) ist ein Binomialkoeffizient,
# der durch choose zur Verfügung steht:
(W <- choose(n, 0:n) * p^(0:n) * (1 - p)^(n:0))

# Und hier nun die kumulativen Summen
# P_k = \sum_{i=0}^k W_i für k = 0, ..., N:
(P <- cumsum(W))


# Erhöhung der dargestellten Anzahl signifik. Ziffern:
print(P, digits = 17)

# Auweia, ... was ist hier geschehen??



# Aufräumen ----
#***************
rm(list = ls())
